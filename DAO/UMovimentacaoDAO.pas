unit UMovimentacaoDAO;

interface

uses
  ComandoSQLDominio, Data.Win.ADODB;
type
  TMovimentacaoDAO = class
    private
    FDAO: TExecutaComandosSQLDominio;

    public
    function Salvar(var Conexao: TADOConnection; Codigo_Expediente: integer; Data_Movimentacao: TDateTime; Prazo: TDateTime;
      Mensagem: AnsiString; var Retorno: AnsiString): integer;
    function Editar(var Conexao: TADOConnection; Codigo: integer; Data_Movimentacao: TDateTime; Prazo: TDateTime;
      Mensagem: AnsiString; var Retorno: AnsiString): integer;
    function Buscar(var Conexao: TADOConnection; var Query: TADOQuery; var Retorno: AnsiString): integer; overload;
    function Buscar(var Conexao: TADOConnection; var Query: TADOQuery; var Retorno: AnsiString; Codigo_Expediente: Integer): integer; overload;
    function BuscarMovimentacaoPrazoVencido(var Conexao: TADOConnection; var Query: TADOQuery; var Retorno: AnsiString): integer;
    function Remover(var Conexao: TADOConnection; var Retorno: AnsiString): integer; overload;
    function Remover(var Conexao: TADOConnection; var Retorno: AnsiString; Codigo_Expediente: Integer): integer; overload;
    function RemoverSelecionado(var Conexao: TADOConnection; var Retorno: AnsiString; Codigo: Integer): integer; overload;
    function Transfere_Movimento(var Conexao: TADOConnection; Codigo_Movimento, Novo_Codigo_Expediente: integer; var Retorno: AnsiString): integer;
  end;
implementation

uses
  ComandoSQLEntidade, System.SysUtils;

{ TMovimentacaoDAO }

function TMovimentacaoDAO.Salvar(var Conexao: TADOConnection;
  Codigo_Expediente: integer; Data_Movimentacao: TDateTime; Prazo: TDateTime;
  Mensagem: AnsiString; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'Insert into Movimentacao '+
                             ' (Codigo_Expediente, Data_Movimentacao, Prazo, Mensagem) '+
                             ' values '+
                             ' (:Codigo_Expediente, :Data_Movimentacao, :Prazo, :Mensagem) ';
    FComandoSQL.Parametros.Add('Codigo_Expediente');
    FComandoSQL.Parametros.Add('Data_Movimentacao');
    FComandoSQL.Parametros.Add('Prazo');
    FComandoSQL.Parametros.Add('Mensagem');
    FComandoSQL.Valores.Add(Codigo_Expediente);
    FComandoSQL.Valores.Add(Data_Movimentacao);
    FComandoSQL.Valores.Add(Prazo);
    FComandoSQL.Valores.Add(Mensagem);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Transfere_Movimento(var Conexao: TADOConnection;
  Codigo_Movimento, Novo_Codigo_Expediente: integer;
  var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'Update Movimentacao set '+
                             ' Codigo_Expediente = :Codigo_Expediente '+
                             ' Where Codigo = :Codigo ';
    FComandoSQL.Parametros.Add('Codigo_Expediente');
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(Novo_Codigo_Expediente);
    FComandoSQL.Valores.Add(Codigo_Movimento);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Buscar(var Conexao: TADOConnection;
  var Query: TADOQuery; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'select M.*, E.N_Expediente, E.Descricao from Movimentacao M '+
                             'left join Expediente E on (M.Codigo_Expediente = E.Codigo)';
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLRetornaADOQuery(Query, Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Buscar(var Conexao: TADOConnection;
  var Query: TADOQuery; var Retorno: AnsiString;
  Codigo_Expediente: Integer): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'select M.*, E.N_Expediente, E.Descricao from Movimentacao M '+
                             ' join Expediente E on (M.Codigo_Expediente = E.Codigo) where Codigo_Expediente = :Codigo_Expediente';
    FComandoSQL.Parametros.Add('Codigo_Expediente');
    FComandoSQL.Valores.Add(Codigo_Expediente);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLRetornaADOQuery(Query, Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.BuscarMovimentacaoPrazoVencido(
  var Conexao: TADOConnection; var Query: TADOQuery;
  var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
  Data: TDateTime;
begin
  try
    Data:= date;
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'select E.Codigo, E.N_Expediente, E.Descricao, E.Status, M.Codigo as Codigo_Movimentacao, M.Data_Movimentacao, M.Prazo, M.Mensagem from Movimentacao M '+
                            ' join Expediente E on (M.Codigo_Expediente = E.Codigo) '+
                            ' where M.Prazo >= GETDATE() and ( DATEDIFF(day, GETDATE(), M.Prazo) <= 3 and DATEDIFF(day, GETDATE(), M.Prazo) >= 0)';
    //FComandoSQL.Parametros.Add('Prazo');
    //FComandoSQL.Valores.Add(Data);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLRetornaADOQuery(Query, Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Editar(var Conexao: TADOConnection;
  Codigo: integer; Data_Movimentacao: TDateTime; Prazo: TDateTime;
  Mensagem: AnsiString; var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'Update Movimentacao set '+
                             ' Prazo = :Prazo, Mensagem = :Mensagem '+
                             ' Where Codigo = :Codigo ';
    FComandoSQL.Parametros.Add('Prazo');
    FComandoSQL.Parametros.Add('Mensagem');
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(Prazo);
    FComandoSQL.Valores.Add(Mensagem);
    FComandoSQL.Valores.Add(Codigo);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Remover(var Conexao: TADOConnection;
  var Retorno: AnsiString): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'delete from Movimentacao';
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.Remover(var Conexao: TADOConnection;
  var Retorno: AnsiString; Codigo_Expediente: Integer): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'delete from Movimentacao where Codigo_Expediente = :Codigo_Expediente';
    FComandoSQL.Parametros.Add('Codigo_Expediente');
    FComandoSQL.Valores.Add(Codigo_Expediente);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

function TMovimentacaoDAO.RemoverSelecionado(var Conexao: TADOConnection;
  var Retorno: AnsiString; Codigo: Integer): integer;
var
  FComandoSQL: TComandoSQLEntidade;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'delete from Movimentacao where Codigo = :Codigo';
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(Codigo);
    FDAO:= TExecutaComandosSQLDominio.Create(FComandoSQL);
    Result:= FDAO.ExecutaComandoSQLSalvarAlterarExcluir(Retorno);
  finally

  end;
end;

end.
