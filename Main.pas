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
    // �Զ�����̣�����ʵ�ֵ���FRAME��ΪPAGECONTROL��TABSHEET
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

// �Զ�����̣�����ʵ�ֵ���FRAME��ΪPAGECONTROL��TABSHEET
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
// �Զ�����̽���


procedure TMainForm.UniTreeMenu1Click(Sender: TObject);  // ����˵�ʵ�ּ���FRAME��������
var
  sample_record_frame:Tsample_record_frame;
  print_label_frame:Tprint_label_frame;
  sample_status_frame:Tsample_status_frame;
  dept_frame:Tdept_frame;
  user_frame:Tuser_frame;
  photo_frame:Tphoto_frame;
  newTabSheet:TUniTabSheet;
begin
  if UnitreeMenu1.Selected.Text='��Ʒ�Ǽ�' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename1'));
    if newTabSheet=nil then
    begin
      sample_record_frame:=Tsample_record_frame.Create(self);
      openPage('pagename1','��Ʒ�Ǽ�',UniPageControl1,sample_record_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='��ӡ��ǩ' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename2'));
    if newTabSheet=nil then
    begin
      print_label_frame:=Tprint_label_frame.Create(self);
      openPage('pagename2','��ӡ��ǩ',UniPageControl1,print_label_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='��Ʒ��ת' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename3'));
    if newTabSheet=nil then
    begin
      sample_status_frame:=Tsample_status_frame.Create(self);
      openPage('pagename3','��Ʒ��ת',UniPageControl1,sample_status_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='���Ź���' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename4'));
    if newTabSheet=nil then
    begin
      dept_frame:=Tdept_frame.Create(self);
      openPage('pagename4','���Ź���',UniPageControl1,dept_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='��Ա����' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename5'));
    if newTabSheet=nil then
    begin
      user_frame:=Tuser_frame.Create(self);
      openPage('pagename5','��Ա����',UniPageControl1,user_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end
  else if UnitreeMenu1.Selected.Text='��Ƭ�ϴ�' then
  begin
    newTabSheet:=TUniTabSheet(UniPageControl1.FindChildControl('pagename6'));
    if newTabSheet=nil then
    begin
      photo_frame:=Tphoto_frame.Create(self);
      openPage('pagename6','��Ƭ�ϴ�',UniPageControl1,photo_frame);
    end
    else begin
      UniPageControl1.ActivePage:=newTabSheet;
    end;
  end;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);  // �����ڳ�ʼ���������û�Ȩ�޾����û��ܲ�������Ŀ
begin
  if global_authority='����Ա' then
  begin
    //
  end
  else if global_authority='���Ÿ�����' then
  begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // ��Ʒ�Ǽ�
    UniTreeMenu1.Items.Item[1].Visible:=false;  // ��ӡ��ǩ
    UniTreeMenu1.Items.Item[2].Visible:=false;  // ��Ʒ��ת
    UniTreeMenu1.Items.Item[3].Visible:=false;  // ���Ź���
    //UniTreeMenu1.Items.Item[4].Visible:=false;  // �û�����
    UniTreeMenu1.Items.Item[5].Visible:=false;  // ��Ƭ�ϴ�

  end
  else if global_authority='����Ա' then
  begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // ��Ʒ�Ǽ�
    UniTreeMenu1.Items.Item[1].Visible:=false;  // ��ӡ��ǩ
    //UniTreeMenu1.Items.Item[2].Visible:=false;  // ��Ʒ��ת
    UniTreeMenu1.Items.Item[3].Visible:=false;  // ���Ź���
    UniTreeMenu1.Items.Item[4].Visible:=false;  // �û�����
    UniTreeMenu1.Items.Item[5].Visible:=false;  // ��Ƭ�ϴ�
  end
  else if global_authority='����Ա' then
  begin
    //UniTreeMenu1.Items.Item[0].Visible:=false;  // ��Ʒ�Ǽ�
    //UniTreeMenu1.Items.Item[1].Visible:=false;  // ��ӡ��ǩ
    //UniTreeMenu1.Items.Item[2].Visible:=false;  // ��Ʒ��ת
    UniTreeMenu1.Items.Item[3].Visible:=false;  // ���Ź���
    UniTreeMenu1.Items.Item[4].Visible:=false;  // �û�����
    //UniTreeMenu1.Items.Item[5].Visible:=false;  // ��Ƭ�ϴ�
  end
  else begin
    UniTreeMenu1.Items.Item[0].Visible:=false;  // ��Ʒ�Ǽ�
    UniTreeMenu1.Items.Item[1].Visible:=false;  // ��ӡ��ǩ
    UniTreeMenu1.Items.Item[2].Visible:=false;  // ��Ʒ��ת
    UniTreeMenu1.Items.Item[3].Visible:=false;  // ���Ź���
    UniTreeMenu1.Items.Item[4].Visible:=false;  // �û�����
    UniTreeMenu1.Items.Item[5].Visible:=false;  // ��Ƭ�ϴ�
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
