unit FornecedorFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, PessoaFormUn,
  FornecedorControllerUn, System.UITypes;

type
  TFornecedorForm = class(TPessoaForm)
    IEEdit: TMaskEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CodigoEditKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirActionExecute(Sender: TObject);
    procedure CancelarActionExecute(Sender: TObject);
    procedure NovoActionExecute(Sender: TObject);
    procedure SalvarActionExecute(Sender: TObject);
  private
    { Private declarations }
    FController: TFornecedorController;
  protected
    procedure PopulateControls; override;
  public
    { Public declarations }
  end;

var
  FornecedorForm: TFornecedorForm;

implementation

{$R *.dfm}

uses PersistenciaUn;

procedure TFornecedorForm.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TFornecedorController.Create(Self, TDGRSQLConnection.getInstance );
end;

procedure TFornecedorForm.NovoActionExecute(Sender: TObject);
begin
  inherited;
  Self.ClearControls;
  if NomeEdit.CanFocus then
    NomeEdit.SetFocus;

  Self.FController.LoadFornecedorByID(-1);
end;

procedure TFornecedorForm.CancelarActionExecute(Sender: TObject);
begin
  inherited;
  Self.FController.CancelEdit;
  Self.ClearControls;
end;

procedure TFornecedorForm.CodigoEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  begin
    if Self.FController.LoadFornecedorByID(StrToIntDef(CodigoEdit.Text, 0)) then
      lbxPesquisa.AddItem(Self.FController.Fornecedor.Nome, TObject(Self.FController.Fornecedor.ID));
  end;
end;

procedure TFornecedorForm.ExcluirActionExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Delete;
    Self.ClearControls;
  end;
end;

procedure TFornecedorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FController.Free;
end;

procedure TFornecedorForm.PopulateControls;
begin
  Self.ClearControls;
  NomeEdit.Text := Self.FController.Fornecedor.Nome;
  CPFEdit.Text := Self.FController.Fornecedor.CNPJ;
  IEEdit.Text := Self.FController.Fornecedor.InscricaoEstadual;
  LogradouroEdit.Text := Self.FController.Fornecedor.Logradouro;
  NumeroEdit.Text := Self.FController.Fornecedor.Numero;
  BairroEdit.Text := Self.FController.Fornecedor.Bairro;
  ComplementoEdit.Text := Self.FController.Fornecedor.Complemento;
  CidadeEdit.Text := Self.FController.Fornecedor.Cidade;
  UFEdit.Text := Self.FController.Fornecedor.UF;
  IDEdit.Text := Self.FController.Fornecedor.ID.ToString;
end;


procedure TFornecedorForm.SalvarActionExecute(Sender: TObject);
begin
  inherited;
  try
    Self.FController.Fornecedor.Edit;
    Self.FController.Fornecedor.Nome := NomeEdit.Text;
    Self.FController.Fornecedor.CNPJ := CPFEdit.Text;
    Self.FController.Fornecedor.InscricaoEstadual := IEEdit.Text;
    Self.FController.Fornecedor.Logradouro := LogradouroEdit.Text;
    Self.FController.Fornecedor.Bairro := BairroEdit.Text;
    Self.FController.Fornecedor.Complemento := ComplementoEdit.Text;
    Self.FController.Fornecedor.Numero := NumeroEdit.Text;
    Self.FController.Fornecedor.Cidade := CidadeEdit.Text;
    Self.FController.Fornecedor.UF := UFEdit.Text;

    Self.FController.Save;
    IDEdit.Text := Self.FController.Fornecedor.ID.ToString;
  except
    on E: Exception do
    begin
      Self.FController.CancelEdit;
      raise;
    end;
  end;
end;

initialization
  RegisterClass(TFornecedorForm);

finalization
  UnregisterClass(TFornecedorForm);

end.
