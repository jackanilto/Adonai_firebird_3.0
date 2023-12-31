unit ULogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmLogos = class(TForm)
    imgLogo: TImage;
    btnAdd: TSpeedButton;
    Label1: TLabel;
    Dialog: TOpenDialog;
    EditPathLogo: TEdit;
    PanelMenu: TPanel;
    BtnSalvar: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGridImgIgrejas: TDBGrid;
    addLOGOCARTAS: TSpeedButton;
    imgCARTAS: TImage;
    EditPathCartas: TEdit;
    DialogCARTAS: TOpenDialog;
    Label2: TLabel;
    Label3: TLabel;
    BtnEditar: TBitBtn;


    function ApplicationPath: String;
    Function PathWithDelim( const APath : String ) : String ;
    function RightStr(const AText: AnsiString; const ACount: Integer): AnsiString;

    procedure btnAddClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGridImgIgrejasDblClick(Sender: TObject);
    procedure addLOGOCARTASClick(Sender: TObject);
  private
    { Private declarations }
    PROCEDURE BUSCARTUDO;
    PROCEDURE RECUPERAFOTO;
  public
    { Public declarations }
  end;

var
  FrmLogos: TFrmLogos;

implementation

{$R *.dfm}

uses UcadastrosGerais, UDM;

function TFrmLogos.ApplicationPath: String;
begin
  {$IfDef ANDROID}
  Result := PathWithDelim(TPath.GetHomePath);
  {$Else}
  Result := PathWithDelim(ExtractFilePath(ParamStr(0)));
  {$EndIf}
end;

procedure TFrmLogos.btnAddClick(Sender: TObject);
var
  dirLogos, logoFilePath: string;
begin
  dirLogos := ApplicationPath + 'Logos';

  if not DirectoryExists(dirLogos) then
    ForceDirectories(dirLogos);

  if Dialog.Execute then
  begin
    // Define o caminho do arquivo de destino
    logoFilePath := dirLogos + '\Carteira.png';

    // Carrega a imagem do arquivo escolhido
    imgLogo.Picture.LoadFromFile(Dialog.FileName);

    // Define o caminho do arquivo com o nome fixo
    EditPathLogo.Text := logoFilePath;

    // Salva a imagem com nome fixo e sobrescreve se j� existir
    imgLogo.Picture.SaveToFile(logoFilePath);
  end;

    BtnSalvar.Enabled     := True;
    btnCANCELAR.Enabled   := True;



end;

procedure TFrmLogos.BtnCancelarClick(Sender: TObject);
begin

   DM.QueryIgrejas.Cancel;
   Messagedlg('A��o cancelada',
   mtInformation, [mbOK],0);

   DM.QueryIgrejas.Close;
   DM.QueryIgrejas.Open;

   buscarTudo;

   BtnSalvar.Enabled     := False;
   btnCANCELAR.Enabled   := False;
   btnAdd.Enabled        := False;
   addLOGOCARTAS.Enabled := False;
   BtnEditar.Enabled     := True;
end;

procedure TFrmLogos.BtnEditarClick(Sender: TObject);
begin
    BtnSalvar.Enabled     := True;
    btnCANCELAR.Enabled   := True;
    btnAdd.Enabled        := True;
    addLOGOCARTAS.Enabled := True;
    BtnEditar.Enabled     := False;

if MessageDlg('Deseja alterar este registro?', MtConfirmation, [mbOK, MbNo],0)=mrOk then
  begin
    DM.QueryIgrejas.Edit;  // colca a QUERY em modo edit
  end
  else
    BtnSalvar.Enabled     := True;
    btnCANCELAR.Enabled   := True;
    btnAdd.Enabled        := True;
    addLOGOCARTAS.Enabled := True;
    // caso o usuario clicar em N�O
  abort;

    BtnSalvar.Enabled     := False;
    btnCANCELAR.Enabled   := False;
    btnAdd.Enabled        := False;
    addLOGOCARTAS.Enabled := False;
    BtnEditar.Enabled     := True;

end;

procedure TFrmLogos.BtnSalvarClick(Sender: TObject);
  begin
  if (EditPathLogo.Text = '') and (EditPathCartas.Text = '') then
  begin
    ShowMessage('Pelo menos um dos campos de imagem deve ser preenchido.');
  end
  else
  begin
    DM.QueryIgrejas.Open;

    // Salvar informa��es da primeira imagem
    if EditPathLogo.Text <> '' then
    begin
      DM.QueryIgrejas.Edit;
      DM.QueryIgrejasLOGO_CARTEIRAS.Value := EditPathLogo.Text;
      DM.QueryIgrejas.Post;
    end;

    // Salvar informa��es da segunda imagem
    if EditPathCartas.Text <> '' then
    begin
      DM.QueryIgrejas.Edit;
      DM.QueryIgrejasLOGO_CARTAS.Value := EditPathCartas.Text;
      DM.QueryIgrejas.Post;
    end;

    Messagedlg('Registros salvos com sucesso!', mtInformation, [mbOK], 0);
    BUSCARTUDO;

    BtnSalvar.Enabled     := False;
    btnCANCELAR.Enabled   := False;
    btnAdd.Enabled        := False;
    addLOGOCARTAS.Enabled := False;
    BtnEditar.Enabled     := True;
  end;
