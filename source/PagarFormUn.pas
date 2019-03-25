unit PagarFormUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DuplicataFormUn, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DuplicataUn;

type
  TPagarForm = class(TDuplicataForm)
  private
    { Private declarations }
  protected
    function GetIdTipoDuplicata: TTipoDuplicata; override;
  public
    { Public declarations }
  end;

var
  PagarForm: TPagarForm;

implementation

{$R *.dfm}

{ TPagarForm }

function TPagarForm.GetIdTipoDuplicata: TTipoDuplicata;
begin
  Result := tdPagar;
end;

initialization
  RegisterClass(TPagarForm);

finalization
  UnregisterClass(TPagarForm);

end.
