@interface TVSSVideoMicBackingStore
- (AVCaptureDevice)continuityCaptureDevice;
- (BOOL)cameraIsAvailableForTVSystemUI;
- (BOOL)enableMicMode:(id)a3;
- (BOOL)isContinuityCameraConnected;
- (BOOL)isDockKitEnabled;
- (BOOL)isManualFramingSupported;
- (BOOL)isUsingCamera;
- (BOOL)isUsingMic;
- (BOOL)isUsingWideForFraming;
- (BOOL)isValidPreviewBufferStream;
- (BOOL)shouldApplyTransform;
- (BOOL)shouldShowMenuItem;
- (BOOL)supportsUltraWideCamera;
- (BOOL)supportsWideCamera;
- (BOOL)toggleVideoEffect:(id)a3;
- (NSDictionary)micModes;
- (NSDictionary)videoEffects;
- (NSString)connectedDeviceName;
- (OS_dispatch_queue)delegateQueue;
- (TVSSMicMode)enabledMicMode;
- (TVSSVideoMicBackingStore)initWithSensorActivityController:(id)a3;
- (TVSSVideoMicBackingStore)initWithSensorProvider:(id)a3 coordinator:(id)a4;
- (TVSSVideoMicBackingStoreDelegate)delegate;
- (TVSSVideoMicCoordinator)coordinator;
- (TVSSVideoMicSensorProvider)sensorProvider;
- (double)defaultUltraWideZoomFactor;
- (double)defaultWideZoomFactor;
- (double)maxAvailableVideoZoomFactor;
- (double)minAvailableVideoZoomFactor;
- (double)zoomFactor;
- (id)batteryStateDescriptionForBatteryState:(int64_t)a3;
- (id)onSampleBufferChange;
- (id)videoPreviewStreamAssertion;
- (int64_t)batteryState;
- (void)dealloc;
- (void)handleNewCaptureDevice:(id)a3;
- (void)notifyDelegate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBatteryState:(int64_t)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 onQueue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setMaxAvailableVideoZoomFactor:(double)a3;
- (void)setMicModes:(id)a3;
- (void)setMinAvailableVideoZoomFactor:(double)a3;
- (void)setOnSampleBufferChange:(id)a3;
- (void)setSensorProvider:(id)a3;
- (void)setShouldApplyTransform:(BOOL)a3;
- (void)setUsingWideForFraming:(BOOL)a3;
- (void)setValidPreviewBufferStream:(BOOL)a3;
- (void)setVideoEffects:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)triggerOneShotFraming;
- (void)updateEffectsForSupport:(BOOL)a3 enablement:(BOOL)a4 controlModes:(BOOL)a5 completion:(id)a6;
- (void)updateMicModesForSupport:(BOOL)a3 enablement:(BOOL)a4 completion:(id)a5;
@end

@implementation TVSSVideoMicBackingStore

