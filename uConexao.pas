unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Phys.PG;

type
  TConexao = class
  private
    FConexao: TFDConnection;
    FDriver: TFDPhysPgDriverLink;
    procedure SetConexao(const Value: TFDConnection);
    procedure SetDriver(const Value: TFDPhysPgDriverLink);
  public

    constructor Create;
    property Conexao: TFDConnection read FConexao write SetConexao;
    property Driver: TFDPhysPgDriverLink read FDriver write SetDriver;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FDriver := TFDPhysPgDriverLink.Create(nil);
  FConexao.DriverName := 'PG';

  FDriver.VendorLib := 'C:\Users\jovio\Documents\Delphi\Contribuintes\lib\libpq.dll';

  FConexao.Params.Values['Server'] := 'localhost';
  FConexao.Params.Database := 'teste';
  FConexao.Params.UserName := 'postgres';
  FConexao.Params.Password := 'postgres';
  FConexao.Params.Values['Port'] := '5434';

  try
    FConexao.Open();
  except
    on e:Exception do
    begin
      ShowMessage('Não foi possível efetuar a conexão. Erro: ' + e.Message);
      FConexao := nil;
    end;
  end;
end;

procedure TConexao.SetConexao(const Value: TFDConnection);
begin
  FConexao := Value;
end;

procedure TConexao.SetDriver(const Value: TFDPhysPgDriverLink);
begin
  FDriver := Value;
end;

end.
