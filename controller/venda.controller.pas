unit venda.controller;

interface

uses umain, venda.model, venda.service, ivenda.service, venda.repository, ivenda.repository, system.SysUtils, Vcl.Forms, FireDAC.Comp.Client;

type
  TVendaController = class

  private
    FVenda: TVenda;
    FVendaRepository : TVendaRepository;
    FVendaService : TVendaService;

  public
    constructor Create(AVendaRepository: IVendaRepository; AVendaService: IVendaService);
    destructor Destroy; override;
    procedure PreencherGrid(TblVendas: TFDQuery; APesquisa, ACampo: string);
    function CarregarCampos(FVenda: TVenda; ACodigo: Integer): Boolean;
    function Inserir(FVenda: TVenda; Transacao: TFDTransaction; var sErro: string): Boolean;
    function Alterar(FVenda: TVenda; ACodigo: Integer; sErro: string): Boolean;
    function Excluir(ACodigo: Integer; var sErro: string): Boolean;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;

  end;

implementation

{ TVendaController }

constructor TVendaController.Create(AVendaRepository: IVendaRepository; AVendaService: IVendaService);
begin
  FVenda := TVenda.Create();
  FVendaRepository := TVendaRepository.Create();
  FVendaService := TVendaService.Create();
end;

destructor TVendaController.Destroy;
begin
  FVenda.Free;
  FVendaRepository.Free;
  FVendaService.Free;
  inherited;
end;

procedure TVendaController.PreencherGrid(TblVendas: TFDQuery; APesquisa, ACampo: string);
var LCampo, sErro: string;
begin
  try
    if ACampo = 'Data' then
      LCampo := 'vda.dta_venda';

    if ACampo = 'Cliente' then
      LCampo := 'cli.des_nomecliente';

    if ACampo = '' then
      LCampo := 'vda.dta_venda';

    FVendaService.PreencherGridVendas(TblVendas, APesquisa, LCampo);
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao pesquisar a venda!' + sLineBreak + E.Message;
      raise;
    end;
  end;
end;

function TVendaController.CarregarCampos(FVenda: TVenda; ACodigo: Integer): Boolean;
var sErro: string;
begin
  try
    FVendaService.PreencherCamposForm(FVenda, ACodigo);
    Result := True;
  except on E: Exception do
    begin
      sErro := 'Ocorreu um erro ao carregar a venda!' + sLineBreak + E.Message;
      Result := False;
      raise;
    end;
  end;
end;

function TVendaController.Inserir(FVenda: TVenda; Transacao: TFDTransaction; var sErro: string): Boolean;
begin
  Result := FVendaRepository.Inserir(FVenda, Transacao, sErro);
end;

function TVendaController.Alterar(FVenda: TVenda; ACodigo: Integer; sErro: string): Boolean;
begin
  Result := FVendaRepository.Alterar(FVenda, ACodigo, sErro);
end;

function TVendaController.Excluir(ACodigo: Integer; var sErro: string): Boolean;
begin
  Result := FVendaRepository.Excluir(ACodigo, sErro);
end;

function TVendaController.ExecutarTransacao(AOperacao: TProc;  var sErro: string): Boolean;
begin
  Result := FVendaRepository.ExecutarTransacao(AOperacao, sErro);
end;

end.
