unit uReserva;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Calendar, FMX.Layouts,
  FMX.ListBox;

type
  TfrmReserva = class(TForm)
    Rectangle2: TRectangle;
    Label3: TLabel;
    imgBackReserva: TImage;
    Rectangle1: TRectangle;
    lblNaoTenhoConta: TLabel;
    Calendar1: TCalendar;
    Label1: TLabel;
    ListBox1: TListBox;
    rectReservar: TRectangle;
    spbReservar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReserva: TfrmReserva;

implementation

{$R *.fmx}

end.
