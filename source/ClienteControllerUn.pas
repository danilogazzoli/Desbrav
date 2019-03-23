unit ClienteControllerUn;


interface

Uses ClienteUn, PersistenciaUn, System.Classes, SysUtils, Data.DBXCommon, Data.DB;

Type
  TClienteController = class
  private
    FCliente : TCliente;
    FDGRSQLConnection : TDGRSQLConnection;
    function GetCliente: TCliente;
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
    destructor Destroy; override;
    function LoadClienteByID(const aID: integer): boolean;
    property Cliente: TCliente read GetCliente;
    function Save: integer;
    procedure CancelEdit;
  end;

implementation


{ TClienteController }

constructor TClienteController.Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
begin
  Self.FCliente := TCliente.Create(AOwner, aSQLConnection);
  Self.FDGRSQLConnection := aSQLConnection;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(Self.FCliente);

  inherited;
end;

procedure TClienteController.CancelEdit;
begin
  Self.FCliente.Cancel;
  Self.FCliente.CancelUpdates;
end;

function TClienteController.GetCliente: TCliente;
begin
  Result := Self.FCliente;
end;

function TClienteController.LoadClienteByID(const aID: integer): boolean;
begin
  Result := Self.FCliente.LoadById(aID);
end;

function TClienteController.Save: integer;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    if Self.FCliente.State in dsEditModes then
      Self.FCliente.Post;
    Result := Self.FCliente.ApplyUpdates(0);
    Self.FDGRSQLConnection.CommitFreeAndNil(_Trans);
  except
    on E: Exception do
    begin
      Self.FDGRSQLConnection.RollbackIncompleteFreeAndNil(_Trans);
      Raise;
    end;
  end;
end;

end.
