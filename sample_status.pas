unit sample_status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniEdit, uniGroupBox,
  uniPageControl, Vcl.MPlayer, unimVideo, uniButton, Vcl.Imaging.jpeg, uniImage,
  uniBasicGrid, uniDBGrid, Vcl.ExtCtrls, uniTimer;

type
  Tsample_status_frame = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniGroupBox3: TUniGroupBox;
    UniEdit1: TUniEdit;
    UniTabSheet2: TUniTabSheet;
    UniImage1: TUniImage;
    UniGroupBox1: TUniGroupBox;
    UniDBGrid1: TUniDBGrid;
    UniGroupBox2: TUniGroupBox;
    UniDBGrid2: TUniDBGrid;
    UniGroupBox4: TUniGroupBox;
    UniEdit2: TUniEdit;
    UniImage2: TUniImage;
    UniTabSheet3: TUniTabSheet;
    UniTabSheet4: TUniTabSheet;
    UniGroupBox5: TUniGroupBox;
    UniDBGrid3: TUniDBGrid;
    UniGroupBox6: TUniGroupBox;
    UniEdit3: TUniEdit;
    UniImage3: TUniImage;
    UniGroupBox7: TUniGroupBox;
    UniEdit4: TUniEdit;
    UniImage4: TUniImage;
    UniGroupBox8: TUniGroupBox;
    UniDBGrid4: TUniDBGrid;
    procedure UniEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure UniEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure UniTabSheet1BeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure UniTabSheet2BeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure UniFrameReady(Sender: TObject);
    procedure UniEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure UniEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure UniTabSheet3BeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure UniTabSheet4BeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, login, ServerModule;

// ��ҳ���ʼ������-------------------------------------------------------------
//
procedure Tsample_status_frame.UniFrameCreate(Sender: TObject);
begin
  if global_authority='����Ա' then
  begin
    UniTabSheet3.Visible:=false;
    UniTabSheet4.Visible:=false;
  end
  else if global_authority='����Ա' then
  begin
    UniTabSheet1.Visible:=false;
    UniTabSheet2.Visible:=false;
  end
  else begin
    //
  end;
end;

procedure Tsample_status_frame.UniFrameReady(Sender: TObject);
begin
  if UniPageControl1.ActivePage=UniTabSheet1 then
  begin
    UniEdit1.SetFocus;
  end
  else if UniPageControl1.ActivePage=UniTabSheet2 then
  begin
    UniEdit2.SetFocus;
  end
  else if UniPageControl1.ActivePage=UniTabSheet3 then
  begin
    UniEdit3.SetFocus;
  end
  else if UniPageControl1.ActivePage=UniTabSheet4 then
  begin
    UniEdit4.SetFocus;
  end;
end;

procedure Tsample_status_frame.UniTabSheet1BeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  UniEdit1.SetFocus;
  //
  with UniMainModule.sample_store_query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_store_table');
    SQL.Add('where sample_status=:sample_status');
    SQL.Add('order by store_stamp desc');
    ParamByName('sample_status').Value:='�����';
    Open;
  end;
end;

procedure Tsample_status_frame.UniTabSheet2BeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  UniEdit2.SetFocus;
  //
  with UniMainModule.sample_store_query2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_store_table');
    SQL.Add('where sample_status=:sample_status');
    SQL.Add('order by leave_stamp desc');
    ParamByName('sample_status').Value:='�ѳ���';
    Open;
  end;
end;

procedure Tsample_status_frame.UniTabSheet3BeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  UniEdit3.SetFocus;
  //
  with UniMainModule.sample_insp_query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_insp_table');
    SQL.Add('where sample_status=:sample_status');
    SQL.Add('order by receive_datetime desc');
    ParamByName('sample_status').Value:='�����';
    Open;
  end;
end;

procedure Tsample_status_frame.UniTabSheet4BeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  UniEdit4.SetFocus;
  //
  with UniMainModule.sample_insp_query2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_insp_table');
    SQL.Add('where sample_status=:sample_status');
    SQL.Add('order by leave_datetime desc');
    ParamByName('sample_status').Value:='�Ѵ���';
    Open;
  end;
