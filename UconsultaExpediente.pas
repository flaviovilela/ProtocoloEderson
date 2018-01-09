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
  dxPSCore, dxPScxCommon, cxPropertiesStore;

type
  TfrmConsultaExpediente = class(TForm)
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1: TcxGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    cxImage2: TcxImage;
    cxImage1: TcxImage;
    cxImage3: TcxImage;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView2: TcxGridDBTableView;
    cxgrd1DBTableView1Codigo: TcxGridDBColumn;
    cxgrd1DBTableView1N_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView1Data_Lancamento: TcxGridDBColumn;
    cxgrd1DBTableView2Codigo: TcxGridDBColumn;
    cxgrd1DBTableView2Codigo_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView2Data_Movimentacao: TcxGridDBColumn;
    cxgrd1DBTableView2Assunto: TcxGridDBColumn;
    cxgrd1DBTableView2Mensagem: TcxGridDBColumn;
    cxgrd1DBTableView2N_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView2Prazo: TcxGridDBColumn;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView3: TcxGridDBTableView;
    cxgrd1DBTableView3Codigo: TcxGridDBColumn;
    cxgrd1DBTableView3Codigo_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView3Data_Movimentacao: TcxGridDBColumn;
    cxgrd1DBTableView3Assunto: TcxGridDBColumn;
    cxgrd1DBTableView3Mensagem: TcxGridDBColumn;
    cxgrd1DBTableView3N_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView3Prazo: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore1: TcxPropertiesStore;
    cxImage4: TcxImage;
    procedure cxImage3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxImage4Click(Sender: TObject);
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
end;

end.
