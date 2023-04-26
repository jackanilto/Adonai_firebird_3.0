unit UGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmGRUPOS = class(TForm)
    Label1: TLabel;
    EditCOD: TEdit;
    EditGRUPOS: TEdit;
    GridGrupos: TDBGrid;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure GridGruposCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure associarcampos;
    procedure buscartudo;
  public
    { Public declarations }
  end;

var
  FrmGRUPOS: TFrmGRUPOS;

implementation

{$R *.dfm}

uses UDM, UCadMembro, ULogin, UPrincipal, UProfissoes;

procedure TFrmGRUPOS.associarcampos;
begin
 DM.TBL_GRUPOS.FieldByName('NOME_GRUPO').Value :=EditGRUPOS.Text;
end;

procedure TFrmGRUPOS.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryGupos.Close;
    DM.QueryGupos.SQL.Clear;
    DM.QueryGupos.SQL.Add('delete from TBL_GRUPOS where ID = :ID');

    DM.QueryGupos.ParamByName('ID').Value := editCod.Text;
    DM.QueryGupos.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solu��o para atualiza grid em tempo de execu��o)
    //reativa a table
    DM.TBL_GRUPOS.Active := false;
    DM.TBL_GRUPOS.Active := true;

    EditGRUPOS.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmGRUPOS.btnEditarClick(Sender: TObject);
begin
if (EditGRUPOS.Text <> '') then
    begin
    associarCampos;
    dm.TBL_GRUPOS.Edit;

    DM.QueryGupos.Close;
    DM.QueryGupos.SQL.Clear;
    DM.QueryGupos.SQL.Add('update TBL_GRUPOS set NOME_GRUPO = :NOME_GRUPO where ID = :ID');
    DM.QueryGupos.ParamByName('NOME_GRUPO').Value := EditGRUPOS.Text;
    DM.QueryGupos.ParamByName('ID').Value := editCod.Text;
    DM.QueryGupos.ExecSql;

    // destativa a table (solu��o para atualiza grid em tempo de execu��o)
    //reativa a table
    DM.TBL_GRUPOS.Active := false;
    DM.TBL_GRUPOS.Active := true;

    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    EditGRUPOS.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmGRUPOS.btnNovoClick(Sender: TObject);
begin
//apos editar um dado esta desbilitando o EditPROFISSAO
EditGRUPOS.Enabled := true; // Reabilita EditPROFISSAO
EditGRUPOS.Text := '';
EditGRUPOS.SetFocus;
EditGRUPOS.Enabled := true;
DM.TBL_GRUPOS.Insert;
BtnSalvar.Enabled := true;
btnNovo.Enabled := true;

btnEditar.Enabled := true;
btnDeletar.Enabled := false;
end;

procedure TFrmGRUPOS.BtnSalvarClick(Sender: TObject);
begin
if (EditGRUPOS.Text <> '')  then
  begin
  associarCampos;
  DM.TBL_GRUPOS.Post;
  buscarTudo;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  EditGRUPOS.Enabled := false;
  // destativa/Reativa table (solu��o para atualiza grid em tempo de execu��o)
  DM.TBL_GRUPOS.Active := false;   // destativa a table
  DM.TBL_GRUPOS.Active := true;    //reativa a table


  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  DM.QueryGupos.Close;
  DM.QueryGupos.Open;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmGRUPOS.buscartudo;
begin
DM.QueryGupos.Close;
DM.QueryGupos.SQL.Clear;
DM.QueryGupos.SQL.Add('select * from TBL_GRUPOS');
DM.QueryGupos.Open();
end;

procedure TFrmGRUPOS.FormShow(Sender: TObject);
begin
DM.TBL_GRUPOS.Active := false;
DM.TBL_GRUPOS.Active := true;
buscarTudo;
btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
end;

procedure TFrmGRUPOS.GridGruposCellClick(Column: TColumn);
begin
DM.TBL_GRUPOS.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
EditGRUPOS.Enabled := true;

if
DM.TBL_GRUPOS.FieldByName('NOME_GRUPO').Value <> null then
//Carrega o dado do DBGrid no EDIT
EditGRUPOS.Text := DM.QueryGupos.FieldByName('NOME_GRUPO').Value;
editCod.Text := DM.TBL_GRUPOS.FieldByName('ID').Value;


end;

end.
