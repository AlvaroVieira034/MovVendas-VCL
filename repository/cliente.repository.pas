unit cliente.repository;

interface

uses icliente.repository, cliente.model, conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
     Data.DB;

type
  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    QryClientes: TFDQuery;
    Transacao: TFDTransaction;

  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(FCliente: TCliente; out sErro: string): Boolean;
    function Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro: string): Boolean;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;

  end;

implementation

{ TProdutoRepository }

constructor TClienteRepository.Create;
begin
  inherited Create;
  Transacao := TConexao.GetInstance.Connection.CriarTransaction;
  QryClientes := TConexao.GetInstance.Connection.CriarQuery;
  QryClientes.Transaction := Transacao;
end;

destructor TClienteRepository.Destroy;
begin
  QryClientes.Free;
  inherited;
end;

function TClienteRepository.Inserir(FCliente: TCliente; out sErro: string): Boolean;
begin
  Result := ExecutarTransacao(
    procedure
    begin
      with QryClientes, FCliente do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into tab_cliente(');
        SQL.Add('des_nomecliente, ');
        SQL.Add('des_cpfcnpj, ');
        SQL.Add('dta_nascimento, ');
        SQL.Add('des_cep, ');
        SQL.Add('des_endereco, ');
        SQL.Add('des_complemento, ');
        SQL.Add('des_bairro, ');
        SQL.Add('des_cidade, ');
        SQL.Add('des_uf) ');
        SQL.Add('values (:des_nomecliente, ');
        SQL.Add(':des_cpfcnpj, ');
        SQL.Add(':dta_nascimento, ');
        SQL.Add(':des_cep, ');
        SQL.Add(':des_endereco, ');
        SQL.Add(':des_complemento, ');
        SQL.Add(':des_bairro, ');
        SQL.Add(':des_cidade, ');
        SQL.Add(':des_uf)');

        ParamByName('DES_NOMECLIENTE').AsString := Des_NomeCliente;
        ParamByName('DES_CPFCNPJ').AsString := Des_CpfCnpj;
        ParamByName('DTA_NASCIMENTO').AsDate := Dta_Nascimento;
        ParamByName('DES_CEP').AsString := Des_Cep;
        ParamByName('DES_ENDERECO').AsString := Des_Endereco;
        ParamByName('DES_COMPLEMENTO').AsString := Des_Complemento;
        ParamByName('DES_BAIRRO').AsString := Des_Bairro;
        ParamByName('DES_CIDADE').AsString := Des_Cidade;
        ParamByName('DES_UF').AsString := Des_UF;

        ExecSQL;
      end;
    end, sErro);
end;

function TClienteRepository.Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
begin
  Result := ExecutarTransacao(
    procedure
    begin
      with QryClientes, FCliente do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update tab_cliente set ');
        SQL.Add('des_nomecliente = :des_nomecliente, ');
        SQL.Add('des_cpfcnpj = :des_cpfcnpj, ');
        SQL.Add('dta_nascimento = :dta_nascimento, ');
        SQL.Add('des_cep = :des_cep, ');
        SQL.Add('des_endereco = :des_endereco, ');
        SQL.Add('des_complemento = :des_complemento, ');
        SQL.Add('des_bairro = :des_bairro, ');
        SQL.Add('des_cidade = :des_cidade, ');
        SQL.Add('des_uf = :des_uf ');
        SQL.Add('where cod_cliente = :cod_cliente');

        ParamByName('DES_NOMECLIENTE').AsString := Des_NomeCliente;
        ParamByName('DES_CPFCNPJ').AsString := Des_CpfCnpj;
        ParamByName('DTA_NASCIMENTO').AsDate := Dta_Nascimento;
        ParamByName('DES_CEP').AsString := Des_Cep;
        ParamByName('DES_ENDERECO').AsString := Des_Endereco;
        ParamByName('DES_COMPLEMENTO').AsString := Des_Complemento;
        ParamByName('DES_BAIRRO').AsString := Des_Bairro;
        ParamByName('DES_CIDADE').AsString := Des_Cidade;
        ParamByName('DES_UF').AsString := Des_UF;
        ParamByName('COD_CLIENTE').AsInteger := ACodigo;

        ExecSQL;
      end;
    end, sErro);
end;

function TClienteRepository.Excluir(ACodigo: Integer; out sErro: string): Boolean;
begin
  Result := ExecutarTransacao(
    procedure
    begin
      with QryClientes do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tab_cliente where cod_cliente = :cod_cliente';
        ParamByName('COD_CLIENTE').AsInteger := ACodigo;

        ExecSQL;
      end;
    end, sErro);
end;

function TClienteRepository.ExecutarTransacao(AOperacao: TProc;  var sErro: string): Boolean;
begin
  Result := False;
  if not Transacao.Connection.Connected then
    Transacao.Connection.Open();
  try
    Transacao.StartTransaction;
    try
      AOperacao;
      Transacao.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Transacao.Rollback;
        sErro := 'Ocorreu um erro ao excluir o produto !' + sLineBreak + E.Message;
        raise;
      end;
    end;
  except
    on E: Exception do
    begin
      sErro := 'Erro na conexão com o banco de dados: ' + sLineBreak + E.Message;
      Result := False;
    end;
  end;
end;

end.
