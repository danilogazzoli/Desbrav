program Desbrav;

uses
  Vcl.Forms,
  MainFormUn in 'MainFormUn.pas' {MainForm},
  LibUtils in 'LibUtils.pas',
  PersistenciaUn in 'PersistenciaUn.pas',
  TemplateCadastroUn in 'TemplateCadastroUn.pas' {CadastroTemplateFormUn},
  ClienteFormUn in 'ClienteFormUn.pas' {ClienteForm},
  FornecedorFormUn in 'FornecedorFormUn.pas' {FornecedorForm},
  DuplicataFormUn in 'DuplicataFormUn.pas' {DuplicataForm},
  ClienteUn in 'ClienteUn.pas',
  PessoaUn in 'PessoaUn.pas',
  ClienteControllerUn in 'ClienteControllerUn.pas',
  PessoaFormUn in 'PessoaFormUn.pas' {PessoaForm},
  FornecedorUn in 'FornecedorUn.pas',
  FornecedorControllerUn in 'FornecedorControllerUn.pas',
  DuplicataUn in 'DuplicataUn.pas',
  DuplicataControllerUn in 'DuplicataControllerUn.pas',
  ReceberFormUn in 'ReceberFormUn.pas' {ReceberForm},
  PagarFormUn in 'PagarFormUn.pas' {PagarForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
