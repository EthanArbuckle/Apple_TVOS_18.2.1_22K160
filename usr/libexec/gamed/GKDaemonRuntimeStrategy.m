@interface GKDaemonRuntimeStrategy
+ (void)setup;
- (BOOL)shouldRefreshPreferencesAfterBackgrounding;
- (GKDaemonRuntimeStrategy)init;
- (GKUtilityService)utilityService;
- (GKUtilityServicePrivate)utilityServicePrivate;
- (NSURLSession)instrumentedURLSession;
- (id)localPlayer;
- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5;
@end

@implementation GKDaemonRuntimeStrategy

+ (void)setup
{
  v2 = objc_alloc_init(&OBJC_CLASS___GKDaemonRuntimeStrategy);
  GKSetRuntimeStrategy();
}

- (GKDaemonRuntimeStrategy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKDaemonRuntimeStrategy;
  v2 = -[GKDaemonRuntimeStrategy init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    v4 = objc_alloc_init(&OBJC_CLASS____TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  v4,  0LL));
    instrumentedURLSession = v2->_instrumentedURLSession;
    v2->_instrumentedURLSession = (NSURLSession *)v5;
  }

  return v2;
}

- (GKUtilityService)utilityService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKUtilityService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v2,  0LL));

  return (GKUtilityService *)v3;
}

- (GKUtilityServicePrivate)utilityServicePrivate
{
  return 0LL;
}

- (BOOL)shouldRefreshPreferencesAfterBackgrounding
{
  return 0;
}

- (id)localPlayer
{
  return +[GKLocalPlayerInternal archivedProfile](&OBJC_CLASS___GKLocalPlayerInternal, "archivedProfile");
}

- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5
{
}

- (NSURLSession)instrumentedURLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end