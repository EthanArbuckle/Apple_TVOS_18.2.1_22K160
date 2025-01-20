@interface _ACCVoiceOverProviderInfo
- (ACCVoiceOverServerRemote)serverRemote;
- (ACCVoiceOverXPCClientProtocol)remoteObject;
- (NSString)providerUID;
- (NSXPCConnection)connection;
- (_ACCVoiceOverProviderInfo)init;
- (id)description;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerRemote:(id)a3;
@end

@implementation _ACCVoiceOverProviderInfo

- (_ACCVoiceOverProviderInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ACCVoiceOverProviderInfo;
  v2 = -[_ACCVoiceOverProviderInfo init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0LL;

    remoteObject = v3->_remoteObject;
    v3->_remoteObject = 0LL;

    serverRemote = v3->_serverRemote;
    v3->_serverRemote = 0LL;

    providerUID = v3->_providerUID;
    v3->_providerUID = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  connection = self->_connection;
  self->_connection = 0LL;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0LL;

  serverRemote = self->_serverRemote;
  self->_serverRemote = 0LL;

  providerUID = self->_providerUID;
  self->_providerUID = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____ACCVoiceOverProviderInfo;
  -[_ACCVoiceOverProviderInfo dealloc](&v7, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCVoiceOverProviderInfo>[\n    _connection=%@\n    _remoteObject=%@\n    _serverRemote=%@\n    _providerUID=%@]",  self->_connection,  self->_remoteObject,  self->_serverRemote,  self->_providerUID);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ACCVoiceOverXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCVoiceOverServerRemote)serverRemote
{
  return self->_serverRemote;
}

- (void)setServerRemote:(id)a3
{
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end