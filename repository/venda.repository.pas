unit venda.repository;

interface

uses venda.model, ivenda.repository, conexao.service, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
     Data.DB;

type
  TVendaRepository = class(TInterfacedObject, IVendaRepository)
  private
    QryVendas: TFDQuery;
    Transacao: TFDTransaction;

  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(FVenda: TVenda; Transacao: TFDTransaction; out sErro: string): Boolean;
    function Alterar(FVenda: TVenda; ACodigo: Integer; out sErro: string): Boolean;
    function Excluir(ACodigo: Integer; out sErro : string): Boolean;
    procedure CriarTabelas;
    function ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;


  end;

implementation

{ TVendaRepository }

constructor TVendaRepository.Create;
begin
  CriarTabelas()
end;

destructor TVendaRepository.Destroy;
begin
  QryVendas.Free;
  inherited;

end;

procedure TVendaRepository.CriarTabelas;
begin
  Transacao := TConexao.GetInstance.Connection.CriarTransaction;
  QryVendas := TConexao.GetInstance.Connection.CriarQuery;
end;

function TVendaRepository.Inserir(FVenda: TVenda; Transacao: TFDTransaction; out sErro: string): Boolean;
begin
  QryVendas.Transaction := Transacao;
  with QryVendas, FVenda do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into tab_venda(');
    SQL.Add('dta_venda, ');
    SQL.Add('cod_cliente, ');
    SQL.Add('val_venda) ');
    SQL.Add('values (:dta_venda, ');
    SQL.Add(':cod_cliente, ');
    SQL.Add(':val_venda)');

    ParamByName('DTA_VENDA').AsDateTime := Dta_Venda;
    ParamByName('COD_CLIENTE').AsInteger := Cod_Cliente;
    ParamByName('VAL_VENDA').AsFloat := Val_Venda;

    try
      Prepared := True;
      ExecSQL;
      Result := True;

      QryVendas.Close;
      QryVendas.SQL.Text := 'SELECT MAX(COD_VENDA) AS ULTIMOID FROM TAB_VENDA ';
      QryVendas.Open;
      FVenda.Cod_Venda := QryVendas.FieldByName('ULTIMOID').AsInteger;

    except
      on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir uma nova venda!' + sLineBreak + E.Message;
        raise;
      end;
    end;
  end;
end;

function TVendaRepository.Alterar(FVenda: TVenda; ACodigo: Integer; out sErro: string): Boolean;
begin
  with QryVendas, FVenda do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tab_venda set ');
    SQL.Add('dta_venda = :dta_venda, ');
    SQL.Add('cod_cliente = :cod_cliente, ');
    SQL.Add('val_venda = :val_venda');
    SQL.Add('where cod_venda = :cod_venda');

    ParamByName('DTA_VENDA').AsDateTime := Dta_Venda;
    ParamByName('COD_CLIENTE').AsInteger := Cod_Cliente;
    ParamByName('VAL_VENDA').AsFloat := Val_Venda;
    ParamByName('COD_VENDA').AsInteger := ACodigo;

    try
      ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
      sErro := 'Ocorreu um erro ao alterar uma venda!' + sLineBreak + E.Message;
      raise;
      end;
    end
  end;
end;

function TVendaRepository.Excluir(ACodigo: Integer; out sErro: string): Boolean;
begin
  with QryVendas do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'delete from tab_venda where cod_venda = :cod_venda';
    ParamByName('COD_VENDA').AsInteger := ACodigo;

    try
      ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
      sErro := 'Ocorreu um erro ao excluir uma venda!' + sLineBreak + E.Message;
      raise;
      end;
    end
  end;
end;

function TVendaRepository.ExecutarTransacao(AOperacao: TProc; var sErro: string): Boolean;
begin
  Result := False;
  if not Transacao.Connection.Connected then
    Transacao.Connection.Open();

  try
    Transacao.StartTransaction;
    try
      AOperacao;
      Transacao.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Transacao.Rollback;
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
end;

end.

