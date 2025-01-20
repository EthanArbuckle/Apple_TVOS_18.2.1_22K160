@interface HNDAccessibilityManager
+ (BOOL)accessibilityEnabled;
+ (id)_existingSharedManager;
+ (id)sharedManager;
+ (void)_clearExistingSharedManager;
- (AXDispatchTimer)elementFetchQueueTimer;
- (AXElement)axOrbPreviewWindow;
- (AXElementFetcher)elementFetcher;
- (AXElementGroup)elementCommunityGroup;
- (AXElementGroup)rootScannerGroup;
- (BOOL)_elementFetchingRequired;
- (BOOL)_hasCurrentApplicationMatchingBlock:(id)a3;
- (BOOL)_isElementInIgnoredTouchRegions:(id)a3;
- (BOOL)_isGroupingEnabled;
- (BOOL)_isScannerEnabled;
- (BOOL)_isSpeechEnabled;
- (BOOL)applicationIsRTL;
- (BOOL)frontmostAppMayBeLoading;
- (BOOL)hasZeroElements;
- (BOOL)initialized;
- (BOOL)isFetchingElements;
- (BOOL)isOKToSpeak;
- (BOOL)isPausingScanning;
- (BOOL)isSystemSleeping;
- (BOOL)isSystemSleeping:(id)a3;
- (BOOL)willFetchElements;
- (NSArray)_testingElements;
- (NSArray)currentApplications;
- (NSArray)ignoredTouchRegions;
- (NSDate)lastAppTransitionTime;
- (NSMutableArray)accessibilityObservers;
- (NSMutableArray)currentlyObservingNotifications;
- (NSMutableDictionary)currentDisplays;
- (NSString)springboardActionIdentifier;
- (OS_dispatch_queue)notificationObserverQueue;
- (__AXObserver)observer;
- (id)_applicationMatchingBlock:(id)a3 inApplications:(id)a4;
- (id)_currentAppPids;
- (id)_currentApplicationMatchingBlock:(id)a3;
- (id)_itemForScanningFromItem:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5;
- (id)_itemForScanningWithElementCommunity:(id)a3 useFirst:(BOOL)a4;
- (id)_pauseReasonForPid:(int)a3;
- (id)_setupElementFetcher;
- (id)elementAtPoint:(CGPoint)a3;
- (id)elementAtPoint:(CGPoint)a3 displayID:(unsigned int)a4;
- (id)elements;
- (id)elementsForMatchingBlock:(id)a3;
- (id)findGroupableMatchingGroupable:(id)a3;
- (id)firstElementInScene:(id)a3;
- (id)firstItemForScanningWithElementCommunity:(id)a3;
- (id)firstKeyboardItem;
- (id)firstResponder;
- (id)firstScannerElement;
- (id)firstScannerGroupable;
- (id)lastItemForScanningWithElementCommunity:(id)a3;
- (id)lastKeyboardElement;
- (id)lastScannerElement;
- (id)lastScannerGroupable;
- (id)nativeFocusElement;
- (id)nextItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4;
- (id)orbPreviewWindow;
- (id)previousItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4;
- (id)rootKeyboardGroup;
- (id)scannerElementMatchingElement:(id)a3;
- (id)scrollViewsForAction:(int)a3;
- (id)scrollViewsForAction:(int)a3 elementsToScroll:(id *)a4;
- (int64_t)_hndAccessibilityEventForFetchEvent:(unint64_t)a3;
- (void)_addPostEventFilterToFetcher:(id)a3;
- (void)_enableApplicationAccessibility:(BOOL)a3;
- (void)_handleAlertAppeared;
- (void)_handleAnnouncementNotification:(id)a3;
- (void)_handleElementScrolledByPage;
- (void)_handleElementVisualsUpdated;
- (void)_handleFirstResponderChanged;
- (void)_handleKeyboardFocusChanged;
- (void)_handleKeyboardPopupAppeared;
- (void)_handleLayoutChanged:(id)a3;
- (void)_handleOrientationChanged;
- (void)_handlePauseForPid:(int)a3;
- (void)_handlePidStatusChanged;
- (void)_handleRefreshEvent:(int64_t)a3 data:(id)a4;
- (void)_handleResumeForPid:(int)a3;
- (void)_handleScreenChanged:(id)a3;
- (void)_handleScreenLocked;
- (void)_handleScrolledByPage;
- (void)_handleSystemServerDied;
- (void)_handleValueChanged;
- (void)_initialize;
- (void)_initializeAccessibility;
- (void)_notifyObserversApplicationWasActivated:(id)a3;
- (void)_notifyObserversDidFetchElementsForEvent:(int64_t)a3 foundNewElements:(BOOL)a4;
- (void)_notifyObserversDidReceiveEvent:(int64_t)a3 data:(id)a4;
- (void)_notifyObserversDidScheduleFetchEvent:(int64_t)a3;
- (void)_notifyObserversMediaDidBegin:(__CFData *)a3;
- (void)_notifyObserversNativeFocusElementDidChange:(id)a3;
- (void)_notifyObserversScreenWillChange:(__CFData *)a3;
- (void)_notifyObserversUpdateElementVisuals:(id)a3;
- (void)_notifyObserversWillFetchElementsForEvent:(int64_t)a3;
- (void)_observeNotifications:(BOOL)a3;
- (void)_removePostEventFilterFromFetcher:(id)a3;
- (void)_requestPauseScanning;
- (void)_requestResumeScanning;
- (void)_resetPostEventFilterOnFetcher:(id)a3;
- (void)_setTestingElements:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)displaysDidChange:(id)a3;
- (void)fetcher:(id)a3 applicationWasActivated:(id)a4;
- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5;
- (void)fetcher:(id)a3 didScheduleFetchEvent:(unint64_t)a4;
- (void)fetcher:(id)a3 mediaDidBegin:(__CFData *)a4;
- (void)fetcher:(id)a3 nativeFocusElementDidChange:(id)a4;
- (void)fetcher:(id)a3 screenWillChange:(__CFData *)a4;
- (void)fetcher:(id)a3 updateElementVisuals:(id)a4;
- (void)fetcher:(id)a3 willFetchElementsForEvent:(unint64_t)a4 fromApplications:(id)a5;
- (void)groupingEnabledDidChange;
- (void)observeAXNotifications:(id)a3;
- (void)refreshElements;
- (void)removeNotificationObserverAndDealloc;
- (void)removeObserver:(id)a3;
- (void)resetElementFetcher;
- (void)setAccessibilityObservers:(id)a3;
- (void)setAxOrbPreviewWindow:(id)a3;
- (void)setCurrentApplications:(id)a3;
- (void)setCurrentDisplays:(id)a3;
- (void)setCurrentlyObservingNotifications:(id)a3;
- (void)setElementCommunityGroup:(id)a3;
- (void)setElementFetchQueueTimer:(id)a3;
- (void)setElementFetcher:(id)a3;
- (void)setIgnoredTouchRegions:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setIsPausingScanning:(BOOL)a3;
- (void)setIsSystemSleeping:(BOOL)a3;
- (void)setLastAppTransitionTime:(id)a3;
- (void)setNotificationObserverQueue:(id)a3;
- (void)setObserver:(__AXObserver *)a3;
- (void)setRootScannerGroup:(id)a3;
- (void)setSpringboardActionIdentifier:(id)a3;
- (void)speechEnabledDidChange;
- (void)stopObservingAXNotifications:(id)a3;
- (void)updateCachedOrbPreviewWindow:(id)a3;
- (void)userDidPerformSwitchAction;
@end

