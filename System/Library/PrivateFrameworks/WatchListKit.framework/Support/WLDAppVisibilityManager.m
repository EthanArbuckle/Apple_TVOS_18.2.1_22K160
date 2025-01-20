@interface WLDAppVisibilityManager
+ (id)sharedManager;
- (WLDAppVisibilityManager)init;
- (void)_accountDidChangeNotification:(id)a3;
- (void)_networkReachabilityDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation WLDAppVisibilityManager

+ (id)sharedManager
{
  if (sharedManager___once_0 != -1) {
    dispatch_once(&sharedManager___once_0, &__block_literal_global_8);
  }
  return (id)sharedManager___sharedManager_0;
}

void __40__WLDAppVisibilityManager_sharedManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDAppVisibilityManager);
  v2 = (void *)sharedManager___sharedManager_0;
  sharedManager___sharedManager_0 = (uint64_t)v1;
}

- (WLDAppVisibilityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WLDAppVisibilityManager;
  v2 = -[WLDAppVisibilityManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    -[NSOperationQueue setName:](v2->_queue, "setName:", @"com.apple.WLDAppVisibilitymanager");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v6 = WLKReachabilityMonitorReachabilityDidChange;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
    [v5 addObserver:v2 selector:"_networkReachabilityDidChangeNotification:" name:v6 object:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v9 = WLKAccountMonitorAccountDidChange;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAccountMonitor sharedInstance](&OBJC_CLASS___WLKAccountMonitor, "sharedInstance"));
    [v8 addObserver:v2 selector:"_accountDidChangeNotification:" name:v9 object:v10];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = WLKReachabilityMonitorReachabilityDidChange;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
  [v3 removeObserver:self name:v4 object:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = WLKAccountMonitorAccountDidChange;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAccountMonitor sharedInstance](&OBJC_CLASS___WLKAccountMonitor, "sharedInstance"));
  [v6 removeObserver:self name:v7 object:v8];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WLDAppVisibilityManager;
  -[WLDAppVisibilityManager dealloc](&v9, "dealloc");
}

- (void)_networkReachabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (self->_updateRequestedOnNetworkChange)
  {
    id v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
    unsigned int v6 = [v5 isNetworkReachable];

    id v4 = v7;
    if (v6)
    {
      NSLog(@"WLDAppVisibilityManager - reachability changed");
      -[WLDAppVisibilityManager updateAppVisibility](self, "updateAppVisibility");
      id v4 = v7;
    }
  }
}

- (void)_accountDidChangeNotification:(id)a3
{
  id v6 = a3;
  if (self->_updateRequestedOnAccountChange)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));

    if (v5)
    {
      NSLog(@"WLDAppVisibilityManager - account changed");
      -[WLDAppVisibilityManager updateAppVisibility](self, "updateAppVisibility");
    }
  }
}

- (void).cxx_destruct
{
}

@end