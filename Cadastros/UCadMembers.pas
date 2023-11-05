unit UCadMembers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmCadMembers = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Estado: TLabel;
    LabelCOMPLENENTO: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ROLL: TLabel;
    Email: TLabel;
    Escolaridade: TLabel;
    Label15: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label33s: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    EstaCivil: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    CPF: TLabel;
    Label18: TLabel;
    Naturalidade: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    DataCasCONJUGE: TLabel;
    Label32: TLabel;
    imgProfile: TImage;
    btnAdd: TSpeedButton;
    btnFOTOGRAFAR: TSpeedButton;
    Label22: TLabel;
    dataBatismo: TLabel;
    Label23: TLabel;
    CidadeBatismo: TLabel;
    ValCarteira: TLabel;
    DIZIMISTA: TLabel;
    Label21: TLabel;
    Tratamento: TLabel;
    DataCONSAGRAÇAO: TLabel;
    Grupo: TLabel;
    Ministerio: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    OBS: TLabel;
    btnCANCELAR: TSpeedButton;
    EditNOME: TEdit;
    EditNUMERO: TEdit;
    EditENDERECO: TEdit;
    EditBAIRRO: TEdit;
    EditCIDADE: TEdit;
    EditESTADO: TEdit;
    EditCOMPLEMENTO: TEdit;
    EditTELPESSOAL: TEdit;
    EditCONTATO1: TEdit;
    EditCONTATO2: TEdit;
    EditROLL: TEdit;
    EditEMAIL: TEdit;
    cbESCOLARIDADE: TComboBox;
    EditMAE: TEdit;
    cbMORADIA: TComboBox;
    DateNASC: TDateTimePicker;
    EditPAI: TEdit;
    cbPROFISSAO: TComboBox;
    cbSEXO: TComboBox;
    MaskCEP: TMaskEdit;
    cbESTCIVIL: TComboBox;
    MaskRG: TMaskEdit;
    DateCASAMENTO: TDateTimePicker;
    EditCONJUGE: TEdit;
    MaskCPF: TMaskEdit;
    EditPAIS: TEdit;
    EditNATURAL: TEdit;
    EditFILHOS: TEdit;
    EditTITULO: TEdit;
    DateNASCCONJUGE: TDateTimePicker;
    EditPATHFOTO: TEdit;
    grid: TDBGrid;
    EditID: TEdit;
    edtBuscar: TEdit;
    CheckATIVO: TCheckBox;
    DateVALCARTEIRA: TDateTimePicker;
    EditCIDADEBATISMO: TEdit;
    EditIGREJA_BATISMO: TEdit;
    DateBATISMO: TDateTimePicker;
    cbBATIZADO: TComboBox;
    cbTRATAMENTO: TComboBox;
    cbDIZIMISTA: TComboBox;
    DateCONSAGRA: TDateTimePicker;
    cbGRUPO: TComboBox;
    cbMINISTERIO: TComboBox;
    EditCAMPO15: TEdit;
    EditCAMPO13: TEdit;
    EditTELPAISORIG: TEdit;
    EditPAISORIG: TEdit;
    DateADMISSAO: TDateTimePicker;
    MemoOBSERVACAO: TMemo;
    MemoHistórico: TMemo;
    btnDeletar: TBitBtn;
    btnEditar: TBitBtn;
    BtnSalvar: TBitBtn;
    btnNovo: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMembers: TFrmCadMembers;

implementation

{$R *.dfm}

uses UDM, UPrincipal;

end.
