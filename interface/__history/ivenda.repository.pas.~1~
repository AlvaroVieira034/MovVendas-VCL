unit ivenda.repository;

interface

uses venda.model, Data.DB, FireDAC.Comp.Client;

type
  IVendaService = interface
    ['{9CC5F96D-A765-41A5-A670-1241895E5CF4}']
    function Inserir(FVenda: TVenda; Transacao: TFDTransaction; out sErro: string): Boolean;
    function Alterar(FVenda: TVenda; Transacao: TFDTransaction; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro : string): Boolean;

  end;

implementation

end.
