@interface TVSSVideoEffectsDefaultCoordinator
- (AVCaptureDevice)continuityCaptureDevice;
- (BOOL)enableMode:(int64_t)a3 forBundleID:(id)a4;
- (BOOL)isDockKitEnabledForBundleID:(id)a3;
- (BOOL)isEffectEnabled:(id)a3 forBundleID:(id)a4;
- (BOOL)isEffectSupported:(id)a3 forBundleID:(id)a4;
- (BOOL)isEffectUnavailable:(id)a3 forBundleID:(id)a4;
- (BOOL)isManualFramingSupported;
- (BOOL)isModeEnabled:(int64_t)a3 forBundleID:(id)a4;
- (BOOL)isModeSupported:(int64_t)a3 forBundleID:(id)a4;
- (BOOL)isModeUnavailable:(int64_t)a3 forBundleID:(id)a4;
- (BOOL)isUsingWideForFraming;
- (BOOL)supportsUltraWideCamera;
- (BOOL)supportsWideCamera;
- (BOOL)toggleEnabledForEffect:(id)a3 enable:(BOOL)a4 forBundleID:(id)a5;
- (CMCaptureFrameReceiver)frameReceiver;
- (TVSSVideoEffectsDefaultCoordinator)init;
- (double)defaultUltraWideZoomFactor;
- (double)defaultWideZoomFactor;
- (double)maxAvailableVideoZoomFactor;
- (double)minAvailableVideoZoomFactor;
- (double)zoomFactor;
- (id)onBatteryStateChange;
- (id)onLensChange;
- (id)onMicModeEnabledChange;
- (id)onMicModeSupportChange;
- (id)onSampleBufferChange;
- (id)onShouldTransformChange;
- (id)onVideoEffectsControlModeChange;
- (id)onVideoEffectsEnabledChange;
- (id)onVideoEffectsSupportChange;
- (id)onZoomFactorChange;
- (id)videoPreviewStreamAssertion;
- (int64_t)batteryState;
- (int64_t)effectControlMode:(id)a3 forBundleID:(id)a4;
- (unint64_t)unavailableReasonsForEffect:(id)a3 bundleID:(id)a4;
- (void)dealloc;
- (void)handleAVNotifcation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBatteryState:(int64_t)a3;
- (void)setContinuityCaptureDevice:(id)a3;
- (void)setFrameReceiver:(id)a3;
- (void)setOnBatteryStateChange:(id)a3;
- (void)setOnLensChange:(id)a3;
- (void)setOnMicModeEnabledChange:(id)a3;
- (void)setOnMicModeSupportChange:(id)a3;
- (void)setOnSampleBufferChange:(id)a3;
- (void)setOnShouldTransformChange:(id)a3;
- (void)setOnVideoEffectsControlModeChange:(id)a3;
- (void)setOnVideoEffectsEnabledChange:(id)a3;
- (void)setOnVideoEffectsSupportChange:(id)a3;
- (void)setOnZoomFactorChange:(id)a3;
- (void)setUsingWideForFraming:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)triggerOneShotFraming;
- (void)updateFrameReciever;
@end

@implementation TVSSVideoEffectsDefaultCoordinator

- (TVSSVideoEffectsDefaultCoordinator)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSVideoEffectsDefaultCoordinator;
  v7 = -[TVSSVideoEffectsDefaultCoordinator init](&v5, "init");
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterManualFramingOneShotFramingDidCompleteNotification);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterManualFramingResetFramingDidCompleteNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterManualFramingVideoZoomFactorDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification,  0LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v7,  "handleAVNotifcation:",  AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification,  0LL);
    objc_storeStrong((id *)&v4, 0LL);
  }

  v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (void)dealloc
{
  objc_super v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSVideoEffectsDefaultCoordinator;
  -[TVSSVideoEffectsDefaultCoordinator dealloc](&v3, "dealloc");
}

