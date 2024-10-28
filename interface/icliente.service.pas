unit icliente.service;

interface

uses cliente.model, Data.DB, FireDAC.Comp.Client;

type
  IClienteService = interface
    ['{F463CC38-F490-4A47-9638-393F3888C53E}']
    procedure PreencherGridClientes(APesquisa, ACampo: string);
    procedure PreencherComboClientes(TblComboClientes: TFDQuery);
    procedure PreencherCamposForm(FCliente: TCliente; ACodigo: Integer);
    function GetDataSource: TDataSource;
    procedure CriarTabelas;
    function VerificaClienteUtilizado(ACodigo: Integer): Boolean;

  end;

implementation

end.