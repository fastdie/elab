object sample_status_frame: Tsample_status_frame
  Left = 0
  Top = 0
  Width = 1000
  Height = 644
  Hint = #26679#21697#27969#36716
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -13
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 644
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object UniPageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 998
      Height = 642
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = #25509#26679'>>'#30041#26679
        OnBeforeActivate = UniTabSheet1BeforeActivate
        object UniGroupBox3: TUniGroupBox
          Left = 20
          Top = 20
          Width = 760
          Height = 120
          Hint = ''
          Caption = #25195#25551#26465#30721#65292#23558#30041#23384#26679#21697#20837#24211#33267#30041#26679#23460
          TabOrder = 0
          object UniEdit1: TUniEdit
            Left = 2
            Top = 15
            Width = 756
            Height = 103
            Hint = ''
            Alignment = taCenter
            Text = ''
            ParentFont = False
            Font.Height = -53
            Align = alClient
            TabOrder = 1
            OnKeyPress = UniEdit1KeyPress
          end
        end
        object UniImage1: TUniImage
          Left = 840
          Top = 20
          Width = 120
          Height = 120
          Hint = ''
        end
        object UniGroupBox1: TUniGroupBox
          Left = 20
          Top = 160
          Width = 940
          Height = 425
          Hint = ''
          Caption = #30041#23384#26679#21697#20449#24687
          TabOrder = 2
          object UniDBGrid1: TUniDBGrid
            Left = 16
            Top = 24
            Width = 913
            Height = 385
            Hint = ''
            DataSource = UniMainModule.sample_store_ds1
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
            Columns = <
              item
                FieldName = 'sample_name'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#21517#31216
                Title.Font.Height = -13
                Width = 120
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'inner_sn'
                Title.Alignment = taCenter
                Title.Caption = #23454#39564#23460#20869#37096#32534#21495
                Title.Font.Height = -13
                Width = 200
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'store_stamp'
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#26102#38388
                Title.Font.Height = -13
                Width = 160
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'leave_stamp'
                Title.Alignment = taCenter
                Title.Caption = #20986#24211#26102#38388
                Title.Font.Height = -13
                Width = 160
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'sample_status'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#29366#24577
                Title.Font.Height = -13
                Width = 120
                Font.Height = -13
                Alignment = taCenter
              end>
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = #30041#26679'>>'#22788#32622
        OnBeforeActivate = UniTabSheet2BeforeActivate
        object UniGroupBox2: TUniGroupBox
          Left = 20
          Top = 160
          Width = 940
          Height = 425
          Hint = ''
          Caption = #30041#23384#26679#21697#20449#24687
          TabOrder = 0
          object UniDBGrid2: TUniDBGrid
            Left = 16
            Top = 24
            Width = 913
            Height = 385
            Hint = ''
            DataSource = UniMainModule.sample_store_ds2
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
            Columns = <
              item
                FieldName = 'sample_name'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#21517#31216
                Title.Font.Height = -13
                Width = 120
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'inner_sn'
                Title.Alignment = taCenter
                Title.Caption = #23454#39564#23460#20869#37096#32534#21495
                Title.Font.Height = -13
                Width = 200
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'store_stamp'
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#26102#38388
                Title.Font.Height = -13
                Width = 160
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'leave_stamp'
                Title.Alignment = taCenter
                Title.Caption = #20986#24211#26102#38388
                Title.Font.Height = -13
                Width = 160
                Font.Height = -13
                Alignment = taCenter
              end
              item
                FieldName = 'sample_status'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#29366#24577
                Title.Font.Height = -13
                Width = 120
                Font.Height = -13
                Alignment = taCenter
              end>
          end
        end
        object UniGroupBox4: TUniGroupBox
          Left = 20
          Top = 20
          Width = 760
          Height = 120
          Hint = ''
          Caption = #25195#25551#26465#30721#65292#22788#32622#30041#26679#23460#20013#20445#23384#30340#26679#21697
          TabOrder = 1
          object UniEdit2: TUniEdit
            Left = 2
            Top = 15
            Width = 756
            Height = 103
            Hint = ''
            Alignment = taCenter
            Text = ''
            ParentFont = False
            Font.Height = -53
            Align = alClient
            TabOrder = 1
            OnKeyPress = UniEdit2KeyPress
          end
        end
        object UniImage2: TUniImage
          Left = 840
          Top = 20
          Width = 120
          Height = 120
          Hint = ''
        end
      end
      object UniTabSheet3: TUniTabSheet
        Hint = ''
        Caption = #25509#26679'>>'#26816#39564
        OnBeforeActivate = UniTabSheet3BeforeActivate
        object UniGroupBox5: TUniGroupBox
          Left = 20
          Top = 160
          Width = 940
          Height = 425
          Hint = ''
          Caption = #26816#27979#20013#30340#26679#21697#20449#24687
          TabOrder = 0
          object UniDBGrid3: TUniDBGrid
            Left = 16
            Top = 24
            Width = 913
            Height = 385
            Hint = ''
            DataSource = UniMainModule.sample_insp_ds1
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
            Columns = <
              item
                FieldName = 'sample_name'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#21517#31216
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'inner_sn'
                Title.Alignment = taCenter
                Title.Caption = #23454#39564#23460#20869#37096#32534#21495
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'remark'
                Title.Alignment = taCenter
                Title.Caption = #26816#27979#39033#30446
                Width = 300
                Alignment = taCenter
              end
              item
                FieldName = 'receive_datetime'
                Title.Alignment = taCenter
                Title.Caption = #26816#27979#29615#33410#25509#26679#26102#38388
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'sample_status'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#29366#24577
                Width = 80
                Alignment = taCenter
              end>
          end
        end
        object UniGroupBox6: TUniGroupBox
          Left = 20
          Top = 20
          Width = 760
          Height = 120
          Hint = ''
          Caption = #25195#25551#26465#30721#65292#23558#26816#27979#26679#21697#30331#35760#21040#24037#20316#32452#21517#19979
          TabOrder = 1
          object UniEdit3: TUniEdit
            Left = 2
            Top = 15
            Width = 756
            Height = 103
            Hint = ''
            Alignment = taCenter
            Text = ''
            ParentFont = False
            Font.Height = -53
            Align = alClient
            TabOrder = 1
            OnKeyPress = UniEdit3KeyPress
          end
        end
        object UniImage3: TUniImage
          Left = 840
          Top = 20
          Width = 120
          Height = 120
          Hint = ''
        end
      end
      object UniTabSheet4: TUniTabSheet
        Hint = ''
        Caption = #26816#27605'>>'#22788#32622
        OnBeforeActivate = UniTabSheet4BeforeActivate
        object UniGroupBox7: TUniGroupBox
          Left = 20
          Top = 20
          Width = 760
          Height = 120
          Hint = ''
          Caption = #25195#25551#26465#30721#65292#23558#26816#27979#26679#21697#30331#35760#21040#24037#20316#32452#21517#19979
          TabOrder = 0
          object UniEdit4: TUniEdit
            Left = 2
            Top = 15
            Width = 756
            Height = 103
            Hint = ''
            Alignment = taCenter
            Text = ''
            ParentFont = False
            Font.Height = -53
            Align = alClient
            TabOrder = 1
            OnKeyPress = UniEdit4KeyPress
          end
        end
        object UniImage4: TUniImage
          Left = 840
          Top = 20
          Width = 120
          Height = 120
          Hint = ''
        end
        object UniGroupBox8: TUniGroupBox
          Left = 20
          Top = 160
          Width = 940
          Height = 425
          Hint = ''
          Caption = #26816#27979#20013#30340#26679#21697#20449#24687
          TabOrder = 2
          object UniDBGrid4: TUniDBGrid
            Left = 16
            Top = 24
            Width = 913
            Height = 385
            Hint = ''
            DataSource = UniMainModule.sample_insp_ds2
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
            Columns = <
              item
                FieldName = 'sample_name'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#21517#31216
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'inner_sn'
                Title.Alignment = taCenter
                Title.Caption = #23454#39564#23460#20869#37096#32534#21495
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'remark'
                Title.Alignment = taCenter
                Title.Caption = #26816#27979#39033#30446
                Width = 300
                Alignment = taCenter
              end
              item
                FieldName = 'receive_datetime'
                Title.Alignment = taCenter
                Title.Caption = #26816#27979#29615#33410#25509#26679#26102#38388
                Width = 160
                Alignment = taCenter
              end
              item
                FieldName = 'sample_status'
                Title.Alignment = taCenter
                Title.Caption = #26679#21697#29366#24577
                Width = 80
                Alignment = taCenter
              end>
          end
        end
      end
    end
  end
end
