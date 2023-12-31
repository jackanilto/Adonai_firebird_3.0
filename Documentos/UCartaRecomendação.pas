unit UCartaRecomenda��o;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFrmCartaApresentacao = class(TForm)
    RLReport1: TRLReport;
    RLBandRecomenda: TRLBand;
    imgLOGO: TRLImage;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    procedure RLBandRecomendaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCartaApresentacao: TFrmCartaApresentacao;

implementation

{$R *.dfm}

uses UDM, UDocumentos;

procedure TFrmCartaApresentacao.RLBandRecomendaBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  CaminhoImagem: string;
begin
  // Certifique-se de que o campo IMAGEM cont�m o caminho completo da imagem
  CaminhoImagem := DM.QueryIgrejasLOGO_CARTAS.AsString;

  if Trim(CaminhoImagem) <> '' then
  begin
    try
      // Tente carregar a imagem
      imgLOGO.Picture.LoadFromFile(CaminhoImagem);
    except
      on E: Exception do
      begin
        // Em caso de erro, exiba uma mensagem ou trate conforme necess�rio
        ShowMessage('Erro ao carregar a imagem: ' + E.Message);
      end;
    end;
  end
  else
  begin
    // Se o campo IMAGEM estiver vazio, talvez exiba uma imagem padr�o ou trate conforme necess�rio
    imgLOGO.Picture := nil; // Isso pode ser substitu�do por uma imagem padr�o, se desejar
  end;
end;

end.
