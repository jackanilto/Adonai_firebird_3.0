unit USuporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,  ShellAPI,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmSuporte = class(TForm)
    BtnSuporte: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Image1: TImage;
    procedure BtnSuporteClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSuporte: TFrmSuporte;

implementation

{$R *.dfm}

uses UPrincipal, uBackup;

procedure TFrmSuporte.BtnSuporteClick(Sender: TObject);
var
  CaminhoExe: string;
begin
  // Especifique o caminho completo para o arquivo .exe que voc� deseja abrir
  CaminhoExe := 'Support\AnyDesk.exe'; // Substitua pelo caminho do seu arquivo .exe

  // Abre o arquivo .exe
  ShellExecute(0, 'open', PChar(CaminhoExe), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSuporte.SpeedButton4Click(Sender: TObject);
  var
  fBackup : TfBackup;
begin
  try
  fBackup := TfBackup.Create(Self);
  fBackup.showmodal;
  finally
  freeandnil(fBackup);
  end;
end;


end.