@implementation HNDAccessibilityManager

- (void)updateCachedOrbPreviewWindow:(id)a3
{
  if ([a3 isEqualToNumber:&__kCFBooleanTrue])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000443A8;
    v5[3] = &unk_100121D18;
    v5[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v5, v4, 0.5);
  }

- (id)orbPreviewWindow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager axOrbPreviewWindow](self, "axOrbPreviewWindow"));

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement primaryApp](&OBJC_CLASS___AXElement, "primaryApp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:5044]);
    -[HNDAccessibilityManager setAxOrbPreviewWindow:](self, "setAxOrbPreviewWindow:", v5);
  }

  return -[HNDAccessibilityManager axOrbPreviewWindow](self, "axOrbPreviewWindow");
}

- (BOOL)_isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (BOOL)_isScannerEnabled
{
  return _AXSAssistiveTouchScannerEnabled(self, a2) != 0;
}

- (BOOL)_isSpeechEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchScannerSpeechEnabled];

  return v3;
}

- (BOOL)_elementFetchingRequired
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 assistiveTouchInternalOnlyHiddenNubbitModeEnabled];

  return v4;
}

- (id)_applicationMatchingBlock:(id)a3 inApplications:(id)a4
{
  v5 = (uint64_t (**)(id, void *))a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((v5[2](v5, v10) & 1) != 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_currentApplicationMatchingBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDAccessibilityManager _applicationMatchingBlock:inApplications:]( self,  "_applicationMatchingBlock:inApplications:",  v4,  v5));

  return v6;
}

- (BOOL)_hasCurrentApplicationMatchingBlock:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[HNDAccessibilityManager _currentApplicationMatchingBlock:]( self,  "_currentApplicationMatchingBlock:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)isOKToSpeak
{
  return !-[HNDAccessibilityManager _hasCurrentApplicationMatchingBlock:]( self,  "_hasCurrentApplicationMatchingBlock:",  &stru_1001234A0);
}

- (void)resetElementFetcher
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager _setupElementFetcher](self, "_setupElementFetcher"));
  -[HNDAccessibilityManager setElementFetcher:](self, "setElementFetcher:", v3);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSAssistiveTouchScannerEnabledNotification, 0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v4 disableEventManagement];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v5 unregisterFetchObserver:self];

  -[HNDAccessibilityManager _observeNotifications:](self, "_observeNotifications:", 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HNDAccessibilityManager;
  -[HNDAccessibilityManager dealloc](&v6, "dealloc");
}

