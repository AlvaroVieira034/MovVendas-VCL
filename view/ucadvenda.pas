unit ucadvenda;

interface

{$REGION 'Uses'}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, UCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Controls, conexao.service, produto.model, produto.controller, produto.repository, produto.service,
  cliente.model, cliente.controller, venda.model, vendaitens.model, venda.controller, venda.repository,
  ivenda.repository, venda.service, ivenda.service, vendaitens.controller, cliente.repository,
  iinterface.repository, cliente.service, iinterface.service, untFormat, upesqvendas, System.Generics.Collections;

{$ENDREGION}

type
  TOperacao = (opInicio, opNovo, opEditar, opNavegar, opErro);
  TFrmCadVenda = class(TFrmCadastroPadrao)

{$REGION 'Componentes'}

    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EdtCodVenda: TEdit;
    EdtDataVenda: TEdit;
    EdtTotalVenda: TEdit;
    Label3: TLabel;
    EdtCodCliente: TEdit;
    LcbxNomeCliente: TDBLookupComboBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtQuantidade: TEdit;
    EdtPrecoUnit: TEdit;
    EdtPrecoTotal: TEdit;
    LCbxProdutos: TDBLookupComboBox;
    BtnAddItemGrid: TButton;
    BtnDelItemGrid: TButton;
    DbGridItensPedido: TDBGrid;
    MTblVendaItem: TFDMemTable;
    MTblVendaItemID_VENDA: TIntegerField;
    MTblVendaItemCOD_VENDA: TIntegerField;
    MTblVendaItemCOD_PRODUTO: TIntegerField;
    MTblVendaItemVAL_QUANTIDADE: TIntegerField;
    DsVendaItem: TDataSource;
    BtnInserirItens: TButton;
    BtnLimpaCampos: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    MTblVendaItemDES_DESCRICAO: TStringField;
    MTblVendaItemVAL_PRECOUNITARIO: TFloatField;
    MTblVendaItemVAL_TOTALITEM: TFloatField;

{$ENDREGION}

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnInserirItensClick(Sender: TObject);
    procedure BtnAddItemGridClick(Sender: TObject);
    procedure BtnDelItemGridClick(Sender: TObject);
    procedure EdtCodClienteExit(Sender: TObject);
    procedure LcbxNomeClienteClick(Sender: TObject);
    procedure EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDataVendaChange(Sender: TObject);
    procedure EdtCodClienteChange(Sender: TObject);
    procedure LCbxProdutosClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoUnitKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoTotalKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLimpaCamposClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtPrecoUnitExit(Sender: TObject);
    procedure EdtPrecoTotalExit(Sender: TObject);
    procedure EdtCodVendaKeyPress(Sender: TObject; var Key: Char);
    procedure DbGridItensPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    ValoresOriginais: array of string;
    TblProdutos: TFDQuery;
    TblClientes: TFDQuery;
    DsProdutos: TDataSource;
    DsClientes: TDataSource;
    FProdutoController: TProdutoController;
    FClienteController: TClienteController;
    FVenda: TVenda;
    FVendaController: TVendaController;
    FVendaItens: TVendaItens;
    FVendaItensController: TVendaItensController;
    TransacaoVendas : TFDTransaction;

    procedure CarregarVendas(ACodVenda: Integer);
    procedure InserirVendaItens;
    function GravarDados: Boolean;
    procedure ExcluirVendas;
    function ValidarDados(ATipoDados: string): Boolean;
    procedure LimpaCamposVenda;
    procedure LimpaCamposItens;
    procedure PreencheCdsVendaItem;
    procedure VerificaBotoes(AOperacao: TOperacao);
    procedure HabilitarBotaoIncluirItens;

  public
    FOperacao: TOperacao;
    pesqVenda: Boolean;
    codigoVenda: Integer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FrmCadVenda: TFrmCadVenda;
  totVenda, totVendaAnt: Double;
  idItem: Integer;
  alterouGrid: Boolean;
  sErro: string;

implementation


{$R *.dfm}

constructor TFrmCadVenda.Create(AOwner: TComponent);
begin
  inherited;
  TblProdutos := TFDQuery.Create(nil);
  TblClientes := TFDQuery.Create(nil);
  DsProdutos := TDataSource.Create(nil);
  DsClientes := TDataSource.Create(nil);
  TransacaoVendas := TFDTransaction.Create(nil);
