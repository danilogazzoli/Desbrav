unit FornecedorControllerUn;

interface

Uses FornecedorUn, PersistenciaUn, System.Classes, SysUtils, Data.DBXCommon, Data.DB;

Type
  TFornecedorController = class
  private
    FFornecedor : TFornecedor;
    FDGRSQLConnection : TDGRSQLConnection;
    function GetFornecedor: TFornecedor;
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
    destructor Destroy; override;
    function LoadFornecedorByID(const aID: integer): boolean;
    property Fornecedor: TFornecedor read GetFornecedor;
    function Save: integer;
    procedure CancelEdit;
    procedure Delete;
  end;

implementation


{ TFornecedorController }

constructor TFornecedorController.Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
begin
  Self.FFornecedor := TFornecedor.Create(AOwner, aSQLConnection);
  Self.FDGRSQLConnection := aSQLConnection;
end;

procedure TFornecedorController.Delete;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    if not Self.FFornecedor.IsEmpty then
    begin
      Self.FFornecedor.Delete;
      Self.FFornecedor.ApplyUpdates(0);
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

destructor TFornecedorController.Destroy;
begin
  FreeAndNil(Self.FFornecedor);

  inherited;
end;

procedure TFornecedorController.CancelEdit;
begin
  Self.FFornecedor.Cancel;
  Self.FFornecedor.CancelUpdates;
end;

function TFornecedorController.GetFornecedor: TFornecedor;
begin
  Result := Self.FFornecedor;
end;

function TFornecedorController.LoadFornecedorByID(const aID: integer): boolean;
begin
  Result := Self.FFornecedor.LoadById(aID);
end;

function TFornecedorController.Save: integer;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    if Self.FFornecedor.State in dsEditModes then
      Self.FFornecedor.Post;
    Result := Self.FFornecedor.ApplyUpdates(0);
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
