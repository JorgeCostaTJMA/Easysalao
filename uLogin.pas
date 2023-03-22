unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl;

type
  TfrmLogin = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    lblNaoTenhoConta: TLabel;
    Image1: TImage;
    editEmailLogin: TEdit;
    editSenhaLogin: TEdit;
    rectAcessar: TRectangle;
    spbAcessar: TSpeedButton;
    TabControl: TTabControl;
    tabLogin: TTabItem;
    tabNovaConta: TTabItem;
    Rectangle2: TRectangle;
    lblTelaLogin: TLabel;
    Layout2: TLayout;
    Image2: TImage;
    editNomeNovaConta: TEdit;
    editSenhaNovaConta: TEdit;
    rectNovaConta: TRectangle;
    spbNovaConta: TSpeedButton;
    editEmailNovaConta: TEdit;
    procedure lblTelaLoginClick(Sender: TObject);
    procedure lblNaoTenhoContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses uPrincipal;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  TabControl.GotoVisibleTab(0); // tabLogin;
end;

procedure TfrmLogin.lblNaoTenhoContaClick(Sender: TObject);
begin
  TabControl.GotoVisibleTab(1); // tabNovaConta;
end;

procedure TfrmLogin.lblTelaLoginClick(Sender: TObject);
begin
  TabControl.GotoVisibleTab(0); // tabLogin;
end;

procedure TfrmLogin.spbAcessarClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrincipal, frmPrincipal);
 frmPrincipal.Show;
end;

end.
