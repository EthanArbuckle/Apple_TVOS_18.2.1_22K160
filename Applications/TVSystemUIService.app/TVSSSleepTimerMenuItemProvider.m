@interface TVSSSleepTimerMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (TVSSSleepTimerController)sleepTimerController;
- (TVSSSleepTimerMenuItemProvider)initWithSleepTimerController:(id)a3;
- (id)newMenuItem;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSleepTimerController:(id)a3;
@end

@implementation TVSSSleepTimerMenuItemProvider

- (TVSSSleepTimerMenuItemProvider)initWithSleepTimerController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerMenuItemProvider;
  v8 = -[TVSSMenuItemProvider initWithIdentifier:]( &v6,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.sleeptimer.provider");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sleepTimerController, location[0]);
    -[TVSSSleepTimerController addObserver:forKeyPath:options:context:]( v8->_sleepTimerController,  "addObserver:forKeyPath:options:context:",  v8,  @"currentScheduledSleep",  0LL,  off_10021FC90);
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v8, "updateMenuItemWithReason:", @"Initial update");
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSSleepTimerController removeObserver:forKeyPath:context:]( self->_sleepTimerController,  "removeObserver:forKeyPath:context:",  self,  @"currentScheduledSleep",  off_10021FC90);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerMenuItemProvider;
  -[TVSSSleepTimerMenuItemProvider dealloc](&v2, "dealloc");
}

- (BOOL)shouldShowMenuItem
{
  objc_super v2 = -[TVSSSleepTimerController currentScheduledSleep](self->_sleepTimerController, "currentScheduledSleep");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (id)newMenuItem
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.sleeptimer.item");
  objc_super v2 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerContent);
  v5 = -[TVSSSleepTimerContent initWithSleepTimerController:]( v2,  "initWithSleepTimerController:",  v7->_sleepTimerController);
  [v6[0] setVisualContent:v5];
  id v4 = v6[0];
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10 = a6;
  if (a6 == off_10021FC90)
  {
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v14,  "updateMenuItemWithReason:",  @"Sleep timer changed");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerMenuItemProvider;
    -[TVSSSleepTimerMenuItemProvider observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (void)setSleepTimerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end