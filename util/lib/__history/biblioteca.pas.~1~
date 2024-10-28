unit Biblioteca;

interface

{$REGION 'Uses'}

uses System.SysUtils, REST.Client, REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, IdHTTP,

  //Units Necessárias
  IniFiles,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdBaseComponent,
  IdMessage,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdAttachmentFile,
  IdText;

{$ENDREGION}

type
  TDadosCep = Record
     sucesso: boolean;
     msg: string;
     cep: string;
     logradouro: string;
     complemento: string;
     bairro: string;
     localidade: string;
     uf: string;
     ibge: string;
     gia: string;
     ddd: string;
     siafi: string;
     jsonCompleto: string;
  End;

  const BaseURLCep = 'http://viacep.com.br/ws';

  function CarregarCep(cep: String): TDadosCep;
  function CarregarCepIndy(cep: String): TDadosCep;
  function JsonFieldToString(nomeCampo: string; jsonBusca: TJSonValue): string;
  function SoNumeros(str: string): string;
  function ValidarCPF(const CPF: string): Boolean;
  function ValidarCNPJ(const CNPJ: string): Boolean;

implementation

uses FireDAC.Comp.Client;

function CarregarCep(cep: String): TDadosCep;
var
   json: TJSonValue;

   RESTClient   : TRESTClient;
   RESTRequest  : TRESTRequest;
   RESTResponse : TRESTResponse;
begin
   Result.sucesso := False;

   if trim(cep) = EmptyStr then
      exit;

   RESTClient := TRESTClient.Create(nil);
   RESTRequest := TRESTRequest.Create(nil);
   RESTResponse := TRESTResponse.Create(nil);
   try
       RESTClient.BaseURL := BaseURLCep;
       RESTClient.Accept  := 'application/json';
       RESTClient.AcceptCharSet := 'UTF-8';
       RESTClient.ContentType   := 'application/json';

       RESTRequest.Method := TRESTRequestMethod.rmGET;
       RESTRequest.Client := RESTClient;

       RESTRequest.Response := RESTResponse;
       RESTRequest.Accept := 'application/json';
       RESTRequest.Resource := cep + '/json';
       RESTRequest.Execute;
       try
           if RESTResponse.StatusCode <> 200 then
           begin
              Result.sucesso := False;
              Result.msg := 'CEP não localizado';
              exit;
           end;

           Result.jsonCompleto := RESTResponse.Content;

           if Result.jsonCompleto = EmptyStr then
           begin
              Result.sucesso := False;
              Result.msg := 'Não foi possível obter o retorno';
              exit;
           end;

           json := TJSonObject.ParseJSONValue(Result.jsonCompleto);
           try
              Result.cep :=  JsonFieldToString('cep',  json);
              Result.logradouro :=  JsonFieldToString('logradouro',  json);
              Result.complemento :=  JsonFieldToString('complemento',  json);
              Result.bairro :=  JsonFieldToString('bairro',  json);
              Result.localidade :=  JsonFieldToString('localidade',  json);
              Result.uf :=  JsonFieldToString('uf',  json);
              Result.ibge :=  JsonFieldToString('ibge', json);
              Result.gia :=  JsonFieldToString('gia', json);
              Result.ddd :=  JsonFieldToString('ddd',  json);
              Result.siafi :=  JsonFieldToString('siafi', json);
              Result.sucesso := True;

              if trim(Result.logradouro) = EmptyStr then
              begin
                Result.msg := 'CEP não localizado.';
                Result.sucesso := False;
              end;
           finally
              FreeAndNil(json);
           end;
       except on E: Exception do
         begin
            Result.sucesso := False;
            Result.msg := 'Ocorreu um  erro ao consultar o cep. Erro:' + E.Message;
         end;
       end;
   finally
      FreeAndNil(RESTClient);
      FreeAndNil(RESTRequest);
      FreeAndNil(RESTResponse);
   end;
end;

// Acessando WebService Utilizando Indy
function CarregarCepIndy(cep: String): TDadosCep;
var
   json: TJSonValue;
   lHTTP: TIdHTTP;
begin
   Result.sucesso := False;

   if trim(cep) = EmptyStr then
      exit;

   try
       lHTTP := TIdHTTP.Create;
       try
         Result.jsonCompleto := lHTTP.Get(BaseURLCep + '/' + cep + '/json');

         if Result.jsonCompleto = EmptyStr then
         begin
            Result.sucesso := False;
            Result.msg := 'Não foi possível obter o retorno';
            exit;
         end;

         json := TJSonObject.ParseJSONValue(Result.jsonCompleto);
         try
            Result.cep :=  JsonFieldToString('cep',  json);
            Result.logradouro :=  JsonFieldToString('logradouro',  json);
            Result.complemento :=  JsonFieldToString('complemento',  json);
            Result.bairro :=  JsonFieldToString('bairro',  json);
            Result.localidade :=  JsonFieldToString('localidade',  json);
            Result.uf :=  JsonFieldToString('uf',  json);
            Result.ibge :=  JsonFieldToString('ibge', json);
            Result.gia :=  JsonFieldToString('gia', json);
            Result.ddd :=  JsonFieldToString('ddd',  json);
            Result.siafi :=  JsonFieldToString('siafi', json);
            Result.sucesso := True;

            if trim(Result.logradouro) = EmptyStr then
            begin
               Result.msg := 'CEP não localizado.';
               Result.sucesso := False;
            end;
         finally
            FreeAndNil(json);
         end;
       except on E: Exception do
         begin
            Result.sucesso := False;
            Result.msg := 'Ocorreu um  erro ao consultar o cep. Erro:' + E.Message;
         end;
       end;
   finally
      FreeAndNil(lHTTP)
   end;
end;

function JsonFieldToString(nomeCampo: string; jsonBusca: TJSonValue): string;
begin
  try
    Result := jsonBusca.GetValue<string>(nomeCampo);
  except on E: Exception do
    Result := '';
  end;
end;

function SoNumeros(str: string): string;
var
i: Integer;
d1: string;
begin
  for i := 1 to Length(str) do
  begin
    if Pos(Copy(str, i, 1), '/-.') = 0 then
    d1 := d1 + Copy(str, i, 1);
  end;
  Result := d1;
end;

function ValidarCPF(const CPF: string): Boolean;
var
  Soma, Resto, DigitoVerificador: Integer;
  I: Integer;
begin
  Result := False;

  if Length(CPF) <> 11 then
    Exit;

  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(CPF[I]) * (11 - I);

  Resto := (Soma * 10) mod 11;
  if (Resto = 10) or (Resto = StrToInt(CPF[10])) then
  begin
    Soma := 0;
    for I := 1 to 10 do
      Soma := Soma + StrToInt(CPF[I]) * (12 - I);

    Resto := (Soma * 10) mod 11;
    if (Resto = 10) or (Resto = StrToInt(CPF[11])) then
      Result := True;
  end;
end;

function ValidarCNPJ(const CNPJ: string): Boolean;
var dig13, dig14: string;
    sm, i, r, peso: integer;
begin
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14)) then
  begin
    ValidarCNPJ := false;
    exit;
  end;

  // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
    { *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      // StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11-r):1, dig13); // converte um número no respectivo caractere numérico

    { *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
      ValidarCNPJ := true
    else
      ValidarCNPJ := false;
  except
    ValidarCNPJ := false
  end;
end;




end.