end;
//
// ��ҳ���ʼ���������---------------------------------------------------------


procedure Tsample_status_frame.UniEdit1KeyPress(Sender: TObject;  // ��Ʒɨ�������
  var Key: Char);
var
  input_str:string;
  check_label_flag,insert_flag:boolean;
  label_sn,sample_name,inner_sn:string;
  image_filespath:string;
begin
  check_label_flag:=false;
  insert_flag:=false;
  image_filespath:=UniServerModule.FilesFolderPath;
  //
  while (key=#13) and (Trim(UniEdit1.Text)<>'') do  // �������ı�ǩ���Ƿ���Ч
  begin
    input_str:=Trim(UniEdit1.Text);
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn,sample_name,inner_sn from sample_table');
      SQL.Add('where label_sn=:input_str1');
      SQL.Add('or inner_sn=:input_str2');
      ParamByName('input_str1').Value:=input_str;
      ParamByName('input_str2').Value:=input_str;
      Open;
      if RecordCount>0 then  // ��ǩ����Ч���������ж�����
      begin
        check_label_flag:=true;
        label_sn:=Trim(FieldByName('label_sn').AsString);
        sample_name:=Trim(FieldByName('sample_name').AsString);
        inner_sn:=Trim(FieldByName('inner_sn').AsString);
      end
      else begin
        UniImage1.Picture.LoadFromFile(image_filespath+'002.jpg');  // ��ʾ��ǩ�Ŵ���
      end;
    end;
    UniEdit1.Text:='';
  end;
  //
  if check_label_flag then  // ����ǩ���ڿ������Ƿ����غ�
  begin
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn from sample_store_table');
      SQL.Add('where label_sn=:input_str');
      ParamByName('input_str').Value:=label_sn;
      Open;
      if RecordCount>0 then
      begin
        UniImage1.Picture.LoadFromFile(image_filespath+'002.jpg');  // �غţ���ʾ����
      end
      else begin
        UniImage1.Picture.LoadFromFile(image_filespath+'001.jpg');  // û���غţ���ʾ��ȷ
        insert_flag:=true;
      end;
    end;
  end;
  //
  if insert_flag then
  begin
    try
      with UniMainModule.exec_query do  // ������������Ʒ������
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into sample_store_table(label_sn,sample_name,inner_sn,');
        SQL.Add('store_stamp,store_executor,leave_stamp,leave_executor,');
        SQL.Add('sample_status)');
        SQL.Add('values(:label_sn,:sample_name,:inner_sn,');
        SQL.Add(':store_stamp,:store_executor,:leave_stamp,:leave_executor,');
        SQL.Add(':sample_status)');
        ParamByName('label_sn').Value:=label_sn;
        ParamByName('sample_name').Value:=sample_name;
        ParamByName('inner_sn').Value:=inner_sn;
        ParamByName('store_stamp').Value:=FormatDateTime('yyyy-MM-dd',date());
        ParamByName('store_executor').Value:=global_username;
        ParamByName('leave_stamp').Value:='/';
        ParamByName('leave_executor').Value:='/';
        ParamByName('sample_status').Value:='�����';
        Execsql;
      end;
    except
      ShowMessage('��Ʒ�������г��ִ�������ϵ����Ա');
    end;
  end;
  //
  with UniMainModule.sample_store_query1 do  // ˢ����ʾ����
  begin
    Close;
    Open;
  end;
end;

procedure Tsample_status_frame.UniEdit2KeyPress(Sender: TObject; var Key: Char);  // ɨ�����
var
  input_str:string;
  update_flag:boolean;
  image_filespath:string;
  label_sn:string;
begin
  update_flag:=false;
  image_filespath:=UniServerModule.FilesFolderPath;
  //
  while (key=#13) and (Trim(UniEdit2.Text)<>'') do  // �����Ʒ�Ƿ��ڿ�����
  begin
    input_str:=Trim(UniEdit2.Text);
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn from sample_instore_view');
      SQL.Add('where label_sn=:input_str1');
      SQL.Add('or inner_sn=:input_str2');
      ParamByName('input_str1').Value:=input_str;
      ParamByName('input_str2').Value:=input_str;
      Open;
      First;
      if RecordCount>0 then  // ��ǩ�ڿ�����
      begin
        label_sn:=Trim(FieldByName('label_sn').AsString);
        UniImage2.Picture.LoadFromFile(image_filespath+'001.jpg');  // ��ʾ��ȷ
        update_flag:=true;
      end
      else begin
        UniImage2.Picture.LoadFromFile(image_filespath+'002.jpg');  // ��ʾ����
      end;
    end;
    UniEdit2.Text:='';
  end;
  //
  if update_flag then  // ��Ʒ�ڿ�������״̬Ϊ������⡱��ִ�и���������Ϣ����
  begin
    try
      with UniMainModule.exec_query do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update sample_store_table');
        SQL.Add('set leave_stamp=:leave_stamp,leave_executor=:leave_executor,sample_status=:sample_status');
        SQL.Add('where label_sn=:label_sn');
        ParamByName('leave_stamp').Value:=FormatDateTime('yyyy-MM-dd',date());
        ParamByName('leave_executor').Value:=global_username;
        ParamByName('sample_status').Value:='�ѳ���';
        ParamByName('label_sn').Value:=label_sn;
        Execsql;
      end;
    except
      ShowMessageN('��Ʒ��������г��ִ�������ϵ����Ա');
    end;
  end;
  //
  with UniMainModule.sample_store_query2 do  // ˢ����������
  begin
    Close;
    Open;
  end;
end;

procedure Tsample_status_frame.UniEdit3KeyPress(Sender: TObject; var Key: Char);  // ɨ�������Ʒ��⻷��
var
  input_str:string;
  check_label_flag,insert_flag:boolean;
  label_sn,sample_name,inner_sn,remark:string;
  image_filespath:string;
begin
  check_label_flag:=false;
  insert_flag:=false;
  image_filespath:=UniServerModule.FilesFolderPath;
  //
  while (key=#13) and (Trim(UniEdit3.Text)<>'') do  // �������ı�ǩ���Ƿ���Ч
  begin
    input_str:=Trim(UniEdit3.Text);
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn,sample_name,inner_sn,remark from sample_table');
      SQL.Add('where label_sn=:input_str1');
      SQL.Add('or inner_sn=:input_str2');
      ParamByName('input_str1').Value:=input_str;
      ParamByName('input_str2').Value:=input_str;
      Open;
      if RecordCount>0 then  // ��ǩ����Ч���������ж�����
      begin
        check_label_flag:=true;
        label_sn:=Trim(FieldByName('label_sn').AsString);
        sample_name:=Trim(FieldByName('sample_name').AsString);
        inner_sn:=Trim(FieldByName('inner_sn').AsString);
        remark:=Trim(FieldByName('remark').AsString);
      end
      else begin
        UniImage3.Picture.LoadFromFile(image_filespath+'002.jpg');  // ��ʾ��ǩ�Ŵ���
      end;
    end;
    UniEdit3.Text:='';
  end;
  //
  if check_label_flag then  // ��ǩ����Ч�������sample_insp_table���Ƿ����غ�
  begin
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn from sample_insp_table');
      SQL.Add('where label_sn=:input_str');
      ParamByName('input_str').Value:=label_sn;
      Open;
      if RecordCount>0 then
      begin
        UniImage3.Picture.LoadFromFile(image_filespath+'002.jpg');  // �غ�����ʾ����
      end
      else begin
        UniImage3.Picture.LoadFromFile(image_filespath+'001.jpg');  // ���غ�����ʾ��ȷ
        insert_flag:=true;
      end;
    end;
  end;
  //
  if insert_flag then
  begin
    try
      with UniMainModule.exec_query do  // ������������Ʒ������
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into sample_insp_table(label_sn,sample_name,inner_sn,');
        SQL.Add('remark,receive_datetime,leave_datetime,sample_status)');
        SQL.Add('values(:label_sn,:sample_name,:inner_sn,');
        SQL.Add(':remark,:store_datetime,:leave_datetime,:sample_status)');
        ParamByName('label_sn').Value:=label_sn;
        ParamByName('sample_name').Value:=sample_name;
        ParamByName('inner_sn').Value:=inner_sn;
        ParamByName('remark').Value:=remark;
        ParamByName('store_datetime').Value:=FormatDateTime('yyyy-MM-dd_hh:mm:ss',now());
        ParamByName('leave_datetime').Value:='/';
        ParamByName('sample_status').Value:='�����';
        Execsql;
      end;
    except
      ShowMessage('��Ʒ�������г��ִ�������ϵ����Ա');
    end;
    //
    try
      with UniMainModule.exec_query do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update sample_table');
        SQL.Add('set insp_status=:insp_status');
        SQL.Add('where label_sn=:label_sn');
        ParamByName('insp_status').Value:='�����';
        ParamByName('label_sn').Value:=label_sn;
        Execsql;
      end;
    except
      ShowMessageN('����"sample_table.insp_status"Ϊ"�����"�Ĺ����г��ִ�������ϵ����Ա');
    end;
  end;
  //
  with UniMainModule.sample_insp_query1 do  // ˢ����ʾ
  begin
    Close;
    Open;
  end;
end;

procedure Tsample_status_frame.UniEdit4KeyPress(Sender: TObject; var Key: Char);
var
  input_str:string;
  update_flag:boolean;
  image_filespath:string;
  label_sn:string;
begin
  update_flag:=false;
  image_filespath:=UniServerModule.FilesFolderPath;
  //
  while (key=#13) and (Trim(UniEdit4.Text)<>'') do  // �����Ʒ�Ƿ��ڼ�����
  begin
    input_str:=Trim(UniEdit4.Text);
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select label_sn from sample_in_insp_view');
      SQL.Add('where label_sn=:input_str1');
      SQL.Add('or inner_sn=:input_str2');
      ParamByName('input_str1').Value:=input_str;
      ParamByName('input_str2').Value:=input_str;
      Open;
      First;
      if RecordCount>0 then  // ��ǩ�ڼ�����
      begin
        label_sn:=Trim(FieldByName('label_sn').AsString);
        UniImage2.Picture.LoadFromFile(image_filespath+'001.jpg');  // ��ʾ��ȷ
        update_flag:=true;
      end
      else begin
        UniImage2.Picture.LoadFromFile(image_filespath+'002.jpg');  // ��ʾ����
      end;
    end;
    UniEdit4.Text:='';
  end;
  //
  if update_flag then  // ��Ʒ�ڼ�������״̬Ϊ������С���ִ�и���������Ϣ����
  begin
    try
      with UniMainModule.exec_query do  // ������Ʒ����Ʒ�������Ʒ״̬Ϊ�Ѵ���
      begin
        Close;
        SQL.Clear;
        SQL.Add('update sample_insp_table');
        SQL.Add('set leave_datetime=:leave_datetime,sample_status=:sample_status');
        SQL.Add('where label_sn=:label_sn');
        ParamByName('leave_datetime').Value:=FormatDateTime('yyyy-MM-dd_hh:mm:ss',now());
        ParamByName('sample_status').Value:='�Ѵ���';
        ParamByName('label_sn').Value:=label_sn;
        Execsql;
      end;
    except
      ShowMessageN('��Ʒ���ù����г��ִ�������ϵ����Ա');
    end;
    //
    try
      with UniMainModule.exec_query do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update sample_table');
        SQL.Add('set insp_status=:insp_status');
        SQL.Add('where label_sn=:label_sn');
        ParamByName('insp_status').Value:='�Ѽ��';
        ParamByName('label_sn').Value:=label_sn;
        Execsql;
      end;
    except
      ShowMessageN('����"sample_table.insp_status"Ϊ"�Ѽ��"�Ĺ����г��ִ�������ϵ����Ա');
    end;
  end;
  //
  with UniMainModule.sample_insp_query2 do  // ˢ����������
  begin
    Close;
    Open;
  end;
end;



end.
