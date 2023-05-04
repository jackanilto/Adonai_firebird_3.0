unit UDocumentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCarteirinhas, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmDocumentos = class(TFrmCarteirinha)
    SpeedButton2: TSpeedButton;
    procedure btnCarteirinhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure buscarTudo();
   procedure buscarNome();
  end;

var
  FrmDocumentos: TFrmDocumentos;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmDocumentos.btnCarteirinhaClick(Sender: TObject);
begin
  DM.CDSCarteira.Open;
  DM.RelCarteira.LoadFromFile(GetCurrentDir + '\Relatorio\RelCartaRecomendacao.fr3');
  DM.RelCarteira.ShowReport();
  btnCarteirinha.Enabled := true;
  buscarTudo; // Ap�s chamar o relatorio, executa a procedure BuscarTudo
end;

procedure TFrmDocumentos.buscarNome;
begin
  dm.QueryMembro.Close;
  dm.QueryMembro.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
  dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome collate win_ptbr LIKE :nome order by nome asc');
  dm.QueryMembro.ParamByName('nome').Value := '%' + edtBuscar.Text + '%'; // o '%' + edtBuscar.Text + '%' retorna qualquer palavra em qualquer posi��o na frase ou nome
  dm.QueryMembro.Open;
end;

procedure TFrmDocumentos.buscarTudo;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
  DM.QueryMembro.Open();
end;

end.