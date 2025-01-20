@interface AppDelegateService
- (AppDelegateService)init;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)setLocalPlayer:(id)a3;
@end

@implementation AppDelegateService

- (AppDelegateService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppDelegateService;
  v2 = -[AppDelegateService init](&v5, "init");
  if (v2)
  {
    GKUISetRemote(1LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonProxy daemonProxy](&OBJC_CLASS___GKDaemonProxy, "daemonProxy"));
    [v3 setDataUpdateDelegate:v2];
  }

  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  if (a3 == 12)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared", *(void *)&a3, a4));
    [v4 synchronize];
  }

- (void)setLocalPlayer:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](&OBJC_CLASS___GKLocalPlayer, "localPlayer"));
    [v4 updateFromLocalPlayer:v3];
  }

@end