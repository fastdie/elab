object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  Height = 581
  Width = 763
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'elab'
    Username = 'fastdie'
    Server = '111.59.173.10'
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
    EncryptedPassword = 'AEFFA5FFC7FFC7FFC7FFC7FFC7FFC7FFC7FFC7FF97FF98FF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 160
    Top = 24
  end
  object user_ds: TUniDataSource
    DataSet = user_query
    Left = 672
    Top = 48
  end
  object user_query: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from user_table')
    Left = 528
    Top = 48
  end
  object exec_query: TUniQuery
    Connection = UniConnection1
    Left = 408
    Top = 48
  end
  object dept_query: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from dept_table')
    Active = True
    Left = 528
    Top = 120
  end
  object sample_store_query1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from sample_store_table'
      'where sample_status='#39#24050#20837#24211#39
      'order by inner_sn')
    Active = True
    Left = 528
    Top = 200
  end
  object dept_ds: TUniDataSource
    DataSet = dept_query
    Left = 672
    Top = 120
  end
  object sample_store_ds1: TUniDataSource
    DataSet = sample_store_query1
    Left = 672
    Top = 200
  end
  object sample_store_query2: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from sample_store_table')
    Left = 528
    Top = 288
  end
  object sample_store_ds2: TUniDataSource
    DataSet = sample_store_query2
    Left = 672
    Top = 288
  end
  object dis_print_query: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from sample_table'
      'order by label_sn desc')
    Active = True
    Left = 528
    Top = 360
  end
  object dis_print_ds: TUniDataSource
    DataSet = dis_print_query
    Left = 672
    Top = 360
  end
  object sample_insp_query1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from sample_insp_table')
    Active = True
    Left = 528
    Top = 424
  end
  object sample_insp_ds1: TUniDataSource
    DataSet = sample_insp_query1
    Left = 672
    Top = 424
  end
  object sample_insp_query2: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from sample_insp_table')
    Active = True
    Left = 528
    Top = 488
  end
  object sample_insp_ds2: TUniDataSource
    DataSet = sample_insp_query2
    Left = 672
    Top = 488
  end
end
