unit vendaitens.repository;

interface

uses vendaitens.model, ivendaitens.repository,  conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
     System.Classes, System.Generics.Collections, Data.DB;

type
  TVendaItensRepository = class(TInterfacedObject, IVendaItensRepository)
  private
    QryVendaItens: TFDQuery;
    TransacaoItens: TFDTransaction;

  public
    constructor Create;
    destructor Destroy; override;
    function CarregarItensVenda(ACodVenda: Integer): TList<TVendaItens>;
    function Inserir(FVendaItens: TVendaItens; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro: string): Boolean;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;
    procedure CriarTabelas;

  end;

implementation

{ TVendasItensRepository }

constructor TVendaItensRepository.Create;
begin
  CriarTabelas()
end;

destructor TVendaItensRepository.Destroy;
begin
  TransacaoItens.Free;
  QryVendaItens.Free;
  inherited;
end;

procedure TVendaItensRepository.CriarTabelas;
begin
  TransacaoItens := TConexao.GetInstance.Connection.CriarTransaction;
  QryVendaItens := TConexao.GetInstance.Connection.CriarQuery;
  QryVendaItens.Transaction := TransacaoItens;
end;

function TVendaItensRepository.CarregarItensVenda(ACodVenda: Integer): TList<TVendaItens>;
var Item: TVendaItens;
begin
  Result := TList<TVendaItens>.Create;

  with QryVendaItens do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select vdi.id_venda, ');
    SQL.Add('vdi.cod_venda, ');
    SQL.Add('vdi.cod_produto, ');
    SQL.Add('prd.des_descricao as descricao, ');
    SQL.Add('vdi.val_quantidade,');
    SQL.Add('vdi.val_precounitario, ');
    SQL.Add('vdi.val_totalitem');
    SQL.Add('from tab_venda_item vdi');
    SQL.Add('join tab_produto prd on vdi.cod_produto = prd.cod_produto');
    SQL.Add('where vdi.cod_venda = :cod_venda');
    SQL.Add('order by vdi.id_venda');
    ParamByName('COD_VENDA').AsInteger := ACodVenda;
    Open;
  end;

  while not QryVendaItens.Eof do
  begin
    Item := TVendaItens.Create;
    Item.Id_Venda := QryVendaItens.FieldByName('ID_VENDA').AsInteger;
    Item.Cod_Venda := QryVendaItens.FieldByName('COD_VENDA').AsInteger;
    Item.Cod_Produto := QryVendaItens.FieldByName('COD_PRODUTO').AsInteger;
    Item.Des_Descricao := QryVendaItens.FieldByName('DESCRICAO').AsString;
    Item.Val_Quantidade := QryVendaItens.FieldByName('VAL_QUANTIDADE').AsInteger;
    Item.Val_PrecoUnitario := QryVendaItens.FieldByName('VAL_PRECOUNITARIO').AsFloat;
    Item.Val_TotalItem := QryVendaItens.FieldByName('VAL_TOTALITEM').AsFloat;
    Result.Add(Item);
    QryVendaItens.Next;
  end;
  QryVendaItens.Close;
end;

function TVendaItensRepository.Inserir(FVendaItens: TVendaItens; out sErro: string): Boolean;
begin
  with QryVendaItens, FVendaItens do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into tab_venda_item( ');
    SQL.Add('cod_venda, ');
    SQL.Add('cod_produto, ');
    SQL.Add('val_precounitario, ');
    SQL.Add('val_quantidade, ');
    SQL.Add('val_totalitem) ');
    SQL.Add('values (:cod_venda, ');
    SQL.Add(':cod_produto, ');
    SQL.Add(':val_precounitario, ');
    SQL.Add(':val_quantidade, ');
    SQL.Add(':val_totalitem) ');

    ParamByName('COD_VENDA').AsInteger := Cod_Venda;
    ParamByName('COD_PRODUTO').AsInteger := Cod_Produto;
    ParamByName('VAL_PRECOUNITARIO').AsFloat := Val_PrecoUnitario;
    ParamByName('VAL_QUANTIDADE').AsInteger := Val_Quantidade;
    ParamByName('VAL_TOTALITEM').AsFloat := Val_TotalItem;

    try
      Prepared := True;
      ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir um item da venda!' + sLineBreak + E.Message;
        Result := False;
        raise;
      end;
    end;
  end;
end;

function TVendaItensRepository.Excluir(ACodigo: Integer; out sErro: string): Boolean;
begin
  with QryVendaItens do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'delete from tab_venda_item where cod_venda = :cod_venda';
    ParamByName('COD_VENDA').AsInteger := ACodigo;

    // Inicia Transa��o
    if not TransacaoItens.Connection.Connected then
      TransacaoItens.Connection.Open();

    try
      Prepared := True;
      TransacaoItens.StartTransaction;
      ExecSQL;
      TransacaoItens.Commit;
      Result := True;
    except on E: Exception do
      begin
        TransacaoItens.Rollback;
        sErro := 'Ocorreu um erro ao excluir os itens da venda !' + sLineBreak + E.Message;
        Result := False;
        raise;
      end;
    end;
  end;
end;

function TVendaItensRepository.ExecutarTransacao(AOperacao: TProc;  var sErro: string): Boolean;
begin
  Result := False;
  if not TransacaoItens.Connection.Connected then
    TransacaoItens.Connection.Open();

  try
    TransacaoItens.StartTransaction;
    try
      AOperacao;
      TransacaoItens.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        TransacaoItens.Rollback;
        sErro := 'Ocorreu um erro ao excluir o produto !' + sLineBreak + E.Message;
        raise;
      end;
    end;
  except
    on E: Exception do
    begin
      sErro := 'Erro na conex�o com o banco de dados: ' + sLineBreak + E.Message;
      Result := False;
    end;
  end;

  if TransacaoItens.Connection.Connected then
    TransacaoItens.Connection.Close();
end;

end.
