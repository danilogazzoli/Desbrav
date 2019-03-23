inherited FornecedorForm: TFornecedorForm
  Caption = 'Cadastro de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcFuncionarios: TPageControl
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
