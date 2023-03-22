unit uServicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmServicos = class(TForm)
    Rectangle2: TRectangle;
    Label3: TLabel;
    imgBackServicos: TImage;
    lvServicos: TListView;
    imgValor: TImage;
    imgReservar: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicos: TfrmServicos;

implementation

{$R *.fmx}

end.
