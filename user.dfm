object user_frame: Tuser_frame
  Left = 0
  Top = 0
  Width = 1000
  Height = 687
  Hint = #20154#21592#31649#29702
  OnCreate = UniFrameCreate
  Font.Height = -13
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 687
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 20
      Top = 20
      Width = 600
      Height = 453
      Hint = ''
      DataSource = UniMainModule.user_ds
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      TabOrder = 1
      Columns = <
        item
          FieldName = 'gong_hao'
          Title.Alignment = taCenter
          Title.Caption = #24037#21495
          Title.Font.Height = -13
          Width = 80
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'user_name'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'user_department'
          Title.Alignment = taCenter
          Title.Caption = #25152#23646#37096#38376
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'user_authority'
          Title.Alignment = taCenter
          Title.Caption = #26435#38480
          Title.Font.Height = -13
          Width = 80
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
        end
        item
          FieldName = 'remark'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end>
    end
    object UniGroupBox1: TUniGroupBox
      Left = 660
      Top = 20
      Width = 320
      Height = 453
      Hint = ''
      Caption = #29992#25143#31649#29702
      TabOrder = 2
      object UniButton2: TUniButton
        Left = 100
        Top = 56
        Width = 120
        Height = 25
        Hint = ''
        Caption = #29992#25143#21551#29992
        TabOrder = 1
        OnClick = UniButton2Click
      end
      object UniButton3: TUniButton
        Left = 100
        Top = 144
        Width = 120
        Height = 25
        Hint = ''
        Caption = #29992#25143#20572#29992
        TabOrder = 2
        OnClick = UniButton3Click
      end
      object UniButton4: TUniButton
        Left = 100
        Top = 224
        Width = 120
        Height = 25
        Hint = ''
        Caption = #37325#32622#23494#30721
        TabOrder = 3
        OnClick = UniButton4Click
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 20
      Top = 496
      Width = 960
      Height = 105
      Hint = ''
      Caption = #26032#22686#29992#25143
      TabOrder = 3
      object UniLabel1: TUniLabel
        Left = 20
        Top = 40
        Width = 45
        Height = 16
        Hint = ''
        Caption = #24037#21495#65306
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 240
        Top = 40
        Width = 45
        Height = 16
        Hint = ''
        Caption = #22995#21517#65306
        TabOrder = 2
      end
      object UniLabel3: TUniLabel
        Left = 460
        Top = 40
        Width = 45
        Height = 16
        Hint = ''
        Caption = #37096#38376#65306
        TabOrder = 3
      end
      object UniLabel4: TUniLabel
        Left = 680
        Top = 40
        Width = 45
        Height = 16
        Hint = ''
        Caption = #26435#38480#65306
        TabOrder = 4
      end
      object UniEdit1: TUniEdit
        Left = 80
        Top = 40
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniEdit2: TUniEdit
        Left = 300
        Top = 40
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object UniComboBox1: TUniComboBox
        Left = 520
        Top = 40
        Width = 120
        Height = 24
        Hint = ''
        Text = ''
        TabOrder = 7
        IconItems = <>
      end
      object UniComboBox2: TUniComboBox
        Left = 740
        Top = 40
        Width = 120
        Height = 24
        Hint = ''
        Text = ''
        Items.Strings = (
          #31649#29702#21592
          #37096#38376#36127#36131#20154
          #26816#39564#21592
          #25509#26679#21592)
        TabOrder = 8
        IconItems = <>
      end
      object UniButton1: TUniButton
        Left = 870
        Top = 40
        Width = 75
        Height = 25
        Hint = ''
        Caption = #20445#23384
        TabOrder = 9
        OnClick = UniButton1Click
      end
    end
  end
end
