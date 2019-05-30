unit pdfprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame, frxBarcode,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet, Data.DB, MemDS,
  DBAccess, Uni;

type
  TUniFormPrint = class(TUniForm)
    UniPDFFrame1: TUniPDFFrame;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxBarCodeObject1: TfrxBarCodeObject;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication, MainModule, ServerModule;

{$R *.dfm}




procedure TUniFormPrint.UniFormBeforeShow(Sender: TObject);
var
  print_filename:string;
  pdf_url:string;
  TBarCode1:TfrxBarCodeView;
  label_sn:string;
begin
  with UniMainModule.exec_query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from sample_table');
    SQL.Add('where label_sn=:input_str1');
    SQL.Add('or inner_sn=:input_str2');
    ParamByName('input_str1').value:=select_label_sn;
    ParamByName('input_str2').value:=select_label_sn;
    Open;
    label_sn:=FieldByName('label_sn').AsString;
  end;
  //
  print_filename:=UniServerModule.FilesFolderPath+'008.fr3';
  if not FileExists(print_filename) then
  begin
    ShowMessageN('打印模板文件"'+print_filename+'"不存在');
    self.Close;
  end;
  //
  if UniMainModule.exec_query.RecordCount>0 then
  begin
    frxReport1.Clear;
    frxDBDataset1.UserName:='frxDBDataset1';
    frxReport1.LoadFromFile(print_filename);
    frxReport1.DataSets.Clear;
    frxDBDataset1.DataSet:=UniMainModule.exec_query;
    frxReport1.DataSets.Add(frxDBDataset1);
    //
    TBarCode1:=TfrxBarCodeView(frxReport1.FindObject('BarCode1'));
    if TBarCode1<>nil then
    begin
      if label_sn<>'' then
      begin
        TBarCode1.Text:=label_sn;
      end
      else begin
        TBarCode1.Text:='TEST-20190101000000';
      end;
    end;
    //
    frxReport1.PrintOptions.ShowDialog:=false;
    frxReport1.ShowProgress:=false;
    frxReport1.EngineOptions.SilentMode:=true;
    frxReport1.EngineOptions.EnableThreadSafe:=true;
    frxReport1.EngineOptions.DestroyForms:=false;
    frxReport1.EngineOptions.UseGlobalDataSetList:=false;
    //
    frxPDFExport1.Background:=true;
    frxPDFExport1.ShowProgress:=true;
    frxPDFExport1.ShowDialog:=false;
    //
    frxPDFExport1.FileName:=UniServerModule.NewCacheFileUrl(false,'pdf','','',pdf_url,true);
    frxPDFExport1.DefaultPath:='';
    frxReport1.PreviewOptions.AllowEdit:=false;
    frxReport1.PrepareReport;
    frxReport1.Export(frxPDFExport1);
    UniPDFFrame1.PdfURL:=pdf_url;
  end
  else begin
    ShowMessageN('没有可以打印的记录');
    self.Close;
  end;
end;

end.
