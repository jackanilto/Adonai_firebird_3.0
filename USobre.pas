unit USobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EAppProt, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFrmSobre = class(TForm)
    Image1: TImage;
    LabelInicioFim: TLabel;
    BtnRenovar: TSpeedButton;
    BtnVisitarSite: TSpeedButton;
    BtnWhatsApp: TSpeedButton;
    Image2: TImage;
    LabelDiasResta: TLabel;
    WindowsSync: TEvAppProtect;
    ImgChaves: TImage;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtnRenovarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnVisitarSiteClick(Sender: TObject);
    procedure BtnWhatsAppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

uses UPrincipal, ShellApi, DateUtils, UITypes, UAlerta;


procedure TFrmSobre.FormActivate(Sender: TObject);
begin
  LabelInicioFim.Caption := 'Inicio da Licen�a  -  ' + FormatDateTime('dd/mm/yyyy', WindowsSync.DateStart) + #13 +
                    'Licen�a ativa at�  -  ' + FormatDateTime('dd/mm/yyyy', WindowsSync.DateEnd);


  LabelDiasResta.Caption := 'Faltam ' + IntToStr(DaysBetween( Today, WindowsSync.DateEnd))+' dias para expirar sua licen�a';

end;

procedure TFrmSobre.FormCreate(Sender: TObject);
const
 Msg = 'Faltam menos de 10 dias para a licen�a expirar. '+ #13 +
 'Deseja renovar agora?';
begin
  if ((WindowsSync.DateEnd - Date) < 10) and
    (MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    WindowsSync.ResetLockApplication;

end;

procedure TFrmSobre.BtnRenovarClick(Sender: TObject);
begin
WindowsSync.ResetLockApplication;
end;

procedure TFrmSobre.BtnVisitarSiteClick(Sender: TObject);
var
  ConsultaEndereco: string;
begin
  ConsultaEndereco := 'https://www.jncsolucoes.com.br';
  ShellExecute(0, 'open', PCHar(ConsultaEndereco), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSobre.BtnWhatsAppClick(Sender: TObject);
var
  ConsultaEndereco: string;
begin
  ConsultaEndereco := 'https://wa.link/pj1nll';
  ShellExecute(0, 'open', PCHar(ConsultaEndereco), nil, nil, SW_SHOWNORMAL);
end;

end.
