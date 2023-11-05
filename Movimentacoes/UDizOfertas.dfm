object FrmDizimosOfertas: TFrmDizimosOfertas
  Left = 0
  Top = 0
  Caption = 'Dizimos e Ofertas'
  ClientHeight = 698
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 81
    Top = 16
    Width = 57
    Height = 15
    Caption = 'ID_DIZIMO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 147
    Top = 16
    Width = 28
    Height = 15
    Caption = 'ROLL'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 15
    Top = 64
    Width = 35
    Height = 15
    Caption = 'NOME'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 221
    Top = 64
    Width = 36
    Height = 15
    Caption = 'VALOR'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 454
    Top = 59
    Width = 41
    Height = 15
    Caption = 'FORMA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 327
    Top = 59
    Width = 25
    Height = 15
    Caption = 'TIPO'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 15
    Top = 112
    Width = 22
    Height = 15
    Caption = 'OBS'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 15
    Top = 16
    Width = 11
    Height = 15
    Caption = 'ID'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 321
    Top = 112
    Width = 28
    Height = 15
    Caption = 'DATA'
    FocusControl = DBEdit9
  end
  object DBEdit1: TDBEdit
    Left = 81
    Top = 32
    Width = 60
    Height = 23
    DataField = 'ID_DIZIMO'
    DataSource = DM.DSDIZIMOS
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 147
    Top = 32
    Width = 60
    Height = 23
    DataField = 'ROLL'
    DataSource = DM.DSDIZIMOS
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 15
    Top = 80
    Width = 200
    Height = 23
    DataField = 'NOME'
    DataSource = DM.DSDIZIMOS
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 221
    Top = 80
    Width = 100
    Height = 23
    DataField = 'VALOR'
    DataSource = DM.DSDIZIMOS
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 454
    Top = 80
    Width = 121
    Height = 23
    DataField = 'FORMA'
    DataSource = DM.DSDIZIMOS
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 327
    Top = 80
    Width = 121
    Height = 23
    DataField = 'TIPO'
    DataSource = DM.DSDIZIMOS
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 15
    Top = 128
    Width = 300
    Height = 23
    DataField = 'OBS'
    DataSource = DM.DSDIZIMOS
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 15
    Top = 32
    Width = 60
    Height = 23
    DataField = 'ID'
    DataSource = DM.DSDIZIMOS
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 321
    Top = 128
    Width = 154
    Height = 23
    DataField = 'DATA'
    DataSource = DM.DSDIZIMOS
    TabOrder = 8
  end
  object DBNavigator1: TDBNavigator
    Left = 64
    Top = 192
    Width = 470
    Height = 57
    DataSource = DM.DSDIZIMOS
    TabOrder = 9
  end
end
