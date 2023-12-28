unit UCartMembro1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrmCartMembro1 = class(TForm)
    FrmRelCarteira1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    FundoCarteira: TImage;
    FotoMembro: TImage;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCartMembro1: TFrmCartMembro1;


implementation

{$R *.dfm}

uses UDM, UDocumentos;

procedure TFrmCartMembro1.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  CaminhoImagem: string;
begin
  // Certifique-se de que o campo IMAGEM contém o caminho completo da imagem
  CaminhoImagem := DM.cDSCarteiraIMAGEM.AsString;

  if Trim(CaminhoImagem) <> '' then
  begin
    try
      // Tente carregar a imagem
      FotoMembro.Picture.LoadFromFile(CaminhoImagem);
    except
      on E: Exception do
      begin
        // Em caso de erro, exiba uma mensagem ou trate conforme necessário
        ShowMessage('Erro ao carregar a imagem: ' + E.Message);
      end;
    end;
  end
  else
  begin
    // Se o campo IMAGEM estiver vazio, talvez exiba uma imagem padrão ou trate conforme necessário
    FotoMembro.Picture := nil; // Isso pode ser substituído por uma imagem padrão, se desejar
  end;
end;
end.
