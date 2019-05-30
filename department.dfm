object dept_frame: Tdept_frame
  Left = 0
  Top = 0
  Width = 1000
  Height = 650
  Hint = #37096#38376#31649#29702
  OnCreate = UniFrameCreate
  Font.Height = -13
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 650
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniGroupBox1: TUniGroupBox
      Left = 660
      Top = 20
      Width = 320
      Height = 453
      Hint = ''
      Caption = #37096#38376#31649#29702
      TabOrder = 1
      object UniButton2: TUniButton
        Left = 100
        Top = 56
        Width = 120
        Height = 25
        Hint = ''
        Caption = #37096#38376#21551#29992
        TabOrder = 1
        OnClick = UniButton2Click
      end
      object UniButton3: TUniButton
        Left = 100
        Top = 144
        Width = 120
        Height = 25
        Hint = ''
        Caption = #37096#38376#20572#29992
        TabOrder = 2
        OnClick = UniButton3Click
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 20
      Top = 496
      Width = 960
      Height = 105
      Hint = ''
      Caption = #26032#22686#37096#38376
      TabOrder = 2
      object UniLabel1: TUniLabel
        Left = 20
        Top = 40
        Width = 75
        Height = 16
        Hint = ''
        Caption = #37096#38376#24207#21495#65306
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 300
        Top = 40
        Width = 75
        Height = 16
        Hint = ''
        Caption = #37096#38376#21517#31216#65306
        TabOrder = 2
      end
      object UniEdit1: TUniEdit
        Left = 120
        Top = 40
        Width = 120
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniEdit2: TUniEdit
        Left = 400
        Top = 40
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object UniButton1: TUniButton
        Left = 600
        Top = 40
        Width = 75
        Height = 25
        Hint = ''
        Caption = #20445#23384
        TabOrder = 5
        OnClick = UniButton1Click
      end
    end
    object UniDBGrid1: TUniDBGrid
      Left = 20
      Top = 20
      Width = 600
      Height = 453
      Hint = ''
      DataSource = UniMainModule.dept_ds
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      TabOrder = 3
      Columns = <
        item
          FieldName = 'dept_number'
          Title.Alignment = taCenter
          Title.Caption = #24207#21495
          Title.Font.Height = -13
          Width = 80
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'dept_name'
          Title.Alignment = taCenter
          Title.Caption = #37096#38376#21517#31216
          Title.Font.Height = -13
          Width = 120
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'valid'
          Title.Alignment = taCenter
          Title.Caption = #26159#21542#21551#29992
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end>
    end
  end
end