- (id)videoPreviewStreamAssertion
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = VideoMicEffectsCoordinatorLog();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v17;
    sub_100010524(v16);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Started listening for received frames", v16, 2u);
  }

  objc_storeStrong(location, 0LL);
  +[CMCaptureFrameReceiver addObserver:forKeyPath:options:context:]( &OBJC_CLASS___CMCaptureFrameReceiver,  "addObserver:forKeyPath:options:context:",  v19,  @"availableFrameSenderEndpointsByPID",  5LL,  0LL);
  -[TVSSVideoEffectsDefaultCoordinator updateFrameReciever](v19, "updateFrameReciever");
  objc_initWeak(&from, v19);
  SEL v6 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
  aClass = (objc_class *)objc_opt_class(v19);
  objc_super v3 = NSStringFromClass(aClass);
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_1000C4390;
  v13 = &unk_1001BA000;
  objc_copyWeak(v14, &from);
  SEL v4 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( v6,  "initWithIdentifier:forReason:invalidationBlock:",  v3,  @"Video preview",  &v9);
  objc_destroyWeak(v14);

  objc_destroyWeak(&from);
  return v4;
}

- (void)updateFrameReciever
{
  v37 = self;
  v36[1] = (id)a2;
  v36[0] =  +[CMCaptureFrameReceiver availableFrameSenderEndpointsByPID]( &OBJC_CLASS___CMCaptureFrameReceiver,  "availableFrameSenderEndpointsByPID");
  id location = VideoMicEffectsCoordinatorLog();
  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D28C((uint64_t)v41, (uint64_t)v36[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v34,  "CMCaptureFrameReceiver: available endpoints: %@",  v41,  0xCu);
  }

  objc_storeStrong(&location, 0LL);
  id v12 = [v36[0] allKeys];
  id v33 = [v12 firstObject];

  if ((unint64_t)[v36[0] count] > 1)
  {
    id v32 = VideoMicEffectsCoordinatorLog();
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      sub_10000D28C((uint64_t)v40, (uint64_t)v33);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  v31,  "Found multiple PIDs using the camera, that is unexpected on iOS, picking a single random PID: %@",  v40,  0xCu);
    }

    objc_storeStrong(&v32, 0LL);
  }

  id v30 = [v36[0] objectForKeyedSubscript:v33];
  if ((unint64_t)[v30 count] > 1)
  {
    id v29 = VideoMicEffectsCoordinatorLog();
    os_log_type_t v28 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v30 firstObject];
      id v27 = v11;
      sub_10000D28C((uint64_t)v39, (uint64_t)v27);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  v28,  "Found multiple sender endpoints using the camera, that is unexpected on iOS, picking the first one: %@",  v39,  0xCu);

      objc_storeStrong(&v27, 0LL);
    }

    objc_storeStrong(&v29, 0LL);
  }

  id v26 = [v30 firstObject];
  char v25 = 1;
  id v2 = -[TVSSVideoEffectsDefaultCoordinator onShouldTransformChange](v37, "onShouldTransformChange");
  BOOL v10 = v2 == 0LL;

  if (!v10)
  {
    v9 = (void (**)(id, void)) -[TVSSVideoEffectsDefaultCoordinator onShouldTransformChange]( v37,  "onShouldTransformChange");
    v9[2](v9, v25 & 1);
  }

  if (v26)
  {
    id v24 = VideoMicEffectsCoordinatorLog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v38, (uint64_t)v26);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  v23,  "CMCaptureFrameReceiver: using endpoint: %@",  v38,  0xCu);
    }

    objc_storeStrong(&v24, 0LL);
    objc_initWeak(&from, v37);
    v8 = objc_alloc(&OBJC_CLASS___CMCaptureFrameReceiver);
    id v7 = v26;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_1000C4B80;
    v20 = &unk_1001B79B8;
    objc_copyWeak(&v21, &from);
    SEL v6 = -[CMCaptureFrameReceiver initWithFrameSenderServerEndpoint:frameReceiverHandler:]( v8,  "initWithFrameSenderServerEndpoint:frameReceiverHandler:",  v7,  &v16);
    frameReceiver = v37->_frameReceiver;
    v37->_frameReceiver = v6;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicEffectsCoordinatorLog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      SEL v4 = oslog;
      os_log_type_t v5 = v14;
      sub_100010524(v13);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "CMCaptureFrameReceiver: no active video frames to recieve",  v13,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    objc_storeStrong((id *)&v37->_frameReceiver, 0LL);
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(v36, 0LL);
}

