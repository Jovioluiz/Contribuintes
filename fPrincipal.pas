unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox, Contribuinte, uConexao, FireDAC.Phys.FBDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.PGDef,
  FireDAC.Phys.PG, System.Generics.Collections;

type
  TForm2 = class(TForm)
    edtNome: TEdit;
    radioGroup: TRadioGroup;
    edtRendaAnual: TNumberBox;
    edtNrEmpregados: TEdit;
    edtDespesasMedicas: TNumberBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    memo: TMemo;
    Button1: TButton;
    chkSimples: TCheckBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure radioGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FContribuinte: TContribuinte;
    FConexaoBanco: TConexao;
    FListaContribuintes: TList<TContribuinte>;

  public
    { Public declarations }
    property ConexaoBanco: TConexao read FConexaoBanco;
  end;

var
  Form2: TForm2;

implementation

uses
  PessoaJuridica, PessoaFisica, uEmpresaSimples, FireDAC.Comp.Client;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  valor: Double;
begin

  try
    if radioGroup.ItemIndex = -1 then
      raise Exception.Create('Selecione um tipo de contribuinte');

    if radioGroup.ItemIndex = 1 then
    begin
      if chkSimples.Checked then
        FContribuinte := TEmpresaSimples.Create
      else
        FContribuinte := TPessoaJuridica.Create;
      FContribuinte.Nome := edtNome.Text;
      FContribuinte.RendaAnual := edtRendaAnual.ValueCurrency;
      (FContribuinte as TPessoaJuridica).NumeroEmpregados := StrToInt(edtNrEmpregados.Text);
      valor := FContribuinte.Taxa;
    end
    else
    begin
      FContribuinte := TPessoaFisica.Create;
      FContribuinte.Nome := edtNome.Text;
      FContribuinte.RendaAnual := edtRendaAnual.ValueCurrency;
      (FContribuinte as TPessoaFisica).DespesasMedicas := edtDespesasMedicas.ValueCurrency;
      valor := FContribuinte.Taxa;
    end;

    FListaContribuintes.Add(FContribuinte);

    for var lista in FListaContribuintes do
    begin
      memo.Lines.Add(lista.ToString + valor.ToString);
    end;


//
//    memo.Clear;
//    memo.Lines.Add(FContribuinte.ToString + valor.ToString);
  
  finally
    FContribuinte.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  FContribuinte.Salvar;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FConexaoBanco := TConexao.Create;
  FListaContribuintes := TList<TContribuinte>.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FListaContribuintes.Free;
end;

procedure TForm2.radioGroupClick(Sender: TObject);
begin
  edtNrEmpregados.Enabled := radioGroup.ItemIndex = 1;
  edtDespesasMedicas.Enabled := radioGroup.ItemIndex = 0;
  chkSimples.Enabled := radioGroup.ItemIndex = 1;
end;

end.
