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
  FornecedorControllerUn in 'FornecedorControllerUn.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
