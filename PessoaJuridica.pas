unit PessoaJuridica;

interface

uses
  Contribuinte;

type
  TPessoaJuridica = class (TContribuinte)
  private
    FNumeroEmpregados: Integer;
    procedure SetNumeroEmpregados(const Value: Integer);

  public
    function Taxa: Double; override;
    function ToString: string; override;
    procedure Salvar; override;
    property NumeroEmpregados: Integer read FNumeroEmpregados write SetNumeroEmpregados;

  end;

implementation

uses
  FireDAC.Comp.Client, System.SysUtils;

{ TPessoaJuridica }

procedure TPessoaJuridica.SetNumeroEmpregados(const Value: Integer);
begin
  FNumeroEmpregados := Value;
end;

function TPessoaJuridica.Taxa: Double;
begin
  if FNumeroEmpregados > 10 then
    Result := RendaAnual * 0.14
  else
    Result := RendaAnual * 0.16;
end;

procedure TPessoaJuridica.Salvar;
const
  SQL = 'INSERT INTO contribuintes (id_geral, tipo_pessoa, fl_simples, nome, renda_anual, numero_empregados, despesas_medicas, valor_imposto)'+
        'VALUES (:id_geral, :tipo_pessoa, :fl_simples, :nome, :renda_anual, :numero_empregados, :despesas_medicas, :valor_imposto)';

  SQL_ID = 'SELECT nextval(''id_seq'') as id';
var
  query: TFDQuery;
  id: integer;
begin
  inherited;

  query := TFDQuery.Create(nil);
//  query.Connection := Conexao;

  try
    try
      query.SQL.Add(SQL_ID);
      query.Open();
      id := query.Fields[0].AsInteger;
      query.SQL.Clear;
      query.SQL.Add(SQL);
      query.ParamByName('id_geral').AsInteger := id;
      query.ParamByName('tipo_pessoa').AsString := 'J';
      query.ParamByName('fl_simples').AsBoolean := False;
      query.ParamByName('nome').AsString := Nome;
      query.ParamByName('renda_anual').AsCurrency := RendaAnual;
      query.ParamByName('numero_empregados').AsInteger := NumeroEmpregados;
      query.ParamByName('despesas_medicas').AsCurrency := 0;
      query.ParamByName('valor_imposto').AsCurrency := Taxa;
      query.ExecSQL;
    except
      on e:Exception do
        raise Exception.Create('Ocorreu erro ao salvar os dados ' + e.Message);
    end;
  finally
    query.Free;
  end;
end;

function TPessoaJuridica.ToString: string;
begin
  Result := 'Valor do imposto a pagar pela empresa: ';
end;

end.
