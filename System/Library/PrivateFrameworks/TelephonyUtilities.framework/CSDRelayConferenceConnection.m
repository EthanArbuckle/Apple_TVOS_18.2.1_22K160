@interface CSDRelayConferenceConnection
- (BOOL)isAudioDisabled;
- (BOOL)isHost;
- (BOOL)isPreparedToStop;
- (BOOL)isTinCan;
- (BOOL)isUsingBaseband;
- (BOOL)receivedSuccessfulDidStart;
- (CSDAVConference)conference;
- (CSDIDSTransport)transport;
- (CSDRelayConferenceConnection)init;
- (CSDRelayConferenceConnection)initWithCall:(id)a3;
- (CSDRelayConferenceConnection)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (VCCapabilities)capabilities;
- (id)description;
- (id)didPrepareHandler;
- (id)didStartHandler;
- (id)didStopHandler;
- (int)deviceRole;
- (void)invokeDidPrepareIfNecessary:(id)a3;
- (void)invokeDidStartIfNecessary:(BOOL)a3 error:(id)a4;
- (void)invokeDidStopIfNecessary:(BOOL)a3 error:(id)a4;
- (void)setAudioDisabled:(BOOL)a3;
- (void)setConference:(id)a3;
- (void)setDidPrepareHandler:(id)a3;
- (void)setDidStartHandler:(id)a3;
- (void)setDidStopHandler:(id)a3;
- (void)setHost:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPreparedToStop:(BOOL)a3;
- (void)setReceivedSuccessfulDidStart:(BOOL)a3;
- (void)setTinCan:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)setUsingBaseband:(BOOL)a3;
@end

@implementation CSDRelayConferenceConnection

- (CSDRelayConferenceConnection)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDRelayConferenceConnection;
  v6 = -[CSDRelayConferenceConnection init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (CSDRelayConferenceConnection)initWithCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  v6 = -[CSDRelayConferenceConnection initWithIdentifier:](self, "initWithIdentifier:", v5);

  if (v6)
  {
    -[CSDRelayConferenceConnection setHost:](v6, "setHost:", [v4 isHostedOnCurrentDevice]);
    -[CSDRelayConferenceConnection setUsingBaseband:](v6, "setUsingBaseband:", [v4 isUsingBaseband]);
  }

  return v6;
}

- (CSDRelayConferenceConnection)init
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is unavailable, call another initializer instead.",  "-[CSDRelayConferenceConnection init]"));
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v5,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDRelayConferenceConnection.m",  37,  @"%s is unavailable, call another initializer instead.",  "-[CSDRelayConferenceConnection init]");
  }

  return 0LL;
}

- (void)invokeDidPrepareIfNecessary:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection didPrepareHandler](self, "didPrepareHandler"));

  if (v4)
  {
    id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceConnection didPrepareHandler]( self,  "didPrepareHandler"));
    -[CSDRelayConferenceConnection setDidPrepareHandler:](self, "setDidPrepareHandler:", 0LL);
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)invokeDidStartIfNecessary:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection didStartHandler](self, "didStartHandler"));

  if (v6)
  {
    -[CSDRelayConferenceConnection setReceivedSuccessfulDidStart:](self, "setReceivedSuccessfulDidStart:", v4);
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceConnection didStartHandler]( self,  "didStartHandler"));
    -[CSDRelayConferenceConnection setDidStartHandler:](self, "setDidStartHandler:", 0LL);
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);
  }
}

