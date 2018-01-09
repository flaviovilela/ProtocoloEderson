unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ImgList,
  Vcl.Controls;

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
    qryMovimentacaoAssunto: TStringField;
    qryMovimentacaoMensagem: TStringField;
    qryMovimentacaoN_Expediente: TStringField;
    qryMovimentacaoPrazo: TDateTimeField;
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
