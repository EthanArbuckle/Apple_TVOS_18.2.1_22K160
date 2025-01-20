@interface TVDViewController
- (BOOL)checkIfFreeSpaceAvailable;
- (BOOL)termsAndConditionsStarted;
- (DADevice)device;
- (DASessionSettings)sessionSettings;
- (NSMutableArray)history;
- (NSMutableSet)errorsShowing;
- (OS_dispatch_queue)stagingQueue;
- (TVDAppDelegate)appDelegate;
- (TVDMainView)mainView;
- (TVDViewController)init;
- (_UIContentUnavailableView)failureView;
- (_UIContentUnavailableView)networkRequiredView;
- (_UIContentUnavailableView)noFreeSpaceView;
- (id)_preferredFocusedItem;
- (id)preferredFocusEnvironments;
- (unint64_t)currentViewControllerState;
- (unint64_t)getFreeSystemSpaceThreshold;
- (unint64_t)getFreeUserSpaceThreshold;
- (void)_enqueueUIUpdateWithMinimumExecution:(double)a3 block:(id)a4;
- (void)_hideFailure;
- (void)_hideNetworkRequired;
- (void)_idle;
- (void)_inactive;
- (void)_setInCurrentSessionDefault:(BOOL)a3;
- (void)_showFailureWithMessage:(id)a3;
- (void)_showNetworkRequired;
- (void)_updateErrors:(id)a3;
- (void)_updateHistory:(id)a3;
- (void)_updatePhase:(int64_t)a3;
- (void)_updateProgress:(id)a3;
- (void)_updateSessionSettings:(id)a3;
- (void)_updateTestSuiteName:(id)a3 description:(id)a4;
- (void)applicationDidResume;
- (void)checkForSession;
- (void)device:(id)a3 shouldStartTestWithTestId:(id)a4 fullscreen:(BOOL)a5 response:(id)a6;
- (void)diagnosticManager:(id)a3 dismissViewController:(id)a4 completion:(id)a5;
- (void)diagnosticManager:(id)a3 presentViewController:(id)a4 completion:(id)a5;
- (void)didAgreeToTerms;
- (void)didDisagreeToTerms;
- (void)displayOutOfSpace;
- (void)hideEverything;
- (void)hideOutOfSpace;
- (void)mainViewDidReceiveCloseAction:(id)a3;
- (void)mainViewDidReceiveDoneAction:(id)a3;
- (void)mainViewDidReceiveHistoryAction:(id)a3;
- (void)openSettings;
- (void)presentSecondaryConsent;
- (void)presentTermsAndConditions;
- (void)setAppDelegate:(id)a3;
- (void)setCurrentViewControllerState:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setErrorsShowing:(id)a3;
- (void)setFailureView:(id)a3;
- (void)setHistory:(id)a3;
- (void)setMainView:(id)a3;
- (void)setNetworkRequiredView:(id)a3;
- (void)setNoFreeSpaceView:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)setStagingQueue:(id)a3;
- (void)setTermsAndConditionsStarted:(BOOL)a3;
- (void)setupView;
- (void)showDiagosticsErrorWithReason:(id)a3;
- (void)updateViewConstraints;
- (void)updateViewsIfSpaceAvailable;
- (void)updateWithInfo:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVDViewController

- (TVDViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVDViewController;
  v2 = -[TVDViewController init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_currentViewControllerState = 0LL;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    history = v3->_history;
    v3->_history = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    errorsShowing = v3->_errorsShowing;
    v3->_errorsShowing = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 delegate]);
    appDelegate = v3->_appDelegate;
    v3->_appDelegate = (TVDAppDelegate *)v9;

    v3->_termsAndConditionsStarted = 0;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.TVDiagnostics.stagingQueue", 0LL);
    stagingQueue = v3->_stagingQueue;
    v3->_stagingQueue = (OS_dispatch_queue *)v11;
  }

  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVDViewController;
  -[TVDViewController viewDidLoad](&v6, "viewDidLoad");
  -[TVDViewController setupView](self, "setupView");
  -[TVDViewController hideEverything](self, "hideEverything");
  -[TVDViewController _setInCurrentSessionDefault:](self, "_setInCurrentSessionDefault:", 0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E800;
  block[3] = &unk_10002C820;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVDViewController;
  -[TVDViewController applicationDidResume](&v3, "applicationDidResume");
  -[TVDViewController updateViewsIfSpaceAvailable](self, "updateViewsIfSpaceAvailable");
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVDViewController _preferredFocusedItem](self, "_preferredFocusedItem"));
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v10 = v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVDViewController;
    id v6 = -[TVDViewController preferredFocusEnvironments](&v9, "preferredFocusEnvironments");
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v6);
  }

  v7 = (void *)v5;

  return v7;
}

