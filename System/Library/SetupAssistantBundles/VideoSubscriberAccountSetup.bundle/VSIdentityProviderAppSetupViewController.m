@interface VSIdentityProviderAppSetupViewController
+ (BOOL)shouldBeShownToUser;
- (NSOperationQueue)privateQueue;
- (NSString)appName;
- (NSTimer)timer;
- (UIImageView)imageView;
- (VSAccount)account;
- (VSAccountStore)accountStore;
- (VSAppDescription)appDescription;
- (VSDeveloperSettings)developerSettings;
- (VSIdentityProvider)identityProvider;
- (VSIdentityProviderAppSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSPreferences)preferences;
- (VSRestrictionsCenter)restrictionsCenter;
- (VSSetupView)buddyView;
- (VSStateMachine)stateMachine;
- (id)completionHandler;
- (id)undoManager;
- (void)_finishWithDidOfferAppInstall:(BOOL)a3 didAcceptAppInstall:(BOOL)a4;
- (void)_goBack;
- (void)_menuPressed:(id)a3;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_timerFired:(id)a3;
- (void)autoAdvance;
- (void)beginSetup:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAppDescription:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBuddyView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeveloperSettings:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTimer:(id)a3;
- (void)skipSetup:(id)a3;
- (void)stateMachine:(id)a3 transitionFromState:(id)a4;
- (void)stateMachine:(id)a3 transitionToState:(id)a4;
- (void)transitionToLoadingAccountState;
- (void)transitionToLoadingAppIconState;
- (void)transitionToLoadingAppInfoState;
- (void)transitionToLoadingProviderInfoState;
- (void)transitionToLoadingSettingsState;
- (void)transitionToOfferingInstallationState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSIdentityProviderAppSetupViewController

- (VSIdentityProviderAppSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  VSRequireMainThread(v7, v8);
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  v9 = -[VSIdentityProviderAppSetupViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", v7, v6);

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[VSRestrictionsCenter defaultRestrictionsCenter]( &OBJC_CLASS___VSRestrictionsCenter,  "defaultRestrictionsCenter"));
    restrictionsCenter = v9->_restrictionsCenter;
    v9->_restrictionsCenter = (VSRestrictionsCenter *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSUndoManager);
    undoManager = v9->_undoManager;
    v9->_undoManager = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v9->_preferences;
    v9->_preferences = v14;

    -[VSPreferences setUndoManager:](v9->_preferences, "setUndoManager:", v9->_undoManager);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](&OBJC_CLASS___VSAccountStore, "sharedAccountStore"));
    accountStore = v9->_accountStore;
    v9->_accountStore = (VSAccountStore *)v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v9->_privateQueue;
    v9->_privateQueue = v18;

    uint64_t v20 = VSDefaultLogObject( -[NSOperationQueue setName:]( v9->_privateQueue,  "setName:",  @"VSIdentityProviderAppSetupViewController"));
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "setupStateMachine";
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
    }

    v22 = objc_alloc_init(&OBJC_CLASS___VSStateMachine);
    -[VSStateMachine setName:](v22, "setName:", @"VSIdentityProviderAppSetup");
    -[VSStateMachine ignoreEvent:inState:](v22, "ignoreEvent:inState:", @"View Will Appear", @"Initial");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading Settings",  @"View Did Appear",  @"Initial");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading Account",  @"Loading Finished",  @"Loading Settings");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Loading Failed",  @"Loading Settings");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Loading Account",  @"Menu",  @"Loading Settings");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading Provider Info",  @"Loading Finished",  @"Loading Account");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Loading Failed",  @"Loading Account");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Loading Account",  @"Menu",  @"Loading Account");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading App Info",  @"Loading Finished",  @"Loading Provider Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Loading Failed",  @"Loading Provider Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Loading Provider Info",  @"Menu",  @"Loading Provider Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading App Icon",  @"Loading Finished",  @"Loading App Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Loading Failed",  @"Loading App Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Loading App Info",  @"Menu",  @"Loading App Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Offering Installation",  @"Loading Finished",  @"Loading App Icon");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Loading Failed",  @"Loading App Icon");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Loading App Icon",  @"Menu",  @"Loading App Icon");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse without Loading Account");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"Menu",  @"Waiting to Reverse without Loading Account");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse without Loading Account");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading Account",  @"Timer Fired",  @"Waiting to Reverse without Loading Account");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse without Loading Provider Info");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"Menu",  @"Waiting to Reverse without Loading Provider Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse without Loading Provider Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading Provider Info",  @"Timer Fired",  @"Waiting to Reverse without Loading Provider Info");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse without Loading App Info");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"Menu",  @"Waiting to Reverse without Loading App Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse without Loading App Info");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading App Info",  @"Timer Fired",  @"Waiting to Reverse without Loading App Info");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse without Loading App Icon");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"Menu",  @"Waiting to Reverse without Loading App Icon");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse without Loading App Icon");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Loading App Icon",  @"Timer Fired",  @"Waiting to Reverse without Loading App Icon");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse after Offering Installation",  @"Menu",  @"Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance after Accepting Installation",  @"Installation Accepted",  @"Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance after Rejecting Installation",  @"Installation Rejected",  @"Offering Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Advance after Accepting Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Advanced after Accepting Installation",  @"View Did Disappear",  @"Waiting to Advance after Accepting Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Advance after Rejecting Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Advanced after Rejecting Installation",  @"View Did Disappear",  @"Waiting to Advance after Rejecting Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Advance without Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Advanced without Offering Installation",  @"View Did Disappear",  @"Waiting to Advance without Offering Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse after Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse after Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Offering Installation",  @"Timer Fired",  @"Waiting to Reverse after Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting for Appearance before Reversing without Offering Installation",  @"Reset",  @"Advanced without Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting for Appearance before Offering Installation",  @"Reset",  @"Advanced after Accepting Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting for Appearance before Offering Installation",  @"Reset",  @"Advanced after Rejecting Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Appear",  @"Waiting for Appearance before Reversing without Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Reverse without Offering Installation",  @"View Did Appear",  @"Waiting for Appearance before Reversing without Offering Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Appear",  @"Waiting for Appearance before Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Offering Installation",  @"View Did Appear",  @"Waiting for Appearance before Offering Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Waiting to Reverse without Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Final",  @"View Did Disappear",  @"Waiting to Reverse without Offering Installation");
    -[VSStateMachine setDestinationState:forEvent:inState:]( v22,  "setDestinationState:forEvent:inState:",  @"Waiting to Advance without Offering Installation",  @"Timer Fired",  @"Waiting to Reverse without Offering Installation");
    -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Will Disappear",  @"Loading Account");
    uint64_t v23 = VSDefaultLogObject( -[VSStateMachine ignoreEvent:inState:]( v22,  "ignoreEvent:inState:",  @"View Did Disappear",  @"Loading Account"));
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "setupStateMachine";
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }

    stateMachine = v9->_stateMachine;
    v9->_stateMachine = v22;

    -[VSStateMachine setDelegate:](v9->_stateMachine, "setDelegate:", v9);
    -[VSStateMachine activateWithState:](v9->_stateMachine, "activateWithState:", @"Initial");
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v3 = VSRequireMainThread(self, a2);
  uint64_t v4 = VSDefaultLogObject(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Deallocating app setup view controller %p", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController dealloc](&v6, "dealloc");
}

