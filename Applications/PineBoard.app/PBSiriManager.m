@interface PBSiriManager
+ (BOOL)_isSiriEnabled;
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_dismissAssistantViewWithCompletion:(id)a3;
- (BOOL)_shouldProvideScreenActionContext;
- (BOOL)dismissAssistant;
- (BOOL)isHidden;
- (BOOL)isListening;
- (BOOL)isPresenting;
- (BOOL)isSiriEnabled;
- (BOOL)isVisible;
- (BOOL)shouldPreferDictation;
- (BOOL)showAssistantIfNecessaryAfterApplication:(id)a3;
- (BOOL)siriScreenActionManagerIsSiriContentBeingDisplayed:(id)a3;
- (BSCompoundAssertion)siriSuppressionAssertion;
- (BSTransaction)dismissalTransaction;
- (NSHashTable)observers;
- (NSString)unhideBundleIdentifier;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBSceneDeferralTargetAssertion)deferralTargetAssertion;
- (PBSiriContentPresentingViewController)siriContainerViewController;
- (PBSiriManager)init;
- (PBSiriScreenActionContextProvider)onScreenActionContextProvider;
- (PBSiriScreenActionManager)screenActionManager;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemGestureHandle)listenGesture;
- (PBSystemGestureHandle)preheatGesture;
- (PBSystemGestureHandle)presentUIGesture;
- (PBSystemOverlayController)overlayController;
- (PBSystemUIServiceSiriPresentationStatePublishing)siriPresentationStatePublisher;
- (SiriAssertion)siriActivationAssertion;
- (SiriAssertion)siriButtonDownAssertion;
- (SiriAssertion)siriPreheatAssertion;
- (SiriBluetoothKeyboardActivationSource)keyboardActivationSource;
- (SiriPresentationPineBoardMainScreenViewController)mainScreenSiriPresentation;
- (SiriTVActivationSource)siriActivationSource;
- (SiriTestingSource)testingSource;
- (UIApplicationSceneDeactivationAssertion)fullscreenSiriSceneDeactivationAssertion;
- (id)_createOverlayDismissalTransactionWithCompletion:(id)a3;
- (id)_init;
- (id)suppressSiriWithReason:(id)a3;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (int64_t)activateSiriWithContext:(id)a3;
- (int64_t)prepareSiriWithContext:(id)a3;
- (int64_t)presentSiriAccessibilityUI;
- (int64_t)startSiriWithContext:(id)a3;
- (int64_t)stopSiriWithContext:(id)a3;
- (int64_t)visibleState;
- (unint64_t)_remoteTypeFromContext:(id)a3;
- (void)_cancelPreheating;
- (void)_cancelSiriActivation;
- (void)_handleAssistantPreferencesDidChangeNotification:(id)a3;
- (void)_hideSiriWindow;
- (void)_launchApplicationWithBundleIdentifier:(id)a3 withURL:(id)a4 launchOverSiri:(BOOL)a5 completion:(id)a6;
- (void)_notifyObserversSiriDidUpdatePresenting;
- (void)_notifyObserversSiriEnabledStateDidChange:(BOOL)a3;
- (void)_notifyObserversSiriWindowDidHide;
- (void)_notifyObserversSiriWindowDidUnhide;
- (void)_notifyObserversVisibleStateDidChange:(int64_t)a3;
- (void)_presentAssistantViewWithCompletion:(id)a3;
- (void)_setupGesturesWithManager:(id)a3;
- (void)_startOrStopProvidingScreenActionContext;
- (void)_startProvidingScreenActionContext;
- (void)_stopProvidingScreenActionContext;
- (void)_stopSiriActivation;
- (void)_unhideSiriWindow;
- (void)_updateShouldPreferDictation;
- (void)addObserver:(id)a3;
- (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4;
- (void)cancelActivation;
- (void)dealloc;
- (void)dictationManager:(id)a3 didActivateWithResult:(int64_t)a4;
- (void)disableSiriPresentGesture;
- (void)enableSiriPresentGesture;
- (void)hideAssistantViewForApplication:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
- (void)preheatIfNecessary;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)screenSaverManagerDidPresentScreenSaver:(id)a3;
- (void)screenSaverManagerWillDismissScreenSaver:(id)a3;
- (void)setFullscreenSiriSceneDeactivationAssertion:(id)a3;
- (void)setKeyboardActivationSource:(id)a3;
- (void)setMainScreenSiriPresentation:(id)a3;
- (void)setNextAssistantRecognitionStrings:(id)a3;
- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3;
- (void)setOnScreenActionContextProvider:(id)a3;
- (void)setShouldPreferDictation:(BOOL)a3;
- (void)setSiriActivationAssertion:(id)a3;
- (void)setSiriActivationSource:(id)a3;
- (void)setSiriButtonDownAssertion:(id)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSiriPreheatAssertion:(id)a3;
- (void)setSiriPresentationStatePublisher:(id)a3;
- (void)setTestingSource:(id)a3;
- (void)setUnhideBundleIdentifier:(id)a3;
- (void)setVisibleState:(int64_t)a3;
- (void)setup;
- (void)siriPresentation:(id)a3 didChangePresentationPeekMode:(unint64_t)visibleState;
- (void)siriPresentation:(id)a3 didChangePresentationVisualState:(unint64_t)a4;
- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4;
- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 sceneDidActivateWithIdentifier:(id)a4;
- (void)siriPresentationDidDeactivateScene:(id)a3;
@end

@implementation PBSiriManager

+ (PBDependencyDescription)dependencyDescription
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001E1D10;
  v20[3] = &unk_1003CFF78;
  v20[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v20);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBDictationManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v21[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v21[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBSystemGestureManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[3] = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v21[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 5LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v18);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E1DA8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004713E8 != -1) {
    dispatch_once(&qword_1004713E8, block);
  }
  return (id)qword_1004713E0;
}

