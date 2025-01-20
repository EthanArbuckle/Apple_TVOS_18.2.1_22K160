@interface PBCriticalRemoteBatteryWarningViewController
+ (id)_initialAllowSleepButtonTitle;
- (PBCriticalRemoteBatteryWarningViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dismissalCompletion;
- (int64_t)remoteType;
- (unint64_t)timeout;
- (void)_cancelCountdownTimer;
- (void)_countdownTimerFired;
- (void)_dismissViewControllerWithAllowSleep:(BOOL)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_startCountdownTimerIfNecessary;
- (void)_updateAllowSleepButtonTitle;
- (void)dealloc;
- (void)setDismissalCompletion:(id)a3;
- (void)setRemoteType:(int64_t)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBCriticalRemoteBatteryWarningViewController

- (PBCriticalRemoteBatteryWarningViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController;
  result = -[PBCriticalRemoteBatteryWarningViewController initWithNibName:bundle:]( &v5,  "initWithNibName:bundle:",  a3,  a4);
  if (result) {
    result->_timeout = 30LL;
  }
  return result;
}

- (void)dealloc
{
  disallowSleepGesture = self->_disallowSleepGesture;
  self->_disallowSleepGesture = 0LL;

  -[PBSystemGestureHandle invalidate](self->_allowSleepGesture, "invalidate");
  allowSleepGesture = self->_allowSleepGesture;
  self->_allowSleepGesture = 0LL;

  objc_super v5 = (void (**)(id, void))objc_retainBlock(self->_dismissalCompletion);
  id dismissalCompletion = self->_dismissalCompletion;
  self->_id dismissalCompletion = 0LL;

  if (v5) {
    v5[2](v5, 0LL);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController;
  -[PBCriticalRemoteBatteryWarningViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController;
  -[PBCriticalRemoteBatteryWarningViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCriticalRemoteBatteryWarningViewController view](self, "view"));
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_1003FE740);
  [v3 addGestureRecognizer:v4];
  id v5 = sub_1001C307C(@"RemoteBatteryWarningTitle", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1001C307C(@"RemoteBatteryWarningDescription", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));
  alertController = self->_alertController;
  self->_alertController = v9;

  objc_initWeak(&location, self);
  id v11 = [(id)objc_opt_class(self) _initialAllowSleepButtonTitle];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000E73E4;
  v21[3] = &unk_1003D6658;
  objc_copyWeak(&v22, &location);
  v13 = (UIAlertAction *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  v21));
  allowSleepAction = self->_allowSleepAction;
  self->_allowSleepAction = v13;

  -[UIAlertController addAction:](self->_alertController, "addAction:", self->_allowSleepAction);
  id v15 = sub_1001C307C(@"RemoteBatteryWarningDisallowSleepButtonTitle", 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E7414;
  v19[3] = &unk_1003D6658;
  objc_copyWeak(&v20, &location);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  v19));

  -[UIAlertController addAction:](self->_alertController, "addAction:", v17);
  v18 = objc_alloc_init(&OBJC_CLASS___PBCriticalRemoteBatteryWarningAlertHeaderViewController);
  -[PBCriticalRemoteBatteryWarningAlertHeaderViewController setRemoteType:]( v18,  "setRemoteType:",  -[PBCriticalRemoteBatteryWarningViewController remoteType](self, "remoteType"));
  -[UIAlertController _setHeaderContentViewController:](self->_alertController, "_setHeaderContentViewController:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController;
  -[PBCriticalRemoteBatteryWarningViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PBCriticalRemoteBatteryWarningViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_alertController,  1LL,  0LL);
  -[PBCriticalRemoteBatteryWarningViewController _startCountdownTimerIfNecessary]( self,  "_startCountdownTimerIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewController;
  -[PBCriticalRemoteBatteryWarningViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  objc_initWeak(&location, self);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E7654;
  v12[3] = &unk_1003D1020;
  objc_copyWeak(&v13, &location);
  id v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:53 actionHandler:v12];
  allowSleepGesture = self->_allowSleepGesture;
  self->_allowSleepGesture = v5;

  -[PBSystemGestureHandle acquire](self->_allowSleepGesture, "acquire");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E7684;
  v10[3] = &unk_1003D1020;
  objc_copyWeak(&v11, &location);
  v8 = (PBSystemGestureHandle *)[v7 newHandleForSystemGesture:54 actionHandler:v10];
  disallowSleepGesture = self->_disallowSleepGesture;
  self->_disallowSleepGesture = v8;

  -[PBSystemGestureHandle acquire](self->_disallowSleepGesture, "acquire");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PBCriticalRemoteBatteryWarningViewController _handleMenuButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[PBCriticalRemoteBatteryWarningViewController _dismissViewControllerWithAllowSleep:]( self,  "_dismissViewControllerWithAllowSleep:",  0LL);
}

- (void)_dismissViewControllerWithAllowSleep:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBCriticalRemoteBatteryWarningViewController _cancelCountdownTimer](self, "_cancelCountdownTimer");
  id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBCriticalRemoteBatteryWarningViewController dismissalCompletion]( self,  "dismissalCompletion"));
  -[PBCriticalRemoteBatteryWarningViewController setDismissalCompletion:](self, "setDismissalCompletion:", 0LL);
  if (v5) {
    v5[2](v5, v3);
  }
}

