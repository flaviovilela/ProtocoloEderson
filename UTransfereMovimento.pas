unit UTransfereMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, UExpedienteDAO, Data.Win.ADODB, Vcl.Menus,
  cxButtons, UMovimentacaoDAO, Mensagens, Constantes;

type
  TFrmTransfere_Movimento = class(TForm)
    Label9: TLabel;
    BtnInserir_Movimento: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    LblCodigo_Destino: TLabel;
    LblExpediente_Destino: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnInserir_MovimentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    ExpedienteDAO: TExpedienteDAO;
    MovimentacaoDAO: TMovimentacaoDAO;
    Conexao: TADOConnection;
    Retorno: AnsiString;
    Mensagens: TMensagens;
  public
    { Public declarations }
  end;

var
  FrmTransfere_Movimento: TFrmTransfere_Movimento;

implementation

{$R *.dfm}

uses UDM, OperacoesConexao, UConfiguracao, UconsultaExpediente;

procedure TFrmTransfere_Movimento.BtnInserir_MovimentoClick(Sender: TObject);
var
  i, CodigoMovimento: integer;
  C: AnsiString;
begin
  if (Mensagens.MensagemConfirmacao('Confirma a transferencia dos movimentos selecionados?')) then
  begin
    with frmConsultaExpediente.cxgrd1DBTableView3.DataController do
    begin
      for i := 0 to RecordCount - 1 do
      begin
        C:= VarToStr(frmConsultaExpediente.cxgrd1DBTableView3.DataController.
                                            Values[i,frmConsultaExpediente.cxgrd1DBTableView3Codigo.Index]);
        C:= VarToStr(C);

        CodigoMovimento:= StrToInt(C);
        MovimentacaoDAO.Transfere_Movimento(Conexao, CodigoMovimento, StrToInt(LblCodigo_Destino.Caption), Retorno);
      end;
    end;
    MovimentacaoDAO.Buscar(Conexao, dm.qryMovimentacao, Retorno);
    Mensagens.MensagemInformacao(MensagemSalvoComSucesso);
    Close;
  end;
end;

procedure TFrmTransfere_Movimento.cxLookupComboBox1PropertiesChange(
  Sender: TObject);
begin
  LblCodigo_Destino.Caption:= dm.qryExpedienteCodigo.AsString;
  LblExpediente_Destino.Caption:= dm.qryExpedienteN_Expediente.AsString;
end;

procedure TFrmTransfere_Movimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmTransfere_Movimento.Release;
end;

procedure TFrmTransfere_Movimento.FormCreate(Sender: TObject);
begin
  ExpedienteDAO:= TExpedienteDAO.Create;
  MovimentacaoDAO:= TMovimentacaoDAO.Create;
  Conexao:= TOperacoesConexao.NovaConexao(Conexao);
  TOperacoesConexao.IniciaQuerys([dm.qryExpediente, dm.qryMovimentacao], Conexao);
  ExpedienteDAO.Buscar(Conexao, dm.qryExpediente, Retorno);

end;

end.
