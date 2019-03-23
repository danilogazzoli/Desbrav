inherited ClienteForm: TClienteForm
  Caption = 'Cadastro de Cliente'
  ClientHeight = 303
  OnClose = FormClose
  ExplicitWidth = 624
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
          Top = 50
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object LogradouroLabel: TLabel [1]
          Left = 19
          Top = 74
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label1: TLabel [2]
          Left = 219
          Top = 74
          Width = 55
          Height = 13
          Caption = 'Nascimento'
        end
        object Label2: TLabel [3]
          Left = 19
          Top = 104
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object Label3: TLabel [4]
          Left = 218
          Top = 131
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label4: TLabel [5]
          Left = 19
          Top = 131
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label5: TLabel [6]
          Left = 387
          Top = 134
          Width = 33
          Height = 13
          Caption = 'Compl.'
        end
        object Cidade: TLabel [7]
          Left = 21
          Top = 156
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label6: TLabel [8]
          Left = 406
          Top = 161
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label7: TLabel [9]
          Left = 20
          Top = 24
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        inherited GroupBox1: TGroupBox
          Top = 224
          ExplicitTop = 224
        end
        object CPFEdit: TMaskEdit
          Left = 80
          Top = 74
          Width = 115
          Height = 21
          TabOrder = 3
          Text = ''
        end
        object NomeEdit: TMaskEdit
          Left = 80
          Top = 47
          Width = 473
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object NascimentoEdit: TDateTimePicker
          Left = 280
          Top = 74
          Width = 114
          Height = 21
          Date = 43547.471663680550000000
          Time = 43547.471663680550000000
          TabOrder = 4
        end
        object LogradouroEdit: TMaskEdit
          Left = 80
          Top = 101
          Width = 473
          Height = 21
          TabOrder = 5
          Text = ''
        end
        object BairroEdit: TMaskEdit
          Left = 250
          Top = 128
          Width = 115
          Height = 21
          TabOrder = 7
          Text = ''
        end
        object NumeroEdit: TMaskEdit
          Left = 80
          Top = 128
          Width = 115
          Height = 21
          TabOrder = 6
          Text = ''
        end
        object ComplementoEdit: TMaskEdit
          Left = 438
          Top = 131
          Width = 115
          Height = 21
          TabOrder = 8
          Text = ''
        end
        object CidadeEdit: TMaskEdit
          Left = 80
          Top = 155
          Width = 285
          Height = 21
          TabOrder = 9
          Text = ''
        end
        object UFEdit: TMaskEdit
          Left = 438
          Top = 158
          Width = 115
          Height = 21
          TabOrder = 10
          Text = ''
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
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 600
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
