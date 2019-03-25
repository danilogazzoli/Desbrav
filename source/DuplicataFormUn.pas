unit DuplicataFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, DuplicataUn, DuplicataControllerUn,
  System.UITypes;

type
  TDuplicataForm = class(TCadastroTemplateFormUn)
    IDEdit: TMaskEdit;
    Label7: TLabel;
    PessoaEdit: TMaskEdit;
    Label1: TLabel;
    RazaoSocialEdit: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    VencimentoEdit: TDateTimePicker;
    ValorEdit: TMaskEdit;
    Label4: TLabel;
    CodBarrasEdit: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CodigoEditKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirActionExecute(Sender: TObject);
    procedure CancelarActionExecute(Sender: TObject);
    procedure NovoActionExecute(Sender: TObject);
    procedure SalvarActionExecute(Sender: TObject);
  private
    { Private declarations }
    FController: TDuplicataController;
  protected
    function GetIdTipoDuplicata: TTipoDuplicata; virtual;
    procedure PopulateControls; override;
  public
    { Public declarations }
  end;

var
  DuplicataForm: TDuplicataForm;

implementation

{$R *.dfm}

uses PersistenciaUn;

{ TDuplicataForm }

procedure TDuplicataForm.CancelarActionExecute(Sender: TObject);
begin
  inherited;
  Self.FController.CancelEdit;
  Self.ClearControls;
end;

procedure TDuplicataForm.CodigoEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(VK_Return) then
  begin
    if Self.FController.LoadDuplicataByID(StrToIntDef(CodigoEdit.Text, 0)) then
      lbxPesquisa.AddItem(Self.FController.Duplicata.Duplicata, TObject(Self.FController.Duplicata.ID));
  end;
end;

procedure TDuplicataForm.ExcluirActionExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Delete;
    Self.ClearControls;
  end;
end;

procedure TDuplicataForm.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TDuplicataController.Create(Self, TDGRSQLConnection.getInstance );
end;

procedure TDuplicataForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FController.Free;
end;

function TDuplicataForm.GetIdTipoDuplicata: TTipoDuplicata;
begin
  Result := tdReceber;
end;

procedure TDuplicataForm.NovoActionExecute(Sender: TObject);
begin
  inherited;
  Self.ClearControls;
  if PessoaEdit.CanFocus then
    PessoaEdit.SetFocus;

  Self.FController.LoadDuplicataByID(-1);
end;

procedure TDuplicataForm.PopulateControls;
begin
  Self.ClearControls;
  PessoaEdit.Text := Self.FController.Duplicata.IdPessoa.ToString;
  CodBarrasEdit.Text := Self.FController.Duplicata.Duplicata;
  VencimentoEdit.Date := Self.FController.Duplicata.Vencimento;
  ValorEdit.Text := CurrToStr(Self.FController.Duplicata.Valor)

end;

procedure TDuplicataForm.SalvarActionExecute(Sender: TObject);
begin
  try
    Self.FController.Duplicata.Edit;
    Self.FController.Duplicata.IdPessoa := String(PessoaEdit.Text).ToInteger;
    Self.FController.Duplicata.Duplicata := CodBarrasEdit.Text;
    Self.FController.Duplicata.Vencimento := VencimentoEdit.Date;
    Self.FController.Duplicata.Valor := StrToCurrDef(ValorEdit.Text, 0);
    Self.FController.Duplicata.IDTipoDuplicata := Self.GetIdTipoDuplicata;

    Self.FController.Save;
    IDEdit.Text := Self.FController.Duplicata.ID.ToString;
  except
    on E: Exception do
    begin
      Self.FController.CancelEdit;
      raise;
    end;
  end;
end;

initialization
  RegisterClass(TDuplicataForm);

finalization
  UnregisterClass(TDuplicataForm);


end.
