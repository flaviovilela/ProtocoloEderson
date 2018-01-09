unit UMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Menus, cxButtons, Data.Win.ADODB, MetodosBasicos,
  OperacoesConexao, Mensagens, Log, ComandoSQLEntidade, GeradorDeCodigo,
  HistoricoEntidade, HistoricoDominio, UExpedienteDAO, Constantes,
  UMovimentacaoDAO, cxCalendar;

type
  TfrmMovimentacao = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnNovo: TToolButton;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DateDataLancamento: TDateTimePicker;
    LblMarca: TLabel;
    EdtN_Expediente: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    EdtCodigo: TEdit;
    TabSheet2: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    MmoMensagem: TMemo;
    DatePrazo: TDateTimePicker;
    Label2: TLabel;
    BtnInserir_Expediente: TcxButton;
    Label4: TLabel;
    MmoAssunto: TMemo;
    Label5: TLabel;
    EdtCodigo_Expediente: TEdit;
    DateDataMovimentacao: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtN_Expediente_Movimentacao: TEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Expediente: TcxGridDBColumn;
    cxGrid1DBTableView1Data: TcxGridDBColumn;
    cxGridDBTableView1Codigo: TcxGridDBColumn;
    cxGridDBTableView1Codigo_Expediente: TcxGridDBColumn;
    cxGridDBTableView1Data_Movimentacao: TcxGridDBColumn;
    cxGridDBTableView1Prazo: TcxGridDBColumn;
    cxGridDBTableView1Assunto: TcxGridDBColumn;
    cxGridDBTableView1Mensagem: TcxGridDBColumn;
    BtnInserir_Movimento: TcxButton;
    cxGridDBTableView1N_Expediente: TcxGridDBColumn;
    BtnEditar_Movimento: TcxButton;
    Label6: TLabel;
    EdtCodigo_Movimentacao: TEdit;
    procedure BBtnNovoClick(Sender: TObject);
    procedure BtnInserir_ExpedienteClick(Sender: TObject);
    procedure BtnInserir_MovimentoClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BtnEditar_MovimentoClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure cxGridDBTableView1NavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
    Conexao, Conexao2: TADOConnection;
    HistoricoEntidade: THistoricoEntidade;
    HistoricoDominio: THistoricoDominio;
    Op: TOperacoes;
    Mensagens: TMensagens;
    Log: TLog;
    GeraCodigo: TGeradorDeCodigo;
    ExpedienteDAO: TExpedienteDAO;
    MovimentacaoDAO: TMovimentacaoDAO;
    Retorno: AnsiString;

    function Valida_Campos: Boolean;
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

{$R *.dfm}

uses UDM, SysUtils, DateUtils;

procedure TfrmMovimentacao.BBtnCancelarClick(Sender: TObject);
begin
  TOperacoesConexao.CancelaConexao(Conexao);
  TOperacoesConexao.CancelaConexao(Conexao2);
  BBtnSalvar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  Op.DesabilitaCampos(frmMovimentacao);
end;

procedure TfrmMovimentacao.BBtnExcluirClick(Sender: TObject);
begin
  TOperacoesConexao.ConfirmaConexao(Conexao);
  TOperacoesConexao.ConfirmaConexao(Conexao2);
  BBtnSalvar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  Mensagens.MensagemInformacao(MensagemSalvoComSucesso);
  Op.DesabilitaCampos(frmMovimentacao);
end;

procedure TfrmMovimentacao.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimentacao.BBtnNovoClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Op.HabilitaCampos(frmMovimentacao);
  Op.LimpaCampos(frmMovimentacao);
  BBtnSalvar.Enabled:= true;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  BBtnExcluir.Enabled:= false;

  ExpedienteDAO:= TExpedienteDAO.Create;
  MovimentacaoDAO:= TMovimentacaoDAO.Create;

  Conexao:= TOperacoesConexao.NovaConexao(Conexao);
  Conexao2:= TOperacoesConexao.NovaConexao(Conexao2);
  TOperacoesConexao.IniciaQuerys([dm.qryMovimentacao, dm.qryExpediente], Conexao);

  EdtCodigo.Text:= IntToStr(GeraCodigo.GeraCodigoSequencia('Expediente', Conexao));
  DateDataLancamento.Date:= date;
  DateDataMovimentacao.DateTime:= now;
  DatePrazo.Date:= date;
  ExpedienteDAO.Buscar(Conexao, dm.qryExpediente, Retorno);
  EdtN_Expediente.SetFocus;
end;

