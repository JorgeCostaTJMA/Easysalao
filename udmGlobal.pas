unit udmGlobal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Dataset.Serialize, DataSet.Serialize.Config;

type
  TdmGlobal = class(TDataModule)
    memTabBanners: TFDMemTable;
    memTabCategorias: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarBanners;
    procedure CarregarCategorias;
  end;

var
  dmGlobal: TdmGlobal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}


{$R *.dfm}

procedure TdmGlobal.CarregarBanners;
var
    json: string;
begin
    json := '[{"cod_banner": "0001", "banner": "Qualquer serviço está com desconto de 25%",' +
             '"foto": "https://easysalao.s3.amazonaws.com/banner.png"},' +
             '{"cod_banner": "0002", "banner": "Chegaram os novos produtos Wella. Venha conferir!",' +
             '"foto": "https://easysalao.s3.amazonaws.com/banner2.png"},' +
             '{"cod_banner": "0003", "banner": "Conheça o kit da linha Nutri-Enrich",' +
             '"foto": "https://easysalao.s3.amazonaws.com/banner3.png"}]';

    memTabBanners.FieldDefs.Clear;
    memTabBanners.LoadFromJson(json);

end;

procedure TdmGlobal.CarregarCategorias;
var
    json: string;
begin
    json := '[{"cod_categoria": "0001", "categoria": "Cabelo",' +
             '"icone": "https://easysalao.s3.amazonaws.com/tesoura.png"},' +
             '{"cod_categoria": "0002", "categoria": "Unha",' +
             '"icone": "https://easysalao.s3.amazonaws.com/unha.png"},' +
             '{"cod_categoria": "0003", "categoria": "Massagem",' +
             '"icone": "https://easysalao.s3.amazonaws.com/massagem.png"},' +
             '{"cod_categoria": "0004", "categoria": "Maquiagem",' +
             '"icone": "https://easysalao.s3.amazonaws.com/maquiagem.png"},' +
             '{"cod_categoria": "0005", "categoria": "Depilação",' +
             '"icone": "https://easysalao.s3.amazonaws.com/depilacao.png"},' +
             '{"cod_categoria": "0006", "categoria": "Estética",' +
             '"icone": "https://easysalao.s3.amazonaws.com/estetica.png"}]';

    memTabCategorias.FieldDefs.Clear;
    memTabCategorias.LoadFromJson(json);

end;


procedure TdmGlobal.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

end.
