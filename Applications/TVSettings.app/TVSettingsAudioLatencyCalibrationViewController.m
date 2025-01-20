@interface TVSettingsAudioLatencyCalibrationViewController
- (BOOL)stopNowPlayingApplicationIfNeeded;
- (SFDeviceSetupTVLatencyService)audioLatencyEstimationService;
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (TVSettingsAudioLatencyCalibrationView)calibrationView;
- (TVSettingsAudioLatencyCalibrationViewController)init;
- (TVSettingsHDMIEnforcer)hdmiEnforcer;
- (UIActivityIndicatorView)activityIndicatorView;
- (void)_applicationDidMoveToBackgroundNotification;
- (void)createSFService;
- (void)dismiss;
- (void)dismissWithError:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAudioLatencyEstimationService:(id)a3;
- (void)setCalibrationView:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)setHdmiEnforcer:(id)a3;
- (void)startCalibrationFlow;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsAudioLatencyCalibrationViewController

- (TVSettingsAudioLatencyCalibrationViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationViewController;
  v2 = -[TVSettingsAudioLatencyCalibrationViewController init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TVSettingsAudioLatencyCalibrationViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 8LL);
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationViewController;
  -[TVSettingsAudioLatencyCalibrationViewController viewDidLoad](&v5, "viewDidLoad");
  -[TVSettingsAudioLatencyCalibrationViewController setTitle:](self, "setTitle:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v3 addObserver:self selector:"_applicationDidMoveToBackgroundNotification" name:UIApplicationDidEnterBackgroundNotification object:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationViewController;
  -[TVSettingsAudioLatencyCalibrationViewController viewWillAppear:](&v28, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:1];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDisplayMode]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 audioLatencyForDisplayMode:v6]);
  [v7 doubleValue];
  double v9 = v8;
  double v10 = TVLAudioLatencyUnknown;

  if (v9 <= v10)
  {
    -[TVSettingsAudioLatencyCalibrationViewController startCalibrationFlow](self, "startCalibrationFlow");
  }

  else
  {
    uint64_t v11 = TSKLocString(@"WirelessAudioSyncAlreadyAppliedAlertTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = TSKLocString(@"WirelessAudioSyncAlreadyAppliedAlertSubTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v14,  1LL));

    uint64_t v16 = TSKLocString(@"WirelessAudioSyncAlreadyAppliedAlertRepeatActionTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100019C04;
    v27[3] = &unk_10018F018;
    v27[4] = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v27));

    uint64_t v19 = TSKLocString(@"WirelessAudioSyncAlreadyAppliedAlertResetActionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100019C0C;
    v24[3] = &unk_10018F040;
    id v25 = v5;
    v26 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  2LL,  v24));

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100019C74;
    v23[3] = &unk_10018F018;
    v23[4] = self;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v23));
    [v15 addAction:v18];
    [v15 addAction:v21];
    [v15 addAction:v22];
    -[TVSettingsAudioLatencyCalibrationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationViewController;
  -[TVSettingsAudioLatencyCalibrationViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:0];

  -[TVSettingsAudioLatencyCalibrationViewController dismiss](self, "dismiss");
}

- (BOOL)stopNowPlayingApplicationIfNeeded
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100019DA0;
  v8[3] = &unk_10018F090;
  dispatch_semaphore_t v9 = v2;
  objc_super v5 = v2;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState(v4, v8);

  dispatch_time_t v6 = dispatch_time(0LL, 250000000LL);
  LOBYTE(v4) = dispatch_semaphore_wait(v5, v6) == 0;

  return (char)v4;
}

- (void)_applicationDidMoveToBackgroundNotification
{
  id v3 = sub_100019ED4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    NSNotificationName v6 = UIApplicationDidEnterBackgroundNotification;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }

  -[TVSettingsAudioLatencyCalibrationViewController dismiss](self, "dismiss");
}