- (BOOL)isManualFramingSupported
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (v8[0])
  {
    char v9 = [v8[0] isManualFramingSupported] & 1;
  }

  else
  {
    id location = VideoMicBackingStoreLog();
    char v6 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v6;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "isManualFramingSupported: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong(&location, 0LL);
    char v9 = 0;
  }

  objc_storeStrong(v8, 0LL);
  return v9 & 1;
}

- (void)triggerOneShotFraming
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (v7[0])
  {
    AVControlCenterPerformOneShotFraming(v7[0]);
  }

  else
  {
    id location = VideoMicBackingStoreLog();
    char v5 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v5;
      sub_100010524(v4);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "triggerOneShotFraming: Could not get a valid AVCaptureDevice for manual framing",  v4,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

  objc_storeStrong(v7, 0LL);
}

- (double)defaultWideZoomFactor
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    double ManualFramingDefaultZoomFactorForDevice = AVControlCenterGetManualFramingDefaultZoomFactorForDevice( location[0],  1LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "defaultWideZoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    double ManualFramingDefaultZoomFactorForDevice = 1.0;
  }

  objc_storeStrong(location, 0LL);
  return ManualFramingDefaultZoomFactorForDevice;
}

- (double)defaultUltraWideZoomFactor
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    double ManualFramingDefaultZoomFactorForDevice = AVControlCenterGetManualFramingDefaultZoomFactorForDevice( location[0],  2LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "defaultUltraWideZoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    double ManualFramingDefaultZoomFactorForDevice = 0.5;
  }

  objc_storeStrong(location, 0LL);
  return ManualFramingDefaultZoomFactorForDevice;
}

- (double)maxAvailableVideoZoomFactor
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    double v9 = AVControlCenterManualFramingMaxAvailableVideoZoomFactor(location[0]);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "maxAvailableVideoZoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    double v9 = 0.0;
  }

  objc_storeStrong(location, 0LL);
  return v9;
}

- (double)minAvailableVideoZoomFactor
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    double v9 = AVControlCenterManualFramingMinAvailableVideoZoomFactor(location[0]);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "minAvailableVideoZoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    double v9 = 0.0;
  }

  objc_storeStrong(location, 0LL);
  return v9;
}