end;

procedure TFrmLogos.BUSCARTUDO;
begin
begin
  DM.QueryIgrejas.Close;
  DM.QueryIgrejas.SQL.Clear;
  DM.QueryIgrejas.SQL.Add('select * from TBL_IGREJAS order by ID asc');
  DM.QueryIgrejas.Open();
end;
end;

procedure TFrmLogos.DBGridImgIgrejasDblClick(Sender: TObject);
begin

    BtnSalvar.Enabled     := True;
    btnCANCELAR.Enabled   := True;
    btnAdd.Enabled        := True;
    addLOGOCARTAS.Enabled := True;

end;

procedure TFrmLogos.FormShow(Sender: TObject);

begin
  // Atualizar os dados antes de abrir o formul�rio
  BUSCARTUDO;
  RECUPERAFOTO;


  DM.TBL_IGREJAS.Active := False;
  DM.TBL_IGREJAS.Active := True;



  // Configurar os bot�es
  BtnSalvar.Enabled     := False;
  btnCANCELAR.Enabled   := False;
  btnAdd.Enabled        := False;
  addLOGOCARTAS.Enabled := False;
  BtnEditar.Enabled     := True;
end;

function TFrmLogos.PathWithDelim(const APath: String): String;
begin
  Result := Trim(APath) ;
  if Result <> '' then
  begin
     {$IfDef FPC}
      Result := IncludeTrailingPathDelimiter(Result);
     {$Else}
      if RightStr(Result,1) <> PathDelim then   { Tem delimitador no final ? }
         Result := Result + PathDelim ;
     {$EndIf}
  end;
end ;

procedure TFrmLogos.RECUPERAFOTO;
var
  LogoPath: string;
begin
  // Carregar a imagem do caminho armazenado no campo LOGO_CARTEIRAS
  if not DM.QueryIgrejas.IsEmpty then
  begin
    LogoPath := DM.QueryIgrejas.FieldByName('LOGO_CARTEIRAS').AsString;

    if FileExists(LogoPath) then
    begin
      imgLogo.Picture.LoadFromFile(LogoPath);
      imgLogo.Visible := True;
    end
    else
    begin
      // Se o arquivo n�o existir, oculte o TImage
      imgLogo.Visible := False;
    end;
  end
  else
  begin
    // Se n�o houver dados, oculte o TImage
    imgLogo.Visible := False;
  end;




  // Carregar a imagem do caminho armazenado no campo LOGO_CARTEIRAS
  if not DM.QueryIgrejas.IsEmpty then
  begin
    LogoPath := DM.QueryIgrejas.FieldByName('LOGO_CARTAS').AsString;

    if FileExists(LogoPath) then
    begin
      imgCARTAS.Picture.LoadFromFile(LogoPath);
      imgCARTAS.Visible := True;
    end
    else
    begin
      // Se o arquivo n�o existir, oculte o TImage
      imgCARTAS.Visible := False;
    end;
  end
  else
  begin
    // Se n�o houver dados, oculte o TImage
    imgCARTAS.Visible := False;
  end;



end;

function TFrmLogos.RightStr(const AText: AnsiString;
  const ACount: Integer): AnsiString;
  begin
    Result := Copy(AText, Length(AText) + 1 - ACount, ACount);
  end;


procedure TFrmLogos.addLOGOCARTASClick(Sender: TObject);
var
  dirLogos, logoFilePath: string;
begin
  dirLogos := ApplicationPath + 'Logos';

  if not DirectoryExists(dirLogos) then
    ForceDirectories(dirLogos);

  if DialogCARTAS.Execute then
  begin
    // Define o caminho do arquivo de destino
    logoFilePath := dirLogos + '\Cartas.png';

    // Define o caminho do arquivo com o nome fixo
    EditPathCartas.Text := logoFilePath;

    // Carrega a imagem do arquivo escolhido
    imgCARTAS.Picture.LoadFromFile(DialogCARTAS.FileName);

    // Salva a imagem com nome fixo e sobrescreve se j� existir
    imgCARTAS.Picture.SaveToFile(logoFilePath);
  end;

    BtnSalvar.Enabled     := True;
    btnCANCELAR.Enabled   := True;


end;

end.

end.
