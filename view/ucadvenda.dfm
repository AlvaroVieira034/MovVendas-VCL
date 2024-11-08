inherited FrmCadVenda: TFrmCadVenda
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Vendas'
  ClientHeight = 553
  ClientWidth = 719
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 725
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTopo: TPanel
    Width = 719
    ExplicitWidth = 719
    inherited BtnInserir: TSpeedButton
      Left = 6
      Top = 12
      OnClick = BtnInserirClick
      ExplicitLeft = 6
      ExplicitTop = 12
    end
    inherited BtnAlterar: TSpeedButton
      Left = 124
      Top = 12
      OnClick = BtnAlterarClick
      ExplicitLeft = 124
      ExplicitTop = 12
    end
    inherited BtnExcluir: TSpeedButton
      Left = 242
      Top = 12
      OnClick = BtnExcluirClick
      ExplicitLeft = 242
      ExplicitTop = 12
    end
    inherited BtnGravar: TSpeedButton
      Left = 360
      Top = 12
      OnClick = BtnGravarClick
      ExplicitLeft = 360
      ExplicitTop = 12
    end
    inherited BtnCancelar: TSpeedButton
      Left = 478
      Top = 12
      OnClick = BtnCancelarClick
      ExplicitLeft = 478
      ExplicitTop = 12
    end
    inherited BtnSair: TSpeedButton
      Left = 597
      Top = 12
      OnClick = BtnSairClick
      ExplicitLeft = 597
      ExplicitTop = 12
    end
  end
  inherited PnlDados: TPanel
    Left = 0
    Top = 65
    Width = 719
    Height = 191
    Align = alTop
    ExplicitLeft = 0
    ExplicitTop = 65
    ExplicitWidth = 719
    ExplicitHeight = 191
    inherited GrbDados: TGroupBox
      Left = 6
      Top = 3
      Width = 704
      Height = 181
      Caption = ' Dados da venda '
      ExplicitLeft = 6
      ExplicitTop = 3
      ExplicitWidth = 704
      ExplicitHeight = 181
      object Label1: TLabel
        Left = 41
        Top = 30
        Width = 85
        Height = 13
        Caption = '&C'#243'digo da Venda:'
      end
      object Label2: TLabel
        Left = 51
        Top = 61
        Width = 75
        Height = 13
        Caption = '&Data da Venda:'
      end
      object Label4: TLabel
        Left = 23
        Top = 125
        Width = 103
        Height = 13
        Caption = '&Valor Total da Venda:'
      end
      object Label3: TLabel
        Left = 38
        Top = 92
        Width = 88
        Height = 13
        Caption = 'C'#243'&digo do Cliente:'
      end
      object BtnLimpaCampos: TSpeedButton
        Left = 670
        Top = 148
        Width = 28
        Height = 28
        Hint = 'Limpa os campos do dados da venda'
        Anchors = []
        BiDiMode = bdRightToLeftNoAlign
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDAF5FFFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFC4E8FD5FDAFF12C5FF00BBFF2FCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          FCFF28B3FD008BFB008AFA01BAFE05C2FF00BCFF5BD6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          B6F0FF00BFFF00C1FF06C4FF06C1FF03A2FC05B7FE06C2FF00BAFFB6EDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF8BCCFC008CFB00A2FC05B9FE07C3FF07C1FF07C4FF06BAFE07C0FF04C2FF00
          C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFCAF2FF00A9FD04B6FE05B3FE03A5FD04AFFD07C2FF07C1FF07C3FF07C7FF
          05B3FC0084F643ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFBFEFF00BEFF00BDFF00C0FF06C2FF07C4FF06BDFE07BFFF07C4FF06B8
          FE04A4FB007DF9007DFF226DC4FFF1E6FFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFD6F4FF95E4FF87E1FF39CDFF00BBFF00BEFF07C4FF07C5FF05
          B5FD0076F50079FF1480EA906470C04425D29388FFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBFAFF37CFFF00AAFC
          0078F50079FF0084FF756D8EC34F32BC4D36B24936C16E5FFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF65B5FA0072FC5176B3C75234BF4C32B6503DB4503EB04532E6C6BFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC59C98BD3C1DB54E3BB44E3CB4503EB34C3AC06D5CFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEDCD
          FCF0D3FFFFFFFFFFFFFFFFFFFFFFFFC37264B04633B75645B34C3AB4503EAE41
          2EF5E9E6FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFCF5
          E3FBE1A7FBE1A8FDF7EAFFFFFFFFFFFFFFFFFFFFFFFFF7EEECFFFFFFC5786BB1
          4835B14936CA8275FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFEFCF8FBE3AFFBE6B5FEFDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FBF6F4B14735B34D3BB14735F8F1EFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE2BBB4AE402DB04633D09388FFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFEFEFCF0D3FEFBF4FFFFFFFADFA4FDF8ECFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC26F61B04733B24A38FAF2F1FFFFFFFFFFFF
          0000FFFFFFFFFFFFFEFAF2FBDFA0FCF0D4FFFFFFFDF8EBFEFEFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F9AE422EB04633F6ECEAFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFAF2FEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EDEBF7EEECFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        ParentFont = False
        ParentShowHint = False
        ParentBiDiMode = False
        ShowHint = True
        OnClick = BtnLimpaCamposClick
      end
      object BtnPesquisar: TSpeedButton
        Left = 210
        Top = 25
        Width = 29
        Height = 23
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
        OnClick = BtnPesquisarClick
      end
      object EdtCodVenda: TEdit
        Left = 134
        Top = 26
        Width = 74
        Height = 21
        Hint = 
          'Digite o c'#243'digo da venda ou clique no bot'#227'o pesquisar para abrir' +
          ' a janela de pesquisa.'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = EdtCodVendaKeyPress
      end
      object EdtDataVenda: TEdit
        Left = 134
        Top = 58
        Width = 74
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 1
        OnChange = EdtDataVendaChange
      end
      object EdtTotalVenda: TEdit
        Left = 134
        Top = 117
        Width = 76
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 4
      end
      object EdtCodCliente: TEdit
        Left = 134
        Top = 90
        Width = 76
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
        OnChange = EdtCodClienteChange
        OnExit = EdtCodClienteExit
        OnKeyPress = EdtCodClienteKeyPress
      end
      object LcbxNomeCliente: TDBLookupComboBox
        Left = 211
        Top = 90
        Width = 284
        Height = 21
        KeyField = 'COD_CLIENTE'
        ListField = 'DES_NOME'
        TabOrder = 3
        OnClick = LcbxNomeClienteClick
      end
      object BtnInserirItens: TButton
        Left = 286
        Top = 148
        Width = 121
        Height = 30
        Caption = 'In&serir Itens'
        Enabled = False
        ImageIndex = 14
        ImageMargins.Left = 12
        Images = FrmMain.ImageList
        TabOrder = 5
        OnClick = BtnInserirItensClick
      end
    end
  end
  inherited PnlGrid: TPanel
    Left = 0
    Top = 256
    Width = 719
    Height = 297
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 256
    ExplicitWidth = 719
    ExplicitHeight = 297
    inherited LblTotRegistros: TLabel
      Left = 603
      Top = 262
      Visible = False
      ExplicitLeft = 743
      ExplicitTop = 262
    end
    inherited GrbGrid: TGroupBox
      Left = 6
      Top = 2
      Width = 704
      Height = 290
      Caption = 'Itens da venda'
      Enabled = False
      ExplicitLeft = 6
      ExplicitTop = 2
      ExplicitWidth = 704
      ExplicitHeight = 290
      object Label10: TLabel
        Left = 10
        Top = 17
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object Label12: TLabel
        Left = 251
        Top = 17
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label13: TLabel
        Left = 326
        Top = 17
        Width = 67
        Height = 13
        Caption = 'Pre'#231'o Unit'#225'rio'
      end
      object Label14: TLabel
        Left = 438
        Top = 17
        Width = 54
        Height = 13
        Caption = 'Pre'#231'o Total'
      end
      object EdtQuantidade: TEdit
        Left = 249
        Top = 33
        Width = 61
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        OnExit = EdtQuantidadeExit
        OnKeyPress = EdtQuantidadeKeyPress
      end
      object EdtPrecoUnit: TEdit
        Left = 316
        Top = 33
        Width = 100
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
        OnExit = EdtPrecoUnitExit
        OnKeyPress = EdtPrecoUnitKeyPress
      end
      object EdtPrecoTotal: TEdit
        Left = 435
        Top = 33
        Width = 100
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        OnExit = EdtPrecoTotalExit
        OnKeyPress = EdtPrecoTotalKeyPress
      end
      object LCbxProdutos: TDBLookupComboBox
        Left = 3
        Top = 33
        Width = 230
        Height = 21
        KeyField = 'COD_PRODUTO'
        ListField = 'DES_NOMEPRODUTO'
        ListFieldIndex = 1
        TabOrder = 0
        OnClick = LCbxProdutosClick
      end
      object BtnAddItemGrid: TButton
        Left = 543
        Top = 32
        Width = 24
        Height = 24
        ImageIndex = 0
        Images = FrmMain.ImageList
        TabOrder = 4
        OnClick = BtnAddItemGridClick
      end
      object BtnDelItemGrid: TButton
        Left = 573
        Top = 32
        Width = 24
        Height = 24
        ImageIndex = 1
        Images = FrmMain.ImageList
        TabOrder = 5
        OnClick = BtnDelItemGridClick
      end
      object DbGridItensPedido: TDBGrid
        Left = 6
        Top = 60
        Width = 693
        Height = 223
        DataSource = DsVendaItem
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DbGridItensPedidoKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'DES_DESCRICAO'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VAL_QUANTIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_PRECOUNITARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Unit'#225'rio'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_TOTALITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Total'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_VENDA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_VENDA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Visible = False
          end>
      end
    end
  end
  object MTblVendaItem: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 632
    Top = 404
    object MTblVendaItemID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object MTblVendaItemCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object MTblVendaItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object MTblVendaItemDES_DESCRICAO: TStringField
      FieldName = 'DES_DESCRICAO'
      Size = 100
    end
    object MTblVendaItemVAL_QUANTIDADE: TIntegerField
      FieldName = 'VAL_QUANTIDADE'
      Required = True
    end
    object MTblVendaItemVAL_PRECOUNITARIO: TFloatField
      FieldName = 'VAL_PRECOUNITARIO'
      DisplayFormat = '##,###,##0.00'
    end
    object MTblVendaItemVAL_TOTALITEM: TFloatField
      FieldName = 'VAL_TOTALITEM'
      DisplayFormat = '##,###,##0.00'
    end
  end
  object DsVendaItem: TDataSource
    DataSet = MTblVendaItem
    Left = 637
    Top = 458
  end
end
