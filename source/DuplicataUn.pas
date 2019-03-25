unit DuplicataUn;

interface

Uses PersistenciaUn, System.Classes, LibUtils, SysUtils;

Type
  TTipoDuplicata = (tdReceber = 1, tdPagar = 2);

  TDuplicata = class(TDGRSimpleDataSet)
  private
    function GetIdPessoa: integer;

    function GetIdTipoDuplicata: TTipoDuplicata;
    function GetValor: currency;
    function GetVencimento: TDateTime;
    procedure SetIdPessoa(const Value: integer);
    procedure SetIdTipoDuplicata(const Value: TTipoDuplicata);
    procedure SetValor(const Value: currency);
    procedure SetVencimento(const Value: TDateTime);
    function GetDuplicata: string;

    procedure SetDuplicata(const Value: string);  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property IdPessoa: integer read GetIdPessoa write SetIdPessoa;
    property Vencimento: TDateTime read GetVencimento write SetVencimento;
    property Valor: currency read GetValor write SetValor;
    property IDTipoDuplicata: TTipoDuplicata read GetIdTipoDuplicata write SetIdTipoDuplicata;
    property Duplicata: string read GetDuplicata write SetDuplicata;
  end;


implementation

{ TDuplicata }

constructor TDuplicata.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Duplicata';
  inherited;
end;


destructor TDuplicata.Destroy;
begin

  inherited;
end;

function TDuplicata.GetDuplicata: string;
begin
  Result := Self.FieldByName('Duplicata').AsString
end;

function TDuplicata.GetIdPessoa: integer;
begin
  Result := Self.FieldByName('IdPessoa').AsInteger
end;

function TDuplicata.GetIdTipoDuplicata: TTipoDuplicata;
begin
  Result := TTipoDuplicata(Self.FieldByName('IdTipoDuplicata').AsInteger)
end;

function TDuplicata.GetValor: currency;
begin
  Result := Self.FieldByName('Valor').AsCurrency
end;

function TDuplicata.GetVencimento: TDateTime;
begin
  Result := Self.FieldByName('Vencimento').AsDateTime
end;

procedure TDuplicata.SetDuplicata(const Value: string);
begin
  Self.SetFieldValueAsString('Duplicata', Value);
end;

procedure TDuplicata.SetIdPessoa(const Value: integer);
begin
  Self.SetFieldValueAsInteger('IdPessoa', Value);
end;

procedure TDuplicata.SetIdTipoDuplicata(const Value: TTipoDuplicata);
begin
  Self.SetFieldValueAsInteger('IdTipoDuplicata', Integer(Value));
end;

procedure TDuplicata.SetValor(const Value: currency);
begin
  Self.SetFieldValueAsCurrency('Valor', Value);
end;

procedure TDuplicata.SetVencimento(const Value: TDateTime);
begin
  Self.SetFieldValueAsDateTime('Vencimento', Value);
end;



end.
