unit ClosedMethods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, ParseMath, mResult;
type
    Tarraystring = array of string;
type
  TClosedMethods = class
    private
      //a: Double ; //* first Interval
      //b: Double; //* second interval

      //* number of digits precision
      //* ie: 1 digit -> presicion 0.01
      //*     2 digits -> presicion 0.001
      precision: Integer;

      // TArray = [a, b, Xn, fa*fb, EAbs, ERel, EPorc]
      TDataArray : Array[1..7] of string;
    public
      //fun : TParseMath; //* math function
      constructor create();
      destructor destroy();
      function bolzanoTheorem(a: Double; b: Double): Double;
      function bisectionMethod(a: Double; b:Double; e: Double; FExpression: string): TResult;
      function fakePositionMethod(a: double; b: double; e: double; FExpression: string): TResult;
  end;

//var fun: TParseMath; //* math function

implementation

//constructor TClosedMethods.create( fExpresion: string);
constructor TClosedMethods.create();
begin
{*
  fun := TParseMath.create();
  fun.Expression:= fExpresion;
  fun.AddVariable('x',0);
//fun.AddVariable('x',0);
  fun.Evaluate();
  *}
end;

destructor TClosedMethods.destroy();
begin
end;

function TClosedMethods.bolzanoTheorem(a: Double; b: Double): Double;
var
  fa: Double;
  fb: Double;
  bolzano: Double;
begin
  // verificar continuidad de la funcion en el intervalo [a,b]
     //do something here!!!
  // evalular signo
  {*
  fun.NewValue('x',a); fa:= fun.Evaluate();
  fun.NewValue('x',b); fb:= fun.Evaluate();

  bolzano:= fa*fb;
  if bolzano < 0 then
       Result := xn // return b
    else
      begin
          if bolzano > 0 then
             Result := xn // return a
          else
              eAbs:= 0 ; // STOP! variable xn is solution
      end;
    *}
end;

function TClosedMethods.bisectionMethod(a: Double; b:Double; e: Double; FExpression: string ): TResult ;
var
  fun: TParseMath;
  eAbs: Double; // absolute error
  xn: Double; // xr
  xn_1: Double; // last xr
  bolzano: Double;
  fxn: Double;
  fa,fb,temp: Double;
  signo: Double;
  res : string;
  i,j: Integer;
begin
    i:= 1; j:= 0;
    SetLength( Result.matrix, i+1,5);
    fun := TParseMath.create();
    fun.Expression:=FExpression;
    fun.AddVariable('x',0); fun.Evaluate();
  //Bisection method
    eAbs:= 1000000; // this is a trick, only for the first iteration
    //xnOld:= xn;
    xn:= ((a+b)/2);
    fun.NewValue('x',a); fa := fun.Evaluate();
    fun.NewValue('x',b); fb := fun.Evaluate();
    fun.NewValue('x',xn); fxn := fun.Evaluate();
    signo := fa*fxn;
    //guardamos en la matriz Result.matrix
    Result.matrix[0,0] := FloatToStr(a);
    Result.matrix[0,1] := FloatToStr(b);
    Result.matrix[0,2] := FloatToStr(xn);
    Result.matrix[0,3] := FloatToStr(signo);
    Result.matrix[0,4] := '-';
    bolzano:= fa*fb;
    if ( bolzano> 0) then
       Result.result := FloatToStr(fa)+' '+ FloatToStr(fb)+' No cumple teorema de bolzano'
    else
    begin
        if( bolzano = 0) then
        begin
            if(fa=0) then
              Result.result := FloatToStr(a) +' es la solucion 1'
            else
            begin
                if( fb=0) then
                    Result.result := FloatToStr(b)+' es la solucion 2'
                else
                    if (fxn=0) then
                    Result.result := FloatToStr(xn) +' es la solucion 3' ;
            end;
        end
        else // bisection method
        begin
          while( (e<eAbs) and (fa<>0) ) do
          begin
            i:= i +1 ;
            SetLength( Result.matrix,i,5);

            //signo := fa*fxn;
            if( signo <0) then
                b := xn
            else
                a:=xn;
            xn_1:= xn;
            xn:= (a+b)/2 ;
            fun.NewValue('x',a); fa := fun.Evaluate();
            fun.NewValue('x',xn); fxn := fun.Evaluate();
            signo := fa*fxn;
            eAbs:= abs(xn - xn_1);

            //guardamos en la matriz Result.matrix

            Result.matrix[i-1,0] := FloatToStr(a);
            Result.matrix[i-1,1] := FloatToStr(b);
            Result.matrix[i-1,2] := FloatToStr(xn);
            Result.matrix[i-1,3] := FloatToStr(signo);
            Result.matrix[i-1,4] := FloatToStr(eAbs);

            end;
        end;

    end;
    Result.result:=Result.result + FloatToStr(xn);
end;

