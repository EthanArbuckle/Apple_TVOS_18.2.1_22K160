@interface FKAApplicationDelegate
+ (BOOL)isFeatureEnabled;
+ (id)debugFeatureName;
+ (id)featureEnabledStatusDidChangeNotification;
- (AXNotificationObserver)axNotificationObserver;
- (AXSSEventManager)eventManager;
- (AXUIBannerPresenter)bannerPresenter;
- (AXUIBannerPresenter)debugBannerPresenter;
- (BOOL)_areActionsValidForElement:(id)a3;
- (BOOL)_canEnableFocusRingCheckingSystemSleepingState:(BOOL)a3;
- (BOOL)_dismissActionsControllerByForce:(BOOL)a3;
- (BOOL)_sceneVendedByOneness:(id)a3;
- (BOOL)actionManagerCanAvoidRepostingTextInput:(id)a3;
- (BOOL)canMoveApplicationFocusForActionManager:(id)a3;
- (BOOL)dismissHelpForActionManager:(id)a3;
- (BOOL)eventManager:(id)a3 shouldRepostEvent:(id)a4;
- (BOOL)isGesturesModeEnabled;
- (BOOL)isPassthroughModeEnabled;
- (BOOL)isShowingTextEditingModeInstructions;
- (BOOL)shouldIgnoreNextScreenChange;
- (FKAActionManager)actionManager;
- (FKAApplicationDelegate)init;
- (FKACommandsViewController)commandsViewController;
- (FKAEventTap)eventTap;
- (FKARootViewController)nonInteractiveRootViewController;
- (FKARootViewController)rootViewController;
- (FKATypeaheadViewController)typeaheadController;
- (NSDate)lastWakeDeviceDate;
- (NSString)gesturesModeKeyChordsIdentifier;
- (NSTimer)debugDisplayTimer;
- (NSTimer)typeaheadStartTimer;
- (UIWindow)nonInteractiveWindow;
- (id)_fkaDelegateScenes;
- (id)_keyChordForExitingTextMode;
- (id)_notificationsToRegister;
- (id)_sceneDelegateForFocusedElement;
- (id)_sceneDelegates;
- (id)availableCommandsUpdateToken;
- (id)gestureViewController;
- (int)nativeFocusElementDisplayID;
- (void)_addTransientCommandsForGesturesMode;
- (void)_announceCommandList:(id)a3;
- (void)_cancelFocusRingTimeout;
- (void)_didUpdateAvailableCommandsWithUpdatedMap:(id)a3;
- (void)_didUpdateFocusRingTimeout;
- (void)_didUpdateHardwareKeyboardAttachedStatus;
- (void)_disableFocusRing;
- (void)_disableFocusRingForTimeout;
- (void)_dismissTextEditingModeInstructionsIfNeeded;
- (void)_enableFocusRingIfNecessary;
- (void)_enableFocusRingIfNecessaryCheckingSystemSleepingState:(BOOL)a3;
- (void)_enableFocusRingWithTimeout;
- (void)_handleNativeFocusItemChange:(id)a3;
- (void)_handleScreenChange;
- (void)_handleUpdatedElementsForScreenChange:(BOOL)a3;
- (void)_hideTypeaheadNames;
- (void)_hideTypeaheadSynchronously;
- (void)_resetFocusRingTimeout;
- (void)_setupUI;
- (void)_showBannerWithCustomView:(id)a3 isSticky:(BOOL)a4;
- (void)_showBannerWithText:(id)a3;
- (void)_showBannerWithText:(id)a3 andSecondaryText:(id)a4 orCustomView:(id)a5 isSticky:(BOOL)a6 fromUserAction:(BOOL)a7;
- (void)_showBannerWithText:(id)a3 secondaryText:(id)a4 isSticky:(BOOL)a5 fromUserAction:(BOOL)a6;
- (void)_showDebugBannerText:(id)a3;
- (void)_showTypeaheadNames;
- (void)_updateTypeaheadNamesViewControllerItems;
- (void)_updateTypeaheadNamesViewControllerItemsForQueryString:(id)a3;
- (void)_wakeDeviceIfNeeded;
- (void)actionManager:(id)a3 displaySysdiagnoseStatus:(id)a4;
- (void)actionManager:(id)a3 showActionsForElement:(id)a4;
- (void)dealloc;
- (void)didExitTextEditingModeForActionManager:(id)a3;
- (void)didFinishLaunching;
- (void)didMoveToInnerElementForActionManager:(id)a3;
- (void)didReleaseNativeFocus;
- (void)didSuppressCommandForActionManager:(id)a3;
- (void)didToggleNotificationCenterForActionManager:(id)a3;
- (void)enumerateSceneDelegatesWithBlock:(id)a3;
- (void)eventManager:(id)a3 repostEvent:(id)a4;
- (void)eventTap:(id)a3 handleKeyboardEvent:(id)a4;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)setAvailableCommandsUpdateToken:(id)a3;
- (void)setAxNotificationObserver:(id)a3;
- (void)setCommandsViewController:(id)a3;
- (void)setDebugBannerPresenter:(id)a3;
- (void)setDebugDisplayTimer:(id)a3;
- (void)setEventTap:(id)a3;
- (void)setGesturesModeEnabled:(BOOL)a3;
- (void)setGesturesModeKeyChordsIdentifier:(id)a3;
- (void)setIsShowingTextEditingModeInstructions:(BOOL)a3;
- (void)setLastWakeDeviceDate:(id)a3;
- (void)setNativeFocusElementDisplayID:(int)a3;
- (void)setPassthroughModeEnabled:(BOOL)a3;
- (void)setShouldIgnoreNextScreenChange:(BOOL)a3;
- (void)setTypeaheadController:(id)a3;
- (void)setTypeaheadStartTimer:(id)a3;
- (void)showDebugDisplay:(id)a3;
- (void)showDebugDisplayWithKeyChord:(id)a3;
- (void)showHelpForActionManager:(id)a3;
- (void)toggleGesturesModeForActionManager:(id)a3;
- (void)togglePassthroughModeForActionManager:(id)a3;
- (void)toggleTypeaheadForActionManager:(id)a3;
- (void)typeaheadViewController:(id)a3 didChangeQueryString:(id)a4;
- (void)typeaheadViewControllerDidTypeReturn:(id)a3;
- (void)typeaheadViewControllerWillAppear:(id)a3;
- (void)typeaheadViewControllerWillDismiss:(id)a3;
- (void)willAquireNativeFocus;
- (void)willDismissFloatingViewForPresenter:(id)a3;
- (void)willTerminate;
@end

