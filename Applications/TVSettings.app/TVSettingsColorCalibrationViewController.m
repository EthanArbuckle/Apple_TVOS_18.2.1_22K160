@interface TVSettingsColorCalibrationViewController
- (SFDeviceSetupTVColorCalibratorService)colorCalibrationService;
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (TVSettingsColorCalibrationView)calibrationView;
- (TVSettingsColorCalibrationViewController)init;
- (void)_applicationDidMoveToBackgroundNotification;
- (void)_createSFService;
- (void)_dismiss;
- (void)_dismissError;
- (void)_promptToRevert;
- (void)_sendRetry;
- (void)_showError:(BOOL)a3;
- (void)_showResults;
- (void)_startCalibrationFlow;
- (void)dealloc;
- (void)setCalibrationView:(id)a3;
- (void)setColorCalibrationService:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsColorCalibrationViewController

- (TVSettingsColorCalibrationViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  v2 = -[TVSettingsColorCalibrationViewController init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TVSettingsColorCalibrationViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 8LL);
  }
  return v3;
}

- (void)dealloc
{
  colorCalibrationService = self->_colorCalibrationService;
  self->_colorCalibrationService = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  -[TVSettingsColorCalibrationViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  -[TVSettingsColorCalibrationViewController viewDidLoad](&v24, "viewDidLoad");
  -[TVSettingsColorCalibrationViewController setTitle:](self, "setTitle:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = -[TVSettingsColorCalibrationView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSettingsColorCalibrationView),  "initWithFrame:",  v5,  v7,  v9,  v11);
  calibrationView = self->_calibrationView;
  self->_calibrationView = v12;

  -[TVSettingsColorCalibrationView setAlpha:](self->_calibrationView, "setAlpha:", 0.0);
  objc_initWeak(&location, self);
  v14 = self->_calibrationView;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_100066A68;
  v21 = &unk_10018F498;
  objc_copyWeak(&v22, &location);
  -[TVSettingsColorCalibrationView setDismissHandler:](v14, "setDismissHandler:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorCalibrationViewController view](self, "view", v18, v19, v20, v21));
  [v15 addSubview:self->_calibrationView];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v16 addObserver:self selector:"_applicationDidMoveToBackgroundNotification" name:UIApplicationDidEnterBackgroundNotification object:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  -[TVSettingsColorCalibrationViewController viewWillAppear:](&v53, "viewWillAppear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:1];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDisplayMode]);
  id v7 = [v5 colorCalibrationStatusForDisplayMode:v6];

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v7 == (id)2) {
      double v9 = @"AVDisplayAdjustmentAlreadyConfirmedAlertSubTitle";
    }
    else {
      double v9 = @"AVDisplayAdjustmentAlreadyAppliedAlertSubTitle";
    }
    uint64_t v10 = TSKLocStringFromBundleCachingKey(v9, v8, 1LL, 0LL, @"Localizable-Colorimeter");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v13 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentAlreadyAppliedAlertTitle",  v12,  1LL,  0LL,  @"Localizable-Colorimeter");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v11,  1LL));
    v35 = (void *)v11;
    v36 = self;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v17 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentAlreadyAppliedAlertRepeatActionTitle",  v16,  1LL,  0LL,  @"Localizable-Colorimeter");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10006708C;
    v50[3] = &unk_10018F4E8;
    objc_copyWeak(&v51, &location);
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  0LL,  v50));

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v20 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentViewResultsButton",  v19,  1LL,  0LL,  @"Localizable-Colorimeter");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000670B8;
    v48[3] = &unk_10018F4E8;
    objc_copyWeak(&v49, &location);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  v48));

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v23 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentAlreadyAppliedAlertResetActionTitle",  v22,  1LL,  0LL,  @"Localizable-Colorimeter");
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000670E4;
    v45[3] = &unk_10018F4C0;
    v33 = &v47;
    objc_copyWeak(&v47, &location);
    id v46 = v5;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  2LL,  v45));

    uint64_t v26 = TSKLocString(@"Cancel");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100067160;
    v43[3] = &unk_10018F4E8;
    objc_copyWeak(&v44, &location);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  1LL,  v43));

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10006718C;
    v41[3] = &unk_10018F4E8;
    objc_copyWeak(&v42, &location);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v41));
    [v15 addAction:v38];
    v30 = v28;
    if (v7 == (id)1)
    {
      objc_msgSend(v15, "addAction:", v37, &v47, v35);
      [v15 addAction:v25];
      v30 = v29;
    }

    objc_msgSend(v15, "addAction:", v30, v33);
    v31 = v36->_calibrationView;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000671B8;
    v39[3] = &unk_10018E440;
    v32 = v31;
    v40 = v32;
    -[TVSettingsColorCalibrationViewController presentViewController:animated:completion:]( v36,  "presentViewController:animated:completion:",  v15,  1LL,  v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(v34);
    objc_destroyWeak(&v49);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVSettingsColorCalibrationViewController _startCalibrationFlow](self, "_startCalibrationFlow");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  -[TVSettingsColorCalibrationViewController viewWillDisappear:](&v27, "viewWillDisappear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 colorCalibrationForDisplayMode:v5]);

  if ([v6 count] == (id)4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    [v7 floatValue];
    float v9 = v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
    [v10 floatValue];
    float v12 = v11;

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:2]);
    [v13 floatValue];
    float v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:3]);
    [v16 floatValue];
    float v18 = v17;

    sub_100031024(v9, v12, v15, v18);
  }

  objc_initWeak(&location, self);
  uint64_t v19 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  uint64_t v23 = sub_1000673B0;
  objc_super v24 = &unk_10018E810;
  objc_copyWeak(&v25, &location);
  uint64_t v20 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v19,  "initWithDuration:curve:animations:",  0LL,  &v21,  0.05);
  -[UIViewPropertyAnimator startAnimation](v20, "startAnimation", v21, v22, v23, v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewController;
  -[TVSettingsColorCalibrationViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 setIdleTimerDisabled:0];

  -[TVSettingsColorCalibrationViewController _dismiss](self, "_dismiss");
}

