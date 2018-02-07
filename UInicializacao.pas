unit UInicializacao;

interface

uses
  UConfiguracao, IniFiles, Data.Win.ADODB, Winapi.Windows;
type
  TInicializacao = class
    private

    public
      function Carrega_Dados_Conexao(var Configuracao: TConfiguracao): TConfiguracao;
      procedure AtualizaBD(var Conexao: TADOConnection);
      procedure Verifica_Prazo_Movimentacao();
  end;
implementation

uses
  Vcl.Forms, System.SysUtils;

{ TInicializacao }

procedure TInicializacao.AtualizaBD(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      clear;
      add('if not exists(select 1 from syscolumns where id = object_id(' +
        QuotedStr('Expediente') + '))');
      add('CREATE TABLE Expediente ');
      add('(Codigo int primary key, ');
      add('N_Expediente varchar(50), ');
      Add('Descricao varchar (1000),');
      Add('Status int,');
      add('Data_Lancamento datetime) ');
      ExecSQL;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PChar('Causa do erro em Expediente: '
        + E.Message), 'Erro', MB_OK + MB_ICONHAND);
      abort;
    end;
  end;

  try
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      clear;
      add('if not exists(select 1 from syscolumns where id = object_id(' +
        QuotedStr('Movimentacao') + '))');
      add('CREATE TABLE Movimentacao ');
      add('(Codigo int primary key identity (1,1), ');
      add('Codigo_Expediente int, ');
      add('Data_Movimentacao datetime, ');
      Add('Prazo datetime,');
      Add('Mensagem varchar(1000))');
      ExecSQL;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PChar('Causa do erro em Movimentacao: '
        + E.Message), 'Erro', MB_OK + MB_ICONHAND);
      abort;
    end;
  end;

  try
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      clear;
      add('if not exists(select 1 from sysobjects where name = ' +
        QuotedStr('FK_Movimentacao_Expediente') + ')');
      add('ALTER TABLE Movimentacao with NOCHECK ADD CONSTRAINT FK_Movimentacao_Expediente FOREIGN KEY(Codigo_Expediente) ');
      add('References Expediente(Codigo) ');
      ExecSQL;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PChar('Causa do erro em Movimentacao. Criar Chave estrageira para Expediente: '
        + E.Message), 'Erro', MB_OK + MB_ICONHAND);
      abort;
    end;
  end;

end;

function TInicializacao.Carrega_Dados_Conexao(var Configuracao: TConfiguracao): TConfiguracao;
var
  ArqIni: TIniFile;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) +
      'Conexao.ini');
    Configuracao.SetBDUsuario(ArqIni.ReadString('conecta', 'usuario', ''));
    Configuracao.SetBDNomeBD(ArqIni.ReadString('conecta', 'base', ''));
    Configuracao.SetBDServidor(ArqIni.ReadString('conecta', 'servidor', ''));
  finally
    ArqIni.Free;
  end;
end;

procedure TInicializacao.Verifica_Prazo_Movimentacao;
begin

end;

end.
