unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, Grids, ValEdit, ComCtrls, Types, ClosedMethods, mResult;

type

  { TForm1 }

  TForm1 = class(TForm)
      Button1: TButton;
      Button2: TButton;
      Edit1: TEdit;
      Edit2: TEdit;
      Edit3: TEdit;
      Edit4: TEdit;
      Edit5: TEdit;
      Edit6: TEdit;
      Edit7: TEdit;
      Edit8: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Memo1: TMemo;
      PageControl1: TPageControl;
      StaticText1: TStaticText;
      Biseccion: TTabSheet;
      FalsaPosicion: TTabSheet;
      StaticText2: TStaticText;
      StringGrid1: TStringGrid;
      StringGrid2: TStringGrid;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
    private
        data: array[1..7] of string;

    public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  closed: TClosedMethods;
  temp: string;
  a,b,e: Double;
  fExpression: string;
  res : TResult;
  i: Integer;
  ma: array of string;
begin
  // (x/ln(x))+ power( 2.71828182845904523536,x-1) - 10
  // (667.38/x )* (1-power( 2.71828182845904523536,-0,146847*x)) -40
  // sin(x) +(power(x,2)/(x-1)) +3
  fExpression := Edit4.Text;
  a:= StrToFloat(Edit1.Text);
  b:= StrToFloat(Edit2.Text);
  e:= StrToFloat(Edit3.Text);
  closed:= TClosedMethods.create();
  res := closed.bisectionMethod(a, b, e, fExpression);
  Memo1.Lines.Add(res.result);
  Memo1.Lines.Add(IntToStr(Length(res.matrix)));

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

end.