- (void)_applicationDidMoveToBackgroundNotification
{
  id v3 = sub_100067514();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    NSNotificationName v6 = UIApplicationDidEnterBackgroundNotification;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }

  -[TVSettingsColorCalibrationViewController _dismiss](self, "_dismiss");
}

- (void)_showResults
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 colorCalibrationForDisplayMode:v4]);

  if ([v5 count] == (id)4)
  {
    -[TVSettingsColorCalibrationView setResult:targetWhitePoint:]( self->_calibrationView,  "setResult:targetWhitePoint:",  v5,  0LL);
    -[TVSettingsColorCalibrationView setCalibrationState:](self->_calibrationView, "setCalibrationState:", 9LL);
    objc_initWeak(&location, self);
    NSNotificationName v6 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    float v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    float v11 = sub_1000676DC;
    float v12 = &unk_10018E810;
    objc_copyWeak(&v13, &location);
    id v7 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v6,  "initWithDuration:curve:animations:",  0LL,  &v9,  0.2);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v7, "startAnimationAfterDelay:", 0.5, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  else
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);
    [v3 setColorCalibration:0 forDisplayMode:v8];

    -[TVSettingsColorCalibrationViewController _startCalibrationFlow](self, "_startCalibrationFlow");
  }
}

- (void)_startCalibrationFlow
{
  id v3 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  int v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  id v7 = sub_100067828;
  float v8 = &unk_10018E810;
  objc_copyWeak(&v9, &location);
  double v4 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v3,  "initWithDuration:curve:animations:",  0LL,  &v5,  0.2);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](v4, "startAnimationAfterDelay:", 0.5, v5, v6, v7, v8);

  -[TVSettingsColorCalibrationViewController _createSFService](self, "_createSFService");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_dismiss
{
  id v3 = sub_100067514();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  colorCalibrationService = self->_colorCalibrationService;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000679C8;
  v8[3] = &unk_100191228;
  objc_copyWeak(&v9, buf);
  -[SFDeviceSetupTVColorCalibratorService sendSetupAction:info:responseHandler:]( colorCalibrationService,  "sendSetupAction:info:responseHandler:",  1LL,  0LL,  v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorCalibrationViewController editingDelegate](self, "editingDelegate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorCalibrationViewController editingItem](self, "editingItem"));
  [v6 editingController:self didProvideValue:0 forSettingItem:v7];

  -[TVSettingsColorCalibrationViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_promptToRevert
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v4 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentRemoveCalibrationAlertTitle",  v3,  1LL,  0LL,  @"Localizable-Colorimeter");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v7 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentRemoveCalibrationAlertSubTitle",  v6,  1LL,  0LL,  @"Localizable-Colorimeter");
  float v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v8,  1LL));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v11 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentRemoveCalibrationAlertRemoveActionTitle",  v10,  1LL,  0LL,  @"Localizable-Colorimeter");
  float v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100067D58;
  v21[3] = &unk_10018F4E8;
  objc_copyWeak(&v22, &location);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  2LL,  v21));

  float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v15 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentRemoveCalibrationAlertUseActionTitle",  v14,  1LL,  0LL,  @"Localizable-Colorimeter");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100067E3C;
  v19[3] = &unk_10018F4E8;
  objc_copyWeak(&v20, &location);
  float v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v19));

  float v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  &stru_100191248));
  [v9 addAction:v13];
  [v9 addAction:v17];
  [v9 addAction:v18];
  -[TVSettingsColorCalibrationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (void)_showError:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v3) {
    uint64_t v6 = @"AVDisplayAdjustmentErrorAlertTitle";
  }
  else {
    uint64_t v6 = @"AVDisplayAdjustmentError2AlertTitle";
  }
  uint64_t v7 = TSKLocStringFromBundleCachingKey(v6, v5, 1LL, 0LL, @"Localizable-Colorimeter");
  float v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v3) {
    uint64_t v10 = @"AVDisplayAdjustmentErrorAlertSubTitle";
  }
  else {
    uint64_t v10 = @"AVDisplayAdjustmentError2AlertSubTitle";
  }
  uint64_t v11 = TSKLocStringFromBundleCachingKey(v10, v9, 1LL, 0LL, @"Localizable-Colorimeter");
  float v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v12,  1LL));

  float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v15 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentErrorAlertRetryActionTitle",  v14,  1LL,  0LL,  @"Localizable-Colorimeter");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000681FC;
  v23[3] = &unk_10018F4E8;
  objc_copyWeak(&v24, &location);
  float v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v23));

  uint64_t v18 = TSKLocString(@"Cancel");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100068278;
  v21[3] = &unk_10018F4E8;
  objc_copyWeak(&v22, &location);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  1LL,  v21));

  [v13 addAction:v17];
  [v13 addAction:v20];
  -[TVSettingsColorCalibrationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v13,  1LL,  0LL);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

