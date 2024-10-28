unit iproduto.repository;

interface

uses produto.model, Data.DB;


type
  IProdutoRepository = interface
    ['{6C39CECF-468D-45D5-B087-F159BEC562FD}']
    procedure PreencherGrid(APesquisa, ACampo: string);
    procedure PreencherComboProduto;
    procedure CarregarCampos(FProduto: TProduto; iCodigo: Integer);
    function Inserir(FProduto: TProduto; out sErro: string): Boolean;
    function Alterar(FProduto: TProduto; iCodigo: Integer; out sErro: string): Boolean;
    function Excluir(iCodigo: Integer; out sErro : string): Boolean;
    function GetValorUnitario(ACodigo: Integer): Double;
    function GetDataSource: TDataSource;
    procedure CriarTabelas;
    procedure CriarCamposTabelas;
  end;

implementation

end.