procedure TfrmMovimentacao.BBtnSalvarClick(Sender: TObject);
begin
  TOperacoesConexao.ConfirmaConexao(Conexao);
  TOperacoesConexao.ConfirmaConexao(Conexao2);
  BBtnSalvar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  Mensagens.MensagemInformacao(MensagemSalvoComSucesso);
  Op.DesabilitaCampos(frmMovimentacao);
end;

procedure TfrmMovimentacao.BtnEditar_MovimentoClick(Sender: TObject);
begin
  if (Valida_Campos) then
  begin
    if (MovimentacaoDAO.Editar(Conexao, StrToInt(EdtCodigo_Movimentacao.Text), DateDataMovimentacao.DateTime,
      DatePrazo.Date, MmoAssunto.Text, MmoMensagem.Text, Retorno) = 0) then
    begin
      //TOperacoesConexao.CancelaConexao(Conexao);
      Mensagens.MensagemErro(MensagemErroAoGravar+' - '+Retorno);
      Exit;
    end;

    if (MovimentacaoDAO.Buscar(Conexao2, dm.qryMovimentacao, Retorno, StrToInt(EdtCodigo_Expediente.Text))=0) and (Retorno <> '') then
    begin
      Mensagens.MensagemErro(MensagemErroAoGravar + ' - '+ Retorno);
    end;

    EdtCodigo_Expediente.Clear;
    EdtCodigo_Movimentacao.Clear;
    EdtN_Expediente.Clear;
    MmoMensagem.Clear;
    MmoAssunto.Clear;

    BtnInserir_Expediente.Enabled:= true;
    BtnEditar_Movimento.Enabled:= false;
  end;

end;

procedure TfrmMovimentacao.BtnInserir_ExpedienteClick(Sender: TObject);
begin
  if (ExpedienteDAO.Salvar(Conexao, StrToInt(EdtCodigo.Text), EdtN_Expediente.Text, DateDataLancamento.DateTime,
                            Retorno) = 0) then
  begin
    //TOperacoesConexao.CancelaConexao(Conexao);
    Mensagens.MensagemErro(MensagemErroAoGravar+' - '+Retorno);
    Exit;
  end;

  ExpedienteDAO.Buscar(Conexao, dm.qryExpediente, Retorno);
  EdtN_Expediente.Clear;
  EdtCodigo.Text:= IntToStr(GeraCodigo.GeraCodigoSequencia('Expediente', Conexao));
  DateDataLancamento.Date:= date;
  DateDataMovimentacao.DateTime:= now;
  DatePrazo.Date:= date;
  EdtN_Expediente.SetFocus;

end;

procedure TfrmMovimentacao.BtnInserir_MovimentoClick(Sender: TObject);
begin
  if (Valida_Campos) then
  begin
    if (MovimentacaoDAO.Salvar(Conexao, StrToInt(EdtCodigo_Expediente.Text), DateDataMovimentacao.DateTime,
      DatePrazo.Date, MmoAssunto.Text, MmoMensagem.Text, Retorno) = 0) then
    begin
      //TOperacoesConexao.CancelaConexao(Conexao);
      Mensagens.MensagemErro(MensagemErroAoGravar+' - '+Retorno);
      Exit;
    end;

    if (MovimentacaoDAO.Buscar(Conexao2, dm.qryMovimentacao, Retorno, StrToInt(EdtCodigo_Expediente.Text))=0) and (Retorno <> '') then
    begin
      Mensagens.MensagemErro(MensagemErroAoGravar + ' - '+ Retorno);
    end;

    EdtCodigo_Movimentacao.Clear;
    MmoMensagem.Clear;
    MmoAssunto.Clear;
    DateDataMovimentacao.DateTime:= now;
    DatePrazo.Date:= date;

    BtnInserir_Expediente.Enabled:= true;
    BtnEditar_Movimento.Enabled:= false;
  end;
end;

procedure TfrmMovimentacao.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 1;
  EdtCodigo_Expediente.Text:= dm.qryExpedienteCodigo.AsString;
  EdtN_Expediente_Movimentacao.Text:= dm.qryExpedienteN_Expediente.AsString;;
  DateDataMovimentacao.SetFocus;
  MovimentacaoDAO.Buscar(Conexao, dm.qryMovimentacao, Retorno, dm.qryExpedienteCodigo.AsInteger);
end;

