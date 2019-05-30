object print_label_frame: Tprint_label_frame
  Left = 0
  Top = 0
  Width = 1000
  Height = 665
  Hint = #26631#31614#25171#21360
  OnCreate = UniFrameCreate
  Font.Height = -13
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 665
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniGroupBox3: TUniGroupBox
      Left = 20
      Top = 20
      Width = 960
      Height = 120
      Hint = ''
      Caption = #25195#26465#30721#25110#25163#24037#36755#20837#26679#21697#20449#24687#65292#25903#25345#26465#30721#12289'ELAB'#32534#21495#12289#22996#25176#36865#26816#32534#21495#25110#23454#39564#23460#20869#37096#32534#21495
      TabOrder = 1
      object UniEdit13: TUniEdit
        Left = 120
        Top = 40
        Width = 200
        Hint = ''
        Alignment = taCenter
        Text = ''
        ParentFont = False
        Font.Height = -13
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 39
        Top = 40
        Width = 75
        Height = 16
        Hint = ''
        Caption = #26679#21697#20449#24687#65306
        TabOrder = 2
      end
      object UniButton1: TUniButton
        Left = 376
        Top = 40
        Width = 80
        Height = 25
        Hint = ''
        Caption = #25171#21360
        TabOrder = 3
        OnClick = UniButton1Click
      end
    end
    object UniDBGrid1: TUniDBGrid
      Left = 20
      Top = 160
      Width = 960
      Height = 480
      Hint = ''
      DataSource = UniMainModule.dis_print_ds
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      TabOrder = 2
      OnCellClick = UniDBGrid1CellClick
      Columns = <
        item
          FieldName = 'inner_sn'
          Title.Alignment = taCenter
          Title.Caption = #23454#39564#23460#20869#37096#32534#21495
          Title.Font.Height = -13
          Width = 140
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'sample_name'
          Title.Alignment = taCenter
          Title.Caption = #26679#21697#21517#31216
          Title.Font.Height = -13
          Width = 200
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'receive_date'
          Title.Alignment = taCenter
          Title.Caption = #25509#26679#26085#26399
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'client_name'
          Title.Alignment = taCenter
          Title.Caption = #37319#26679#20154'/'#36865#26679#20154
          Title.Font.Height = -13
          Width = 120
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'remark'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Font.Height = -13
          Width = 160
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'sample_quantify'
          Title.Alignment = taCenter
          Title.Caption = #26679#21697#35268#26684
          Title.Font.Height = -13
          Width = 120
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'sample_amount'
          Title.Alignment = taCenter
          Title.Caption = #26679#21697#25968#37327
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'sealed_person'
          Title.Alignment = taCenter
          Title.Caption = #23553#26679#20154
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'sealed_date'
          Title.Alignment = taCenter
          Title.Caption = #23553#26679#26085#26399
          Title.Font.Height = -13
          Width = 100
          Font.Height = -13
          Alignment = taCenter
        end
        item
          FieldName = 'label_sn'
          Title.Alignment = taCenter
          Title.Caption = #26631#31614#21495
          Title.Font.Height = -13
          Width = 200
          Font.Height = -13
          Alignment = taCenter
        end>
    end
  end
end
