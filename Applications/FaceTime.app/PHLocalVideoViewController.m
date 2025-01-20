@interface PHLocalVideoViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_isValidFaceTimeOrientation:(int64_t)a3;
- (BOOL)cachedIsUsingIPadExternalCamera;
- (BOOL)deviceIsFrontFacingOrExternal:(id)a3;
- (BOOL)didDeferStartCameraAction;
- (BOOL)isReadyForPreview;
- (BOOL)isUsingIPadExternalCamera;
- (BOOL)localVideoLayersAreAssociated;
- (BOOL)screensaverActive;
- (BOOL)shouldDeferStartCameraAction;
- (BOOL)shouldDisableEdgeClip;
- (BOOL)showsLocalPreviewStatusBarGradient;
- (BOOL)supportsAutoRotation;
- (BOOL)waitingForLocalVideoFirstFrame;
- (PHLocalVideoDisabledOverlayView)disabledOverlayView;
- (PHLocalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TUFeatureFlags)featureFlags;
- (UIControl)videoGroupView;
- (UIView)localVideoStatusBarGradientView;
- (UIView)localVideoView;
- (id)_scene;
- (int)_tuVideoDeviceOrientationForDeviceOrientation:(int64_t)a3;
- (int64_t)lastKnownOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustForOrientationAnimated:(BOOL)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationEnteredBackground:(id)a3;
- (void)_applyAutoRotationCorrectionForOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)_applyPreviewMSROptimizationTransformsForOrientation:(int64_t)a3;
- (void)_avFirstPreviewFrameArrived:(id)a3;
- (void)_dissociateVideoLayers;
- (void)_ensureLocalVideoWillBecomeVisible;
- (void)_ensureVideoLayersExist;
- (void)_fadeInLocalVideo;
- (void)_handleLocalCameraAvailableNotification:(id)a3;
- (void)_handleLocalCameraErrorNotification:(id)a3;
- (void)_handleScreenSaverActiveDidChange;
- (void)_handleSystemAttentionStateChangedNotification:(id)a3;
- (void)_handleSystemPreferredCameraChangedNotification:(id)a3;
- (void)_handleVideoPreviewDidStartNotification:(id)a3;
- (void)_previewMSROptimizationCompensationForOrientation:(int64_t)a3 withTransform:(CGAffineTransform *)a4 withBounds:(CGRect *)a5;
- (void)_setupVideoLayers;
- (void)_updateLocalPreviewStatusBarGradient;
- (void)_updateLocalVideoOrientationAnimated:(BOOL)a3;
- (void)associateLocalVideoLayers;
- (void)dealloc;
- (void)fadeInAnimated:(BOOL)a3;
- (void)fadeOutAnimated:(BOOL)a3;
- (void)loadView;
- (void)setCachedIsUsingIPadExternalCamera:(BOOL)a3;
- (void)setDidDeferStartCameraAction:(BOOL)a3;
- (void)setDisabledOverlayView:(id)a3;
- (void)setLastKnownOrientation:(int64_t)a3;
- (void)setLocalVideoStatusBarGradientView:(id)a3;
- (void)setLocalVideoView:(id)a3;
- (void)setReadyForPreview:(BOOL)a3;
- (void)setScreensaverActive:(BOOL)a3;
- (void)setShowsLocalPreviewStatusBarGradient:(BOOL)a3;
- (void)setSupportsAutoRotation:(BOOL)a3;
- (void)setUpScreensaverObservers;
- (void)setVideoGroupView:(id)a3;
- (void)setWaitingForLocalVideoFirstFrame:(BOOL)a3;
- (void)startPreview;
- (void)stopPreview;
- (void)tearDownScreensaverObservers;
- (void)updateViewControllerForOrientation:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PHLocalVideoViewController