@implementation FKAApplicationDelegate

- (FKAApplicationDelegate)init
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___FKAApplicationDelegate;
  v2 = -[FKAApplicationDelegate init](&v34, "init");
  if (v2)
  {
    +[AXUIElement applyElementAttributeCacheScheme:]( &OBJC_CLASS___AXUIElement,  "applyElementAttributeCacheScheme:",  5LL);
    v3 = objc_opt_new(&OBJC_CLASS___FKAActionManager);
    -[FKAActionManager setDelegate:](v3, "setDelegate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FKAAvailableCommands sharedInstance](&OBJC_CLASS___FKAAvailableCommands, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 commandMap]);

    v6 = -[AXSSEventManager initWithActionManager:commandMap:]( objc_alloc(&OBJC_CLASS___AXSSEventManager),  "initWithActionManager:commandMap:",  v3,  v5);
    eventManager = v2->_eventManager;
    v2->_eventManager = v6;

    -[AXSSEventManager setShouldSuppressCommands:]( v2->_eventManager,  "setShouldSuppressCommands:",  _AXSFullKeyboardAccessFocusRingEnabled(-[AXSSEventManager setFilterDelegate:](v2->_eventManager, "setFilterDelegate:", v2)) == 0);
    -[FKAApplicationDelegate setNativeFocusElementDisplayID:](v2, "setNativeFocusElementDisplayID:", 0xFFFFFFFFLL);
    v8 = objc_alloc(&OBJC_CLASS___AXNotificationObserver);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _notificationsToRegister](v2, "_notificationsToRegister"));
    v10 = -[AXNotificationObserver initWithNotifications:](v8, "initWithNotifications:", v9);

    -[AXNotificationObserver setDelegate:](v10, "setDelegate:", v2);
    -[FKAApplicationDelegate setAxNotificationObserver:](v2, "setAxNotificationObserver:", v10);
    objc_initWeak(&location, v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FKAAvailableCommands sharedInstance](&OBJC_CLASS___FKAAvailableCommands, "sharedInstance"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10000D700;
    v31[3] = &unk_1000208C8;
    objc_copyWeak(&v32, &location);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 registerUpdateBlock:v31]);
    id availableCommandsUpdateToken = v2->_availableCommandsUpdateToken;
    v2->_id availableCommandsUpdateToken = (id)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10000D760;
    v29[3] = &unk_1000208F0;
    objc_copyWeak(&v30, &location);
    [v14 registerUpdateBlock:v29 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeoutEnabled" withListener:v2];

    objc_destroyWeak(&v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000D78C;
    v27[3] = &unk_1000208F0;
    objc_copyWeak(&v28, &location);
    [v15 registerUpdateBlock:v27 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeout" withListener:v2];

    objc_destroyWeak(&v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
    [v16 registerFullKeyboardAccessDaemonPID:getpid()];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10000D7B8,  (CFStringRef)+[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kGSEventHardwareKeyboardAvailabilityChangedNotification),  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v18 = objc_opt_new(&OBJC_CLASS___FKAEventTap);
    -[FKAApplicationDelegate setEventTap:](v2, "setEventTap:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventTap](v2, "eventTap"));
    [v19 setDelegate:v2];

    uint64_t v21 = FKALogCommon(v20);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Enabling focus ring at launch.", v26, 2u);
    }

    uint64_t v23 = FKALogCommon(-[FKAApplicationDelegate _enableFocusRingIfNecessary](v2, "_enableFocusRingIfNecessary"));
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Disabling passthrough mode at launch.", v26, 2u);
    }

    _AXSFullKeyboardAccessSetPassthroughModeEnabled(0LL);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (id)_notificationsToRegister
{
  return &off_100021498;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FKAAvailableCommands sharedInstance](&OBJC_CLASS___FKAAvailableCommands, "sharedInstance"));
  [v3 unregisterUpdateBlockWithToken:self->_availableCommandsUpdateToken];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FKAApplicationDelegate;
  -[FKAApplicationDelegate dealloc](&v4, "dealloc");
}

- (FKAActionManager)actionManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 actionManager]);

  return (FKAActionManager *)v3;
}

- (AXUIBannerPresenter)bannerPresenter
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bannerPresenter]);

  if (!v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___FKABannerPresenter);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
    v7 = -[FKABannerPresenter initWithContainingView:](v5, "initWithContainingView:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    [v8 setBannerPresenter:v7];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bannerPresenter]);
    [v10 setDelegate:self];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bannerPresenter]);

  return (AXUIBannerPresenter *)v12;
}

- (void)setShouldIgnoreNextScreenChange:(BOOL)a3
{
  if (self->_shouldIgnoreNextScreenChange != a3)
  {
    BOOL v3 = a3;
    self->_shouldIgnoreNextScreenChange = a3;
    uint64_t v4 = FKALogCommon();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        __int16 v10 = 0;
        v7 = "Ignoring next screen change.";
        v8 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
      }
    }

    else if (v6)
    {
      __int16 v9 = 0;
      v7 = "Stopped ignoring screen changes.";
      v8 = (uint8_t *)&v9;
      goto LABEL_7;
    }
  }

+ (id)debugFeatureName
{
  return @"Full Keyboard Access";
}

+ (BOOL)isFeatureEnabled
{
  return _AXSFullKeyboardAccessEnabled(a1, a2) != 0;
}

+ (id)featureEnabledStatusDidChangeNotification
{
  return kAXSFullKeyboardAccessEnabledNotification;
}

- (void)didFinishLaunching
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
  +[FKAActionManager _accessibilityPerformValidations:]( &OBJC_CLASS___FKAActionManager,  "_accessibilityPerformValidations:",  v3);
}