- (void)startCalibrationFlow
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  int v5 = v4;
  v7 = v6;
  dispatch_semaphore_t v9 = v8;
  uint64_t v11 = v10;

  v12 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v12;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicatorView, "setHidesWhenStopped:", 1LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationViewController view](self, "view"));
  [v14 addSubview:self->_activityIndicatorView];

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( self->_activityIndicatorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v15 = self->_activityIndicatorView;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  9LL,  0LL,  v16,  9LL,  1.0,  0.0));
  [v17 setActive:1];

  v18 = self->_activityIndicatorView;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  10LL,  0LL,  v19,  10LL,  1.0,  0.0));
  [v20 setActive:1];

  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
  id v21 = sub_100019ED4();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Stopping the now playing application",  (uint8_t *)buf,  2u);
  }

  unsigned __int8 v23 = -[TVSettingsAudioLatencyCalibrationViewController stopNowPlayingApplicationIfNeeded]( self,  "stopNowPlayingApplicationIfNeeded");
  id v24 = sub_100019ED4();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if ((v23 & 1) != 0)
  {
    if (v26)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Start enforcing HDMI output.",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    v27 = objc_alloc(&OBJC_CLASS___TVSettingsHDMIEnforcer);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10001A378;
    v31[3] = &unk_10018F0B8;
    objc_copyWeak(v32, buf);
    v32[1] = v5;
    v32[2] = v7;
    v32[3] = v9;
    v32[4] = v11;
    objc_super v28 = -[TVSettingsHDMIEnforcer initWithCompletion:](v27, "initWithCompletion:", v31);
    hdmiEnforcer = self->_hdmiEnforcer;
    self->_hdmiEnforcer = v28;

    objc_destroyWeak(v32);
    objc_destroyWeak(buf);
  }

  else
  {
    if (v26)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to stop the now playing application.",  (uint8_t *)buf,  2u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TVLatencyErrorDomain,  1207LL,  0LL));
    -[TVSettingsAudioLatencyCalibrationViewController dismissWithError:](self, "dismissWithError:", v30);
  }

- (void)dismissWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_100019ED4();
  NSNotificationName v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing with error=%{public}@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v7 = TSKLocString(@"WirelessAudioSyncFatalErrorTitle");
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = TSKLocString(@"WirelessAudioSyncFatalErrorSubTitle");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v10,  1LL));

    uint64_t v12 = TSKLocString(@"OK");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001A878;
    v17[3] = &unk_10018F018;
    v17[4] = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v17));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001A880;
    v16[3] = &unk_10018F018;
    v16[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v16));
    [v11 addAction:v14];
    [v11 addAction:v15];
    -[TVSettingsAudioLatencyCalibrationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
  }

  else
  {
    -[TVSettingsAudioLatencyCalibrationViewController dismiss](self, "dismiss");
  }
}

- (void)dismiss
{
  id v3 = sub_100019ED4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing...", buf, 2u);
  }

  -[TVSettingsHDMIEnforcer relinquishHDMIEnforcement](self->_hdmiEnforcer, "relinquishHDMIEnforcement");
  id v5 = self->_audioLatencyEstimationService;
  audioLatencyEstimationService = self->_audioLatencyEstimationService;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A9C0;
  v10[3] = &unk_10018F0E0;
  uint64_t v11 = v5;
  uint64_t v7 = v5;
  -[SFDeviceSetupTVLatencyService sendSetupAction:info:responseHandler:]( audioLatencyEstimationService,  "sendSetupAction:info:responseHandler:",  1LL,  0LL,  v10);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationViewController editingDelegate](self, "editingDelegate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationViewController editingItem](self, "editingItem"));
  [v8 editingController:self didProvideValue:0 forSettingItem:v9];

  -[TVSettingsAudioLatencyCalibrationViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (void)createSFService
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFDeviceSetupTVLatencyService);
  audioLatencyEstimationService = self->_audioLatencyEstimationService;
  self->_audioLatencyEstimationService = v3;

  objc_initWeak(&location, self);
  id v5 = self->_audioLatencyEstimationService;
  NSNotificationName v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  double v8 = sub_10001AAA8;
  uint64_t v9 = &unk_10018F108;
  objc_copyWeak(&v10, &location);
  -[SFDeviceSetupTVLatencyService setProgressHandler:](v5, "setProgressHandler:", &v6);
  -[SFDeviceSetupTVLatencyService activate](self->_audioLatencyEstimationService, "activate", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (TSKSettingItem)editingItem
{
  return self->_editingItem;
}

- (void)setEditingItem:(id)a3
{
}

- (TSKSettingItemEditingControllerDelegate)editingDelegate
{
  return (TSKSettingItemEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (TVSettingsHDMIEnforcer)hdmiEnforcer
{
  return self->_hdmiEnforcer;
}

- (void)setHdmiEnforcer:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (TVSettingsAudioLatencyCalibrationView)calibrationView
{
  return self->_calibrationView;
}

- (void)setCalibrationView:(id)a3
{
}

- (SFDeviceSetupTVLatencyService)audioLatencyEstimationService
{
  return self->_audioLatencyEstimationService;
}

- (void)setAudioLatencyEstimationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end