- (TVSSVideoMicBackingStore)initWithSensorProvider:(id)a3 coordinator:(id)a4
{
  id v134 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v132 = 0LL;
  objc_storeStrong(&v132, a4);
  id v4 = v134;
  id v134 = 0LL;
  v131.receiver = v4;
  v131.super_class = (Class)&OBJC_CLASS___TVSSVideoMicBackingStore;
  id v134 = -[TVSSVideoMicBackingStore init](&v131, "init");
  objc_storeStrong(&v134, v134);
  if (v134)
  {
    objc_storeStrong((id *)v134 + 9, location[0]);
    objc_storeStrong((id *)v134 + 10, v132);
    id v48 = [location[0] cameraAppInfo];
    id v130 = [v48 bundleIdentifier];

    id v47 = [location[0] micAppInfo];
    id v129 = [v47 bundleIdentifier];

    v137[0] = AVControlCenterVideoEffectCenterStage;
    uint64_t v46 = AVControlCenterVideoEffectCenterStage;
    id v45 = TVSSLagunaLocalizedString(@"TVSSVideoEffectCenterStage");
    id v43 =  +[TVSSVideoEffect effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSVideoEffect,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:",  v46,  v130);
    v138[0] = v43;
    v137[1] = AVControlCenterVideoEffectBackgroundBlur;
    uint64_t v44 = AVControlCenterVideoEffectBackgroundBlur;
    id v42 = TVSSLagunaLocalizedString(@"TVSSVideoEffectBackgroundBlur");
    id v40 =  +[TVSSVideoEffect effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSVideoEffect,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:",  v44,  v130);
    v138[1] = v40;
    v137[2] = AVControlCenterVideoEffectStudioLighting;
    uint64_t v41 = AVControlCenterVideoEffectStudioLighting;
    id v39 = TVSSLagunaLocalizedString(@"TVSSVideoEffectStudioLighting");
    id v37 =  +[TVSSVideoEffect effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSVideoEffect,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:",  v41,  v130);
    v138[2] = v37;
    v137[3] = AVControlCenterVideoEffectReactions;
    uint64_t v38 = AVControlCenterVideoEffectReactions;
    id v36 = TVSSLagunaLocalizedString(@"TVSSVideoEffectReactions");
    id v34 =  +[TVSSVideoEffect effectForAVEffect:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:]( &OBJC_CLASS___TVSSVideoEffect,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:",  v38,  v130);
    v138[3] = v34;
    v137[4] = AVControlCenterVideoEffectGestures;
    uint64_t v35 = AVControlCenterVideoEffectGestures;
    id v33 = TVSSLagunaLocalizedString(@"TVSSVideoEffectGestures");
    id v32 =  +[TVSSVideoEffect effectForAVEffect:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:]( &OBJC_CLASS___TVSSVideoEffect,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:",  v35,  v130);
    v138[4] = v32;
    v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  5LL);
    v6 = (void *)*((void *)v134 + 6);
    *((void *)v134 + 6) = v5;

    v135[0] = &off_1001C8978;
    id v31 = TVSSLagunaLocalizedString(@"TVSSMicModeDefault");
    id v30 =  +[TVSSMicMode modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSMicMode,  "modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:",  0LL,  v129);
    v136[0] = v30;
    v135[1] = &off_1001C8990;
    id v29 = TVSSLagunaLocalizedString(@"TVSSMicModeVoiceIsolation");
    id v28 =  +[TVSSMicMode modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSMicMode,  "modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:",  2LL,  v129);
    v136[1] = v28;
    v135[2] = &off_1001C89A8;
    id v27 = TVSSLagunaLocalizedString(@"TVSSMicModeMusic");
    id v26 =  +[TVSSMicMode modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:]( &OBJC_CLASS___TVSSMicMode,  "modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:",  1LL,  v129);
    v136[2] = v26;
    v7 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v136,  v135,  3LL);
    v8 = (void *)*((void *)v134 + 7);
    *((void *)v134 + 7) = v7;

    objc_initWeak(&from, v134);
    id v25 = location[0];
    v122 = _NSConcreteStackBlock;
    int v123 = -1073741824;
    int v124 = 0;
    v125 = sub_100041540;
    v126 = &unk_1001B78F0;
    objc_copyWeak(&v127, &from);
    [v25 setOnContinuityCameraConnectionChange:&v122];
    id v24 = location[0];
    v116 = _NSConcreteStackBlock;
    int v117 = -1073741824;
    int v118 = 0;
    v119 = sub_1000415C8;
    v120 = &unk_1001B7918;
    objc_copyWeak(&v121, &from);
    [v24 setOnCameraAppChange:&v116];
    id v23 = location[0];
    v110 = _NSConcreteStackBlock;
    int v111 = -1073741824;
    int v112 = 0;
    v113 = sub_100041708;
    v114 = &unk_1001B7918;
    objc_copyWeak(&v115, &from);
    [v23 setOnMicAppChange:&v110];
    id v22 = v132;
    v104 = _NSConcreteStackBlock;
    int v105 = -1073741824;
    int v106 = 0;
    v107 = sub_100041844;
    v108 = &unk_1001B7940;
    objc_copyWeak(&v109, &from);
    [v22 setOnZoomFactorChange:&v104];
    id v21 = v132;
    v98 = _NSConcreteStackBlock;
    int v99 = -1073741824;
    int v100 = 0;
    v101 = sub_100041884;
    v102 = &unk_1001B7968;
    objc_copyWeak(&v103, &from);
    [v21 setOnLensChange:&v98];
    id v20 = v132;
    v92 = _NSConcreteStackBlock;
    int v93 = -1073741824;
    int v94 = 0;
    v95 = sub_1000418C8;
    v96 = &unk_1001B5A88;
    objc_copyWeak(&v97, &from);
    [v20 setOnBatteryStateChange:&v92];
    id v19 = v132;
    v86 = _NSConcreteStackBlock;
    int v87 = -1073741824;
    int v88 = 0;
    v89 = sub_100041908;
    v90 = &unk_1001B7990;
    objc_copyWeak(&v91, &from);
    [v19 setOnVideoEffectsSupportChange:&v86];
    id v18 = v132;
    v80 = _NSConcreteStackBlock;
    int v81 = -1073741824;
    int v82 = 0;
    v83 = sub_100041A54;
    v84 = &unk_1001B7990;
    objc_copyWeak(&v85, &from);
    [v18 setOnVideoEffectsEnabledChange:&v80];
    id v17 = v132;
    v74 = _NSConcreteStackBlock;
    int v75 = -1073741824;
    int v76 = 0;
    v77 = sub_100041BA0;
    v78 = &unk_1001B7990;
    objc_copyWeak(&v79, &from);
    [v17 setOnVideoEffectsControlModeChange:&v74];
    id v16 = v132;
    v68 = _NSConcreteStackBlock;
    int v69 = -1073741824;
    int v70 = 0;
    v71 = sub_100041CEC;
    v72 = &unk_1001B7990;
    objc_copyWeak(&v73, &from);
    [v16 setOnMicModeSupportChange:&v68];
    id v15 = v132;
    v62 = _NSConcreteStackBlock;
    int v63 = -1073741824;
    int v64 = 0;
    v65 = sub_100041E34;
    v66 = &unk_1001B7990;
    objc_copyWeak(&v67, &from);
    [v15 setOnMicModeEnabledChange:&v62];
    id v14 = v132;
    v56 = _NSConcreteStackBlock;
    int v57 = -1073741824;
    int v58 = 0;
    v59 = sub_100041F7C;
    v60 = &unk_1001B7968;
    objc_copyWeak(&v61, &from);
    [v14 setOnShouldTransformChange:&v56];
    id v13 = v132;
    v50 = _NSConcreteStackBlock;
    int v51 = -1073741824;
    int v52 = 0;
    v53 = sub_100041FCC;
    v54 = &unk_1001B79B8;
    objc_copyWeak(&v55, &from);
    [v13 setOnSampleBufferChange:&v50];
    id v12 = v134;
    id v11 = [location[0] continuityCaptureDevice];
    objc_msgSend(v12, "handleNewCaptureDevice:");

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v91);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&v103);
    objc_destroyWeak(&v109);
    objc_destroyWeak(&v115);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&v127);
    objc_destroyWeak(&from);
    objc_storeStrong(&v129, 0LL);
    objc_storeStrong(&v130, 0LL);
  }

  v10 = (TVSSVideoMicBackingStore *)v134;
  objc_storeStrong(&v132, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v134, 0LL);
  return v10;
}

