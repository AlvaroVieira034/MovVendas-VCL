unit venda.service;

interface

uses ivenda.service, venda.model, conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
     Data.DB;

type
  TVendaService = class(TInterfacedObject, IVendaService)
  private
    TblVendas: TFDQuery;
    QryVendas: TFDQuery;
    DsVendas: TDataSource;

  public
    constructor Create;
    destructor Destroy; override;

    procedure PreencherGridVendas(APesquisa, ACampo: string);
    procedure PreencherCamposForm(FVenda: TVenda; ACodigo: Integer);
    procedure CriarTabelas;
    procedure CriarCamposTabelas;


  end;

implementation

{ TVendaService }

constructor TVendaService.Create;
begin

end;

destructor TVendaService.Destroy;
begin

  inherited;
end;

procedure TVendaService.CriarTabelas;
begin
  // Cria Tabelas/Querys
    TblVendas := TConexao.GetInstance.Connection.CriarQuery;
    //TblVendaItens := TConexao.GetInstance.Connection.CriarQuery;
    QryVendas := TConexao.GetInstance.Connection.CriarQuery;
    //QryVendaItens := TConexao.GetInstance.Connection.CriarQuery;
    //QryTemp := TConexao.GetInstance.Connection.CriarQuery;
end;

procedure TVendaService.CriarCamposTabelas;
begin

end;

procedure TVendaService.PreencherCamposForm(FVenda: TVenda; ACodigo: Integer);
begin

end;

procedure TVendaService.PreencherGridVendas(APesquisa, ACampo: string);
begin
  with TblVendas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select vda.cod_venda, ');
    SQL.Add('vda.dta_venda, ');
    SQL.Add('vda.cod_cliente, ');
    SQL.Add('cli.des_nomecliente as nomecliente, ');
    SQL.Add('vda.val_venda');
    SQL.Add('from tab_venda vda');
    SQL.Add('join tab_cliente cli on vda.cod_cliente = cli.cod_cliente ');
    SQL.Add('where ' + ACampo + ' like :pNOME');
    SQL.Add('order by ' + ACampo + ' desc');
    ParamByName('PNOME').AsString := APesquisa;
    Prepared := True;
    Open();
  end;
end;

end.