function TClosedMethods.fakePositionMethod(a: Double; b:Double; e: Double; FExpression: string ): TResult ;
var
  fun: TParseMath;
  eAbs: Double; // absolute error
  xn: Double; // xr
  xn_1: Double; // last xr
  bolzano: Double;
  fxn: Double;
  fa,fb,temp: Double;
  signo: Double;
  res : string;
  i,j: Integer;
begin
    i:= 1; j:= 0;
    SetLength( Result.matrix, i+1,5);
    fun := TParseMath.create();
    fun.Expression:=FExpression;
    fun.AddVariable('x',0); fun.Evaluate();
  //Bisection method
    eAbs:= 1000000; // this is a trick, only for the first iteration
    //xnOld:= xn;

    fun.NewValue('x',a); fa := fun.Evaluate();
    fun.NewValue('x',b); fb := fun.Evaluate();
    fun.NewValue('x',xn); fxn := fun.Evaluate();
    xn:= (a-( (fa*(b-a))/(fb-fa) ) );
    signo := fa*fxn;
    //guardamos en la matriz Result.matrix
    Result.matrix[0,0] := FloatToStr(a);
    Result.matrix[0,1] := FloatToStr(b);
    Result.matrix[0,2] := FloatToStr(xn);
    Result.matrix[0,3] := FloatToStr(signo);
    Result.matrix[0,4] := '-';
    bolzano:= fa*fb;
    if ( bolzano> 0) then
       Result.result := FloatToStr(fa)+' '+ FloatToStr(fb)+' No cumple teorema de bolzano'
    else
    begin
        if( bolzano = 0) then
        begin
            if(fa=0) then
              Result.result := FloatToStr(a) +' es la solucion 1'
            else
            begin
                if( fb=0) then
                    Result.result := FloatToStr(b)+' es la solucion 2'
                else
                    if (fxn=0) then
                    Result.result := FloatToStr(xn) +' es la solucion 3' ;
            end;
        end
        else // bisection method
        begin
          while( (e<eAbs) and (fa<>0) ) do
          begin
            i:= i +1 ;
            SetLength( Result.matrix,i,5);

            //signo := fa*fxn;
            if( signo <0) then
                b := xn
            else
                a:=xn;
            xn_1:= xn;
            fun.NewValue('x',a); fa := fun.Evaluate();
            fun.NewValue('x',b); fb := fun.Evaluate();
            fun.NewValue('x',xn); fxn := fun.Evaluate();
            xn:= (a-( (fa*(b-a))/(fb-fa) ) );
            signo := fa*fxn;
            eAbs:= abs(xn - xn_1);

            //guardamos en la matriz Result.matrix

            Result.matrix[i-1,0] := FloatToStr(a);
            Result.matrix[i-1,1] := FloatToStr(b);
            Result.matrix[i-1,2] := FloatToStr(xn);
            Result.matrix[i-1,3] := FloatToStr(signo);
            Result.matrix[i-1,4] := FloatToStr(eAbs);

            end;
        end;

    end;
    Result.result:=Result.result + FloatToStr(xn);
end;
{*
function TClosedMethods.fakePositionMethod(a: double; b: double; e: double; FExpression: string): double;
var
  fun: TParseMath;
  eAbs: Double; // absolute error
  xn: Double; // xr
  xnOld: Double; // last xr
  bolzano: Double;
  fxn: Double;
  fa,fb,temp: Double;
  signo: Double;
  count: Integer;
begin

    count:= 0;
     fun := TParseMath.create();
     fun.Expression:=FExpression;
     fun.AddVariable('x',0); fun.Evaluate();

  //Bisection method
    eAbs:= 1000; // this is a trick, only for the first iteration
    xnOld:= xn;
    fun.NewValue('x',a); fa := fun.Evaluate();
    fun.NewValue('x',b); fb := fun.Evaluate();
    fun.NewValue('x',xn); fxn := fun.Evaluate();
    xn:= (a-( (fa*(b-a))/(fb-fa) ) );
    bolzano:= fa*fb;
    if ( bolzano> 0) then
       ShowMessage(FloatToStr(fa)+' '+ FloatToStr(fb)+' No cumple teorema de bolzano')
    else
    begin
        if( bolzano = 0) then
        begin
            if(fa=0) then
              ShowMessage(FloatToStr(a)+' es la solucion')
            else
              ShowMessage(FloatToStr(b)+' es la solucion');
        end
        else // bisection method

        begin
          while(eAbs > e) do
          begin
            count:= count+1;

            signo := fa*fxn;
            if( signo <0) then
                b := xn
            else
            begin
                 if( signo>0 ) then
                     a:=xn;
                 //else // what happen if fx=0 ? -> a or xn is solution
            end;
            xnOld:= xn;
            xn:= (a-( (fa*(b-a))/(fb-fa) ) );
            fun.NewValue('x',a); fa := fun.Evaluate();
            fun.NewValue('x',xn); fxn := fun.Evaluate();

            eAbs:= abs(xn - xnOld);
          end;
        end;

    end;
    Result:=xn;
end;
*}
end.

