program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, TaylorSerie, ParseMath
  { you can add units after this };
type
    TResult = record
      result: string;
      matrix: array of array of real;
    end;

type

  { TTaylorSeries }

  TTaylorSeries = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TTaylorSeries }

procedure TTaylorSeries.DoRun;
var
  ErrorMsg: String;
  a: TTaylorSerie;
  serie: TStringList;
  i : Integer;
  res: TResult;
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
  a := TTaylorSerie.Create;


  // stop program loop
  Terminate;
end;

constructor TTaylorSeries.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TTaylorSeries.Destroy;
begin
  inherited Destroy;
end;

procedure TTaylorSeries.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TTaylorSeries;
begin
  Application:=TTaylorSeries.Create(nil);
  Application.Title:='TaylorSeries';
  Application.Run;
  Application.Free;
end.