end;

destructor TFrmCadVenda.Destroy;
begin
  TblProdutos.Free;
  TblClientes.Free;
  DsProdutos.Free;
  DsClientes.Free;
  TransacaoVendas.Free;
  inherited Destroy;
end;

procedure TFrmCadVenda.FormCreate(Sender: TObject);
var sCampo: string;
begin
  inherited;
  if TConexao.GetInstance.Connection.TestarConexao then
  begin
    // Define Transacao pra vendas
    TConexao.GetInstance.Connection.InciarTransacao;
    TransacaoVendas := TConexao.GetInstance.Connection.CriarTransaction;

    // Cria Tabelas
    TblProdutos := TConexao.GetInstance.Connection.CriarQuery;
    TblClientes := TConexao.GetInstance.Connection.CriarQuery;

    // Cria DataSource
    DsClientes := TConexao.GetInstance.Connection.CriarDataSource;
    DsProdutos := TConexao.GetInstance.Connection.CriarDataSource;

    // Atribui DataSet �s tabelas
    DsClientes.DataSet := TblClientes;
    DsProdutos.DataSet := TblProdutos;

    //Instancias Classes
    FProdutoController := TProdutoController.Create(TProdutoRepository.Create, TProdutoService.Create);
    FClienteController := TClienteController.Create(TClienteRepository.Create, TClienteService.Create);
    FVenda := TVenda.Create;
    FVendaController := TVendaController.Create(TVendaRepository.Create, TVendaService.Create);
    FVendaItens := TVendaItens.Create;
    FVendaItensController := TVendaItensController.Create;

    // Vari�veis locais
    sCampo := 'vda.dta_venda';
    totVenda := 0;
    pesqVenda := False;
    SetLength(ValoresOriginais, 4);
    FOperacao := opInicio;
    MTblVendaItem.CreateDataSet;

    // Define configura��o DbLookupComboBox
    LcbxNomeCliente.KeyField := 'cod_cliente';
    LcbxNomeCliente.ListField := 'des_nomecliente';
    LcbxNomeCliente.ListSource := DsClientes;

    LCbxProdutos.KeyField := 'cod_produto';
    LCbxProdutos.ListField := 'des_descricao';
    LCbxProdutos.ListSource := DsProdutos;
  end
  else
  begin
    ShowMessage('N�o foi poss�vel conectar ao banco de dados!');
    Close;
  end;
end;

procedure TFrmCadVenda.FormShow(Sender: TObject);
begin
  inherited;
  totVenda := 0;
  FClienteController.PreencherComboClientes(TblClientes);
  FProdutoController.PreencherComboProdutos(TblProdutos);

  DbGridItensPedido.Columns[0].Width := 320;
  DbGridItensPedido.Columns[1].Width := 90;
  DbGridItensPedido.Columns[2].Width := 115;
  DbGridItensPedido.Columns[3].Width := 115;
  VerificaBotoes(FOperacao);
end;

procedure TFrmCadVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0)
end;

procedure TFrmCadVenda.BtnInserirClick(Sender: TObject);
begin
  inherited;
  MTblVendaItem.Active := False;
  GrbDados.Enabled := True;
  FOperacao := opNovo;
  VerificaBotoes(opNovo);
  LimpaCamposVenda();
  EdtDataVenda.Text := DateToStr(Date);
  EdtDataVenda.SetFocus;
end;

procedure TFrmCadVenda.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  FOperacao := opEditar;
  BtnInserirItens.Caption := 'Alterar Itens';
  BtnInserirItens.Enabled := True;
  GrbDados.Enabled := True;
  EdtDataVenda.Enabled := True;
  EdtCodCliente.Enabled := True;
  LcbxNomeCliente.Enabled := True;
  totVenda := StrToFloat(EdtTotalVenda.Text);
  VerificaBotoes(FOperacao);
  EdtDataVenda.SetFocus;
end;

procedure TFrmCadVenda.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirVendas();
  LimpaCamposVenda();
  MessageDlg('Venda Exclu�da com sucesso!', mtInformation, [mbOK],0);
  MTblVendaItem.Close;
  FOperacao := opInicio;
  VerificaBotoes(FOperacao);
end;

