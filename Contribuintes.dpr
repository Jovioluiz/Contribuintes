program Contribuintes;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {Form2},
  Contribuinte in 'Contribuinte.pas',
  PessoaFisica in 'PessoaFisica.pas',
  PessoaJuridica in 'PessoaJuridica.pas',
  uEmpresaSimples in 'uEmpresaSimples.pas',
  uConexao in 'uConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