- (id)_preferredFocusedItem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    uint64_t v10 = 6LL;
LABEL_8:
    objc_super v9 = (&self->super.super.super.isa)[v10];
    return v9;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  unsigned __int8 v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    uint64_t v10 = 5LL;
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  unsigned __int8 v8 = [v7 isHidden];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = 7LL;
    goto LABEL_8;
  }

  objc_super v9 = (objc_class *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  return v9;
}

- (void)presentTermsAndConditions
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000EA08;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)presentSecondaryConsent
{
  id v3 = sub_1000182A4(@"DIAGNOSTICS");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1000182A4(@"START_DIAGNOSTICS_TV");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  id v8 = sub_1000182A4(@"AGREE");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000ECF4;
  v15[3] = &unk_10002CBD0;
  v15[4] = self;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  0LL,  v15));
  [v7 addAction:v10];

  id v11 = sub_1000182A4(@"DISAGREE");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000ED2C;
  v14[3] = &unk_10002CBD0;
  v14[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  v14));
  [v7 addAction:v13];

  -[TVDViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  0LL,  0LL);
}

- (void)didAgreeToTerms
{
  id v3 = objc_opt_new(&OBJC_CLASS___DADeviceLocal);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[DADeviceDecoratorWithUI decorateWithDevice:]( &OBJC_CLASS___DADeviceDecoratorWithUI,  "decorateWithDevice:",  v3));
  [v4 setViewControllerDelegate:self];
  [v4 setDelegate:self];
  -[TVDViewController setDevice:](self, "setDevice:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController device](self, "device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 state]);
  [v5 updateWithDeviceState:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController device](self, "device"));
  [v8 connect];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController device](self, "device"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 state]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000EF04;
  v15[3] = &unk_10002CBF8;
  v15[4] = self;
  id v13 =  [v9 addObserverForName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v11 queue:v12 usingBlock:v15];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController device](self, "device"));
  [v14 start];

  -[TVDViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (void)didDisagreeToTerms
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVDViewController appDelegate](self, "appDelegate"));
  [v2 exitApplication];
}

- (void)diagnosticManager:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVDViewController navigationController](self, "navigationController"));
  [v9 presentViewController:v8 animated:1 completion:v7];
}

- (void)diagnosticManager:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
}

- (void)device:(id)a3 shouldStartTestWithTestId:(id)a4 fullscreen:(BOOL)a5 response:(id)a6
{
}

- (unint64_t)getFreeSystemSpaceThreshold
{
  unint64_t v2 = 0LL;
  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  id v3 = (void *)CFPreferencesCopyAppValue(@"MinimumFreeSystemSpace", @"com.apple.Diagnostics");
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      id v5 = [v3 longLongValue];
LABEL_6:
      unint64_t v2 = (unint64_t)v5;
      goto LABEL_7;
    }

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      id v5 = [v3 unsignedLongLongValue];
      goto LABEL_6;
    }
  }

- (unint64_t)getFreeUserSpaceThreshold
{
  unint64_t v2 = 0x200000LL;
  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  id v3 = (void *)CFPreferencesCopyAppValue(@"MinimumFreeUserSpace", @"com.apple.Diagnostics");
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      id v5 = [v3 longLongValue];
LABEL_6:
      unint64_t v2 = (unint64_t)v5;
      goto LABEL_7;
    }

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      id v5 = [v3 unsignedLongLongValue];
      goto LABEL_6;
    }
  }

- (void)updateViewsIfSpaceAvailable
{
  if (-[TVDViewController checkIfFreeSpaceAvailable](self, "checkIfFreeSpaceAvailable"))
  {
    -[TVDViewController hideOutOfSpace](self, "hideOutOfSpace");
    if (!-[TVDViewController currentViewControllerState](self, "currentViewControllerState")) {
      -[TVDViewController checkForSession](self, "checkForSession");
    }
  }

  else
  {
    -[TVDViewController displayOutOfSpace](self, "displayOutOfSpace");
  }

- (BOOL)checkIfFreeSpaceAvailable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/private/var"));
  id v12 = 0LL;
  id v11 = 0LL;
  [v3 getResourceValue:&v12 forKey:NSURLVolumeAvailableCapacityKey error:&v11];
  id v4 = v12;
  id v5 = v11;
  if (v4)
  {
    id v6 = [v4 unsignedLongLongValue];
    BOOL v7 = v6 >= (id)-[TVDViewController getFreeUserSpaceThreshold](self, "getFreeUserSpaceThreshold");
  }

  else
  {
    uint64_t v8 = DiagnosticsKitLogHandleForCategory(1LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100018E14((uint64_t)v5, v9);
    }

    BOOL v7 = 1;
  }

  return v7;
}

