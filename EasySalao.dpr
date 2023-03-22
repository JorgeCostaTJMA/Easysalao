program EasySalao;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uServicos in 'uServicos.pas' {frmServicos},
  uReserva in 'uReserva.pas' {frmReserva},
  uHorizontalMenu in 'Units\uHorizontalMenu.pas',
  udmGlobal in 'udmGlobal.pas' {dmGlobal: TDataModule},
  uFunctions in 'Units\uFunctions.pas',
  uframeCategoria in 'uframeCategoria.pas' {frameCategoria: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmGlobal, dmGlobal);
  Application.Run;
end.
