unit FuncionarioUn;

(*

* Criar uma classe Funcionário com as seguintes propriedades
	* (Nome, CPF, Salário)
* Criar uma classe Dependente com as seguintes propriedades
	* (Nome, IsCalculaIR, IsCalculaINSS)
* A classe de Funcionario terá uma lista de dependentes
* Cálculo de INSS e IR aplicado ao funcionário usando o valor do salário como base.
	* Regras de negócio
		* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso o dependente calcula INSS
		* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
		* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
		* INSS = 1000,00 – 8% = 80,00
		* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.
* Criar a mesma estrutura em um banco de dados e gravar as informações usando uma camada de banco de dados para o acesso

*)

interface

Uses PersistenciaUn, System.Classes, LibUtils, SysUtils;

type
  TDependente = class(TDGRSimpleDataSet)
  private
    function GetIsCalculaINSS: boolean;
    function GetIsCalculaIR: boolean;
    function GetNome: string;
    procedure SetIsCalculaINSS(const Value: boolean);
    procedure SetIsCalculaIR(const Value: boolean);
    procedure SetNome(const Value: string);
    function GetIdFuncionario: integer;
    procedure SetIdFuncionario(const Value: integer);
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    procedure LoadByIdFuncionario(const aIdFuncionario: integer);
    property Nome: string read GetNome write SetNome;
    property IsCalculaIR: boolean read GetIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: boolean read GetIsCalculaINSS write SetIsCalculaINSS;
    property IDFuncionario: integer read GetIdFuncionario write SetIdFuncionario;
  end;

  TFuncionario = class(TDGRSimpleDataSet)
  private
    FDependente: TDependente;
    function GetCPF: string;
    function GetNome: string;
    function GetSalario: currency;
    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure setSalario(const Value: currency);
    function GetINSS: currency;
    function GetIR: currency;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property Nome: string read GetNome write SetNome;
    property CPF: string read GetCPF write SetCPF;
    property Salario: currency read GetSalario write setSalario;
    property Dependentes: TDependente read FDependente;
    property INSS: currency read GetINSS;
    property IR: currency read GetIR;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Funcionario';
  Self.FDependente := TDependente.Create(AOwner, ASQLConnection);
  inherited;
end;

destructor TFuncionario.Destroy;
begin
  Self.FDependente.Free;
  inherited;
end;

function TFuncionario.GetCPF: string;
begin
  Result := Self.FieldByName('CPF').AsString;
end;

function TFuncionario.GetINSS: currency;
var
  _CalculaINSS: boolean;
begin
  Result := 0;
	//	* INSS - O cálculo de INSS será descontado 8% do valor do funcionário caso o dependente calcula INSS
  // * INSS = 1000,00 – 8% = 80,00
  _CalculaINSS := False;
  Self.Dependentes.First;
  while not Self.Dependentes.Eof do
  begin
    if Self.Dependentes.IsCalculaINSS then
    begin
      _CalculaINSS := True;
      Break;
    end;

    Self.Dependentes.Next;
  end;

  if _CalculaINSS then
   Result := Self.Salario * 0.08;
end;

function TFuncionario.GetIR: currency;
var
  _CalculaIR: integer;
begin
//		* IR – O cálculo de IR será deduzido da base, salário 100 reais para cada dependente que possuir calcula IR e por fim desconta 15% do salário do funcionário.
 //		* Ex. Funcionário que ganha 1000,00 e que tenha dois dependentes onde o IsCalculaIR e IsCalculaINSS estejam marcados.
//		* IR = 1000,00 - (2 * 100) = 800,00 – 15% = 120,00.
  _CalculaIR := 0;
  Result := 0;
  Self.Dependentes.First;
  while not Self.Dependentes.Eof do
  begin
    if Self.Dependentes.IsCalculaIR then
      inc(_CalculaIR);
    Self.Dependentes.Next;
  end;

  if _CalculaIR > 0 then
   Result := (Self.Salario - (2 * 100)) * 0.15;

end;

function TFuncionario.GetNome: string;
begin
  Result := Self.FieldByName('Nome').AsString;
end;

function TFuncionario.GetSalario: currency;
begin
  Result := Self.FieldByName('Salario').AsCurrency;
end;

procedure TFuncionario.SetCPF(const Value: string);
begin
  if TLibUtils.IsValidCPF(TLibUtils.OnlyNumbers(Value)) then
    Self.SetFieldValueAsString('CPF', TLibUtils.OnlyNumbers((Value)))
  else
    raise Exception.Create('CPF inválido');
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  Self.SetFieldValueAsString('Nome', Value);
end;

procedure TFuncionario.setSalario(const Value: currency);
begin
  Self.SetFieldValueAsCurrency('Salario', Value);
end;

{ TDependente }

constructor TDependente.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Dependente';
  inherited;
end;

function TDependente.GetIdFuncionario: integer;
begin
  Result := Self.FieldByName('IdFuncionario').AsInteger;
end;

function TDependente.GetIsCalculaINSS: boolean;
begin
  Result := Self.FieldByName('IsCalculaINSS').asInteger.ToBoolean;
end;

function TDependente.GetIsCalculaIR: boolean;
begin
  Result := Self.FieldByName('IsCalculaIR').asInteger.ToBoolean;
end;

function TDependente.GetNome: string;
begin
  Result := Self.FieldByName('Nome').AsString;
end;

procedure TDependente.LoadByIdFuncionario(const aIdFuncionario: integer);
begin
  Self.LoadByFK(aIdFuncionario, 'IdFuncionario');
end;

procedure TDependente.SetIdFuncionario(const Value: integer);
begin
  Self.SetFieldValueAsInteger('IdFuncionario', Value);
end;

procedure TDependente.SetIsCalculaINSS(const Value: boolean);
begin
  Self.SetFieldValueAsInteger('IsCalculaINSS', Value.ToInteger);
end;

procedure TDependente.SetIsCalculaIR(const Value: boolean);
begin
  Self.SetFieldValueAsInteger('IsCalculaIR', Value.ToInteger);
end;

procedure TDependente.SetNome(const Value: string);
begin
  Self.SetFieldValueAsString('Nome', Value);
end;

end.