- (void)_setupUI
{
  BOOL v3 = (void *)objc_opt_new(&OBJC_CLASS___AXUIDaemonWindow);
  -[FKAApplicationDelegate setWindow:](self, "setWindow:", v3);

  uint64_t v4 = -[FKARootViewController initWithDelegate:displayUUID:]( objc_alloc(&OBJC_CLASS___FKARootViewController),  "initWithDelegate:displayUUID:",  self,  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate window](self, "window"));
  [v5 setRootViewController:v4];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate window](self, "window"));
  [v6 makeKeyAndVisible];

  v7 = (UIWindow *)objc_opt_new(&OBJC_CLASS___AXUIDaemonNonInteractiveWindow);
  nonInteractiveWindow = self->_nonInteractiveWindow;
  self->_nonInteractiveWindow = v7;

  __int16 v9 = -[FKARootViewController initWithDelegate:displayUUID:]( objc_alloc(&OBJC_CLASS___FKARootNonInteractiveViewController),  "initWithDelegate:displayUUID:",  self,  0LL);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
  [v10 setRootViewController:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
  [v11 setWindowLevel:UIWindowLevelNormal + 1.0];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
  [v12 setHidden:0];
}

- (void)willTerminate
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Disabling focus ring on termination.", v5, 2u);
  }

  -[FKAApplicationDelegate _disableFocusRing](self, "_disableFocusRing");
}

- (void)eventTap:(id)a3 handleKeyboardEvent:(id)a4
{
  id v16 = a4;
  if ([v16 isDownEvent]
    && !-[FKAApplicationDelegate isShowingTextEditingModeInstructions](self, "isShowingTextEditingModeInstructions"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate bannerPresenter](self, "bannerPresenter"));
    [v5 dismissFloatingView];
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  unsigned int v7 = [v6 processKeyboardEvent:v16];

  if (v7)
  {
    int v9 = _AXSFullKeyboardAccessFocusRingEnabled(v8);
    __int16 v10 = v16;
    if (v9)
    {
      else {
        -[FKAApplicationDelegate _resetFocusRingTimeout](self, "_resetFocusRingTimeout");
      }
      goto LABEL_16;
    }
  }

  else
  {
    if ([v16 isDownEvent])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventTap](self, "eventTap"));
      [v11 repostDownAndUpForKeyboardEvent:v16];
    }

    unsigned int v12 = [v16 isDownEvent];
    __int16 v10 = v16;
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v16 unicodeCharacter]);
      if ([v13 length])
      {
        unint64_t v14 = (unint64_t)[v16 modifierMask] & 0xFFFFFFFFFFFFFFF7;

        __int16 v10 = v16;
        if (v14) {
          goto LABEL_17;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
        [v15 didPerformTextInput];
      }

      else
      {
      }

- (id)gestureViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 gestureViewController]);

  return v3;
}

- (void)actionManager:(id)a3 showActionsForElement:(id)a4
{
  BOOL v5 = -[FKAApplicationDelegate _dismissActionsControllerByForce:](self, "_dismissActionsControllerByForce:", 1LL, a4);
  if (v5)
  {
    uint64_t v6 = FKALogCommon(v5);
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to show actions, but they were already showing. Dismissing instead.",  buf,  2u);
    }
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"NO_ACTIONS" value:&stru_100020B80 table:0]);
    -[FKAApplicationDelegate _showBannerWithText:](self, "_showBannerWithText:", v8);
  }

- (void)toggleTypeaheadForActionManager:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController", a3));

  if (!v4)
  {
    BOOL v5 = objc_opt_new(&OBJC_CLASS___FKATypeaheadViewController);
    -[FKAApplicationDelegate setTypeaheadController:](self, "setTypeaheadController:", v5);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
    [v6 setDelegate:self];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
    [v7 showChildViewController:v8 animated:0];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
  if ([v9 state])
  {
  }

  else
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 presentedViewController]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___FKAActionsController);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) != 0)
    {
      -[FKAApplicationDelegate setShouldIgnoreNextScreenChange:](self, "setShouldIgnoreNextScreenChange:", 1LL);
      -[FKAApplicationDelegate _dismissActionsControllerByForce:](self, "_dismissActionsControllerByForce:", 1LL);
    }
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
  [v14 toggleTypeaheadState];
}

- (void)_hideTypeaheadSynchronously
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
  id v4 = [v3 state];

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
    [v5 setState:0];

    for (double i = 0.0; ; double i = i + 0.05)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplication]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleId]);
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
      unsigned int v12 = [v9 isEqualToString:v11];

      if (!v12 || i >= 1.0) {
        break;
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.05));
      [v14 runUntilDate:v15];
    }
  }

- (void)toggleGesturesModeForActionManager:(id)a3
{
}

- (void)togglePassthroughModeForActionManager:(id)a3
{
}

- (void)actionManager:(id)a3 displaySysdiagnoseStatus:(id)a4
{
}

- (void)showHelpForActionManager:(id)a3
{
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___FKACommandsViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  unsigned int v5 = [v4 isInTextEditingMode];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _keyChordForExitingTextMode](self, "_keyChordForExitingTextMode"));
    -[FKACommandsViewController setTextEditingModeExitKeyChord:](v8, "setTextEditingModeExitKeyChord:", v6);
  }

  -[FKACommandsViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 5LL);
  -[FKAApplicationDelegate setShouldIgnoreNextScreenChange:](self, "setShouldIgnoreNextScreenChange:", 1LL);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  [v7 presentViewController:v8 withTransition:6 completion:0];

  -[FKAApplicationDelegate setCommandsViewController:](self, "setCommandsViewController:", v8);
}

- (void)showDebugDisplay:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 commandMap]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  v4));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v8 keyChordForCommand:v6]);
  -[FKAApplicationDelegate showDebugDisplayWithKeyChord:](self, "showDebugDisplayWithKeyChord:", v7);
}

- (void)showDebugDisplayWithKeyChord:(id)a3
{
  id v7 = a3;
  if (AXIsInternalInstall())
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v5 = [v4 fullKeyboardAccessShouldShowDebugKeyCommandsView];

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 fkaSpeakableDisplayValue]);
      -[FKAApplicationDelegate _showDebugBannerText:](self, "_showDebugBannerText:", v6);
    }
  }
}

