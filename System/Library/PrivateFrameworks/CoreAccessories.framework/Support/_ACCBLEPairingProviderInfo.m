@interface _ACCBLEPairingProviderInfo
- (ACCBLEPairingServerRemote)serverRemote;
- (ACCBLEPairingXPCClientProtocol)remoteObject;
- (NSArray)supportedPairingTypes;
- (NSString)providerUID;
- (NSXPCConnection)connection;
- (_ACCBLEPairingProviderInfo)init;
- (id)description;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerRemote:(id)a3;
- (void)setSupportedPairingTypes:(id)a3;
@end

@implementation _ACCBLEPairingProviderInfo

- (_ACCBLEPairingProviderInfo)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____ACCBLEPairingProviderInfo;
  v2 = -[_ACCBLEPairingProviderInfo init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0LL;

    remoteObject = v3->_remoteObject;
    v3->_remoteObject = 0LL;

    serverRemote = v3->_serverRemote;
    v3->_serverRemote = 0LL;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    providerUID = v3->_providerUID;
    v3->_providerUID = (NSString *)v8;

    supportedPairingTypes = v3->_supportedPairingTypes;
    v3->_supportedPairingTypes = 0LL;
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

  supportedPairingTypes = self->_supportedPairingTypes;
  self->_supportedPairingTypes = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ACCBLEPairingProviderInfo;
  -[_ACCBLEPairingProviderInfo dealloc](&v8, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCBLEPairingProviderInfo>[\n    _connection=%@\n    _remoteObject=%@\n    _serverRemote=%@\n    _providerUID=%@]",  self->_connection,  self->_remoteObject,  self->_serverRemote,  self->_providerUID);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ACCBLEPairingXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCBLEPairingServerRemote)serverRemote
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

- (NSArray)supportedPairingTypes
{
  return self->_supportedPairingTypes;
}

- (void)setSupportedPairingTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end