- (double)zoomFactor
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    double VideoZoomFactor = AVControlCenterManualFramingGetVideoZoomFactor(location[0]);
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "zoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    double VideoZoomFactor = 0.0;
  }

  objc_storeStrong(location, 0LL);
  return VideoZoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  v43 = self;
  SEL v42 = a2;
  *(double *)&uint64_t v41 = a3;
  id v40 = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (v40)
  {
    id v3 = -[TVSSVideoEffectsDefaultCoordinator zoomFactor](v43, "zoomFactor");
    unint64_t v35 = v4.n128_u64[0];
    if ((BSFloatEqualToFloat(v3, v4, *(double *)&v41) & 1) == 0)
    {
      char v34 = -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v43, "isUsingWideForFraming");
      if (v34) {
        id v5 = -[TVSSVideoEffectsDefaultCoordinator defaultWideZoomFactor](v43, "defaultWideZoomFactor");
      }
      else {
        id v5 = -[TVSSVideoEffectsDefaultCoordinator defaultUltraWideZoomFactor](v43, "defaultUltraWideZoomFactor");
      }
      double v33 = v6.n128_f64[0];
      v6.n128_u64[0] = v41;
      if ((BSFloatEqualToFloat(v5, v6, v33) & 1) != 0)
      {
        id v32 = VideoMicBackingStoreLog();
        os_log_type_t v31 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
        {
          sub_100074010((uint64_t)v45, v41, v34 & 1);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  v31,  "Resetting zoom factor to: %f on wide: %{BOOL}i",  v45,  0x12u);
        }

        objc_storeStrong(&v32, 0LL);
        AVControlCenterResetFraming(v40);
      }

      else
      {
        double v30 = AVControlCenterManualFramingMaxAvailableVideoZoomFactor(v40);
        double v29 = AVControlCenterManualFramingMinAvailableVideoZoomFactor(v40);
        double v28 = v29;
        uint64_t v26 = v41;
        double v25 = v30;
        else {
          v15 = (os_log_s *)v26;
        }
        oslog[2] = v15;
        id v27 = v15;
        else {
          os_log_type_t v14 = v27;
        }
        oslog[1] = v14;
        uint64_t v41 = (uint64_t)v14;
        oslog[0] = (os_log_t)VideoMicBackingStoreLog();
        os_log_type_t v23 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
        {
          sub_100074010((uint64_t)v44, v41, v34 & 1);
          _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  v23,  "Setting zoom factor to: %f on wide: %{BOOL}i",  v44,  0x12u);
        }

        objc_storeStrong((id *)oslog, 0LL);
        AVControlCenterManualFramingSetVideoZoomFactor(v40, *(double *)&v41);
      }

      id v7 = -[TVSSVideoEffectsDefaultCoordinator zoomFactor](v43, "zoomFactor");
      double v22 = v8;
      v9.n128_u64[0] = v35;
      char v13 = 0;
      if ((BSFloatEqualToFloat(v7, v9, v22) & 1) == 0) {
        char v13 = BSFloatApproximatelyEqualToFloat(*(double *)&v41, v22, 0.001);
      }
      char v21 = v13 & 1;
      if ((v13 & 1) != 0)
      {
        os_log_t v20 = (os_log_t)VideoMicBackingStoreLog();
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v11 = v20;
          os_log_type_t v12 = v19;
          sub_100010524(v18);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Call on zoom factor change", v18, 2u);
        }

        objc_storeStrong((id *)&v20, 0LL);
        BOOL v10 = (void (**)(double)) -[TVSSVideoEffectsDefaultCoordinator onZoomFactorChange]( v43,  "onZoomFactorChange");
        v10[2](*(double *)&v41);
      }
    }

    int v36 = 0;
  }

  else
  {
    id location = VideoMicBackingStoreLog();
    char v38 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v38;
      sub_100010524(v37);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "setZoomFactor: Could not get a valid AVCaptureDevice for manual framing",  v37,  2u);
    }

    objc_storeStrong(&location, 0LL);
    int v36 = 1;
  }

  objc_storeStrong(&v40, 0LL);
}

- (int64_t)batteryState
{
  id v3 = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  id v4 = -[AVCaptureDevice batteryState](v3, "batteryState");

  return (int64_t)v4;
}

- (void)setBatteryState:(int64_t)a3
{
  id v3 = (void (**)(id, int64_t)) -[TVSSVideoEffectsDefaultCoordinator onBatteryStateChange]( self,  "onBatteryStateChange");
  v3[2](v3, a3);
}

- (BOOL)supportsWideCamera
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    char v9 = AVControlCenterDeviceHasWideCamera(location[0]) & 1;
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "supportsWideCamera: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v9 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v9 & 1;
}

- (BOOL)supportsUltraWideCamera
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (location[0])
  {
    char v9 = AVControlCenterDeviceHasUltraWideCamera(location[0]) & 1;
  }

  else
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100010524(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "supportsUltraWideCamera: Could not get a valid AVCaptureDevice for manual framing",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v9 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v9 & 1;
}

