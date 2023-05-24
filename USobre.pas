unit USobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EAppProt, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFrmSobre = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image2: TImage;
    Label2: TLabel;
    EvAppProtect1: TEvAppProtect;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

uses UPrincipal, ShellApi, DateUtils, UITypes;


procedure TFrmSobre.FormActivate(Sender: TObject);
begin
  Label1.Caption := 'Inicio da Licen�a  -  ' + FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateStart) + #13 +
                    'Licen�a ativa at�  -  ' + FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateEnd);


  Label2.Caption := 'Faltam ' + IntToStr(DaysBetween( Today, EvAppProtect1.DateEnd))+' dias para expirar sua licen�a';

end;

procedure TFrmSobre.FormCreate(Sender: TObject);
const
 Msg = 'Faltam menos de 10 dias para a licen�a expirar. '+ #13 +
 'Deseja renovar agora?';
begin
  if ((EvAppProtect1.DateEnd - Date) < 10) and
    (MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    EvAppProtect1.ResetLockApplication;



end;

procedure TFrmSobre.SpeedButton1Click(Sender: TObject);
begin
EvAppProtect1.ResetLockApplication;
end;

procedure TFrmSobre.SpeedButton2Click(Sender: TObject);
var
  ConsultaEndereco: string;
begin
  ConsultaEndereco := 'https://www.jncenter.com.br';
  ShellExecute(0, 'open', PCHar(ConsultaEndereco), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSobre.SpeedButton3Click(Sender: TObject);
var
  ConsultaEndereco: string;
begin
  ConsultaEndereco := 'https://wa.link/pj1nll';
  ShellExecute(0, 'open', PCHar(ConsultaEndereco), nil, nil, SW_SHOWNORMAL);
end;

end.
