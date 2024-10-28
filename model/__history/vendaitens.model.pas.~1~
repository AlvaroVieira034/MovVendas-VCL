unit vendaitens.model;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

Type
  TVendaItens = class
  private
    FCod_Venda: Integer;
    FCod_Produto: Integer;
    FDes_Descricao: string;
    FVal_Preco_Unitario: Double;
    FVal_Quantidade: Integer;
    FVal_Total_Venda: Double;
    procedure SetCod_Produto(const Value: Integer);

  public
    procedure Carregar(QryVendasItens: TFDQuery; VendaItens: TVendaItens; iCodigo: Integer);
    procedure Pesquisar(VendaItens: TVendaItens; iCodigo: Integer);
    function Inserir(VendaItens: TVendaItens; out sErro: String): Boolean;
    function Alterar(VendaItens: TVendaItens; iCodigo: Integer; out sErro: String): Boolean;
    function Excluir(iCodigo: Integer; out sErro : String): Boolean;

    property Cod_Venda: Integer read FCod_Venda write FCod_Venda;
    property Cod_Produto: Integer read FCod_Produto write SetCod_Produto;
    property Des_Descricao: string read FDes_Descricao write FDes_Descricao;
    property Val_Preco_Unitario: Double read FVal_Preco_Unitario write FVal_Preco_Unitario;
    property Val_Quantidade: Integer read FVal_Quantidade write FVal_Quantidade;
    property Val_Total_Venda: Double read FVal_Total_Venda write FVal_Total_Venda;

  end;

implementation

//uses



{ TVendaItens }

function TVendaItens.Alterar(VendaItens: TVendaItens; iCodigo: Integer; out sErro: String): Boolean;
begin

end;

procedure TVendaItens.Carregar(QryVendasItens: TFDQuery; VendaItens: TVendaItens; iCodigo: Integer);
begin

end;

function TVendaItens.Excluir(iCodigo: Integer; out sErro: String): Boolean;
begin

end;

function TVendaItens.Inserir(VendaItens: TVendaItens; out sErro: String): Boolean;
begin

end;

procedure TVendaItens.Pesquisar(VendaItens: TVendaItens; iCodigo: Integer);
begin

end;

procedure TVendaItens.SetCod_Produto(const Value: Integer);
begin

end;

end.