- (void)_startCountdownTimerIfNecessary
{
  if (!self->_countdownTimerSource)
  {
    unint64_t timeout = self->_timeout;
    if (timeout)
    {
      self->_countdownSecondsLeft = timeout;
      -[PBCriticalRemoteBatteryWarningViewController _updateAllowSleepButtonTitle](self, "_updateAllowSleepButtonTitle");
      id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
      countdownTimerSource = self->_countdownTimerSource;
      self->_countdownTimerSource = v4;

      int v6 = self->_countdownTimerSource;
      dispatch_time_t v7 = dispatch_time(0LL, llround(1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x3B9ACA00uLL, 0x5F5E100uLL);
      objc_initWeak(&location, self);
      v8 = self->_countdownTimerSource;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000E78F8;
      v9[3] = &unk_1003D0890;
      objc_copyWeak(&v10, &location);
      dispatch_source_set_event_handler((dispatch_source_t)v8, v9);
      dispatch_resume((dispatch_object_t)self->_countdownTimerSource);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

- (void)_cancelCountdownTimer
{
  if (self->_countdownTimerSource)
  {
    self->_countdownSecondsLeft = 0LL;
    -[PBCriticalRemoteBatteryWarningViewController _updateAllowSleepButtonTitle](self, "_updateAllowSleepButtonTitle");
    dispatch_source_cancel((dispatch_source_t)self->_countdownTimerSource);
    countdownTimerSource = self->_countdownTimerSource;
    self->_countdownTimerSource = 0LL;
  }

- (void)_countdownTimerFired
{
  unint64_t countdownSecondsLeft = self->_countdownSecondsLeft;
  if (countdownSecondsLeft)
  {
    self->_unint64_t countdownSecondsLeft = countdownSecondsLeft - 1;
    -[PBCriticalRemoteBatteryWarningViewController _updateAllowSleepButtonTitle](self, "_updateAllowSleepButtonTitle");
    if (!self->_countdownSecondsLeft)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Remote battery warning timed Out",  v4,  2u);
      }

      -[PBCriticalRemoteBatteryWarningViewController _dismissViewControllerWithAllowSleep:]( self,  "_dismissViewControllerWithAllowSleep:",  1LL);
    }
  }

+ (id)_initialAllowSleepButtonTitle
{
  id v2 = sub_1001C307C(@"RemoteBatteryWarningAllowSleepButtonTitle", 0LL);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)_updateAllowSleepButtonTitle
{
  if (self->_countdownSecondsLeft)
  {
    id v3 = sub_1001C307C(@"RemoteBatteryWarningAllowSleepTimerButtonTitleFormat", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v4,  self->_countdownSecondsLeft));
  }

  else
  {
    id v6 = [(id)objc_opt_class(self) _initialAllowSleepButtonTitle];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  -[UIAlertAction setTitle:](self->_allowSleepAction, "setTitle:", v5);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_unint64_t timeout = a3;
}

- (int64_t)remoteType
{
  return self->_remoteType;
}

- (void)setRemoteType:(int64_t)a3
{
  self->_remoteType = a3;
}

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end