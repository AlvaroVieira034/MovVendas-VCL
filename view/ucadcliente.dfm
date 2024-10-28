inherited FrmCadCliente: TFrmCadCliente
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 649
  ClientWidth = 704
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 720
  ExplicitHeight = 688
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTopo: TPanel
    Width = 704
    ExplicitWidth = 704
    inherited BtnInserir: TSpeedButton
      Left = 13
      Width = 108
      OnClick = BtnInserirClick
      ExplicitLeft = 13
      ExplicitWidth = 108
    end
    inherited BtnAlterar: TSpeedButton
      Left = 126
      Width = 108
      OnClick = BtnAlterarClick
      ExplicitLeft = 126
      ExplicitWidth = 108
    end
    inherited BtnExcluir: TSpeedButton
      Left = 239
      Width = 108
      OnClick = BtnExcluirClick
      ExplicitLeft = 239
      ExplicitWidth = 108
    end
    inherited BtnGravar: TSpeedButton
      Left = 352
      Width = 108
      OnClick = BtnGravarClick
      ExplicitLeft = 352
      ExplicitWidth = 108
    end
    inherited BtnCancelar: TSpeedButton
      Left = 465
      Width = 108
      OnClick = BtnCancelarClick
      ExplicitLeft = 465
      ExplicitWidth = 108
    end
    inherited BtnSair: TSpeedButton
      Left = 578
      Width = 108
      OnClick = BtnSairClick
      ExplicitLeft = 578
      ExplicitWidth = 108
    end
  end
  inherited PnlDados: TPanel
    Left = 0
    Top = 65
    Width = 704
    Height = 279
    Align = alTop
    ExplicitLeft = 0
    ExplicitTop = 65
    ExplicitWidth = 704
    ExplicitHeight = 279
    inherited GrbDados: TGroupBox
      Left = 10
      Top = 6
      Width = 682
      Height = 263
      Caption = ' Dados do Cliente '
      ExplicitLeft = 10
      ExplicitTop = 6
      ExplicitWidth = 682
      ExplicitHeight = 263
      object Label1: TLabel
        Left = 170
        Top = 117
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label4: TLabel
        Left = 12
        Top = 162
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label5: TLabel
        Left = 356
        Top = 162
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label6: TLabel
        Left = 12
        Top = 208
        Width = 39
        Height = 13
        Caption = 'Cidade*'
      end
      object Label7: TLabel
        Left = 356
        Top = 208
        Width = 19
        Height = 13
        Caption = 'UF*'
      end
      object Label8: TLabel
        Left = 12
        Top = 25
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label9: TLabel
        Left = 489
        Top = 25
        Width = 54
        Height = 13
        Caption = 'CPF/CNPJ*'
      end
      object Label10: TLabel
        Left = 12
        Top = 71
        Width = 33
        Height = 13
        Caption = 'Nome*'
      end
      object Label11: TLabel
        Left = 489
        Top = 70
        Width = 91
        Height = 13
        Caption = 'Data de Nacimento'
      end
      object BtnPesquisarCep: TSpeedButton
        Left = 115
        Top = 134
        Width = 28
        Height = 22
        Hint = 'Pesquisar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FA
          FB5B6E8E425672856F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAFBFC7989A263AECF56B0E227416AFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE788BA960A8
          CC73DAFE1980D5556F97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF4F6F97894B45FAED374D8FE187FD35376A4ECEEF2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAB6C94096CA74D7FE1982
          D8517DB1ECEFF3FFFFFFFFFFFFFFFFFFD9D2D39C867F957E6B9B8671937D73AD
          9D9CD8CFCEA59A9D3C75A7197DD25387C1F0F3F7FFFFFFFFFFFFFFFFFFBCAEAE
          A68361F2DE97FEFEB2FEFEC3FEFED7DCD3BC866D688D6D6A9B9AA486AED8EBF1
          F7FFFFFFFFFFFFFFFFFFD5CDCEA57D59FEE996FEEC9EFDF7AEFDFEC4FDFDD6FE
          FEF2F0EDE3846966DAD1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8076F0C57A
          FBD687FBE195FDF8B0FDFEC2FDFDD6FDFDE8FEFEFECABEB0C3B6B6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA67A5BFED784F8D68CFBE69CFCF6B2FDFEC9FDFDCEFD
          FDDBFDFDE1FCFBDBA3918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB855AFBD283
          F8DC8FF9E39EFBEDA8FDFBC2FDFDCCFDFDC8FDFDCEFEFED2A6928CFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB18362FDCC79FBEB9FFDFED0FCF8D8FCEEABFDFBBEFD
          FDB6FDFEBCFCFBB9B09F97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5998BF2B66A
          FCE395FDFDBEFDFED1FBE9A6FCF1A8FBEB9EFEFBABE1D39ACEC4C2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDCD4D3CB9264FDC875FBE698FBEEA3FBE69AF6D689FC
          DE8FFBE396BFA792F3F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDCFC2BF
          D29A6BF2B86CF9CC7BF9D182FBD07DF1CA83CAAE92E3DCDCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE3DCDBCBB0A0D2A57DD8AA7DCEAE90D1
          C1B8F0EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPesquisarCepClick
      end
      object Label3: TLabel
        Left = 12
        Top = 119
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object EdtCep: TEdit
        Left = 8
        Top = 135
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 4
        OnKeyPress = EdtCepKeyPress
      end
      object EdtEndereco: TEdit
        Left = 170
        Top = 135
        Width = 472
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 5
      end
      object EdtComplemento: TEdit
        Left = 12
        Top = 180
        Width = 319
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 6
      end
      object EdtBairro: TEdit
        Left = 356
        Top = 180
        Width = 289
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 7
      end
      object EdtCidade: TEdit
        Left = 12
        Top = 226
        Width = 319
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 8
      end
      object EdtUF: TEdit
        Left = 356
        Top = 226
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 9
      end
      object EdtCodigoCliente: TEdit
        Left = 12
        Top = 43
        Width = 106
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 9
        TabOrder = 0
      end
      object EdtCpfCnpj: TEdit
        Left = 489
        Top = 43
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 18
        TabOrder = 1
        OnChange = EdtCpfCnpjChange
        OnKeyPress = EdtCpfCnpjKeyPress
      end
      object EdtNome: TEdit
        Left = 12
        Top = 88
        Width = 447
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 2
      end
      object EdtDataNascimento: TEdit
        Left = 489
        Top = 88
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 3
        OnChange = EdtDataNascimentoChange
        OnKeyPress = EdtDataNascimentoKeyPress
      end
    end
  end
  inherited PnlGrid: TPanel
    Left = 0
    Top = 344
    Width = 704
    Height = 305
    Align = alClient
    ExplicitLeft = 0
    ExplicitTop = 344
    ExplicitWidth = 704
    ExplicitHeight = 305
    inherited LblTotRegistros: TLabel
      Left = 611
      Top = 249
      ExplicitLeft = 611
      ExplicitTop = 249
    end
    inherited GrbGrid: TGroupBox
      Left = 10
      Width = 682
      Height = 237
      Caption = ' Clientes Cadastrados '
      ExplicitLeft = 10
      ExplicitWidth = 682
      ExplicitHeight = 237
      object DbGridClientes: TDBGrid
        Left = 9
        Top = 21
        Width = 662
        Height = 204
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DbGridClientesCellClick
        OnDblClick = DbGridClientesDblClick
        OnKeyDown = DbGridClientesKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'cod_cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_nomecliente'
            Title.Caption = 'Nome do Cliente'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_cpfcnpj'
            Title.Alignment = taCenter
            Title.Caption = 'Cpf/Cnpj'
            Width = 94
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'des_cep'
            Title.Alignment = taCenter
            Title.Caption = 'CEP'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_endereco'
            Title.Caption = 'Endere'#231'o'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_complemento'
            Title.Caption = 'Complemento'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_cidade'
            Title.Caption = 'Cidade'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'des_bairro'
            Title.Caption = 'Bairro'
            Width = 146
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'des_uf'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dta_nascimento'
            Title.Caption = 'Nascimento'
            Visible = False
          end>
      end
    end
    object PnlPesquisar: TPanel
      Left = 1
      Top = 267
      Width = 702
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object BtnPesquisar: TSpeedButton
        Left = 589
        Top = 1
        Width = 86
        Height = 27
        Caption = '&Pesquisar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFCCCCCCCCCCCCF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC497FAA4980ACB1BDC6CFCFCFCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC407F
          AF1EAAFF5AC8FF4593C7BB8825B67E0EB57B09B67E0DB88113BB8211B6831B90
          7E5B7A7A7C7B79787B79788F816B72A1C558C8FFBAF2FF4193CCB67E0EFFFFFF
          FFFFFFFFFFFFB47800F0EEF481848DB6B9BEE4E8ECE2E5EAE4E6EAB8B7B7827A
          76CFE3ED3290D4FFFFFFB47B09FFFFFFFFFFFFFFFFFFC99A3B928267B9BBBFE8
          DDCEEEC57DF6D789FCE49AECE7D8BBBABC9B9084FFFFFFFFFFFFB47A07FFFFFF
          FFFFFFFFFFFFFFFFFF7B7A7CF0F3F8E7B572F0CF92F6DC94FFEFA4FBE499F0F2
          F8818288FFFFFFFFFFFFB47A08FFFFFFFFFFFFFFFFFFE1CAB07F7F81F5F9FEEB
          C696F5E1BEF3DAA0F6DB94F4D587F5F9FF868587FFFFFFFFFFFFB47B08FFFFFF
          D5BB9DDAC3A8B65A0084888CFEFFFFE3B076FAF2E4F4E1BDEFCE91ECC37CFEFF
          FF8A898BFFFFFFFFFFFFB47B08FFFFFFFFFFF7FFFFFFB65E06A9A39BCED2D5F6
          E3CFE2B074E9C494E5B571F8EBD7CFD1D79C8A67FFFFFFFFFFFFB47B09FFFFFF
          D6B892DBC1A1B5600ACBA2748F9093D3D7DCFFFFFFFFFFFFFFFFFFD1D3D79293
          9CB7821AFFFFFFFFFFFFB47B08FFFFFFFFFBE4FFFFF2B5600BE2B580D7AC7A9F
          8A7491959B9194988F9195B5B1ABFFFFFFB87E09FFFFFFFFFFFFB57B08FFFFFF
          DDB382E1BB8EB95D04BD6108BE6106BD6106C06003C06001BB5B00E2BA8BFFFF
          FFB67C09FFFFFFFFFFFFB57C09FFFFFF44C4FF46C8FFE5BB8649CEFF4ACFFFE7
          BD894ACFFF4ACEFFE5BA8542C7FFFFFFFFB67C09FFFFFFFFFFFFB67E0EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB67E0EFFFFFFFFFFFFBD8C27B67E0EB67C09B67B08B57B08B67B08B67B08B5
          7B08B67B08B67B08B57B08B67C09B67E0EBD8C27FFFFFFFFFFFF}
        OnClick = BtnPesquisarClick
      end
      object Label12: TLabel
        Left = 14
        Top = 9
        Width = 43
        Height = 11
        Caption = 'Filtrar por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtPesquisar: TEdit
        Left = 156
        Top = 5
        Width = 428
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = EdtPesquisarChange
        OnKeyPress = EdtPesquisarKeyPress
      end
      object CbxFiltro: TComboBox
        Left = 61
        Top = 5
        Width = 94
        Height = 21
        ItemIndex = 1
        TabOrder = 0
        Text = 'Nome'
        OnChange = CbxFiltroChange
        Items.Strings = (
          'C'#243'digo'
          'Nome'
          'Cpf/Cnpj'
          'Cidade')
      end
    end
  end
end
