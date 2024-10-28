unit connection.model;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,  FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils,
     FireDAC.Phys.MySQL, FireDAC.Phys.MSSQL;

type
  TConnection = class
    private
      FConexao: TFDConnection;
      FTransacao: TFDTransaction;

    public
      constructor Create;
      destructor Destroy; override;
      function GetConexao: TFDConnection;
      function CriarQuery: TFDQuery;
      function CriarDataSource: TDataSource;
      function CriarTransaction: TFDTransaction;
      function TestarConexao: Boolean;
      procedure InciarTransacao;

  end;

implementation

uses Vcl.Dialogs;

{ TConnection }

constructor TConnection.Create;
var FDPhysMSSQL: TFDPhysMSSQLDriverLink;
//var FDPhysMySQL: TFDPhysMySQLDriverLink;
begin
  inherited Create;
  {Configurações da conexão para MySql
  FDPhysMySQL := TFDPhysMySQLDriverLink.Create(nil);

  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'MySQL';
  FConexao.Params.Database := 'testewk';
  FConexao.Params.UserName := 'root';
  FConexao.Params.Password := '';
  FConexao.Params.Add('Server=localhost');  // Endereço do servidor MySQL
  FConexao.Params.Add('Port=3306');         // Porta do MySQL
  FConexao.Params.Add('AuthMode=Normal');   // Autenticação padrão
  FConexao.LoginPrompt := False;}

  // Cria Conexão para SQL Server
  FDPhysMSSQL := TFDPhysMSSQLDriverLink.Create(nil);

  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'MSSQL';
  FConexao.Params.Database := 'TESTEWK';
  FConexao.Params.UserName := 'SA';
  FConexao.Params.Password := 'info';
  FConexao.Params.Add('ADDRESS=PC-ALVARO\SQLEXPRESS');
  FConexao.LoginPrompt := False;

  // Transação
  FTransacao := TFDTransaction.Create(nil);
  FTransacao.Connection := FConexao;
  FConexao.Transaction := FTransacao;

  TestarConexao;
end;

destructor TConnection.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;

end;

function TConnection.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;

function TConnection.CriarQuery: TFDQuery;
var Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConexao;
  Query.Transaction := FTransacao;
  Result := Query;
end;

function TConnection.CriarDataSource: TDataSource;
var DataSource: TDataSource;
begin
  DataSource := TDataSource.Create(nil);
  Result := DataSource;
end;

function TConnection.CriarTransaction: TFDTransaction;
begin
  Result := FTransacao;
end;

function TConnection.TestarConexao: Boolean;
begin
  Result := False;
  try
    FConexao.Connected := True;
    Result := FConexao.Connected;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao conectar: ' + E.Message);
    end;
  end;
end;

procedure TConnection.InciarTransacao;
begin
  // Verifica se a transação já foi iniciada
  if not FTransacao.Active then
  begin
    FTransacao.Connection := FConexao;
    FTransacao.StartTransaction;
  end;
end;

end.
