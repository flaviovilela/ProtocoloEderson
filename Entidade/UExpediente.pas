unit UExpediente;

interface

type

  TExpediente = class

  private
    FDtLancamento: TDateTime;
    FDescricao: String;
    FCodigo: Integer;
    FArquivado: Boolean;
    FNexpediente: String;
    procedure SetArquivado(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetDtLancameno(const Value: TDateTime);
    procedure SetNexpediente(const Value: String);



  protected

  public
    property Codigo : Integer read FCodigo write SetCodigo;
    property Nexpediente : String read FNexpediente write SetNexpediente;
    property Descricao : String read FDescricao write SetDescricao;
    property Arquivado : Boolean read FArquivado write SetArquivado;
    property DtLancamento : TDateTime read FDtLancamento write SetDtLancameno;


  published

  end;



implementation


{ TExpediente }

procedure TExpediente.SetArquivado(const Value: Boolean);
begin
  FArquivado := Value;
end;

procedure TExpediente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TExpediente.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TExpediente.SetDtLancameno(const Value: TDateTime);
begin
  FDtLancamento := Value;
end;

procedure TExpediente.SetNexpediente(const Value: String);
begin
  FNexpediente := Value;
end;

end.
