unit photo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniURLFrame;

type
  Tphoto_frame = class(TUniFrame)
    UniURLFrame1: TUniURLFrame;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



procedure Tphoto_frame.UniFrameCreate(Sender: TObject);
begin
  UniURLFrame1.URL:='http://111.59.173.10:880/kodexplorer/index.php';
end;

end.
