unit PessoaFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TPessoaForm = class(TCadastroTemplateFormUn)
    Label7: TLabel;
    IDEdit: TMaskEdit;
    Nome: TLabel;
    NomeEdit: TMaskEdit;
    LogradouroLabel: TLabel;
    CPFEdit: TMaskEdit;
    Label2: TLabel;
    LogradouroEdit: TMaskEdit;
    Label4: TLabel;
    Cidade: TLabel;
    NumeroEdit: TMaskEdit;
    Label3: TLabel;
    BairroEdit: TMaskEdit;
    Label5: TLabel;
    ComplementoEdit: TMaskEdit;
    UFEdit: TMaskEdit;
    Label6: TLabel;
    CidadeEdit: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PessoaForm: TPessoaForm;

implementation

{$R *.dfm}

end.
