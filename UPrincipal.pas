unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnList,
  Vcl.RibbonSilverStyleActnCtrls, Vcl.ImgList, UInicializacao, UConfiguracao,
  Data.Win.ADODB, Vcl.ComCtrls, MetodosBasicos, cxClasses, cxLocalization,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  UMovimentacaoDAO;

type
  TFrmPrincipal = class(TForm)
    rbn1: TRibbon;
    actmgr1: TActionManager;
    rbnpg1: TRibbonPage;
    rbngrp1: TRibbonGroup;
    RibbonGroup1: TRibbonGroup;
    act2: TAction;
    acRegistrar_Movimentacao: TAction;
    act4: TAction;
    Action1: TAction;
    StatusBar: TStatusBar;
    cxLocalizer1: TcxLocalizer;
    LblConsulta: TLabel;
    cxgrd1: TcxGrid;
    cxgrd1DBTableView3: TcxGridDBTableView;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView3N_Expediente: TcxGridDBColumn;
    cxgrd1DBTableView3Descricao: TcxGridDBColumn;
    cxgrd1DBTableView3Data_Movimentacao: TcxGridDBColumn;
    cxgrd1DBTableView3Prazo: TcxGridDBColumn;
    procedure acRegistrar_MovimentacaoExecute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LblConsultaClick(Sender: TObject);
    procedure LblConsultaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Inicializacao: TInicializacao;
    Op: TOperacoes;
    Retorno: AnsiString;
  public
    { Public declarations }
    Configuracao: TConfiguracao;
    Conexao: TADOConnection;
    MovimentacaoDAO: TMovimentacaoDAO;
  end;

var
  FrmPrincipal: TFrmPrincipal;


implementation

uses
  UMovimentacao, UconsultaExpediente, OperacoesConexao,
  UDM;

{$R *.dfm}



procedure TFrmPrincipal.act2Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaExpediente, frmConsultaExpediente);
  frmConsultaExpediente.Show;
  Op.CentralizaForm(frmConsultaExpediente, FrmPrincipal, rbn1.Height, StatusBar.Height);
end;

procedure TFrmPrincipal.acRegistrar_MovimentacaoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmMovimentacao, frmMovimentacao);
  frmMovimentacao.Show;
  Op.CentralizaForm(frmMovimentacao, FrmPrincipal, rbn1.Height, StatusBar.Height);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {if Application.MessageBox('Deseja sair do sistema?', 'Saindo...', Mb_YesNo + MB_ICONHAND) = idyes then
  begin
  end;}
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\TraducaoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraducaoDev.ini');
    cxLocalizer1.LanguageIndex := 1; //Muda o idioma / linguagem
    cxLocalizer1.Active := TRUE;     //Ativa o componente / a tradução
  end;

  Application.HintHidePause:= 10000;
  Conexao:= TOperacoesConexao.NovaConexao(Conexao);
  TOperacoesConexao.IniciaQuerys([dm.qryMovimentacao, dm.qryExpediente], Conexao);
  Configuracao:= TConfiguracao.Create;
  Inicializacao:= TInicializacao.Create;
  MovimentacaoDAO:= TMovimentacaoDAO.Create;
  Inicializacao.AtualizaBD(Conexao);

  if (MovimentacaoDAO.BuscarMovimentacaoPrazoVencido(Conexao, dm.qryMovimentacao_Prazo, Retorno)>0) then
  begin
    LblConsulta.Visible:= true;
  end
  else
  begin
    LblConsulta.Visible:= false;
  end;

  TOperacoesConexao.ConfirmaConexao(Conexao);
end;

procedure TFrmPrincipal.LblConsultaClick(Sender: TObject);
begin
  cxgrd1.Visible:= true;
end;

procedure TFrmPrincipal.LblConsultaDblClick(Sender: TObject);
begin
  cxgrd1.Visible:= false;
end;

end.