- (PHLocalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  v4 = -[PHLocalVideoViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v6 = [v5 userInterfaceIdiom];

    if (v6 == (id)1) {
      v4->_showsLocalPreviewStatusBarGradient = 1;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v8 = [v7 contentViewCanRotate];

    if (v8) {
      v4->_supportsAutoRotation = 1;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v4 selector:"_avFirstPreviewFrameArrived:" name:TUVideoDeviceControllerReceivedFirstPreviewFrameNotification object:0];
    [v9 addObserver:v4 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
    [v9 addObserver:v4 selector:"_applicationEnteredBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v9 addObserver:v4 selector:"_handleLocalCameraErrorNotification:" name:TUVideoDeviceControllerDeviceDidReceiveErrorNotification object:0];
    [v9 addObserver:v4 selector:"_handleLocalCameraAvailableNotification:" name:TUVideoDeviceControllerDeviceBecameAvailableNotification object:0];
    [v9 addObserver:v4 selector:"_handleVideoPreviewDidStartNotification:" name:TUVideoDeviceControllerDidStartPreviewNotification object:0];
    [v9 addObserver:v4 selector:"_handleSystemPreferredCameraChangedNotification:" name:TUVideoDeviceControllerSystemPreferredCameraChangedNotification object:0];
    [v9 addObserver:v4 selector:"_handleLocalCameraUIDChangedNotification:" name:TUVideoDeviceControllerDidChangeLocalCameraUIDNotification object:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    v4->_lastKnownOrientation = (int64_t)[v10 orientation];

    if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:]( v4,  "_isValidFaceTimeOrientation:",  v4->_lastKnownOrientation)) {
      v4->_lastKnownOrientation = -[PHLocalVideoViewController supportsAutoRotation]( v4,  "supportsAutoRotation") ^ 1;
    }
    v11 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v4->_featureFlags;
    v4->_featureFlags = v11;

    v4->_readyForPreview = 0;
    -[PHLocalVideoViewController setUpScreensaverObservers](v4, "setUpScreensaverObservers");
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[PHLocalVideoViewController tearDownScreensaverObservers](self, "tearDownScreensaverObservers");
  -[PHLocalVideoViewController stopPreview](self, "stopPreview");
  -[PHLocalVideoViewController _dissociateVideoLayers](self, "_dissociateVideoLayers");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController dealloc](&v4, "dealloc");
}

- (void)setUpScreensaverObservers
{
  self->_screensaverActive = (unint64_t)+[PBSSystemStatus systemAttentionState]( &OBJC_CLASS___PBSSystemStatus,  "systemAttentionState") > 3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleSystemAttentionStateChangedNotification:" name:@"kPHSystemAttentionStateChanged" object:objc_opt_class(PBSSystemStatus)];

  if (qword_100116890 != -1) {
    dispatch_once(&qword_100116890, &stru_1000F68E8);
  }
}

- (void)tearDownScreensaverObservers
{
  v3 = (void *)objc_opt_class(&OBJC_CLASS___PBSSystemStatus);
  _[v3 removeObserver:self forKeyPath:@"systemAttentionState"];
}

- (BOOL)shouldDisableEdgeClip
{
  return 0;
}

- (BOOL)isUsingIPadExternalCamera
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
  if ([v3 wombatWisdomEnabled])
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 videoDeviceController]);
    if ([v5 currentInputIsExternal])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
      BOOL v7 = [v6 userInterfaceIdiom] == (id)1;
    }

    else
    {
      BOOL v7 = 0LL;
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  if (v7 != -[PHLocalVideoViewController cachedIsUsingIPadExternalCamera](self, "cachedIsUsingIPadExternalCamera"))
  {
    id v8 = sub_100011210();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updated cachedIsUsingIPadExternalCamera to %d",  (uint8_t *)v11,  8u);
    }

    -[PHLocalVideoViewController setCachedIsUsingIPadExternalCamera:](self, "setCachedIsUsingIPadExternalCamera:", v7);
  }

  return v7;
}

- (void)fadeOutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004B10;
  v7[3] = &unk_1000F6930;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  id v8 = v4;
  v5 = objc_retainBlock(v7);
  id v6 = v5;
  if (v3) {
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.400000006);
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)fadeInAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004BD0;
  v7[3] = &unk_1000F6930;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  id v8 = v4;
  v5 = objc_retainBlock(v7);
  id v6 = v5;
  if (v3) {
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.400000006);
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (BOOL)localVideoLayersAreAssociated
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 videoDeviceController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localFrontLayer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
  unsigned __int8 v7 = [v5 isEqual:v6];

  return v7;
}