- (BOOL)dismissHelpForActionManager:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate commandsViewController](self, "commandsViewController", a3));

  if (v4)
  {
    -[FKAApplicationDelegate setShouldIgnoreNextScreenChange:](self, "setShouldIgnoreNextScreenChange:", 1LL);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    [v5 dismissViewControllerWithTransition:6 completion:0];

    -[FKAApplicationDelegate setCommandsViewController:](self, "setCommandsViewController:", 0LL);
  }

  return v4 != 0LL;
}

- (void)_wakeDeviceIfNeeded
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate lastWakeDeviceDate](self, "lastWakeDeviceDate"));
  if (!v3
    || (id v4 = (void *)v3,
        unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate lastWakeDeviceDate](self, "lastWakeDeviceDate")),
        [v9 timeIntervalSinceDate:v5],
        double v7 = v6,
        v5,
        v4,
        v7 > 0.3))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
    [v8 wakeUpDeviceIfNecessary];

    -[FKAApplicationDelegate setLastWakeDeviceDate:](self, "setLastWakeDeviceDate:", v9);
  }
}

- (BOOL)actionManagerCanAvoidRepostingTextInput:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController", a3));
  BOOL v4 = [v3 state] == 0;

  return v4;
}

- (void)didSuppressCommandForActionManager:(id)a3
{
}

- (BOOL)canMoveApplicationFocusForActionManager:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController", a3));
  char v4 = [v3 isOverridingNativeFocus] ^ 1;

  return v4;
}

- (void)didToggleNotificationCenterForActionManager:(id)a3
{
  uint64_t v4 = FKALogCommon(self);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Notification center toggled. Hiding UI as needed.",  v6,  2u);
  }

  -[FKAApplicationDelegate _handleUpdatedElementsForScreenChange:](self, "_handleUpdatedElementsForScreenChange:", 1LL);
}

- (void)didExitTextEditingModeForActionManager:(id)a3
{
}

- (void)didMoveToInnerElementForActionManager:(id)a3
{
  BOOL v3 = -[FKAApplicationDelegate isShowingTextEditingModeInstructions](self, "isShowingTextEditingModeInstructions", a3);
  if (v3)
  {
    uint64_t v4 = FKALogCommon(v3);
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User no longer requires text editing mode instructions.",  v7,  2u);
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 setFullKeyboardAccessShouldShowTextEditingModeInstructions:0];
  }

- (void)typeaheadViewController:(id)a3 didChangeQueryString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadStartTimer](self, "typeaheadStartTimer"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadStartTimer](self, "typeaheadStartTimer"));
    [v9 invalidate];

    -[FKAApplicationDelegate setTypeaheadStartTimer:](self, "setTypeaheadStartTimer:", 0LL);
  }

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000E7C0;
  v12[3] = &unk_100020918;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v12,  0.15));
  -[FKAApplicationDelegate setTypeaheadStartTimer:](self, "setTypeaheadStartTimer:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)typeaheadViewControllerWillAppear:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  [v4 updateRequiresNativeFocus];
}

- (void)typeaheadViewControllerWillDismiss:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  [v4 focusOnSceneForTypeahead];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  [v5 updateRequiresNativeFocus];
}

- (void)typeaheadViewControllerDidTypeReturn:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  [v4 performDefaultAction];
}

- (void)_showTypeaheadNames
{
}

- (void)_hideTypeaheadNames
{
}

- (void)_updateTypeaheadNamesViewControllerItems
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate typeaheadController](self, "typeaheadController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 queryString]);
  -[FKAApplicationDelegate _updateTypeaheadNamesViewControllerItemsForQueryString:]( self,  "_updateTypeaheadNamesViewControllerItemsForQueryString:",  v3);
}

- (void)_updateTypeaheadNamesViewControllerItemsForQueryString:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EB24;
  v5[3] = &unk_1000209A0;
  id v6 = a3;
  id v4 = v6;
  -[FKAApplicationDelegate enumerateSceneDelegatesWithBlock:](self, "enumerateSceneDelegatesWithBlock:", v5);
}

- (void)willDismissFloatingViewForPresenter:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate bannerPresenter](self, "bannerPresenter"));
  if (v5 == v4)
  {
    unsigned int v6 = -[FKAApplicationDelegate isShowingTextEditingModeInstructions](self, "isShowingTextEditingModeInstructions");

    if (v6)
    {
      uint64_t v8 = FKALogCommon(v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Another banner caused text editing mode instructions to dismiss.",  v10,  2u);
      }

      -[FKAApplicationDelegate setIsShowingTextEditingModeInstructions:]( self,  "setIsShowingTextEditingModeInstructions:",  0LL);
    }
  }

  else
  {
  }
}

- (BOOL)eventManager:(id)a3 shouldRepostEvent:(id)a4
{
  id v5 = a4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
  unsigned int v8 = [v6 shouldRepostForKeyChord:v7];

  if (-[FKAApplicationDelegate isGesturesModeEnabled](self, "isGesturesModeEnabled"))
  {
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
      if (([v9 isArrowKeyChord] & 1) == 0)
      {

        goto LABEL_9;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
      unsigned __int8 v11 = [v10 containsModifier];

      if ((v11 & 1) != 0)
      {
LABEL_9:
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
        if ([v16 isTextInputTabChord])
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          if (([v17 fullKeyboardAccessShouldShowTextEditingModeInstructions] & 1) == 0)
          {
LABEL_17:

            goto LABEL_18;
          }

          unsigned int v18 = -[FKAApplicationDelegate _canEnableFocusRingCheckingSystemSleepingState:]( self,  "_canEnableFocusRingCheckingSystemSleepingState:",  1LL);

          if (!v18
            || -[FKAApplicationDelegate isShowingTextEditingModeInstructions]( self,  "isShowingTextEditingModeInstructions"))
          {
LABEL_19:
            v25 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
            if ([v25 isArrowKeyChord])
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
              unsigned __int8 v27 = [v26 containsModifier];

              if ((v27 & 1) != 0)
              {
LABEL_23:
                BOOL v15 = 1;
                goto LABEL_24;
              }

              v25 = (void *)objc_claimAutoreleasedReturnValue([v5 keyChord]);
              -[FKAApplicationDelegate showDebugDisplayWithKeyChord:](self, "showDebugDisplayWithKeyChord:", v25);
            }

            goto LABEL_23;
          }

          uint64_t v19 = objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _keyChordForExitingTextMode](self, "_keyChordForExitingTextMode"));
          id v16 = (void *)v19;
          if (v19)
          {
            uint64_t v20 = FKALogCommon(v19);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Showing instructions for text editing mode.",  buf,  2u);
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fkaSpeakableDisplayValue]);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_MESSAGE" value:&stru_100020B80 table:0]);
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v23,  v17));

            -[FKAApplicationDelegate _showBannerWithText:secondaryText:isSticky:fromUserAction:]( self,  "_showBannerWithText:secondaryText:isSticky:fromUserAction:",  v24,  0LL,  1LL,  0LL);
            -[FKAApplicationDelegate setIsShowingTextEditingModeInstructions:]( self,  "setIsShowingTextEditingModeInstructions:",  1LL);
            -[FKAApplicationDelegate _enableFocusRingWithTimeout](self, "_enableFocusRingWithTimeout");

            goto LABEL_17;
          }
        }

