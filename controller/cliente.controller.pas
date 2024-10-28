unit cliente.controller;

interface

uses cliente.model, cliente.repository, icliente.repository, cliente.service, icliente.service, conexao.service,
     System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB, untFormat, biblioteca;

type
  TCampoInvalido = (ciNome, ciCpfCnpj, ciCidade, ciUF, ciCPF, ciCNPJ);
  TClienteController = class

  private
    FCliente: TCliente;
    FClienteRepository : TClienteRepository;
    FClienteService : TClienteService;

  public
    constructor Create(AClienteRepository: IClienteRepository; AClienteService: IClienteService);
    destructor Destroy; override;
    procedure PreencherGridClientes(APesquisa, ACampo: string);
    procedure PreencherCamposForm(FCliente: TCliente; ACodigo: Integer);
    procedure PreencherComboClientes(TblComboClientes: TFDQuery);
    function Inserir(FCliente: TCliente; out sErro: string): Boolean;
    function Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro : string): Boolean;
    function GetDataSource: TDataSource;
    function ValidarDados(const ANomeCliente, ACpfCnpj, ACidade, AUF: string; out AErro: TCampoInvalido): Boolean;
    function VerificaClienteUtilizado(ACodigo: Integer): Boolean;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;

  end;

implementation

{ TClienteController }

constructor TClienteController.Create(AClienteRepository: IClienteRepository; AClienteService: IClienteService);
begin
  FCliente := TCliente.Create();
  FClienteRepository := TClienteRepository.Create();
  FClienteService := TClienteService.Create();
end;

destructor TClienteController.Destroy;
begin
  FCliente.Free;
  FClienteRepository.Free;
  FClienteService.Free;
  inherited;
end;

procedure TClienteController.PreencherGridClientes(APesquisa, ACampo: string);
var LCampo, SErro: string;
begin
  try
    if ACampo = 'C�digo' then
      LCampo := 'cli.cd_cliente';

    if ACampo = 'Nome' then
      LCampo := 'cli.des_nomecliente';

    if ACampo = 'Cidade' then
      LCampo := 'cli.des_cidade';

    if ACampo = '' then
      LCampo := 'cli.des_nomecliente';

    FClienteService.PreencherGridClientes(APesquisa, LCampo);
  except on E: Exception do
    begin
      SErro := 'Ocorreu um erro ao pesquisar o cliente!' + sLineBreak + E.Message;
      raise;
    end;
  end;
end;

procedure TClienteController.PreencherCamposForm(FCliente: TCliente; ACodigo: Integer);
var sErro: string;
begin
  try
    FClienteService.PreencherCamposForm(FCliente, ACodigo);
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao carregar o cliente!' + sLineBreak + E.Message;
      raise;
    end;
  end;
end;

procedure TClienteController.PreencherComboClientes(TblComboClientes: TFDQuery);
begin
  FClienteService.PreencherComboClientes(TblComboClientes);
end;

function TClienteController.Inserir(FCliente: TCliente; out sErro: string): Boolean;
begin
  Result := FClienteRepository.Inserir(FCliente, sErro);
end;

function TClienteController.Alterar(FCliente: TCliente; ACodigo: Integer; out sErro: string): Boolean;
begin
  Result := FClienteRepository.Alterar(FCliente, ACodigo, sErro);
end;

function TClienteController.Excluir(ACodigo: Integer; out sErro: string): Boolean;
begin
  Result := FClienteRepository.Excluir(ACodigo, sErro);
end;

function TClienteController.GetDataSource: TDataSource;
begin
  Result := FClienteService.GetDataSource;
end;

function TClienteController.ValidarDados(const ANomeCliente, ACpfCnpj, ACidade, AUF: string; out AErro: TCampoInvalido): Boolean;
var LCpf, LCnpj: string;
begin
  if ANomeCliente = EmptyStr then
  begin
    AErro := ciNome;
    Exit;
  end;

  if ACpfCnpj = EmptyStr then
  begin
    AErro := ciCpfCnpj;
    Exit;
  end;

  if Length(ACpfCnpj) = 14 then
  begin
    LCpf := SoNumeros(ACpfCnpj);
    if not ValidarCPF(LCpf) then
    begin
      AErro := ciCPF;
      Exit;
    end;
  end;

  if Length(ACpfCnpj) = 18 then
  begin
    LCnpj := SoNumeros(ACpfCnpj);
    if not ValidarCNPJ(LCnpj) then
    begin
      AErro := ciCNPJ;
      Exit;
    end;
  end;

  if ACidade = EmptyStr then
  begin
    AErro := ciCidade;
    Exit;
  end;

  if AUF = EmptyStr then
  begin
    AErro := ciUF;
    Exit;
  end;

  Result := True;
end;

function TClienteController.VerificaClienteUtilizado(ACodigo: Integer): Boolean;
begin
  Result := FClienteService.VerificaClienteUtilizado(ACodigo);
end;

function TClienteController.ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;
begin
  Result := FClienteRepository.ExecutarTransacao(AOperacao, sErro);
end;

end.