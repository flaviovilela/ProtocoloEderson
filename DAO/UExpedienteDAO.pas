unit UExpedienteDAO;

interface

uses
  UExpediente, Data.Win.ADODB, ComandoSQLDominio;

type

  TExpedienteDAO = class
  private
    FDAO: TExecutaComandosSQLDominio;

  public
    function Salvar(var Conexao: TADOConnection; Codigo: integer; N_Expediente: AnsiString; Data: TDateTime; var Retorno: AnsiString): integer;
    function Editar(var Conexao: TADOConnection; Codigo: Integer; N_Expediente: AnsiString; Data: TDateTime; var Retorno: AnsiString): integer;
    function Buscar(var Conexao: TADOConnection; var Query: TADOQuery; var Retorno: AnsiString): integer;
    function Remover(var Conexao: TADOConnection; var Retorno: AnsiString): integer; overload;
    function Remover(var Conexao: TADOConnection; var Retorno: AnsiString; Codigo_Expediente: Integer): integer; overload;
end;



implementation

uses
  ComandoSQLEntidade;

{ TExpedienteDAO }

function TExpedienteDAO.Salvar(var Conexao: TADOConnection; Codigo: integer; N_Expediente: AnsiString; Data: TDateTime; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'Insert into Expediente '+
                             ' (Codigo, N_Expediente, Data_Lancamento) '+
                             ' values '+
                             ' (:Codigo, :N_Expediente, :Data_Lancamento) ';
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Parametros.Add('N_Expediente');
    FComandoSQL.Parametros.Add('Data_Lancamento');
    FComandoSQL.Valores.Add(Codigo);
    FComandoSQL.Valores.Add(N_Expediente);
    FComandoSQL.Valores.Add(Data);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TExpedienteDAO.Buscar(var Conexao: TADOConnection;
  var Query: TADOQuery; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'select * from Expediente';
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLRetornaADOQuery(Query, Retorno);
  finally

  end;

end;

function TExpedienteDAO.Editar(var Conexao: TADOConnection; Codigo: Integer; N_Expediente: AnsiString; Data: TDateTime; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'Update Expediente set '+
                             ' N_Expediente = :N_Expediente, Data_Lancamento = :Data_Lancamento ' +
                             ' where Codigo = :Codigo ';
    FComandoSQL.Parametros.Add('N_Expediente');
    FComandoSQL.Parametros.Add('Data_Lancamento');
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(N_Expediente);
    FComandoSQL.Valores.Add(Data);
    FComandoSQL.Valores.Add(Codigo);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TExpedienteDAO.Remover(var Conexao: TADOConnection;
  var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'delete from Expediente';
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TExpedienteDAO.Remover(var Conexao: TADOConnection;
  var Retorno: AnsiString; Codigo_Expediente: Integer): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'delete from Expediente where Codigo = :Codigo';
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(Codigo_Expediente);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

end.
