unit ucadcliente;

interface

{$REGION 'Uses'}
uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastropadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cep.service,
  conexao.service, cliente.model, cliente.controller, cliente.repository, cliente.service, System.UITypes;

{$ENDREGION}

type
  TOperacao = (opInicio, opNovo, opEditar, opNavegar);
  TFrmCadCliente = class(TFrmCadastroPadrao)

{$REGION 'Componentes'}
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BtnPesquisarCep: TSpeedButton;
    EdtCep: TEdit;
    EdtEndereco: TEdit;
    EdtComplemento: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtCodigoCliente: TEdit;
    EdtCpfCnpj: TEdit;
    EdtNome: TEdit;
    EdtDataNascimento: TEdit;
    DbGridClientes: TDBGrid;
    Label3: TLabel;
    PnlPesquisar: TPanel;
    BtnPesquisar: TSpeedButton;
    Label12: TLabel;
    EdtPesquisar: TEdit;
    CbxFiltro: TComboBox;


{$ENDREGION}

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCpfCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDataNascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCepKeyPress(Sender: TObject; var Key: Char);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnPesquisarCepClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CbxFiltroChange(Sender: TObject);
    procedure EdtPesquisarChange(Sender: TObject);
    procedure DbGridClientesDblClick(Sender: TObject);
    procedure DbGridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCpfCnpjChange(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure EdtDataNascimentoChange(Sender: TObject);
    procedure DbGridClientesCellClick(Column: TColumn);


  private
    ValoresOriginais: array of string;
    FCliente: TCliente;
    FClienteController: TClienteController;

    procedure PreencherGridClientes;
    procedure PreencherCamposForm;
    procedure LimpaCamposForm(Form: TForm);
    procedure VerificaBotoes(AOperacao: TOperacao);
    procedure MostrarMensagemErro(AErro: TCampoInvalido);
    function GetDataSource: TDataSource;
    function GravarDados: Boolean;
    function ValidarDados: Boolean;

  public
    FOperacao: TOperacao;
    DsClientes: TDataSource;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  FrmCadCliente: TFrmCadCliente;
  sErro : string;

implementation

{$R *.dfm}

uses untFormat, System.SysUtils, System.JSON;

{ TFrmCadCliente }


constructor TFrmCadCliente.Create(AOwner: TComponent);
begin
  inherited;
  DsClientes := TDataSource.Create(nil);
end;

destructor TFrmCadCliente.Destroy;
begin
  if Assigned(DsClientes) then
    DsClientes.Free;

  inherited Destroy;
end;

procedure TFrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  if TConexao.GetInstance.Connection.TestarConexao then
  begin
    FCliente := TCliente.Create;
    FClienteController := TClienteController.Create(TClienteRepository.Create, TClienteService.Create);
    GetDataSource();
    FOperacao := opInicio;
    SetLength(ValoresOriginais, 10);
  end
  else
  begin
    ShowMessage('N�o foi poss�vel conectar ao banco de dados!');
    Close;
  end;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  PreencherGridClientes();
  DsClientes := FClienteController.GetDataSource();
  VerificaBotoes(FOperacao);
  if EdtPesquisar.CanFocus then
    EdtPesquisar.SetFocus;

end;

procedure TFrmCadCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0)
end;

procedure TFrmCadCliente.PreencherGridClientes;
begin
  FClienteController.PreencherGridClientes(Trim(EdtPesquisar.Text) + '%', CbxFiltro.Text);
  LblTotRegistros.Caption := 'Clientes: ' + InttoStr(DbGridClientes.DataSource.DataSet.RecordCount);
end;

procedure TFrmCadCliente.PreencherCamposForm;
begin
  FClienteController.PreencherCamposForm(FCliente, DsClientes.DataSet.FieldByName('COD_CLIENTE').AsInteger);
  with FCliente do
  begin
    EdtCodigoCliente.Text := IntToStr(Cod_Cliente);
    EdtCpfCnpj.Text := Des_CpfCnpj;
    EdtNome.Text := Des_NomeCliente;
    EdtDataNascimento.Text := DateToStr(Dta_Nascimento);
    EdtCep.Text := Des_Cep;
    EdtEndereco.Text := Des_Endereco;
    EdtComplemento.Text := Des_Complemento;
    EdtBairro.Text := Des_Bairro;
    EdtCidade.Text := Des_Cidade;
    EdtUF.Text := Des_UF;
  end;

  ValoresOriginais[0] := EdtCodigoCliente.Text;
  ValoresOriginais[1] := EdtCpfCnpj.Text;
  ValoresOriginais[2] := EdtNome.Text;
  ValoresOriginais[3] := EdtDataNascimento.Text;
  ValoresOriginais[4] := EdtCep.Text;
  ValoresOriginais[5] := EdtEndereco.Text;
  ValoresOriginais[6] := EdtComplemento.Text;
  ValoresOriginais[7] := EdtBairro.Text;
  ValoresOriginais[8] := EdtCidade.Text;
  ValoresOriginais[9] := EdtUF.Text;
end;

procedure TFrmCadCliente.DbGridClientesCellClick(Column: TColumn);
begin
  inherited;
  FOperacao := opNavegar;
  VerificaBotoes(FOperacao);
