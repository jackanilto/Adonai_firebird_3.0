unit USplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, ULogin;

type
  TFrmSplash = class(TForm)
    IMGSplash: TImage;
    TimerSplash: TTimer;
    ProgressBarSplash: TProgressBar;
    procedure TimerSplashTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

procedure TFrmSplash.TimerSplashTimer(Sender: TObject);
begin
ProgressBarSplash.Position := ProgressBarSplash.Position +2;
if (ProgressBarSplash.Position = 100) then
begin
  TimerSplash.Enabled := false;
  FrmSplash.Destroy;
  FrmLogin.Show;

end;

end;

end.
