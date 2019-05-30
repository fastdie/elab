unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniGroupBox,
  uniBasicGrid, uniDBGrid, uniButton, uniMultiItem, uniComboBox, uniEdit,
  uniLabel;

type
  Tuser_frame = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniGroupBox1: TUniGroupBox;
    UniGroupBox2: TUniGroupBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniComboBox1: TUniComboBox;
    UniComboBox2: TUniComboBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, public_func;



procedure Tuser_frame.UniButton1Click(Sender: TObject);  // 新增用户
var
  gong_hao,user_name,user_dept,user_authority:string;
  user_pwd,remark:string;
  valid:boolean;
  error_flag:boolean;
begin
  error_flag:=false;
  user_pwd:=public_func.encoding('000000',public_func.encrypt_key);
  remark:='/';
  valid:=true;
  //
  if length(Trim(UniEdit1.Text))=7 then  // 工号强制7位
  begin
    gong_hao:=Trim(UniEdit1.Text);
  end
  else begin
    error_flag:=true;
  end;
  //
  if (Trim(UniEdit2.Text)<>'') and (length(Trim(UniEdit2.Text))<=10) then  // 姓名
  begin
    user_name:=Trim(UniEdit2.Text);
  end
  else begin
    error_flag:=true;
  end;
  //
  if (Trim(UniComboBox1.Text)<>'') and (length(Trim(UniComboBox1.Text))<=20) then  // 所属部门
  begin
    user_dept:=UniComboBox1.Text;
  end
  else begin
    error_flag:=true;
  end;
  //
  if (Trim(UniComboBox2.Text)<>'') and (length(Trim(UniComboBox2.Text))<=10) then  // 用户权限
  begin
    user_authority:=UniComboBox2.Text;
  end
  else begin
    error_flag:=true;
  end;
  //
  if error_flag then
  begin
    ShowMessageN('用户信息输入有误,请检查后重新输入');
  end
  else begin
    try
      with UniMainModule.exec_query do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into user_table(gong_hao,user_name,user_pwd,');
        SQl.Add('user_department,user_authority,remark,valid)');
        SQL.Add('values(:gong_hao,:user_name,:user_pwd,');
        SQL.Add(':user_department,:user_authority,:remark,:valid)');
        ParamByName('gong_hao').Value:=gong_hao;
        ParamByName('user_name').Value:=user_name;
        ParamByName('user_pwd').Value:=user_pwd;
        ParamByName('user_department').Value:=user_dept;
        ParamByName('user_authority').Value:=user_authority;
        ParamByName('remark').Value:=remark;
        ParamByName('valid').Value:=valid;
        Execsql;
      end;
    except
      ShowMessageN('添加新用户有误，请联系管理员');
    end;
  end;
  //
  with UniMainModule.user_query do
  begin
    Close;
    Open;
  end;
  //
  UniEdit1.Clear;
  UniEdit2.Clear;
end;

procedure Tuser_frame.UniButton2Click(Sender: TObject);  // 用户启用
var
  gong_hao:string;
  valid:boolean;
begin
  gong_hao:=UniMainModule.user_query.FieldByName('gong_hao').AsString;
  valid:=UniMainModule.user_query.FieldByName('valid').AsBoolean;
  //
  if valid then
  begin
    ShowMessageN('用户状态无需修改');
  end
  else begin
    with UniMainModule.exec_query do  // 执行用户启用操作
    try
      Close;
      SQL.Clear;
      SQL.Add('update user_table');
      SQL.Add('set valid=:new_valid');
      SQL.Add('where gong_hao=:gong_hao');
      ParamByName('new_valid').Value:=true;
      ParamByName('gong_hao').Value:=gong_hao;
      Execsql;
    except
      ShowMessageN('启用用户失败，请联系管理员');
    end;
  end;
  //
  with UniMainModule.user_query do  // 刷新表格显示内容
  begin
    Close;
    Open;
  end;
end;

procedure Tuser_frame.UniButton3Click(Sender: TObject);  // 用户停用
var
  gong_hao:string;
  valid:boolean;
begin
  gong_hao:=UniMainModule.user_query.FieldByName('gong_hao').AsString;
  valid:=UniMainModule.user_query.FieldByName('valid').AsBoolean;
  //
  if valid then
  begin
    with UniMainModule.exec_query do  // 执行用户停用操作
    try
      Close;
      SQL.Clear;
      SQL.Add('update user_table');
      SQL.Add('set valid=:new_valid');
      SQL.Add('where gong_hao=:gong_hao');
      ParamByName('new_valid').Value:=false;
      ParamByName('gong_hao').Value:=gong_hao;
      Execsql;
    except
      ShowMessageN('停用用户失败，请联系管理员');
    end;
  end
  else begin
    ShowMessageN('用户状态无需修改');
  end;
  //
  with UniMainModule.user_query do  // 刷新表格显示内容
  begin
    Close;
    Open;
  end;
end;

procedure Tuser_frame.UniButton4Click(Sender: TObject);  // 重置密码
var
  gong_hao:string;
begin
  gong_hao:=UniMainModule.user_query.FieldByName('gong_hao').AsString;
  //
  with UniMainModule.exec_query do  // 执行重置密码操作
  try
    Close;
    SQL.Clear;
    SQL.Add('update user_table');
    SQL.Add('set user_pwd=:user_pwd');
    SQL.Add('where gong_hao=:gong_hao');
    ParamByName('user_pwd').Value:='000000';
    ParamByName('gong_hao').Value:=gong_hao;
    Execsql;
  except
    ShowMessageN('重置密码失败，请联系管理员');
  end;
end;

procedure Tuser_frame.UniFrameCreate(Sender: TObject);  // FRAME窗口初始化
var
  i:integer;
  dept_name:string;
begin
  with UniMainModule.user_query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from user_table');
    SQL.Add('order by gong_hao');
    Open;
  end;
  //
  with UniMainModule.exec_query do
  begin
    Close;
    SQl.Clear;
    SQL.Add('select dept_name from dept_table');
    SQL.Add('where valid=:valid');
    SQL.Add('order by dept_number');
    ParamByName('valid').Value:='1';
    Open;
    First;
    if RecordCount>0 then
    begin
      for i := 0 to RecordCount-1 do
      begin
        dept_name:=Trim(FieldByName('dept_name').AsString);
        UniComboBox1.Items.Add(dept_name);
        Next;
      end;
    end;
  end;
end;

end.
