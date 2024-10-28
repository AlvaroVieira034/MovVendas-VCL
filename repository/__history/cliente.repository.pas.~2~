unit cliente.repository;

interface

uses icliente.repository, cliente.model, conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB;

type
  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    TblClientes: TFDQuery;
    QryClientes: TFDQuery;
    QryTemp: TFDQuery;
    DsClientes: TDataSource;
    Transacao: TFDTransaction;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PreencherGrid(APesquisa, ACampo: string);
    procedure PreencherComboCliente;
    procedure CarregarCampos(FCliente: TCliente; ACodigo: Integer);
    function Inserir(FCliente: TCliente; out sErro: string): Boolean;
    function Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro: string): Boolean;
    function GetDataSource: TDataSource;
    procedure CriarTabelas;
    procedure CriarCamposTabelas;

  end;

implementation

{ TProdutoRepository }

constructor TClienteRepository.Create;
begin

end;

destructor TClienteRepository.Destroy;
begin

  inherited;
end;

function TClienteRepository.GetDataSource: TDataSource;
begin
  Result := DsClientes;
end;

procedure TClienteRepository.CriarTabelas;
begin

end;

procedure TClienteRepository.CriarCamposTabelas;
begin

end;

procedure TClienteRepository.PreencherGrid(APesquisa, ACampo: string);
begin
  with TblClientes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select cli.cod_cliente,  ');
    SQL.Add('cli.des_nomecliente, ');
    SQL.Add('cli.des_cidade, ');
    SQL.Add('cli.des_uf ');
    SQL.Add('from tab_cliente cli');
    SQL.Add('where ' + ACampo + ' like :pNOME');
    SQL.Add('order by ' + ACampo);
    ParamByName('PNOME').AsString := APesquisa;
    Open();
  end;
end;

procedure TClienteRepository.PreencherComboCliente;
begin
  with TblClientes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tab_cliente order by des_nomecliente ');
    Open();
  end;
end;

procedure TClienteRepository.CarregarCampos(FCliente: TCliente; ACodigo: Integer);
begin

end;

function TClienteRepository.Inserir(FCliente: TCliente; out sErro: string): Boolean;
begin

end;

function TClienteRepository.Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
begin

end;

function TClienteRepository.Excluir(ACodigo: Integer; out sErro: string): Boolean;
begin

end;


end.
