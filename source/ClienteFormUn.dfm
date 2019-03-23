inherited ClienteForm: TClienteForm
  Caption = 'Cadastro de Cliente'
  ClientHeight = 303
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCadastro: TPageControl
    Height = 303
    ExplicitHeight = 303
    inherited Cadastro: TTabSheet
      ExplicitHeight = 275
      inherited CadastroGroupBox: TGroupBox
        Height = 275
        ExplicitHeight = 275
        object Nome: TLabel [0]
          Left = 19
          Top = 27
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object LogradouroLabel: TLabel [1]
          Left = 19
          Top = 51
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label1: TLabel [2]
          Left = 219
          Top = 51
          Width = 55
          Height = 13
          Caption = 'Nascimento'
        end
        object Label2: TLabel [3]
          Left = 19
          Top = 81
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object Label3: TLabel [4]
          Left = 218
          Top = 108
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label4: TLabel [5]
          Left = 19
          Top = 108
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label5: TLabel [6]
          Left = 387
          Top = 111
          Width = 33
          Height = 13
          Caption = 'Compl.'
        end
        object Cidade: TLabel [7]
          Left = 21
          Top = 133
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label6: TLabel [8]
          Left = 406
          Top = 138
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        inherited GroupBox1: TGroupBox
          Top = 224
          ExplicitTop = 224
        end
        object CPFEdit: TMaskEdit
          Left = 80
          Top = 51
          Width = 115
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object NomeEdit: TMaskEdit
          Left = 80
          Top = 24
          Width = 473
          Height = 21
          TabOrder = 1
          Text = ''
        end
        object NascimentoEdit: TDateTimePicker
          Left = 280
          Top = 51
          Width = 114
          Height = 21
          Date = 43547.471663680550000000
          Time = 43547.471663680550000000
          TabOrder = 3
        end
        object LogradouroEdit: TMaskEdit
          Left = 80
          Top = 78
          Width = 473
          Height = 21
          TabOrder = 4
          Text = ''
        end
        object BairroEdit: TMaskEdit
          Left = 250
          Top = 105
          Width = 115
          Height = 21
          TabOrder = 6
          Text = ''
        end
        object NumeroEdit: TMaskEdit
          Left = 80
          Top = 105
          Width = 115
          Height = 21
          TabOrder = 5
          Text = ''
        end
        object ComplementoEdit: TMaskEdit
          Left = 438
          Top = 108
          Width = 115
          Height = 21
          TabOrder = 7
          Text = ''
        end
        object CidadeEdit: TMaskEdit
          Left = 80
          Top = 132
          Width = 285
          Height = 21
          TabOrder = 8
          Text = ''
        end
        object UFEdit: TMaskEdit
          Left = 438
          Top = 135
          Width = 115
          Height = 21
          TabOrder = 9
          Text = ''
        end
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitHeight = 275
      inherited CodigoEdit: TMaskEdit
        OnKeyPress = CodigoEditKeyPress
      end
      inherited lbxPesquisa: TListBox
        Height = 222
        OnDblClick = lbxPesquisaDblClick
        ExplicitHeight = 222
      end
    end
  end
  inherited CadastroActionList: TActionList
    inherited NovoAction: TAction
      OnExecute = NovoActionExecute
    end
    inherited SalvarAction: TAction
      OnExecute = SalvarActionExecute
    end
  end
end
