object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 401
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 125
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 171
    Width = 61
    Height = 13
    Caption = 'Renda Anual'
  end
  object Label3: TLabel
    Left = 8
    Top = 229
    Width = 99
    Height = 13
    Caption = 'N'#250'mero Empregados'
  end
  object Label4: TLabel
    Left = 8
    Top = 285
    Width = 87
    Height = 13
    Caption = 'Despesas Medicas'
  end
  object edtNome: TEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object radioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 121
    Height = 63
    Caption = 'Tipo Contribuinte'
    Items.Strings = (
      'Fisica'
      'Juridica')
    TabOrder = 1
    OnClick = radioGroupClick
  end
  object edtRendaAnual: TNumberBox
    Left = 8
    Top = 190
    Width = 121
    Height = 21
    CurrencyFormat = 4
    Mode = nbmCurrency
    TabOrder = 2
  end
  object edtNrEmpregados: TEdit
    Left = 8
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtDespesasMedicas: TNumberBox
    Left = 8
    Top = 304
    Width = 121
    Height = 21
    Mode = nbmCurrency
    TabOrder = 4
  end
  object memo: TMemo
    Left = 144
    Top = 144
    Width = 313
    Height = 181
    TabOrder = 5
  end
  object Button1: TButton
    Left = 8
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 6
    OnClick = Button1Click
  end
  object chkSimples: TCheckBox
    Left = 8
    Top = 77
    Width = 97
    Height = 17
    Caption = 'Simples'
    TabOrder = 7
  end
  object Button2: TButton
    Left = 89
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = Button2Click
  end
end
