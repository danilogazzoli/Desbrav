unit FornecedorFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TFornecedorForm = class(TCadastroTemplateFormUn)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FornecedorForm: TFornecedorForm;

implementation

{$R *.dfm}


initialization
  RegisterClass(TFornecedorForm);

finalization
  UnregisterClass(TFornecedorForm);

end.
