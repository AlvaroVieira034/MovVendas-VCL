unit venda.model;

interface

uses umain, System.SysUtils, FireDAC.Comp.Client;

Type
  TVenda = class
  private
    FCod_Venda: Integer;
    FDta_Venda: TDateTime;
    FDes_NomeCliente: string;
    FDes_Cep: string;
    FDes_Endereco: string;
    FDes_Complemento: string;
    FDes_Bairro: string;
    FDes_Cidade: string;
    FDes_Estado: string;
    FVal_TotalVenda: Double;
    procedure SetDes_NomeCliente(const Value: string);

  public
    procedure Pesquisar(TblVendas: TFDQuery; sNome, campoIndice: string);
    procedure Carregar(QryVendas: TFDQuery; FVenda: TVenda;  iCodigo: Integer);
    function Inserir(QryVendas: TFDQuery; FVenda: TVenda; out sErro: string): Boolean;
    function Alterar(QryVendas: TFDQuery; FVenda: TVenda; iCodigo: Integer; out sErro: string): Boolean;
    function Excluir(QryVendas: TFDQuery; iCodigo: Integer; out sErro : string): Boolean;

    property Cod_Venda: Integer read FCod_Venda write FCod_Venda;
    property Dta_Venda: TDateTime read FDta_Venda write FDta_Venda;
    property Des_NomeCliente: string read FDes_NomeCliente write SetDes_NomeCliente;
    property Des_Cep: string read FDes_Cep write FDes_Cep;
    property Des_Endereco: string read FDes_Endereco write FDes_Endereco;
    property Des_Complemento: string read FDes_Complemento write FDes_Complemento;
    property Des_Bairro: string read FDes_Bairro write FDes_Bairro;
    property Des_Cidade: string read FDes_Cidade write FDes_Cidade;
    property Des_Estado: string read FDes_Estado write FDes_Estado;
    property Val_TotalVenda: Double read FVal_TotalVenda write FVal_TotalVenda;

  end;

implementation

{ TVenda }

procedure TVenda.Pesquisar(TblVendas: TFDQuery; sNome, campoIndice: string);
begin
  with TblVendas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select vda.cod_venda, ');
    SQL.Add('vda.dta_venda, ');
    SQL.Add('vda.des_nomecliente, ');
    SQL.Add('vda.des_cep, ');
    SQL.Add('vda.des_endereco, ');
    SQL.Add('vda.des_complemento, ');
    SQL.Add('vda.des_bairro, ');
    SQL.Add('vda.des_cidade, ');
    SQL.Add('vda.des_estado, ');
    SQL.Add('vda.val_total_venda');
    SQL.Add('from tab_venda vda');
    SQL.Add('where ' + campoIndice + ' like :pNOME');
    SQL.Add('order by vda.dta_venda desc');
    ParamByName('PNOME').AsString := sNome;
    Prepared := True;
    Open();
    //TblVendas.Active := True;
  end;
end;

procedure TVenda.Carregar(QryVendas: TFDQuery; FVenda: TVenda; iCodigo: Integer);
begin
  with QryVendas do
  begin
    SQL.Clear;
    SQL.Add('select vda.cod_venda, ');
    SQL.Add('vda.dta_venda, ');
    SQL.Add('vda.des_nomecliente, ');
    SQL.Add('vda.des_cep, ');
    SQL.Add('vda.des_endereco, ');
    SQL.Add('vda.des_complemento, ');
    SQL.Add('vda.des_bairro, ');
    SQL.Add('vda.des_cidade, ');
    SQL.Add('vda.des_estado, ');
    SQL.Add('vda.val_total_venda as val_tot_venda ');
    SQL.Add('from tab_venda vda');
    SQL.Add('where vda.cod_venda = :cod_venda');
    SQL.Add('order by vda.dta_venda desc');
    ParamByName('COD_VENDA').AsInteger := iCodigo;
    Open();

    with FVenda, QryVendas do
    begin
      Cod_Venda := FieldByName('COD_VENDA').AsInteger;
      Dta_Venda := FieldByName('DTA_VENDA').AsDateTime;
      Des_NomeCliente := FieldByName('DES_NOMECLIENTE').AsString;
      Des_Cep := FieldByName('DES_CEP').AsString;
      Des_Endereco := FieldByName('DES_ENDERECO').AsString;
      Des_Complemento := FieldByName('DES_COMPLEMENTO').AsString;
      Des_Bairro := FieldByName('DES_BAIRRO').AsString;
      Des_Cidade := FieldByName('DES_CIDADE').AsString;
      Des_Estado := FieldByName('DES_ESTADO').AsString;
      Val_TotalVenda := FieldByName('VAL_TOT_VENDA').AsFloat;
    end;
  end;
