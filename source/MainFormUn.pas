unit MainFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TMainForm = class(TForm)
    mnuPrincipal: TMainMenu;
    Exerccios1: TMenuItem;
    Exerccio11: TMenuItem;
    Exerccio21: TMenuItem;
    Exerccio31: TMenuItem;
    Exerccio41: TMenuItem;
    Receber1: TMenuItem;
    Pagar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Exerccio11Click(Sender: TObject);
    procedure Exerccio21Click(Sender: TObject);
    procedure Exerccio31Click(Sender: TObject);
    procedure Receber1Click(Sender: TObject);
    procedure Pagar1Click(Sender: TObject);
  private
    procedure HandleApplicationExceptions(Sender: TObject; E: Exception);
    procedure CriarForm(const aClasseForm: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Exerccio11Click(Sender: TObject);
begin
  Self.CriarForm('TClienteForm');
end;

procedure TMainForm.Exerccio21Click(Sender: TObject);
begin
  Self.CriarForm('TFornecedorForm');
end;

procedure TMainForm.Exerccio31Click(Sender: TObject);
begin
  Self.CriarForm('TProdutoForm');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.WindowState := wsMaximized;
  Application.OnException := HandleApplicationExceptions;
  ReportMemoryLeaksOnShutdown := (DebugHook <> 0);
end;

procedure TMainForm.HandleApplicationExceptions(Sender: TObject; E: Exception);
begin
   MessageDlg('Houve um erro: ' + E.Message, mtWarning, [mbOk],0 )
end;

procedure TMainForm.Pagar1Click(Sender: TObject);
begin
  Self.CriarForm('TPagarForm');
end;

procedure TMainForm.Receber1Click(Sender: TObject);
begin
  Self.CriarForm('TReceberForm');
end;

procedure TMainForm.CriarForm(const aClasseForm : String);
var
  _Classe : TFormClass;
  _Form : TForm;
begin
  _Classe := TFormClass(FindClass(aClasseForm));
  _Form := _Classe.Create(nil);
  try
    _Form.ShowModal;
  finally
    FreeAndNil(_Form);
  end;
end;

end.
