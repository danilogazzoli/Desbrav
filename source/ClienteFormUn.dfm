inherited ClienteForm: TClienteForm
  Caption = 'Cadastro de Cliente'
  ClientHeight = 303
  OnClose = FormClose
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
        object Label1: TLabel [0]
          Left = 219
          Top = 74
          Width = 55
          Height = 13
          Caption = 'Nascimento'
        end
        inherited GroupBox1: TGroupBox
          Top = 224
          ExplicitTop = 224
        end
        inherited IDEdit: TMaskEdit
          TabOrder = 10
        end
        object NascimentoEdit: TDateTimePicker
          Left = 280
          Top = 74
          Width = 114
          Height = 21
          Date = 43547.471663680550000000
          Time = 43547.471663680550000000
          TabOrder = 1
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
