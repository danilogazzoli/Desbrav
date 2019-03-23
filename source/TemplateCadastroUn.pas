unit TemplateCadastroUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, System.UITypes;

type
  TCadastroTemplateFormUn = class(TForm)
    pgcCadastro: TPageControl;
    Cadastro: TTabSheet;
    CadastroGroupBox: TGroupBox;
    GroupBox1: TGroupBox;
    NovoButton: TButton;
    SalvarButton: TButton;
    SairButton: TButton;
    TabSheet2: TTabSheet;
    PesquisaEdit: TComboBox;
    CodigoEdit: TMaskEdit;
    lbxPesquisa: TListBox;
    CadastroActionList: TActionList;
    NovoAction: TAction;
    SalvarAction: TAction;
    EditarAction: TAction;
    ExcluirAction: TAction;
    PesquisarAction: TAction;
    SairAction: TAction;
    CancelarButton: TButton;
    CancelarAction: TAction;
    ExcluirButton: TButton;
    procedure SairActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroTemplateFormUn: TCadastroTemplateFormUn;

implementation

{$R *.dfm}

procedure TCadastroTemplateFormUn.FormCreate(Sender: TObject);
begin
  Self.pgcCadastro.ActivePageIndex := 0;
end;

procedure TCadastroTemplateFormUn.SairActionExecute(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
  begin
    Close;
  end;

end;

end.