- (BOOL)isUsingWideForFraming
{
  BOOL v10 = self;
  v9[1] = (id)a2;
  v9[0] = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (v9[0])
  {
    BOOL v5 = AVControlCenterGetManualFramingDeviceType(v9[0]) == 1;
    if (v5
      && -[TVSSVideoEffectsDefaultCoordinator supportsUltraWideCamera](v10, "supportsUltraWideCamera")
      && !-[TVSSVideoEffectsDefaultCoordinator supportsWideCamera](v10, "supportsWideCamera"))
    {
      BOOL v5 = 0;
    }

    BOOL v11 = v5;
  }

  else
  {
    id location = VideoMicBackingStoreLog();
    char v7 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v7;
      sub_100010524(v6);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "isUsingWideForFraming: Could not get a valid AVCaptureDevice for manual framing",  v6,  2u);
    }

    objc_storeStrong(&location, 0LL);
    BOOL v11 = 0;
  }

  objc_storeStrong(v9, 0LL);
  return v11;
}

- (void)setUsingWideForFraming:(BOOL)a3
{
  int v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v15 = -[TVSSVideoEffectsDefaultCoordinator continuityCaptureDevice](self, "continuityCaptureDevice");
  if (v15)
  {
    char v10 = -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v18, "isUsingWideForFraming");
    if (v10 != v16)
    {
      id v9 = VideoMicBackingStoreLog();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        sub_10003EC58((uint64_t)v19, v16);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "switching camera lense to use wide: %{BOOL}i",  v19,  8u);
      }

      objc_storeStrong(&v9, 0LL);
      uint64_t v3 = 2LL;
      if (v16) {
        uint64_t v3 = 1LL;
      }
      AVControlCenterSetManualFramingDeviceType(v3, v15);
      char v8 = -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v18, "isUsingWideForFraming");
      BOOL v5 = 0;
      if ((v10 & 1) != (v8 & 1)) {
        BOOL v5 = v16 == (v8 & 1);
      }
      if (v5)
      {
        os_log_type_t v4 = (void (**)(id, void))-[TVSSVideoEffectsDefaultCoordinator onLensChange](v18, "onLensChange");
        ((void (**)(id, BOOL))v4)[2](v4, v16);
      }
    }

    int v11 = 0;
  }

  else
  {
    id location = VideoMicBackingStoreLog();
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v13;
      sub_100010524(v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "setUsingWideForFraming: Could not get a valid AVCaptureDevice for manual framing",  v12,  2u);
    }

    objc_storeStrong(&location, 0LL);
    int v11 = 1;
  }

  objc_storeStrong(&v15, 0LL);
}

- (BOOL)isDockKitEnabledForBundleID:(id)a3
{
  __n128 v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v4 = (-[TVSSVideoEffectsDefaultCoordinator unavailableReasonsForEffect:bundleID:]( v6,  "unavailableReasonsForEffect:bundleID:",  AVControlCenterVideoEffectCenterStage,  location[0]) & 0x80) == 128;
  objc_storeStrong(location, 0LL);
  return v4;
}

- (BOOL)isEffectSupported:(id)a3 forBundleID:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if (v7) {
    int v5 = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID(location[0], v7) & 1;
  }
  else {
    int v5 = 0;
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v5 != 0;
}

- (BOOL)isEffectEnabled:(id)a3 forBundleID:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if (v7) {
    int v5 = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID(location[0], v7) & 1;
  }
  else {
    int v5 = 0;
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v5 != 0;
}

- (BOOL)isEffectUnavailable:(id)a3 forBundleID:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  BOOL v6 = -[TVSSVideoEffectsDefaultCoordinator unavailableReasonsForEffect:bundleID:]( v9,  "unavailableReasonsForEffect:bundleID:",  location[0],  v7) != 0;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (unint64_t)unavailableReasonsForEffect:(id)a3 bundleID:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if (v7) {
    unint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons(location[0], v7);
  }
  else {
    unint64_t UnavailableReasons = 0LL;
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return UnavailableReasons;
}

- (int64_t)effectControlMode:(id)a3 forBundleID:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if (v7) {
    int64_t EffectControlModeForBundleID = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID(location[0], v7);
  }
  else {
    int64_t EffectControlModeForBundleID = 0LL;
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return EffectControlModeForBundleID;
}