end;

function TVenda.Inserir(QryVendas: TFDQuery; FVenda: TVenda; out sErro: string): Boolean;
begin
  with QryVendas, FVenda do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into tab_venda(');
    SQL.Add('dta_venda, ');
    SQL.Add('des_nomecliente, ');
    SQL.Add('des_cep, ');
    SQL.Add('des_endereco, ');
    SQL.Add('des_complemento, ');
    SQL.Add('des_bairro, ');
    SQL.Add('des_cidade, ');
    SQL.Add('des_estado, ');
    SQL.Add('val_total_venda) ');
    SQL.Add('values (:dta_venda, ');
    SQL.Add(':des_nomecliente, ');
    SQL.Add(':des_cep, ');
    SQL.Add(':des_endereco, ');
    SQL.Add(':des_complemento, ');
    SQL.Add(':des_bairro, ');
    SQL.Add(':des_cidade, ');
    SQL.Add(':des_estado, ');
    SQL.Add(':val_total_venda)');

    ParamByName('DTA_VENDA').AsDateTime := Dta_Venda;
    ParamByName('DES_NOMECLIENTE').AsString := Des_NomeCliente;
    ParamByName('DES_CEP').AsString := Des_Cep;
    ParamByName('DES_ENDERECO').AsString := Des_Endereco;
    ParamByName('DES_COMPLEMENTO').AsString := Des_Complemento;
    ParamByName('DES_BAIRRO').AsString := Des_Bairro;
    ParamByName('DES_CIDADE').AsString := Des_Cidade;
    ParamByName('DES_ESTADO').AsString := Des_Estado;
    ParamByName('VAL_TOTAL_VENDA').AsFloat := Val_TotalVenda;

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
        Result := False;
        sErro := 'Ocorreu um erro ao inserir uma nova venda!' + sLineBreak + E.Message;
        raise;
      end;
    end;
  end;
end;

function TVenda.Alterar(QryVendas: TFDQuery; FVenda: TVenda; iCodigo: Integer; out sErro: string): Boolean;
begin
  with QryVendas, FVenda do
  begin
    Result := False;
    Close;
    SQL.Clear;
    SQL.Add('update tab_venda set ');
    SQL.Add('dta_venda = :dta_venda, ');
    SQL.Add('des_nomecliente = :des_nomecliente, ');
    SQL.Add('des_cep = :des_cep, ');
    SQL.Add('des_endereco = :des_endereco, ');
    SQL.Add('des_complemento = :des_complemento, ');
    SQL.Add('des_bairro = :des_bairro, ');
    SQL.Add('des_cidade = :des_cidade, ');
    SQL.Add('des_estado = :des_estado, ');
    SQL.Add('val_total_venda = :val_total_venda');
    SQL.Add('where cod_venda = :cod_venda');

    ParamByName('DTA_VENDA').AsDateTime := Dta_Venda;
    ParamByName('DES_NOMECLIENTE').AsString := Des_NomeCliente;
    ParamByName('DES_CEP').AsString := Des_Cep;
    ParamByName('DES_ENDERECO').AsString := Des_Endereco;
    ParamByName('DES_COMPLEMENTO').AsString := Des_Complemento;
    ParamByName('DES_BAIRRO').AsString := Des_Bairro;
    ParamByName('DES_CIDADE').AsString := Des_Cidade;
    ParamByName('DES_ESTADO').AsString := Des_Estado;
    ParamByName('VAL_TOTAL_VENDA').AsFloat := Val_TotalVenda;
    ParamByName('COD_VENDA').AsInteger := iCodigo;

    try
      Prepared := True;
      ExecSQL();
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar os dados da venda!' + sLineBreak + E.Message;
        Result := False;
        raise;
      end;
    end;
    Result:= True;
  end;
end;

function TVenda.Excluir(QryVendas: TFDQuery; iCodigo: Integer; out sErro: String): Boolean;
begin
  with QryVendas do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'delete from tab_venda where cod_venda = :cod_venda';
    ParamByName('COD_VENDA').AsInteger := iCodigo;

    try
      Prepared := True;
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir a venda !' + sLineBreak + E.Message;
        Result := False;
        raise;
      end;
    end;
  end;
end;

procedure TVenda.SetDes_NomeCliente(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('O campo ''Nome do Cliente'' precisa ser preenchido !');

  FDes_NomeCliente := Value;
end;


end.
