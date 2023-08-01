unit ULogin;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;
type
  TFrmLogin = class(TForm)
    GrpBxLogin: TGroupBox;
    Image2: TImage;
    BtnLogin: TButton;
    BtnSair: TButton;
    EdtUser: TEdit;
    EdtSenha: TEdit;
    LabelVersao: TLabel;
    ImageLogoLogin: TImage;
    AdonaiSoftware: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    //Cria Procedure para destativar so do Windows
    procedure DisableTabSound;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmLogin: TFrmLogin;
    function VersaoExe: String;
implementation
{$R *.dfm}
uses UDM, UPrincipal, Utema, IniFiles, Vcl.Themes;
 //inicio do login
procedure TFrmLogin.BtnLoginClick(Sender: TObject);
//Verifica o dados na tabela Acesso
begin
 DM.TblAcesso.Open();
    if (DM.TblAcesso.Locate('USUARIO', EdtUser.Text, [])) and (DM.TblAcesso.Locate('SENHA',EdtSenha.Text,[])) then
    Begin
      FrmPrincipal.Show;
      FrmLogin.Hide;
    End
// Verifica se foram preencidos os campos Login e Senha e exibe o alerta
   else
   if (EdtUser.Text ='') and (EdtSenha.Text = '')then
   ShowMessage ('Preencha os campos Login e Senha') // Caso esteja vazio, exiba msg
   else
   MessageDlg('Login ou senha inválidos', mtError, [mbOk], 0); // Caso de digitação errada
end;
  //Fim do codigo login
procedure TFrmLogin.BtnSairClick(Sender: TObject);
begin
Application.Terminate;
end;
//Exibir versao de compilação na tela LOGIN
procedure TFrmLogin.Button2Click(Sender: TObject);
begin
   ShowMessage(VersaoExe);
end;

 // cria função para desabilitar som do windows
 // Dever ser usada no evento OnCreate do form
procedure TFrmLogin.DisableTabSound;
var
  Sound: Integer;
begin
  SystemParametersInfo(SPI_GETBEEP, 0, @Sound, 0);
  if Sound <> 0 then
  begin
    SystemParametersInfo(SPI_SETBEEP, 0, Pointer(0), SPIF_SENDCHANGE);
  end;
end;

function VersaoExe: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;

procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then            // Define o comando enter
    BtnLoginClick(Sender);     // Atribui a função do boatao entrar ao enter
end;
procedure TFrmLogin.EdtUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// define tab on press enter para navegar entre dbedit´s (Login)
if key = vk_return then SelectNext(ActiveControl,True,True);
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
//Função que carrega todos os temas setados na IDE delphi
     TStyleManager.SetStyle(iniConfigura.ReadString('Estilo', 'Estilo', ''));
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
//Função que le o arquivo INI com o tema salvo
  iniConfigura := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Configuracao.ini');
// Mostrar a versao do software na tela de login
 LabelVersao.Caption:= VersaoExe;

// Desabilta Som do Windows
  DisableTabSound;

end;
procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// define tab on press enter para navegar entre dbedit´s  (Senha)
if key = vk_return then SelectNext(ActiveControl,True,True);
end;

procedure TFrmLogin.SpeedButton1Click(Sender: TObject);
//Verifica o dados na tabela Acesso
begin
 DM.TblAcesso.Open();
    if (DM.TblAcesso.Locate('USUARIO', EdtUser.Text, [])) and (DM.TblAcesso.Locate('SENHA',EdtSenha.Text,[])) then
    Begin
      FrmPrincipal.Show;  //Chama a form Principal
      FrmLogin.Hide;      // Esconde a form Login
    End
// Verifica se foram preencidos os campos Login e Senha e exibe o alerta
   else
   if (EdtUser.Text ='') and (EdtSenha.Text = '')then
   ShowMessage ('Preencha os campos Login e Senha') // Caso esteja vazio
   else
   MessageDlg('Login ou senha inválidos', mtError, [mbOk], 0); // Caso de digitação errada
end;
  //Fim do codigo login
end.
