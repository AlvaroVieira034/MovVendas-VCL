unit iproduto.repository;

interface

uses produto.model, Data.DB, System.SysUtils;


type
  IProdutoRepository = interface
    ['{6C39CECF-468D-45D5-B087-F159BEC562FD}']
    function Inserir(FProduto: TProduto; out sErro: string): Boolean;
    function Alterar(FProduto: TProduto; iCodigo: Integer; out sErro: string): Boolean;
    function Excluir(iCodigo: Integer; out sErro : string): Boolean;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;

  end;

implementation

end.
