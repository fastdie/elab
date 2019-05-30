unit print_label;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniEdit, unimVideo,
  uniButton, uniMultiItem, uniComboBox, uniLabel, uniGroupBox, uniBasicGrid,
  uniDBGrid, frxBarcode, frxClass, frxDBSet, UniProvider, MySQLUniProvider,
  Data.DB, DBAccess, Uni, MemDS, frxExportBaseDialog, frxExportPDF;

type
  Tprint_label_frame = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniGroupBox3: TUniGroupBox;
    UniEdit13: TUniEdit;
    UniLabel1: TUniLabel;
    UniButton1: TUniButton;
    UniDBGrid1: TUniDBGrid;
    procedure UniButton1Click(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, ServerModule, pdfprint;



procedure Tprint_label_frame.UniButton1Click(Sender: TObject);
var
  input_str:string;
  input_flag:boolean;
  error_str:string;
  formprint:TUniFormPrint;
begin
  input_flag:=true;
  error_str:='';
  //
  if Trim(UniEdit13.text)<>'' then
  begin
    input_str:=Trim(UniEdit13.text);
  end
  else begin
    input_flag:=false;
    error_str:=error_str + '输入信息不符合规格,';
  end;
  //
  if input_flag then
  begin
    with UniMainModule.exec_query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from sample_table');
      SQL.Add('where label_sn=:input_str1');
      SQL.Add('or inner_sn=:input_str2');
      ParamByName('input_str1').value:=input_str;
      ParamByName('input_str2').value:=input_str;
      Open;
      if RecordCount>0 then
      begin
        MainModule.select_label_sn:=input_str;
        formprint:=TUniFormPrint.Create(UniApplication);  // uses 里面加上 uniGUIApplication
        formprint.ShowModal();
      end
      else begin
        ShowMessageN('输入的样品信息不正确');
      end;
    end;
  end
  else begin
    ShowMessageN(error_str);
  end;
  UniEdit13.Text:='';
end;

procedure Tprint_label_frame.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  with UniMainModule.dis_print_query do
  begin
    UniEdit13.Text:=FieldByName('inner_sn').AsString;
  end;
end;

procedure Tprint_label_frame.UniFrameCreate(Sender: TObject);
begin
  with UniMainModule.dis_print_query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_table');
    SQL.Add('order by label_sn desc');
    Open;
  end;
end;

end.
