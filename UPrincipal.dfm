object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Align = alClient
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblConsulta: TLabel
    Left = 8
    Top = 149
    Width = 361
    Height = 39
    Caption = 
      'O sistema identificou movimenta'#231#245'es prestes a vencer o prazo. '#13#10 +
      'Clique para visualizar.'#13#10'Duplo clique para fechar a consulta.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = LblConsultaClick
    OnDblClick = LblConsultaDblClick
  end
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
        Width = 87
        Height = 86
        ActionManager = actmgr1
        BiDiMode = bdLeftToRight
        Caption = 'Movimenta'#231#245'es'
        GroupAlign = gaHorizontal
        GroupIndex = 0
        ParentBiDiMode = False
      end
      object RibbonGroup1: TRibbonGroup
        Left = 93
        Top = 3
        Width = 64
        Height = 86
        ActionManager = actmgr1
        Caption = 'Consultas'
        GroupIndex = 1
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
  object cxgrd1: TcxGrid
    Left = 8
    Top = 194
    Width = 839
    Height = 265
    TabOrder = 2
    Visible = False
    object cxgrd1DBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Enabled = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Hint = 'Clique para inserir uma nova atividade'
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Hint = 'Clique para remover o registro selecionado'
      Navigator.Buttons.Delete.ImageIndex = 2
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Hint = 'Clique para confirmar o registro'
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      FilterBox.Visible = fvNever
      DataController.DataSource = DM.dsMovimentacao_Prazo
      DataController.KeyFieldNames = 'Codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.NavigatorHints = True
      OptionsBehavior.ExpandMasterRowOnDblClick = False
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsSelection.MultiSelect = True
      OptionsView.NoDataToDisplayInfoText = 'N'#227'o h'#225' dados para visualizar'
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      OptionsView.Indicator = True
      Preview.Visible = True
      object cxgrd1DBTableView3N_Expediente: TcxGridDBColumn
        Caption = 'N'#186' Expediente'
        DataBinding.FieldName = 'N_Expediente'
        Width = 96
      end
      object cxgrd1DBTableView3Descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'Descricao'
        Width = 307
      end
      object cxgrd1DBTableView3Data_Movimentacao: TcxGridDBColumn
        Caption = 'Movimenta'#231#227'o'
        DataBinding.FieldName = 'Data_Movimentacao'
      end
      object cxgrd1DBTableView3Prazo: TcxGridDBColumn
        DataBinding.FieldName = 'Prazo'
        Width = 110
      end
    end
    object cxgrd1Level1: TcxGridLevel
      GridView = cxgrd1DBTableView3
    end
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acRegistrar_Movimentacao
            Caption = '&Registrar Movimenta'#231#227'o'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rbngrp1
      end
      item
        Items = <
          item
            Action = act2
            Caption = '&Consultar '
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
      end>
    Left = 16
    Top = 216
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
    Left = 48
    Top = 216
  end
end