- (void)_initialize
{
  if (!-[HNDAccessibilityManager initialized](self, "initialized"))
  {
    -[HNDAccessibilityManager setInitialized:](self, "setInitialized:", 1LL);
    id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    currentDisplays = self->_currentDisplays;
    self->_currentDisplays = v3;

    -[HNDAccessibilityManager _initializeAccessibility](self, "_initializeAccessibility");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[HNDAccessibilityManager setCurrentlyObservingNotifications:](self, "setCurrentlyObservingNotifications:", v5);

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("HNDAccessibilityManager-NotificationObserver", v7);
    -[HNDAccessibilityManager setNotificationObserverQueue:](self, "setNotificationObserverQueue:", v8);

    -[HNDAccessibilityManager _observeNotifications:](self, "_observeNotifications:", 1LL);
    v9 = (OS_dispatch_queue *)dispatch_queue_create("HNDAccessibilityManager-AppTransition", 0LL);
    appTransitionQueue = self->_appTransitionQueue;
    self->_appTransitionQueue = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[HNDAccessibilityManager setAccessibilityObservers:](self, "setAccessibilityObservers:", v11);

    dispatch_queue_t v12 = dispatch_queue_create("fetch-axelements", 0LL);
    __int128 v13 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  v12);
    -[HNDAccessibilityManager setElementFetchQueueTimer:](self, "setElementFetchQueueTimer:", v13);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100044A80;
    v18[3] = &unk_100121D18;
    v18[4] = self;
    [v14 registerUpdateBlock:v18 forRetrieveSelector:"assistiveTouchInternalOnlyHiddenNubbitModeEnabled" withListener:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100044ACC,  kAXSAssistiveTouchScannerEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    id v16 =  +[SCATSwitchControlServerInstance serverInstance]( &OBJC_CLASS___SCATSwitchControlServerInstance,  "serverInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[HNDAccessibilityManager setLastAppTransitionTime:](self, "setLastAppTransitionTime:", v17);
  }

- (id)_setupElementFetcher
{
  if (-[HNDAccessibilityManager _elementFetchingRequired](self, "_elementFetchingRequired"))
  {
    if (-[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled")) {
      BOOL v3 = -[HNDAccessibilityManager _isScannerEnabled](self, "_isScannerEnabled");
    }
    else {
      BOOL v3 = 0LL;
    }
    v5 = objc_alloc(&OBJC_CLASS___AXElementFetcher);
    BOOL v4 = -[AXElementFetcher initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:]( v5,  "initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:",  self,  AXFetchEventAllEvents,  0LL,  v3,  0LL,  -[HNDAccessibilityManager _elementFetchingRequired](self, "_elementFetchingRequired"));
    -[AXElementFetcher registerFetchObserver:targetQueue:]( v4,  "registerFetchObserver:targetQueue:",  self,  &_dispatch_main_q);
    dispatch_queue_attr_t v6 = (OS_dispatch_queue *)dispatch_queue_create("ignored-touch-regions", 0LL);
    ignoredTouchRegionsQueue = self->_ignoredTouchRegionsQueue;
    self->_ignoredTouchRegionsQueue = v6;

    -[AXElementFetcher setElementGroupingHeuristics:](v4, "setElementGroupingHeuristics:", 2LL);
    -[AXElementFetcher enableEventManagement](v4, "enableEventManagement");
    -[HNDAccessibilityManager _resetPostEventFilterOnFetcher:](self, "_resetPostEventFilterOnFetcher:", v4);
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (void)_resetPostEventFilterOnFetcher:(id)a3
{
  id v4 = a3;
  -[HNDAccessibilityManager _removePostEventFilterFromFetcher:](self, "_removePostEventFilterFromFetcher:", v4);
  -[HNDAccessibilityManager _addPostEventFilterToFetcher:](self, "_addPostEventFilterToFetcher:", v4);
}

- (void)_addPostEventFilterToFetcher:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100044D1C;
  v5[3] = &unk_1001234C8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 addPostFetchFilter:v5 withIdentifier:@"Scanner-Elements"];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_removePostEventFilterFromFetcher:(id)a3
{
}

+ (id)sharedManager
{
  if (qword_1001576B8 != -1) {
    dispatch_once(&qword_1001576B8, &stru_1001234E8);
  }
  [(id)qword_1001576B0 _initialize];
  return (id)qword_1001576B0;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers"));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers"));
  [v5 removeObject:v4];
}

- (void)_notifyObserversDidReceiveEvent:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        dispatch_queue_t v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "accessibilityManager:didReceiveEvent:data:") & 1) != 0) {
          [v12 accessibilityManager:self didReceiveEvent:a3 data:v6];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)_notifyObserversDidScheduleFetchEvent:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:didScheduleFetchEvent:") & 1) != 0) {
          [v10 accessibilityManager:self didScheduleFetchEvent:a3];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversWillFetchElementsForEvent:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:willFetchElementsForEvent:") & 1) != 0) {
          [v10 accessibilityManager:self willFetchElementsForEvent:a3];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversDidFetchElementsForEvent:(int64_t)a3 foundNewElements:(BOOL)a4
{
  BOOL v4 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "accessibilityManager:didFetchElementsForEvent:foundNewElements:") & 1) != 0) {
          [v12 accessibilityManager:self didFetchElementsForEvent:a3 foundNewElements:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)_notifyObserversNativeFocusElementDidChange:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:nativeFocusElementDidChange:") & 1) != 0) {
          [v10 accessibilityManager:self nativeFocusElementDidChange:v4];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversUpdateElementVisuals:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:updateElementVisuals:") & 1) != 0) {
          [v10 accessibilityManager:self updateElementVisuals:v4];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversApplicationWasActivated:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:applicationWasActivated:") & 1) != 0) {
          [v10 accessibilityManager:self applicationWasActivated:v4];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversScreenWillChange:(__CFData *)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:screenWillChange:") & 1) != 0) {
          [v10 accessibilityManager:self screenWillChange:a3];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversMediaDidBegin:(__CFData *)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "accessibilityManager:mediaDidBegin:") & 1) != 0) {
          [v10 accessibilityManager:self mediaDidBegin:a3];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_enableApplicationAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = _AXSApplicationAccessibilityEnabled(self, a2);
  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
    }
  }

  else
  {
    _AXSApplicationAccessibilitySetEnabled(1LL);
  }

+ (BOOL)accessibilityEnabled
{
  return _AXSApplicationAccessibilityEnabled(a1, a2) != 0;
}

- (void)_initializeAccessibility
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemApplication](&OBJC_CLASS___AXElement, "systemApplication"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  id v5 = [v4 axElement];

  if (v5)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100045E44;
    v19[3] = &unk_100121D18;
    v19[4] = self;
    AXUIElementRegisterForApplicationDeath(v5, v19);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager _setupElementFetcher](self, "_setupElementFetcher"));
  -[HNDAccessibilityManager setElementFetcher:](self, "setElementFetcher:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
  id v9 = (const __AXUIElement *)[v8 axElement];

  AXUIElementGetPid(v9, &pid);
  _AXLogWithFacility(2LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Got pid: %d");
  AXObserverRef observer = -[HNDAccessibilityManager observer](self, "observer");
  if (!observer)
  {
    if (AXObserverCreate(pid, (AXObserverCallback)sub_100045E74, &observer))
    {
      LOBYTE(v16) = 1;
      _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v16,  @"Failed to create an accessibility event observer: %ld");
      goto LABEL_11;
    }

    -[HNDAccessibilityManager setObserver:](self, "setObserver:", observer);
  }

  if (-[HNDAccessibilityManager _elementFetchingRequired](self, "_elementFetchingRequired"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
    [v10 enableEventManagement];

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
    [v11 refresh];
  }

  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(observer);
  if (RunLoopSource)
  {
    __int128 v13 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v13, kCFRunLoopDefaultMode);
    return;
  }

  LOBYTE(v16) = 1;
  _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v16,  @"Failed to get the observer run loop source");
