unit DuplicataControllerUn;

interface

Uses DuplicataUn, PersistenciaUn, System.Classes, SysUtils, Data.DBXCommon, Data.DB;

Type
  TDuplicataController = class
  private
    FDuplicata : TDuplicata;
    FDGRSQLConnection : TDGRSQLConnection;
    function GetDuplicata: TDuplicata;
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
    destructor Destroy; override;
    function LoadDuplicataByID(const aID: integer): boolean;
    property Duplicata: TDuplicata read GetDuplicata;
    function Save: integer;
    procedure CancelEdit;
    procedure Delete;
  end;

implementation


{ TDuplicataController }

constructor TDuplicataController.Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
begin
  Self.FDuplicata := TDuplicata.Create(AOwner, aSQLConnection);
  Self.FDGRSQLConnection := aSQLConnection;
end;

procedure TDuplicataController.Delete;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    if not Self.FDuplicata.IsEmpty then
    begin
      Self.FDuplicata.Delete;
      Self.FDuplicata.ApplyUpdates(0);
    end;
    Self.FDGRSQLConnection.CommitFreeAndNil(_Trans);
  except
    on E: Exception do
    begin
      Self.FDGRSQLConnection.RollbackIncompleteFreeAndNil(_Trans);
      Raise;
    end;
  end;
end;

destructor TDuplicataController.Destroy;
begin
  FreeAndNil(Self.FDuplicata);

  inherited;
end;

procedure TDuplicataController.CancelEdit;
begin
  Self.FDuplicata.Cancel;
  Self.FDuplicata.CancelUpdates;
end;

function TDuplicataController.GetDuplicata: TDuplicata;
begin
  Result := Self.FDuplicata;
end;

function TDuplicataController.LoadDuplicataByID(const aID: integer): boolean;
begin
  Result := Self.FDuplicata.LoadById(aID);
end;

function TDuplicataController.Save: integer;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    if Self.FDuplicata.State in dsEditModes then
      Self.FDuplicata.Post;
    Result := Self.FDuplicata.ApplyUpdates(0);
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
