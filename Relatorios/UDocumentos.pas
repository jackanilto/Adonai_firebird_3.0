unit UDocumentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCarteirinhas, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFrmDocumentos = class(TFrmCarteirinha)
    btnLimpaListaDocumentos: TSpeedButton;
    btnCertificaBatismo: TSpeedButton;
    EditPATHFOTO: TDBEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    cbCarteira: TComboBox;
    btnGerarCarteira: TSpeedButton;
    GroupBox1: TGroupBox;
    btnAbrir: TSpeedButton;
    cbCARTAS: TComboBox;
    GroupBox3: TGroupBox;
    btnCertificados: TSpeedButton;
    cbCERTIFICADO: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnLimpaListaDocumentosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGerarCarteiraClick(Sender: TObject);
    procedure cbCarteiraChange(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure cbCARTASChange(Sender: TObject);
    procedure cbCERTIFICADOChange(Sender: TObject);
    procedure btnCertificadosClick(Sender: TObject);
  private
    const
      CaminhoRelatorio = '\Relatorio\';
  private
    procedure AdicionarItensAoComboBox;
    procedure GerarCarta(const NomeCarta: string);
    procedure GerarCertificadoBatismo;
    procedure CARREGARLISTACARTAS;
    procedure CARREGARCERTICABATISMO;
    procedure GerarCarteira(const NomeRelatorio: string);
    procedure AbrirDataset;
    procedure GerarCertificados(const NomeCertificado: string);
    public
      procedure buscarTudo;
      procedure buscarNome;
      procedure GerarRelatorio(const NomeRelatorio: string);
  end;

var
  FrmDocumentos: TFrmDocumentos;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmDocumentos.AbrirDataset;
begin
  DM.CDSCarteira.Open;
end;

procedure TFrmDocumentos.GerarCarta(const NomeCarta: string);
begin
  try
    AbrirDataset;

    // Constrói o caminho completo para o relatório
    DM.CDSCarteira.Open;
    DM.CartaRecomendacao.LoadFromFile(GetCurrentDir + CaminhoRelatorio + 'CartaRecomendacao.fr3');
    DM.CartaApresentacao.LoadFromFile(GetCurrentDir + CaminhoRelatorio + 'CartaApresentacao.fr3');
    DM.AniverCasamento.LoadFromFile(GetCurrentDir + CaminhoRelatorio + 'CartaAniverCasamento.fr3');
    DM.Transferencia.LoadFromFile(GetCurrentDir + CaminhoRelatorio + 'CartaTransferencia.fr3');

    if (NomeCarta = 'Recomendacao') then
      DM.CartaRecomendacao.ShowReport
    else if (NomeCarta = 'Apresentacao') then
      DM.CartaApresentacao.ShowReport
    else if (NomeCarta = 'Aniv. Casamento') then
      DM.AniverCasamento.ShowReport
    else if (NomeCarta = 'Transferencia') then
      DM.Transferencia.ShowReport
    else
      raise Exception.Create('Relatório não encontrado.');

    buscarTudo;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
    end;
  end;
end;

procedure TFrmDocumentos.GerarCarteira(const NomeRelatorio: string);
begin
  try
    AbrirDataset;

    if NomeRelatorio = 'Carteira 1' then
      DM.RelCarteira1.ShowReport
    else if NomeRelatorio = 'Carteira 2' then
      DM.RelCarteira2.ShowReport
    else if NomeRelatorio = 'Carteira 3' then
      DM.RelCarteira3.ShowReport
    else
      raise Exception.Create('Relatório não encontrado.');

    buscarTudo;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
    end;
  end;
end;

procedure TFrmDocumentos.GerarCertificadoBatismo;
var
  NomeCertificado: string;
  CaminhoCompleto: string;
begin
  try
    AbrirDataset;

    // Verifica se o item foi selecionado no ComboBox
    if cbCERTIFICADO.ItemIndex = -1 then
    begin
      ShowMessage('Selecione um certificado para gerar.');
      Exit;
    end;

    // Obtém o nome do certificado selecionado no ComboBox
    NomeCertificado := cbCERTIFICADO.Items[cbCERTIFICADO.ItemIndex];

    // Constrói o caminho completo para o relatório
    CaminhoCompleto := GetCurrentDir + CaminhoRelatorio + NomeCertificado + '.fr3';

    if FileExists(CaminhoCompleto) then
    begin
      // Carrega o relatório correspondente
      if NomeCertificado = 'Certificado 1' then
      begin
        DM.CertificadoBatismo1.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo1.ShowReport;
      end
      else if NomeCertificado = 'Certificado 2' then
      begin
        DM.CertificadoBatismo2.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo2.ShowReport;
      end
      else if NomeCertificado = 'Certificado 3' then
      begin
        DM.CertificadoBatismo3.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo3.ShowReport;
      end
      else if NomeCertificado = 'Certificado 4' then
      begin
        DM.CertificadoBatismo4.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo4.ShowReport;
      end
      else if NomeCertificado = 'Certificado 5' then
      begin
        DM.CertificadoBatismo5.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo5.ShowReport;
      end
      else if NomeCertificado = 'Certificado 6' then
      begin
        DM.CertificadoBatismo6.LoadFromFile(CaminhoCompleto);
        DM.CertificadoBatismo6.ShowReport;
      end
      else
        raise Exception.Create('Relatório não encontrado: ' + CaminhoCompleto);

      buscarTudo;
    end
    else
      ShowMessage('Relatório não encontrado. Caminho: ' + CaminhoCompleto);

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
    end;
  end;
end;
procedure TFrmDocumentos.GerarCertificados(const NomeCertificado: string);
begin
  try
    AbrirDataset;

    if (NomeCertificado = 'Certificado 1') then
      DM.CertificadoBatismo1.ShowReport
    else if (NomeCertificado = 'Certificado 2') then
      DM.CertificadoBatismo2.ShowReport
    else if (NomeCertificado = 'Certificado 3') then
      DM.CertificadoBatismo3.ShowReport
    else if (NomeCertificado = 'Certificado 4') then
      DM.CertificadoBatismo4.ShowReport
    else if (NomeCertificado = 'Certificado 5') then
      DM.CertificadoBatismo5.ShowReport
    else if (NomeCertificado = 'Certificado 6') then
      DM.CertificadoBatismo6.ShowReport
    else
      raise Exception.Create('Relatório não encontrado.');

    buscarTudo;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
    end;
  end;
end;

procedure TFrmDocumentos.GerarRelatorio(const NomeRelatorio: string);
begin
  try
    AbrirDataset;

    if NomeRelatorio = 'Carteira 1' then
      DM.RelCarteira1.ShowReport
    else if NomeRelatorio = 'Carteira 2' then
      DM.RelCarteira2.ShowReport
    else if NomeRelatorio = 'Carteira 3' then
      DM.RelCarteira3.ShowReport
    else
      raise Exception.Create('Relatório não encontrado.');

    btnCarteirinha.Enabled := True;
    buscarTudo;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
    end;
  end;
end;

procedure TFrmDocumentos.buscarNome;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome collate win_ptbr LIKE :nome order by nome asc');
  DM.QueryMembro.ParamByName('nome').Value := '%' + edtBuscar.Text + '%';
  DM.QueryMembro.Open;
end;

procedure TFrmDocumentos.buscarTudo;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
  DM.QueryMembro.Open();
end;

procedure TFrmDocumentos.CARREGARCERTICABATISMO;
begin
  cbCERTIFICADO.Items.Add('Certificado 1');
  cbCERTIFICADO.Items.Add('Certificado 2');
  cbCERTIFICADO.Items.Add('Certificado 3');
  cbCERTIFICADO.Items.Add('Certificado 4');
  cbCERTIFICADO.Items.Add('Certificado 5');
  cbCERTIFICADO.Items.Add('Certificado 6');
end;

procedure TFrmDocumentos.CARREGARLISTACARTAS;
begin
  cbCartas.Items.Add('Recomendacao');
  cbCartas.Items.Add('Apresentacao');
  cbCartas.Items.Add('Aniv. Casamento');
  cbCartas.Items.Add('Transferencia');
end;

procedure TFrmDocumentos.cbCARTASChange(Sender: TObject);
var
  NomeCarta: string;
begin
  NomeCarta := cbCartas.Text;
  GerarCarta(NomeCarta);
end;

procedure TFrmDocumentos.cbCarteiraChange(Sender: TObject);
var
  NomeRelatorio: string;
begin
  NomeRelatorio := cbCarteira.Text;
  GerarRelatorio(NomeRelatorio);
end;

procedure TFrmDocumentos.cbCERTIFICADOChange(Sender: TObject);
var
  NomeCertificado: string;
begin
  NomeCertificado := cbCERTIFICADO.Text;
  GerarCertificados(NomeCertificado);
end;

procedure TFrmDocumentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.CDSCarteira.EmptyDataSet;
end;

procedure TFrmDocumentos.FormCreate(Sender: TObject);
begin
  AdicionarItensAoComboBox;
  CARREGARLISTACARTAS;
  CARREGARCERTICABATISMO;
end;

procedure TFrmDocumentos.btnGerarCarteiraClick(Sender: TObject);
begin
  GerarRelatorio(cbCarteira.Text);
end;

procedure TFrmDocumentos.btnLimpaListaDocumentosClick(Sender: TObject);
begin
  DM.CDSCarteira.EmptyDataSet;
end;

procedure TFrmDocumentos.AdicionarItensAoComboBox;
begin
  cbCarteira.Items.Add('Carteira 1');
  cbCarteira.Items.Add('Carteira 2');
  cbCarteira.Items.Add('Carteira 3');
end;

procedure TFrmDocumentos.btnAbrirClick(Sender: TObject);
var
  NomeCarta: string;
begin
  NomeCarta := cbCartas.Text;
  GerarCarta(NomeCarta);
end;

procedure TFrmDocumentos.btnCertificadosClick(Sender: TObject);
var
  NomeCertificado: string;
begin
  NomeCertificado := cbCERTIFICADO.Text;
  GerarCertificados(NomeCertificado);
end;

end.