procedure TfrmMovimentacao.cxGrid1DBTableView1NavigatorButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  if (AButtonIndex = 8) then
  begin
    if (Mensagens.MensagemConfirmacao('Ao remover um expediente, todas as movimentações serão removidas também. Deseja continuar?')) then
    begin
      if (MovimentacaoDAO.Remover(Conexao, Retorno, dm.qryExpedienteCodigo.AsInteger) > 0) and (Retorno = '') then
      begin
        if (ExpedienteDAO.Remover(Conexao, Retorno, dm.qryExpedienteCodigo.AsInteger) > 0) and (Retorno = '') then
        begin
          Mensagens.MensagemInformacao(MensagemSalvoComSucesso);
        end
        else
        begin
          Mensagens.MensagemInformacao(MensagemErroAoGravar + ' - ' + Retorno);
        end;
      end
      else
      begin
        Mensagens.MensagemInformacao(MensagemErroAoGravar + ' - ' + Retorno);
      end;
    end;

    ADone:= true;
  end;
end;

procedure TfrmMovimentacao.cxGridDBTableView1DblClick(Sender: TObject);
var
   data: AnsiString;
   data2: TDate;
   //fs : TFormatSettings;
Begin
  //fs := TFormatSettings.Create;
  //fs.ShortDateFormat := 'dd/mm/yyyy';
  //fs.DateSeparator:= '/';
  //data:= StringReplace(dm.qryMovimentacao.FieldByName('Prazo').AsString, '-', '/', [rfReplaceAll]);

  //data:= FormatDateTime('dd/mm/yyyy', data2);
  EdtCodigo_Movimentacao.Text:= dm.qryMovimentacaoCodigo.AsString;
  EdtCodigo_Expediente.Text:= dm.qryMovimentacaoCodigo_Expediente.AsString;
  EdtN_Expediente.Text:= dm.qryMovimentacaoN_Expediente.AsString;
  DateDataMovimentacao.Date:= dm.qryMovimentacaoData_Movimentacao.AsDateTime;
  DatePrazo.Date:= dm.qryMovimentacaoPrazo.AsDateTime;
  MmoAssunto.Text:= dm.qryMovimentacaoAssunto.AsString;
  MmoMensagem.Text:= dm.qryMovimentacaoMensagem.AsString;
  BtnInserir_Movimento.Enabled:= false;
  BtnEditar_Movimento.Enabled:= true;
end;

procedure TfrmMovimentacao.cxGridDBTableView1NavigatorButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  if (AButtonIndex = 8) then
  begin
    if (Mensagens.MensagemConfirmacao('Deseja remover a movimentação selecionada?')) then
    begin
      if (MovimentacaoDAO.RemoverSelecionado(Conexao, Retorno, dm.qryMovimentacaoCodigo.AsInteger) > 0) and (Retorno = '') then
      begin
        Mensagens.MensagemInformacao(MensagemSalvoComSucesso);

      end
      else
      begin
        Mensagens.MensagemInformacao(MensagemErroAoGravar + ' - ' + Retorno);
      end;
    end;

    MovimentacaoDAO.Buscar(Conexao2, dm.qryMovimentacao, Retorno, StrToInt(EdtCodigo_Expediente.Text));

    ADone:= true;
  end;
end;

procedure TfrmMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (BBtnCancelar.Enabled = true) then
  begin
    Mensagens.MensagemErro(MensagemCanceleOuSalve);
    Abort;
  end
  else
  begin
    frmMovimentacao.Free;
    frmMovimentacao:= Nil;
  end;
end;

procedure TfrmMovimentacao.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Op.HabilitaCampos(frmMovimentacao);
  Op.LimpaCampos(frmMovimentacao);
  Op.DesabilitaCampos(frmMovimentacao);
  BBtnSalvar.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  dm.qryMovimentacao.Close;
  dm.qryExpediente.Close;
end;

procedure TfrmMovimentacao.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (PageControl1.TabIndex = 0) then
  begin
    AllowChange:= false;
    Mensagens.MensagemWarning('Esta aba só é acessada através do duplo clique em um expediente.');
  end
  else
    AllowChange:= true;
end;

function TfrmMovimentacao.Valida_Campos: Boolean;
begin
  Result:= False;

  if (EdtCodigo_Expediente.Text = '') then
  begin
    Mensagens.MensagemErro(MensagemFaltaDados);
    EdtCodigo_Expediente.SetFocus;
    Exit;
  end;

  if (MmoAssunto.Text = '') then
  begin
    Mensagens.MensagemErro(MensagemFaltaDados);
    MmoAssunto.SetFocus;
    Exit;
  end;

  if (MmoMensagem.Text = '') then
  begin
    Mensagens.MensagemErro(MensagemFaltaDados);
    MmoMensagem.SetFocus;
    Exit;
  end;

  Result:= True;
end;

end.
