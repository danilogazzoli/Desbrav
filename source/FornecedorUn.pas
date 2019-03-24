unit FornecedorUn;

interface

Uses PersistenciaUn, System.Classes, LibUtils, SysUtils, PessoaUn;

Type
  TFornecedor = class(TDGRSimpleDataSet)
  private
    FPessoa: TPessoa;
    function GetBairro: string;

    function GetCidade: string;
    function GetComplemento: string;
    function GetCNPJ: string;
    function GetNome: string;
    function GetNumero: string;
    function GetUF: string;
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetComplemento(const Value: string);

    procedure SetCNPJ(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);
    function GetPessoa: TPessoa;
    function GetNascimento: TDateTime;

    procedure SetNascimento(const Value: TDateTime);
    function GetLogradouro: string;

    procedure SetLogradouro(const Value: string);
    function GetInscricaoEstadual: string;

    procedure SetInscricaoEstadual(const Value: string);  protected
    procedure DoBeforePost; override;
    procedure DoBeforeApplyUpdates(var OwnerData: OleVariant); override;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property Nome: string read GetNome write SetNome;
    property Nascimento: TDateTime read GetNascimento write SetNascimento;
    property CNPJ: string read GetCNPJ write SetCNPJ;
    property Logradouro: string read GetLogradouro write SetLogradouro;
    property Numero: string read GetNumero write SetNumero;
    property Bairro: string read GetBairro write SetBairro;
    property Complemento: string read GetComplemento write SetComplemento;
    property Cidade: string read GetCidade write SetCidade;
    property UF: string read GetUF write SetUF;
    property InscricaoEstadual: string read GetInscricaoEstadual write SetInscricaoEstadual;
  end;


implementation

{ TFornecedor }

constructor TFornecedor.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection);
begin
  Self.FTableName := 'Fornecedor';
  inherited;
end;

function TFornecedor.GetPessoa: TPessoa;
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

destructor TFornecedor.Destroy;
begin
  FPessoa.Free;
  inherited;
end;

procedure TFornecedor.DoBeforeApplyUpdates(var OwnerData: OleVariant);
begin
  inherited;
  Self.GetPessoa.ApplyUpdates(0);
end;

procedure TFornecedor.DoBeforePost;
begin
  inherited;
  Self.GetPessoa.Edit;
  Self.GetPessoa.SetFieldValueAsInteger('IdTipoPessoa', Integer(ttJuridica));
  Self.GetPessoa.Post;

  Self.Edit;
  Self.SetFieldValueAsInteger('IdPessoa', Self.GetPessoa.FieldByName('Id').AsInteger);
end;

function TFornecedor.GetBairro: string;
begin
  Result := Self.GetPessoa.FieldByName('Bairro').AsString;
end;

function TFornecedor.GetCidade: string;
begin
  Result := Self.GetPessoa.FieldByName('Cidade').AsString;
end;

function TFornecedor.GetComplemento: string;
begin
  Result := Self.GetPessoa.FieldByName('Complemento').AsString;
end;

function TFornecedor.GetInscricaoEstadual: string;
begin
  Result := Self.FieldByName('IE').AsString
end;

function TFornecedor.GetCNPJ: string;
begin
  Result := Self.GetPessoa.FieldByName('CNPJCPF').AsString;
end;

function TFornecedor.GetLogradouro: string;
begin
  Result := Self.GetPessoa.FieldByName('Logradouro').AsString;
end;

function TFornecedor.GetNascimento: TDateTime;
begin
  Result := Self.FieldByName('Nascimento').AsDateTime;
end;

function TFornecedor.GetNome: string;
begin
  Result := Self.GetPessoa.FieldByName('RazaoSocial').AsString;
end;

function TFornecedor.GetNumero: string;
begin
  Result := Self.GetPessoa.FieldByName('Numero').AsString;
end;

function TFornecedor.GetUF: string;
begin
  Result := Self.GetPessoa.FieldByName('UF').AsString;
end;

procedure TFornecedor.SetBairro(const Value: string);
begin
  Self.GetPessoa.Bairro := Value;
end;

procedure TFornecedor.SetCidade(const Value: string);
begin
  Self.GetPessoa.Cidade := Value;
end;

procedure TFornecedor.SetComplemento(const Value: string);
begin
  Self.GetPessoa.Complemento := Value;
end;

procedure TFornecedor.SetInscricaoEstadual(const Value: string);
begin
  Self.SetFieldValueAsString('IE', Value);
end;

procedure TFornecedor.SetCNPJ(const Value: string);
begin
  Self.GetPessoa.CNPJCPF := Value;
end;

procedure TFornecedor.SetLogradouro(const Value: string);
begin
  Self.GetPessoa.Logradouro := Value;
end;

procedure TFornecedor.SetNascimento(const Value: TDateTime);
begin
  Self.SetFieldValueAsDatetime('Nascimento', Value);
end;

procedure TFornecedor.SetNome(const Value: string);
begin
  Self.GetPessoa.RazaoSocial := Value;
end;

procedure TFornecedor.SetNumero(const Value: string);
begin
  Self.getPessoa.Numero := Value;
end;

procedure TFornecedor.SetUF(const Value: string);
begin
  Self.getPessoa.UF := Value;
end;

end.
