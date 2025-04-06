unit UfApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.Win.ADODB, Vcl.StdCtrls, System.JSON, System.Net.HttpClient, System.Net.URLClient, System.Net.HttpClientComponent,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  pregunta: string;
  respuesta: string;
  JSONValue: TJSONValue;
  HttpClient: TNetHTTPClient;
  Response: IHTTPResponse;
  URL, PostData, MessageText, Resultado: string;
  StringContent: TStringStream;
  Query: TFDQuery;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin
  //Capturamos pregunta
  pregunta := LowerCase(Edit1.Text);
  //httpcliente
   HttpClient := TNetHTTPClient.Create(nil);
  //Integracion de gemini
  if pregunta.Contains('db') then
  begin
  // Configurar y abrir la consulta
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'SELECT * from Productos';
    ADOQuery1.Open;

    // Convertir los datos a JSON
    JSONArray := TJSONArray.Create;
     while not ADOQuery1.Eof do
      begin
        JSONObject := TJSONObject.Create;
        for I := 0 to ADOQuery1.FieldCount - 1 do
        begin
          JSONObject.AddPair(ADOQuery1.Fields[I].FieldName, ADOQuery1.Fields[I].AsString);
        end;
        JSONArray.AddElement(JSONObject);
        ADOQuery1.Next;
      end;
    //enviar json al backend
    URL := 'http://localhost:4444/gemini';
    PostData :=  Format('{"prompt":"%s","data": %s}', [pregunta,JSONArray.ToJSON]);
    StringContent := TStringStream.Create(PostData, TEncoding.UTF8);
    try
    HttpClient.ContentType := 'application/json';
       Response := HttpClient.Post(URL, StringContent);
       if Response.StatusCode=200 then
       begin
        Resultado := Response.ContentAsString();
        JSONValue := TJSONObject.ParseJSONValue(Resultado);
        if (JSONValue <> nil) and (JSONValue is TJSONObject) then
        begin
        MessageText := TJSONObject(JSONValue).GetValue<string>('message');
        Memo1.Lines.Add('ChatBot: ' + MessageText);
        end
        else
        Memo1.Lines.Add('Error al parsear JSON');
       end
       else
       begin
           ShowMessage('Error en la petición. Código: ' + Response.StatusCode.ToString);
       end;

    finally
      //añadir al memo pregunta del usuario
      Memo1.Lines.Add('Usuario: ' + pregunta);
      Edit1.Clear;

    end;
  end
  else
  begin
    ShowMessage('El prompt debe tener la palabra db')
  end;
end;

end.
