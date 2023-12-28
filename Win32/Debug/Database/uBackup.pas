unit uBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, FireDAC.Stan.Def, FireDAC.VCLUI.Wait, IniFiles,
  FireDAC.Phys.IBWrapper, FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Intf, Vcl.ComCtrls, FireDAC.UI.Intf,
  FireDAC.Comp.UI, Vcl.Mask;

type
  TfBackup = class(TForm)
    pnlBaixo: TPanel;
    BtnBck: TButton;
    FDIBBackup1: TFDIBBackup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDIBRestore1: TFDIBRestore;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    tsBackup: TTabSheet;
    Restore: TTabSheet;
    OpenDialog2: TOpenDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    EdUsuario: TLabeledEdit;
    EdSenha: TLabeledEdit;
    EdOrigem: TLabeledEdit;
    EdHostName: TLabeledEdit;
    EdPorta: TSpinEdit;
    edNomeArq: TEdit;
    btOrigem: TButton;
    Memo1: TMemo;
    EdDestino: TLabeledEdit;
    Panel2: TPanel;
    btOrigemBackup: TButton;
    edOrigemBackup: TLabeledEdit;
    BtnRest: TButton;
    Label2: TLabel;
    lbUltimoBack: TLabel;
    procedure BtnBckClick(Sender: TObject);
    procedure FDIBBackup1AfterExecute(Sender: TObject);
    procedure FDIBBackup1BeforeExecute(Sender: TObject);
    procedure FDIBBackup1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDIBBackup1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btOrigemClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnRestClick(Sender: TObject);
    procedure FDIBRestore1BeforeExecute(Sender: TObject);
    procedure FDIBRestore1AfterExecute(Sender: TObject);
    procedure FDIBRestore1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDIBRestore1Progress(ASender: TFDPhysDriverService;
      const AMessage: string);
  private
    { Private declarations }
    ini: TIniFile;
    data: string;
    procedure Salvar;
  public
    { Public declarations }
  end;

var
  fBackup: TfBackup;

implementation

{$R *.dfm}

procedure TfBackup.Salvar;
begin
end;

procedure TfBackup.BtnBckClick(Sender: TObject);
begin

  SaveDialog1.FileName := edNomeArq.Text + data;
  if SaveDialog1.Execute then
  begin
    EdDestino.Text := ExtractFileDir(SaveDialog1.FileName);
    // edNomeArq.Text := ExtractFileName(SaveDialog1.FileName);

    // ##############  Salvar  ##############
    if edNomeArq.Text <> '' then
    begin

      FDIBBackup1.UserName := EdUsuario.Text;
      FDIBBackup1.Password := EdSenha.Text;
      FDIBBackup1.Host := EdHostName.Text;
      FDIBBackup1.Port := EdPorta.Value;
      FDIBBackup1.Protocol := ipTCPIP;
      FDIBBackup1.Database := EdOrigem.Text;
      FDIBBackup1.BackupFiles.Text := EdDestino.Text + '\' + edNomeArq.Text +
        data + '.bck';
      FDIBBackup1.Backup;

      if DirectoryExists(EdDestino.Text) then
      begin
        ShowMessage('Copia Realizada com Sucesso');
        ini.WriteString('FBDBX', 'Usuario', EdUsuario.Text);
        ini.WriteString('FBDBX', 'Senha', EdSenha.Text);
        ini.WriteString('FBDBX', 'Origem', EdOrigem.Text);
        ini.WriteString('FBDBX', 'HostName', EdHostName.Text);
        ini.WriteString('FBDBX', 'Porta', EdPorta.Text);
        ini.WriteString('FBDBX', 'Destino', EdDestino.Text);
        ini.WriteString('FBDBX', 'NomeArq', edNomeArq.Text);
      end
      else
      begin
        ShowMessage('Erro - Copia mal Sucedida');
      end;

    end

  end
  else
  begin
    ShowMessage('Erro - todos os campos são obrigatorio');
    if edNomeArq.Text = '' then
      edNomeArq.SetFocus
  end;
end;

