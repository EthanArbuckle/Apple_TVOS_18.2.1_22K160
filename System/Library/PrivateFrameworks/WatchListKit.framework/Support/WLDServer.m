@interface WLDServer
+ (id)server;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WLDServer)init;
- (id)_init;
- (void)_handleFamilyUpdateNotification:(id)a3;
- (void)_handleRestrictionsChangedNotification:(id)a3;
- (void)_invalidateWidgets;
- (void)addClient:(id)a3;
- (void)clientConnectionDidInvalidate:(id)a3;
- (void)dealloc;
- (void)handleAMSDeviceOffer;
- (void)handleSubscriptionRegistration;
- (void)handleVideosUIInvalidationNotification:(id)a3;
- (void)start;
@end

@implementation WLDServer

+ (id)server
{
  if (server___once != -1) {
    dispatch_once(&server___once, &__block_literal_global_0);
  }
  return (id)server___server;
}

void __19__WLDServer_server__block_invoke(id a1)
{
  id v1 = -[WLDServer _init](objc_alloc(&OBJC_CLASS___WLDServer), "_init");
  v2 = (void *)server___server;
  server___server = (uint64_t)v1;
}

- (WLDServer)init
{
  return 0LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WLDServer;
  -[WLDServer dealloc](&v5, "dealloc");
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WLDServer;
  v2 = -[WLDServer init](&v7, "init");
  if (v2)
  {
    +[AMSEphemeralDefaults setHARLoggingEnabled:](&OBJC_CLASS___AMSEphemeralDefaults, "setHARLoggingEnabled:", 0LL);
    id v3 = +[WLDSubscriptionStore sharedInstance](&OBJC_CLASS___WLDSubscriptionStore, "sharedInstance");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, &__block_literal_global_25_0);
  }

  return v2;
}

void __18__WLDServer__init__block_invoke(id a1)
{
  id v1 = +[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary");
  NSLog(@"WLDServer - Prewarm completed");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
  }

  v21 = 0LL;
  *(_OWORD *)error = v22;
  __int128 v20 = v23;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken(error, &v21, 0LL))
  {
    v9 = v21;
  }

  else
  {
    error[0] = 0LL;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    v10 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    v9 = (__CFString *)SecTaskCopySigningIdentifier(v10, error);
    CFRelease(v10);
    if (v9) {
      v11 = v9;
    }
    else {
      NSLog(@"WLDServer - Failed to get signing identifier");
    }
  }

  NSLog(@"WLDServer - Got connection for client '%@'", v9);
  uint64_t v12 = WLKEntitlementWatchList;
  if (!WLDConnectionHasBoolValueForEntitlement(v8, WLKEntitlementWatchList)
    && !WLDConnectionHasBoolValueForEntitlement(v8, WLKEntitlementSuppression))
  {
    goto LABEL_22;
  }

  v13 = (void *)CFPreferencesCopyAppValue(@"ClientIdentifierOverride", @"com.apple.watchlistd");
  if ([v13 length])
  {
    NSLog(@"WLDServer - ClientIdentifierOverride: '%@'", v13);
    v14 = v13;

    v9 = v14;
  }

  if (!WLDConnectionHasBoolValueForEntitlement(v8, v12))
  {
LABEL_21:

LABEL_22:
    NSLog(@"WLDServer - Dropping connection from unentitled client: %@", v8);
    BOOL v16 = 0;
    goto LABEL_23;
  }

  if (!v9)
  {
    NSLog(@"WLDServer - Failed to get client identifier '%@'", 0LL);
    goto LABEL_21;
  }

  NSLog(@"WLDServer - Accepted connection for client '%@'", v9);
  v15 = -[WLDClientConnection initWithConnection:clientIdentifier:]( objc_alloc(&OBJC_CLASS___WLDClientConnection),  "initWithConnection:clientIdentifier:",  v8,  v9);
  -[WLDClientConnection setDelegate:](v15, "setDelegate:", self);
  -[WLDServer addClient:](self, "addClient:", v15);

  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)addClient:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = v9;
  clients = v4->_clients;
  if (!clients)
  {
    id v7 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 1LL);
    v8 = v4->_clients;
    v4->_clients = v7;

    clients = v4->_clients;
    id v5 = v9;
  }

  -[NSMutableSet addObject:](clients, "addObject:", v5);
  objc_sync_exit(v4);
}

- (void)clientConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    [v4 setDelegate:0];
    id v5 = self;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](v5->_clients, "removeObject:", v6);
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)start
{
  uint64_t v3 = WLKStartupSignpostLogObject(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WLDServer.start",  (const char *)&unk_100031029,  buf,  2u);
  }

  NSLog(@"WLDServer - start");
  id v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.watchlistd.xpc");
  xpcListener = self->_xpcListener;
  self->_xpcListener = v5;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  id v7 = (WLDPlaybackManager *)objc_claimAutoreleasedReturnValue(+[WLDPlaybackManager sharedManager](&OBJC_CLASS___WLDPlaybackManager, "sharedManager"));
  playbackManager = self->_playbackManager;
  self->_playbackManager = v7;

  id v9 = objc_alloc_init(&OBJC_CLASS___WLDPushNotificationController);
  pushController = self->_pushController;
  self->_pushController = v9;

  id v11 = +[WLKOfferManager defaultOfferManager](&OBJC_CLASS___WLKOfferManager, "defaultOfferManager");
  id v12 = +[WLDAMSBagObserver sharedObserver](&OBJC_CLASS___WLDAMSBagObserver, "sharedObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v14 = WLKRestrictionsDidChangeNotification;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[WLKRestrictionsObserver sharedObserver](&OBJC_CLASS___WLKRestrictionsObserver, "sharedObserver"));
  [v13 addObserver:self selector:"_handleRestrictionsChangedNotification:" name:v14 object:v15];

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v16 addObserver:self selector:"_handleFamilyUpdateNotification:" name:FAFamilyUpdateNotification object:0];

  id v17 = +[WLDFullTVAppMonitor sharedInstance](&OBJC_CLASS___WLDFullTVAppMonitor, "sharedInstance");
  NSLog(@"WLDServer - start main");
  uint64_t v20 = WLKStartupSignpostLogObject(v18, v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)__int128 v22 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WLDServer.start",  (const char *)&unk_100031029,  v22,  2u);
  }
}

- (void)handleSubscriptionRegistration
{
}

- (void)handleAMSDeviceOffer
{
  v2 = objc_alloc_init(&OBJC_CLASS___WLDDeviceOfferManager);
  -[WLDDeviceOfferManager processDeviceOffers](v2, "processDeviceOffers");
}

- (void)handleVideosUIInvalidationNotification:(id)a3
{
}

- (void)_handleRestrictionsChangedNotification:(id)a3
{
}

- (void)_invalidateWidgets
{
}

- (void)_handleFamilyUpdateNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end