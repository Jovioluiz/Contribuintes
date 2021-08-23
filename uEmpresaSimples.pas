unit uEmpresaSimples;

interface

uses
  PessoaJuridica;

type
  TEmpresaSimples = class (TPessoaJuridica)

    public
      function Taxa: Double; override;
      function ToString: string; override;

  end;

implementation

{ TEmpresaSimples }

function TEmpresaSimples.Taxa: Double;
var
  valor: double;
begin
  valor := inherited;
  Result := valor - 25.50;
end;

function TEmpresaSimples.ToString: string;
begin
  Result := 'Valor a ser pago pela empresa: ';
end;

end.