procedure TFrmCadVenda.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if GravarDados() then
  begin
    FOperacao := opInicio;
    VerificaBotoes(FOperacao);
    GrbDados.Enabled := True;
    GrbGrid.Enabled:= False;
    BtnInserirItens.Enabled := False;
  end;
 end;

procedure TFrmCadVenda.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  if FOperacao = opNovo then
  begin
    FOperacao := opInicio;
    LimpaCamposVenda();
    LimpaCamposItens();
    GrbDados.Enabled := True;
    VerificaBotoes(opInicio);
    BtnInserirItens.Enabled := False;
    if MTblVendaItem.Active then
      MTblVendaItem.Close;
  end;

  if FOperacao = opEditar then
  begin
    FOperacao := opNavegar;
    GrbDados.Enabled := True;
    EdtDataVenda.Text := ValoresOriginais[1];
    EdtCodCliente.Text := ValoresOriginais[2];
    EdtTotalVenda.Text := ValoresOriginais[3];
    EdtCodClienteExit(Sender);
    CarregarVendas(0);
  end;
  VerificaBotoes(FOperacao);
  BtnInserirItens.Enabled := False;
end;

procedure TFrmCadVenda.BtnInserirItensClick(Sender: TObject);
begin
  inherited;
  if not ValidarDados('Venda') then
  begin
    Exit;
  end;

  GrbDados.Enabled := False;
  GrbGrid.Enabled := True;
  BtnCancelar.Enabled := True;
  LCbxProdutos.SetFocus;
end;

procedure TFrmCadVenda.BtnAddItemGridClick(Sender: TObject);
begin
  inherited;
  if not ValidarDados('Item') then
  begin
    Exit;
  end
  else
  begin
    PreencheCdsVendaItem();
    LimpaCamposItens;
    LCbxProdutos.SetFocus;
  end;
end;

procedure TFrmCadVenda.BtnDelItemGridClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], mrNo) = mrNo then
    Exit
  else
  begin
    totVenda := totVenda - MTblVendaItemVAL_TOTALITEM.AsFloat;
    MTblVendaItem.Locate('ID_VENDA', MTblVendaItemID_VENDA.AsInteger, []);
    MTblVendaItem.Delete;
    MTblVendaItem.ApplyUpdates(0);
    if totVenda < 0 then
      totVenda := 0;

    EdtTotalVenda.Text := FormatFloat('######0.00', totVenda);
  end;
end;

procedure TFrmCadVenda.BtnLimpaCamposClick(Sender: TObject);
begin
  inherited;
  LimpaCamposVenda();
  MTblVendaItem.Close;
end;

procedure TFrmCadVenda.BtnPesquisarClick(Sender: TObject);
var LCodvenda: Integer;
begin
  inherited;
  pesqVenda := False;

  if TryStrToInt(EdtCodVenda.Text, LCodvenda) then
    LCodvenda := StrToInt(EdtCodVenda.Text)
  else
    LCodvenda := 0;

  if EdtCodVenda.Text = EmptyStr then // Pesquisa atrav�s da janela de pesquisa.
  begin
    if not Assigned(FrmPesquisaVendas) then
      FrmPesquisaVendas := TFrmPesquisaVendas.Create(Self);

    FrmPesquisaVendas.ShowModal;
    FrmPesquisaVendas.Free;
    FrmPesquisaVendas := nil;

    if pesqVenda then
    begin
      CarregarVendas(0);
      ValoresOriginais[0] := EdtCodVenda.Text;
      ValoresOriginais[1] := EdtDataVenda.Text;
      ValoresOriginais[2] := EdtCodCliente.Text;
      ValoresOriginais[3] := EdtTotalVenda.Text;
      EdtCodClienteExit(Sender);

      if FOperacao = opEditar then
        BtnAlterar.Click;

      VerificaBotoes(FOperacao);
    end;
  end;

  if LCodvenda > 0 then  // Pesquisa informando o codigo da venda.
  begin
    CarregarVendas(LCodvenda);
    EdtCodClienteExit(Sender);
    FOperacao := opNavegar;
    VerificaBotoes(FOperacao);
  end;
end;

procedure TFrmCadVenda.CarregarVendas(ACodVenda: Integer);
var Item: TVendaItens;
    ItensVenda: TList<TVendaItens>;