LABEL_11:
  __int128 v15 = objc_autoreleasePoolPush();
  -[HNDAccessibilityManager _handleSystemServerDied](self, "_handleSystemServerDied");
  objc_autoreleasePoolPop(v15);
}

- (BOOL)_isElementInIgnoredTouchRegions:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  ignoredTouchRegionsQueue = (dispatch_queue_s *)self->_ignoredTouchRegionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000460A8;
  block[3] = &unk_100123510;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(ignoredTouchRegionsQueue, block);
  if (*((_BYTE *)v22 + 24))
  {
    [v4 visiblePoint];
    double v8 = v7;
    double v9 = v6;
    if (v7 == -1.0 && v6 == -1.0)
    {
      [v4 centerPoint];
      double v8 = v10;
      double v9 = v11;
    }

    id v12 = [v4 windowContextId];
    if ((_DWORD)v12)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
      objc_msgSend(v13, "convertPoint:fromContextId:", v12, v8, v9);
      double v8 = v14;
      double v9 = v15;
    }

    int v16 = (dispatch_queue_s *)self->_ignoredTouchRegionsQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000460F8;
    v19[3] = &unk_100121C88;
    *(double *)&v19[6] = v8;
    *(double *)&v19[7] = v9;
    v19[4] = self;
    void v19[5] = &v25;
    dispatch_sync(v16, v19);
  }

  char v17 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)observeAXNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager notificationObserverQueue](self, "notificationObserverQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000462A4;
  v7[3] = &unk_100122168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)stopObservingAXNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager notificationObserverQueue](self, "notificationObserverQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100046550;
  v7[3] = &unk_100122168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeNotificationObserverAndDealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v3 setPassivelyListeningForEvents:0];

  id v4 = -[HNDAccessibilityManager observer](self, "observer");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentlyObservingNotifications](self, "currentlyObservingNotifications"));
  -[HNDAccessibilityManager stopObservingAXNotifications:](self, "stopObservingAXNotifications:", v5);

  if (v4) {
    CFRelease(v4);
  }
  -[HNDAccessibilityManager setObserver:](self, "setObserver:", 0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[HNDAccessibilityManager setCurrentlyObservingNotifications:](self, "setCurrentlyObservingNotifications:", v6);
}

- (void)_observeNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v4 = objc_loadWeakRetained(&location);
  id v5 = v4;
  if (v3) {
    [v4 observeAXNotifications:&off_10012F658];
  }
  else {
    [v4 removeNotificationObserverAndDealloc];
  }

  objc_destroyWeak(&location);
}

- (void)_handleFirstResponderChanged
{
}

- (void)_handleSystemServerDied
{
  if (-[HNDAccessibilityManager observer](self, "observer")) {
    -[HNDAccessibilityManager _observeNotifications:](self, "_observeNotifications:", 0LL);
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v3 disableEventManagement];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000468EC;
  v5[3] = &unk_100121D18;
  v5[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v5, v4, 0.5);
}

- (BOOL)frontmostAppMayBeLoading
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager lastAppTransitionTime](self, "lastAppTransitionTime"));

  if (!v3) {
    return AXInPreboardScenario();
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager lastAppTransitionTime](self, "lastAppTransitionTime"));
  [v4 timeIntervalSinceNow];
  double v6 = fabs(v5);

  return v6 < 4.0;
}

- (BOOL)applicationIsRTL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  unsigned __int8 v5 = [v4 BOOLWithAXAttribute:3026];

  return v5;
}

- (BOOL)hasZeroElements
{
  if (-[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager rootScannerGroup](self, "rootScannerGroup"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstDescendantPassingTest:&stru_100123550]);
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elements](self, "elements"));
    BOOL v5 = [v3 count] == 0;
  }

  return v5;
}

- (void)refreshElements
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v2 refresh];
}

- (BOOL)isFetchingElements
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  unsigned __int8 v3 = [v2 isFetchingElements];

  return v3;
}

- (BOOL)willFetchElements
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  unsigned __int8 v3 = [v2 willFetchElements];

  return v3;
}

- (void)_handleLayoutChanged:(id)a3
{
}

- (void)_handleAlertAppeared
{
}

- (void)_handleOrientationChanged
{
}

- (void)_handleAnnouncementNotification:(id)a3
{
  id v13 = a3;
  objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v13, v5) & 1) != 0
    && (uint64_t v6 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kAXPidKey])) != 0
    && (double v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kAXNotificationDataKey]),
        v8,
        v7,
        v8))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kAXNotificationDataKey]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      else {
        uint64_t v12 = 10LL;
      }
      -[HNDAccessibilityManager _handleRefreshEvent:data:](self, "_handleRefreshEvent:data:", v12, v9);
    }
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDAccessibilityManager.m",  931LL,  "-[HNDAccessibilityManager _handleAnnouncementNotification:]",  @"Unexpected notification data");
  }
}

- (void)_handleScreenChanged:(id)a3
{
}

- (void)_handleScreenLocked
{
}

- (void)_handleScrolledByPage
{
}

- (void)_handleKeyboardPopupAppeared
{
}

- (void)_handleElementVisualsUpdated
{
}

- (void)_handleElementScrolledByPage
{
}

