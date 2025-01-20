@interface _ACCMediaLibraryProviderInfo
- (ACCMediaLibraryServerRemote)serverRemote;
- (ACCMediaLibraryXPCClientProtocol)remoteObject;
- (NSMutableDictionary)mediaLibraryList;
- (NSString)providerUID;
- (NSXPCConnection)connection;
- (_ACCMediaLibraryProviderInfo)init;
- (id)description;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setMediaLibraryList:(id)a3;
- (void)setProviderUID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerRemote:(id)a3;
@end

@implementation _ACCMediaLibraryProviderInfo

- (_ACCMediaLibraryProviderInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____ACCMediaLibraryProviderInfo;
  v2 = -[_ACCMediaLibraryProviderInfo init](&v10, "init");
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

    mediaLibraryList = v3->_mediaLibraryList;
    v3->_mediaLibraryList = 0LL;
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

  mediaLibraryList = self->_mediaLibraryList;
  self->_mediaLibraryList = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ACCMediaLibraryProviderInfo;
  -[_ACCMediaLibraryProviderInfo dealloc](&v8, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCMediaLibraryProviderInfo>[\n    _connection=%@\n    _remoteObject=%@\n    _serverRemote=%@\n    _providerUID=%@\n    _mediaLibraryList=%@]",  self->_connection,  self->_remoteObject,  self->_serverRemote,  self->_providerUID,  self->_mediaLibraryList);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ACCMediaLibraryXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (ACCMediaLibraryServerRemote)serverRemote
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

- (NSMutableDictionary)mediaLibraryList
{
  return self->_mediaLibraryList;
}

- (void)setMediaLibraryList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end