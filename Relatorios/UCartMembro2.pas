unit UCartMembro2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFrmCartMembro2 = class(TForm)
    ReportCart2: TRLReport;
    RLSubDetail1: TRLSubDetail;
    FundoCarteira: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCartMembro2: TFrmCartMembro2;

implementation

{$R *.dfm}

uses UDM, UDocumentos;

end.