- (void)associateLocalVideoLayers
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v5 videoDeviceController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
  [v3 setLocalFrontLayer:v4];
}

- (void)_dissociateVideoLayers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 videoDeviceController]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localFrontLayer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));

  if (v5 == v6)
  {
    [v4 setLocalFrontLayer:0];
  }

  else
  {
    id v7 = sub_100011210();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not clearing the local front video layer because this isn't the current displayController's layer",  v9,  2u);
    }
  }
}

- (void)_ensureVideoLayersExist
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (!self->_videoGroupView)
  {
    v12 = -[UIControl initWithFrame:](objc_alloc(&OBJC_CLASS___UIControl), "initWithFrame:", v5, v7, v9, v11);
    videoGroupView = self->_videoGroupView;
    self->_videoGroupView = v12;

    -[UIControl setAutoresizingMask:](self->_videoGroupView, "setAutoresizingMask:", 18LL);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIControl layer](self->_videoGroupView, "layer"));
    [v14 setName:@"PHLocalVideoControllerGroupView"];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
    [v15 addSubview:self->_videoGroupView];
  }

  if (!self->_localVideoView)
  {
    v16 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
    localVideoView = self->_localVideoView;
    self->_localVideoView = v16;

    -[UIView setAutoresizingMask:](self->_localVideoView, "setAutoresizingMask:", 18LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    [v18 setContentsGravity:kCAGravityResizeAspectFill];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    [v19 setMasksToBounds:1];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    [v20 setName:@"PHLocalVideoControllerLocalVideoView"];

    -[UIControl addSubview:](self->_videoGroupView, "addSubview:", self->_localVideoView);
    -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 1LL);
  }

- (void)_setupVideoLayers
{
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController loadView](&v3, "loadView");
  -[PHLocalVideoViewController _setupVideoLayers](self, "_setupVideoLayers");
  -[PHLocalVideoViewController startPreview](self, "startPreview");
  -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PHLocalVideoViewController _updateLocalVideoOrientationAnimated:]( self,  "_updateLocalVideoOrientationAnimated:",  0LL);
  if (-[PHLocalVideoViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PHLocalVideoViewController startPreview](self, "startPreview");
    -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PHLocalVideoViewController _ensureLocalVideoWillBecomeVisible](self, "_ensureLocalVideoWillBecomeVisible");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  [v4 setAlpha:0.0];

  -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 1LL);
  -[PHLocalVideoViewController stopPreview](self, "stopPreview");
  +[NSObject cancelPreviousPerformRequestsWithTarget:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:",  self);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4 = sub_100011210();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PHLocalVideoViewController _applicationDidBecomeActive",  v6,  2u);
  }

  if (-[PHLocalVideoViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PHLocalVideoViewController startPreview](self, "startPreview");
    -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
  }

- (void)_applicationEnteredBackground:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](&OBJC_CLASS___PHPIPController, "defaultPIPController"));
  unsigned __int8 v6 = [v5 isPipped];

  if ((v6 & 1) == 0)
  {
    id v7 = sub_100011210();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      int v10 = 138412290;
      double v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Stopping preview due to application notification %@",  (uint8_t *)&v10,  0xCu);
    }

    -[PHLocalVideoViewController stopPreview](self, "stopPreview");
  }
}

- (BOOL)_isValidFaceTimeOrientation:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

