unit TaylorSerie;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math ,ParseMath;

type
    TArrayDouble = array of double;
type
  TTaylorSerie = class
    private
      serie: TStringList;

      function factorial(a: Integer): Integer;
    public
      constructor create();
      function exp(number: Double; e: Double): TStringList;

  end;

implementation

constructor TTaylorSerie.create();
begin
end;

function TTaylorSerie.factorial(a: Integer): Integer;
var
  i: Integer;
  res: Integer;
begin
  if( a=0) then
      Result := 1
  else
  begin
    if a<3 then
       Result:=a
    else
    begin
      res:=2;
      for i:=3 to a do
          res := res*i;
      Result:= res;
    end;
  end;
end;

function TTaylorSerie.exp(number: Double; e: Double): TStringList;
var
  //suma: Double;
  eAbs: Double;
  xn, xni, xnOld: Double;
  i: Integer;
  listSerie: TStringList;
begin
  listSerie := TStringList.create;
  eAbs:=1000;
  xn:= power(number,i)/factorial(i); // this is the first iteration
  xnOld:= xn;
  i:= 1;       /// it starts in the first iteration
  while( eAbs < e) do
  begin
    listSerie.Append(FloatToStr(xn));
    xni:= power(number,i)/factorial(i);
    xn := xn + xni;
    eAbs:= xn-xnOld;
    i:= i+1;
    xnOld:= xn;
  end;

  Result := listSerie;
end;

end.

