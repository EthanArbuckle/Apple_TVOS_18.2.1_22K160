@interface PREApplication
+ (BOOL)registerAsSystemApp;
+ (BOOL)shouldCheckInWithBackboard;
+ (double)systemIdleSleepInterval;
+ (id)_newApplicationInitializationContext;
+ (id)sharedApplication;
- (BOOL)_isSpringBoard;
- (BOOL)disablesFrontBoardImplicitWindowScenes;
- (PREApplication)init;
- (PREIdleSleepManager)idleSleepManager;
- (void)sendEvent:(id)a3;
- (void)setIdleSleepManager:(id)a3;
@end

@implementation PREApplication

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
}

- (PREApplication)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PREApplication;
  v2 = -[PREApplication init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PREIdleSleepManager sharedController](&OBJC_CLASS___PREIdleSleepManager, "sharedController"));
    idleSleepManager = v2->_idleSleepManager;
    v2->_idleSleepManager = (PREIdleSleepManager *)v3;

    id v5 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &stru_10000C948,  1.35);
  }

  return v2;
}

+ (id)_newApplicationInitializationContext
{
  id v2 = [[UISMutableDeviceContext alloc] initWithDeviceInfoValues:&__NSDictionary0__struct];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](&OBJC_CLASS___BSPlatform, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deviceClass]));
  [v2 setDeviceInfoValue:v4 forKey:UISDeviceContextDeviceClassKey];

  id v5 = [[UISMutableApplicationInitializationContext alloc] initWithMainDisplayContext:0 launchDisplayContext:0 deviceContext:v2 persistedSceneIdentifiers:0 supportAppSceneRequests:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity identityForIdentifier:]( &OBJC_CLASS___FBSSceneIdentity,  "identityForIdentifier:",  v8));
  id v10 = [v6 newSceneIdentityTokenForIdentity:v9];

  [v5 setDefaultSceneToken:v10];
  return v5;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 1;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if (![v4 _hidEvent]
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PREApplication idleSleepManager](self, "idleSleepManager")),
        unsigned __int8 v6 = [v5 isDisplayDim],
        v5,
        (v6 & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PREApplication;
    -[PREApplication sendEvent:](&v7, "sendEvent:", v4);
  }
}

+ (BOOL)shouldCheckInWithBackboard
{
  return 0;
}

+ (BOOL)registerAsSystemApp
{
  return 0;
}

+ (double)systemIdleSleepInterval
{
  return 300.0;
}

- (PREIdleSleepManager)idleSleepManager
{
  return self->_idleSleepManager;
}

- (void)setIdleSleepManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end