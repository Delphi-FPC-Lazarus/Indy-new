unit IdOpenSSLIOHandlerServer;

interface

uses
  IdOpenSSLContextServer,
  IdOpenSSLOptionsServer,
  IdSSL,
  IdSocketHandle,
  IdThread,
  IdYarn,
  IdIOHandler;

type
  TIdOpenSSLIOHandlerServer = class(TIdServerIOHandlerSSLBase)
  private
    FOptions: TIdOpenSSLOptionsServer;
    FContext: TIdOpenSSLContextServer;
  protected
    function GetOptionClass: TIdOpenSSLOptionsServerClass; virtual;
    procedure InitComponent; override;
  public
    destructor Destroy; override;

    procedure Init; override;
    procedure Shutdown; override;
    function Accept(ASocket: TIdSocketHandle; AListenerThread: TIdThread;
      AYarn: TIdYarn): TIdIOHandler; override;

    {$REGION 'abstract functions from TIdServerIOHandlerSSLBase'}
    function MakeClientIOHandler: TIdSSLIOHandlerSocketBase; override;
    function MakeFTPSvrPort: TIdSSLIOHandlerSocketBase; override;
    function MakeFTPSvrPasv: TIdSSLIOHandlerSocketBase; override;
    {$ENDREGION}
  published
    property Options: TIdOpenSSLOptionsServer read FOptions;
  end;

implementation

uses
  IdOpenSSLIOHandlerClientServer,
  SysUtils;

{ TIdOpenSSLIOHandlerServer }

function TIdOpenSSLIOHandlerServer.Accept(ASocket: TIdSocketHandle;
  AListenerThread: TIdThread; AYarn: TIdYarn): TIdIOHandler;
var
  LIOHandler: TIdOpenSSLIOHandlerClientForServer;
begin
  LIOHandler := MakeClientIOHandler() as TIdOpenSSLIOHandlerClientForServer;
  try
    LIOHandler.PassThrough := True;
//    LIOHandler.PassThrough := False;
    LIOHandler.Open;
    if LIOHandler.Binding.Accept(ASocket.Handle) then
    begin
      LIOHandler.PassThrough := False;
      LIOHandler.StartSSL();
    end
    else
      FreeAndNil(LIOHandler);
  except
    FreeAndNil(LIOHandler);
    raise;
  end;
  Result := LIOHandler;
end;

destructor TIdOpenSSLIOHandlerServer.Destroy;
begin
  FOptions.Free();
  inherited;
end;

function TIdOpenSSLIOHandlerServer.GetOptionClass: TIdOpenSSLOptionsServerClass;
begin
  Result := TIdOpenSSLOptionsServer;
end;

procedure TIdOpenSSLIOHandlerServer.Init;
begin
  inherited;
  FContext := TIdOpenSSLContextServer.Create();
  FContext.Init(FOptions);
end;

procedure TIdOpenSSLIOHandlerServer.InitComponent;
begin
  inherited;
  FOptions := GetOptionClass().Create();
end;

function TIdOpenSSLIOHandlerServer.MakeClientIOHandler: TIdSSLIOHandlerSocketBase;
var
  LHandler: TIdOpenSSLIOHandlerClientForServer;
begin
  LHandler := TIdOpenSSLIOHandlerClientForServer.Create(nil);
  LHandler.SetServerContext(FContext);

  Result := LHandler;
end;

function TIdOpenSSLIOHandlerServer.MakeFTPSvrPasv: TIdSSLIOHandlerSocketBase;
begin
end;

function TIdOpenSSLIOHandlerServer.MakeFTPSvrPort: TIdSSLIOHandlerSocketBase;
begin
end;

procedure TIdOpenSSLIOHandlerServer.Shutdown;
begin
  inherited;
  FContext.Free();
end;

end.