begin
  MTblVendaItem.Close;
  MTblVendaItem.CreateDataSet;

  if ACodVenda > 0 then
    codigoVenda := ACodVenda;

  if not FVendaController.CarregarCampos(FVenda, codigoVenda) then
  begin
    MessageDlg('Venda n�o encontada!', mtInformation, [mbOK], 0);
    LimpaCamposVenda();
    EdtCodVenda.SetFocus;
    Exit;
  end;

  with FVenda do
  begin
    EdtCodVenda.Text := IntToStr(Cod_Venda);
    EdtDataVenda.Text := DateToStr(Dta_Venda);
    EdtCodCliente.Text := IntToStr(Cod_Cliente);
    EdtTotalVenda.Text := FormatFloat('######0.00', Val_Venda);
  end;

  // Carregar os itens da venda usando a controller
  ItensVenda := FVendaItensController.CarregarItensVenda(codigoVenda);
  try
    for Item in ItensVenda do
    begin
      MTblVendaItem.Append;
      MTblVendaItemID_VENDA.AsInteger := Item.Id_Venda;
      MTblVendaItemCOD_VENDA.AsInteger := Item.Cod_Venda;
      MTblVendaItemCOD_PRODUTO.AsInteger := Item.Cod_Produto;
      MTblVendaItemDES_DESCRICAO.AsString := Item.Des_Descricao;
      MTblVendaItemVAL_QUANTIDADE.AsInteger := Item.Val_Quantidade;
      MTblVendaItemVAL_PRECOUNITARIO.AsFloat := Item.Val_PrecoUnitario;
      MTblVendaItemVAL_TOTALITEM.AsFloat := Item.Val_TotalItem;
      MTblVendaItem.Post;
    end;
  finally
    ItensVenda.Free;
  end;
end;

