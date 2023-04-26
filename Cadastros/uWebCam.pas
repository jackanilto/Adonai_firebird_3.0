unit uWebCam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, VSample, VFrames,
  Vcl.Buttons;

type
  TfrmWebCam = class(TForm)
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pbCamera: TPaintBox;
    imgSnapshot: TImage;
    btnFOTOGRAFAR: TSpeedButton;
    btnSALVARFOTO: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnTakeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFOTOGRAFARClick(Sender: TObject);
    procedure btnSALVARFOTOClick(Sender: TObject);
  private
    { Private declarations }
    FVideoImage: TVideoImage;
    FVideoBitmap: TBitmap;
    procedure OnNewVideoFrame(Sender: TObject; Width, Height: integer;
      DataPtr: pointer);
  public
    { Public declarations }
  end;

var
  frmWebCam: TfrmWebCam;

implementation

{$R *.dfm}

procedure TfrmWebCam.btnSaveClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TfrmWebCam.btnTakeClick(Sender: TObject);
begin
  imgSnapshot.Picture.Assign(FVideoBitmap);
end;

//Ao fechar a form, destativa a webcam
procedure TfrmWebCam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FVideoImage.VideoStop;
end;

procedure TfrmWebCam.FormCreate(Sender: TObject);
var
  DevicesList: TStringList;
begin
  FVideoBitmap := TBitmap.Create;
  DevicesList := TStringList.Create;
  FVideoImage := TVideoImage.Create;
  FVideoImage.OnNewVideoFrame := OnNewVideoFrame;
  Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
  FVideoImage.GetListOfDevices(DevicesList);
  FVideoImage.VideoStart(DevicesList.Strings[0]);
  Screen.Cursor := crDefault;
end;

procedure TfrmWebCam.OnNewVideoFrame(Sender: TObject; Width, Height: integer;
  DataPtr: pointer);
var
  I, R : integer;
begin
  // Retreive latest video image
  FVideoImage.GetBitmap(FVideoBitmap);
  // Paint image onto screen, either normally or flipped.
  pbCamera.Canvas.Draw(0, 0, FVideoBitmap);
end;

procedure TfrmWebCam.btnSALVARFOTOClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TfrmWebCam.btnFOTOGRAFARClick(Sender: TObject);
begin
  imgSnapshot.Picture.Assign(FVideoBitmap);
end;

end.
