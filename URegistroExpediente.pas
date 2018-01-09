unit URegistroExpediente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmRegistro = class(TForm)
    lblExpediente: TLabel;
    lbl2: TLabel;
    mmoNatureza: TMemo;
    btnSalvarExpediente: TButton;
    dtLancamento: TDateTimePicker;
    lblData: TLabel;
    procedure btnSalvarExpedienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistro: TfrmRegistro;

implementation

uses
  UExpediente;

{$R *.dfm}

procedure TfrmRegistro.btnSalvarExpedienteClick(Sender: TObject);
var
  expediente : TExpediente;
begin
expediente := TExpediente.Create;
expediente.Descricao := 'teste';
expediente.Nexpediente := 'asdasd';
expediente.Arquivado := False;
expediente.DtLancamento := StrToDate('12/06/2002');



end;

end.
