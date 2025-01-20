@interface TVRDServer_tvOS
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)xpcConnection;
- (TVRDCompanionEventManager_tvOS)eventManager;
- (TVRDServer_tvOS)init;
- (TVRDTimedMetadataServer_tvOS)timedMetadataServer;
- (void)setEventManager:(id)a3;
- (void)setTimedMetadataServer:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation TVRDServer_tvOS

- (TVRDServer_tvOS)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVRDServer_tvOS;
  v2 = -[TVRDServer_tvOS init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVRDCompanionEventManager_tvOS);
    eventManager = v2->_eventManager;
    v2->_eventManager = v3;

    +[TVRDUtils createPrefsDirectoryIfNeeded](&OBJC_CLASS____TtC9tvremoted9TVRDUtils, "createPrefsDirectoryIfNeeded");
    v5 = objc_alloc(&OBJC_CLASS___TVRDTimedMetadataServer_tvOS);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS nowPlayingMonitor](v2->_eventManager, "nowPlayingMonitor"));
    v7 = -[TVRDTimedMetadataServer_tvOS initWithTimedMetadataUpdater:](v5, "initWithTimedMetadataUpdater:", v6);
    timedMetadataServer = v2->_timedMetadataServer;
    v2->_timedMetadataServer = v7;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  -[TVRDTimedMetadataServer_tvOS addNewConnection:](self->_timedMetadataServer, "addNewConnection:", v6);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");

  return 1;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (TVRDCompanionEventManager_tvOS)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (TVRDTimedMetadataServer_tvOS)timedMetadataServer
{
  return self->_timedMetadataServer;
}

- (void)setTimedMetadataServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end