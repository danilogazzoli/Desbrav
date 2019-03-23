unit PersistenciaUn;

interface

Uses  Data.DB, Data.SqlExpr, System.Classes, System.SysUtils, Datasnap.DBClient,
      SimpleDS, Data.DBXFirebird;

type

  TDGRSQLConnection = class (TSQLConnection)
  private
    procedure DBSQLConnectionBeforeConnect(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    class function getInstance: TDGRSQLConnection;
  end;

  TDGRSimpleDataSet = class (TSimpleDataSet)
  private
    const
      SQL = 'SELECT * FROM %s WHERE Id = :Id';
      SQLFK = 'SELECT * FROM %s WHERE %s = :%s';
    function GetId: integer;
    procedure SetId(const Value: integer);
  protected
    FTableName: string;
    procedure DoBeforePost; override;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); reintroduce; virtual;
    function LoadById(const aID: integer): boolean; virtual;
    function LoadByFK(const aFKID: integer; const aFKName: string): boolean; virtual;
    procedure SetFieldValueAsString(const aFieldName: string; aValue: string);
    procedure SetFieldValueAsInteger(const aFieldName: string; aValue: integer);
    procedure SetFieldValueAsBoolean(const aFieldName: string; aValue: boolean);
    procedure SetFieldValueAsCurrency(const aFieldName: string; aValue: currency);
    procedure SetFieldValueAsDateTime(const aFieldName: string; aValue: TDateTime);
    procedure CheckEditDataSet;
    function GetNextId: integer;
    property ID: integer read GetId write SetId;

  end;

implementation

var
  _DGRSQLConnection : TDGRSQLConnection;

{ TDGRSQLConnection }

constructor TDGRSQLConnection.Create(AOwner: TComponent);
begin
  inherited;
  Self.BeforeConnect := DBSQLConnectionBeforeConnect;
  Self.LoginPrompt := False;
  Self.Params.Text :=
    'DriverUnit=Data.DBXFirebird' + #13#10 +
    'GetDriverFunc=getSQLDriverINTERBASE' + #13#10 +
    'LibraryName=fbclient.dll' + #13#10 +
    'VendorLib=gds32.dll' + #13#10 +
    'VendorLibWin64=gds32.dll' + #13#10 +
    'User_Name=SYSDBA' + #13#10 +
    'Password=masterkey' + #13#10 +
    'Role=RoleName' + #13#10 +
    'MaxBlobSize=-1' + #13#10 +
    'LocaleCode=0000' + #13#10 +
    'IsolationLevel=ReadCommitted' + #13#10 +
    'SQLDialect=3' + #13#10 +
    'CommitRetain=False' + #13#10 +
    'WaitOnLocks=True' + #13#10 +
    'TrimChar=False' + #13#10 +
    'BlobSize=-1' + #13#10 +
    'ErrorResourceFile=' + #13#10 +
    'RoleName=RoleName' + #13#10 +
    'ServerCharSet=' + #13#10 +
    'Trim Char=False';

end;

procedure TDGRSQLConnection.DBSQLConnectionBeforeConnect(Sender: TObject);
var
  _iniParams: TStringList;
  _i: integer;
begin
  _iniParams := TStringList.Create;
  try
    _iniParams.LoadFromFile(ExtractFilePath(ParamStr(0) ) + 'Parametros.ini');
    for _i := 0 to _iniParams.Count - 1 do
      Self.Params.Values[_iniParams.Names[_i]] := _iniParams.ValueFromIndex[_i];
  finally
    _iniParams.Free;
  end;
end;

class function TDGRSQLConnection.getInstance: TDGRSQLConnection;
begin
  Result := _DGRSQLConnection;
end;

{ TDGRSimpleDataSet }

procedure TDGRSimpleDataSet.CheckEditDataSet;
begin
  if not (Self.State in dsEditModes) then
    Self.Edit;
end;

constructor TDGRSimpleDataSet.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  inherited Create(AOwner);
  Self.SetConnection(ASqlConnection);
  Self.LoadById(-1);
end;

procedure TDGRSimpleDataSet.DoBeforePost;
begin
  inherited;
  if Self.State = dsInsert then
    Self.FieldByName('ID').AsInteger := Self.GetNextId;
end;

function TDGRSimpleDataSet.GetId: integer;
begin
  Result := Self.FieldByName('Id').AsInteger;
end;

function TDGRSimpleDataSet.GetNextId: integer;
var
  _qry: TSQLDataSet;
begin
  _qry := TSQLDataSet.Create(Self);
  try
    _qry.SQLConnection := Self.DataSet.SQLConnection;
    _qry.CommandText := Format('SELECT GEN_ID( %s, 1 ) FROM RDB$DATABASE;', ['GEN_'+Self.FTableName]);
    _qry.Open;
    Result := _qry.Fields[0].AsInteger;
  finally
    _qry.Free;
  end;

end;

function TDGRSimpleDataSet.LoadByFK(const aFKID: integer;
  const aFKName: string): boolean;
begin
  Self.Close;
  Self.DataSet.CommandText := Format(SQLFK, [Self.FTableName, aFKName, aFKName]);
  Self.DataSet.ParamByName(aFKName).AsInteger := aFKID;
  Self.Open;
  Result := Self.Active and (not Self.IsEmpty);
end;

function TDGRSimpleDataSet.LoadById(const aID: integer): boolean;
begin
  Self.Close;
  Self.DataSet.CommandText := Format(SQL, [Self.FTableName]);
  Self.DataSet.ParamByName('Id').AsInteger := aID;
  Self.Open;
  Result := Self.Active and (not Self.IsEmpty);
end;

procedure TDGRSimpleDataSet.SetFieldValueAsBoolean(const aFieldName: string;
  aValue: boolean);
begin
  Self.CheckEditDataSet;
  Self.FieldByName(aFieldName).asBoolean := aValue;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsCurrency(const aFieldName: string;
  aValue: currency);
begin
  Self.CheckEditDataSet;
  Self.FieldByName(aFieldName).asCurrency := aValue;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsDateTime(const aFieldName: string;
  aValue: TDateTime);
begin
  Self.CheckEditDataSet;
  Self.FieldByName(aFieldName).asDateTime := aValue;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsInteger(const aFieldName: string;
  aValue: integer);
begin
  Self.CheckEditDataSet;
  Self.FieldByName(aFieldName).asInteger := aValue;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsString(const aFieldName: string;
  aValue: string);
begin
  Self.CheckEditDataSet;
  Self.FieldByName(aFieldName).AsString := aValue;
end;

procedure TDGRSimpleDataSet.SetId(const Value: integer);
begin
  Self.FieldByName('Id').AsInteger := Value;
end;

initialization
  _DGRSQLConnection := TDGRSQLConnection.Create(nil);
  _DGRSQLConnection.DriverName := 'Firebird';
  _DGRSQLConnection.Connected := True;

finalization
  _DGRSQLConnection.Free;
  _DGRSQLConnection := nil;


end.
