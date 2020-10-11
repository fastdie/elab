program elab;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  login in 'login.pas' {UniLoginForm1: TUniLoginForm},
  public_func in 'public_func.pas',
  sample_recode in 'sample_recode.pas' {sample_record_frame: TUniFrame},
  print_label in 'print_label.pas' {print_label_frame: TUniFrame},
  sample_status in 'sample_status.pas' {sample_status_frame: TUniFrame},
  department in 'department.pas' {dept_frame: TUniFrame},
  user in 'user.pas' {user_frame: TUniFrame},
  pdfprint in 'pdfprint.pas' {UniFormPrint: TUniForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
