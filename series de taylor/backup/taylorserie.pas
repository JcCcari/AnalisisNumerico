unit TaylorSerie;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math ,ParseMath;

type
    TArrayDouble = array of double;
type
    TResult = record
      result: string;
      matrix: array of array of real;
    end;

type
  TTaylorSerie = class
    private
      serie: TStringList;

      function factorial(a: Integer): Integer;
    public
      constructor create();
      function exp(number: Double; e: Double): TStringList;
      function sin(x: Double; e: Double): TResult;

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

function TTaylorSerie.sin(x: double; e: double): TResult;
var
  eAbs, res, xn, xn_1: Double;
  k: Integer;

begin
  eAbs := 100000000;
  k:= 0;
  res := 0;
  xn := ( power(-1,k)/factorial(2*k+1)) * power(x,2*k+1);
  res := res + xn;
  k := k+1;

  while( e < eAbs) do
  begin
    xn_1 := res;
    xn := ( power(-1,k)/factorial(2*k+1)) * power(x,2*k+1);
    res := res + xn;
    eAbs := res - xn_1;

  end;
  Result.result := res;
end;

end.

