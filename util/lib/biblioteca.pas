unit biblioteca;

interface

{$REGION 'Uses'}

uses System.SysUtils;

{$ENDREGION}

  const BaseURLCep = 'http://viacep.com.br/ws';

  function SoNumeros(str: string): string;
  function ValidarCPF(const CPF: string): Boolean;
  function ValidarCNPJ(const CNPJ: string): Boolean;

implementation

uses FireDAC.Comp.Client;

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
