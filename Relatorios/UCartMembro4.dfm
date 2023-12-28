object FrmCartMembro4: TFrmCartMembro4
  Left = 0
  Top = 0
  Caption = 'Carteira Teste Fortes'
  ClientHeight = 1092
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FrmRelCarteira4: TRLReport
    Left = -3
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DM.DSMembro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Carteiras'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btTitle
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 216
        Top = 16
        Width = 326
        Height = 38
        Caption = 'Carteiras de Membros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 81
        Top = 48
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 48
        Width = 72
        Height = 16
        Caption = 'Gerado em:'
        Transparent = False
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 113
      Width = 718
      Height = 230
      DataSource = DM.DSMembro
      Transparent = False
      object FOTOMEMBRO: TImage
        Left = 272
        Top = 11
        Width = 85
        Height = 116
        Stretch = True
      end
      object LOGOIGREJA: TImage
        Left = 377
        Top = 11
        Width = 80
        Height = 80
        Stretch = True
      end
      object RLDBText1: TRLDBText
        Left = 80
        Top = 56
        Width = 43
        Height = 16
        DataField = 'NOME'
        DataSource = DM.DSCarteira
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 512
        Top = 32
        Width = 96
        Height = 16
        DataField = 'NOME_IGREJA'
        DataSource = DM.DSIgrejas
        Text = ''
      end
    end
  end
end