- (PBSiriManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Unimplemented",  @"-[PBSiriManager init] not supported, use +sharedInstance instead",  0LL));
  objc_exception_throw(v2);
  return (PBSiriManager *)-[PBSiriManager _init](v3, v4);
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBSiriManager;
  id v2 = -[PBSiriManager init](&v28, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___PBSiriScreenActionManager);
    screenActionManager = v2->_screenActionManager;
    v2->_screenActionManager = v5;

    -[PBSiriScreenActionManager setDelegate:](v2->_screenActionManager, "setDelegate:", v2);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001E1FDC;
    v26[3] = &unk_1003D0FA8;
    uint64_t v7 = v2;
    v27 = v7;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v7,  v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyCommandRegistry]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBKeyCommand presentSiriAccessibilityUI](&OBJC_CLASS___PBKeyCommand, "presentSiriAccessibilityUI"));
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    v23 = sub_1001E2190;
    v24 = &unk_1003CFF08;
    v11 = v7;
    v25 = v11;
    [v9 registerKeyCommand:v10 action:&v21];

    uint64_t v12 = (objc_class *)objc_opt_class(v11);
    uint64_t v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:",  v14,  v21,  v22,  v23,  v24));
    siriSuppressionAssertion = v11->_siriSuppressionAssertion;
    v11->_siriSuppressionAssertion = (BSCompoundAssertion *)v15;

    v17 = v11->_siriSuppressionAssertion;
    id v18 = sub_100083E88();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[BSCompoundAssertion setLog:](v17, "setLog:", v19);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v3 removeObserver:self];

  SEL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  [v4 removeObserver:self];

  -[PBSystemOverlayController removeObserver:forKeyPath:context:]( self->_overlayController,  "removeObserver:forKeyPath:context:",  self,  @"hasActivePresentation",  off_10046DA38);
  -[BSCompoundAssertion invalidate](self->_siriSuppressionAssertion, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSiriManager;
  -[PBSiriManager dealloc](&v5, "dealloc");
}

- (void)setup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainWorkspace]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 geometry]);

  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (sub_1001C9E00())
  {
    [v5 fullDisplayBounds];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  id v18 = -[SiriPresentationPineBoardMainScreenViewController initWithIdentifier:hostedPresentationFrame:]( objc_alloc(&OBJC_CLASS___SiriPresentationPineBoardMainScreenViewController),  "initWithIdentifier:hostedPresentationFrame:",  4LL,  v7,  v9,  v11,  v13);
  mainScreenSiriPresentation = self->_mainScreenSiriPresentation;
  self->_mainScreenSiriPresentation = v18;

  -[SiriPresentationPineBoardMainScreenViewController setSiriPresentationControllerDelegate:]( self->_mainScreenSiriPresentation,  "setSiriPresentationControllerDelegate:",  self);
  -[PBSiriManager setSiriEnabled:](self, "setSiriEnabled:", [(id)objc_opt_class(self) _isSiriEnabled]);
  id v20 = sub_100083E88();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v26 = 136315394;
    *(void *)&void v26[4] = "-[PBSiriManager setup]";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s; enabled = %d", v26, 0x12u);
  }

  *(void *)v26 = 0LL;
  *(void *)&v26[8] = v26;
  *(void *)&v26[16] = 0x2020000000LL;
  uint64_t v22 = (id *)qword_100471408;
  uint64_t v27 = qword_100471408;
  if (!qword_100471408)
  {
    v23 = (void *)sub_1001E7040();
    uint64_t v22 = (id *)dlsym(v23, "AFPreferencesDidChangeNotification");
    *(void *)(*(void *)&v26[8] + 24LL) = v22;
    qword_100471408 = (uint64_t)v22;
  }

  _Block_object_dispose(v26, 8);
  if (!v22)
  {
    sub_100280AF0();
    __break(1u);
LABEL_13:
    dispatch_once(&qword_100471400, &stru_1003DC4A8);
    goto LABEL_11;
  }

  uint64_t v22 = (id *)*v22;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  *(void *)v26));
    [v24 addObserver:self selector:"_handleAssistantPreferencesDidChangeNotification:" name:v22 object:0];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[PBScreenSaverManager sharedInstance]( &OBJC_CLASS___PBScreenSaverManager,  "sharedInstance",  *(void *)v26));
  [v25 addObserver:self];

  if (qword_100471400 != -1) {
    goto LABEL_13;
  }
LABEL_11:
  -[PBSystemOverlayController addObserver:forKeyPath:options:context:]( self->_overlayController,  "addObserver:forKeyPath:options:context:",  self,  @"hasActivePresentation",  5LL,  off_10046DA38,  *(void *)v26);
}

- (BOOL)isHidden
{
  return -[PBSystemOverlayController isPaused](self->_overlayController, "isPaused");
}

- (BOOL)isVisible
{
  BOOL v3 = -[PBSiriManager isPresenting](self, "isPresenting");
  if (v3) {
    LOBYTE(v3) = !-[PBSystemOverlayController isPaused](self->_overlayController, "isPaused");
  }
  return v3;
}

- (void)preheatIfNecessary
{
  if (self->_siriEnabled
    && !self->_siriPreheatAssertion
    && (-[BSCompoundAssertion isActive](self->_siriSuppressionAssertion, "isActive") & 1) == 0)
  {
    id v3 = sub_100083E88();
    SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      double v12 = "-[PBSiriManager preheatIfNecessary]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
    }

    if (!self->_siriActivationSource)
    {
      objc_super v5 = (SiriTVActivationSource *)objc_claimAutoreleasedReturnValue( +[SiriTVActivationSource activationSourceForIdentifier:]( &OBJC_CLASS___SiriTVActivationSource,  "activationSourceForIdentifier:",  201LL));
      siriActivationSource = self->_siriActivationSource;
      self->_siriActivationSource = v5;
    }

    id v7 = sub_100083E88();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Siri: preheat", (uint8_t *)&v11, 2u);
    }

    double v9 = (SiriAssertion *)objc_claimAutoreleasedReturnValue( -[SiriTVActivationSource prepareForActivation]( self->_siriActivationSource,  "prepareForActivation"));
    siriPreheatAssertion = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = v9;
  }

- (UIApplicationSceneDeactivationAssertion)fullscreenSiriSceneDeactivationAssertion
{
  fullscreenSiriSceneDeactivationAssertion = self->_fullscreenSiriSceneDeactivationAssertion;
  if (!fullscreenSiriSceneDeactivationAssertion)
  {
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneDeactivationManager]);
    double v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:7];
    id v7 = self->_fullscreenSiriSceneDeactivationAssertion;
    self->_fullscreenSiriSceneDeactivationAssertion = v6;

    fullscreenSiriSceneDeactivationAssertion = self->_fullscreenSiriSceneDeactivationAssertion;
  }

  return fullscreenSiriSceneDeactivationAssertion;
}