- (void)eventManager:(id)a3 repostEvent:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventTap](self, "eventTap"));
  [v6 repostDownAndUpForKeyboardEvent:v5];
}

- (void)_didUpdateHardwareKeyboardAttachedStatus
{
  uint64_t v3 = FKALogCommon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Hardware availability changed.", v5, 2u);
  }

  -[FKAApplicationDelegate _enableFocusRingIfNecessary](self, "_enableFocusRingIfNecessary");
}

- (UIWindow)nonInteractiveWindow
{
  if (+[FKAApplication usesScenes](&OBJC_CLASS___FKAApplication, "usesScenes"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _sceneDelegateForFocusedElement](self, "_sceneDelegateForFocusedElement"));
    id v4 = (UIWindow *)objc_claimAutoreleasedReturnValue([v3 nonInteractiveWindow]);
  }

  else
  {
    id v4 = self->_nonInteractiveWindow;
  }

  return v4;
}

- (id)_fkaDelegateScenes
{
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectedScenes]);

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIWindowScene);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___FKASceneDelegate);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            unsigned __int8 v13 = -[FKAApplicationDelegate _sceneVendedByOneness:](self, "_sceneVendedByOneness:", v9);

            if ((v13 & 1) == 0) {
              [v15 addObject:v9];
            }
          }

          else
          {
          }
        }

        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  return v15;
}

- (id)_sceneDelegateForFocusedElement
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _fkaDelegateScenes](self, "_fkaDelegateScenes"));
  if ([v3 count] == (id)1)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  }

  else
  {
    id v5 = (id)-[FKAApplicationDelegate nativeFocusElementDisplayID](self, "nativeFocusElementDisplayID");
    if ((_DWORD)v5 == -1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentElement]);
      id v5 = [v7 windowDisplayId];
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = v3;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      unsigned __int8 v27 = v3;
      uint64_t v10 = *(void *)v31;
      uint64_t v11 = UIWindowSceneSessionRoleApplication;
      while (2)
      {
        uint64_t v12 = 0LL;
        id v28 = v9;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 session]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 role]);
          if ([v15 isEqualToString:v11])
          {
            uint64_t v16 = v11;
            uint64_t v17 = v10;
            id v18 = v5;
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 screen]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
            unsigned __int8 v21 = [v19 isEqual:v20];

            id v5 = v18;
            uint64_t v10 = v17;
            uint64_t v11 = v16;
            id v9 = v28;

            if ((v21 & 1) != 0) {
              goto LABEL_18;
            }
          }

          else
          {
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 screen]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 displayIdentity]);
          unsigned int v24 = [v23 displayID];

          if (v24 == (_DWORD)v5)
          {
LABEL_18:
            id v4 = v13;
            goto LABEL_19;
          }

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      id v4 = 0LL;
LABEL_19:
      uint64_t v3 = v27;
    }

    else
    {
      id v4 = 0LL;
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);

  return v25;
}

- (id)_sceneDelegates
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectedScenes]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F514;
  v8[3] = &unk_1000209C8;
  v8[4] = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ax_flatMappedArrayUsingBlock:", v8));

  return v6;
}

- (void)enumerateSceneDelegatesWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _sceneDelegates](self, "_sceneDelegates"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F654;
  v7[3] = &unk_1000209F0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (BOOL)_sceneVendedByOneness:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 screen]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayIdentity]);
  BOOL v5 = [v4 type] == (id)8;

  return v5;
}

- (FKARootViewController)rootViewController
{
  if (+[FKAApplication usesScenes](&OBJC_CLASS___FKAApplication, "usesScenes"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _sceneDelegateForFocusedElement](self, "_sceneDelegateForFocusedElement"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 interactiveWindow]);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate window](self, "window"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);
  }

  return (FKARootViewController *)v5;
}

- (FKARootViewController)nonInteractiveRootViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  return (FKARootViewController *)v3;
}

- (void)_showBannerWithText:(id)a3
{
}

- (void)_showBannerWithText:(id)a3 secondaryText:(id)a4 isSticky:(BOOL)a5 fromUserAction:(BOOL)a6
{
}

- (void)_showBannerWithCustomView:(id)a3 isSticky:(BOOL)a4
{
}

- (void)_showBannerWithText:(id)a3 andSecondaryText:(id)a4 orCustomView:(id)a5 isSticky:(BOOL)a6 fromUserAction:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (v8) {
    double v15 = 0.0;
  }
  else {
    double v15 = 2.0;
  }
  if (v13)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate bannerPresenter](self, "bannerPresenter"));
    [v16 presentCustomView:v14 duration:v15];
  }

  else
  {
    UIAccessibilityNotifications v17 = UIAccessibilityAnnouncementNotification;
    uint64_t v18 = __UIAXStringForVariables(v20);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    UIAccessibilityPostNotification(v17, v19);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate bannerPresenter](self, "bannerPresenter"));
    [v16 presentBannerViewWithText:v20 secondaryText:v12 duration:v7 fromUserAction:v15];
  }
}