- (BOOL)toggleEnabledForEffect:(id)a3 enable:(BOOL)a4 forBundleID:(id)a5
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  char v9 = AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID(location[0], v11, v10) & 1;
  if ((v9 & 1) != 0)
  {
    BOOL v6 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsEnabledChange]( v13,  "onVideoEffectsEnabledChange");
    v6[2](v6, v10);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v9 & 1;
}

- (BOOL)isModeSupported:(int64_t)a3 forBundleID:(id)a4
{
  char v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  char v8 = 0;
  char v6 = 0;
  if (location)
  {
    id v9 = (id)AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID(location);
    char v8 = 1;
    id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11);
    char v6 = 1;
    unsigned int v5 = objc_msgSend(v9, "containsObject:") & 1;
  }

  else
  {
    unsigned int v5 = 0;
  }

  BOOL v14 = v5 != 0;
  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  objc_storeStrong(&location, 0LL);
  }
  return v14;
}

- (BOOL)isModeEnabled:(int64_t)a3 forBundleID:(id)a4
{
  id v10 = self;
  SEL v9 = a2;
  int64_t v8 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (location)
  {
    uint64_t ActiveMicrophoneModeForBundleID = AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID(location);
    BOOL v6 = ActiveMicrophoneModeForBundleID == v8;
  }

  else
  {
    BOOL v6 = 0;
  }

  objc_storeStrong(&location, 0LL);
  return v6;
}

- (BOOL)isModeUnavailable:(int64_t)a3 forBundleID:(id)a4
{
  id location[3] = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  objc_storeStrong(location, 0LL);
  return 0;
}

- (BOOL)enableMode:(int64_t)a3 forBundleID:(id)a4
{
  id v10 = self;
  SEL v9 = a2;
  int64_t v8 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (location) {
    int v6 = AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID(v8, location) & 1;
  }
  else {
    int v6 = 0;
  }
  if (v6)
  {
    unsigned int v5 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onMicModeEnabledChange]( v10,  "onMicModeEnabledChange");
    v5[2](v5, location);
  }

  objc_storeStrong(&location, 0LL);
  return v6 != 0;
}

