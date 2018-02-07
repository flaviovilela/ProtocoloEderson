object frmMovimentacao: TfrmMovimentacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 416
  ClientWidth = 805
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
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 416
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientEndColor = clWindow
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    object BBtnNovo: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Iniciar um novo registro'
      Caption = '&Novo'
      ImageIndex = 10
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnNovoClick
    end
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 680
    Height = 416
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Expediente'
      object LblMarca: TLabel
        Left = 63
        Top = 0
        Width = 79
        Height = 13
        Caption = 'N'#186' Expediente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 158
        Top = 0
        Width = 27
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 0
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 3
        Top = 38
        Width = 55
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateDataLancamento: TDateTimePicker
        Left = 158
        Top = 16
        Width = 98
        Height = 17
        Date = 43095.364617187500000000
        Time = 43095.364617187500000000
        TabOrder = 2
      end
      object EdtN_Expediente: TEdit
        Left = 63
        Top = 16
        Width = 89
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object EdtCodigo: TEdit
        Left = 3
        Top = 16
        Width = 54
        Height = 17
        Hint = 
          'Se este campo n'#227'o for preenchido, ser'#225' preenchido automaticament' +
          'e com o valor do campo C'#243'digo.'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object cxGrid1: TcxGrid
        Left = 3
        Top = 112
        Width = 666
        Height = 273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        LookAndFeel.NativeStyle = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = cxGrid1DBTableView1DblClick
          Navigator.Buttons.OnButtonClick = cxGrid1DBTableView1NavigatorButtonsButtonClick
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Enabled = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Hint = 'Clique para remover o registro selecionado'
          Navigator.Buttons.Delete.ImageIndex = 2
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          FilterBox.CustomizeButtonAlignment = fbaLeft
          FilterBox.Position = fpTop
          FilterBox.Visible = fvNever
          DataController.DataSource = DM.dsExpediente
          DataController.Filter.Active = True
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'Codigo'
            end>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.DateFormat = 'DD/MM/YYYY'
          FilterRow.InfoText = 'Clique para definir um filtro'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Clique para adicionar uma nova linha'
          NewItemRow.SeparatorColor = clMenu
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'N'#227'o h'#225' dados para visualizar'
          OptionsView.Footer = True
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          Preview.Visible = True
          object cxGrid1DBTableView1Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
          end
          object cxGrid1DBTableView1N_Expediente: TcxGridDBColumn
            Caption = 'N'#186' Expediente'
            DataBinding.FieldName = 'N_Expediente'
            Width = 117
          end
          object cxGrid1DBTableView1Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Width = 274
          end
          object cxGrid1DBTableView1Data: TcxGridDBColumn
            Caption = 'Lan'#231'amento'
            DataBinding.FieldName = 'Data_Lancamento'
          end
          object cxGrid1DBTableView1Status: TcxGridDBColumn
            DataBinding.FieldName = 'Status'
            OnGetDisplayText = cxGrid1DBTableView1StatusGetDisplayText
            Width = 75
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object BtnInserir_Expediente: TcxButton
        Left = 270
        Top = 0
        Width = 107
        Height = 19
        Caption = 'Inserir Expediente'
        TabOrder = 3
        OnClick = BtnInserir_ExpedienteClick
      end
      object MmoDescricao: TMemo
        Left = 3
        Top = 53
        Width = 666
        Height = 55
        MaxLength = 1000
        TabOrder = 5
      end
      object RGStatus: TcxRadioGroup
        Left = 403
        Top = 3
        Caption = 'Status'
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'Lan'#231'ado'
          end
          item
            Caption = 'Arquivado'
          end>
        ItemIndex = 0
        TabOrder = 6
        Height = 37
        Width = 162
      end
      object BtnEditar_Expediente: TcxButton
        Left = 270
        Top = 23
        Width = 107
        Height = 19
        Caption = 'Editar Expediente'
        TabOrder = 7
        OnClick = BtnEditar_ExpedienteClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Movimenta'#231#227'o'
      ImageIndex = 1
      object Label2: TLabel
        Left = 343
        Top = 0
        Width = 32
        Height = 13
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 41
        Width = 84
        Height = 13
        Caption = 'Movimenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 207
        Top = 1
        Width = 94
        Height = 13
        Caption = 'Data Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 63
        Top = 2
        Width = 57
        Height = 13
        Caption = 'C'#243'digo Ex.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 126
        Top = 2
        Width = 39
        Height = 13
        Caption = 'N'#186' Exp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 3
        Top = 2
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MmoMensagem: TMemo
        Left = 3
        Top = 60
        Width = 666
        Height = 133
        MaxLength = 1000
        TabOrder = 3
      end
      object DatePrazo: TDateTimePicker
        Left = 343
        Top = 17
        Width = 96
        Height = 17
        Date = 43095.364617187500000000
        Time = 43095.364617187500000000
        TabOrder = 2
      end
      object EdtCodigo_Expediente: TEdit
        Left = 63
        Top = 18
        Width = 54
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
      end
      object DateDataMovimentacao: TDateTimePicker
        Left = 207
        Top = 17
        Width = 130
        Height = 17
        Date = 43107.364617187500000000
        Format = 'dd/MM/yyyy hh:mm'
        Time = 43107.364617187500000000
        TabOrder = 1
      end
      object EdtN_Expediente_Movimentacao: TEdit
        Left = 124
        Top = 18
        Width = 77
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
      object cxGrid2: TcxGrid
        Left = 3
        Top = 199
        Width = 666
        Height = 186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView1: TcxGridDBTableView
          OnDblClick = cxGridDBTableView1DblClick
          Navigator.Buttons.OnButtonClick = cxGridDBTableView1NavigatorButtonsButtonClick
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Enabled = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Enabled = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Hint = 'Clique para remover o registro selecionado'
          Navigator.Buttons.Delete.ImageIndex = 2
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          FilterBox.CustomizeButtonAlignment = fbaLeft
          FilterBox.Position = fpTop
          FilterBox.Visible = fvNever
          DataController.DataSource = DM.dsMovimentacao
          DataController.Filter.Active = True
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'Codigo'
            end>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.DateFormat = 'DD/MM/YYYY'
          FilterRow.InfoText = 'Clique para definir um filtro'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Clique para adicionar uma nova linha'
          NewItemRow.SeparatorColor = clMenu
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'N'#227'o h'#225' dados para visualizar'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          Preview.Visible = True
          object cxGridDBTableView1Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Visible = False
            Options.Editing = False
            Width = 45
          end
          object cxGridDBTableView1N_Expediente: TcxGridDBColumn
            Caption = 'N'#186' Expediente'
            DataBinding.FieldName = 'N_Expediente'
            Options.Editing = False
            Width = 86
          end
          object cxGridDBTableView1Codigo_Expediente: TcxGridDBColumn
            DataBinding.FieldName = 'Codigo_Expediente'
            Visible = False
            Options.Editing = False
          end
          object cxGridDBTableView1Data_Movimentacao: TcxGridDBColumn
            Caption = 'Movimenta'#231#227'o'
            DataBinding.FieldName = 'Data_Movimentacao'
            Options.Editing = False
            Width = 118
          end
          object cxGridDBTableView1Prazo: TcxGridDBColumn
            DataBinding.FieldName = 'Prazo'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.AssignedValues.EditFormat = True
            Properties.DisplayFormat = 'DD/MM/YYYY'
            Options.Editing = False
            Width = 70
          end
          object cxGridDBTableView1Mensagem: TcxGridDBColumn
            DataBinding.FieldName = 'Mensagem'
            Options.Editing = False
            Width = 3000
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object BtnInserir_Movimento: TcxButton
        Left = 462
        Top = 1
        Width = 115
        Height = 19
        Caption = 'Inserir Movimenta'#231#227'o'
        TabOrder = 4
        OnClick = BtnInserir_MovimentoClick
      end
      object BtnEditar_Movimento: TcxButton
        Left = 462
        Top = 24
        Width = 115
        Height = 19
        Caption = 'Editar Movimenta'#231#227'o'
        TabOrder = 7
        OnClick = BtnEditar_MovimentoClick
      end
      object EdtCodigo_Movimentacao: TEdit
        Left = 3
        Top = 18
        Width = 54
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 8
      end
    end
  end
end
