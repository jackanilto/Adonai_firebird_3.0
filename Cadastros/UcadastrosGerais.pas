unit UcadastrosGerais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TFrmCadastros = class(TForm)
    btnGRUPOS: TSpeedButton;
    btnTratamentos: TSpeedButton;
    BtnPROFISSOES: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btnGRUPOSClick(Sender: TObject);
    procedure btnTratamentosClick(Sender: TObject);
    procedure BtnPROFISSOESClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastros: TFrmCadastros;

implementation

{$R *.dfm}

uses UPrincipal, UCadGrupos, UProfissoes, UTratamentos, ULogos, UCadIgreja;

procedure TFrmCadastros.btnGRUPOSClick(Sender: TObject);
var
  FrmGRUPOS : TFrmGRUPOS;
  begin
  try
  FrmGRUPOS := TFrmGRUPOS.Create(Self);
  FrmGRUPOS.showmodal;
  finally
  freeandnil(FrmGRUPOS);
  end;
end;

procedure TFrmCadastros.BtnPROFISSOESClick(Sender: TObject);
  var
  FrmCadProfissoes : TFrmCadProfissoes;
begin
  try
  FrmCadProfissoes := TFrmCadProfissoes.Create(Self);
  FrmCadProfissoes.showmodal;
  finally
  freeandnil(FrmCadProfissoes);
  end;
end;

procedure TFrmCadastros.btnTratamentosClick(Sender: TObject);
var
  FrmTRATAMENTOS : TFrmTRATAMENTOS;
begin
  try
  FrmTRATAMENTOS := TFrmTRATAMENTOS.Create(Self);
  FrmTRATAMENTOS.showmodal;
  finally
  freeandnil(FrmTRATAMENTOS);
  end;
end;

procedure TFrmCadastros.SpeedButton1Click(Sender: TObject);
begin
 FrmLogos.ShowModal;
end;

procedure TFrmCadastros.SpeedButton2Click(Sender: TObject);
var
FrmCarteirinha : TfrmCadIgreja;
begin
  try
  frmCadIgreja := TfrmCadIgreja.Create(Self);
  frmCadIgreja.showmodal;
  finally
  freeandnil(FrmCarteirinha);
  end;
end;

end.