- (int64_t)activateSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[PBSiriManager activateSiriWithContext:]";
    __int16 v25 = 1024;
    unsigned int v26 = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s; enabled = %d", (uint8_t *)&v23, 0x12u);
  }

  -[PBSiriManager _updateShouldPreferDictation](self, "_updateShouldPreferDictation");
  id v7 = sub_100083E88();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = -[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation");
    int v23 = 136315394;
    v24 = "-[PBSiriManager activateSiriWithContext:]";
    __int16 v25 = 1024;
    unsigned int v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s; prefer dictation = %d",
      (uint8_t *)&v23,
      0x12u);
  }

  if (-[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation"))
  {
    id v10 = sub_100083E88();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Activating Dictation UI display (single tap)",  (uint8_t *)&v23,  2u);
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    sub_1000319D8(12, 4, (uint64_t)[v12 longLongValue], 3uLL);

LABEL_9:
    int64_t v13 = 1LL;
    goto LABEL_28;
  }

  if (-[BSCompoundAssertion isActive](self->_siriSuppressionAssertion, "isActive"))
  {
    id v14 = sub_100083E88();
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      v24 = "-[PBSiriManager activateSiriWithContext:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s (single tap). Activating Siri while transitioning to screensaver. Suppressing this event.",  (uint8_t *)&v23,  0xCu);
    }

    int64_t v13 = 2LL;
  }

  else
  {
    id v16 = sub_100083E88();
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315138;
      v24 = "-[PBSiriManager activateSiriWithContext:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s #ptt (single tap). We are PTT eligible, starting Siri.",  (uint8_t *)&v23,  0xCu);
    }

    int64_t v13 = -[PBSiriManager startSiriWithContext:](self, "startSiriWithContext:", v4);
    -[SiriTVActivationSource setRemoteType:]( self->_siriActivationSource,  "setRemoteType:",  -[PBSiriManager _remoteTypeFromContext:](self, "_remoteTypeFromContext:", v4));
    -[SiriTVActivationSource didRecognizeButtonSinglePressUp]( self->_siriActivationSource,  "didRecognizeButtonSinglePressUp");
    if (!v13)
    {
LABEL_20:
      if (!self->_siriEnabled)
      {
        int64_t v13 = 0LL;
        goto LABEL_28;
      }

      -[PBSiriManager _cancelSiriActivation](self, "_cancelSiriActivation");
      id v18 = sub_100083E88();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Activating Siri for UI display (single tap)",  (uint8_t *)&v23,  2u);
      }

      if (self->_visibleState != 3)
      {
        id v20 = (SiriAssertion *)objc_claimAutoreleasedReturnValue( -[SiriTVActivationSource prepareForActivation]( self->_siriActivationSource,  "prepareForActivation"));
        siriActivationAssertion = self->_siriActivationAssertion;
        self->_siriActivationAssertion = v20;
      }

      -[SiriTVActivationSource setRemoteType:]( self->_siriActivationSource,  "setRemoteType:",  -[PBSiriManager _remoteTypeFromContext:](self, "_remoteTypeFromContext:", v4));
      -[SiriTVActivationSource didRecognizeButtonSinglePressUp]( self->_siriActivationSource,  "didRecognizeButtonSinglePressUp");
      if ([v4 isSourcePTTEligible])
      {
        int64_t v13 = 1LL;
        -[SiriTVActivationSource setPTTEligible:](self->_siriActivationSource, "setPTTEligible:", 1LL);
        goto LABEL_28;
      }

      goto LABEL_9;
    }
  }

- (int64_t)prepareSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    unsigned int v26 = "-[PBSiriManager prepareSiriWithContext:]";
    __int16 v27 = 1024;
    unsigned int v28 = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s; enabled = %d", (uint8_t *)&v25, 0x12u);
  }

  -[PBSiriManager _updateShouldPreferDictation](self, "_updateShouldPreferDictation");
  if (-[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation") || !self->_siriEnabled)
  {
    int64_t v11 = 0LL;
  }

  else
  {
    unsigned int v7 = -[BSCompoundAssertion isActive](self->_siriSuppressionAssertion, "isActive");
    id v8 = sub_100083E88();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v25 = 136315138;
        unsigned int v26 = "-[PBSiriManager prepareSiriWithContext:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s; Transitioning to screensaver. Do not prepare siri on press down. Suppressing event.",
          (uint8_t *)&v25,
          0xCu);
      }

      int64_t v11 = 2LL;
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Preheating Siri to start listening (press down)",  (uint8_t *)&v25,  2u);
      }

      -[PBSiriManager preheatIfNecessary](self, "preheatIfNecessary");
      -[SiriTVActivationSource setRemoteType:]( self->_siriActivationSource,  "setRemoteType:",  -[PBSiriManager _remoteTypeFromContext:](self, "_remoteTypeFromContext:", v4));
      siriActivationSource = self->_siriActivationSource;
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
      -[SiriTVActivationSource setDeviceIdentifier:](siriActivationSource, "setDeviceIdentifier:", v13);

      uint64_t v14 = mach_absolute_time();
      double Current = CFAbsoluteTimeGetCurrent();
      id v16 = [v4 buttonDownMachTime];
      if (v16)
      {
        double v17 = sub_1001C9C54() * (double)(v14 - (unint64_t)v16);
        if (v17 > 0.0)
        {
          id v18 = sub_100083E88();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 134217984;
            unsigned int v26 = *(const char **)&v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Transport delay - %f seconds",  (uint8_t *)&v25,  0xCu);
          }
        }
      }

      else
      {
        double v17 = 0.0;
      }

      double v20 = Current - v17;
      v21 = (SiriAssertion *)objc_claimAutoreleasedReturnValue( -[SiriTVActivationSource speechInteractionActivityWithTimestamp:]( self->_siriActivationSource,  "speechInteractionActivityWithTimestamp:",  v20));
      siriButtonDownAssertion = self->_siriButtonDownAssertion;
      self->_siriButtonDownAssertion = v21;

      id v23 = sub_100083E88();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100291054(v10, v20);
      }
      int64_t v11 = 1LL;
    }
  }

  return v11;
}

