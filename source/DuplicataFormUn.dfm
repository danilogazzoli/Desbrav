inherited DuplicataForm: TDuplicataForm
  Caption = 'Cadastro de Duplicata'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcFuncionarios: TPageControl
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 608
    ExplicitHeight = 434
    inherited Cadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 600
      ExplicitHeight = 406
      inherited CadastroGroupBox: TGroupBox
        ExplicitWidth = 600
        ExplicitHeight = 406
        inherited GroupBox1: TGroupBox
          ExplicitLeft = 2
          ExplicitTop = 355
          ExplicitWidth = 596
        end
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 600
      ExplicitHeight = 406
      inherited CodigoEdit: TMaskEdit
        OnKeyPress = nil
      end
      inherited lbxPesquisa: TListBox
        OnDblClick = nil
      end
    end
  end
  inherited CadastroActionList: TActionList
    inherited NovoAction: TAction
      OnExecute = nil
    end
    inherited SalvarAction: TAction
      OnExecute = nil
    end
  end
end
