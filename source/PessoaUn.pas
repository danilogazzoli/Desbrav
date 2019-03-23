unit PessoaUn;

interface

Uses PersistenciaUn, System.Classes, LibUtils, SysUtils;

Type
  TIdTipoPessoa = (ttFisica=1, ttJuridica=2);

  TTipoPessoa = class(TDGRSimpleDataSet)
  private
    function GetDescricao: string;
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property Descricao: string read GetDescricao;
  end;

  TPessoa = class(TDGRSimpleDataSet)
  private
    function GetCNPJCPF: string;
    function GetRazSoc: string;
    function GetBairro: string;
    function GetCidade: string;
    function GetComplemento: string;
    function GetNumero: string;
    function GetUF: string;

    procedure SetCNPJCPF(const Value: string);
    procedure SetRazSoc(const Value: string);
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetIdTipoPessoa(const Value: TIdTipoPessoa);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);
    function GetIdTipoPessoa: TIdTipoPessoa;
    function GetLogradouro: string;

    procedure SetLogradouro(const Value: string);
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property RazaoSocial: string read GetRazSoc write SetRazSoc;
    property CNPJCPF: string read GetCNPJCPF write SetCNPJCPF;
    property Logradouro: string read GetLogradouro write SetLogradouro;
    property Numero: string read GetNumero write SetNumero;
    property Bairro: string read GetBairro write SetBairro;
    property Complemento: string read GetComplemento write SetComplemento;
    property Cidade: string read GetCidade write SetCidade;
    property UF: string read GetUF write SetUF;
    property IdTipoPessoa: TIdTipoPessoa read GetIdTipoPessoa write SetIdTipoPessoa;
  end;


implementation


{ TPessoa }

constructor TPessoa.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Pessoa';
  inherited;
end;

destructor TPessoa.Destroy;
begin

  inherited;
end;

function TPessoa.GetBairro: string;
begin
  Result := FieldByName('Bairro').AsString
end;

function TPessoa.GetCidade: string;
begin
  Result := FieldByName('Cidade').AsString
end;

function TPessoa.GetCNPJCPF: string;
begin
  Result := FieldByName('CNPJCPF').AsString
end;

function TPessoa.GetComplemento: string;
begin
  Result := FieldByName('Complemento').AsString
end;

function TPessoa.GetIdTipoPessoa: TIdTipoPessoa;
begin
  Result := TIdTipoPessoa(FieldByName('IdTipoPessoa').AsInteger);
end;

function TPessoa.GetLogradouro: string;
begin
  Result := Self.FieldByName('Logradouro').AsString;
end;

function TPessoa.GetNumero: string;
begin
  Result := Self.FieldByName('Numero').AsString
end;

function TPessoa.GetRazSoc: string;
begin
  Result := Self.FieldByName('RazaoSocial').AsString
end;

function TPessoa.GetUF: string;
begin
  Result := Self.FieldByName('UF').AsString
end;

procedure TPessoa.SetBairro(const Value: string);
begin
  Self.SetFieldValueAsString('Bairro', Value);
end;

procedure TPessoa.SetCidade(const Value: string);
begin
  Self.SetFieldValueAsString('Cidade', Value);
end;

procedure TPessoa.SetCNPJCPF(const Value: string);
var
  _s: string;
begin
  _s := TLibUtils.OnlyNumbers(Value);
  if (_s.Length = 11) and (not (TLibUtils.IsValidCPF(_s))) then
    raise Exception.CreateFmt('CPF inválido: %s', [Value]);
  Self.SetFieldValueAsString('CNPJCPF',_s);
end;

procedure TPessoa.SetComplemento(const Value: string);
begin
  Self.SetFieldValueAsString('Complemento', Value);
end;

procedure TPessoa.SetIdTipoPessoa(const Value: TIdTipoPessoa);
begin
  Self.SetFieldValueAsInteger('IDTipoPessoa', Integer(Value));
end;

procedure TPessoa.SetLogradouro(const Value: string);
begin
  Self.SetFieldValueAsString('Logradouro', Value);
end;

procedure TPessoa.SetNumero(const Value: string);
begin
  Self.SetFieldValueAsString('Numero', Value);
end;

procedure TPessoa.SetRazSoc(const Value: string);
begin
  Self.SetFieldValueAsString('RazaoSocial', Value);
end;

procedure TPessoa.SetUF(const Value: string);
begin
  Self.SetFieldValueAsString('UF', Value);
end;

{ TTipoPessoa }

constructor TTipoPessoa.Create(AOwner: TComponent;
  aSQLConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'TipoPessoa';
  inherited;
end;

destructor TTipoPessoa.Destroy;
begin

  inherited;
end;

function TTipoPessoa.GetDescricao: string;
begin
  Result := FieldByName('Descricao').AsString
end;

end.