- (int64_t)presentSiriAccessibilityUI
{
  if (-[BSCompoundAssertion isActive](self->_siriSuppressionAssertion, "isActive"))
  {
    id v3 = sub_100083E88();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PBSiriManager presentSiriAccessibilityUI]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Presenting Siri accessibility UI while transitioning to screensaver. Suppressing this event.",  (uint8_t *)&v10,  0xCu);
    }

    return 2LL;
  }

  else if (self->_siriEnabled)
  {
    id v6 = sub_100083E88();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PBSiriManager presentSiriAccessibilityUI]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
    }

    -[PBSiriManager cancelActivation](self, "cancelActivation");
    -[SiriBluetoothKeyboardActivationSource invalidate](self->_keyboardActivationSource, "invalidate");
    id v8 = objc_alloc_init(&OBJC_CLASS___SiriBluetoothKeyboardActivationSource);
    keyboardActivationSource = self->_keyboardActivationSource;
    self->_keyboardActivationSource = v8;

    -[SiriBluetoothKeyboardActivationSource activateFromSource:]( self->_keyboardActivationSource,  "activateFromSource:",  35LL);
    return 1LL;
  }

  else
  {
    return 0LL;
  }

- (id)suppressSiriWithReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:]( self->_siriSuppressionAssertion,  "acquireForReason:",  a3));
}

- (void)cancelActivation
{
}

- (void)_cancelPreheating
{
  if (self->_siriPreheatAssertion)
  {
    id v3 = sub_100083E88();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Siri: Cancel preheat", v6, 2u);
    }

    -[SiriAssertion invalidate](self->_siriPreheatAssertion, "invalidate");
    siriPreheatAssertion = self->_siriPreheatAssertion;
    self->_siriPreheatAssertion = 0LL;
  }

- (void)_stopSiriActivation
{
  if (self->_siriButtonDownAssertion)
  {
    id v3 = sub_100083E88();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Siri: invalidate button down assertion",  v6,  2u);
    }

    -[SiriAssertion invalidate](self->_siriButtonDownAssertion, "invalidate");
    siriButtonDownAssertion = self->_siriButtonDownAssertion;
    self->_siriButtonDownAssertion = 0LL;
  }

  -[PBSiriManager _cancelSiriActivation](self, "_cancelSiriActivation");
}

- (void)_cancelSiriActivation
{
  if (self->_siriActivationAssertion)
  {
    id v3 = sub_100083E88();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Siri: invalidate activation assertion",  v6,  2u);
    }

    -[SiriAssertion invalidate](self->_siriActivationAssertion, "invalidate");
    siriActivationAssertion = self->_siriActivationAssertion;
    self->_siriActivationAssertion = 0LL;
  }

- (int64_t)startSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 136315394;
    v40 = "-[PBSiriManager startSiriWithContext:]";
    __int16 v41 = 1024;
    unsigned int v42 = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s; enabled = %d", (uint8_t *)&v39, 0x12u);
  }

  -[PBSiriManager _updateShouldPreferDictation](self, "_updateShouldPreferDictation");
  id v7 = sub_100083E88();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = -[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation");
    int v39 = 136315394;
    v40 = "-[PBSiriManager startSiriWithContext:]";
    __int16 v41 = 1024;
    unsigned int v42 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s; prefer dictation = %d",
      (uint8_t *)&v39,
      0x12u);
  }

  if (-[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation"))
  {
    id v10 = sub_100083E88();
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Activating dictation (press and hold)",  (uint8_t *)&v39,  2u);
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    int64_t v13 = 1LL;
    sub_1000319D8(12, 4, (uint64_t)[v12 longLongValue], 1uLL);

LABEL_11:
    id v14 = sub_100083E88();
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v39 = 136315138;
      v40 = "-[PBSiriManager startSiriWithContext:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Starting Siri while transitioning to screensaver. Suppressing this event.",  (uint8_t *)&v39,  0xCu);
    }

    int64_t v13 = 2LL;
    goto LABEL_37;
  }

  if (self->_siriEnabled)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 testingContext]);
    id v17 = [v16 count];

    if (v17)
    {
      id v18 = sub_100083E88();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Activating Siri in testing Mode",  (uint8_t *)&v39,  2u);
      }

      -[PBSiriManager _unhideSiriWindow](self, "_unhideSiriWindow");
      if (self->_siriActivationSource)
      {
        id v20 = sub_100083E88();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Activation source is up",  (uint8_t *)&v39,  2u);
        }

        -[SiriTVActivationSource invalidate](self->_siriActivationSource, "invalidate");
      }

      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___SiriTestingSource);
      testingSource = self->_testingSource;
      self->_testingSource = v22;

      v24 = self->_testingSource;
      id v25 = objc_alloc(&OBJC_CLASS___SiriTestingContext);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v4 testingContext]);
      id v27 = [v25 initWithPPTContext:v26];
      -[SiriTestingSource activateWithContext:](v24, "activateWithContext:", v27);
    }

    else
    {
      if (!self->_siriButtonDownAssertion && !self->_siriPreheatAssertion)
      {
        id v28 = sub_100083E88();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Preheating Siri from cold start",  (uint8_t *)&v39,  2u);
        }

        -[PBSiriManager prepareSiriWithContext:](self, "prepareSiriWithContext:", v4);
      }

      unint64_t v30 = -[PBSiriManager _remoteTypeFromContext:](self, "_remoteTypeFromContext:", v4);
      -[SiriTVActivationSource setRemoteType:](self->_siriActivationSource, "setRemoteType:", v30);
      siriActivationSource = self->_siriActivationSource;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
      -[SiriTVActivationSource setDeviceIdentifier:](siriActivationSource, "setDeviceIdentifier:", v32);

      id v33 = sub_100083E88();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Activating Siri to start listening (press and hold)",  (uint8_t *)&v39,  2u);
      }

      id v35 = sub_100083E88();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = (char *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30));
        int v39 = 138477827;
        v40 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Remote type: %{private}@",  (uint8_t *)&v39,  0xCu);
      }

      -[PBSiriManager _unhideSiriWindow](self, "_unhideSiriWindow");
      -[SiriTVActivationSource didRecognizeLongPress](self->_siriActivationSource, "didRecognizeLongPress");
    }

    +[PBDataReportingService startTimingForAction:](&OBJC_CLASS___PBDataReportingService, "startTimingForAction:", 7LL);
    int64_t v13 = 1LL;
  }

  else
  {
    int64_t v13 = 0LL;
  }