- (void)_adjustForOrientationAnimated:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice", a3));
  id lastKnownOrientation = [v4 orientation];

  if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:]( self,  "_isValidFaceTimeOrientation:",  lastKnownOrientation))
  {
    if (-[PHLocalVideoViewController _isValidFaceTimeOrientation:]( self,  "_isValidFaceTimeOrientation:",  self->_lastKnownOrientation))
    {
      id lastKnownOrientation = (id)self->_lastKnownOrientation;
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
      id lastKnownOrientation = [v6 statusBarOrientation];
    }
  }

  if ([UIApp isStatusBarHidden]
    && !-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    int64_t v7 = +[PHInCallUIUtilities interfaceOrientationForDeviceOrientation:]( &OBJC_CLASS___PHInCallUIUtilities,  "interfaceOrientationForDeviceOrientation:",  lastKnownOrientation);
    [UIApp setStatusBarOrientation:v7];
  }

  self->_id lastKnownOrientation = (int64_t)lastKnownOrientation;
}

- (int)_tuVideoDeviceOrientationForDeviceOrientation:(int64_t)a3
{
  return 3;
}

- (void)_updateLocalVideoOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PHLocalVideoViewController isUsingIPadExternalCamera](self, "isUsingIPadExternalCamera")
    || (objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice")),
        id v6 = [v5 userInterfaceIdiom],
        v5,
        v6 == (id)5))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v13 videoDeviceController]);
    [v7 setCurrentVideoOrientation:2];
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id lastKnownOrientation = (char *)[v8 orientation];

    if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:]( self,  "_isValidFaceTimeOrientation:",  lastKnownOrientation)) {
      id lastKnownOrientation = (char *)self->_lastKnownOrientation;
    }
    if ((unint64_t)(lastKnownOrientation - 1) <= 3)
    {
      uint64_t v10 = -[PHLocalVideoViewController _tuVideoDeviceOrientationForDeviceOrientation:]( self,  "_tuVideoDeviceOrientationForDeviceOrientation:",  lastKnownOrientation);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 videoDeviceController]);
      [v12 setCurrentVideoOrientation:v10];

      -[PHLocalVideoViewController _adjustForOrientationAnimated:](self, "_adjustForOrientationAnimated:", v3);
    }
  }

- (void)_previewMSROptimizationCompensationForOrientation:(int64_t)a3 withTransform:(CGAffineTransform *)a4 withBounds:(CGRect *)a5
{
  id v8 = sub_100011210();
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromCGRect(*a5);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LODWORD(buf.a) = 138412290;
    *(void *)((char *)&buf.a + 4) = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PHLocalVideoViewController _previewMSROptimizationCompensationForTransform bounds %@",  (uint8_t *)&buf,  0xCu);
  }

  a5->origin.x = 0.0;
  a5->origin.y = 0.0;
  a5->size = (CGSize)vextq_s8((int8x16_t)a5->size, (int8x16_t)a5->size, 8uLL);
  CGFloat v12 = dbl_1000C39A0[(unint64_t)(a3 - 3) < 2];
  else {
    double v13 = 1.0;
  }
  else {
    double v14 = -1.0;
  }
  __int128 v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v15;
  *(_OWORD *)&v19.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformRotate(&buf, &v19, v12);
  __int128 v16 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v16;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
  __int128 v17 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v17;
  *(_OWORD *)&v19.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformScale(&buf, &v19, v14, v13);
  __int128 v18 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v18;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
}

- (void)_applyAutoRotationCorrectionForOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  unsigned __int8 v6 = -[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation", a3, a4);
  id v7 = sub_100011210();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      LODWORD(buf.a) = 134217984;
      *(void *)((char *)&buf.a + 4) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = YES)",  (uint8_t *)&buf,  0xCu);
    }

    -[UIControl bounds](self->_videoGroupView, "bounds");
    double v12 = v10;
    double v13 = v11;
    double v47 = v14;
    double v48 = v15;
    double v49 = v10;
    double v50 = v11;
    double v16 = v10 * 0.5;
    double v17 = v11 * 0.5;
    __int128 v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf.c = v18;
    *(_OWORD *)&buf.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    switch(a3)
    {
      case 1LL:
        double v47 = 0.0;
        double v48 = 0.0;
        double v49 = v11;
        double v50 = v10;
        CGAffineTransformMakeRotation(&buf, 1.57079633);
        CGAffineTransform v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
        unsigned int v20 = [v19 previewMSROptimizationEnabled];

        if (v20) {
          -[PHLocalVideoViewController _previewMSROptimizationCompensationForOrientation:withTransform:withBounds:]( self,  "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:",  1LL,  &buf,  &v47);
        }
        break;
      case 2LL:
        CGFloat v23 = 3.14159203;
        goto LABEL_15;
      case 3LL:
        double v47 = 0.0;
        double v48 = 0.0;
        double v49 = v11;
        double v50 = v10;
        CGFloat v23 = -1.57079633;
        goto LABEL_15;
      case 4LL:
        double v47 = 0.0;
        double v48 = 0.0;
        double v49 = v11;
        double v50 = v10;
        CGFloat v23 = 1.57079633;
LABEL_15:
        CGAffineTransformMakeRotation(&buf, v23);
        break;
      default:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
        v22 = v21;
        if (v21) {
          [v21 transform];
        }
        else {
          memset(&v46, 0, sizeof(v46));
        }
        CGAffineTransform buf = v46;

        break;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
    objc_msgSend(v24, "setCenter:", v16, v17);

    if (-[PHLocalVideoViewController isUsingIPadExternalCamera](self, "isUsingIPadExternalCamera"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
      double v26 = 0.0;
      double v27 = 0.0;
      if ([v25 previewMSROptimizationEnabled])
      {
        -[UIControl bounds](self->_videoGroupView, "bounds");
        double v26 = v28;
        double v27 = v29;
        double v13 = v30;
        double v12 = v31;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      objc_msgSend(v32, "setBounds:", v26, v27, v13, v12);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
      unsigned int v34 = [v33 previewMSROptimizationEnabled];
      double v35 = -1.57079633;
      if (v34) {
        double v35 = 3.14159203;
      }
      CGAffineTransformMakeRotation(&v45, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      CGAffineTransform v44 = v45;
      [v36 setTransform:&v44];
    }

    else
    {
      double v37 = v47;
      double v38 = v48;
      double v39 = v49;
      double v40 = v50;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      objc_msgSend(v41, "setBounds:", v37, v38, v39, v40);

      CGAffineTransform v43 = buf;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      CGAffineTransform v42 = v43;
      [v33 setTransform:&v42];
    }
  }

  else
  {
    if (v9)
    {
      LODWORD(buf.a) = 134217984;
      *(void *)((char *)&buf.a + 4) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = NO)",  (uint8_t *)&buf,  0xCu);
    }
  }

- (void)_applyPreviewMSROptimizationTransformsForOrientation:(int64_t)a3
{
  __int128 v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  __int128 v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  __int128 v25 = v5;
  __int128 v26 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[UIControl bounds](self->_videoGroupView, "bounds");
  double v20 = v6;
  double v21 = v7;
  double v22 = v8;
  double v23 = v9;
  -[PHLocalVideoViewController _previewMSROptimizationCompensationForOrientation:withTransform:withBounds:]( self,  "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:",  a3,  &v24,  &v20);
  double v10 = v20;
  double v11 = v21;
  double v12 = v22;
  double v13 = v23;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v14, "setBounds:", v10, v11, v12, v13);

  __int128 v17 = v24;
  __int128 v18 = v25;
  __int128 v19 = v26;
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  [v15 setTransform:v16];
}

- (void)updateViewControllerForOrientation:(int64_t)a3
{
  if (-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    -[PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:]( self,  "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:",  a3,  0LL);
  }

  else
  {
    id v5 = sub_100011210();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PHLocalVideoViewController.updateViewControllerForOrientation: Ignoring since supportsAutoRotation = NO",  v9,  2u);
    }

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
    unsigned int v8 = [v7 previewMSROptimizationEnabled];

    if (v8) {
      -[PHLocalVideoViewController _applyPreviewMSROptimizationTransformsForOrientation:]( self,  "_applyPreviewMSROptimizationTransformsForOrientation:",  a3);
    }
  }

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if (-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005CAC;
    v10[3] = &unk_1000F6958;
    v10[4] = self;
    id v11 = v7;
    [v11 animateAlongsideTransition:v10 completion:0];
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
    [v8 previewMSROptimizationEnabled];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PHLocalVideoViewController;
  -[PHLocalVideoViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)_scene
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 windows]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_firstObjectPassingTest:", &stru_1000F6998));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowScene]);

  return v5;
}