- (void)_showDebugBannerText:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate debugBannerPresenter](self, "debugBannerPresenter"));

  if (!v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___AXUIBannerPresenter);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate nonInteractiveWindow](self, "nonInteractiveWindow"));
    BOOL v8 = -[AXUIBannerPresenter initWithContainingView:](v6, "initWithContainingView:", v7);
    -[FKAApplicationDelegate setDebugBannerPresenter:](self, "setDebugBannerPresenter:", v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate debugBannerPresenter](self, "debugBannerPresenter"));
  [v9 presentBannerViewWithText:v4 secondaryText:0 duration:1 fromUserAction:2.0];
}

- (void)_addTransientCommandsForGesturesMode
{
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000214B0));
  v38[0] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierPressAndLift));
  v39[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000214C8));
  v38[1] = v35;
  objc_super v34 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTwoFingerPressAndLift));
  v39[1] = v34;
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000214E0));
  v38[2] = v33;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierSwipeLeft));
  v39[2] = v31;
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000214F8));
  v38[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierSwipeRight));
  v39[3] = v29;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021510));
  v38[4] = v28;
  unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierSwipeUp));
  v39[4] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021528));
  v38[5] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierSwipeDown));
  v39[5] = v25;
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021540));
  v38[6] = v24;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTwoFingerSwipeLeft));
  v39[6] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021558));
  v38[7] = v22;
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTwoFingerSwipeRight));
  v39[7] = v21;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021570));
  v38[8] = v20;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTwoFingerSwipeUp));
  v39[8] = v19;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021588));
  v38[9] = v18;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTwoFingerSwipeDown));
  v39[9] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000215A0));
  v38[10] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierRotateLeft));
  v39[10] = v4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000215B8));
  v38[11] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierRotateRight));
  v39[11] = v6;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000215D0));
  v38[12] = v7;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierPinchOut));
  v39[12] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_1000215E8));
  v38[13] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierPinchIn));
  v39[13] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  14LL));

  if (-[FKAApplicationDelegate _canPerform3DTouchCommand](self, "_canPerform3DTouchCommand"))
  {
    id v12 = [v11 mutableCopy];
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifier3DTouch));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSKeyChord keyChordWithKeys:](&OBJC_CLASS___AXSSKeyChord, "keyChordWithKeys:", &off_100021600));
    [v12 setObject:v13 forKeyedSubscript:v14];

    uint64_t v11 = v12;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 commandMap]);
  UIAccessibilityNotifications v17 = (void *)objc_claimAutoreleasedReturnValue([v16 addCommandsForTransientKeyChords:v11]);
  -[FKAApplicationDelegate setGesturesModeKeyChordsIdentifier:](self, "setGesturesModeKeyChordsIdentifier:", v17);
}

- (void)setGesturesModeEnabled:(BOOL)a3
{
  if (self->_gesturesModeEnabled != a3)
  {
    self->_gesturesModeEnabled = a3;
    if (a3)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue( [v48 localizedStringForKey:@"GESTURES_TAP" value:&stru_100020B80 table:0]);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v45 = (void *)objc_claimAutoreleasedReturnValue( [v47 localizedStringForKey:@"GESTURES_TAP_COMMAND" value:&stru_100020B80 table:0]);
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v46,  v45));
      v50[0] = v44;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"GESTURES_SWIPE" value:&stru_100020B80 table:0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"GESTURES_SWIPE_COMMAND" value:&stru_100020B80 table:0]);
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v41,  v40));
      v50[1] = v39;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue( [v38 localizedStringForKey:@"GESTURES_ZOOM" value:&stru_100020B80 table:0]);
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"GESTURES_ZOOM_COMMAND" value:&stru_100020B80 table:0]);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v4,  v6));
      v50[2] = v7;
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"GESTURES_ROTATE" value:&stru_100020B80 table:0]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"GESTURES_ROTATE_COMMAND" value:&stru_100020B80 table:0]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v9,  v11));
      v50[3] = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 4LL));

      if (-[FKAApplicationDelegate _canPerform3DTouchCommand](self, "_canPerform3DTouchCommand"))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"GESTURES_3DTOUCH" value:&stru_100020B80 table:0]);
        double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"GESTURES_3DTOUCH_COMMAND" value:&stru_100020B80 table:0]);
        UIAccessibilityNotifications v17 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v14,  v16));
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v37 arrayByAddingObject:v17]);

        __int128 v19 = (void *)v18;
      }

      else
      {
        __int128 v19 = v37;
      }

      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", v37));
      id v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"GESTURES_HEADER" value:&stru_100020B80 table:0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"GESTURES_TWO_FINGERS" value:&stru_100020B80 table:0]);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandList listWithTitle:items:footerText:]( &OBJC_CLASS___FKACommandList,  "listWithTitle:items:footerText:",  v28,  v19,  v30));

      __int128 v32 = objc_alloc(&OBJC_CLASS___FKACommandsView);
      v49 = v31;
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
      objc_super v34 = -[FKACommandsView initWithCommandLists:](v32, "initWithCommandLists:", v33);

      -[FKAApplicationDelegate _announceCommandList:](self, "_announceCommandList:", v31);
      -[FKAApplicationDelegate _showBannerWithCustomView:isSticky:]( self,  "_showBannerWithCustomView:isSticky:",  v34,  1LL);

      -[FKAApplicationDelegate _addTransientCommandsForGesturesMode](self, "_addTransientCommandsForGesturesMode");
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"GESTURES_DISABLED" value:&stru_100020B80 table:0]);
      -[FKAApplicationDelegate _showBannerWithText:](self, "_showBannerWithText:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate gesturesModeKeyChordsIdentifier](self, "gesturesModeKeyChordsIdentifier"));
      if (v22)
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 commandMap]);
        v26 = (void *)objc_claimAutoreleasedReturnValue( -[FKAApplicationDelegate gesturesModeKeyChordsIdentifier]( self,  "gesturesModeKeyChordsIdentifier"));
        [v25 removeTransientKeyChordsForIdentifier:v26];

        -[FKAApplicationDelegate setGesturesModeKeyChordsIdentifier:](self, "setGesturesModeKeyChordsIdentifier:", 0LL);
      }

      else
      {
        uint64_t v35 = FKALogCommon(v23);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          sub_1000119AC(v36);
        }
      }
    }
  }

