object FrmEmitirCarteiras: TFrmEmitirCarteiras
  Left = 0
  Top = 0
  Caption = 'Emiss'#227'o de Credenciais'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object btnCarteira1: TSpeedButton
    Left = 8
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Modelo 1'
    OnClick = btnCarteira1Click
  end
  object btnCarteira2: TSpeedButton
    Left = 8
    Top = 55
    Width = 145
    Height = 41
    Caption = 'Modelo 2'
    OnClick = btnCarteira2Click
  end
  object btnCarteira3: TSpeedButton
    Left = 8
    Top = 102
    Width = 145
    Height = 41
    Caption = 'Modelo 3'
  end
end
