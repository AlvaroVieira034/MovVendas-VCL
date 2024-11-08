unit ivenda.repository;

interface

uses venda.model, Data.DB, FireDAC.Comp.Client, System.SysUtils;

type
  IVendaRepository = interface
    ['{9CC5F96D-A765-41A5-A670-1241895E5CF4}']
    function Inserir(FVenda: TVenda; Transacao: TFDTransaction; out sErro: string): Boolean;
    function Alterar(FVenda: TVenda; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro : string): Boolean;
    procedure CriarTabelas;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;

  end;

implementation

end.
