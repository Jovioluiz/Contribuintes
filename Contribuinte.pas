unit Contribuinte;

interface

uses
  uConexao;

type TContribuinte = class(TConexao)
  private
    FRendaAnual: Double;
    FNome: String;
    procedure SetNome(const Value: String);
    procedure SetRendaAnual(const Value: Double);
  public

    function Taxa: Double; virtual; abstract;
    function ToString: string; override; abstract;
    procedure Salvar; virtual; abstract;

    property Nome: String read FNome write SetNome;
    property RendaAnual: Double read FRendaAnual write SetRendaAnual;

end;

implementation

{ TContribuinte }

procedure TContribuinte.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TContribuinte.SetRendaAnual(const Value: Double);
begin
  FRendaAnual := Value;
end;

end.