- (TVSSVideoMicBackingStore)initWithSensorActivityController:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = v10;
  v3 = objc_alloc(&OBJC_CLASS___TVSSVideoMicSensorDefaultProvider);
  v7 = -[TVSSVideoMicSensorDefaultProvider initWithSensorActivityController:]( v3,  "initWithSensorActivityController:",  location[0]);
  v6 = objc_alloc_init(&OBJC_CLASS___TVSSVideoEffectsDefaultCoordinator);
  v10 = 0LL;
  v10 = -[TVSSVideoMicBackingStore initWithSensorProvider:coordinator:](v5, "initWithSensorProvider:coordinator:", v7);
  v8 = v10;

  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v8;
}

- (void)dealloc
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[TVSSVideoMicCoordinator continuityCaptureDevice](self->_coordinator, "continuityCaptureDevice");
  [v3[0] removeObserver:v4 forKeyPath:@"videoZoomFactor" context:off_10021F188];
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSVideoMicBackingStore;
  -[TVSSVideoMicBackingStore dealloc](&v2, "dealloc");
}

- (BOOL)shouldShowMenuItem
{
  v7 = self;
  location[1] = (id)a2;
  id v4 = -[TVSSVideoMicBackingStore sensorProvider](self, "sensorProvider");
  id v3 = -[TVSSVideoMicSensorProvider cameraAppInfo](v4, "cameraAppInfo");
  location[0] = [v3 bundleIdentifier];

  LOBYTE(v5) = 0;
  if (-[TVSSVideoMicBackingStore isContinuityCameraConnected](v7, "isContinuityCameraConnected"))
  {
    LOBYTE(v5) = 0;
  }

  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)isContinuityCameraConnected
{
  objc_super v2 = -[TVSSVideoMicBackingStore continuityCaptureDevice](self, "continuityCaptureDevice");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (AVCaptureDevice)continuityCaptureDevice
{
  return (AVCaptureDevice *)-[TVSSVideoMicSensorProvider continuityCaptureDevice]( self->_sensorProvider,  "continuityCaptureDevice",  a2,  self);
}

- (NSString)connectedDeviceName
{
  return (NSString *)-[TVSSVideoMicSensorProvider connectedDeviceName]( self->_sensorProvider,  "connectedDeviceName",  a2,  self);
}

- (BOOL)isUsingCamera
{
  id v2 = -[TVSSVideoMicSensorProvider cameraAppInfo](self->_sensorProvider, "cameraAppInfo");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (BOOL)cameraIsAvailableForTVSystemUI
{
  char v6 = 0;
  char v4 = 0;
  unsigned __int8 v3 = 1;
  if (-[TVSSVideoMicBackingStore isUsingCamera](self, "isUsingCamera"))
  {
    id v7 = -[TVSSVideoMicSensorProvider cameraAppInfo](self->_sensorProvider, "cameraAppInfo");
    char v6 = 1;
    id v5 = [v7 bundleIdentifier];
    char v4 = 1;
    unsigned __int8 v3 = [v5 isEqualToString:@"com.apple.TVSystemUIService"];
  }

  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  return v3 & 1;
  }
}

- (BOOL)isUsingMic
{
  id v2 = -[TVSSVideoMicSensorProvider micAppInfo](self->_sensorProvider, "micAppInfo");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v4 = v7;
  id v3 = location[0];
  id v5 = &_dispatch_main_q;
  -[TVSSVideoMicBackingStore setDelegate:onQueue:](v4, "setDelegate:onQueue:", v3);

  objc_storeStrong(location, 0LL);
}

- (void)setDelegate:(id)a3 onQueue:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  objc_storeWeak((id *)&v9->_delegate, location[0]);
  if (location[0])
  {
    objc_storeStrong((id *)&v9->_delegateQueue, v7);
  }

  else
  {
    BOOL v4 = &_dispatch_main_q;
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v4;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setShouldApplyTransform:(BOOL)a3
{
  if (self->_shouldApplyTransform != a3)
  {
    self->_shouldApplyTransform = a3;
    -[TVSSVideoMicBackingStore notifyDelegate](self, "notifyDelegate");
  }

- (void)setValidPreviewBufferStream:(BOOL)a3
{
  if (self->_validPreviewBufferStream != a3)
  {
    self->_validPreviewBufferStream = a3;
    -[TVSSVideoMicBackingStore notifyDelegate](self, "notifyDelegate");
  }

- (BOOL)isManualFramingSupported
{
  return -[TVSSVideoMicCoordinator isManualFramingSupported]( self->_coordinator,  "isManualFramingSupported",  a2,  self) & 1;
}

- (void)triggerOneShotFraming
{
}

- (double)defaultWideZoomFactor
{
  return result;
}

- (double)defaultUltraWideZoomFactor
{
  return result;
}

- (double)maxAvailableVideoZoomFactor
{
  return result;
}

- (double)minAvailableVideoZoomFactor
{
  return result;
}

- (double)zoomFactor
{
  return result;
}

- (void)setZoomFactor:(double)a3
{
}

- (int64_t)batteryState
{
  return (int64_t)-[TVSSVideoMicCoordinator batteryState](self->_coordinator, "batteryState", a2, self);
}

- (void)setBatteryState:(int64_t)a3
{
}

- (BOOL)supportsWideCamera
{
  return -[TVSSVideoMicCoordinator supportsWideCamera]( self->_coordinator,  "supportsWideCamera",  a2,  self) & 1;
}

- (BOOL)supportsUltraWideCamera
{
  return -[TVSSVideoMicCoordinator supportsUltraWideCamera]( self->_coordinator,  "supportsUltraWideCamera",  a2,  self) & 1;
}

- (BOOL)isUsingWideForFraming
{
  return -[TVSSVideoMicCoordinator isUsingWideForFraming]( self->_coordinator,  "isUsingWideForFraming",  a2,  self) & 1;
}

- (void)setUsingWideForFraming:(BOOL)a3
{
}

- (BOOL)isDockKitEnabled
{
  char v6 = self;
  v5[1] = (id)a2;
  id v3 = -[TVSSVideoMicSensorProvider cameraAppInfo](self->_sensorProvider, "cameraAppInfo");
  v5[0] = [v3 bundleIdentifier];

  unsigned __int8 v4 = -[TVSSVideoMicCoordinator isDockKitEnabledForBundleID:]( v6->_coordinator,  "isDockKitEnabledForBundleID:",  v5[0]);
  objc_storeStrong(v5, 0LL);
  return v4 & 1;
}

- (id)videoPreviewStreamAssertion
{
  return -[TVSSVideoMicCoordinator videoPreviewStreamAssertion]( self->_coordinator,  "videoPreviewStreamAssertion",  a2,  self);
}

- (void)handleNewCaptureDevice:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSVideoMicCoordinator continuityCaptureDevice](v5->_coordinator, "continuityCaptureDevice");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", v5);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", v5);
  objc_msgSend(location[0], "addObserver:forKeyPath:options:context:", v5, @"videoZoomFactor");
  [location[0] addObserver:v5 forKeyPath:@"batteryState" options:1 context:off_10021F188];
  -[TVSSVideoMicCoordinator setContinuityCaptureDevice:](v5->_coordinator, "setContinuityCaptureDevice:", location[0]);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSMicMode)enabledMicMode
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  memset(__b, 0, sizeof(__b));
  v8 = -[TVSSVideoMicBackingStore micModes](v14, "micModes");
  obj = -[NSDictionary allValues](v8, "allValues");

  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v6);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v15,  16LL);
        if (!v7) {
          goto LABEL_9;
        }
      }
    }

    objc_storeStrong(location, v12);
  }