- (void)setPassthroughModeEnabled:(BOOL)a3
{
  if (self->_passthroughModeEnabled != a3)
  {
    BOOL v3 = a3;
    self->_passthroughModeEnabled = a3;
    uint64_t v5 = FKALogCommon(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Enabled passthrough mode", buf, 2u);
      }

      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
      [v8 setPassthroughModeEnabled:1];

      _AXSFullKeyboardAccessSetPassthroughModeEnabled(1LL);
      _AXSFullKeyboardAccessSetFocusRingEnabled(0LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 commandMap]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierTogglePassthroughMode));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 keyChordForCommand:v11]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fkaSpeakableDisplayValue]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"PASSTHROUGH_MODE" value:&stru_100020B80 table:0]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v15,  v13));
      -[FKAApplicationDelegate _showBannerWithText:](self, "_showBannerWithText:", v16);
    }

    else
    {
      if (v7)
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Disabled passthrough mode", v18, 2u);
      }

      UIAccessibilityNotifications v17 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
      [v17 setPassthroughModeEnabled:0];

      _AXSFullKeyboardAccessSetPassthroughModeEnabled(0LL);
      -[FKAApplicationDelegate _enableFocusRingWithTimeout](self, "_enableFocusRingWithTimeout");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"PASSTHROUGH_MODE_DISABLED" value:&stru_100020B80 table:0]);
      -[FKAApplicationDelegate _showBannerWithText:](self, "_showBannerWithText:", v11);
    }
  }

- (BOOL)_areActionsValidForElement:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 uiElement]);
  [v3 updateCache:2204];
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2204];

  return v4;
}

- (BOOL)_dismissActionsControllerByForce:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 presentedViewController]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___FKAActionsController);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 presentedViewController]);

  if (a3
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 element]),
        unsigned __int8 v12 = -[FKAApplicationDelegate _areActionsValidForElement:](self, "_areActionsValidForElement:", v11),
        v11,
        (v12 & 1) == 0))
  {
    BOOL v13 = 1;
    -[FKAApplicationDelegate setShouldIgnoreNextScreenChange:](self, "setShouldIgnoreNextScreenChange:", 1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate rootViewController](self, "rootViewController"));
    [v14 dismissViewControllerAnimated:1 completion:0];
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_handleUpdatedElementsForScreenChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    -[FKAApplicationDelegate _hideTypeaheadSynchronously](self, "_hideTypeaheadSynchronously");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
    [v5 didObserveScreenChange];
  }

  else
  {
    -[FKAApplicationDelegate _updateTypeaheadNamesViewControllerItems](self, "_updateTypeaheadNamesViewControllerItems");
  }

  -[FKAApplicationDelegate _dismissActionsControllerByForce:](self, "_dismissActionsControllerByForce:", v3);
}

- (void)_handleScreenChange
{
  if (-[FKAApplicationDelegate shouldIgnoreNextScreenChange](self, "shouldIgnoreNextScreenChange")) {
    -[FKAApplicationDelegate setShouldIgnoreNextScreenChange:](self, "setShouldIgnoreNextScreenChange:", 0LL);
  }
  else {
    -[FKAApplicationDelegate _handleUpdatedElementsForScreenChange:]( self,  "_handleUpdatedElementsForScreenChange:",  1LL);
  }
}

- (void)_handleNativeFocusItemChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = [v4 objectForKey:@"element"];
      if (v6)
      {
        id v7 = v6;
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate _fkaDelegateScenes](self, "_fkaDelegateScenes"));
        if ((unint64_t)[v8 count] >= 2)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithAXUIElement:](&OBJC_CLASS___AXElement, "elementWithAXUIElement:", v7));
          uint64_t v10 = FKALogCommon( -[FKAApplicationDelegate setNativeFocusElementDisplayID:]( self,  "setNativeFocusElementDisplayID:",  [v9 windowDisplayId]));
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[FKAApplicationDelegate nativeFocusElementDisplayID](self, "nativeFocusElementDisplayID")));
            int v13 = 138412290;
            id v14 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Caching display id for native element: %@",  (uint8_t *)&v13,  0xCu);
          }
        }
      }
    }
  }
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4 > 1017)
  {
    if (a4 <= 1052)
    {
      if (a4 != 1018)
      {
        if (a4 == 1039)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          unsigned __int8 v11 = [v10 fullKeyboardAccessFocusRingTimeoutEnabled];

          if ((v11 & 1) != 0) {
            goto LABEL_22;
          }
LABEL_15:
          -[FKAApplicationDelegate _enableFocusRingIfNecessary](self, "_enableFocusRingIfNecessary");
          goto LABEL_22;
        }

        goto LABEL_19;
      }

- (void)_enableFocusRingIfNecessaryCheckingSystemSleepingState:(BOOL)a3
{
  if (-[FKAApplicationDelegate _canEnableFocusRingCheckingSystemSleepingState:]( self,  "_canEnableFocusRingCheckingSystemSleepingState:",  a3))
  {
    -[FKAApplicationDelegate _enableFocusRingWithTimeout](self, "_enableFocusRingWithTimeout");
  }

  else
  {
    -[FKAApplicationDelegate _disableFocusRing](self, "_disableFocusRing");
  }

- (void)_enableFocusRingIfNecessary
{
}

- (void)_enableFocusRingWithTimeout
{
  if (!_AXSFullKeyboardAccessFocusRingEnabled(self))
  {
    _AXSFullKeyboardAccessSetFocusRingEnabled(1LL);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
    [v3 setShouldSuppressCommands:0];
  }

  -[FKAApplicationDelegate _resetFocusRingTimeout](self, "_resetFocusRingTimeout");
}

- (void)_disableFocusRing
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  [v3 setShouldSuppressCommands:1];
}

- (void)_disableFocusRingForTimeout
{
  uint64_t v3 = FKALogCommon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Disabling focus ring for timeout.", v5, 2u);
  }

  -[FKAApplicationDelegate _disableFocusRing](self, "_disableFocusRing");
}

