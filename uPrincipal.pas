unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Edit, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, uHorizontalMenu, uFunctions;

type
  TfrmPrincipal = class(TForm)
    TabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image1: TImage;
    Layout1: TLayout;
    hScroollBanners: THorzScrollBox;
    Label1: TLabel;
    lbCategorias: TListBox;
    rectAbas: TRectangle;
    imgAba1: TImage;
    imgAba2: TImage;
    imgAba3: TImage;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Rectangle2: TRectangle;
    Label3: TLabel;
    editNomePerfil: TEdit;
    Label4: TLabel;
    editEmailPerfil: TEdit;
    Label5: TLabel;
    rectAtualizarPerfil: TRectangle;
    spbAtualizarPerfil: TSpeedButton;
    lvAgenda: TListView;
    imgData: TImage;
    imgHora: TImage;
    imgValor: TImage;
    imgCancelar: TImage;
    procedure imgAba1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    banners : THorizontalMenu;
    procedure SelecionarAba(Img: TImage);
    procedure ListarBanners;
    procedure ListarCategorias;
    procedure CarregarTelaInicial;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses udmGlobal, uframeCategoria;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmPrincipal := nil;
end;

procedure TfrmPrincipal.SelecionarAba(Img : TImage);
begin
  imgAba1.Opacity := 0.3;
  imgAba2.Opacity := 0.3;
  imgAba3.Opacity := 0.3;

  Img.Opacity := 1;
  TabControl.GotoVisibleTab(Img.Tag);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  banners := THorizontalMenu.Create(hScroollBanners);
  banners.MarginPadrao := 10;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  banners.DisposeOf;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
 lbCategorias.Columns := Trunc(lbCategorias.Width /150);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 CarregarTelaInicial;

 imgAba1.Opacity := 1;
 imgAba2.Opacity := 0.3;
 imgAba3.Opacity := 0.3;
 TabControl.GotoVisibleTab(0);
end;

procedure TfrmPrincipal.ListarBanners();
var icone : Tbitmap;
begin
   dmGlobal.CarregarBanners;

   with dmGlobal.memTabBanners do
   begin
     while NOT eof do
     begin
       icone := TBitmap.Create;
       LoadImageFromURL(icone, FieldByName('foto').AsString);

       banners.AddItem(FieldByName('banner').AsString,
                        icone,
                        '',
                        300,
                        $FFCCCCCC,
                        0,
                        $FF6E6E6E,
                        '',
                        nil,
                        FieldByName('cod_banner').AsInteger);

       icone.DisposeOf;

       Next;
     end;
   end;

end;

procedure TfrmPrincipal.ListarCategorias();
var icone : Tbitmap;
    item : TListBoxItem;
    frame : TframeCategoria;

begin
   dmGlobal.CarregarCategorias;

   with dmGlobal.memTabCategorias do
   begin
      while NOT eof do
      begin
        icone := TBitmap.Create;
        LoadImageFromURL(icone, FieldByName('icone').AsString);

        // População do item
        item := TListBoxItem.Create(lbCategorias);
        item.Text := '';
        item.Width := 150;
        item.Height := 170;
        item.Selectable := false;
        item.Tag := fieldbyname('cod_categoria').AsInteger;

        // carga no frame
        frame := TFrameCategoria.Create(item);
        frame.Parent := item;
        frame.Align := TAlignLayout.Client;
        frame.lblCategoria.text := fieldbyname('categoria').AsString;
        frame.imgCategoria.bitmap := icone;

        lbCategorias.AddObject(item);

        Next;
      end;
   end;
end;

procedure TfrmPrincipal.CarregarTelaInicial;
begin
  banners.DeleteAll;
  lbCategorias.Items.Clear;

  ListarBanners;
  ListarCategorias;
end;

procedure TfrmPrincipal.imgAba1Click(Sender: TObject);
begin
   SelecionarAba(TImage(Sender));
end;

end.
