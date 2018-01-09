unit UConfiguracao;

interface
type
  TConfiguracao = class
    private
      class var FBDUsuario: AnsiString;
      class var FBDNomeBD: AnsiString;
      class var FBDServidor: AnsiString;
    public
      class procedure SetBDNomeBD(const Value: AnsiString);
      class procedure SetBDServidor(const Value: AnsiString);
      class procedure SetBDUsuario(const Value: AnsiString);
      class function GetBDNomeBD: AnsiString;
      class function GetBDServidor: AnsiString;
      class function GetBDUsuario: AnsiString;
  end;
implementation

{ TConfiguracao }

{ TConfiguracao }

class function TConfiguracao.GetBDNomeBD: AnsiString;
begin
  Result:= FBDNomeBD;
end;

class function TConfiguracao.GetBDServidor: AnsiString;
begin
  Result:= FBDServidor;
end;

class function TConfiguracao.GetBDUsuario: AnsiString;
begin
  Result:= FBDUsuario;
end;

class procedure TConfiguracao.SetBDNomeBD(const Value: AnsiString);
begin
  FBDNomeBD:= Value;
end;

class procedure TConfiguracao.SetBDServidor(const Value: AnsiString);
begin
  FBDServidor:= Value;
end;

class procedure TConfiguracao.SetBDUsuario(const Value: AnsiString);
begin
  FBDUsuario:= Value;
end;

end.
