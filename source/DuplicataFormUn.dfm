inherited DuplicataForm: TDuplicataForm
  Caption = 'Cadastro de Duplicata'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCadastro: TPageControl
    ActivePage = Cadastro
    inherited Cadastro: TTabSheet
      inherited CadastroGroupBox: TGroupBox
        object Label7: TLabel [0]
          Left = 20
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object Label1: TLabel [1]
          Left = 20
          Top = 51
          Width = 34
          Height = 13
          Caption = 'Pessoa'
        end
        object Label2: TLabel [2]
          Left = 20
          Top = 78
          Width = 57
          Height = 13
          Caption = 'C'#243'd. Barras'
        end
        object Label3: TLabel [3]
          Left = 19
          Top = 105
          Width = 55
          Height = 13
          Caption = 'Vencimento'
        end
        object Label4: TLabel [4]
          Left = 214
          Top = 104
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object IDEdit: TMaskEdit
          Left = 80
          Top = 20
          Width = 115
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = ''
        end
        object PessoaEdit: TMaskEdit
          Left = 80
          Top = 47
          Width = 115
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object RazaoSocialEdit: TMaskEdit
          Left = 201
          Top = 47
          Width = 384
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = ''
        end
        object VencimentoEdit: TDateTimePicker
          Left = 80
          Top = 101
          Width = 114
          Height = 21
          Date = 43547.471663680550000000
          Time = 43547.471663680550000000
          TabOrder = 5
        end
        object ValorEdit: TMaskEdit
          Left = 247
          Top = 101
          Width = 114
          Height = 21
          TabOrder = 6
          Text = ''
        end
        object CodBarrasEdit: TMaskEdit
          Left = 80
          Top = 74
          Width = 505
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
