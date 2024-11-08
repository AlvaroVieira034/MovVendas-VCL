unit venda.service;

interface

uses ivenda.service, venda.model, conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
     Data.DB;

type
  TVendaService = class(TInterfacedObject, IVendaService)
  private
    TblVendas: TFDQuery;
    DsVendas: TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    procedure PreencherGridVendas(TblVendas: TFDQuery; APesquisa, ACampo: string);
    procedure PreencherCamposForm(FVenda: TVenda; ACodigo: Integer);

  end;

implementation

{ TVendaService }

constructor TVendaService.Create;
begin
  TblVendas := TConexao.GetInstance.Connection.CriarQuery;
end;

destructor TVendaService.Destroy;
begin
  TblVendas.Free;

  inherited;
end;

procedure TVendaService.PreencherGridVendas(TblVendas: TFDQuery; APesquisa, ACampo: string);
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

procedure TVendaService.PreencherCamposForm(FVenda: TVenda; ACodigo: Integer);
begin
  with TblVendas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select vda.cod_venda, ');
    SQL.Add('vda.dta_venda, ');
    SQL.Add('vda.cod_cliente, ');
    SQL.Add('cli.des_nomecliente as des_cliente, ');
    SQL.Add('vda.val_venda');
    SQL.Add('from tab_venda vda');
    SQL.Add('join tab_cliente cli on vda.cod_cliente = cli.cod_cliente ');
    SQL.Add('where vda.cod_venda = :cod_venda');
    ParamByName('COD_VENDA').AsInteger := ACodigo;
    Open();

    with FVenda, TblVendas do
    begin
      Cod_Venda := FieldByName('COD_VENDA').AsInteger;
      Dta_Venda := FieldByName('DTA_VENDA').AsDateTime;
      Cod_Cliente := FieldByName('COD_CLIENTE').AsInteger;
      Des_Cliente := FieldByName('DES_CLIENTE').AsString;
      Val_Venda := FieldByName('VAL_VENDA').AsFloat;
    end;
  end;
end;



end.