- (int64_t)stopSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    id v18 = "-[PBSiriManager stopSiriWithContext:]";
    __int16 v19 = 1024;
    unsigned int v20 = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s; enabled = %d", (uint8_t *)&v17, 0x12u);
  }

  id v7 = sub_100083E88();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = -[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation");
    int v17 = 136315394;
    id v18 = "-[PBSiriManager stopSiriWithContext:]";
    __int16 v19 = 1024;
    unsigned int v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s; prefer dictation = %d",
      (uint8_t *)&v17,
      0x12u);
  }

  if (-[PBSiriManager shouldPreferDictation](self, "shouldPreferDictation"))
  {
    id v10 = sub_100083E88();
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stopping dictation (press and hold)",  (uint8_t *)&v17,  2u);
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    sub_1000319D8(12, 4, (uint64_t)[v12 longLongValue], 2uLL);

    -[PBSiriManager setShouldPreferDictation:](self, "setShouldPreferDictation:", 0LL);
  }

  else
  {
    -[PBSiriManager setShouldPreferDictation:](self, "setShouldPreferDictation:", 0LL);
    if (!self->_siriEnabled)
    {
      int64_t v15 = 0LL;
      goto LABEL_14;
    }

    id v13 = sub_100083E88();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Deactivating Siri for listening",  (uint8_t *)&v17,  2u);
    }

    -[PBSiriManager _stopSiriActivation](self, "_stopSiriActivation");
    +[PBDataReportingService stopTimingForAction:](&OBJC_CLASS___PBDataReportingService, "stopTimingForAction:", 7LL);
  }

  int64_t v15 = 1LL;
LABEL_14:

  return v15;
}

- (BOOL)isListening
{
  id v3 = sub_100083E88();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[PBSiriManager isSiriEnabled](self, "isSiriEnabled");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking listening state. isSiriEnabled = %{BOOL}d",  (uint8_t *)v6,  8u);
  }

  return -[SiriTVActivationSource isActive](self->_siriActivationSource, "isActive");
}

- (void)setVisibleState:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriManager fullscreenSiriSceneDeactivationAssertion]( self,  "fullscreenSiriSceneDeactivationAssertion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned int v7 = [v6 isPresenting];

  if (v7)
  {
    unsigned __int8 v8 = [v5 isAcquired];
    if (a3 == 2 && (v8 & 1) == 0)
    {
      double v9 = sub_100103824(-[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1001E3B10;
      v18[3] = &unk_1003D7748;
      *(double *)&v18[4] = v9;
      [v5 acquireWithPredicate:v18 transitionContext:0];
      id v10 = sub_100083C30();
      int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = UIApplicationSceneDeactivationReasonDescription([v5 reason]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)buf = 138543362;
        unsigned int v20 = v13;
        id v14 = "Acquired scene assertion for reason: %{public}@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v14, buf, 0xCu);

        goto LABEL_11;
      }

      goto LABEL_11;
    }

    unsigned int v15 = [v5 isAcquired];
    if (a3 != 2 && v15)
    {
      [v5 relinquish];
      id v16 = sub_100083C30();
      int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = UIApplicationSceneDeactivationReasonDescription([v5 reason]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138543362;
        unsigned int v20 = v13;
        id v14 = "Relinquished scene assertion for reason: %{public}@";
        goto LABEL_10;
      }

- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3
{
}

- (void)setNextAssistantRecognitionStrings:(id)a3
{
}

- (void)_presentAssistantViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[PBSiriManager _presentAssistantViewWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  if (-[PBSystemOverlayController isPaused](self->_overlayController, "isPaused")) {
    -[PBSystemOverlayController resume](self->_overlayController, "resume");
  }
  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v7;

    double v9 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissSiriFragment",  self);
    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"DismissControlCenterFragment"));
    -[PBCoordinatedTransitionToken setCoordinatedFragmentTypes:]( self->_coordinatedTransitionToken,  "setCoordinatedFragmentTypes:",  v10);
  }

  int64_t v11 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v11, "setAnimated:", 0LL);
  uint64_t v12 = (objc_class *)objc_opt_class(self);
  id v13 = NSStringFromClass(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v11, "setIdentifier:", v14);

  -[PBMutableSystemOverlayPresentationRequest setProvider:](v11, "setProvider:", self);
  -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:](v11, "setSceneDeactivationReasons:", 16LL);
  -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v11,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  -[PBSystemOverlayController presentWithRequest:completion:]( self->_overlayController,  "presentWithRequest:completion:",  v11,  v4);
}

- (void)_hideSiriWindow
{
  id v3 = sub_100083E88();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[PBSiriManager _hideSiriWindow]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[PBSystemOverlayController pauseWithOptions:](self->_overlayController, "pauseWithOptions:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriManager fullscreenSiriSceneDeactivationAssertion]( self,  "fullscreenSiriSceneDeactivationAssertion"));
  id v6 = v5;
  if (self->_visibleState == 2 && [v5 isAcquired])
  {
    [v6 relinquish];
    id v7 = sub_100083C30();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = UIApplicationSceneDeactivationReasonDescription([v6 reason]);
      id v10 = (char *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Relinquished scene assertion for reason: %{public}@",  (uint8_t *)&v11,  0xCu);
    }
  }

  -[PBSiriManager _notifyObserversSiriWindowDidHide](self, "_notifyObserversSiriWindowDidHide");
}

- (void)_unhideSiriWindow
{
  id v3 = sub_100083E88();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[PBSiriManager _unhideSiriWindow]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[PBSystemOverlayController resume](self->_overlayController, "resume");
  -[PBSiriManager setVisibleState:](self, "setVisibleState:", self->_visibleState);
  -[PBSiriManager _notifyObserversSiriWindowDidUnhide](self, "_notifyObserversSiriWindowDidUnhide");
}

- (BOOL)dismissAssistant
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));

  if (v3)
  {
    mainScreenSiriPresentation = self->_mainScreenSiriPresentation;
    id v5 = [[SiriDismissalOptions alloc] initWithDeactivationOptions:0 animated:1];
    -[SiriPresentationPineBoardMainScreenViewController dismissWithOptions:]( mainScreenSiriPresentation,  "dismissWithOptions:",  v5);
  }

  return v3 != 0LL;
}

- (BOOL)_dismissAssistantViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083E88();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[PBSiriManager _dismissAssistantViewWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v7)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriManager _createOverlayDismissalTransactionWithCompletion:]( self,  "_createOverlayDismissalTransactionWithCompletion:",  v4));
    [v8 begin];
  }

  return v7 != 0LL;
}

- (void)hideAssistantViewForApplication:(id)a3
{
}

- (BOOL)showAssistantIfNecessaryAfterApplication:(id)a3
{
  BOOL v4 = -[NSString isEqualToString:](self->_unhideBundleIdentifier, "isEqualToString:", a3);
  if (v4)
  {
    unhideBundleIdentifier = self->_unhideBundleIdentifier;
    self->_unhideBundleIdentifier = 0LL;

    -[PBSiriManager _unhideSiriWindow](self, "_unhideSiriWindow");
  }

  return v4;
}

