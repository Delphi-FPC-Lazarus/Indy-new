unit IdOpenSSLOptionsClient;

interface

uses
  Classes,
  IdOpenSSLOptions;

type
  TIdOpenSSLOptionsClient = class(TIdOpenSSLOptionsBase)
  strict private const
    CDefaultVerifyServerCertificate = True;
  private
    FVerifyServerCertificate: Boolean;
  public
    constructor Create; override;

    procedure AssignTo(Dest: TPersistent); override;
    function Equals(Obj: TObject): Boolean; override;
  published
    /// <summary>
    ///   Verify the server certificate.
    /// </summary>
    /// <remarks>
    ///   If the verification process fails, the TLS/SSL handshake is
    ///   immediately terminated with an alert message containing the reason for
    ///   the verification failure. If no server certificate is sent, because an
    ///   anonymous cipher is used, this option is ignored.
    /// </remarks>
    property VerifyServerCertificate: Boolean read FVerifyServerCertificate write FVerifyServerCertificate default CDefaultVerifyServerCertificate;
  end;

  TIdOpenSSLOptionsClientClass = class of TIdOpenSSLOptionsClient;

implementation

{ TIdOpenSSLOptionsClient }

procedure TIdOpenSSLOptionsClient.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TIdOpenSSLOptionsClient then
    TIdOpenSSLOptionsClient(Dest).FVerifyServerCertificate := FVerifyServerCertificate;
end;

constructor TIdOpenSSLOptionsClient.Create;
begin
  inherited;
  FVerifyServerCertificate := CDefaultVerifyServerCertificate;
end;

function TIdOpenSSLOptionsClient.Equals(Obj: TObject): Boolean;
begin
  Result := inherited;
  if Result and (Obj is TIdOpenSSLOptionsClient) then
    Result := FVerifyServerCertificate = TIdOpenSSLOptionsClient(Obj).FVerifyServerCertificate;
end;

end.