- (BOOL)toggleVideoEffect:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSVideoMicSensorProvider cameraAppInfo](v14->_sensorProvider, "cameraAppInfo");
  id v12 = [v5 bundleIdentifier];

  id v11 = [location[0] identifier];
  unsigned __int8 v10 = ([location[0] isEnabled] ^ 1) & 1;
  char v9 = -[TVSSVideoMicCoordinator toggleEnabledForEffect:enable:forBundleID:]( v14->_coordinator,  "toggleEnabledForEffect:enable:forBundleID:",  v11,  v10,  v12) & 1;
  if ((v9 & 1) != 0)
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000430D8((uint64_t)v16, (uint64_t)v11, v10 & 1, (uint64_t)v12);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  type,  "Successfully set video effect %{public}@ to %{BOOL}d for bundleID %{public}@",  v16,  0x1Cu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    os_log_t v6 = (os_log_t)VideoMicBackingStoreLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1000430D8((uint64_t)v15, (uint64_t)v11, v10 & 1, (uint64_t)v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to set video effect %{public}@ to %{BOOL}d for bundleID %{public}@",  v15,  0x1Cu);
    }

    objc_storeStrong((id *)&v6, 0LL);
  }

  char v4 = v9;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (BOOL)enableMicMode:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSVideoMicSensorProvider micAppInfo](v14->_sensorProvider, "micAppInfo");
  id v12 = [v5 bundleIdentifier];

  id v11 = [location[0] avMode];
  char v10 = ([location[0] isEnabled] ^ 1) & 1;
  char v9 = -[TVSSVideoMicCoordinator enableMode:forBundleID:]( v14->_coordinator,  "enableMode:forBundleID:",  [location[0] avMode],  v12) & 1;
  if ((v9 & 1) != 0)
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000433AC((uint64_t)v16, (uint64_t)v11, v10 & 1, (uint64_t)v12);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  type,  "Successfully set mic mode %ld to %{BOOL}d for bundleID %{public}@",  v16,  0x1Cu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    os_log_t v6 = (os_log_t)VideoMicBackingStoreLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1000433AC((uint64_t)v15, (uint64_t)v11, v10 & 1, (uint64_t)v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to set mic mode %ld to %{BOOL}d for bundleID %{public}@",  v15,  0x1Cu);
    }

    objc_storeStrong((id *)&v6, 0LL);
  }

  char v4 = v9;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (void)updateEffectsForSupport:(BOOL)a3 enablement:(BOOL)a4 controlModes:(BOOL)a5 completion:(id)a6
{
  id v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  BOOL v19 = a4;
  BOOL v18 = a5;
  id location = 0LL;
  objc_storeStrong(&location, a6);
  objc_initWeak(&v16, v22);
  os_log_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_10004356C;
  char v10 = &unk_1001B79E0;
  objc_copyWeak(&v12, &v16);
  BOOL v13 = v20;
  BOOL v14 = v19;
  BOOL v15 = v18;
  id v11 = location;
  BSDispatchMain(&v6);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_storeStrong(&location, 0LL);
}