- (void)handleAVNotifcation:(id)a3
{
  v71 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v40 = [location[0] userInfo];
  id v69 = [v40 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  id v68 = VideoMicBackingStoreLog();
  os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v68;
    os_log_type_t type = v67;
    id v39 = [location[0] name];
    id v35 = v39;
    id v66 = v35;
    id v38 = [location[0] userInfo];
    id v65 = v38;
    sub_10002F860((uint64_t)v75, (uint64_t)v35, (uint64_t)v65);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "handleAVNotifcation with name: %{public}@, userInfo=%{public}@",  v75,  0x16u);

    objc_storeStrong(&v65, 0LL);
    objc_storeStrong(&v66, 0LL);
  }

  objc_storeStrong(&v68, 0LL);
  id v34 = [location[0] name];
  char v63 = 0;
  char v61 = 0;
  if ([v34 isEqual:AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification] & 1) != 0 || (v64 = objc_msgSend(location[0], "name"),  v63 = 1,  BOOL v33 = 0,  (objc_msgSend( v64,  "isEqual:",  AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification)))
  {
    id v62 = -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsSupportChange](v71, "onVideoEffectsSupportChange");
    char v61 = 1;
    BOOL v33 = v62 != 0LL;
  }

  if ((v61 & 1) != 0) {

  }
  if ((v63 & 1) != 0) {
  if (v33)
  }
  {
    id v31 = [location[0] userInfo];
    id v30 = [v31 objectForKey:AVControlCenterModulesNotificationCenterStageUnavailableReasonsKey];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v32 = (os_log_s *)sub_1000C7360(v30, v3);

    v59[1] = v32;
    id v60 = v32;
    if (v32 && [v60 unsignedIntegerValue] == (id)128)
    {
      v59[0] = (os_log_t)VideoMicBackingStoreLog();
      os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v59[0], OS_LOG_TYPE_DEFAULT))
      {
        double v28 = v59[0];
        os_log_type_t v29 = v58;
        sub_100010524(v57);
        _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "Center Stage is disabled because DockKit is on and tracking",  v57,  2u);
      }

      objc_storeStrong((id *)v59, 0LL);
    }

    id v27 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsSupportChange]( v71,  "onVideoEffectsSupportChange");
    v27[2](v27, v69);

    objc_storeStrong(&v60, 0LL);
  }

  else
  {
    id v25 = [location[0] name];
    char v55 = 0;
    BOOL v26 = 0;
    if ([v25 isEqual:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification])
    {
      id v56 =  -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsControlModeChange]( v71,  "onVideoEffectsControlModeChange");
      char v55 = 1;
      BOOL v26 = v56 != 0LL;
    }

    if ((v55 & 1) != 0) {

    }
    if (v26)
    {
      id v24 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsControlModeChange]( v71,  "onVideoEffectsControlModeChange");
      v24[2](v24, v69);
    }

    else
    {
      id v22 = [location[0] name];
      char v53 = 0;
      BOOL v23 = 0;
      if ([v22 isEqual:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification])
      {
        id v54 = -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsEnabledChange](v71, "onVideoEffectsEnabledChange");
        char v53 = 1;
        BOOL v23 = v54 != 0LL;
      }

      if ((v53 & 1) != 0) {

      }
      if (v23)
      {
        char v21 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onVideoEffectsEnabledChange]( v71,  "onVideoEffectsEnabledChange");
        v21[2](v21, v69);
      }

      else
      {
        id v19 = [location[0] name];
        char v51 = 0;
        BOOL v20 = 0;
        if ([v19 isEqual:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification])
        {
          id v52 = -[TVSSVideoEffectsDefaultCoordinator onMicModeSupportChange](v71, "onMicModeSupportChange");
          char v51 = 1;
          BOOL v20 = v52 != 0LL;
        }

        if ((v51 & 1) != 0) {

        }
        if (v20)
        {
          int v18 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onMicModeSupportChange]( v71,  "onMicModeSupportChange");
          v18[2](v18, v69);
        }

        else
        {
          id v16 = [location[0] name];
          char v49 = 0;
          BOOL v17 = 0;
          if ([v16 isEqual:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification])
          {
            id v50 = -[TVSSVideoEffectsDefaultCoordinator onMicModeEnabledChange](v71, "onMicModeEnabledChange");
            char v49 = 1;
            BOOL v17 = v50 != 0LL;
          }

          if ((v49 & 1) != 0) {

          }
          if (v17)
          {
            id v15 = (void (**)(id, id)) -[TVSSVideoEffectsDefaultCoordinator onMicModeEnabledChange]( v71,  "onMicModeEnabledChange");
            v15[2](v15, v69);
          }

          else
          {
            id v13 = [location[0] name];
            char v47 = 0;
            BOOL v14 = 0;
            if ([v13 isEqual:AVControlCenterManualFramingVideoZoomFactorDidChangeNotification])
            {
              id v48 = -[TVSSVideoEffectsDefaultCoordinator onZoomFactorChange](v71, "onZoomFactorChange");
              char v47 = 1;
              BOOL v14 = v48 != 0LL;
            }

            if ((v47 & 1) != 0) {

            }
            if (v14)
            {
              id v11 = [location[0] userInfo];
              id v10 =  [v11 objectForKeyedSubscript:AVControlCenterManualFramingVideoZoomFactorDidChangePayloadKeyVideoZoomFactor];
              [v10 floatValue];
              double v12 = v4;

              double v46 = v12;
              os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
              os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                sub_100074010( (uint64_t)v74,  *(uint64_t *)&v46,  -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v71, "isUsingWideForFraming"));
                _os_log_impl( (void *)&_mh_execute_header,  oslog,  v44,  "Zoom factor changed to: %f on wide: %{BOOL}i",  v74,  0x12u);
              }

              objc_storeStrong((id *)&oslog, 0LL);
              SEL v9 = (void (**)(double)) -[TVSSVideoEffectsDefaultCoordinator onZoomFactorChange]( v71,  "onZoomFactorChange");
              v9[2](v46);
            }

            else
            {
              id v7 = [location[0] name];
              unsigned __int8 v8 = [v7 isEqual:AVControlCenterManualFramingOneShotFramingDidCompleteNotification];

              if ((v8 & 1) != 0)
              {
                os_log_t v43 = (os_log_t)VideoMicBackingStoreLog();
                os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  sub_10003EC58( (uint64_t)v73,  -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v71, "isUsingWideForFraming"));
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  v42,  "One shot framing completed, on wide: %{BOOL}i",  v73,  8u);
                }

                objc_storeStrong((id *)&v43, 0LL);
              }

              else
              {
                id v5 = [location[0] name];
                unsigned __int8 v6 = [v5 isEqual:AVControlCenterManualFramingResetFramingDidCompleteNotification];

                if ((v6 & 1) != 0)
                {
                  os_log_t v41 = (os_log_t)VideoMicBackingStoreLog();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    sub_10003EC58( (uint64_t)v72,  -[TVSSVideoEffectsDefaultCoordinator isUsingWideForFraming](v71, "isUsingWideForFraming"));
                    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "One shot framing was reset, on wide: %{BOOL}i",  v72,  8u);
                  }

                  objc_storeStrong((id *)&v41, 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10[1] = a6;
  if ([location[0] isEqual:@"availableFrameSenderEndpointsByPID"])
  {
    v10[0] = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    os_log_t oslog = (os_log_t)VideoMicEffectsCoordinatorLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v15, (uint64_t)v10[0]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "availableFrameSenderEndpointsByPID changed. endpoints dict: %@",  v15,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSVideoEffectsDefaultCoordinator updateFrameReciever](v14, "updateFrameReciever");
    objc_storeStrong(v10, 0LL);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (AVCaptureDevice)continuityCaptureDevice
{
  return self->_continuityCaptureDevice;
}

- (void)setContinuityCaptureDevice:(id)a3
{
}

- (id)onShouldTransformChange
{
  return self->_onShouldTransformChange;
}

- (void)setOnShouldTransformChange:(id)a3
{
}

- (id)onSampleBufferChange
{
  return self->_onSampleBufferChange;
}

- (void)setOnSampleBufferChange:(id)a3
{
}

- (id)onZoomFactorChange
{
  return self->_onZoomFactorChange;
}

- (void)setOnZoomFactorChange:(id)a3
{
}

- (id)onBatteryStateChange
{
  return self->_onBatteryStateChange;
}

- (void)setOnBatteryStateChange:(id)a3
{
}

- (id)onLensChange
{
  return self->_onLensChange;
}

- (void)setOnLensChange:(id)a3
{
}

- (id)onVideoEffectsSupportChange
{
  return self->_onVideoEffectsSupportChange;
}

- (void)setOnVideoEffectsSupportChange:(id)a3
{
}

- (id)onVideoEffectsEnabledChange
{
  return self->_onVideoEffectsEnabledChange;
}

- (void)setOnVideoEffectsEnabledChange:(id)a3
{
}

- (id)onVideoEffectsControlModeChange
{
  return self->_onVideoEffectsControlModeChange;
}

- (void)setOnVideoEffectsControlModeChange:(id)a3
{
}

- (id)onMicModeSupportChange
{
  return self->_onMicModeSupportChange;
}

- (void)setOnMicModeSupportChange:(id)a3
{
}

- (id)onMicModeEnabledChange
{
  return self->_onMicModeEnabledChange;
}

- (void)setOnMicModeEnabledChange:(id)a3
{
}

- (CMCaptureFrameReceiver)frameReceiver
{
  return self->_frameReceiver;
}

- (void)setFrameReceiver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end