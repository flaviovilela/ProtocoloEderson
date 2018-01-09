object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Menu Geral'
  ClientHeight = 554
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rbn1: TRibbon
    Left = 0
    Top = 0
    Width = 855
    Height = 143
    ActionManager = actmgr1
    Caption = 'Menu Geral'
    ShowHelpButton = False
    Tabs = <
      item
        Caption = 'Principal'
        Page = rbnpg1
      end>
    DesignSize = (
      855
      143)
    StyleName = 'Ribbon - Silver'
    object rbnpg1: TRibbonPage
      Left = 0
      Top = 50
      Width = 854
      Height = 93
      Caption = 'Principal'
      Index = 0
      object rbngrp1: TRibbonGroup
        Left = 4
        Top = 3
        Width = 166
        Height = 86
        ActionManager = actmgr1
        BiDiMode = bdLeftToRight
        Caption = 'Movimenta'#231#245'es'
        GroupAlign = gaHorizontal
        GroupIndex = 0
        ParentBiDiMode = False
      end
      object RibbonGroup1: TRibbonGroup
        Left = 172
        Top = 3
        Width = 64
        Height = 86
        ActionManager = actmgr1
        Caption = 'Consultas'
        GroupIndex = 1
      end
      object rbngrp3: TRibbonGroup
        Left = 238
        Top = 3
        Width = 87
        Height = 86
        ActionManager = actmgr1
        Caption = 'Configura'#231#245'es'
        GroupIndex = 3
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 535
    Width = 855
    Height = 19
    Panels = <>
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acRegistrar_Movimentacao
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = Action1
            Caption = '&Anexar Movimenta'#231#227'o'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rbngrp1
      end
      item
        Items = <
          item
            Action = act2
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup1
      end
      item
        Items = <
          item
            Action = acRegistrar_Movimentacao
            Caption = '&Registrar Movimenta'#231#227'o'
          end>
      end
      item
        Items = <
          item
            Action = act4
            Caption = '&Configura'#231#245'es'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rbngrp3
      end>
    Left = 16
    Top = 160
    StyleName = 'Ribbon - Silver'
    object act2: TAction
      Category = 'Consulta'
      Caption = 'Consultar '
      OnExecute = act2Execute
    end
    object acRegistrar_Movimentacao: TAction
      Category = 'Registros'
      Caption = 'Registrar Movimenta'#231#227'o'
      OnExecute = acRegistrar_MovimentacaoExecute
    end
    object act4: TAction
      Caption = 'Configura'#231#245'es'
    end
    object Action1: TAction
      Caption = 'Anexar Movimenta'#231#227'o'
    end
  end
  object cxLocalizer1: TcxLocalizer
    Left = 72
    Top = 192
  end
end
