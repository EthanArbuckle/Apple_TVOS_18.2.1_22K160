@interface TVSSSleepTimerController
- (NSArray)availableScheduledSleepRequests;
- (NSString)contentTitle;
- (PBSScheduledSleep)currentScheduledSleep;
- (PBSScheduledSleepManager)sleepTimerManager;
- (TVSSMenuModeController)menuModeController;
- (TVSSSleepTimerController)initWithMenuModeController:(id)a3;
- (UIImage)contentImage;
- (void)_getAvailableSleepTimerRequests;
- (void)cancelScheduledSleepWithCompletion:(id)a3;
- (void)dealloc;
- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)scheduleSleepWithRequest:(id)a3 completion:(id)a4;
- (void)setAvailableScheduledSleepRequests:(id)a3;
- (void)setCurrentScheduledSleep:(id)a3;
- (void)setMenuModeController:(id)a3;
- (void)setSleepTimerManager:(id)a3;
@end

@implementation TVSSSleepTimerController

- (NSString)contentTitle
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[TVSSSleepTimerController currentScheduledSleep](self, "currentScheduledSleep");
  if (v8[0])
  {
    id v5 = [v8[0] predictedEndDate];
    [v5 timeIntervalSinceNow];
    v6 = v2;

    v7[1] = v6;
    v7[0] = (id)FormatTime(*(double *)&v6);
    v9 = (NSString *)v7[0];
    objc_storeStrong(v7, 0LL);
  }

  else
  {
    v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    v9 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"TVSSSleepTimerTitle",  &stru_1001BDAC8,  0LL);
  }

  objc_storeStrong(v8, 0LL);
  return v9;
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"fitness.timer",  a2,  self);
}

- (TVSSSleepTimerController)initWithMenuModeController:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0LL;
  v11.receiver = v3;
  v11.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerController;
  v13 = -[TVSSSleepTimerController init](&v11, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___PBSScheduledSleepManager);
    sleepTimerManager = v13->_sleepTimerManager;
    v13->_sleepTimerManager = v4;

    id v10 = [location[0] provider];
    id v9 = [v10 state];
    id v8 = [v9 currentScheduledSleep];
    -[TVSSSleepTimerController setCurrentScheduledSleep:](v13, "setCurrentScheduledSleep:");

    -[TVSSSleepTimerController _getAvailableSleepTimerRequests](v13, "_getAvailableSleepTimerRequests");
    objc_storeStrong((id *)&v13->_menuModeController, location[0]);
    -[TVSSMenuModeController addControllerObserver:](v13->_menuModeController, "addControllerObserver:", v13);
  }

  v7 = v13;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuModeController removeControllerObserver:](self->_menuModeController, "removeControllerObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerController;
  -[TVSSSleepTimerController dealloc](&v2, "dealloc");
}

- (void)scheduleSleepWithRequest:(id)a3 completion:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[PBSScheduledSleepManager scheduleSleepWithRequest:completion:]( v7->_sleepTimerManager,  "scheduleSleepWithRequest:completion:",  location[0],  v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[PBSScheduledSleepManager getAvailableScheduledSleepRequestsWithCompletion:]( v4->_sleepTimerManager,  "getAvailableScheduledSleepRequestsWithCompletion:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)cancelScheduledSleepWithCompletion:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[PBSScheduledSleepManager cancelScheduledSleepWithCompletion:]( v4->_sleepTimerManager,  "cancelScheduledSleepWithCompletion:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = [location[0] provider];
  id v6 = [v7 state];
  id v5 = [v6 currentScheduledSleep];
  -[TVSSSleepTimerController setCurrentScheduledSleep:](v10, "setCurrentScheduledSleep:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_getAvailableSleepTimerRequests
{
  id v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  sleepTimerManager = v10->_sleepTimerManager;
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100102D48;
  id v7 = &unk_1001B6148;
  objc_copyWeak(&v8, location);
  -[PBSScheduledSleepManager getAvailableScheduledSleepRequestsWithCompletion:]( sleepTimerManager,  "getAvailableScheduledSleepRequestsWithCompletion:",  &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

- (PBSScheduledSleep)currentScheduledSleep
{
  return self->_currentScheduledSleep;
}

- (void)setCurrentScheduledSleep:(id)a3
{
}

- (NSArray)availableScheduledSleepRequests
{
  return self->_availableScheduledSleepRequests;
}

- (void)setAvailableScheduledSleepRequests:(id)a3
{
}

- (PBSScheduledSleepManager)sleepTimerManager
{
  return self->_sleepTimerManager;
}

- (void)setSleepTimerManager:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end