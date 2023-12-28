object FrmEntraDizOfertas: TFrmEntraDizOfertas
  Left = 0
  Top = 0
  Caption = 'Dizimos e Ofertas'
  ClientHeight = 632
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 57
    Height = 15
    Caption = 'ID_DIZIMO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 82
    Top = 24
    Width = 28
    Height = 15
    Caption = 'ROLL'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 35
    Height = 15
    Caption = 'NOME'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 222
    Top = 64
    Width = 36
    Height = 15
    Caption = 'VALOR'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 328
    Top = 64
    Width = 41
    Height = 15
    Caption = 'FORMA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 434
    Top = 64
    Width = 25
    Height = 15
    Caption = 'TIPO'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 16
    Top = 112
    Width = 22
    Height = 15
    Caption = 'OBS'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 148
    Top = 24
    Width = 11
    Height = 15
    Caption = 'ID'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 214
    Top = 24
    Width = 28
    Height = 15
    Caption = 'DATA'
    FocusControl = DBEdit9
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 40
    Width = 60
    Height = 23
    DataField = 'ID_DIZIMO'
    DataSource = DM.DSDIZIMOS
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 82
    Top = 40
    Width = 60
    Height = 23
    DataField = 'ROLL'
    DataSource = DM.DSDIZIMOS
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 80
    Width = 200
    Height = 23
    DataField = 'NOME'
    DataSource = DM.DSDIZIMOS
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 222
    Top = 80
    Width = 100
    Height = 23
    DataField = 'VALOR'
    DataSource = DM.DSDIZIMOS
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 328
    Top = 80
    Width = 100
    Height = 23
    DataField = 'FORMA'
    DataSource = DM.DSDIZIMOS
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 434
    Top = 80
    Width = 100
    Height = 23
    DataField = 'TIPO'
    DataSource = DM.DSDIZIMOS
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 16
    Top = 128
    Width = 200
    Height = 23
    DataField = 'OBS'
    DataSource = DM.DSDIZIMOS
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 148
    Top = 40
    Width = 60
    Height = 23
    DataField = 'ID'
    DataSource = DM.DSDIZIMOS
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 214
    Top = 40
    Width = 80
    Height = 23
    DataField = 'DATA'
    DataSource = DM.DSDIZIMOS
    TabOrder = 8
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 176
    Width = 585
    Height = 145
    DataSource = DM.DSDIZIMOS
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_DIZIMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ROLL'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Visible = True
      end>
  end
end
