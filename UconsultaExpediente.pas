unit UconsultaExpediente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Data.Win.ADODB, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  cxNavigator, cxContainer, dxGDIPlusClasses, cxImage, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.ExtCtrls,
  cxCalendar, UExpedienteDAO, UMovimentacaoDAO, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, cxPropertiesStore, dxLayoutContainer,
  cxGridInplaceEditForm, dxBarBuiltInMenu, cxPC;

type
  TfrmConsultaExpediente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxImage2: TcxImage;
    cxImage1: TcxImage;
    cxImage3: TcxImage;
    cxImage4: TcxImage;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxgrd1DBTableView3: TcxGridDBTableView;
    cxgrd1Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxgrd1DBTableView3Codigo: TcxGridDBColumn;
    cxgrd1DBTableView3N_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView3Data_Lancamento: TcxGridDBColumn;
    cxgrd1DBTableView3Descricao: TcxGridDBColumn;
    cxgrd1DBTableView3Status: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView4Codigo: TcxGridDBColumn;
    cxGridDBTableView4Codigo_Expediente: TcxGridDBColumn;
    cxGridDBTableView4Data_Movimentacao: TcxGridDBColumn;
    cxGridDBTableView4Mensagem: TcxGridDBColumn;
    cxGridDBTableView4N_Expediente: TcxGridDBColumn;
    cxGridDBTableView4Prazo: TcxGridDBColumn;
    cxGridDBTableView4Descricao: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore1: TcxPropertiesStore;
    procedure cxImage3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxImage4Click(Sender: TObject);
    procedure cxgrd1DBTableView3StatusGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    { Private declarations }
    Conexao: TADOConnection;
    ExpedienteDAO: TExpedienteDAO;
    MovimentacaoDAO: TMovimentacaoDAO;
    Retorno: AnsiString;
  public
    { Public declarations }
  end;

var
  frmConsultaExpediente: TfrmConsultaExpediente;

implementation

{$R *.dfm}

uses UDM, OperacoesConexao, UTransfereMovimento;

procedure TfrmConsultaExpediente.cxgrd1DBTableView3StatusGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (ARecord.Values[Sender.Index] = '0') then
    AText:= 'Lançado'
  else
    AText:= 'Arquivado';
end;

procedure TfrmConsultaExpediente.cxImage3Click(Sender: TObject);
begin
  ExpedienteDAO:= TExpedienteDAO.Create;
  MovimentacaoDAO:= TMovimentacaoDAO.Create;

  Conexao:= TOperacoesConexao.NovaConexao(Conexao);
  TOperacoesConexao.IniciaQuerys([dm.qryMovimentacao, dm.qryExpediente], Conexao);

  dm.qryMovimentacao.Close;
  dm.qryExpediente.Close;

  ExpedienteDAO.Buscar(Conexao, dm.qryExpediente, Retorno);
  MovimentacaoDAO.Buscar(Conexao, dm.qryMovimentacao, Retorno);

end;

procedure TfrmConsultaExpediente.cxImage4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmTransfere_Movimento, FrmTransfere_Movimento);
  FrmTransfere_Movimento.Show;
end;

procedure TfrmConsultaExpediente.FormCreate(Sender: TObject);
begin
  dm.qryMovimentacao.Close;
  dm.qryExpediente.Close;
  cxPageControl1.Properties.TabIndex:= 0;
end;

end.