function TFrmCadVenda.GravarDados: Boolean;
begin
  Result := False;
  if not ValidarDados('Venda') then
    Exit;

  if MTblVendaItem.RecordCount = 0 then
  begin
    MessageDlg('N�o existe itens cadastrados para o pedido!', mtWarning, [mbOK],0);
    BtnInserirItens.SetFocus;
    Exit;
  end;

  // Preenche Objeto
  with FVenda do
  begin
    Dta_Venda := StrToDate(EdtDataVenda.Text);
    Cod_Cliente := StrToInt(EdtCodCliente.Text);
    Val_Venda := StrToFloat(
    StringReplace(StringReplace(EdtTotalVenda.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));
  end;

  if not TransacaoVendas.Connection.Connected then
    TransacaoVendas.Connection.Open();

  case FOperacao of
    opNovo:
    begin
      TransacaoVendas.StartTransaction;
      try
        FVendaController.Inserir(FVenda, TransacaoVendas, sErro);
        InserirVendaItens();
        TransacaoVendas.Commit;
        codigoVenda := FVenda.Cod_Venda;
        EdtCodVenda.Text := IntToStr(codigoVenda);
        MessageDlg('Venda inserida com sucesso!', mtInformation, [mbOK],0);
        Result := True;
      except
        on E: Exception do
        begin
          TransacaoVendas.Rollback;
          LimpaCamposItens();
          LimpaCamposVenda();
          MTblVendaItem.Close;
          BtnInserirItens.Enabled := False;
          FOperacao := opErro;
          VerificaBotoes(FOperacao);
          raise Exception.Create(sErro + #13 + E.Message);
        end;
      end;
    end;

    opEditar:
    begin
      TransacaoVendas.StartTransaction;
      try
        // deleta todos os itens da venda
        FVendaItensController.Excluir(StrToInt(EdtCodVenda.Text),  sErro);

        // Insere todos os itens contidos no grid
        InserirVendaItens();

        // ALtera os dados da venda
        FVendaController.Alterar(FVenda, StrToInt(EdtCodVenda.Text), sErro);

        MessageDlg('Venda alterada com sucesso!', mtInformation, [mbOk], 0);
        TransacaoVendas.Commit;
        EdtCodVenda.Text := IntToStr(codigoVenda);
        Result := True;
      except
        on E: Exception do
        begin
          TransacaoVendas.Rollback;
          LimpaCamposItens();
          LimpaCamposVenda();
          MTblVendaItem.Close;
          BtnInserirItens.Enabled := False;
          FOperacao := opErro;
          VerificaBotoes(FOperacao);
          raise Exception.Create(sErro + #13 + E.Message);
        end;
       end;
    end;
  end;

  if TransacaoVendas.Connection.Connected then
    TransacaoVendas.Connection.Close;
end;

procedure TFrmCadVenda.InserirVendaItens;
begin
  MTblVendaItem.First;
  while not MTblVendaItem.eof do
  begin
    with FVendaItens do
    begin
      Cod_Venda := FVenda.Cod_Venda;
      Cod_Produto := MTblVendaItemCOD_PRODUTO.AsInteger;
      Des_Descricao := MTblVendaItemDES_DESCRICAO.AsString;
      Val_PrecoUnitario := MTblVendaItemVAL_PRECOUNITARIO.AsFloat;
      Val_Quantidade := MTblVendaItemVAL_QUANTIDADE.AsInteger;
      Val_TotalItem := MTblVendaItemVAL_TOTALITEM.AsFloat;

      if FVendaItensController.Inserir(FVendaItens, sErro) = false then
        raise Exception.Create(sErro);
    end;
    MTblVendaItem.Next;
  end;
end;

procedure TFrmCadVenda.ExcluirVendas;
var sErro: string;
begin
  if MessageDlg('Deseja realmente excluir a venda selecionada ?',mtConfirmation, [mbYes, mbNo],0) = IDYES then
  begin
    if FVendaController.ExecutarTransacao(
      procedure
      begin
        FVendaItensController.Excluir(StrToInt(EdtCodVenda.Text), sErro);
        FVendaController.Excluir(StrToInt(EdtCodVenda.Text), sErro)
      end, sErro) then
      MessageDlg('Venda exclu�da com sucesso!', mtInformation, [mbOk], 0)
    else
      raise Exception.Create(sErro);
  end;
end;

function TFrmCadVenda.ValidarDados(ATipoDados: string): Boolean;
var AErro: TCampoInvalido;
    LPrecoUnitario, LPrecoTotal: Double;
begin
  Result := False;
  if ATipoDados = 'Venda' then
  begin
    if EdtDataVenda.Text = EmptyStr then
    begin
      MessageDlg('A data da venda deve ser preenchida!', mtInformation, [mbOK], 0);
      EdtDataVenda.SetFocus;
      Exit;
    end;

    if EdtCodCliente.Text = EmptyStr then
    begin
      MessageDlg('O c�digo do cliente deve ser preenchido!', mtInformation, [mbOK], 0);
      EdtCodCliente.SetFocus;
      Exit;
    end;
  end;

  if ATipoDados = 'Item' then
  begin
    if LCbxProdutos.KeyValue = Null then
    begin
      MessageDlg('O produto precisa ser informado!', mtInformation, [mbOK], 0);
      LCbxProdutos.SetFocus;
      Exit;
    end;

    if EdtQuantidade.Text = '' then
    begin
      MessageDlg('A quantidade deve ser preenchida!', mtInformation, [mbOK], 0);
      EdtQuantidade.SetFocus;
      Exit;
    end;

    if StrToFloat(EdtQuantidade.Text) = 0 then
    begin
      MessageDlg('A quantidade n�o pode ser igual a 0!', mtInformation, [mbOK], 0);
      EdtQuantidade.SetFocus;
      Exit;
    end;

    if EdtPrecoUnit.Text = '' then
    begin
      MessageDlg('o pre�o unit�rio deve ser preenchido!', mtInformation, [mbOK], 0);
      EdtPrecoUnit.SetFocus;
      Exit;
    end;

    LPrecoUnitario := StrToFloat(
    StringReplace(StringReplace(EdtPrecoUnit.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));

    if LPrecoUnitario = 0 then
    begin
      MessageDlg('O pre�o unit�rio n�o pode ser igual a 0!', mtInformation, [mbOK], 0);
      EdtPrecoUnit.SetFocus;
      Exit;
    end;

    if EdtPrecoTotal.Text = '' then
    begin
      MessageDlg('o pre�o total deve ser preenchido!', mtInformation, [mbOK], 0);
      EdtPrecoTotal.SetFocus;
      Exit;
    end;

    LPrecoTotal := StrToFloat(
    StringReplace(StringReplace(EdtPrecoTotal.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));

    if LPrecoTotal = 0 then
    begin
      MessageDlg('O pre�o total n�o pode ser igual a 0!', mtInformation, [mbOK], 0);
      EdtPrecoTotal.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TFrmCadVenda.LimpaCamposVenda;
begin
  EdtCodVenda.Text := EmptyStr;
  EdtDataVenda.Text := EmptyStr;
  EdtCodCliente.Text := EmptyStr;
  LcbxNomeCliente.KeyValue := 0;
  EdtTotalVenda.Text := '0.00';
end;

procedure TFrmCadVenda.LcbxNomeClienteClick(Sender: TObject);
begin
  inherited;
  if LCbxNomeCliente.KeyValue > 0 then
    EdtCodCliente.Text := IntToStr(LcbxNomeCliente.KeyValue)
end;

procedure TFrmCadVenda.LimpaCamposItens;
begin
  LCbxProdutos.KeyValue := 0;
  EdtQuantidade.Text := EmptyStr;
  EdtPrecoUnit.Text := EmptyStr;
  EdtPrecoTotal.Text := EmptyStr;
end;

procedure TFrmCadVenda.PreencheCdsVendaItem;
begin
  if not MTblVendaItem.Active then
    MTblVendaItem.Open;

  if alterouGrid then
  begin
    with MTblVendaItem do
    begin
      totVenda := totVenda - totVendaAnt;
      MTblVendaItem.Locate('ID_VENDA', idItem, []);
      MTblVendaItem.Edit;
      try
        MTblVendaItemCOD_PRODUTO.AsInteger := LCbxProdutos.KeyValue;
        MTblVendaItemDES_DESCRICAO.AsString := LCbxProdutos.Text;
        MTblVendaItemVAL_QUANTIDADE.AsInteger := StrToInt(EdtQuantidade.Text);
        MTblVendaItemVAL_PRECOUNITARIO.AsFloat := StrToFloat(StringReplace(StringReplace(EdtPrecoUnit.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));
        MTblVendaItemVAL_TOTALITEM.AsFloat := StrToFloat(StringReplace(StringReplace(EdtPrecoTotal.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));
        MTblVendaItem.Post;
        totVenda := totVenda + MTblVendaItemVAL_TOTALITEM.AsFloat;
        EdtTotalVenda.Text := FormatFloat('######0.00', totVenda);
      except
        MTblVendaItem.Cancel;
        raise;
      end;
    end;
  end
  else
  begin
    with MTblVendaItem do
    begin
      MTblVendaItem.Append;
      try
        MTblVendaItemCOD_PRODUTO.AsInteger := LCbxProdutos.KeyValue;
        MTblVendaItemDES_DESCRICAO.AsString := LCbxProdutos.Text;
        MTblVendaItemVAL_QUANTIDADE.AsInteger := StrToInt(EdtQuantidade.Text);
        MTblVendaItemVAL_PRECOUNITARIO.AsFloat := StrToFloat(StringReplace(StringReplace(EdtPrecoUnit.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));
        MTblVendaItemVAL_TOTALITEM.AsFloat := StrToFloat(StringReplace(StringReplace(EdtPrecoTotal.Text, '.', '', [rfReplaceAll]), ',', FormatSettings.DecimalSeparator, [rfReplaceAll]));
        MTblVendaItem.Post;
        totVenda := totVenda + MTblVendaItemVAL_TOTALITEM.AsFloat;
        EdtTotalVenda.Text := FormatFloat('######0.00', totVenda);
      except
        MTblVendaItem.Cancel;
        raise;
      end;
    end;
  end;
end;

procedure TFrmCadVenda.VerificaBotoes(AOperacao: TOperacao);
begin
  BtnInserir.Enabled := AOperacao in [opInicio, opNavegar];
  BtnAlterar.Enabled := AOperacao = opNavegar;
  BtnExcluir.Enabled := AOperacao = opNavegar;
  BtnSair.Enabled := AOperacao in [opInicio, opNavegar, opErro];

  BtnGravar.Enabled := AOperacao in [opNovo, opEditar];
  BtnCancelar.Enabled := AOperacao in [opNovo, opEditar];

  BtnPesquisar.Enabled := AOperacao in [opInicio, opNavegar];
  BtnLimpaCampos.Enabled := EdtCodVenda.Enabled;

  EdtCodVenda.Enabled := AOperacao in [opInicio, opNavegar];
  EdtDataVenda.Enabled := AOperacao in [opNovo, opEditar];
  EdtCodCliente.Enabled := AOperacao in [opNovo, opEditar];
  LcbxNomeCliente.Enabled := AOperacao in [opNovo, opEditar];
  GrbGrid.Enabled := AOperacao in [opNovo, opEditar];
end;

procedure TFrmCadVenda.HabilitarBotaoIncluirItens;
begin
  if (FOperacao = opNovo) then
    BtnInserirItens.Enabled := (EdtDataVenda.Text <> '') and (EdtCodCliente.Text <> '');
end;

procedure TFrmCadVenda.LCbxProdutosClick(Sender: TObject);
var LPrecoUnitario: Double;
begin
  inherited;
  LPrecoUnitario := FProdutoController.GetValorUnitario(LCbxProdutos.KeyValue);
  EdtPrecoUnit.Text := FormatFloat('######0.00', LPrecoUnitario);
  EdtQuantidade.Text := '1';
  EdtQuantidade.SetFocus;
end;

procedure TFrmCadVenda.EdtDataVendaChange(Sender: TObject);
begin
  inherited;
  Formatar(EdtDataVenda, TFormato.Dt);
  HabilitarBotaoIncluirItens();
end;

procedure TFrmCadVenda.EdtPrecoTotalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadVenda.EdtPrecoTotalExit(Sender: TObject);
var LValor: Double;
begin
  inherited;
  if TryStrToFloat(EdtPrecoTotal.Text, LValor) then
    EdtPrecoTotal.Text := FormatFloat('######0.00', LValor)

end;

procedure TFrmCadVenda.EdtPrecoUnitKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadVenda.EdtPrecoUnitExit(Sender: TObject);
var LValor: Double;
begin
  inherited;
  if TryStrToFloat(EdtPrecoUnit.Text, LValor) then
    EdtPrecoUnit.Text := FormatFloat('######0.00', LValor)

 end;

procedure TFrmCadVenda.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadVenda.EdtQuantidadeExit(Sender: TObject);
var LValorItem, LPrecoUnit: Double;
    LQuantidade: Integer;
begin
  inherited;
  if (EdtQuantidade.Text = EmptyStr) or (StrToInt(EdtQuantidade.Text) = 0) then
  begin
    MessageDlg('Informe um valor v�lido para Quantidade!', mtInformation, [mbOK], 0);
    if EdtQuantidade.CanFocus then
      EdtQuantidade.SetFocus;

    Exit;
  end;

  if not TryStrToFloat(EdtPrecoUnit.Text, LPrecoUnit) then
    LPrecoUnit := 0;

  EdtPrecoUnit.Text := FormatFloat('######0.00', LPrecoUnit);

  if not TryStrToInt(EdtQuantidade.Text, LQuantidade) then
  begin
    LQuantidade := 1;
    EdtQuantidade.Text := '1';
  end;

  LValorItem := (StrToInt(EdtQuantidade.Text) * StrToFloat(EdtPrecoUnit.Text));
  EdtPrecoTotal.Text := FormatFloat('#0.00', LValorItem);
end;

procedure TFrmCadVenda.DbGridItensPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    LCbxProdutos.KeyValue := MTblVendaItemCOD_PRODUTO.AsInteger;
    EdtQuantidade.Text := IntToStr(MTblVendaItemVAL_QUANTIDADE.AsInteger);
    EdtPrecoUnit.Text := FloatToStr(MTblVendaItemVAL_PRECOUNITARIO.AsFloat);
    EdtPrecoTotal.Text := FloatToStr(MTblVendaItemVAL_TOTALITEM.AsFloat);
    alterouGrid := True;
    idItem := MTblVendaItemID_VENDA.AsInteger;
    totVendaAnt := MTblVendaItemVAL_TOTALITEM.AsFloat;
    Key := 0;
  end;

  if Key = VK_DELETE then
  begin
   BtnDelItemGridClick(Sender);
  end;
end;

procedure TFrmCadVenda.EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadVenda.EdtCodVendaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadVenda.EdtCodClienteExit(Sender: TObject);
begin
  inherited;
  if EdtCodCliente.Text <> '' then
    LCbxNomeCliente.KeyValue := StrToInt(EdtCodCliente.Text);
end;

procedure TFrmCadVenda.EdtCodClienteChange(Sender: TObject);
begin
  inherited;
  HabilitarBotaoIncluirItens();
end;

procedure TFrmCadVenda.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
