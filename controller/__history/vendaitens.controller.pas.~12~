unit vendaitens.controller;

interface

uses umain, vendaitens.model, vendaitensrepository.model, system.SysUtils, Vcl.Forms, FireDAC.Comp.Client;

type
  TCampoInvalido = (ciData, ciDescricao, ciCliente, ciValor, ciValorZero);
  TVendaItensController = class

  private
    FVendaItens: TVendaItens;
    FVendaItensRepo: TVendaItensRepository;

  public
    constructor Create();
    destructor Destroy; override;
    function Carregar(QryVendasItens: TFDQuery; FVendaItens: TVendaItens; ACodigo: Integer): Boolean;
    function Inserir(QryVendasItens: TFDQuery; FVendaItens: TVendaItens; var sErro: string): Boolean;
    function Excluir(QryVendasItens: TFDQuery; Transacao: TFDTransaction; ACodigo: Integer; var sErro: string): Boolean;
    function ValidarDados(const ACodProduto, AQuantidade, APrecoUnitario, ATotalItem: string; out AErro: TCampoInvalido): Boolean;

  end;

implementation

{ TVendaItensController }

constructor TVendaItensController.Create;
begin
  FVendaItens := TVendaItens.Create;
  FVendaItensRepo := TVendaItensRepository.Create;
end;

destructor TVendaItensController.Destroy;
begin
  FVendaItens.Free;
  FVendaItensRepo.Free;
  inherited;
end;

function TVendaItensController.Carregar(QryVendasItens: TFDQuery; FVendaItens: TVendaItens; ACodigo: Integer): Boolean;
var sErro: string;
begin
  try
    FVendaItensRepo.Carregar(QryVendasItens, FVendaItens, ACodigo);
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao carregar os itens do produto!' + sLineBreak + E.Message;
      Result := False;
      raise;
    end;
  end;
end;

function TVendaItensController.Inserir(QryVendasItens: TFDQuery; FVendaItens: TVendaItens; var sErro: string): Boolean;
begin
  Result := FVendaItensRepo.Inserir(QryVendasItens, FVendaItens, sErro);
end;

function TVendaItensController.Excluir(QryVendasItens: TFDQuery; Transacao: TFDTransaction; ACodigo: Integer; var sErro: string): Boolean;
begin
  Result := FVendaItensRepo.Excluir(QryVendasItens, Transacao,  ACodigo,  sErro);
end;

function TVendaItensController.ValidarDados(const ACodProduto, AQuantidade, APrecoUnitario, ATotalItem: string; out AErro: TCampoInvalido): Boolean;
begin

end;

end.