- (void)_handlePidStatusChanged
{
}

- (void)_handleKeyboardFocusChanged
{
}

- (void)_handleValueChanged
{
}

- (void)_handleRefreshEvent:(int64_t)a3 data:(id)a4
{
}

- (void)_requestPauseScanning
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "accessibilityManagerShouldPauseScanning:") & 1) != 0) {
          [v8 accessibilityManagerShouldPauseScanning:self];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)_requestResumeScanning
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager accessibilityObservers](self, "accessibilityObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "accessibilityManagerShouldResumeScanning:") & 1) != 0) {
          [v8 accessibilityManagerShouldResumeScanning:self];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  -[HNDAccessibilityManager setIsPausingScanning:](self, "setIsPausingScanning:", 0LL);
}

- (id)_pauseReasonForPid:(int)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Pid:%i", *(void *)&a3);
}

- (id)_currentAppPids
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) uiElement]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 pid]));
        [v4 addObject:v11];

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_handlePauseForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pauseCountsByPid = self->_pauseCountsByPid;
  if (!pauseCountsByPid)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = self->_pauseCountsByPid;
    self->_pauseCountsByPid = v6;

    pauseCountsByPid = self->_pauseCountsByPid;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pauseCountsByPid, "objectForKeyedSubscript:", v8));
  __int128 v10 = (char *)[v9 unsignedIntegerValue];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
  unsigned __int8 v12 = [v11 ignoreLogging];

  if (v10)
  {
    if ((v12 & 1) == 0)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v14 = AXLoggerForFacility();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = AXColorizeFormatLog(3LL, @"Pause count was already high, so not adding a reason again.");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v19 = _AXStringForArgs(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v20;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@", buf, 0xCu);
          goto LABEL_21;
        }

        goto LABEL_21;
      }

      goto LABEL_22;
    }
  }

  else
  {
    if ((v12 & 1) == 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v22 = AXLoggerForFacility();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

      os_log_type_t v24 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = AXColorizeFormatLog(3LL, @"Pause count was 0 for pid %i before handling notification.");
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        uint64_t v50 = v3;
        uint64_t v27 = _AXStringForArgs(v26);
        char v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v28;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "%{public}@", buf, 0xCu);
        }
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager _currentAppPids](self, "_currentAppPids", v50));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    unsigned __int8 v31 = [v29 containsObject:v30];
    int v32 = kAXUIServerFakePid;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
    unsigned __int8 v34 = [v33 ignoreLogging];

    if ((v31 & 1) != 0 || v32 == (_DWORD)v3)
    {
      if ((v34 & 1) == 0)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
        uint64_t v40 = AXLoggerForFacility();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);

        os_log_type_t v42 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = AXColorizeFormatLog(3LL, @"Found matching pid, going to pause");
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          uint64_t v45 = _AXStringForArgs(v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v41, v42))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v46;
            _os_log_impl((void *)&_mh_execute_header, v41, v42, "%{public}@", buf, 0xCu);
          }
        }
      }

      -[HNDAccessibilityManager _requestPauseScanning](self, "_requestPauseScanning");
    }

    else if ((v34 & 1) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v36 = AXLoggerForFacility();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v37 = AXColorizeFormatLog( 3LL,  @"Did not match current app or AXUIServer, so not asking scanner to disable.  That's a bit odd...");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v38 = _AXStringForArgs(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v20;
          goto LABEL_20;
        }

- (void)_handleResumeForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pauseCountsByPid = self->_pauseCountsByPid;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pauseCountsByPid, "objectForKeyedSubscript:", v6));
  uint64_t v8 = (char *)[v7 unsignedIntegerValue];

  if (v8)
  {
    __int128 v9 = v8 - 1;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
    __int128 v11 = self->_pauseCountsByPid;
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
    LOBYTE(v11) = [v13 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v15 = AXLoggerForFacility();
      os_log_type_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = AXColorizeFormatLog(3LL, @"Decremented pause count for pid %i to %lu");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v36 = v3;
        uint64_t v37 = v9;
        uint64_t v20 = _AXStringForArgs(v19);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", buf, 0xCu);
        }
      }
    }

    if (!v9)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager _currentAppPids](self, "_currentAppPids"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
      unsigned __int8 v24 = [v22 containsObject:v23];
      int v25 = kAXUIServerFakePid;

      if ((v24 & 1) != 0 || v25 == (_DWORD)v3)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCPauseResume sharedInstance]( &OBJC_CLASS___AXSubsystemSCPauseResume,  "sharedInstance",  v36,  v37));
        unsigned __int8 v27 = [v26 ignoreLogging];

        if ((v27 & 1) == 0)
        {
          char v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
          uint64_t v29 = AXLoggerForFacility();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

          os_log_type_t v31 = AXOSLogLevelFromAXLogLevel(3LL);
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v32 = AXColorizeFormatLog( 3LL,  @"Can resume scanning if necessary, because our pid matched the current app or the AXUIServer");
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            uint64_t v34 = _AXStringForArgs(v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v30, v31))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v35;
              _os_log_impl((void *)&_mh_execute_header, v30, v31, "%{public}@", buf, 0xCu);
            }
          }
        }

        -[HNDAccessibilityManager _requestResumeScanning](self, "_requestResumeScanning");
      }
    }
  }

  else
  {
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Somehow tried to resume for a pid with no pause count.  This may have happened if we launched Switch Control after the app sent its pause notification.");
  }

- (id)elements
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 availableElements]);

  return v3;
}

- (id)nativeFocusElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nativeFocusElement]);

  return v3;
}

- (id)firstScannerElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 availableElements]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)lastScannerElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 availableElements]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

