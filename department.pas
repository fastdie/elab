unit department;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniGroupBox;

type
  Tdept_frame = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniGroupBox2: TUniGroupBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniButton1: TUniButton;
    UniDBGrid1: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule;



procedure Tdept_frame.UniButton1Click(Sender: TObject);
var
  dept_number,dept_name:string;
  valid:boolean;
  error_flag:boolean;
  i:integer;
begin
  error_flag:=false;
  valid:=true;
  //
  if length(Trim(UniEdit1.Text))=2 then  // 部门序号强制2位
  begin
    try
      i:=strtoint(Trim(UniEdit1.Text));
      dept_number:=Trim(UniEdit1.Text);
    except
      error_flag:=true;
    end;
  end
  else begin
    error_flag:=true;
  end;
  //
  if (Trim(UniEdit2.Text)<>'') and (length(Trim(UniEdit2.Text))<=10) then  // 部门名称
  begin
    dept_name:=Trim(UniEdit2.Text);
  end
  else begin
    error_flag:=true;
  end;
  //
  if error_flag then
  begin
    ShowMessageN('部门信息输入有误,请检查后重新输入');
  end
  else begin
    try
      with UniMainModule.exec_query do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into dept_table(dept_number,dept_name,valid)');
        SQL.Add('values(:dept_number,:dept_name,:valid)');
        ParamByName('dept_number').Value:=dept_number;
        ParamByName('dept_name').Value:=dept_name;
        ParamByName('valid').Value:=valid;
        Execsql;
      end;
    except
      ShowMessageN('添加部门有误，请联系管理员');
    end;
  end;
  //
  with UniMainModule.dept_query do
  begin
    Close;
    Open;
  end;
  //
  UniEdit1.Clear;
  UniEdit2.Clear;
end;

procedure Tdept_frame.UniButton2Click(Sender: TObject);  // 部门启用
var
  dept_number:string;
  valid:boolean;
begin
  dept_number:=UniMainModule.dept_query.FieldByName('dept_number').AsString;
  valid:=UniMainModule.dept_query.FieldByName('valid').AsBoolean;
  //
  if valid then
  begin
    ShowMessageN('部门状态无需修改');
  end
  else begin
    with UniMainModule.exec_query do  // 执行部门启用操作
    try
      Close;
      SQL.Clear;
      SQL.Add('update dept_table');
      SQL.Add('set valid=:new_valid');
      SQL.Add('where dept_number=:dept_number');
      ParamByName('new_valid').Value:=true;
      ParamByName('dept_number').Value:=dept_number;
      Execsql;
    except
      ShowMessageN('启用部门失败，请联系管理员');
    end;
  end;
  //
  with UniMainModule.dept_query do  // 刷新表格显示
  begin
    Close;
    Open;
  end;
end;

procedure Tdept_frame.UniButton3Click(Sender: TObject);// 部门停用
var
  dept_number:string;
  valid:boolean;
begin
  dept_number:=UniMainModule.dept_query.FieldByName('dept_number').AsString;
  valid:=UniMainModule.dept_query.FieldByName('valid').AsBoolean;
  //
  if valid then
  begin
    with UniMainModule.exec_query do  // 执行部门停用操作
    try
      Close;
      SQL.Clear;
      SQL.Add('update dept_table');
      SQL.Add('set valid=:new_valid');
      SQL.Add('where dept_number=:dept_number');
      ParamByName('new_valid').Value:=false;
      ParamByName('dept_number').Value:=dept_number;
      Execsql;
    except
      ShowMessageN('停用用户失败，请联系管理员');
    end;
  end
  else begin
    ShowMessageN('用户状态无需修改');
  end;
  //
  with UniMainModule.dept_query do  // 刷新表格显示内容
  begin
    Close;
    Open;
  end;
end;

procedure Tdept_frame.UniFrameCreate(Sender: TObject);  // FRAME 初始化
begin
  with UniMainModule.dept_query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from dept_table');
    SQL.Add('order by dept_number');
    Open;
  end;
  //
end;

end.
