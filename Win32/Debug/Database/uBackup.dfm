object fBackup: TfBackup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Backup'
  ClientHeight = 481
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 481
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 240
      Top = 52
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label3: TLabel
      Left = 416
      Top = 52
      Width = 82
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object EdUsuario: TLabeledEdit
      Left = 24
      Top = 25
      Width = 201
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usu'#225'rio'
      PasswordChar = '*'
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object EdSenha: TLabeledEdit
      Left = 24
      Top = 68
      Width = 201
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      PasswordChar = '*'
      TabOrder = 1
      Text = 'masterkey'
    end
    object EdOrigem: TLabeledEdit
      Left = 24
      Top = 119
      Width = 616
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Database'
      TabOrder = 2
      Text = 'C:\Adonai_firebird\Database\ADONIAFB.FDB'
    end
    object EdHostName: TLabeledEdit
      Left = 240
      Top = 25
      Width = 201
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'Host Name'
      TabOrder = 3
      Text = '127.0.0.1'
    end
    object EdPorta: TSpinEdit
      Left = 240
      Top = 68
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 3050
    end
    object edNomeArq: TEdit
      Left = 416
      Top = 69
      Width = 265
      Height = 21
      TabOrder = 5
      Text = 'AdonaiBKP'
    end
    object btOrigem: TButton
      Left = 646
      Top = 117
      Width = 35
      Height = 25
      Caption = '. . .'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btOrigemClick
    end
    object Memo1: TMemo
      Left = 0
      Top = 289
      Width = 747
      Height = 192
      Align = alBottom
      ReadOnly = True
      TabOrder = 7
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 158
      Width = 747
      Height = 131
      ActivePage = tsBackup
      Align = alBottom
      TabOrder = 8
      object tsBackup: TTabSheet
        Caption = 'Backup Banco de Dados'
        object pnlBaixo: TPanel
          Left = 0
          Top = 0
          Width = 739
          Height = 103
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Label2: TLabel
            Left = 272
            Top = 76
            Width = 66
            Height = 13
            Caption = 'Ultimo Backup'
          end
          object lbUltimoBack: TLabel
            Left = 344
            Top = 76
            Width = 64
            Height = 13
            Caption = 'UltimoBack'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BtnBck: TButton
            Left = 16
            Top = 64
            Width = 241
            Height = 25
            Caption = 'Efetuar Backup Agora'
            TabOrder = 0
            OnClick = BtnBckClick
          end
          object EdDestino: TLabeledEdit
            Left = 21
            Top = 22
            Width = 616
            Height = 21
            EditLabel.Width = 76
            EditLabel.Height = 13
            EditLabel.Caption = 'Local do Backup'
            TabOrder = 1
            Text = 'C:\Adonai_firebird\Database\BackupBanco'
          end
        end
      end
      object Restore: TTabSheet
        Caption = 'Restore Banco de Dados'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 739
          Height = 103
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object btOrigemBackup: TButton
            Left = 643
            Top = 20
            Width = 35
            Height = 25
            Caption = '. . .'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button3Click
          end
          object edOrigemBackup: TLabeledEdit
            Left = 21
            Top = 22
            Width = 616
            Height = 21
            EditLabel.Width = 76
            EditLabel.Height = 13
            EditLabel.Caption = 'Local do Backup'
            TabOrder = 1
            Text = 'C:'
          end
          object BtnRest: TButton
            Left = 16
            Top = 64
            Width = 241
            Height = 25
            Caption = 'Efetuar Restaura'#231#227'o Agora'
            TabOrder = 2
            OnClick = BtnRestClick
          end
        end
      end
    end
  end
  object FDIBBackup1: TFDIBBackup
    OnError = FDIBBackup1Error
    BeforeExecute = FDIBBackup1BeforeExecute
    AfterExecute = FDIBBackup1AfterExecute
    DriverLink = FDPhysFBDriverLink1
    Protocol = ipTCPIP
    OnProgress = FDIBBackup1Progress
    Verbose = True
    Left = 64
    Top = 352
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Adonai_firebird\Firebird\fbclient.dll'
    Embedded = True
    Left = 168
    Top = 336
  end
  object FDIBRestore1: TFDIBRestore
    OnError = FDIBRestore1Error
    BeforeExecute = FDIBRestore1BeforeExecute
    AfterExecute = FDIBRestore1AfterExecute
    DriverLink = FDPhysFBDriverLink1
    OnProgress = FDIBRestore1Progress
    Options = [roNoValidity]
    Left = 265
    Top = 352
  end
  object SaveDialog1: TSaveDialog
    Left = 464
    Top = 320
  end
  object OpenDialog1: TOpenDialog
    Left = 552
    Top = 320
  end
  object OpenDialog2: TOpenDialog
    Left = 553
    Top = 368
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 288
  end
end