- (void)displayOutOfSpace
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F380;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)hideOutOfSpace
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F42C;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)checkForSession
{
  id v3 = objc_opt_new(&OBJC_CLASS___DADiagnosticsSessionAvailability);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController appDelegate](self, "appDelegate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ticketNumber]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F50C;
  v6[3] = &unk_10002CC48;
  v6[4] = self;
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:]( v3,  "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:",  v5,  0LL,  v6,  10.0);
}

- (void)updateWithInfo:(id)a3
{
  id v19 = a3;
  if ([v19 changedProperties])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    -[TVDViewController _updatePhase:](self, "_updatePhase:", [v4 phase]);
  }

  if (((unint64_t)[v19 changedProperties] & 6) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 suiteName]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 suiteDescription]);
    -[TVDViewController _updateTestSuiteName:description:](self, "_updateTestSuiteName:description:", v6, v8);
  }

  if (([v19 changedProperties] & 8) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 progress]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 progress]);
      -[TVDViewController _updateProgress:](self, "_updateProgress:", v12);
    }
  }

  if (([v19 changedProperties] & 0x10) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionSettings]);
    -[TVDViewController _updateSessionSettings:](self, "_updateSessionSettings:", v14);
  }

  if (([v19 changedProperties] & 0x20) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 history]);
    -[TVDViewController _updateHistory:](self, "_updateHistory:", v16);
  }

  if (([v19 changedProperties] & 0x40) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v19 snapshot]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 errors]);
    -[TVDViewController _updateErrors:](self, "_updateErrors:", v18);
  }
}

- (void)_updatePhase:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 4)
  {
    if (dword_10003A620 == 1)
    {
      uint64_t v4 = 1LL;
LABEL_11:
      -[TVDViewController _setInCurrentSessionDefault:](self, "_setInCurrentSessionDefault:", v4);
      return;
    }

    -[TVDViewController _idle](self, "_idle");
    int v5 = 1;
    uint64_t v4 = 1LL;
    goto LABEL_10;
  }

  if (a3 == 1)
  {
    if (dword_10003A620 == 2)
    {
      uint64_t v4 = 0LL;
      goto LABEL_11;
    }

    -[TVDViewController _inactive](self, "_inactive");
    uint64_t v4 = 0LL;
    int v5 = 2;
LABEL_10:
    dword_10003A620 = v5;
    goto LABEL_11;
  }

- (void)_idle
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F98C;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)_inactive
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FAA4;
  block[3] = &unk_10002C820;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateTestSuiteName:(id)a3 description:(id)a4
{
  id v6 = a4;
  if (a3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 2.0;
  }
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10000FC84;
  id v12 = &unk_10002CB70;
  id v13 = self;
  id v14 = v6;
  id v8 = v6;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  &v9,  v7);
  if (!a3) {
    -[TVDViewController _idle](self, "_idle", v9, v10, v11, v12, v13, v14);
  }
}

- (void)_updateProgress:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000FD5C;
  v5[3] = &unk_10002CB70;
  id v6 = a3;
  double v7 = self;
  id v4 = v6;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v5,  0.0);
}

- (void)_updateSessionSettings:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000FEB0;
  v4[3] = &unk_10002CB70;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( v5,  "_enqueueUIUpdateWithMinimumExecution:block:",  v4,  0.0);
}

- (void)_updateHistory:(id)a3
{
  id v4 = a3;
  for (i = v4; ; id v4 = i)
  {
    id v5 = [v4 count];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController history](self, "history"));
    id v7 = [v6 count];

    if (v5 <= v7) {
      break;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController history](self, "history"));
    id v9 = [v8 count];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController history](self, "history"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([i objectAtIndexedSubscript:v9]);
    [v10 insertObject:v11 atIndex:0];
  }
}

