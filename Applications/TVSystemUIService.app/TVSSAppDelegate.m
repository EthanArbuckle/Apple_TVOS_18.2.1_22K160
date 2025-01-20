@interface TVSSAppDelegate
+ (id)sharedApplicationDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (TVSSBannerManager)bannerManager;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
@end

@implementation TVSSAppDelegate

+ (id)sharedApplicationDelegate
{
  v3 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
  id v4 = -[UIApplication delegate](v3, "delegate");

  return v4;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSSBannerManager);
  bannerManager = v10->_bannerManager;
  v10->_bannerManager = v4;

  +[TVSSTips configureTipsCenter](&OBJC_CLASS____TtC17TVSystemUIService8TVSSTips, "configureTipsCenter");
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  id v8 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
  id v9 = [v12 role];
  id v10 = objc_msgSend(v8, "initWithName:sessionRole:", @"Default Configuration");

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (void).cxx_destruct
{
}

@end