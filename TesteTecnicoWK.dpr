program TesteTecnicoWK;

uses
  Vcl.Forms,
  umain in 'view\umain.pas' {FrmMain},
  ucadastropadrao in 'view\ucadastropadrao.pas' {FrmCadastroPadrao},
  ucadproduto in 'view\ucadproduto.pas' {FrmCadProduto},
  ucadvenda in 'view\ucadvenda.pas' {FrmCadVenda},
  upesqvendas in 'view\upesqvendas.pas' {FrmPesquisaVendas},
  cliente.controller in 'controller\cliente.controller.pas',
  produto.controller in 'controller\produto.controller.pas',
  venda.controller in 'controller\venda.controller.pas',
  vendaitens.controller in 'controller\vendaitens.controller.pas',
  untFormat in 'util\lib\untFormat.pas',
  icliente.repository in 'interface\icliente.repository.pas',
  iproduto.repository in 'interface\iproduto.repository.pas',
  conexao.service in 'service\conexao\conexao.service.pas',
  connection.service in 'service\conexao\connection.service.pas',
  cep.service in 'service\cep\cep.service.pas',
  cliente.model in 'model\cliente.model.pas',
  produto.model in 'model\produto.model.pas',
  venda.model in 'model\venda.model.pas',
  vendaitens.model in 'model\vendaitens.model.pas',
  cliente.repository in 'repository\cliente.repository.pas',
  produto.repository in 'repository\produto.repository.pas',
  venda.repository in 'repository\venda.repository.pas',
  vendaitens.repository in 'repository\vendaitens.repository.pas',
  produto.service in 'service\produto\produto.service.pas',
  iproduto.service in 'interface\iproduto.service.pas',
  icliente.service in 'interface\icliente.service.pas',
  cliente.service in 'service\cliente\cliente.service.pas',
  ivenda.service in 'interface\ivenda.service.pas',
  ivenda.repository in 'interface\ivenda.repository.pas',
  venda.service in 'service\venda\venda.service.pas',
  ucadcliente in 'view\ucadcliente.pas' {FrmCadCliente},
  biblioteca in 'util\lib\biblioteca.pas',
  ivendaitens.repository in 'interface\ivendaitens.repository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