- (void)_updateErrors:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController errorsShowing](self, "errorsShowing"));
  id v6 = [v5 mutableCopy];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (id i = 0LL; i != v9; id i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if ([v6 containsObject:v12])
        {
          [v6 removeObject:v12];
        }

        else
        {
          id v13 = (char *)[v12 code];
          if ((unint64_t)(v13 - 2) < 2)
          {
            -[TVDViewController _showNetworkRequired](self, "_showNetworkRequired");
          }

          else
          {
            else {
              id v14 = @"COULD_NOT_PROFILE";
            }
            id v15 = sub_1000182A4(v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            -[TVDViewController _showFailureWithMessage:](self, "_showFailureWithMessage:", v16);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController errorsShowing](self, "errorsShowing"));
          [v17 addObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v9);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
        v24 = (char *)objc_msgSend(v23, "code", (void)v26);
        if ((unint64_t)(v24 - 2) < 2)
        {
          -[TVDViewController _hideNetworkRequired](self, "_hideNetworkRequired");
        }

        else if ((unint64_t)v24 <= 1)
        {
          -[TVDViewController _hideFailure](self, "_hideFailure");
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController errorsShowing](self, "errorsShowing"));
        [v25 removeObject:v23];
      }

      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v20);
  }
}

- (void)_showFailureWithMessage:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_100010320;
  id v9 = &unk_10002CB70;
  uint64_t v10 = self;
  id v11 = a3;
  id v4 = v11;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( v10,  "_enqueueUIUpdateWithMinimumExecution:block:",  &v6,  0.0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController appDelegate](self, "appDelegate", v6, v7, v8, v9, v10));
  [v5 allowApplicationBackgrounding:0];
}

- (void)_showNetworkRequired
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000103C4;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)_hideNetworkRequired
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100010470;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)_hideFailure
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000104F8;
  v2[3] = &unk_10002C820;
  v2[4] = self;
  -[TVDViewController _enqueueUIUpdateWithMinimumExecution:block:]( self,  "_enqueueUIUpdateWithMinimumExecution:block:",  v2,  0.0);
}

- (void)_setInCurrentSessionDefault:(BOOL)a3
{
}

- (void)mainViewDidReceiveCloseAction:(id)a3
{
  id v4 = sub_1000182A4(@"EXIT_DIAGNOSTICS_SESSION_BODY");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  0LL,  0LL));

  id v7 = sub_1000182A4(@"CANCEL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));
  [v6 addAction:v9];

  id v10 = sub_1000182A4(@"CLOSE_DIAGNOSTICS");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000106A8;
  v13[3] = &unk_10002CBD0;
  v13[4] = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v13));
  [v6 addAction:v12];

  -[TVDViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
}

- (void)mainViewDidReceiveDoneAction:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVDViewController appDelegate](self, "appDelegate", a3));
  [v3 exitApplication];
}

- (void)mainViewDidReceiveHistoryAction:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 1LL);
  -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 0LL);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v21 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController history](self, "history"));
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 testSuiteName]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 date]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v13));
        -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@     %@\n", v12, v14);
      }

      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }

  id v15 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v16 = sub_1000182A4(@"HISTORY");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = [v15 initWithTitle:v17 text:v4];

  id v19 = sub_1000182A4(@"DONE");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100010990;
  v22[3] = &unk_10002C820;
  v22[4] = v21;
  [v18 addButtonWithTitle:v20 type:0 handler:v22];

  -[TVDViewController presentViewController:animated:completion:]( v21,  "presentViewController:animated:completion:",  v18,  1LL,  0LL);
}

- (void)hideEverything
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v3 showActivityIndicator:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v4 hideText:1];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v5 hideProgressView:1];
}

