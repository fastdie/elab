unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniPanel, uniPageControl,
  uniStatusBar, uniGUIBaseClasses, uniTreeView, uniGUIFrame, uniTreeMenu,
  uniLabel;

type
  TMainForm = class(TUniForm)
    UniStatusBar1: TUniStatusBar;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTreeMenu1: TUniTreeMenu;
    procedure UniFormCreate(Sender: TObject);
    procedure UniTreeMenu1Click(Sender: TObject);
  private
    { Private declarations }
  public
    // 自定义过程，用于实现调用FRAME作为PAGECONTROL的TABSHEET
    procedure openPage(pageName:string;pageCaption:string;pageControl:TUniPageControl;newFrame:TUniFrame);
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, login, sample_recode, print_label,
  sample_status, department, user, photo;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

// 自定义过程，用于实现调用FRAME作为PAGECONTROL的TABSHEET
//
procedure TMainForm.openPage(pageName: string; pageCaption: string; pageControl: TUniPageControl; newFrame: TUniFrame);
var
  newTabSheet:TUniTabSheet;
  error:string;
begin
  error:='';
  newTabSheet:=nil;
  //
  newTabSheet:=TUniTabSheet(pageControl.FindChildControl(pageName));
  if not Assigned(newTabSheet) then
  begin
    newTabSheet:=TUniTabSheet.Create(self);
    newTabSheet.PageControl:=pageControl;
    newTabSheet.Name:=pageName;
    newTabSheet.Caption:=pageCaption;
    newTabSheet.Closable:=true;
    newFrame.Parent:=newTabSheet;
    newFrame.Align:=alClient;
  end;
  pageControl.ActivePage:=newTabSheet;
end;
//
// 自定义过程结束


procedure TMainForm.UniTreeMenu1Click(Sender: TObject);  // 点击菜单实现加载FRAME至主窗体
var
  sample_record_frame:Tsample_record_frame;
  print_label_frame:Tprint_label_frame;
  sample_status_frame:Tsample_status_frame;
  dept_frame:Tdept_frame;
  user_frame:Tuser_frame;
  photo_frame:Tphoto_frame;
  newTabSheet:TUniTabSheet;
begin
  if UnitreeMenu1.Selected.Text='样品登记' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename1'));
    if newTabSheet=nil then
    begin
      sample_record_frame:=Tsample_record_frame.Create(self);
      openPage('pagename1','样品登记',UniPageControl1,sample_record_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='打印标签' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename2'));
    if newTabSheet=nil then
    begin
      print_label_frame:=Tprint_label_frame.Create(self);
      openPage('pagename2','打印标签',UniPageControl1,print_label_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='样品流转' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename3'));
    if newTabSheet=nil then
    begin
      sample_status_frame:=Tsample_status_frame.Create(self);
      openPage('pagename3','样品流转',UniPageControl1,sample_status_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='部门管理' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename4'));
    if newTabSheet=nil then
    begin
      dept_frame:=Tdept_frame.Create(self);
      openPage('pagename4','部门管理',UniPageControl1,dept_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='人员管理' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename5'));
    if newTabSheet=nil then
    begin
      user_frame:=Tuser_frame.Create(self);
      openPage('pagename5','人员管理',UniPageControl1,user_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='照片上传' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename6'));
    if newTabSheet=nil then
    begin
      photo_frame:=Tphoto_frame.Create(self);
      openPage('pagename6','照片上传',UniPageControl1,photo_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);  // 主窗口初始化，根据用户权限决定用户能操作的栏目
begin
  if global_authority='管理员' then
  begin
    //
  end
  else if global_authority='部门负责人' then
  begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // 样品登记
    UniTreeMenu1.Items.Item[1].Visible:=false;  // 打印标签
    UniTreeMenu1.Items.Item[2].Visible:=false;  // 样品流转
    UniTreeMenu1.Items.Item[3].Visible:=false;  // 部门管理
    //UniTreeMenu1.Items.Item[4].Visible:=false;  // 用户管理
    UniTreeMenu1.Items.Item[5].Visible:=false;  // 照片上传

  end
  else if global_authority='检验员' then
  begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // 样品登记
    UniTreeMenu1.Items.Item[1].Visible:=false;  // 打印标签
    //UniTreeMenu1.Items.Item[2].Visible:=false;  // 样品流转
    UniTreeMenu1.Items.Item[3].Visible:=false;  // 部门管理
    UniTreeMenu1.Items.Item[4].Visible:=false;  // 用户管理
    UniTreeMenu1.Items.Item[5].Visible:=false;  // 照片上传
  end
  else if global_authority='接样员' then
  begin
    //UniTreeMenu1.Items.Item[0].Visible:=false;  // 样品登记
    //UniTreeMenu1.Items.Item[1].Visible:=false;  // 打印标签
    //UniTreeMenu1.Items.Item[2].Visible:=false;  // 样品流转
    UniTreeMenu1.Items.Item[3].Visible:=false;  // 部门管理
    UniTreeMenu1.Items.Item[4].Visible:=false;  // 用户管理
    //UniTreeMenu1.Items.Item[5].Visible:=false;  // 照片上传
  end
  else begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // 样品登记
    UniTreeMenu1.Items.Item[1].Visible:=false;  // 打印标签
    UniTreeMenu1.Items.Item[2].Visible:=false;  // 样品流转
    UniTreeMenu1.Items.Item[3].Visible:=false;  // 部门管理
    UniTreeMenu1.Items.Item[4].Visible:=false;  // 用户管理
    UniTreeMenu1.Items.Item[5].Visible:=false;  // 照片上传
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
