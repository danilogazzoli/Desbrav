object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Principal - Avalia'#231#227'o T'#233'cnica Danilo Gazzoli Resende'
  ClientHeight = 181
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnuPrincipal
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mnuPrincipal: TMainMenu
    Left = 216
    Top = 104
    object Exerccios1: TMenuItem
      Caption = 'Cadastros'
      object Exerccio11: TMenuItem
        Caption = 'Cliente'
        OnClick = Exerccio11Click
      end
      object Exerccio21: TMenuItem
        Caption = 'Fornecedor'
        OnClick = Exerccio21Click
      end
      object Exerccio31: TMenuItem
        Caption = 'Produto'
        OnClick = Exerccio31Click
      end
      object Exerccio41: TMenuItem
        Caption = 'Duplicata'
        OnClick = Exerccio41Click
      end
    end
  end
end
