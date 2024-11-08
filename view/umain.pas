unit umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFrmMain = class(TForm)
    PanelBotoesMenu: TPanel;
    BtnSair: TSpeedButton;
    BtnVendas: TSpeedButton;
    BtnProdutos: TSpeedButton;
    Timer1: TTimer;
    ImageList: TImageList;
    BtnClientes: TSpeedButton;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnProdutosClick(Sender: TObject);
    procedure BtnVendasClick(Sender: TObject);
    procedure BtnClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses ucadproduto, ucadvenda, ucadcliente;

procedure TFrmMain.BtnClientesClick(Sender: TObject);
begin
  if not Assigned(FrmCadCliente) then
    FrmCadCliente := TFrmCadCliente.Create(Self);

  FrmCadCliente.ShowModal;
  FrmCadCliente.Free;
  FrmCadCliente := nil;
end;

procedure TFrmMain.BtnProdutosClick(Sender: TObject);
begin
  if not Assigned(FrmCadProduto) then
    FrmCadProduto := TFrmCadProduto.Create(Self);

  FrmCadProduto.ShowModal;
  FrmCadProduto.Free;
  FrmCadProduto := nil;
end;

procedure TFrmMain.BtnVendasClick(Sender: TObject);
begin
  if not Assigned(FrmCadVenda) then
    FrmCadVenda := TFrmCadVenda.Create(Self);

  FrmCadVenda.ShowModal;
  FrmCadVenda.Free;
  FrmCadVenda := nil;

end;

procedure TFrmMain.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.