- (void)invokeDidStopIfNecessary:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection didStopHandler](self, "didStopHandler"));

  if (v6)
  {
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceConnection didStopHandler]( self,  "didStopHandler"));
    -[CSDRelayConferenceConnection setDidStopHandler:](self, "setDidStopHandler:", 0LL);
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v8);
  }
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection identifier](self, "identifier"));
  [v4 appendFormat:@" identifier=%@", v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection transport](self, "transport"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceConnection transport](self, "transport"));
    [v4 appendFormat:@" transport=%@", v7];
  }

  if (-[CSDRelayConferenceConnection isHost](self, "isHost")) {
    objc_msgSend(v4, "appendFormat:", @" isHost=%d", -[CSDRelayConferenceConnection isHost](self, "isHost"));
  }
  if (-[CSDRelayConferenceConnection isUsingBaseband](self, "isUsingBaseband")) {
    objc_msgSend( v4,  "appendFormat:",  @" isUsingBaseband=%d",  -[CSDRelayConferenceConnection isUsingBaseband](self, "isUsingBaseband"));
  }
  if (-[CSDRelayConferenceConnection isAudioDisabled](self, "isAudioDisabled")) {
    objc_msgSend( v4,  "appendFormat:",  @" isAudioDisabled=%d",  -[CSDRelayConferenceConnection isAudioDisabled](self, "isAudioDisabled"));
  }
  if (-[CSDRelayConferenceConnection receivedSuccessfulDidStart](self, "receivedSuccessfulDidStart")) {
    objc_msgSend( v4,  "appendFormat:",  @" receivedSuccessfulDidStart=%d",  -[CSDRelayConferenceConnection receivedSuccessfulDidStart](self, "receivedSuccessfulDidStart"));
  }
  if (-[CSDRelayConferenceConnection isPreparedToStop](self, "isPreparedToStop")) {
    objc_msgSend( v4,  "appendFormat:",  @" isPreparedToStop=%d",  -[CSDRelayConferenceConnection isPreparedToStop](self, "isPreparedToStop"));
  }
  [v4 appendString:@">"];
  return v4;
}

- (int)deviceRole
{
  if (!-[CSDRelayConferenceConnection isHost](self, "isHost")) {
    return 1;
  }
  if (-[CSDRelayConferenceConnection isUsingBaseband](self, "isUsingBaseband")) {
    return 2;
  }
  return 4;
}

- (VCCapabilities)capabilities
{
  v3 = objc_alloc_init(&OBJC_CLASS___VCCapabilities);
  -[VCCapabilities setIsKeyExchangeEnabled:](v3, "setIsKeyExchangeEnabled:", 0LL);
  -[VCCapabilities setIsAudioEnabled:](v3, "setIsAudioEnabled:", 1LL);
  -[VCCapabilities setIsVideoEnabled:](v3, "setIsVideoEnabled:", 0LL);
  -[VCCapabilities setIsDuplexAudioOnly:]( v3,  "setIsDuplexAudioOnly:",  -[VCCapabilities isVideoEnabled](v3, "isVideoEnabled") ^ 1);
  -[VCCapabilities setIsRelayForced:](v3, "setIsRelayForced:", 0LL);
  -[VCCapabilities setIsRelayEnabled:](v3, "setIsRelayEnabled:", 1LL);
  -[VCCapabilities setIsAudioPausedToStart:]( v3,  "setIsAudioPausedToStart:",  -[CSDRelayConferenceConnection isAudioDisabled](self, "isAudioDisabled"));
  -[VCCapabilities setDeviceRole:](v3, "setDeviceRole:", -[CSDRelayConferenceConnection deviceRole](self, "deviceRole"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CSDIDSTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (BOOL)isHost
{
  return self->_host;
}

- (void)setHost:(BOOL)a3
{
  self->_host = a3;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (void)setUsingBaseband:(BOOL)a3
{
  self->_usingBaseband = a3;
}

- (BOOL)isAudioDisabled
{
  return self->_audioDisabled;
}

- (void)setAudioDisabled:(BOOL)a3
{
  self->_audioDisabled = a3;
}

- (BOOL)isTinCan
{
  return self->_tinCan;
}

- (void)setTinCan:(BOOL)a3
{
  self->_tinCan = a3;
}

- (BOOL)receivedSuccessfulDidStart
{
  return self->_receivedSuccessfulDidStart;
}

- (void)setReceivedSuccessfulDidStart:(BOOL)a3
{
  self->_receivedSuccessfulDidStart = a3;
}

- (BOOL)isPreparedToStop
{
  return self->_preparedToStop;
}

- (void)setPreparedToStop:(BOOL)a3
{
  self->_preparedToStop = a3;
}

- (id)didPrepareHandler
{
  return self->_didPrepareHandler;
}

- (void)setDidPrepareHandler:(id)a3
{
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
}

- (id)didStopHandler
{
  return self->_didStopHandler;
}

- (void)setDidStopHandler:(id)a3
{
}

- (CSDAVConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end