end;

procedure TFrmCadCliente.DbGridClientesDblClick(Sender: TObject);
begin
  inherited;
  FOperacao := opNavegar;
  PreencherCamposForm;
  VerificaBotoes(FOperacao);
end;

procedure TFrmCadCliente.DbGridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    PreencherCamposForm();
    VerificaBotoes(FOperacao);
    FOperacao := opEditar;
    BtnAlterarClick(Sender);
    Key := 0;
  end;
end;

procedure TFrmCadCliente.CbxFiltroChange(Sender: TObject);
begin
  inherited;
  BtnPesquisar.Click;
  EdtPesquisar.SetFocus;
end;

procedure TFrmCadCliente.EdtPesquisarChange(Sender: TObject);
begin
  inherited;
  PreencherGridClientes();
end;

procedure TFrmCadCliente.BtnPesquisarClick(Sender: TObject);
begin
  inherited;
  PreencherGridClientes();
end;

procedure TFrmCadCliente.BtnPesquisarCepClick(Sender: TObject);
var FCepService: TCEPService;
    JSONValue: TJSONValue;
    JSONObject: TJSONObject;
    Response: string;
begin
  inherited;
  FCepService := TCEPService.Create;
  try
    if EdtCep.Text = EmptyStr then
    begin
      MessageDlg('O CEP a pesquisar deve ser preenchido!', mtInformation, [mbOK], 0);
      Exit;
    end;

    Response := FCepService.ConsultaCep(EdtCep.Text, True);
    JSONValue := TJSONObject.ParseJSONValue(Response);
    if Assigned(JSONValue) and (JSONValue is TJSONObject) then
    begin
      JSONObject := JSONValue as TJSONObject;
      if JSONObject.GetValue('erro') <> nil then
      begin
        ShowMessage('CEP n�o encontrado!');
        Exit;
      end;

      Formatar(EdtCep, TFormato.CEP);
      EdtEndereco.Text := JSONObject.GetValue<string>('logradouro', '');
      EdtComplemento.Text := JSONObject.GetValue<string>('complemento', '');
      EdtBairro.Text := JSONObject.GetValue<string>('bairro', '');
      EdtCidade.Text := JSONObject.GetValue<string>('localidade', '');
      EdtUf.Text := JSONObject.GetValue<string>('uf', '');
      VerificaBotoes(FOperacao);
    end
    else
      ShowMessage('Erro ao processar a resposta do servi�o de pesquisa do CEP');

  finally
    FreeAndNil(FCepService);
  end;
end;

procedure TFrmCadCliente.BtnInserirClick(Sender: TObject);
begin
  inherited;
  FOperacao := opNovo;
  VerificaBotoes(FOperacao);
  LimpaCamposForm(Self);
  EdtCpfCnpj.SetFocus;
end;

procedure TFrmCadCliente.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  FOperacao := opEditar;
  PreencherCamposForm();
  VerificaBotoes(FOperacao);
end;

procedure TFrmCadCliente.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o cliente selecionado ?',mtConfirmation, [mbYes, mbNo],0) = IDYES then
  begin
    if FClienteController.ExecutarTransacao(
      procedure
      begin
        FClienteController.Excluir(DsClientes.DataSet.FieldByName('COD_CLIENTE').AsInteger, sErro);
      end, sErro) then
      MessageDlg('Cliente exclu�do com sucesso!', mtInformation, [mbOk], 0)
    else
      raise Exception.Create(sErro);

    BtnPesquisar.Click;
  end;
end;

procedure TFrmCadCliente.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if GravarDados() then
  begin
    FOperacao := opNavegar;
    VerificaBotoes(FOperacao);
    LimpaCamposForm(Self);
    BtnPesquisar.Click;
  end;
end;

procedure TFrmCadCliente.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  if FOperacao = opNovo then
  begin
    FOperacao := opInicio;
    LimpaCamposForm(Self);
    EdtPesquisar.Text := EmptyStr;
  end;

  if FOperacao = opEditar then
  begin
    FOperacao := opNavegar;
    EdtCodigoCliente.Text := ValoresOriginais[0];
    EdtCpfCnpj.Text := ValoresOriginais[1];
    EdtNome.Text := ValoresOriginais[2];
    EdtDataNascimento.Text := ValoresOriginais[3];
    EdtCep.Text := ValoresOriginais[4];
    EdtEndereco.Text := ValoresOriginais[5];
    EdtComplemento.Text := ValoresOriginais[6];
    EdtBairro.Text := ValoresOriginais[7];
    EdtCidade.Text := ValoresOriginais[8];
    EdtUF.Text := ValoresOriginais[9];
  end;

  VerificaBotoes(FOperacao);
  EdtPesquisar.SetFocus;
end;

function TFrmCadCliente.GetDataSource: TDataSource;
begin
  DbGridClientes.DataSource := FClienteController.GetDataSource();
end;