- (void)_dismissError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorCalibrationViewController presentedViewController](self, "presentedViewController"));
  if (v2)
  {
    id v3 = v2;
    [v2 dismissModalViewControllerAnimated:1];
    v2 = v3;
  }
}

- (void)_sendRetry
{
  id v3 = sub_100067514();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Send Retry", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  colorCalibrationService = self->_colorCalibrationService;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000683D8;
  v6[3] = &unk_100191228;
  objc_copyWeak(&v7, buf);
  -[SFDeviceSetupTVColorCalibratorService sendSetupAction:info:responseHandler:]( colorCalibrationService,  "sendSetupAction:info:responseHandler:",  7LL,  0LL,  v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_createSFService
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFDeviceSetupTVColorCalibratorService);
  colorCalibrationService = self->_colorCalibrationService;
  self->_colorCalibrationService = v3;

  objc_initWeak(&location, self);
  int v5 = self->_colorCalibrationService;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  float v8 = sub_100068548;
  id v9 = &unk_10018F108;
  objc_copyWeak(&v10, &location);
  -[SFDeviceSetupTVColorCalibratorService setProgressHandler:](v5, "setProgressHandler:", &v6);
  -[SFDeviceSetupTVColorCalibratorService activate](self->_colorCalibrationService, "activate", v6, v7, v8, v9);
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

- (SFDeviceSetupTVColorCalibratorService)colorCalibrationService
{
  return self->_colorCalibrationService;
}

- (void)setColorCalibrationService:(id)a3
{
}

- (TVSettingsColorCalibrationView)calibrationView
{
  return self->_calibrationView;
}

- (void)setCalibrationView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end