- (void)updateMicModesForSupport:(BOOL)a3 enablement:(BOOL)a4 completion:(id)a5
{
  BOOL v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  BOOL v16 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  objc_initWeak(&v14, v19);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10004420C;
  char v9 = &unk_1001B7A08;
  objc_copyWeak(&v11, &v14);
  BOOL v12 = v17;
  BOOL v13 = v16;
  id v10 = location;
  BSDispatchMain(&v5);
  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_storeStrong(&location, 0LL);
}

- (void)notifyDelegate
{
  BOOL v12 = self;
  location[1] = (id)a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = WeakRetained == 0LL;

  if (!v4)
  {
    objc_initWeak(location, v12);
    queue = (dispatch_queue_s *)v12->_delegateQueue;
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = sub_100044838;
    char v9 = &unk_1001B75D0;
    objc_copyWeak(&v10, location);
    dispatch_async(queue, &v5);
    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  id v25 = 0LL;
  objc_storeStrong(&v25, a5);
  id v24 = a6;
  if (a6 == off_10021F188)
  {
    id v10 = v26;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___AVCaptureDevice);
    id v22 = sub_100044BEC(v10, v6);
    id v23 = v22;
    if (v22)
    {
      if ([location[0] isEqualToString:@"videoZoomFactor"])
      {
        double VideoZoomFactor = AVControlCenterManualFramingGetVideoZoomFactor(v23);
        id v20 = VideoMicBackingStoreLog();
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
        {
          sub_10001AC54((uint64_t)v30, *(uint64_t *)&VideoZoomFactor);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, v19, "KVO, set zoom factor to: %f", v30, 0xCu);
        }

        objc_storeStrong(&v20, 0LL);
        -[TVSSVideoMicCoordinator setZoomFactor:](v28->_coordinator, "setZoomFactor:", VideoZoomFactor);
      }

      else if ([location[0] isEqualToString:@"batteryState"])
      {
        id v18 = [v23 batteryState];
        os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          int v7 = oslog;
          os_log_type_t v8 = v16;
          id v9 =  -[TVSSVideoMicBackingStore batteryStateDescriptionForBatteryState:]( v28,  "batteryStateDescriptionForBatteryState:",  v18);
          id v15 = v9;
          sub_10000D28C((uint64_t)v29, (uint64_t)v15);
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "KVO, set battery state to: %@", v29, 0xCu);

          objc_storeStrong(&v15, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        -[TVSSVideoMicCoordinator setBatteryState:](v28->_coordinator, "setBatteryState:", v18);
      }
    }

    objc_storeStrong(&v23, 0LL);
  }

  else
  {
    v14.receiver = v28;
    v14.super_class = (Class)&OBJC_CLASS___TVSSVideoMicBackingStore;
    -[TVSSVideoMicBackingStore observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v26,  v25,  v24);
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)batteryStateDescriptionForBatteryState:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  return 0LL;
}

- (TVSSVideoMicBackingStoreDelegate)delegate
{
  return (TVSSVideoMicBackingStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isValidPreviewBufferStream
{
  return self->_validPreviewBufferStream;
}

- (BOOL)shouldApplyTransform
{
  return self->_shouldApplyTransform;
}

- (id)onSampleBufferChange
{
  return self->_onSampleBufferChange;
}

- (void)setOnSampleBufferChange:(id)a3
{
}

- (void)setMaxAvailableVideoZoomFactor:(double)a3
{
  self->_maxAvailabledouble VideoZoomFactor = a3;
}

- (void)setMinAvailableVideoZoomFactor:(double)a3
{
  self->_minAvailabledouble VideoZoomFactor = a3;
}

- (NSDictionary)videoEffects
{
  return self->_videoEffects;
}

- (void)setVideoEffects:(id)a3
{
}

- (NSDictionary)micModes
{
  return self->_micModes;
}

- (void)setMicModes:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (TVSSVideoMicSensorProvider)sensorProvider
{
  return self->_sensorProvider;
}

- (void)setSensorProvider:(id)a3
{
}

- (TVSSVideoMicCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end