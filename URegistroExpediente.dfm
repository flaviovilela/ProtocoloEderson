object frmRegistro: TfrmRegistro
  Left = 0
  Top = 0
  Caption = 'Registro de expediente'
  ClientHeight = 477
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblExpediente: TLabel
    Left = 24
    Top = 24
    Width = 124
    Height = 25
    Caption = 'Expediente : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Natureza :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblData: TLabel
    Left = 466
    Top = 24
    Width = 127
    Height = 25
    Caption = 'Lan'#231'amento :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmoNatureza: TMemo
    Left = 24
    Top = 119
    Width = 761
    Height = 306
    TabOrder = 0
  end
  object btnSalvarExpediente: TButton
    Left = 656
    Top = 431
    Width = 129
    Height = 25
    Align = alCustom
    Caption = 'SALVAR'
    TabOrder = 1
    OnClick = btnSalvarExpedienteClick
  end
  object dtLancamento: TDateTimePicker
    Left = 599
    Top = 28
    Width = 186
    Height = 21
    Date = 43096.041129548610000000
    Time = 43096.041129548610000000
    TabOrder = 2
  end
end