function TFrmCadCliente.GravarDados: Boolean;
begin
  Result := False;
  if not ValidarDados then
    Exit;

  with FCliente do
  begin
    Des_CpfCnpj := EdtCpfCnpj.Text;
    Des_NomeCliente := EdtNome.Text;
    if EdtDataNascimento.Text <> EmptyStr then
      Dta_Nascimento := StrToDate(EdtDataNascimento.Text)
    else
      Dta_Nascimento := 0;

    Des_Cep := EdtCep.Text;
    Des_Endereco := EdtEndereco.Text;
    Des_Complemento := EdtComplemento.Text;
    Des_Bairro := EdtBairro.Text;
    Des_Cidade := EdtCidade.Text;
    Des_UF := EdtUF.Text;
  end;

  case FOperacao of
    opNovo:
    begin
      if FClienteController.ExecutarTransacao(
        procedure
        begin
          FClienteController.Inserir(FCliente, sErro);
        end, sErro) then
        MessageDlg('Cliente inclu�do com sucesso!', mtInformation, [mbOk], 0)
      else
        raise Exception.Create(sErro);
    end;

    opEditar:
    begin
      if FClienteController.ExecutarTransacao(
        procedure
        begin
          FClienteController.Alterar(FCliente, StrToInt(EdtCodigoCliente.Text), sErro);
        end, sErro) then
        MessageDlg('Cliente alterado com sucesso!', mtInformation, [mbOk], 0)
      else
        raise Exception.Create(sErro);
    end;
  end;

  Result := True;
  DsClientes.DataSet.Refresh;
  FOperacao := opNavegar;
end;

procedure TFrmCadCliente.LimpaCamposForm(Form: TForm);
var i: Integer;
begin
  for i := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i] is TEdit then
    begin
      TEdit(Form.Components[i]).Text := '';
    end;
  end;
  GrbDados.Enabled := FOperacao in [opNovo, opEditar];
  DBGridClientes.Enabled := FOperacao in [opInicio, opNavegar];
end;

procedure TFrmCadCliente.MostrarMensagemErro(AErro: TCampoInvalido);
begin
  case AErro of
    ciNome:
    begin
      MessageDlg('O nome do cliente deve ser informado!', mtInformation, [mbOK], 0);
      EdtNome.SetFocus;
    end;

    ciCpfCnpj:
    begin
      MessageDlg('O CPF/CNPJ do cliente deve ser informado corretamente!', mtInformation, [mbOK], 0);
      EdtCpfCnpj.SetFocus;
    end;

    ciCpf:
    begin
      MessageDlg('O CPF informado n�o � um CPF v�lido!', mtInformation, [mbOK], 0);
      EdtCpfCnpj.SetFocus;
    end;

    ciCnpj:
    begin
      MessageDlg('O CNPJ informado n�o � um CNPJ v�lido!', mtInformation, [mbOK], 0);
      EdtCpfCnpj.SetFocus;
    end;

    ciCidade:
    begin
      MessageDlg('A cidade do cliente deve ser informada!', mtInformation, [mbOK], 0);
      EdtCidade.SetFocus;
    end;

    ciUF:
    begin
      MessageDlg('A UF do cliente deve ser informada!', mtInformation, [mbOK], 0);
      EdtUF.SetFocus;
    end;
  end;
end;

function TFrmCadCliente.ValidarDados: Boolean;
var LErro: TCampoInvalido;
begin
  Result := FClienteController.ValidarDados(EdtNome.Text, EdtCpfCnpj.Text, EdtCidade.Text, EdtUF.Text, LErro);
  if not Result then
  begin
    MostrarMensagemErro(LErro);
    Exit(False);
  end;

  Result := True;
end;

procedure TFrmCadCliente.VerificaBotoes(AOperacao: TOperacao);
begin
  BtnInserir.Enabled := AOperacao in [opInicio, opNavegar];
  BtnAlterar.Enabled := AOperacao = opNavegar;
  BtnExcluir.Enabled := AOperacao = opNavegar;
  BtnSair.Enabled := AOperacao in [opInicio, opNavegar];
  BtnGravar.Enabled := AOperacao in [opNovo, opEditar];
  BtnCancelar.Enabled := AOperacao in [opNovo, opEditar];
  GrbDados.Enabled := AOperacao in [opNovo, opEditar];
  DbGridClientes.Enabled := AOperacao in [opInicio, opNavegar];
  PnlPesquisar.Enabled := AOperacao in [opInicio, opNavegar];
end;

procedure TFrmCadCliente.EdtCpfCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #08]) then
    key := #0;
end;

procedure TFrmCadCliente.EdtCpfCnpjChange(Sender: TObject);
begin
  inherited;
  Formatar(EdtCpfCnpj, TFormato.CNPJorCPF)
end;


procedure TFrmCadCliente.EdtDataNascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', '/', #08]) then
    key := #0;
end;

procedure TFrmCadCliente.EdtDataNascimentoChange(Sender: TObject);
begin
  inherited;
  Formatar(EdtDataNascimento, TFormato.Dt );
end;

procedure TFrmCadCliente.EdtCepKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #08]) then
    key := #0;
end;

procedure TFrmCadCliente.EdtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    PreencherCamposForm();
    BtnAlterarClick(Sender);
    Key := #0;
  end;
end;

procedure TFrmCadCliente.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
