unit vendaitens.controller;

interface

uses umain, vendaitens.model, vendaitens.repository, system.SysUtils, Vcl.Forms, FireDAC.Comp.Client,
     System.Generics.Collections;

type
  TCampoInvalido = (ciData, ciDescricao, ciCliente, ciValor, ciValorZero);
  TVendaItensController = class

  private
    FVendaItens: TVendaItens;
    FVendaItensRepository: TVendaItensRepository;

  public
    constructor Create();
    destructor Destroy; override;
    function CarregarItensVenda(ACodVenda: Integer): TList<TVendaItens>;
    function Inserir(FVendaItens: TVendaItens; var sErro: string): Boolean;
    function Excluir(ACodigo: Integer; var sErro: string): Boolean;

  end;

implementation

{ TVendaItensController }

constructor TVendaItensController.Create;
begin
  FVendaItens := TVendaItens.Create;
  FVendaItensRepository := TVendaItensRepository.Create;
end;

destructor TVendaItensController.Destroy;
begin
  FVendaItens.Free;
  FVendaItensRepository.Free;
  inherited;
end;

function TVendaItensController.CarregarItensVenda(ACodVenda: Integer): TList<TVendaItens>;
begin
  Result := FVendaItensRepository.CarregarItensVenda(ACodVenda);
end;

function TVendaItensController.Inserir(FVendaItens: TVendaItens; var sErro: string): Boolean;
begin
  Result := FVendaItensRepository.Inserir(FVendaItens, sErro);
end;

function TVendaItensController.Excluir(ACodigo: Integer; var sErro: string): Boolean;
begin
  Result := FVendaItensRepository.Excluir(ACodigo,  sErro);
end;


end.
