unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ImgList,
  Vcl.Controls, cxClasses, cxPropertiesStore;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ImgImagens_Consulta: TImageList;
    ImgChama: TImageList;
    ImgComandos: TImageList;
    qryMovimentacao: TADOQuery;
    qryExpediente: TADOQuery;
    dsExpediente: TDataSource;
    dsMovimentacao: TDataSource;
    qryExpedienteCodigo: TIntegerField;
    qryExpedienteN_Expediente: TStringField;
    qryExpedienteData_Lancamento: TDateTimeField;
    qryMovimentacaoCodigo: TAutoIncField;
    qryMovimentacaoCodigo_Expediente: TIntegerField;
    qryMovimentacaoData_Movimentacao: TDateTimeField;
    qryMovimentacaoMensagem: TStringField;
    qryMovimentacaoN_Expediente: TStringField;
    qryMovimentacaoPrazo: TDateTimeField;
    qryExpedienteDescricao: TStringField;
    qryMovimentacaoDescricao: TStringField;
    qryExpedienteStatus: TIntegerField;
    dsMovimentacao_Prazo: TDataSource;
    qryMovimentacao_Prazo: TADOQuery;
    qryMovimentacao_PrazoN_Expediente: TStringField;
    qryMovimentacao_PrazoDescricao: TStringField;
    qryMovimentacao_PrazoData_Movimentacao: TDateTimeField;
    qryMovimentacao_PrazoPrazo: TDateTimeField;
    qryMovimentacao_PrazoCodigo: TIntegerField;
    qryMovimentacao_PrazoStatus: TIntegerField;
    qryMovimentacao_PrazoCodigo_Movimentacao: TAutoIncField;
    qryMovimentacao_PrazoMensagem: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
