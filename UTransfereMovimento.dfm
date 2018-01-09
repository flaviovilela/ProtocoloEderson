object FrmTransfere_Movimento: TFrmTransfere_Movimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transfere Movimento'
  ClientHeight = 119
  ClientWidth = 439
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Expediente Destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 235
    Top = 8
    Width = 87
    Height = 13
    Caption = 'C'#243'digo Destino:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 210
    Top = 27
    Width = 112
    Height = 13
    Caption = 'Expediente Destino:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCodigo_Destino: TLabel
    Left = 328
    Top = 8
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblExpediente_Destino: TLabel
    Left = 328
    Top = 27
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnInserir_Movimento: TcxButton
    Left = 316
    Top = 83
    Width = 115
    Height = 28
    Hint = 
      'Clique para transferir os movimentos selecionados na tela ao fun' +
      'do para o expediente de destino.'
    Caption = 'Transferir Movimento'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = BtnInserir_MovimentoClick
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 8
    Top = 27
    Properties.KeyFieldNames = 'Codigo'
    Properties.ListColumns = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'Codigo'
      end
      item
        Caption = 'N'#186' Expediente'
        FieldName = 'N_Expediente'
      end>
    Properties.ListOptions.SyncMode = True
    Properties.ListSource = DM.dsExpediente
    Properties.OnChange = cxLookupComboBox1PropertiesChange
    TabOrder = 1
    Width = 201
  end
end
