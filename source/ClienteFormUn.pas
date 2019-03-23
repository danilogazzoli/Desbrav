unit ClienteFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, ClienteControllerUn, System.UITypes;

type
  TClienteForm = class(TCadastroTemplateFormUn)
    CPFEdit: TMaskEdit;
    NomeEdit: TMaskEdit;
    Nome: TLabel;
    LogradouroLabel: TLabel;
    NascimentoEdit: TDateTimePicker;
    Label1: TLabel;
    LogradouroEdit: TMaskEdit;
    Label2: TLabel;
    BairroEdit: TMaskEdit;
    Label3: TLabel;
    NumeroEdit: TMaskEdit;
    Label4: TLabel;
    ComplementoEdit: TMaskEdit;
    Label5: TLabel;
    CidadeEdit: TMaskEdit;
    Cidade: TLabel;
    UFEdit: TMaskEdit;
    Label6: TLabel;
    IDEdit: TMaskEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NovoActionExecute(Sender: TObject);
    procedure SalvarActionExecute(Sender: TObject);
    procedure CodigoEditKeyPress(Sender: TObject; var Key: Char);
    procedure lbxPesquisaDblClick(Sender: TObject);
    procedure CancelarActionExecute(Sender: TObject);
    procedure ExcluirActionExecute(Sender: TObject);

  private
    { Private declarations }
    FController: TClienteController;
    procedure ClearControls;
    procedure PopulateControls;

  public
    { Public declarations }
  end;

var
  ClienteForm: TClienteForm;

implementation

{$R *.dfm}

uses PersistenciaUn;

procedure TClienteForm.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TClienteController.Create(Self, TDGRSQLConnection.getInstance );
end;

procedure TClienteForm.lbxPesquisaDblClick(Sender: TObject);
begin
  inherited;
  lbxPesquisa.Clear;
  CodigoEdit.Clear;
  pgcCadastro.ActivePageIndex := 0;
  Self.PopulateControls;
end;

procedure TClienteForm.CodigoEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  begin
    if Self.FController.LoadClienteByID(StrToIntDef(CodigoEdit.Text, 0)) then
      lbxPesquisa.AddItem(Self.FController.Cliente.Nome, TObject(Self.FController.Cliente.ID));
  end;
end;

procedure TClienteForm.ExcluirActionExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Delete;
    Self.ClearControls;
  end;
end;

procedure TClienteForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FController.Free;
end;


procedure TClienteForm.CancelarActionExecute(Sender: TObject);
begin
  inherited;
  Self.FController.CancelEdit;
  Self.ClearControls;
end;

procedure TClienteForm.ClearControls;
var
  _i: integer;
begin
  for _i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[_i] is TMaskEdit then
      TMaskEdit(Self.Components[_i]).Clear
  end;
end;

procedure TClienteForm.PopulateControls;
begin
  Self.ClearControls;
  NomeEdit.Text := Self.FController.Cliente.Nome;
  CPFEdit.Text := Self.FController.Cliente.CPF;
  NascimentoEdit.Date := Self.FController.Cliente.Nascimento;
  LogradouroEdit.Text := Self.FController.Cliente.Logradouro;
  NumeroEdit.Text := Self.FController.Cliente.Numero;
  BairroEdit.Text := Self.FController.Cliente.Bairro;
  ComplementoEdit.Text := Self.FController.Cliente.Complemento;
  CidadeEdit.Text := Self.FController.Cliente.Cidade;
  UFEdit.Text := Self.FController.Cliente.UF;
  IDEdit.Text := Self.FController.Cliente.ID.ToString;
end;

procedure TClienteForm.SalvarActionExecute(Sender: TObject);
begin
  inherited;
  try
    Self.FController.Cliente.Edit;
    Self.FController.Cliente.Nome := NomeEdit.Text;
    Self.FController.Cliente.CPF := CPFEdit.Text;
    Self.FController.Cliente.Nascimento := NascimentoEdit.Date;
    Self.FController.Cliente.Logradouro := LogradouroEdit.Text;
    Self.FController.Cliente.Bairro := BairroEdit.Text;
    Self.FController.Cliente.Complemento := ComplementoEdit.Text;
    Self.FController.Cliente.Numero := NumeroEdit.Text;
    Self.FController.Cliente.Cidade := CidadeEdit.Text;
    Self.FController.Cliente.UF := UFEdit.Text;

    Self.FController.Save;
    IDEdit.Text := Self.FController.Cliente.ID.ToString;
  except
    on E: Exception do
    begin
      Self.FController.CancelEdit;
      raise;
    end;
  end;

end;

procedure TClienteForm.NovoActionExecute(Sender: TObject);
begin
  inherited;
  Self.ClearControls;
  if NomeEdit.CanFocus then
    NomeEdit.SetFocus;

  Self.FController.Cliente.LoadById(-1);
end;


initialization
  RegisterClass(TClienteForm);

finalization
  UnregisterClass(TClienteForm);

end.