- (void)startPreview
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController _scene](self, "_scene"));
  id v4 = v3;
  if (!v3 || [v3 activationState] && objc_msgSend(v4, "activationState") != (id)1)
  {
    id v10 = sub_100011210();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)CGAffineTransform buf = 0;
    id v11 = "PHLocalVideoViewController rejected a start preview request because the scene is not in the foreground";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_41;
  }

  if (!-[PHLocalVideoViewController isReadyForPreview](self, "isReadyForPreview"))
  {
    id v12 = sub_100011210();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)CGAffineTransform buf = 0;
    id v11 = "PHLocalVideoViewController rejected a start preview request because the client has not indicated it is ready";
    goto LABEL_15;
  }

  if (!-[PHLocalVideoViewController localVideoLayersAreAssociated](self, "localVideoLayersAreAssociated")) {
    -[PHLocalVideoViewController associateLocalVideoLayers](self, "associateLocalVideoLayers");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 videoDeviceController]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentInputDevice](v6, "currentInputDevice"));
  if (-[PHLocalVideoViewController shouldDeferStartCameraAction](self, "shouldDeferStartCameraAction"))
  {
    id v8 = sub_100011210();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Deferring start camera action until systemPreferredCamera is initialized",  buf,  2u);
    }

    -[PHLocalVideoViewController setDidDeferStartCameraAction:](self, "setDidDeferStartCameraAction:", 1LL);
  }

  else
  {
    if (!v7
      || !-[PHLocalVideoViewController deviceIsFrontFacingOrExternal:](self, "deviceIsFrontFacingOrExternal:", v7))
    {
      id v13 = sub_100011210();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Resetting camera on TUVideoDeviceController to be front-facing or external",  buf,  2u);
      }

      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s inputDevices](v6, "inputDevices", 0LL));
      id v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v29;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
            if (-[PHLocalVideoViewController deviceIsFrontFacingOrExternal:]( self,  "deviceIsFrontFacingOrExternal:",  v20))
            {
              -[os_log_s setCurrentInputDevice:](v6, "setCurrentInputDevice:", v20);
              goto LABEL_30;
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

- (BOOL)deviceIsFrontFacingOrExternal:(id)a3
{
  id v3 = a3;
  if ([v3 position] == (id)2)
  {
    BOOL v4 = 1;
  }

  else
  {
    AVCaptureDeviceType v5 = (AVCaptureDeviceType)objc_claimAutoreleasedReturnValue([v3 deviceType]);
    BOOL v4 = v5 == AVCaptureDeviceTypeExternal;
  }

  return v4;
}

- (BOOL)shouldDeferStartCameraAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
  if ([v2 wombatWisdomEnabled])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    if ([v3 userInterfaceIdiom] == (id)1)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice systemPreferredCamera](&OBJC_CLASS___AVCaptureDevice, "systemPreferredCamera"));
      BOOL v5 = v4 == 0LL;
    }

    else
    {
      BOOL v5 = 0;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)stopPreview
{
  unsigned int v2 = -[PHLocalVideoViewController localVideoLayersAreAssociated](self, "localVideoLayersAreAssociated");
  id v3 = sub_100011210();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "VideoDeviceController stopPreview: %d",  (uint8_t *)v7,  8u);
  }

  if (v2)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 videoDeviceController]);
    [v6 stopPreview];
  }

- (void)_fadeInLocalVideo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  [v3 alpha];
  double v5 = v4;

  if (v5 != 1.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_100006410;
    v7[3] = &unk_1000F6930;
    void v7[4] = self;
    double v6 = objc_retainBlock(v7);
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, 0.300000012);
  }