- (void)openSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=NETWORK&path=WIFI"));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)showDiagosticsErrorWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000182A4(@"SELECT_DONE_TO_EXIT_DIAGNOSTICS");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v8 setMessage:v7];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v9 setHidden:0];

  -[TVDViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)setupView
{
  id v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
  id v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  -[TVDViewController setView:](self, "setView:", v5);

  id v6 = -[TVDMainView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVDMainView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[TVDViewController setMainView:](self, "setMainView:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v7 setDelegate:self];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v9 = objc_alloc(&OBJC_CLASS____UIContentUnavailableView);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  [v10 frame];
  id v11 = -[_UIContentUnavailableView initWithFrame:title:style:](v9, "initWithFrame:title:style:", 0LL, 1LL);
  -[TVDViewController setNoFreeSpaceView:](self, "setNoFreeSpaceView:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v12 setAutoresizingMask:18];

  id v13 = sub_1000182A4(@"CANNOT_START_DIAGNOSTICS");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v15 setTitle:v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  -[TVDViewController getFreeUserSpaceThreshold](self, "getFreeUserSpaceThreshold"),  0LL));
  __int128 v23 = sub_10001837C(@"OUT_OF_SPACE", @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v25 setMessage:v24];

  id v26 = sub_1000182A4(@"OPEN_STORAGE_AND_ICLOUD_USAGE_SETTINGS");
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v28 setButtonTitle:v27];

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v30 setBackgroundColor:v29];

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v31 setButtonAction:&stru_10002CC68];

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v32 setHidden:1];

  objc_initWeak(&location, self);
  __int128 v33 = objc_alloc(&OBJC_CLASS____UIContentUnavailableView);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  [v34 frame];
  v35 = -[_UIContentUnavailableView initWithFrame:title:style:](v33, "initWithFrame:title:style:", 0LL, 1LL);
  -[TVDViewController setFailureView:](self, "setFailureView:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v36 setAutoresizingMask:18];

  id v37 = sub_1000182A4(@"DIAGNOSTICS_ERROR");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v39 setTitle:v38];

  id v40 = sub_1000182A4(@"DONE");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v42 setButtonTitle:v41];

  id v43 = sub_1000182A4(@"CANNOT_START_DIAGNOSTICS");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v45 setMessage:v44];

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_100011318;
  v83[3] = &unk_10002C898;
  objc_copyWeak(&v84, &location);
  [v46 setButtonAction:v83];

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v48 setBackgroundColor:v47];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v49 setHidden:1];

  v50 = objc_alloc(&OBJC_CLASS____UIContentUnavailableView);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  [v51 frame];
  v52 = -[_UIContentUnavailableView initWithFrame:title:style:](v50, "initWithFrame:title:style:", 0LL, 1LL);
  -[TVDViewController setNetworkRequiredView:](self, "setNetworkRequiredView:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v53 setAutoresizingMask:18];

  id v54 = sub_1000182A4(@"NETWORK_UNAVAILABLE");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v56 setTitle:v55];

  id v57 = sub_1000182A4(@"CONNECT_TO_NETWORK");
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v59 setMessage:v58];

  id v60 = sub_1000182A4(@"OPEN_SETTINGS");
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v62 setButtonTitle:v61];

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_10001135C;
  v81[3] = &unk_10002C898;
  objc_copyWeak(&v82, &location);
  [v63 setButtonAction:v81];

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v65 setBackgroundColor:v64];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v66 setHidden:1];

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 contentView]);
  [v68 setNeedsUpdateConstraints];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 contentView]);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  [v70 addSubview:v71];

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 contentView]);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController networkRequiredView](self, "networkRequiredView"));
  [v73 addSubview:v74];

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue([v75 contentView]);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController noFreeSpaceView](self, "noFreeSpaceView"));
  [v76 addSubview:v77];

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v78 contentView]);
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController failureView](self, "failureView"));
  [v79 addSubview:v80];

  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&location);
}

- (void)updateViewConstraints
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVDViewController;
  -[TVDViewController updateViewConstraints](&v14, "updateViewConstraints");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  7LL,  0LL,  0LL,  0LL,  1.0,  960.0));
  [v3 addConstraint:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  9LL,  0LL,  v8,  9LL,  1.0,  0.0));
  [v6 addConstraint:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController view](self, "view"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVDViewController mainView](self, "mainView"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  10LL,  0LL,  v12,  10LL,  1.0,  0.0));
  [v10 addConstraint:v13];
}

- (void)_enqueueUIUpdateWithMinimumExecution:(double)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVDViewController stagingQueue](self, "stagingQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000115E0;
  v9[3] = &unk_10002CC90;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (DADevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (TVDAppDelegate)appDelegate
{
  return self->_appDelegate;
}

- (void)setAppDelegate:(id)a3
{
}

- (TVDMainView)mainView
{
  return self->_mainView;
}

- (void)setMainView:(id)a3
{
}

- (_UIContentUnavailableView)noFreeSpaceView
{
  return self->_noFreeSpaceView;
}

- (void)setNoFreeSpaceView:(id)a3
{
}

- (_UIContentUnavailableView)failureView
{
  return self->_failureView;
}

- (void)setFailureView:(id)a3
{
}

- (_UIContentUnavailableView)networkRequiredView
{
  return self->_networkRequiredView;
}

- (void)setNetworkRequiredView:(id)a3
{
}

- (unint64_t)currentViewControllerState
{
  return self->_currentViewControllerState;
}

- (void)setCurrentViewControllerState:(unint64_t)a3
{
  self->_currentViewControllerState = a3;
}

- (BOOL)termsAndConditionsStarted
{
  return self->_termsAndConditionsStarted;
}

- (void)setTermsAndConditionsStarted:(BOOL)a3
{
  self->_termsAndConditionsStarted = a3;
}

- (NSMutableArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
}

- (NSMutableSet)errorsShowing
{
  return self->_errorsShowing;
}

- (void)setErrorsShowing:(id)a3
{
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
}

- (OS_dispatch_queue)stagingQueue
{
  return self->_stagingQueue;
}

- (void)setStagingQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end