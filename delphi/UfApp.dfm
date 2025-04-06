object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'App'
  ClientHeight = 657
  ClientWidth = 945
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 400
    Top = 0
    Width = 116
    Height = 30
    Cursor = crHandPoint
    Caption = 'Buy n Large'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 352
    Top = 179
    Width = 201
    Height = 30
    Cursor = crHandPoint
    Caption = 'Instruccionse de uso'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 160
    Top = 231
    Width = 593
    Height = 90
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Este chatbot est'#225' dise'#241'ado para responder preguntas generales y ' +
      'brindar asistencia conversacional. Para realizar consultas a la ' +
      'base de datos, es necesario que incluyas la palabra clave "db" e' +
      'n tu mensaje. Por ejemplo: '#191'Cu'#225'ntos productos se encuentran hoy ' +
      'en la db? '#191'Cu'#225'l es el producto con el precio mas alto de la db? ' +
      'Cuando detecta la palabra "db", el chatbot interpreta tu mensaje' +
      ' como una solicitud de datos y procesa una consulta a la base de' +
      ' datos correspondiente.'
    WordWrap = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 53
    Width = 945
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 208
    Top = 348
    Width = 489
    Height = 241
    Enabled = False
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 256
    Top = 595
    Width = 393
    Height = 23
    TabOrder = 2
  end
  object Button1: TButton
    Left = 416
    Top = 632
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=DBinventarioTienda;Data Source=(local)'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 520
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Productos')
    Left = 72
    Top = 464
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 80
    Top = 600
  end
end
