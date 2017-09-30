unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, httpdefs, fpHTTP, fpWeb;

type

  { TFPWebModule1 }

  TFPWebModule1 = class(TFPWebModule)
    procedure DataModuleRequest(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FPWebModule1: TFPWebModule1;

implementation

{$R *.lfm}

{ TFPWebModule1 }

procedure TFPWebModule1.DataModuleRequest(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: Boolean);
var
  a,b : Double;
begin
  a := StrToFloat( ARequest.QueryFields.Values[ 'a' ]);
  b := StrToFloat( ARequest.QueryFields.Values[ 'b' ]);
  AResponse.ContentType:= 'text/html; charse=utef-8';
  AResponse.Contents.Text:= 'hello'+ FloatToStr(a+b);
  Handled:=true;

end;

initialization
  RegisterHTTPModule('TFPWebModule1', TFPWebModule1);
end.

