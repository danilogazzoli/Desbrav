unit ReceberFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DuplicataFormUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TReceberForm = class(TDuplicataForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReceberForm: TReceberForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TReceberForm);

finalization
  UnregisterClass(TReceberForm);

end.