- (unint64_t)_remoteTypeFromContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceName]);
  if ([v4 isEqualToString:PBSMediaRemoteSiriContextSourceNameAppleRemote])
  {
    id v5 = (char *)[v3 bluetoothRemoteType];
    else {
      unint64_t v6 = 0LL;
    }
  }

  else
  {
    unint64_t v6 = [v4 isEqualToString:PBSMediaRemoteSiriContextSourceNameMediaRemoteService];
  }

  return v6;
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  if (-[PBSiriScreenActionManager isEnabled](self->_screenActionManager, "isEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionManager deferredScreenActionItem]( self->_screenActionManager,  "deferredScreenActionItem"));
    unint64_t v6 = v5;
    if (v5)
    {
      unsigned int v7 = [v5 performDeferredAction];
      id v8 = sub_100083E88();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        int v11 = v6;
        __int16 v12 = 1024;
        unsigned int v13 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Screen action: %@ performed: %d",  (uint8_t *)&v10,  0x12u);
      }

      -[PBSiriScreenActionManager setDeferredScreenActionItem:]( self->_screenActionManager,  "setDeferredScreenActionItem:",  0LL);
    }
  }

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, PBSiriContentPresentingViewController *, void))a3;
  id v5 = -[PBSiriContentPresentingViewController initWithSiriViewController:]( objc_alloc(&OBJC_CLASS___PBSiriContentPresentingViewController),  "initWithSiriViewController:",  self->_mainScreenSiriPresentation);
  v4[2](v4, v5, 0LL);
}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  id v6 = a5;
  id v7 = sub_100083E88();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[PBSiriManager siriPresentation:requestsPresentationWithOptions:withHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001E447C;
  v10[3] = &unk_1003D0300;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v6;
  id v9 = v6;
  dispatch_async(&_dispatch_main_q, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100083E88();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t Name = SASDismissalGetName([v7 dismissalReason]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)buf = 136315394;
    unsigned int v20 = "-[PBSiriManager siriPresentation:requestsDismissalWithOptions:withHandler:]";
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s reason: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E46BC;
  block[3] = &unk_1003DAC80;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4
{
  id v4 = sub_100083E88();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PBSiriManager siriPresentation:isEnabledDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100083E88();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 url]);
    *(_DWORD *)buf = 136315650;
    unsigned int v20 = "-[PBSiriManager siriPresentation:requestsPunchout:withHandler:]";
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s bundle: %@, url: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4AB0;
  block[3] = &unk_1003DAC80;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)siriPresentation:(id)a3 didChangePresentationPeekMode:(unint64_t)visibleState
{
  id v6 = sub_100083E88();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[PBSiriManager siriPresentation:didChangePresentationPeekMode:]";
    __int16 v10 = 2048;
    unint64_t v11 = visibleState;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v8, 0x16u);
  }

  if (visibleState >= 4) {
    visibleState = self->_visibleState;
  }
  if (visibleState != self->_visibleState) {
    -[PBSiriManager setVisibleState:](self, "setVisibleState:", visibleState);
  }
}

- (void)siriPresentation:(id)a3 didChangePresentationVisualState:(unint64_t)a4
{
  id v6 = sub_100083E88();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[PBSiriManager siriPresentation:didChangePresentationVisualState:]";
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v9, 0x16u);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriManager siriPresentationStatePublisher](self, "siriPresentationStatePublisher"));
  [v8 setSiriPresentationVisibility:a4];
}

- (void)siriPresentation:(id)a3 sceneDidActivateWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = sub_100083E88();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int v15 = "-[PBSiriManager siriPresentation:sceneDidActivateWithIdentifier:]";
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (-[PBSceneDeferralTargetAssertion isValid](self->_deferralTargetAssertion, "isValid"))
  {
    -[PBSceneDeferralTargetAssertion invalidate](self->_deferralTargetAssertion, "invalidate");
    deferralTargetAssertion = self->_deferralTargetAssertion;
    self->_deferralTargetAssertion = 0LL;
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneWithIdentifier:v5]);

  if (v10)
  {
    __int16 v11 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v10);
    unint64_t v12 = -[PBSceneDeferralTargetAssertion initWithSceneHandle:reason:]( objc_alloc(&OBJC_CLASS___PBSceneDeferralTargetAssertion),  "initWithSceneHandle:reason:",  v11,  @"Focus Deferral");
    id v13 = self->_deferralTargetAssertion;
    self->_deferralTargetAssertion = v12;
  }
}

- (void)siriPresentationDidDeactivateScene:(id)a3
{
  id v4 = sub_100083E88();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneDeferralTargetAssertion sceneHandle](self->_deferralTargetAssertion, "sceneHandle"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sceneIdentifier]);
    int v9 = 136315394;
    __int16 v10 = "-[PBSiriManager siriPresentationDidDeactivateScene:]";
    __int16 v11 = 2114;
    unint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[PBSceneDeferralTargetAssertion invalidate](self->_deferralTargetAssertion, "invalidate");
  deferralTargetAssertion = self->_deferralTargetAssertion;
  self->_deferralTargetAssertion = 0LL;
}

- (void)_handleAssistantPreferencesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "siri/manager/preferencesDidChange",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v6);

  -[PBSiriManager setSiriEnabled:](self, "setSiriEnabled:", [(id)objc_opt_class(self) _isSiriEnabled]);
  -[PBSiriManager _startOrStopProvidingScreenActionContext](self, "_startOrStopProvidingScreenActionContext");
  os_activity_scope_leave(&v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046DA38 == a6)
  {
    unsigned int v7 = objc_msgSend(a5, "tvs_BOOLForKey:defaultValue:", NSKeyValueChangeNewKey, 0);
    id v8 = sub_100083E88();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PBSiriManager - Updating presenting property to %{BOOL}d",  buf,  8u);
    }

    -[PBSiriManager willChangeValueForKey:](self, "willChangeValueForKey:", @"presenting");
    self->_presenting = v7;
    -[PBSiriManager didChangeValueForKey:](self, "didChangeValueForKey:", @"presenting");
    if (!self->_presenting)
    {
      id v10 = sub_100083E88();
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No longer presenting, clearing presentation visibility state",  buf,  2u);
      }

      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriManager siriPresentationStatePublisher](self, "siriPresentationStatePublisher"));
      [v12 setSiriPresentationVisibility:0];
    }

    -[PBSiriManager _notifyObserversSiriDidUpdatePresenting](self, "_notifyObserversSiriDidUpdatePresenting");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBSiriManager;
    -[PBSiriManager observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)screenSaverManagerDidPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerWillDismissScreenSaver:(id)a3
{
}

- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
  if (a4 == 136)
  {
    id v4 = sub_100083E88();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WakeReason is SiriCommand. Not dismissing Siri.",  v6,  2u);
    }
  }

  else
  {
    -[PBSiriManager dismissAssistant](self, "dismissAssistant", a3);
  }

- (BOOL)siriScreenActionManagerIsSiriContentBeingDisplayed:(id)a3
{
  return self->_visibleState != 0;
}

- (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4
{
  id v5 = a4;
  if (-[PBSiriManager isPresenting](self, "isPresenting"))
  {
    os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
    if ([v6 isLaunchedOverSiri])
    {
    }

    else
    {
      unsigned __int8 v7 = +[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled");

      if ((v7 & 1) == 0)
      {
        id v8 = sub_100083CA8();
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ending full screen Siri for app launch",  v10,  2u);
        }

        -[PBSiriManager dismissAssistant](self, "dismissAssistant");
      }
    }
  }
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001E54E0;
  v14[3] = &unk_1003D24A8;
  objc_copyWeak(&v15, &location);
  id v12 = [v11 initWithBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

- (id)_createOverlayDismissalTransactionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v5)
  {
    id v6 = sub_100083E88();
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dismissing Siri overlay", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v8 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001E56B0;
    v11[3] = &unk_1003DC4F8;
    objc_copyWeak(&v15, buf);
    id v12 = v5;
    objc_super v13 = self;
    id v14 = v4;
    id v9 = [v8 initWithBlock:v11];
    objc_storeStrong((id *)&self->_dismissalTransaction, v9);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)dictationManager:(id)a3 didActivateWithResult:(int64_t)a4
{
}

+ (BOOL)_isSiriEnabled
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000LL;
  id v2 = (void *)qword_100471418;
  uint64_t v11 = qword_100471418;
  if (!qword_100471418)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001E70F0;
    v7[3] = &unk_1003D0790;
    v7[4] = &v8;
    sub_1001E70F0((uint64_t)v7);
    id v2 = (void *)v9[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedPreferences]);
  unsigned __int8 v5 = [v4 assistantIsEnabled];

  return v5;
}

- (void)setSiriEnabled:(BOOL)a3
{
  if (self->_siriEnabled != a3)
  {
    BOOL v3 = a3;
    -[PBSiriManager dismissAssistant](self, "dismissAssistant");
    self->_siriEnabled = v3;
    id v5 = sub_100083E88();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_siriEnabled) {
        unsigned __int8 v7 = "YES";
      }
      else {
        unsigned __int8 v7 = "NO";
      }
      int v8 = 136315138;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Siri Enabled: %s", (uint8_t *)&v8, 0xCu);
    }

    -[PBSiriManager _startOrStopProvidingScreenActionContext](self, "_startOrStopProvidingScreenActionContext");
    -[PBSiriManager _notifyObserversSiriEnabledStateDidChange:](self, "_notifyObserversSiriEnabledStateDidChange:", v3);
  }

- (void)_updateShouldPreferDictation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned int v4 = [v3 isDictationEnabled];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedSceneHandle]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uiClientSettings]);
  unsigned int v8 = [v7 systemInputActive];

  uint64_t v9 = v4 & v8;
  id v10 = sub_100083E88();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned int v13 = [v12 isDictationEnabled];
    id v14 = "NO";
    id v18 = "-[PBSiriManager _updateShouldPreferDictation]";
    if (v13) {
      id v15 = "YES";
    }
    else {
      id v15 = "NO";
    }
    int v17 = 136315906;
    if (v8) {
      __int16 v16 = "YES";
    }
    else {
      __int16 v16 = "NO";
    }
    unsigned int v20 = v15;
    __int16 v19 = 2080;
    __int16 v21 = 2080;
    uint64_t v22 = v16;
    if ((_DWORD)v9) {
      id v14 = "YES";
    }
    __int16 v23 = 2080;
    v24 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s; dictation enabled: %s, keyboard on-screen: %s, preferring dictation: %s",
      (uint8_t *)&v17,
      0x2Au);
  }

  -[PBSiriManager setShouldPreferDictation:](self, "setShouldPreferDictation:", v9);
}

- (BOOL)_shouldProvideScreenActionContext
{
  if (!self->_siriEnabled) {
    return 0;
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 areScreenActionsEnabled];

  return v3;
}

- (void)_startOrStopProvidingScreenActionContext
{
  unsigned int v3 = -[PBSiriManager _shouldProvideScreenActionContext](self, "_shouldProvideScreenActionContext");
  id v4 = sub_100083E88();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Attempting to start/stop providing screen action context. shouldProvide=%{BOOL}d",  (uint8_t *)v6,  8u);
  }

  if (v3) {
    -[PBSiriManager _startProvidingScreenActionContext](self, "_startProvidingScreenActionContext");
  }
  else {
    -[PBSiriManager _stopProvidingScreenActionContext](self, "_stopProvidingScreenActionContext");
  }
}

- (void)_startProvidingScreenActionContext
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriManager onScreenActionContextProvider](self, "onScreenActionContextProvider"));

  id v4 = sub_100083E88();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Already started providing screen action context. Ignoring request to start",  buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)unsigned __int8 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating onscreen context provider", v7, 2u);
    }

    id v5 = -[PBSiriScreenActionContextProvider initWithScreenActionManager:]( objc_alloc(&OBJC_CLASS___PBSiriScreenActionContextProvider),  "initWithScreenActionManager:",  self->_screenActionManager);
    -[PBSiriManager setOnScreenActionContextProvider:](self, "setOnScreenActionContextProvider:", v5);
  }
}

- (void)_stopProvidingScreenActionContext
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriManager onScreenActionContextProvider](self, "onScreenActionContextProvider"));

  id v4 = sub_100083E88();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)unsigned __int8 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing onscreen context provider", v7, 2u);
    }

    -[PBSiriManager setOnScreenActionContextProvider:](self, "setOnScreenActionContextProvider:", 0LL);
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Already stopped providing screen action context. Ignoring request to stop",  buf,  2u);
    }
  }