- (void)_goBack
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_51D0;
  v2[3] = &unk_24558;
  v2[4] = self;
  VSPerformBlockOnMainThread(v2, a2);
}

- (void)_finishWithDidOfferAppInstall:(BOOL)a3 didAcceptAppInstall:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_52B4;
  v4[3] = &unk_24580;
  v4[4] = self;
  BOOL v5 = a3;
  BOOL v6 = a4;
  VSPerformBlockOnMainThread(v4, a2);
}

- (void)_menuPressed:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Menu press recognized.", v7, 2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v6 enqueueEvent:@"Menu"];
}

- (void)_timerFired:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine", a3));
  [v3 enqueueEvent:@"Timer Fired"];
}

- (void)_startTimer
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_timerFired:",  0LL,  0LL,  1.0));
  -[VSIdentityProviderAppSetupViewController setTimer:](self, "setTimer:", v4);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v3 addTimer:v4 forMode:NSDefaultRunLoopMode];
}

- (void)_stopTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController timer](self, "timer"));
  [v3 invalidate];

  -[VSIdentityProviderAppSetupViewController setTimer:](self, "setTimer:", 0LL);
}

+ (BOOL)shouldBeShownToUser
{
  uint64_t v2 = VSDefaultLogObject(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[VSIdentityProviderAppSetupViewController shouldBeShownToUser]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  id v5 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
  id v6 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_57CC;
  v23[3] = &unk_24558;
  id v7 = v5;
  id v24 = v7;
  [v6 setCompletionBlock:v23];
  -[NSOperationQueue addOperation:](v4, "addOperation:", v6);
  [v7 wait];
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 result]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 forceUnwrapObject]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_57D4;
  v22[3] = &unk_245A8;
  v22[4] = &buf;
  [v9 unwrapObject:v22 error:&stru_245E8];
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    char v10 = 0;
  }

  else
  {
    v11 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    unsigned int v12 = -[VSPreferences isInSTBMode](v11, "isInSTBMode");
    unsigned int v13 = -[VSPreferences hasChosenDesiredApp](v11, "hasChosenDesiredApp");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VSSetupFlowController sharedInstance](&OBJC_CLASS___VSSetupFlowController, "sharedInstance"));
    unsigned int v15 = [v14 didSelectNoAppsforInstall];

    uint64_t v17 = VSDefaultLogObject(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    int v19 = v12 | v13 | v15;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = "NO";
      *(_DWORD *)v25 = 136315650;
      if (v19) {
        uint64_t v20 = "YES";
      }
      v26 = v20;
      __int16 v27 = 1024;
      unsigned int v28 = v12;
      __int16 v29 = 1024;
      unsigned int v30 = v13;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Will return %s (isInSTBMode %d, hasChosenDesiredApp %d) from +[VSIdentityProviderAppSetupViewController shouldBeShownToUser]",  v25,  0x18u);
    }

    char v10 = v19 ^ 1;
  }

  _Block_object_dispose(&buf, 8);
  return v10;
}

