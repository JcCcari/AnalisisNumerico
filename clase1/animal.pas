unit animal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TTipoAnimal = class
      public
        Name: string;
        Age: Integer;
        Feet: Integer;
        Features : TStringList;
        function Describe(): string;
        constructor Create();
        destructor Destroy; override;
      private
    end;

implementation
constructor TTipoAnimal.Create();
begin
     self.Name:='';
     Self.Age := 0;
     self.Feet:= 0;
     self.Features := TStringList.Create;
end;

Destructor TTipoAnimal.Destroy;
begin
     self.Features.Destroy;
end;

function TTipoAnimal.Describe(): string;
var i : integer;
begin
  Result:= 'This animal is '+ Self.Name + LineEnding +
           'and has '+ IntToStr(Self.Age)+ ' years old'+LineEnding +
           'besides, it has'+ IntToStr(Self.Feet) +'feet.'+ LineEnding +
           'features are:'+ LineEnding;

  //Result -> like return but do next lines,

  for i:= 0 to self.Features.Count-1 do
      Result := Result +IntToStr(i)+ ' ' + Features[i] + LineEnding;
end;

end.