- (void)_launchApplicationWithBundleIdentifier:(id)a3 withURL:(id)a4 launchOverSiri:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = sub_100083E88();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v27 = "-[PBSiriManager _launchApplicationWithBundleIdentifier:withURL:launchOverSiri:completion:]";
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 1024;
    BOOL v33 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s bundle: %@, url: %@ launchOverSiri: %{BOOL}d",  buf,  0x26u);
  }

  uint64_t v24 = PBAppLaunchOptionLaunchOverSiri;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  id v25 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  [v16 setObject:v15 forKey:FBSOpenApplicationOptionKeyPayloadAnnotation];
  [v16 addEntriesFromDictionary:v15];
  if (v10) {
    [v16 setObject:v10 forKey:FBSOpenApplicationOptionKeyPayloadURL];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001E6104;
  v20[3] = &unk_1003DC520;
  id v22 = v10;
  id v23 = v11;
  id v21 = v16;
  id v17 = v10;
  id v18 = v11;
  id v19 = v16;
  +[LSAppLink getAppLinkWithURL:completionHandler:]( &OBJC_CLASS___LSAppLink,  "getAppLinkWithURL:completionHandler:",  v17,  v20);
}

- (void)_setupGesturesWithManager:(id)a3
{
  id v4 = a3;
  id v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:43 actionHandler:&stru_1003DC540];
  presentUIGesture = self->_presentUIGesture;
  self->_presentUIGesture = v5;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001E65D8;
  v15[3] = &unk_1003D1020;
  objc_copyWeak(&v16, &location);
  BOOL v7 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:44 actionHandler:v15];
  preheatGesture = self->_preheatGesture;
  self->_preheatGesture = v7;

  id v9 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:45 actionHandler:&stru_1003DC560];
  listenGesture = self->_listenGesture;
  self->_listenGesture = v9;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001E66B4;
  v13[3] = &unk_1003D1020;
  objc_copyWeak(&v14, &location);
  id v11 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:46 actionHandler:v13];
  dismissGesture = self->_dismissGesture;
  self->_dismissGesture = v11;

  if ((_os_feature_enabled_impl("PineBoard", "PressToDictate") & 1) == 0) {
    -[PBSystemGestureHandle acquire](self->_presentUIGesture, "acquire");
  }
  -[PBSystemGestureHandle acquire](self->_preheatGesture, "acquire");
  -[PBSystemGestureHandle acquire](self->_listenGesture, "acquire");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)enableSiriPresentGesture
{
}

- (void)disableSiriPresentGesture
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversSiriEnabledStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_observers;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "siriManager:didUpdateEnabledState:") & 1) != 0) {
          objc_msgSend(v10, "siriManager:didUpdateEnabledState:", self, v3, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)_notifyObserversVisibleStateDidChange:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_observers;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "siriManager:didUpdateVisibleState:") & 1) != 0) {
          objc_msgSend(v10, "siriManager:didUpdateVisibleState:", self, a3, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)_notifyObserversSiriWindowDidHide
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "siriManagerDidHideSiriWindow:") & 1) != 0) {
          objc_msgSend(v8, "siriManagerDidHideSiriWindow:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyObserversSiriWindowDidUnhide
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "siriManagerDidUnhideSiriWindow:") & 1) != 0) {
          objc_msgSend(v8, "siriManagerDidUnhideSiriWindow:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)_notifyObserversSiriDidUpdatePresenting
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_observers;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "siriManagerDidUpdatePresenting:") & 1) != 0) {
          objc_msgSend(v8, "siriManagerDidUpdatePresenting:", self, (void)v9);
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (BOOL)isSiriEnabled
{
  return self->_siriEnabled;
}

- (int64_t)visibleState
{
  return self->_visibleState;
}

- (PBSiriScreenActionManager)screenActionManager
{
  return self->_screenActionManager;
}

- (PBSystemUIServiceSiriPresentationStatePublishing)siriPresentationStatePublisher
{
  return self->_siriPresentationStatePublisher;
}

- (void)setSiriPresentationStatePublisher:(id)a3
{
}

- (SiriPresentationPineBoardMainScreenViewController)mainScreenSiriPresentation
{
  return self->_mainScreenSiriPresentation;
}

- (void)setMainScreenSiriPresentation:(id)a3
{
}

- (PBSiriScreenActionContextProvider)onScreenActionContextProvider
{
  return self->_onScreenActionContextProvider;
}

- (void)setOnScreenActionContextProvider:(id)a3
{
}

- (BOOL)shouldPreferDictation
{
  return self->_shouldPreferDictation;
}

- (void)setShouldPreferDictation:(BOOL)a3
{
  self->_shouldPreferDictation = a3;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBSiriContentPresentingViewController)siriContainerViewController
{
  return self->_siriContainerViewController;
}

- (NSString)unhideBundleIdentifier
{
  return self->_unhideBundleIdentifier;
}

- (void)setUnhideBundleIdentifier:(id)a3
{
}

- (void)setFullscreenSiriSceneDeactivationAssertion:(id)a3
{
}

- (PBSystemGestureHandle)presentUIGesture
{
  return self->_presentUIGesture;
}

- (PBSystemGestureHandle)preheatGesture
{
  return self->_preheatGesture;
}

- (PBSystemGestureHandle)listenGesture
{
  return self->_listenGesture;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (SiriTVActivationSource)siriActivationSource
{
  return self->_siriActivationSource;
}

- (void)setSiriActivationSource:(id)a3
{
}

- (SiriBluetoothKeyboardActivationSource)keyboardActivationSource
{
  return self->_keyboardActivationSource;
}

- (void)setKeyboardActivationSource:(id)a3
{
}

- (SiriAssertion)siriPreheatAssertion
{
  return self->_siriPreheatAssertion;
}

- (void)setSiriPreheatAssertion:(id)a3
{
}

- (SiriAssertion)siriButtonDownAssertion
{
  return self->_siriButtonDownAssertion;
}

- (void)setSiriButtonDownAssertion:(id)a3
{
}

- (SiriAssertion)siriActivationAssertion
{
  return self->_siriActivationAssertion;
}

- (void)setSiriActivationAssertion:(id)a3
{
}

- (SiriTestingSource)testingSource
{
  return self->_testingSource;
}

- (void)setTestingSource:(id)a3
{
}

- (PBSceneDeferralTargetAssertion)deferralTargetAssertion
{
  return self->_deferralTargetAssertion;
}

- (BSCompoundAssertion)siriSuppressionAssertion
{
  return self->_siriSuppressionAssertion;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (BSTransaction)dismissalTransaction
{
  return self->_dismissalTransaction;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end