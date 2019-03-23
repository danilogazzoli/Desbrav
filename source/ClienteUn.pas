unit ClienteUn;

interface

Uses PersistenciaUn, System.Classes, LibUtils, SysUtils, PessoaUn;

Type
  TCliente = class(TDGRSimpleDataSet)
  private
    FPessoa: TPessoa;
    function GetBairro: string;

    function GetCidade: string;
    function GetComplemento: string;
    function GetCPF: string;
    function GetNome: string;
    function GetNumero: string;
    function GetUF: string;
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetComplemento(const Value: string);

    procedure SetCPF(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);
    function GetPessoa: TPessoa;
    function GetNascimento: TDateTime;

    procedure SetNascimento(const Value: TDateTime);
    function GetLogradouro: string;

    procedure SetLogradouro(const Value: string);
  protected
    procedure DoBeforePost; override;
    procedure DoBeforeApplyUpdates(var OwnerData: OleVariant); override;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property Nome: string read GetNome write SetNome;
    property Nascimento: TDateTime read GetNascimento write SetNascimento;
    property CPF: string read GetCPF write SetCPF;
    property Logradouro: string read GetLogradouro write SetLogradouro;
    property Numero: string read GetNumero write SetNumero;
    property Bairro: string read GetBairro write SetBairro;
    property Complemento: string read GetComplemento write SetComplemento;
    property Cidade: string read GetCidade write SetCidade;
    property UF: string read GetUF write SetUF;
  end;


implementation

{ TCliente }

constructor TCliente.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Cliente';
  inherited;
end;

function TCliente.GetPessoa: TPessoa;
begin
  if (Self.FPessoa = nil) then
  begin
    FPessoa := TPessoa.Create(Self, TDGRSQLConnection(Self.DataSet.SQLConnection));
    FPessoa.LoadById(Self.FieldByName('IdPessoa').AsInteger);
    if Self.FieldByName('IdPessoa').IsNull then
    begin
      Self.GetPessoa.Insert;
      Self.SetFieldValueAsInteger('IdPessoa', Self.GetPessoa.ID);
    end;
  end;
  Result := Self.FPessoa;
end;

destructor TCliente.Destroy;
begin
  FPessoa.Free;
  inherited;
end;

procedure TCliente.DoBeforeApplyUpdates(var OwnerData: OleVariant);
begin
  inherited;
  Self.GetPessoa.ApplyUpdates(0);
end;

procedure TCliente.DoBeforePost;
begin
  inherited;
  Self.GetPessoa.Post;

  Self.Edit;
  Self.SetFieldValueAsInteger('IdPessoa', Self.GetPessoa.FieldByName('Id').AsInteger);
end;

function TCliente.GetBairro: string;
begin
  Result := Self.GetPessoa.FieldByName('Bairro').AsString;
end;

function TCliente.GetCidade: string;
begin
  Result := Self.GetPessoa.FieldByName('Cidade').AsString;
end;

function TCliente.GetComplemento: string;
begin
  Result := Self.GetPessoa.FieldByName('Complemento').AsString;
end;

function TCliente.GetCPF: string;
begin
  Result := Self.GetPessoa.FieldByName('CNPJCPF').AsString;
end;

function TCliente.GetLogradouro: string;
begin
  Result := Self.GetPessoa.FieldByName('Logradouro').AsString;
end;

function TCliente.GetNascimento: TDateTime;
begin
  Result := Self.FieldByName('Nascimento').AsDateTime;
end;

function TCliente.GetNome: string;
begin
  Result := Self.GetPessoa.FieldByName('RazaoSocial').AsString;
end;

function TCliente.GetNumero: string;
begin
  Result := Self.GetPessoa.FieldByName('Numero').AsString;
end;

function TCliente.GetUF: string;
begin
  Result := Self.GetPessoa.FieldByName('UF').AsString;
end;

procedure TCliente.SetBairro(const Value: string);
begin
  Self.GetPessoa.Bairro := Value;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  Self.GetPessoa.Cidade := Value;
end;

procedure TCliente.SetComplemento(const Value: string);
begin
  Self.GetPessoa.Complemento := Value;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  Self.GetPessoa.CNPJCPF := Value;
end;

procedure TCliente.SetLogradouro(const Value: string);
begin
  Self.GetPessoa.Logradouro := Value;
end;

procedure TCliente.SetNascimento(const Value: TDateTime);
begin
  Self.SetFieldValueAsDatetime('Nascimento', Value);
end;

procedure TCliente.SetNome(const Value: string);
begin
  Self.GetPessoa.RazaoSocial := Value;
end;

procedure TCliente.SetNumero(const Value: string);
begin
  Self.getPessoa.Numero := Value;
end;

procedure TCliente.SetUF(const Value: string);
begin
  Self.getPessoa.UF := Value;
end;

end.