- (void)_ensureLocalVideoWillBecomeVisible
{
  id v3 = sub_100011210();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[PHLocalVideoViewController _ensureLocalVideoWillBecomeVisible]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v9, 0x16u);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  [v5 setHidden:0];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  [v6 alpha];
  double v8 = v7;

  if (v8 == 0.0) {
    -[PHLocalVideoViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_autoFadeInLocalVideo",  0LL,  0.5);
  }
  else {
    self->_waitingForLocalVideoFirstFrame = 0;
  }
}

- (void)_avFirstPreviewFrameArrived:(id)a3
{
  if (-[PHLocalVideoViewController waitingForLocalVideoFirstFrame](self, "waitingForLocalVideoFirstFrame", a3))
  {
    id v4 = sub_100011210();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "First frame arrived: fading in local video",  v6,  2u);
    }

    -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 0LL);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_autoFadeInLocalVideo",  0LL);
    -[PHLocalVideoViewController _fadeInLocalVideo](self, "_fadeInLocalVideo");
  }

- (void)_handleLocalCameraErrorNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TUVideoDeviceControllerDeviceDidReceiveErrorErrorKey]);

  if (v5 && [v5 code] == (id)32023)
  {
    id v6 = sub_100011210();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Local camera was pre-empted from FaceTime local preview",  v15,  2u);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    if (!v8)
    {
      int v9 = objc_alloc(&OBJC_CLASS___PHLocalVideoDisabledOverlayView);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      [v10 bounds];
      __int16 v11 = -[PHLocalVideoDisabledOverlayView initWithFrame:](v9, "initWithFrame:");
      -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", v11);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
      [v12 setAutoresizingMask:18];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
      [v13 addSubview:v14];
    }
  }
}

- (void)_handleLocalCameraAvailableNotification:(id)a3
{
  id v4 = sub_100011210();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Local camera pre-emption ended and the camera became available",  v8,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    [v7 removeFromSuperview];

    -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", 0LL);
  }

- (void)_handleVideoPreviewDidStartNotification:(id)a3
{
  id v4 = sub_100011210();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Local preview did start notification, we'll remove the disabled overlay view if it exists",  v8,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    [v7 removeFromSuperview];

    -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", 0LL);
  }

- (void)_handleSystemPreferredCameraChangedNotification:(id)a3
{
  id v4 = sub_100011210();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System preferred camera changed", buf, 2u);
  }

  if (-[PHLocalVideoViewController didDeferStartCameraAction](self, "didDeferStartCameraAction"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice systemPreferredCamera](&OBJC_CLASS___AVCaptureDevice, "systemPreferredCamera"));

    id v7 = sub_100011210();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Starting camera that was deferred due to systemPreferredCamera initialization",  v12,  2u);
      }

      -[PHLocalVideoViewController setDidDeferStartCameraAction:](self, "setDidDeferStartCameraAction:", 0LL);
      -[PHLocalVideoViewController startPreview](self, "startPreview");
    }

    else
    {
      if (v9)
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring change to systemPreferredCamera because it's nil",  v13,  2u);
      }
    }
  }

  else
  {
    id v10 = sub_100011210();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Ignoring change to systemPreferredCamera because there's no pending start camera action",  v14,  2u);
    }
  }

- (void)_handleSystemAttentionStateChangedNotification:(id)a3
{
  unsigned int v4 = -[PHLocalVideoViewController screensaverActive](self, "screensaverActive", a3);
  -[PHLocalVideoViewController setScreensaverActive:]( self,  "setScreensaverActive:",  (unint64_t)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") > 3);
  if (v4 != -[PHLocalVideoViewController screensaverActive](self, "screensaverActive")) {
    -[PHLocalVideoViewController _handleScreenSaverActiveDidChange](self, "_handleScreenSaverActiveDidChange");
  }
}

- (void)_handleScreenSaverActiveDidChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowScene]);
  if ([v5 activationState])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windowScene]);
    BOOL v9 = [v8 activationState] == (id)1;
  }

  else
  {
    BOOL v9 = 1;
  }

  if (-[PHLocalVideoViewController screensaverActive](self, "screensaverActive"))
  {
    id v10 = sub_100011210();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Screensaver became active, calling _applicationEnteredBackground",  buf,  2u);
    }

    -[PHLocalVideoViewController _applicationEnteredBackground:](self, "_applicationEnteredBackground:", 0LL);
  }

  else if (v9)
  {
    id v12 = sub_100011210();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Screensaver became inactive, calling _applicationDidBecomeActive",  v14,  2u);
    }

    -[PHLocalVideoViewController _applicationDidBecomeActive:](self, "_applicationDidBecomeActive:", 0LL);
  }

