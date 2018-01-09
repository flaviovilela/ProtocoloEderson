unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnList,
  Vcl.RibbonSilverStyleActnCtrls, Vcl.ImgList, UInicializacao, UConfiguracao,
  Data.Win.ADODB, Vcl.ComCtrls, MetodosBasicos, cxClasses, cxLocalization;

type
  TFrmPrincipal = class(TForm)
    rbn1: TRibbon;
    actmgr1: TActionManager;
    rbnpg1: TRibbonPage;
    rbngrp1: TRibbonGroup;
    RibbonGroup1: TRibbonGroup;
    act2: TAction;
    acRegistrar_Movimentacao: TAction;
    rbngrp3: TRibbonGroup;
    act4: TAction;
    Action1: TAction;
    StatusBar: TStatusBar;
    cxLocalizer1: TcxLocalizer;
    procedure act1Execute(Sender: TObject);
    procedure acRegistrar_MovimentacaoExecute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Inicializacao: TInicializacao;
    Op: TOperacoes;
  public
    { Public declarations }
    Configuracao: TConfiguracao;
    Conexao: TADOConnection;
  end;

var
  FrmPrincipal: TFrmPrincipal;


implementation

uses
  URegistroExpediente, UMovimentacao, UconsultaExpediente, OperacoesConexao;

{$R *.dfm}



procedure TFrmPrincipal.act1Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmRegistro, frmRegistro);
  frmRegistro.ShowModal;
  frmRegistro.Free;

end;

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
  TOperacoesConexao.IniciaQuerys([], Conexao);
  Configuracao:= TConfiguracao.Create;
  Inicializacao:= TInicializacao.Create;
  Inicializacao.AtualizaBD(Conexao);
  TOperacoesConexao.ConfirmaConexao(Conexao);
end;

end.
