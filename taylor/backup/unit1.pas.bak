unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, Menus, taylorserie, mResult;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
   res: TResult;
   taylor: TTaylorSerie;
   x, e: Double;
   i,j : Integer;
begin

  x := StrToFloat(Edit1.Text);
  e := StrToFloat(Edit2.Text);
  taylor := TTaylorSerie.create();
  res := taylor.sin(x,e);

  Memo1.Lines.Add(res.result);
  Memo1.Lines.add(IntToStr(Length(res.matrix))+ ' ' + IntToStr(Length(res.matrix[0])));
  StringGrid1.RowCount:= Length(res.matrix)+1;
  StringGrid1.ColCount:= Length(res.matrix[0])+1;
  for i:=0 to Length(res.matrix)-1 do
  begin
    for j:=0 to Length(res.matrix[0])-1 do
        StringGrid1.Cells[j,i+1] := res.matrix[i,j];
  end;
end;

end.