- (void)autoAdvance
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[VSIdentityProviderAppSetupViewController autoAdvance]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = VSDefaultLogObject( -[VSIdentityProviderAppSetupViewController _finishWithDidOfferAppInstall:didAcceptAppInstall:]( self,  "_finishWithDidOfferAppInstall:didAcceptAppInstall:",  0LL,  0LL));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[VSIdentityProviderAppSetupViewController autoAdvance]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will exit %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)reset
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    char v10 = "-[VSIdentityProviderAppSetupViewController reset]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v5 enqueueEvent:@"Reset"];

  uint64_t v7 = VSDefaultLogObject(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    char v10 = "-[VSIdentityProviderAppSetupViewController reset]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Will exit %s", (uint8_t *)&v9, 0xCu);
  }
}

- (void)transitionToLoadingSettingsState
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  int v9 = sub_5B7C;
  char v10 = &unk_24660;
  id v11 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
  unsigned int v12 = self;
  id v3 = v11;
  uint64_t v4 = VSMainThreadOperationWithBlock(&v7);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "addDependency:", v3, v7, v8, v9, v10);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController privateQueue](self, "privateQueue"));
  [v6 addOperation:v3];

  VSEnqueueCompletionOperation(v5);
}

- (void)transitionToLoadingAccountState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController accountStore](self, "accountStore"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5D90;
  v6[3] = &unk_246B0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchAccountsWithCompletionHandler:v6];
}

- (void)transitionToLoadingProviderInfoState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController account](self, "account"));

  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self account] parameter must not be nil.");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController account](self, "account"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identityProviderID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 forceUnwrapObject]);

  id v8 = [[VSIdentityProviderFetchOperation alloc] initWithIdentityProviderID:v7];
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController privateQueue](self, "privateQueue"));
  [v9 addOperation:v8];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_60D4;
  v13[3] = &unk_24700;
  id v14 = v8;
  unsigned int v15 = self;
  id v16 = v3;
  id v10 = v3;
  id v11 = v8;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v13));
  [v12 addDependency:v11];
  VSEnqueueCompletionOperation(v12);
}

- (void)transitionToLoadingAppInfoState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController identityProvider](self, "identityProvider"));

  if (!v3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self identityProvider] parameter must not be nil.");
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController identityProvider](self, "identityProvider"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController developerSettings](self, "developerSettings"));
  unsigned __int8 v7 = [v6 isInSetTopBoxMode];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 nonChannelAppDescriptions]);
  id v9 = [v8 count];

  if (!v9 || (v7 & 1) != 0)
  {
    uint64_t v11 = VSErrorLogObject();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_15D54();
    }

    [v5 enqueueEvent:@"Loading Failed"];
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_63B0;
    v13[3] = &unk_24700;
    id v14 = v4;
    unsigned int v15 = self;
    id v16 = v5;
    VSPerformBlockOnMainThread(v13, v10);
  }
}

- (void)transitionToLoadingAppIconState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 scale];
  double v6 = v5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController appDescription](self, "appDescription"));
  if (!v7)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController identityProvider](self, "identityProvider"));
    if ([v16 isDeveloper])
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController developerSettings](self, "developerSettings"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 setTopBoxBundleIdentifier]);

      if (v18)
      {
        uint64_t v19 = VSErrorLogObject();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_15E8C((uint64_t)self, v20);
        }