- (id)firstScannerGroupable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager rootScannerGroup](self, "rootScannerGroup"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstChild]);

  objc_opt_class(&OBJC_CLASS___AXElementGroup, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    objc_opt_class(&OBJC_CLASS___AXElement, v6);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
    {
      if (v3) {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDAccessibilityManager.m",  1126LL,  "-[HNDAccessibilityManager firstScannerGroupable]",  @"Expected an element that represents an ax group, or nil");
      }
    }
  }

  return v3;
}

- (id)lastScannerGroupable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager rootScannerGroup](self, "rootScannerGroup"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastChild]);

  objc_opt_class(&OBJC_CLASS___AXElementGroup, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    objc_opt_class(&OBJC_CLASS___AXElement, v6);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
    {
      if (v3) {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDAccessibilityManager.m",  1133LL,  "-[HNDAccessibilityManager lastScannerGroupable]",  @"Expected an element that represents an ax group, or nil");
      }
    }
  }

  return v3;
}

- (id)rootKeyboardGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyboardGroup]);

  return v3;
}

- (id)elementAtPoint:(CGPoint)a3
{
  return -[HNDAccessibilityManager elementAtPoint:displayID:](self, "elementAtPoint:displayID:", 1LL, a3.x, a3.y);
}

- (id)elementAtPoint:(CGPoint)a3 displayID:(unsigned int)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementAtCoordinate:withVisualPadding:displayID:]( &OBJC_CLASS___AXElement,  "elementAtCoordinate:withVisualPadding:displayID:",  0LL,  *(void *)&a4,  a3.x,  a3.y));
  unsigned int v6 = -[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 findGroupableMatchingGroupable:v5]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 findElementMatchingElement:v5]);
  }
  __int128 v10 = (void *)v9;

  return v10;
}

- (id)findGroupableMatchingGroupable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 findGroupableMatchingGroupable:v4]);

  return v6;
}

- (id)firstResponder
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      unsigned int v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)v6) firstResponder]);
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }

        unsigned int v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = 0LL;
LABEL_11:

  return v8;
}

- (id)scrollViewsForAction:(int)a3
{
  return -[HNDAccessibilityManager scrollViewsForAction:elementsToScroll:]( self,  "scrollViewsForAction:elementsToScroll:",  *(void *)&a3,  0LL);
}

- (id)elementsForMatchingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100047EA8;
  v22[3] = &unk_100123578;
  id v6 = v4;
  id v24 = v6;
  id v7 = v5;
  id v23 = v7;
  uint64_t v8 = objc_retainBlock(v22);
  if (-[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rootGroup]);
    [v10 enumerateLeafDescendantsUsingBlock:v8];
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher", 0LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 availableElements]);

    id v12 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v9);
          }
          ((void (*)(void *, void))v8[2])(v8, *(void *)(*((void *)&v18 + 1) + 8LL * (void)v15));
          uint64_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }

      while (v13);
    }
  }

  id v16 = v7;
  return v16;
}

- (id)scrollViewsForAction:(int)a3 elementsToScroll:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000481C8;
  v35[3] = &unk_100122368;
  int v38 = a3;
  id v9 = v7;
  id v36 = v9;
  id v10 = v8;
  id v37 = v10;
  __int128 v11 = objc_retainBlock(v35);
  if (-[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootGroup]);
    [v13 enumerateLeafDescendantsUsingBlock:v11];
  }

  else
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 availableElements]);

    id v15 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        __int128 v18 = 0LL;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v12);
          }
          ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v31 + 1) + 8LL * (void)v18));
          __int128 v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }

      while (v16);
    }
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      id v24 = 0LL;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        int v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementWithAXUIElement:]( &OBJC_CLASS___AXElement,  "elementWithAXUIElement:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v24),  (void)v27));
        [v19 addObject:v25];

        id v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }

    while (v22);
  }

  if (a4) {
    *a4 = v10;
  }

  return v19;
}

- (id)_itemForScanningWithElementCommunity:(id)a3 useFirst:(BOOL)a4
{
  id v6 = a3;
  if (-[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    if (v6)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager rootScannerGroup](self, "rootScannerGroup", 0LL));
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            if ([v12 isGroup])
            {
              id v13 = v12;
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 elementCommunity]);
              unsigned int v15 = [v14 isEqual:v6];

              if (v15)
              {
                if (a4) {
                  uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 firstChild]);
                }
                else {
                  uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 lastChild]);
                }
                __int128 v18 = (void *)v17;

                goto LABEL_23;
              }
            }
          }

          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }

    if (a4) {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager firstScannerGroupable](self, "firstScannerGroupable"));
    }
    else {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager lastScannerGroupable](self, "lastScannerGroupable"));
    }
  }

  else if (a4)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager firstScannerElement](self, "firstScannerElement"));
  }

  else
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager lastScannerElement](self, "lastScannerElement"));
  }

  __int128 v18 = (void *)v16;
LABEL_23:

  return v18;
}

- (id)firstItemForScanningWithElementCommunity:(id)a3
{
  return -[HNDAccessibilityManager _itemForScanningWithElementCommunity:useFirst:]( self,  "_itemForScanningWithElementCommunity:useFirst:",  a3,  1LL);
}

- (id)lastItemForScanningWithElementCommunity:(id)a3
{
  return -[HNDAccessibilityManager _itemForScanningWithElementCommunity:useFirst:]( self,  "_itemForScanningWithElementCommunity:useFirst:",  a3,  0LL);
}

- (id)_itemForScanningFromItem:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = -[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  __int128 v11 = v10;
  if (v9)
  {
    if (v6) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 nextSiblingOfGroupable:v8 didWrap:a5]);
    }
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 previousSiblingOfGroupable:v8 didWrap:a5]);
    }
    uint64_t v14 = (void *)v12;

    if (!v14)
    {
      if ([v8 scatIsKeyboardKey])
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000485D4;
        v20[3] = &unk_1001235A0;
        id v21 = v8;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 findGroupableMatchingBlock:v20]);

        if ([v16 isKeyboardKey]) {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[HNDAccessibilityManager _itemForScanningFromItem:inDirection:didWrap:]( self,  "_itemForScanningFromItem:inDirection:didWrap:",  v16,  v6,  a5));
        }
        else {
          uint64_t v14 = 0LL;
        }

        goto LABEL_21;
      }