- (void)_resetFocusRingTimeout
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 fullKeyboardAccessFocusRingTimeoutEnabled]
    && !-[FKAApplicationDelegate isShowingTextEditingModeInstructions](self, "isShowingTextEditingModeInstructions"))
  {
    [v3 fullKeyboardAccessFocusRingTimeout];
    -[FKAApplicationDelegate performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_disableFocusRingForTimeout",  0LL);
  }
}

- (void)_cancelFocusRingTimeout
{
}

- (BOOL)_canEnableFocusRingCheckingSystemSleepingState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached(self, a2);
  if (!(_DWORD)IsHardwareKeyboardAttached)
  {
    uint64_t IsHardwareKeyboardAttached = _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation();
    if (!(_DWORD)IsHardwareKeyboardAttached)
    {
      uint64_t v17 = FKALogCommon(IsHardwareKeyboardAttached);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v22 = 0;
        unsigned __int8 v11 = "Cannot enable focus ring: hardware keyboard not attached, and not using simulated keyboard.";
        uint64_t v12 = v22;
        goto LABEL_14;
      }

- (void)_didUpdateAvailableCommandsWithUpdatedMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FKALogCommon(v4);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did update available commands.", v8, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  [v7 setCommandMap:v4];

  if (-[FKAApplicationDelegate isGesturesModeEnabled](self, "isGesturesModeEnabled")) {
    -[FKAApplicationDelegate _addTransientCommandsForGesturesMode](self, "_addTransientCommandsForGesturesMode");
  }
}

- (void)_didUpdateFocusRingTimeout
{
  uint64_t v3 = FKALogCommon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Did update focus ring timeout.", v5, 2u);
  }

  -[FKAApplicationDelegate _enableFocusRingIfNecessary](self, "_enableFocusRingIfNecessary");
  -[FKAApplicationDelegate _resetFocusRingTimeout](self, "_resetFocusRingTimeout");
}

- (id)_keyChordForExitingTextMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate eventManager](self, "eventManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 commandMap]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:]( &OBJC_CLASS___AXSSKeyboardCommand,  "commandWithStandardCommandIdentifier:",  AXSSKeyboardCommandIdentifierMoveInsideNext));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 keyChordForCommand:v4]);
  unsigned __int8 v6 = v5;
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_dismissTextEditingModeInstructionsIfNeeded
{
  BOOL v3 = -[FKAApplicationDelegate isShowingTextEditingModeInstructions](self, "isShowingTextEditingModeInstructions");
  if (v3)
  {
    uint64_t v4 = FKALogCommon(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Dismissing text editing mode instructions.",  v7,  2u);
    }

    -[FKAApplicationDelegate setIsShowingTextEditingModeInstructions:]( self,  "setIsShowingTextEditingModeInstructions:",  0LL);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate bannerPresenter](self, "bannerPresenter"));
    [v6 dismissFloatingView];
  }

- (void)_announceCommandList:(id)a3
{
  id v3 = a3;
  if (_AXFeatureSupportsNonSightedUsage())
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        id v9 = 0LL;
        BOOL v10 = v4;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v9);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name", v16, v18, v19));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 keyDescription]);
          __int16 v19 = @"__AXStringForVariablesSentinel";
          uint64_t v16 = v12;
          uint64_t v13 = __UIAXStringForVariables(v10);
          uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v13);

          id v9 = (char *)v9 + 1;
          BOOL v10 = v4;
        }

        while (v7 != v9);
        id v7 = objc_msgSend( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16,  v12,  v18,  @"__AXStringForVariablesSentinel");
      }

      while (v7);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 footerText]);
    uint64_t v14 = __UIAXStringForVariables(v4);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v15);
  }
}

- (void)willAquireNativeFocus
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 currentElement]);
  [v2 performAction:5501 withValue:0];
}

- (void)didReleaseNativeFocus
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAApplicationDelegate actionManager](self, "actionManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 currentElement]);
  [v2 performAction:5500 withValue:0];
}

- (FKAEventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
}

- (AXSSEventManager)eventManager
{
  return self->_eventManager;
}

- (FKATypeaheadViewController)typeaheadController
{
  return self->_typeaheadController;
}

- (void)setTypeaheadController:(id)a3
{
}

- (FKACommandsViewController)commandsViewController
{
  return self->_commandsViewController;
}

- (void)setCommandsViewController:(id)a3
{
}

- (AXUIBannerPresenter)debugBannerPresenter
{
  return self->_debugBannerPresenter;
}

- (void)setDebugBannerPresenter:(id)a3
{
}

- (BOOL)isGesturesModeEnabled
{
  return self->_gesturesModeEnabled;
}

- (BOOL)isPassthroughModeEnabled
{
  return self->_passthroughModeEnabled;
}

- (NSString)gesturesModeKeyChordsIdentifier
{
  return self->_gesturesModeKeyChordsIdentifier;
}

- (void)setGesturesModeKeyChordsIdentifier:(id)a3
{
}

- (AXNotificationObserver)axNotificationObserver
{
  return self->_axNotificationObserver;
}

- (void)setAxNotificationObserver:(id)a3
{
}

- (id)availableCommandsUpdateToken
{
  return self->_availableCommandsUpdateToken;
}

- (void)setAvailableCommandsUpdateToken:(id)a3
{
}

- (NSDate)lastWakeDeviceDate
{
  return self->_lastWakeDeviceDate;
}

- (void)setLastWakeDeviceDate:(id)a3
{
}

- (BOOL)shouldIgnoreNextScreenChange
{
  return self->_shouldIgnoreNextScreenChange;
}

- (BOOL)isShowingTextEditingModeInstructions
{
  return self->_isShowingTextEditingModeInstructions;
}

- (void)setIsShowingTextEditingModeInstructions:(BOOL)a3
{
  self->_isShowingTextEditingModeInstructions = a3;
}

- (int)nativeFocusElementDisplayID
{
  return self->_nativeFocusElementDisplayID;
}

- (void)setNativeFocusElementDisplayID:(int)a3
{
  self->_nativeFocusElementDisplayID = a3;
}

- (NSTimer)typeaheadStartTimer
{
  return self->_typeaheadStartTimer;
}

- (void)setTypeaheadStartTimer:(id)a3
{
}

- (NSTimer)debugDisplayTimer
{
  return self->_debugDisplayTimer;
}

- (void)setDebugDisplayTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end