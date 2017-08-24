program AnimalConsole;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, animal, CustApp
  { you can add units after this };

type

  { TMyAnimal }

  TMyAnimal = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TMyAnimal }

procedure TMyAnimal.DoRun;
var
  ErrorMsg: String;
  MyANimal: TTipoAnimal;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  MyAnimal := TTipoAnimal.Create;
  MyANimal.Name:= 'pepitoElGRillo';
  MyAnimal.Age:= 23;
  MyAnimal.Feet:= 4;
  MyANimal.Features.Add(' crickea ');
  MyANimal.Features.Add(' do something ');
  WriteLn(MyANimal.Describe());

  // stop program loop
  Terminate;
end;

constructor TMyAnimal.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TMyAnimal.Destroy;
begin
  inherited Destroy;
end;

procedure TMyAnimal.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TMyAnimal;
begin
  Application:=TMyAnimal.Create(nil);
  Application.Title:='MyAnimal';
  Application.Run;
  Application.Free;
end.

