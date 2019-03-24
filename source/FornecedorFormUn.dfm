inherited FornecedorForm: TFornecedorForm
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 308
  OnClose = FormClose
  ExplicitHeight = 347
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCadastro: TPageControl
    Height = 308
    ActivePage = Cadastro
    inherited Cadastro: TTabSheet
      inherited CadastroGroupBox: TGroupBox
        Height = 280
        inherited LogradouroLabel: TLabel
          Width = 25
          Caption = 'CNPJ'
          ExplicitWidth = 25
        end
        object Label1: TLabel [9]
          Left = 218
          Top = 74
          Width = 10
          Height = 13
          Caption = 'IE'
        end
        inherited GroupBox1: TGroupBox
          Top = 229
        end
        inherited LogradouroEdit: TMaskEdit
          TabOrder = 5
        end
        inherited NumeroEdit: TMaskEdit
          TabOrder = 6
        end
        inherited BairroEdit: TMaskEdit
          TabOrder = 7
        end
        inherited ComplementoEdit: TMaskEdit
          TabOrder = 8
        end
        inherited UFEdit: TMaskEdit
          TabOrder = 10
        end
        object IEEdit: TMaskEdit
          Left = 250
          Top = 74
          Width = 115
          Height = 21
          TabOrder = 4
          Text = ''
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited CodigoEdit: TMaskEdit
        OnKeyPress = CodigoEditKeyPress
      end
      inherited lbxPesquisa: TListBox
        Height = 227
        ExplicitHeight = 227
      end
    end
  end
  inherited CadastroActionList: TActionList
    inherited NovoAction: TAction
      OnExecute = NovoActionExecute
    end
    inherited CancelarAction: TAction
      OnExecute = CancelarActionExecute
    end
    inherited SalvarAction: TAction
      OnExecute = SalvarActionExecute
    end
    inherited ExcluirAction: TAction
      OnExecute = ExcluirActionExecute
    end
  end
end
