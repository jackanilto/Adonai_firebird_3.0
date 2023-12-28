unit UCadGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmGRUPOS = class(TForm)
    Panel1: TPanel;
    btnNovo: TBitBtn;
    BtnEditar: TBitBtn;
    BtnDeletar: TBitBtn;
    btnSalvar: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGridGRUPOS: TDBGrid;
    Label1: TLabel;
    DBEditCodigo: TDBEdit;
    Label2: TLabel;
    DBEditgrupo: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridGRUPOSCellClick(Column: TColumn);
  private
    { Private declarations }
    PROCEDURE LIMPARCAMPOS;
    PROCEDURE BUSCARTUDO;
  public
    { Public declarations }
  end;

var
  FrmGRUPOS: TFrmGRUPOS;

implementation

{$R *.dfm}

uses UDM, UPrincipal, UCadMembroS, UcadastrosGerais;

procedure TFrmGRUPOS.BtnCancelarClick(Sender: TObject);
begin
   DM.QueryGupos.Cancel;
   Messagedlg('A Ação foi cancelada com sucesso!',
   mtInformation, [mbOK],0);

   DM.QueryGupos.Close;
   DM.QueryGupos.Open;

   BUSCARTUDO;
   limparCampos;
   BtnSalvar.Enabled     := False;
   btnNovo.Enabled       := True;
   btnDeletar.Enabled    := False;
   btnEditar.Enabled     := True;
   btnCANCELAR.Enabled   := True;
end;

procedure TFrmGRUPOS.BtnDeletarClick(Sender: TObject);
begin
    BtnSalvar.Enabled := False;
    btnNovo.Enabled := False;
    btnDeletar.Enabled := False;
    btnEditar.Enabled := False;
    btnCANCELAR.Enabled := True;
  if MessageDlg('Deseja deletar este registro?', MtConfirmation, [mbOK, MbNo],0)=mrOk then
  begin
    DM.QueryGupos.Delete;  // colca a QUERY em modo edit

    buscarTudo;
    limparCampos;

    BtnSalvar.Enabled     := False;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := True;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := False;
  end
  else
    BtnSalvar.Enabled     := False;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := True;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := False;

    buscarTudo;
    limparCampos;
    // caso o usuario clicar em NÂO
  abort;

    buscarTudo;
    limparCampos;

    BtnSalvar.Enabled     := False;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := False;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := False;

end;

procedure TFrmGRUPOS.BtnEditarClick(Sender: TObject);
begin
    BtnSalvar.Enabled     := True;
    btnNovo.Enabled       := False;
    btnDeletar.Enabled    := False;
    btnEditar.Enabled     := False;
    btnCANCELAR.Enabled   := True;

if MessageDlg('Deseja alterar este registro?', MtConfirmation, [mbOK, MbNo],0)=mrOk then
  begin
    DM.QueryGupos.Edit;  // colca a QUERY em modo edit
  end
  else
    BtnSalvar.Enabled     := True;
    btnNovo.Enabled       := False;
    btnDeletar.Enabled    := False;
    btnEditar.Enabled     := False;
    btnCANCELAR.Enabled   := True;
    // caso o usuario clicar em NÂO
  abort;

    BtnSalvar.Enabled     := True;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := False;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := True;

end;

procedure TFrmGRUPOS.btnNovoClick(Sender: TObject);
   var prox:Integer;
begin
    DM.QueryGupos.Open;     //Abre
    DM.QueryGupos.Last;     //Move para o Ultimo
    prox:=DM.QueryGuposID.AsInteger + 1;   //  Recebe o ultimo ID e Add +1
    DM.QueryGupos.Append; //  Insere uma linha nova no final da tabela.
    DM.QueryGuposID.AsInteger:=prox;  //Faz o AutoIncremento na tabela
    DBEditgrupo.SetFocus;   // Coloca o Foco ( Cursor ) no Edit Usuario

    //limparCampos();
    BtnSalvar.Enabled     := True;
    btnNovo.Enabled       := False;
    btnDeletar.Enabled    := false;
    btnEditar.Enabled     := False;
    btnCANCELAR.Enabled   := True;

end;

procedure TFrmGRUPOS.btnSalvarClick(Sender: TObject);
begin
    DM.QueryGupos.Edit;
    DM.QueryGupos.Post;  // colca a QUERY em modo Post
    Messagedlg('Registro salvo com sucesso!',
    mtInformation, [mbOK],0);
    LimparCampos;


    BtnSalvar.Enabled     := False;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := False;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := False;

end;

procedure TFrmGRUPOS.BUSCARTUDO;
begin
    DM.QueryGupos.Close;
    DM.QueryGupos.SQL.Clear;
    DM.QueryGupos.SQL.Add('select * from TBL_GRUPOS order by ID asc');
    DM.QueryGupos.Open();
end;

procedure TFrmGRUPOS.DBGridGRUPOSCellClick(Column: TColumn);
begin
    BtnSalvar.Enabled     := False;
    btnNovo.Enabled       := True;
    btnDeletar.Enabled    := True;
    btnEditar.Enabled     := True;
    btnCANCELAR.Enabled   := True;
end;

procedure TFrmGRUPOS.FormShow(Sender: TObject);
begin
     BUSCARTUDO;
end;

procedure TFrmGRUPOS.LIMPARCAMPOS;
begin
  DBEditCODIGO.enabled := False;
  DBEditgrupo.Text  := '';
end;

end.