LABEL_12:

        [v3 enqueueEvent:@"Loading Failed"];
        goto LABEL_13;
      }
    }

    else
    {
    }

    uint64_t v21 = VSErrorLogObject();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_15E0C(self, v20);
    }
    goto LABEL_12;
  }

  double v8 = v6 * 330.0;
  double v9 = v6 * 550.0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController appDescription](self, "appDescription"));

  if (!v10) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self appDescription] parameter must not be nil.");
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController appDescription](self, "appDescription"));
  v26 = v11;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v13 = objc_msgSend( [VSLoadAllAppIconsOperation alloc],  "initWithApps:shouldPrecomposeIcon:preferredSize:",  v12,  0,  v9,  v8);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_6920;
  v22[3] = &unk_24728;
  id v23 = v3;
  id v24 = v11;
  v25 = self;
  id v14 = v11;
  [v13 setResultCompletionBlock:v22];
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController privateQueue](self, "privateQueue"));
  [v15 addOperation:v13];

LABEL_13:
}

- (void)transitionToOfferingInstallationState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_6AF4;
  v2[3] = &unk_24558;
  v2[4] = self;
  VSPerformBlockOnMainThread(v2, a2);
}

- (void)stateMachine:(id)a3 transitionToState:(id)a4
{
  uint64_t v10 = (const __CFString *)a4;
  id v5 = sub_713C();
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = [v6 containsObject:v10];

  if (v7)
  {
    -[VSIdentityProviderAppSetupViewController _startTimer](self, "_startTimer");
    -[VSIdentityProviderAppSetupViewController _goBack](self, "_goBack");
LABEL_7:
    double v9 = (__CFString *)v10;
    goto LABEL_8;
  }

  if (qword_2BF90 != -1) {
    dispatch_once(&qword_2BF90, &stru_24788);
  }
  unsigned int v8 = [(id)qword_2BF88 containsObject:v10];
  double v9 = (__CFString *)v10;
  if (v8)
  {
    -[VSIdentityProviderAppSetupViewController _finishWithDidOfferAppInstall:didAcceptAppInstall:]( self,  "_finishWithDidOfferAppInstall:didAcceptAppInstall:",  v10 != @"Waiting to Advance without Offering Installation",  v10 == @"Waiting to Advance after Accepting Installation");
    goto LABEL_7;
  }

- (void)stateMachine:(id)a3 transitionFromState:(id)a4
{
  id v5 = a4;
  id v6 = sub_713C();
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = [v7 containsObject:v5];

  if (v8)
  {
    -[VSIdentityProviderAppSetupViewController _stopTimer](self, "_stopTimer");
  }

  else
  {
    if (qword_2BFA0 != -1) {
      dispatch_once(&qword_2BFA0, &stru_247A8);
    }
    id v9 = [(id)qword_2BF98 containsObject:v5];
    if ((_DWORD)v9)
    {
      uint64_t v10 = VSDefaultLogObject(v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Will reset app installation", buf, 2u);
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController undoManager](self, "undoManager"));
      uint64_t v13 = VSDefaultLogObject([v12 undo]);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v15 = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Did reset app installation", v15, 2u);
      }
    }
  }
}

- (void)beginSetup:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController appDescription](self, "appDescription", a3));

  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self appDescription] parameter must not be nil.");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController appDescription](self, "appDescription"));
  uint64_t v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController identityProvider](self, "identityProvider"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appPlacementPosition]);
  +[VSRequestAppInstallUtility markSTBProviderAppsForInstallation:rootAppPlacementPosition:]( &OBJC_CLASS___VSRequestAppInstallUtility,  "markSTBProviderAppsForInstallation:rootAppPlacementPosition:",  v6,  v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v9 enqueueEvent:@"Installation Accepted"];
}

- (void)skipSetup:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController preferences](self, "preferences", a3));
  [v4 noteDesiredApp:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v5 enqueueEvent:@"Installation Rejected"];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController viewDidLoad](&v5, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController view](self, "view"));
  uint64_t v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_25D40);
  [v3 addGestureRecognizer:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v4 enqueueEvent:@"View Will Appear"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v4 enqueueEvent:@"View Did Appear"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v4 enqueueEvent:@"View Will Disappear"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSIdentityProviderAppSetupViewController;
  -[VSIdentityProviderAppSetupViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSIdentityProviderAppSetupViewController stateMachine](self, "stateMachine"));
  [v4 enqueueEvent:@"View Did Disappear"];
}

- (id)undoManager
{
  return self->_undoManager;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSTimer)timer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_timer);
}

- (void)setTimer:(id)a3
{
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (VSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (VSDeveloperSettings)developerSettings
{
  return self->_developerSettings;
}

- (void)setDeveloperSettings:(id)a3
{
}

- (VSAppDescription)appDescription
{
  return self->_appDescription;
}

- (void)setAppDescription:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (VSSetupView)buddyView
{
  return self->_buddyView;
}

- (void)setBuddyView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end