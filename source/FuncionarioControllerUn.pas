unit FuncionarioControllerUn;

interface

Uses FuncionarioUn, PersistenciaUn, System.Classes, SysUtils, Data.DBXCommon;

Type
  TFuncionarioController = class
  private
    FFuncionario : TFuncionario;
    FDGRSQLConnection: TDGRSQLConnection;
    function GetFuncionario: TFuncionario;
    procedure PopulateFK(const aIDFuncionario: integer);
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
    destructor Destroy; override;
    procedure LoadFuncionarioByID(const aID: integer);
    property Funcionario: TFuncionario read GetFuncionario;
    function Save: integer;
    procedure CancelEdit;
    function LoadByIdFuncionario(const aIdFuncionario: integer): boolean;
  end;

implementation


{ TFuncionarioController }

procedure TFuncionarioController.CancelEdit;
begin
  Self.FFuncionario.Cancel;
  Self.FFuncionario.CancelUpdates;
  Self.FFuncionario.Dependentes.Cancel;
  Self.FFuncionario.Dependentes.CancelUpdates;
end;

constructor TFuncionarioController.Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
begin
  Self.FFuncionario := TFuncionario.Create(AOwner, aSQLConnection);
  Self.FDGRSQLConnection := aSQLConnection;
end;

destructor TFuncionarioController.Destroy;
begin
  FreeAndNil(Self.FFuncionario);

  inherited;
end;

function TFuncionarioController.GetFuncionario: TFuncionario;
begin
  Result := Self.FFuncionario;
end;

function TFuncionarioController.LoadByIdFuncionario(
  const aIdFuncionario: integer): boolean;
begin
  Result := Self.FFuncionario.LoadById(aIdFuncionario);
  if Result then
    Self.FFuncionario.Dependentes.LoadByIdFuncionario(aIdFuncionario);
end;

procedure TFuncionarioController.LoadFuncionarioByID(const aID: integer);
begin
  Self.FFuncionario.LoadById(aID);
  Self.FFuncionario.Dependentes.LoadByIdFuncionario(aID);
end;

procedure TFuncionarioController.PopulateFK(const aIDFuncionario: integer);
begin
  Self.FFuncionario.Dependentes.First;
  while not  Self.FFuncionario.Dependentes.Eof do
  begin
    Self.FFuncionario.Dependentes.IDFuncionario := aIDFuncionario;
    Self.FFuncionario.Dependentes.Next;
  end;

end;

function TFuncionarioController.Save: integer;
var
  _Trans: TDBXTransaction;
begin
  _Trans := Self.FDGRSQLConnection.BeginTransaction;
  try
    Self.PopulateFK(Self.FFuncionario.ID);
    Result := Self.FFuncionario.ApplyUpdates(0);
    Result := Result + Self.FFuncionario.Dependentes.ApplyUpdates(0);
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