procedure TfBackup.BtnRestClick(Sender: TObject);
begin
  try
    FDIBRestore1.UserName := EdUsuario.Text;
    FDIBRestore1.Password := EdSenha.Text;
    FDIBRestore1.Host := EdHostName.Text;
    FDIBRestore1.Port := EdPorta.Value;
    FDIBRestore1.Protocol := ipTCPIP;
    FDIBRestore1.Verbose := True;
    FDIBRestore1.Database := EdOrigem.Text;
    FDIBRestore1.BackupFiles.Text := edOrigemBackup.Text;
    FDIBRestore1.Restore;
    ShowMessage('Ação Realizada com Sucesso');
    ini.WriteString('FBDBX', 'OrigemBackup', edOrigemBackup.Text);
  except
    ShowMessage('Erro ao Restaurar Arquivo');
  end;
end;

procedure TfBackup.btOrigemClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'ECDB.FDB';
  if OpenDialog1.Execute then
  begin
    EdOrigem.Text := OpenDialog1.FileName;
  end;
end;

procedure TfBackup.Button3Click(Sender: TObject);
begin
  OpenDialog2.FileName := '';
  if OpenDialog2.Execute then
  begin
    edOrigemBackup.Text := OpenDialog2.FileName;
  end;
end;

procedure TfBackup.FDIBBackup1AfterExecute(Sender: TObject);
begin
  Memo1.Lines.Add('FBDBX conluído com sucesso!');
end;

procedure TfBackup.FDIBBackup1BeforeExecute(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TfBackup.FDIBBackup1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Memo1.Lines.Add('Erro');
  Memo1.Lines.Add(AException.Message);
end;

procedure TfBackup.FDIBBackup1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
end;

procedure TfBackup.FDIBRestore1AfterExecute(Sender: TObject);
begin
  Memo1.Lines.Add('FBDBX conluído com sucesso!');
end;

procedure TfBackup.FDIBRestore1BeforeExecute(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TfBackup.FDIBRestore1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  Memo1.Lines.Add('Erro');
  Memo1.Lines.Add(AException.Message);
end;

procedure TfBackup.FDIBRestore1Progress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo1.Lines.Add(AMessage);
end;

procedure TfBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ini.Free;
end;

procedure TfBackup.FormShow(Sender: TObject);
var
  i: Integer;
  NomeAq, ver: string;
begin
  NomeAq := '';
  data := '_' + Copy(DateToStr(Date), 1, 2) + '_' + Copy(DateToStr(Date), 4, 2)
    + '_' + Copy(DateToStr(Date), 7, 4);
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'bd.ini');
  if ini.ReadString('FBDBX', 'Origem', '') <> '' then
  begin

    if ini.ReadString('FBDBX', 'Destino', '') <> '' then
    begin
      if DirectoryExists(ini.ReadString('FBDBX', 'Destino', '')) then
        EdDestino.Text := ini.ReadString('FBDBX', 'Destino', '')
      else
        EdDestino.Text := 'C:';
    end;
    // ########## Norme do Arquivo ##########
    // i := Length(ini.ReadString('FBDBX', 'Origem', ''));
    // while (ver <> '\') do
    // begin
    // NomeAq := ver + NomeAq;
    // ver := Copy(ini.ReadString('FBDBX', 'Origem', ''), i, 1);
    // i := i - 1;
    // end;

    edNomeArq.Text := ini.ReadString('FBDBX', 'NomeArq', '');
  end;

  // ########## Origem do banco ##########
  // if ini.ReadString('FBDBX', 'Origem', '') <> '' then
  // begin
  // if FileExists(ini.ReadString('FBDBX', 'Origem', '')) then
  EdOrigem.Text := ini.ReadString('FBDBX', 'Origem', '');
  // else
  // EdOrigem.Text := 'C:';
  // end;

  // ########## Destino do backup ##########
  if ini.ReadString('FBDBX', 'Destino', '') <> '' then
  begin
    if DirectoryExists(ini.ReadString('FBDBX', 'Destino', '')) then
      EdDestino.Text := ini.ReadString('FBDBX', 'Destino', '')
    else
      EdDestino.Text := 'C:';
  end;

  // ########## HostName ##########
  if ini.ReadString('FBDBX', 'HostName', '') <> '' then
  begin
    EdHostName.Text := ini.ReadString('FBDBX', 'HostName', '')
  end
  else
  begin
    EdHostName.Text := 'LocalHost';
  end;

  lbUltimoBack.Caption := ini.ReadString('FBDBX', 'OrigemBackup', '');

  PageControl1.ActivePage := tsBackup;

end;

end.
