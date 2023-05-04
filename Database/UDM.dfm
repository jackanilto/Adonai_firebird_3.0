object DM: TDM
  OnCreate = DataModuleCreate
  Height = 674
  Width = 928
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=C:\Adonai_firebird\Database\ADONIAFB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 8
  end
  object FBDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\Adonai_firebird\Firebird\fbclient.dll'
    Left = 88
    Top = 8
  end
  object TblAcesso: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_ACESSO'
    TableName = 'TBL_ACESSO'
    Left = 48
    Top = 112
    object TblAcessoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object TblAcessoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object TblAcessoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 50
    end
    object TblAcessoMEMBROS: TStringField
      FieldName = 'MEMBROS'
      Origin = 'MEMBROS'
      Size = 3
    end
    object TblAcessoTRATAMENTOS: TStringField
      FieldName = 'TRATAMENTOS'
      Origin = 'TRATAMENTOS'
      Size = 3
    end
    object TblAcessoGRUPOS: TStringField
      FieldName = 'GRUPOS'
      Origin = 'GRUPOS'
      Size = 3
    end
    object TblAcessoCADUSERS: TStringField
      FieldName = 'CADUSERS'
      Origin = 'CADUSERS'
      Size = 3
    end
    object TblAcessoENTRADA: TStringField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Size = 3
    end
    object TblAcessoSAIDA: TStringField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      Size = 3
    end
    object TblAcessoSO_CONSULTA: TStringField
      FieldName = 'SO_CONSULTA'
      Origin = 'SO_CONSULTA'
      Size = 3
    end
  end
  object DSAcesso: TDataSource
    DataSet = QueryAcesso
    Left = 48
    Top = 168
  end
  object TBL_MEMBROS: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_MEMBROS'
    TableName = 'TBL_MEMBROS'
    Left = 136
    Top = 112
    object TBL_MEMBROSID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBL_MEMBROSNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object TBL_MEMBROSENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object TBL_MEMBROSNUMERO: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 200
    end
    object TBL_MEMBROSBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 200
    end
    object TBL_MEMBROSCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 200
    end
    object TBL_MEMBROSESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 200
    end
    object TBL_MEMBROSCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 200
    end
    object TBL_MEMBROSCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 200
    end
    object TBL_MEMBROSTELPESSOAL: TStringField
      DisplayLabel = 'TEL.PESSOAL'
      FieldName = 'TELPESSOAL'
      Origin = 'TELPESSOAL'
      Size = 200
    end
    object TBL_MEMBROSCONTATO1: TStringField
      DisplayLabel = 'CONTATO 1'
      FieldName = 'CONTATO1'
      Origin = 'CONTATO1'
      Size = 200
    end
    object TBL_MEMBROSCONTATO2: TStringField
      DisplayLabel = 'CONTATO 2'
      FieldName = 'CONTATO2'
      Origin = 'CONTATO2'
      Size = 200
    end
    object TBL_MEMBROSEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object TBL_MEMBROSDIZIMISTA: TStringField
      FieldName = 'DIZIMISTA'
      Origin = 'DIZIMISTA'
      Size = 200
    end
    object TBL_MEMBROSGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 200
    end
    object TBL_MEMBROSTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Origin = 'TRATAMENTO'
      Size = 200
    end
    object TBL_MEMBROSOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 200
    end
    object TBL_MEMBROSSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 193
    end
    object TBL_MEMBROSESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'ESTADO_CIVIL'
      Size = 200
    end
    object TBL_MEMBROSMINISTERIO: TStringField
      FieldName = 'MINISTERIO'
      Origin = 'MINISTERIO'
      Size = 200
    end
    object TBL_MEMBROSGRAU_ESCOLARIDADE: TStringField
      DisplayLabel = 'ESCOLARIDADE'
      FieldName = 'GRAU_ESCOLARIDADE'
      Origin = 'GRAU_ESCOLARIDADE'
      Size = 200
    end
    object TBL_MEMBROSBATIZADO: TStringField
      FieldName = 'BATIZADO'
      Origin = 'BATIZADO'
      Size = 200
    end
    object TBL_MEMBROSRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 200
    end
    object TBL_MEMBROSCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 200
    end
    object TBL_MEMBROSNOME_PAI: TStringField
      DisplayLabel = 'NOME DO PAI'
      FieldName = 'NOME_PAI'
      Origin = 'NOME_PAI'
      Size = 200
    end
    object TBL_MEMBROSNOME_MAE: TStringField
      DisplayLabel = 'NOME DA MAE'
      FieldName = 'NOME_MAE'
      Origin = 'NOME_MAE'
      Size = 200
    end
    object TBL_MEMBROSPAIS_ORIGEM: TStringField
      DisplayLabel = 'PAIS ORIGEM'
      FieldName = 'PAIS_ORIGEM'
      Origin = 'PAIS_ORIGEM'
      Size = 200
    end
    object TBL_MEMBROSTELEFONE_PAIS_ORIGEM: TStringField
      DisplayLabel = 'TEL. PAIS ORIGEM'
      FieldName = 'TELEFONE_PAIS_ORIGEM'
      Origin = 'TELEFONE_PAIS_ORIGEM'
      Size = 200
    end
    object TBL_MEMBROSATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 200
    end
    object TBL_MEMBROSNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Origin = 'NATURALIDADE'
      Size = 200
    end
    object TBL_MEMBROSTITULO_ELEITOR: TStringField
      DisplayLabel = 'TITULO ELEITOR'
      FieldName = 'TITULO_ELEITOR'
      Origin = 'TITULO_ELEITOR'
      Size = 200
    end
    object TBL_MEMBROSFILHOS: TStringField
      FieldName = 'FILHOS'
      Origin = 'FILHOS'
      Size = 200
    end
    object TBL_MEMBROSCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Origin = 'CONJUGE'
      Size = 200
    end
    object TBL_MEMBROSCAMPO13: TStringField
      FieldName = 'CAMPO13'
      Origin = 'CAMPO13'
      Size = 200
    end
    object TBL_MEMBROSTIPO_MORADIA: TStringField
      FieldName = 'TIPO_MORADIA'
      Origin = 'TIPO_MORADIA'
      Size = 200
    end
    object TBL_MEMBROSCAMPO15: TStringField
      FieldName = 'CAMPO15'
      Origin = 'CAMPO15'
      Size = 200
    end
    object TBL_MEMBROSHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 200
    end
    object TBL_MEMBROSPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 200
    end
    object TBL_MEMBROSCIDADE_BATISMO: TStringField
      DisplayLabel = 'CIDADE DE BATISMO'
      FieldName = 'CIDADE_BATISMO'
      Origin = 'CIDADE_BATISMO'
      Size = 10
    end
    object TBL_MEMBROSOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 200
    end
    object TBL_MEMBROSVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object TBL_MEMBROSROLL: TIntegerField
      FieldName = 'ROLL'
      Origin = 'ROLL'
    end
    object TBL_MEMBROSIGREJA_BATISMO: TStringField
      DisplayLabel = 'IGREJA DE BATISMO'
      FieldName = 'IGREJA_BATISMO'
      Origin = 'IGREJA_BATISMO'
      Size = 100
    end
    object TBL_MEMBROSDATA_NASC: TDateField
      DisplayLabel = 'DATA NASC'
      FieldName = 'DATA_NASC'
      Origin = 'DATA_NASC'
    end
    object TBL_MEMBROSDATEBATISMO: TDateField
      DisplayLabel = 'DATA BATISMO'
      FieldName = 'DATEBATISMO'
      Origin = 'DATEBATISMO'
    end
    object TBL_MEMBROSDATEVALCARTEIRA: TDateField
      DisplayLabel = 'VAL.CARTEIRA'
      FieldName = 'DATEVALCARTEIRA'
      Origin = 'DATEVALCARTEIRA'
    end
    object TBL_MEMBROSDATEADMISSAO: TDateField
      DisplayLabel = 'DATA ADMISSAO'
      FieldName = 'DATEADMISSAO'
      Origin = 'DATEADMISSAO'
    end
    object TBL_MEMBROSDATECONSAGRA: TDateField
      DisplayLabel = 'DATA CONSAGRA'
      FieldName = 'DATECONSAGRA'
      Origin = 'DATECONSAGRA'
    end
    object TBL_MEMBROSDATECASAMENTO: TDateField
      DisplayLabel = 'DATA CASAMENTO'
      FieldName = 'DATECASAMENTO'
      Origin = 'DATECASAMENTO'
    end
    object TBL_MEMBROSDATENASCCONJUGE: TDateField
      DisplayLabel = 'DATA NASC. CONJUGE'
      FieldName = 'DATENASCCONJUGE'
      Origin = 'DATENASCCONJUGE'
    end
    object TBL_MEMBROSIMAGEM: TStringField
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      Size = 100
    end
  end
  object DSMembro: TDataSource
    DataSet = QueryMembro
    Left = 137
    Top = 168
  end
  object QueryMembro: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select  *  from tbl_membros order by nome asc')
    Left = 136
    Top = 216
  end
  object TBL_PROFISSOES: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_PROFISSOES'
    TableName = 'TBL_PROFISSOES'
    Left = 240
    Top = 112
    object TBL_PROFISSOESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_PROFISSOESPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 50
    end
  end
  object DSProfissoes: TDataSource
    DataSet = QueryProfissoes
    Left = 240
    Top = 168
  end
  object QueryProfissoes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_PROFISSOES')
    Left = 240
    Top = 216
    object QueryProfissoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryProfissoesPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 100
    end
  end
  object TBL_GRUPOS: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_GRUPOS'
    TableName = 'TBL_GRUPOS'
    Left = 328
    Top = 112
    object TBL_GRUPOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_GRUPOSNOME_GRUPO: TStringField
      DisplayLabel = 'NOME DO GRUPO'
      FieldName = 'NOME_GRUPO'
      Origin = 'NOME_GRUPO'
      Size = 50
    end
  end
  object DSGrupos: TDataSource
    DataSet = QueryGupos
    Left = 328
    Top = 168
  end
  object QueryGupos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_GRUPOS ORDER BY NOME_GRUPO ASC')
    Left = 328
    Top = 216
  end
  object TBL_TRATAMENTOS: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_TRATAMENTOS'
    TableName = 'TBL_TRATAMENTOS'
    Left = 440
    Top = 112
    object TBL_TRATAMENTOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_TRATAMENTOSTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Origin = 'TRATAMENTO'
      Size = 50
    end
  end
  object DSTratamentos: TDataSource
    DataSet = QueryIgrejas
    Left = 440
    Top = 168
  end
  object QueryTratamentos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_TRATAMENTOS ORDER by TRATAMENTO ASC')
    Left = 440
    Top = 216
  end
  object QueryAcesso: TFDQuery
    Connection = FDConn
    Left = 48
    Top = 216
  end
  object DSAniverMes: TDataSource
    DataSet = QueryAniverMes
    Left = 768
    Top = 384
  end
  object QueryAniverMes: TFDQuery
    Filtered = True
    OnFilterRecord = QueryAniverMesFilterRecord
    Connection = FDConn
    Left = 768
    Top = 440
  end
  object TBL_IGREJAS: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_IGREJAS'
    TableName = 'TBL_IGREJAS'
    Left = 584
    Top = 112
    object TBL_IGREJASID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object TBL_IGREJASNOME_IGREJA: TStringField
      FieldName = 'NOME_IGREJA'
      Origin = 'NOME_IGREJA'
      Size = 200
    end
    object TBL_IGREJASPASTA_IMG: TStringField
      FieldName = 'PASTA_IMG'
      Origin = 'PASTA_IMG'
      Size = 400
    end
  end
  object DSIgrejas: TDataSource
    DataSet = QueryIgrejas
    Left = 584
    Top = 168
  end
  object QueryIgrejas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_IGREJAS ORDER by ID ASC')
    Left = 584
    Top = 216
  end
  object TBL_DIZIMOS: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_DIZIMOS'
    TableName = 'TBL_DIZIMOS'
    Left = 768
    Top = 112
    object TBL_DIZIMOSID_DIZIMO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_DIZIMO'
      Origin = 'ID_DIZIMO'
      Required = True
    end
    object TBL_DIZIMOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_DIZIMOSNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 250
    end
    object TBL_DIZIMOSDATA: TStringField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Size = 50
    end
    object TBL_DIZIMOSFORMA: TStringField
      FieldName = 'FORMA'
      Origin = 'FORMA'
      Size = 90
    end
    object TBL_DIZIMOSOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 300
    end
    object TBL_DIZIMOSTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 90
    end
    object TBL_DIZIMOSVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Size = 90
    end
    object TBL_DIZIMOSROLL: TIntegerField
      FieldName = 'ROLL'
      Origin = 'ROLL'
    end
  end
  object DSDIZIMOS: TDataSource
    DataSet = QueryDIZIMOS
    Left = 768
    Top = 168
  end
  object QueryDIZIMOS: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tbl_dizimos')
    Left = 768
    Top = 216
  end
  object TBL_ANIVERSARIANTES: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_ANIVERSARIANTES'
    TableName = 'TBL_ANIVERSARIANTES'
    Left = 768
    Top = 320
  end
  object DSCarteira: TDataSource
    DataSet = CDSCarteira
    Left = 32
    Top = 464
  end
  object CDSCarteira: TClientDataSet
    PersistDataPacket.Data = {
      240100009619E0BD01000000180000000A000000000003000000240102494404
      00010000000000044E4F4D45010049000000010005574944544802000200C800
      0A54454C504553534F414C010049000000010005574944544802000200500008
      4E4F4D455F504149010049000000010005574944544802000200C800084E4F4D
      455F4D4145010049000000010005574944544802000200C80009444154415F4E
      41534301004900000001000557494454480200020050000A54524154414D454E
      544F010049000000010005574944544802000200500007434F4E4A5547450100
      49000000010005574944544802000200C80004524F4C4C010049000000010005
      574944544802000200320006494D4147454D0200490000000100055749445448
      020002002C010000}
    Active = True
    Aggregates = <>
    MasterSource = DSMembro
    PacketRecords = 0
    Params = <>
    Left = 32
    Top = 512
    object CDSCarteiraID: TIntegerField
      FieldName = 'ID'
    end
    object CDSCarteiraNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object CDSCarteiraTELPESSOAL: TStringField
      FieldName = 'TELPESSOAL'
      Size = 80
    end
    object CDSCarteiraNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 200
    end
    object CDSCarteiraNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 200
    end
    object CDSCarteiraDATA_NASC: TStringField
      FieldName = 'DATA_NASC'
      Size = 80
    end
    object CDSCarteiraTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Size = 80
    end
    object CDSCarteiraCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 200
    end
    object CDSCarteiraROLL: TStringField
      FieldName = 'ROLL'
      Size = 50
    end
    object CDSCarteiraIMAGEM: TStringField
      FieldName = 'IMAGEM'
      Size = 300
    end
  end
  object RelCarteira: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45049.876983750000000000
    ReportOptions.LastChange = 45049.962495393500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Picture1OnAfterData(Sender: TfrxComponent);'
      'begin'
      '  picture1.Picture.LoadFromFile(<DSMembro."imagem">);  '
      'end;'
      ''
      'begin'
      'end.          ')
    Left = 32
    Top = 320
    Datasets = <
      item
        DataSet = RelDScarteira
        DataSetName = 'DSMembro'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 2.000000000000000000
      RightMargin = 2.000000000000000000
      TopMargin = 2.000000000000000000
      BottomMargin = 2.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 211.653543310000000000
        Top = 18.897650000000000000
        Width = 778.583180000000000000
        DataSet = RelDScarteira
        DataSetName = 'DSMembro'
        RowCount = 0
        object DSMembroNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 11.338590000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."NOME"]')
        end
        object DSMembroTELPESSOAL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 41.574830000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'TELPESSOAL'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."TELPESSOAL"]')
        end
        object DSMembroNOME_PAI: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 7.559060000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_PAI'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."NOME_PAI"]')
        end
        object DSMembroNOME_MAE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 34.015770000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_MAE'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."NOME_MAE"]')
        end
        object DSMembroDATA_NASC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 68.031540000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_NASC'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."DATA_NASC"]')
        end
        object DSMembroTRATAMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 109.606370000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'TRATAMENTO'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."TRATAMENTO"]')
        end
        object DSMembroCONJUGE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 158.740260000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'CONJUGE'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."CONJUGE"]')
        end
        object DSMembroROLL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'ROLL'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."ROLL"]')
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 15.118120000000000000
          Width = 105.826840000000000000
          Height = 102.047310000000000000
          OnAfterData = 'Picture1OnAfterData'
          DataField = 'IMAGEM'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object RelDScarteira: TfrxDBDataset
    UserName = 'DSMembro'
    CloseDataSource = False
    DataSet = CDSCarteira
    BCDToCurrency = False
    Left = 32
    Top = 368
  end
  object RelDSigrejas: TfrxDBDataset
    UserName = 'RelDSigrejas'
    CloseDataSource = False
    DataSource = DSIgrejas
    BCDToCurrency = False
    Left = 32
    Top = 416
  end
  object RelCarta: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45041.916841493000000000
    ReportOptions.LastChange = 45050.013225011570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 120
    Top = 320
    Datasets = <
      item
        DataSet = RelDScarteira
        DataSetName = 'DSMembro'
      end
      item
        DataSet = RelDSigrejas
        DataSetName = 'RelDSigrejas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 113.385826771654000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = RelCarta.Child1
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Carta de Recomenda'#231#227'o')
          ParentFont = False
        end
        object RelDSigrejasNOME_IGREJA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 11.338590000000000000
          Width = 702.992580000000000000
          Height = 49.133890000000000000
          DataField = 'NOME_IGREJA'
          DataSet = RelDSigrejas
          DataSetName = 'RelDSigrejas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelDSigrejas."NOME_IGREJA"]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 400.630180000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Venho por meio deste documento apresentar o (a)')
          ParentFont = False
        end
        object DSMembroTRATAMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'TRATAMENTO'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."TRATAMENTO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'casado(a) com ')
          ParentFont = False
        end
        object DSMembroNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.677490000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."NOME"]')
          ParentFont = False
        end
        object DSMembroCONJUGE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 19.677180000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'CONJUGE'
          DataSet = RelDScarteira
          DataSetName = 'DSMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMembro."CONJUGE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 706.772110000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'membro desta igreja e em dia com suas obriga'#231#245'es com a mesma, as' +
              'sim sendo pe'#231'o-lhes que receba em sua casa como membro da famili' +
              'a crist'#227'.')
          ParentFont = False
        end
      end
    end
  end
  object RelDSDOC: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QueryMembro
    BCDToCurrency = False
    Left = 344
    Top = 392
  end
  object frxReport1: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45049.995629722220000000
    ReportOptions.LastChange = 45049.995629722220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 344
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
