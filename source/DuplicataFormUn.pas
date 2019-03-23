unit DuplicataFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TemplateCadastroUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls;

type
  TDuplicataForm = class(TCadastroTemplateFormUn)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DuplicataForm: TDuplicataForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TDuplicataForm);

finalization
  UnregisterClass(TDuplicataForm);


end.
