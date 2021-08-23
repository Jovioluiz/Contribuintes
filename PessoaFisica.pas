unit PessoaFisica;

interface

uses
  Contribuinte;

type
  TPessoaFisica = class (TContribuinte)
  private
    FDespesasMedicas: Double;
    procedure SetDespesasMedicas(const Value: Double);

    public

      function Taxa: Double; override;
      function ToString: string; override;
      procedure Salvar; override;

      property DespesasMedicas: Double read FDespesasMedicas write SetDespesasMedicas;
  end;

implementation

uses
  FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils;

{ TPessoaFisica }

procedure TPessoaFisica.Salvar;
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
  query.Connection := Conexao;

  try
    try
      query.SQL.Add(SQL_ID);
      query.Open();
      id := query.Fields[0].AsInteger;
      query.SQL.Clear;
      query.SQL.Add(SQL);
      query.ParamByName('id_geral').AsInteger := id;
      query.ParamByName('tipo_pessoa').AsString := 'F';
      query.ParamByName('fl_simples').AsBoolean := False;
      query.ParamByName('nome').AsString := Nome;
      query.ParamByName('renda_anual').AsCurrency := RendaAnual;
      query.ParamByName('numero_empregados').AsInteger := 0;
      query.ParamByName('despesas_medicas').AsCurrency := DespesasMedicas;
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

procedure TPessoaFisica.SetDespesasMedicas(const Value: Double);
begin
  FDespesasMedicas := Value;
end;

function TPessoaFisica.Taxa: Double;
begin
  if RendaAnual < 20000 then
    Result := RendaAnual * 0.15 - FDespesasMedicas * 0.5
  else
    Result := RendaAnual * 0.25 - FDespesasMedicas * 0.5;
end;

function TPessoaFisica.ToString: string;
begin
  Result := 'Valor do imposto a pagar pela pessoa: ';
end;

end.