- (id)nextItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4
{
  return -[HNDAccessibilityManager _itemForScanningFromItem:inDirection:didWrap:]( self,  "_itemForScanningFromItem:inDirection:didWrap:",  a3,  1LL,  a4);
}

- (id)previousItemForScanningFromItem:(id)a3 didWrap:(BOOL *)a4
{
  return -[HNDAccessibilityManager _itemForScanningFromItem:inDirection:didWrap:]( self,  "_itemForScanningFromItem:inDirection:didWrap:",  a3,  0LL,  a4);
}

- (id)firstKeyboardItem
{
  unsigned int v3 = -[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  uint64_t v5 = v4;
  if (v3)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyboardGroup]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstChild]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 findElementMatchingBlock:&stru_1001235C0]);
  }

  return v7;
}

- (id)lastKeyboardElement
{
  unsigned int v3 = -[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyboardGroup]);

    if (!v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rootGroup]);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v8 lastChild]);
    }

    if ([v6 isGroup])
    {
      do
      {
        id v5 = (id)objc_claimAutoreleasedReturnValue([v6 lastChild]);

        BOOL v6 = v5;
      }

      while (([v5 isGroup] & 1) != 0);
    }

    else
    {
      id v5 = v6;
    }

    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___SCATElement])
    {
      id v5 = v5;
      __int128 v11 = v5;
    }

    else
    {
      __int128 v11 = 0LL;
    }
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElement]);
    if ([v9 isKeyboardKey])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastElement]);
    }

    else
    {
      __int128 v11 = 0LL;
    }
  }

  return v11;
}

- (id)firstElementInScene:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementCommunityGroup](self, "elementCommunityGroup"));
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      __int128 v22 = self;
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)i), "isGroup", v22))
          {
            __n128 v10 = objc_opt_class(&OBJC_CLASS___AXElementGroup, v9);
            uint64_t v11 = __UIAccessibilityCastAsClass(v10);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstLeafDescendant]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uiElement]);
            unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringWithAXAttribute:3056]);
            unsigned int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              self = v22;
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](v22, "elementFetcher"));
              unsigned int v19 = [v18 isGroupingEnabled];

              if (v19) {
                id v20 = (id)objc_claimAutoreleasedReturnValue([v12 firstChild]);
              }
              else {
                id v20 = v13;
              }
              id v6 = v20;

              goto LABEL_18;
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }

      self = v22;
    }

- (id)scannerElementMatchingElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  unsigned int v6 = [v5 isGroupingEnabled];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rootGroup]);
    __n128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstDescendantMatchingItem:v4]);

    id v4 = v9;
  }

  else
  {
    __n128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 findElementMatchingElement:v4]);
  }

  return v10;
}

- (int64_t)_hndAccessibilityEventForFetchEvent:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64) {
        return 2LL;
      }
      if (a3 == 128) {
        return 8LL;
      }
    }

    else
    {
      if (a3 == 16) {
        return 6LL;
      }
      if (a3 == 32) {
        return 7LL;
      }
    }

    return 0LL;
  }

  if (a3 == 2) {
    return 4LL;
  }
  if (a3 != 4) {
    return a3 == 8;
  }
  return 3LL;
}

- (void)groupingEnabledDidChange
{
  BOOL v3 = -[HNDAccessibilityManager _isGroupingEnabled](self, "_isGroupingEnabled");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v4 setGroupingEnabled:v3];

  -[HNDAccessibilityManager refreshElements](self, "refreshElements");
}

- (void)speechEnabledDidChange
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  [v3 setShouldIncludeNonScannerElements:0];

  -[HNDAccessibilityManager refreshElements](self, "refreshElements");
}

- (void)displaysDidChange:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary removeAllObjects](self->_currentDisplays, "removeAllObjects");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        __n128 v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        currentDisplays = self->_currentDisplays;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v10, "displayID", (void)v14)));
        -[NSMutableDictionary setObject:forKey:](currentDisplays, "setObject:forKey:", v10, v12);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
  -[HNDAccessibilityManager _resetPostEventFilterOnFetcher:](self, "_resetPostEventFilterOnFetcher:", v13);
}

- (void)userDidPerformSwitchAction
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"User performed switch action");
      __n128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        __int128 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[HNDAccessibilityManager _requestResumeScanning](self, "_requestResumeScanning");
}

- (BOOL)isSystemSleeping:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server", a3));
  self->_isSystemSleeping = [v4 isSystemSleeping];

  return self->_isSystemSleeping;
}

- (void)fetcher:(id)a3 didScheduleFetchEvent:(unint64_t)a4
{
}

- (void)fetcher:(id)a3 willFetchElementsForEvent:(unint64_t)a4 fromApplications:(id)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guidedAccessIgnoredRegions]);

  ignoredTouchRegionsQueue = (dispatch_queue_s *)self->_ignoredTouchRegionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048FCC;
  block[3] = &unk_100122168;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(ignoredTouchRegionsQueue, block);
  -[HNDAccessibilityManager _notifyObserversWillFetchElementsForEvent:]( self,  "_notifyObserversWillFetchElementsForEvent:",  -[HNDAccessibilityManager _hndAccessibilityEventForFetchEvent:](self, "_hndAccessibilityEventForFetchEvent:", a4));
}

- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  if (!-[HNDAccessibilityManager isPausingScanning](self, "isPausingScanning")) {
    goto LABEL_25;
  }
  unint64_t v57 = a4;
  unsigned int v56 = v5;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications"));
  id v9 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        pauseCountsByPid = self->_pauseCountsByPid;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 uiElement]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 pid]));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pauseCountsByPid,  "objectForKeyedSubscript:",  v16));
        id v18 = [v17 unsignedIntegerValue];

        if (v18)
        {
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCPauseResume sharedInstance]( &OBJC_CLASS___AXSubsystemSCPauseResume,  "sharedInstance"));
          unsigned __int8 v34 = [v33 ignoreLogging];

          if ((v34 & 1) == 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
            uint64_t v36 = AXLoggerForFacility();
            id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

            os_log_type_t v38 = AXOSLogLevelFromAXLogLevel(3LL);
            if (os_log_type_enabled(v37, v38))
            {
              uint64_t v39 = AXColorizeFormatLog(3LL, @"Should remain paused because of app: %{public}@");
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              v55 = v13;
              uint64_t v41 = _AXStringForArgs(v40);
              os_log_type_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v37, v38))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v42;
                _os_log_impl((void *)&_mh_execute_header, v37, v38, "%{public}@", buf, 0xCu);
              }
            }
          }

          uint64_t v5 = v56;
          goto LABEL_24;
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  unsigned int v19 = self->_pauseCountsByPid;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", kAXUIServerFakePid));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20));
  id v22 = [v21 unsignedIntegerValue];

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
  unsigned __int8 v24 = [v23 ignoreLogging];

  if (v22)
  {
    uint64_t v5 = v56;
    a4 = v57;
    if ((v24 & 1) != 0) {
      goto LABEL_25;
    }
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
    uint64_t v26 = AXLoggerForFacility();
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

    os_log_type_t v28 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = AXColorizeFormatLog(3LL, @"No apps were pausing, but the AXUIServer was.");
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v31 = _AXStringForArgs(v30);
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138543362;
        v64 = v32;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%{public}@", buf, 0xCu);
      }

      uint64_t v5 = v56;
    }
  }

  else
  {
    uint64_t v5 = v56;
    if ((v24 & 1) == 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v48 = AXLoggerForFacility();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);

      os_log_type_t v50 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = AXColorizeFormatLog( 3LL,  @"App changed (new apps are %{public}@), and we no longer need to be paused.");
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager currentApplications](self, "currentApplications"));
        uint64_t v53 = _AXStringForArgs(v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 138543362;
          v64 = v54;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "%{public}@", buf, 0xCu);
        }

        uint64_t v5 = v56;
      }
    }

    -[HNDAccessibilityManager _requestResumeScanning](self, "_requestResumeScanning", v55);
  }

- (void)fetcher:(id)a3 nativeFocusElementDidChange:(id)a4
{
}

- (void)fetcher:(id)a3 updateElementVisuals:(id)a4
{
}

- (void)fetcher:(id)a3 applicationWasActivated:(id)a4
{
}

- (void)fetcher:(id)a3 screenWillChange:(__CFData *)a4
{
}

- (void)fetcher:(id)a3 mediaDidBegin:(__CFData *)a4
{
}

+ (id)_existingSharedManager
{
  return (id)qword_1001576B0;
}

+ (void)_clearExistingSharedManager
{
  id v2 = (void *)qword_1001576B0;
  qword_1001576B0 = 0LL;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (__AXObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(__AXObserver *)a3
{
  self->_AXObserverRef observer = a3;
}

- (AXDispatchTimer)elementFetchQueueTimer
{
  return self->_elementFetchQueueTimer;
}

- (void)setElementFetchQueueTimer:(id)a3
{
}

- (AXElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (NSString)springboardActionIdentifier
{
  return self->_springboardActionIdentifier;
}

- (void)setSpringboardActionIdentifier:(id)a3
{
}

- (NSMutableArray)accessibilityObservers
{
  return self->_accessibilityObservers;
}

- (void)setAccessibilityObservers:(id)a3
{
}

- (NSDate)lastAppTransitionTime
{
  return self->_lastAppTransitionTime;
}

- (void)setLastAppTransitionTime:(id)a3
{
}

- (AXElementGroup)rootScannerGroup
{
  return self->_rootScannerGroup;
}

- (void)setRootScannerGroup:(id)a3
{
}

- (AXElement)axOrbPreviewWindow
{
  return self->_axOrbPreviewWindow;
}

- (void)setAxOrbPreviewWindow:(id)a3
{
}

- (BOOL)isSystemSleeping
{
  return self->_isSystemSleeping;
}

- (void)setIsSystemSleeping:(BOOL)a3
{
  self->_isSystemSleeping = a3;
}

- (BOOL)isPausingScanning
{
  return self->_isPausingScanning;
}

- (void)setIsPausingScanning:(BOOL)a3
{
  self->_isPausingScanning = a3;
}

- (AXElementGroup)elementCommunityGroup
{
  return self->_elementCommunityGroup;
}

- (void)setElementCommunityGroup:(id)a3
{
}

- (NSArray)currentApplications
{
  return self->_currentApplications;
}

- (void)setCurrentApplications:(id)a3
{
}

- (NSArray)ignoredTouchRegions
{
  return self->_ignoredTouchRegions;
}

- (void)setIgnoredTouchRegions:(id)a3
{
}

- (NSMutableDictionary)currentDisplays
{
  return self->_currentDisplays;
}

- (void)setCurrentDisplays:(id)a3
{
}

- (NSMutableArray)currentlyObservingNotifications
{
  return self->_currentlyObservingNotifications;
}

- (void)setCurrentlyObservingNotifications:(id)a3
{
}

- (OS_dispatch_queue)notificationObserverQueue
{
  return self->_notificationObserverQueue;
}

- (void)setNotificationObserverQueue:(id)a3
{
}

- (NSArray)_testingElements
{
  return self->__testingElements;
}

- (void)_setTestingElements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end