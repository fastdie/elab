unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, Uni, UniProvider,
  MySQLUniProvider, MemDS, DBAccess;

type
  TUniMainModule = class(TUniGUIMainModule)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    user_ds: TUniDataSource;
    user_query: TUniQuery;
    exec_query: TUniQuery;
    dept_query: TUniQuery;
    sample_store_query1: TUniQuery;
    dept_ds: TUniDataSource;
    sample_store_ds1: TUniDataSource;
    sample_store_query2: TUniQuery;
    sample_store_ds2: TUniDataSource;
    dis_print_query: TUniQuery;
    dis_print_ds: TUniDataSource;
    sample_insp_query1: TUniQuery;
    sample_insp_ds1: TUniDataSource;
    sample_insp_query2: TUniQuery;
    sample_insp_ds2: TUniDataSource;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  dept_code='NNQZHG-';

var
  select_label_sn:string;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  select_label_sn:='';
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
