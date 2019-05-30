object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 155
  ClientWidth = 342
  Caption = #30331#24405#31383#21475
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  OnCreate = UniLoginFormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object UniEdit1: TUniEdit
    Left = 80
    Top = 40
    Width = 120
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object UniEdit2: TUniEdit
    Left = 80
    Top = 90
    Width = 120
    Hint = ''
    PasswordChar = '*'
    Text = ''
    TabOrder = 1
  end
  object UniLabel1: TUniLabel
    Left = 20
    Top = 40
    Width = 45
    Height = 16
    Hint = ''
    Caption = #24037#21495#65306
    TabOrder = 2
  end
  object UniLabel2: TUniLabel
    Left = 20
    Top = 90
    Width = 45
    Height = 16
    Hint = ''
    Caption = #23494#30721#65306
    TabOrder = 3
  end
  object UniButton1: TUniButton
    Left = 232
    Top = 40
    Width = 75
    Height = 25
    Hint = ''
    Caption = #30331#24405
    TabOrder = 4
    OnClick = UniButton1Click
  end
end