- (void)_updateLocalPreviewStatusBarGradient
{
  unsigned int v3 = -[PHLocalVideoViewController showsLocalPreviewStatusBarGradient](self, "showsLocalPreviewStatusBarGradient");
  localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
  if (v3)
  {
    if (!localVideoStatusBarGradientView)
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      [v5 bounds];
      double v7 = v6;

      double v8 = -[PHStatusBarGradientView initWithFrame:]( objc_alloc(&OBJC_CLASS___PHStatusBarGradientView),  "initWithFrame:",  0.0,  0.0,  v7,  40.0);
      BOOL v9 = self->_localVideoStatusBarGradientView;
      self->_localVideoStatusBarGradientView = &v8->super;

      -[UIView setAutoresizingMask:](self->_localVideoStatusBarGradientView, "setAutoresizingMask:", 34LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      [v10 addSubview:self->_localVideoStatusBarGradientView];

      localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
    }

    double v11 = 1.0;
  }

  else
  {
    double v11 = 0.0;
  }

  -[UIView setAlpha:](localVideoStatusBarGradientView, "setAlpha:", v11);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30LL;
}

- (BOOL)isReadyForPreview
{
  return self->_readyForPreview;
}

- (void)setReadyForPreview:(BOOL)a3
{
  self->_readyForPreview = a3;
}

- (UIControl)videoGroupView
{
  return self->_videoGroupView;
}

- (void)setVideoGroupView:(id)a3
{
}

- (UIView)localVideoView
{
  return self->_localVideoView;
}

- (void)setLocalVideoView:(id)a3
{
}

- (UIView)localVideoStatusBarGradientView
{
  return self->_localVideoStatusBarGradientView;
}

- (void)setLocalVideoStatusBarGradientView:(id)a3
{
}

- (PHLocalVideoDisabledOverlayView)disabledOverlayView
{
  return self->_disabledOverlayView;
}

- (void)setDisabledOverlayView:(id)a3
{
}

- (BOOL)supportsAutoRotation
{
  return self->_supportsAutoRotation;
}

- (void)setSupportsAutoRotation:(BOOL)a3
{
  self->_supportsAutoRotation = a3;
}

- (BOOL)showsLocalPreviewStatusBarGradient
{
  return self->_showsLocalPreviewStatusBarGradient;
}

- (void)setShowsLocalPreviewStatusBarGradient:(BOOL)a3
{
  self->_showsLocalPreviewStatusBarGradient = a3;
}

- (BOOL)waitingForLocalVideoFirstFrame
{
  return self->_waitingForLocalVideoFirstFrame;
}

- (void)setWaitingForLocalVideoFirstFrame:(BOOL)a3
{
  self->_waitingForLocalVideoFirstFrame = a3;
}

- (int64_t)lastKnownOrientation
{
  return self->_lastKnownOrientation;
}

- (void)setLastKnownOrientation:(int64_t)a3
{
  self->_id lastKnownOrientation = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)didDeferStartCameraAction
{
  return self->_didDeferStartCameraAction;
}

- (void)setDidDeferStartCameraAction:(BOOL)a3
{
  self->_didDeferStartCameraAction = a3;
}

- (BOOL)screensaverActive
{
  return self->_screensaverActive;
}

- (void)setScreensaverActive:(BOOL)a3
{
  self->_screensaverActive = a3;
}

- (BOOL)cachedIsUsingIPadExternalCamera
{
  return self->_cachedIsUsingIPadExternalCamera;
}

- (void)setCachedIsUsingIPadExternalCamera:(BOOL)a3
{
  self->_cachedIsUsingIPadExternalCamera = a3;
}

- (void).cxx_destruct
{
}

@end