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
    Image3: TImage;
    Image4: TImage;
    ExecRestantes: TLabel;
    Image5: TImage;
    Image6: TImage;
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
uses UPrincipal, ShellApi, DateUtils, UITypes;

procedure TFrmSobre.FormActivate(Sender: TObject);
var
  ExecucoesRestantes: Integer;
begin
  // Mostra a data de in�cio e t�rmino da licen�a
  LabelInicioFim.Caption := 'Inicio da Licen�a  -  ' + FormatDateTime('dd/mm/yyyy', WindowsSync.DateStart) + #13 +
                            'Licen�a ativa at�  -  ' + FormatDateTime('dd/mm/yyyy', WindowsSync.DateEnd);

  // Calcula e exibe os dias restantes at� a expira��o da licen�a
  LabelDiasResta.Caption := 'Faltam ' + IntToStr(DaysBetween(Today, WindowsSync.DateEnd)) +
                            ' dias para expirar sua licen�a';

  // Calcula as execu��es restantes
  ExecucoesRestantes := WindowsSync.MaxLoad - WindowsSync.CurrentLoad;

  // Exibe o total de execu��es restantes
//  ExecRestantes.Caption := 'Voc� executou ' + IntToStr(WindowsSync.CurrentLoad) + ' de um total de ' +
//                           IntToStr(WindowsSync.MaxLoad) + ' execu��es. Faltam ' +
//                           IntToStr(ExecucoesRestantes) + ' execu��es.';
  ExecRestantes.Caption := 'Seu programa est� em periodo de teste com ' +
                           IntToStr(WindowsSync.MaxLoad) + ' execu��es. Faltam ' + IntToStr(ExecucoesRestantes) + #13 + #13 +
                           '. Ap�s este periodo, entre contato e fa�a o registro.';
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
