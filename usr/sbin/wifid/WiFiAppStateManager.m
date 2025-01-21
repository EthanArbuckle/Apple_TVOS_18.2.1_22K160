@interface WiFiAppStateManager
+ (id)sharedWiFiAppStateManager;
- (BOOL)_appUsesBackgroundNetwork:(int)a3;
- (BOOL)_appUsesWiFiNetwork:(int)a3;
- (BOOL)_isMonitoringChangesForBundleID:(__CFString *)a3;
- (BOOL)appInForeground;
- (WiFiAppStateManager)init;
- (id)_getStringOfAppState:(unsigned int)a3;
- (int)_getAppCapabilitiesForBundleID:(int)a3;
- (void)_appStateChanged:(unsigned int)a3 bundleID:(__CFString *)a4 capabilities:(int)a5;
- (void)_applicationStateMonitorHandler:(__CFDictionary *)a3;
- (void)_registerApplication:(__CFString *)a3 capabilities:(int)a4;
- (void)_setApplicationState:(__CFString *)a3 active:(BOOL)a4 underLock:(BOOL)a5 capabilities:(int)a6;
- (void)_unRegisterApplication:(__CFString *)a3;
- (void)dealloc;
- (void)externalAppUnregistered:(__CFDictionary *)a3;
- (void)registerAppReporterCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerAppUnregistrationFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerBundleCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerForegroundAppTrackerFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)scheduleWithQueue:(id)a3;
- (void)setAppInForeground:(BOOL)a3;
- (void)startMonitoringBundleId:(__CFString *)a3;
- (void)stopMonitoringBundleId:(__CFString *)a3;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation WiFiAppStateManager

+ (id)sharedWiFiAppStateManager
{
  if (qword_100219E20 != -1) {
    dispatch_once(&qword_100219E20, &stru_1001E5A50);
  }
  return (id)qword_100219E18;
}

- (void)scheduleWithQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver( DistributedCenter,  self,  (CFNotificationCallback)sub_100126990,  @"com.apple.LaunchServices.applicationUnregistered",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unscheduleFromQueue:(id)a3
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver( DistributedCenter,  self,  @"com.apple.LaunchServices.applicationUnregistered",  0LL);
  self->_queue = 0LL;
}

- (WiFiAppStateManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiAppStateManager;
  v2 = -[WiFiAppStateManager init](&v13, "init");
  if (!v2)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiAppStateManager init] failed in super-init"];
    }
    goto LABEL_25;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v2->_applications = Mutable;
  if (!Mutable)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _applications" message:3];
    }
    goto LABEL_25;
  }

  CFMutableSetRef v4 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  v2->_activeApplications = v4;
  if (!v4)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _activeApplications" message:3 "-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }

  CFMutableSetRef v5 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  v2->_backgroundApplications = v5;
  if (!v5)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _backgroundApplications" message:3];
    }
    goto LABEL_25;
  }

  CFMutableSetRef v6 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  v2->_appsInForeground = v6;
  if (!v6)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _appsInForeground" message:3];
    }
    goto LABEL_25;
  }

  if (!objc_opt_class(&OBJC_CLASS___BKSApplicationStateMonitor))
  {
LABEL_26:

    return 0LL;
  }

  v7 = -[BKSApplicationStateMonitor initWithBundleIDs:states:]( objc_alloc(&OBJC_CLASS___BKSApplicationStateMonitor),  "initWithBundleIDs:states:",  0LL,  9LL);
  v2->_applicationStateMonitor = v7;
  if (!v7)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _applicationStateMonitor" message:3 "-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }

  CFMutableSetRef v8 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  v2->_bundleIdsToMonitor = v8;
  if (!v8)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _bundleIdsToMonitor" message:3];
    }
LABEL_25:
    objc_autoreleasePoolPop(v11);
    goto LABEL_26;
  }

  applicationStateMonitor = v2->_applicationStateMonitor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100126C9C;
  v12[3] = &unk_1001E5A78;
  v12[4] = v2;
  -[BKSApplicationStateMonitor setHandler:](applicationStateMonitor, "setHandler:", v12);
  return v2;
}

- (void)externalAppUnregistered:(__CFDictionary *)a3
{
  if (self->_unregisteredCallbackContext && a3 && self->_unregisteredCallbackFunction)
  {
    if (self->_queue)
    {
      v6[0] = 0LL;
      v6[1] = v6;
      v6[2] = 0x2020000000LL;
      CFTypeRef v7 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      CFTypeRef v7 = CFRetain(a3);
      queue = (dispatch_queue_s *)self->_queue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100126DB4;
      v5[3] = &unk_1001E5AA0;
      v5[4] = self;
      v5[5] = v6;
      dispatch_async(queue, v5);
      _Block_object_dispose(v6, 8);
    }
  }

- (void)dealloc
{
  applications = self->_applications;
  if (applications)
  {
    CFRelease(applications);
    self->_applications = 0LL;
  }

  activeApplications = self->_activeApplications;
  if (activeApplications)
  {
    CFRelease(activeApplications);
    self->_activeApplications = 0LL;
  }

  backgroundApplications = self->_backgroundApplications;
  if (backgroundApplications)
  {
    CFRelease(backgroundApplications);
    self->_backgroundApplications = 0LL;
  }

  appsInForeground = self->_appsInForeground;
  if (appsInForeground)
  {
    CFRelease(appsInForeground);
    self->_appsInForeground = 0LL;
  }

  bundleIdsToMonitor = self->_bundleIdsToMonitor;
  if (bundleIdsToMonitor)
  {
    CFRelease(bundleIdsToMonitor);
    self->_bundleIdsToMonitor = 0LL;
  }

  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    -[BKSApplicationStateMonitor invalidate](applicationStateMonitor, "invalidate");
    v9 = self->_applicationStateMonitor;
    if (v9)
    {
      CFRelease(v9);
      self->_applicationStateMonitor = 0LL;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiAppStateManager;
  -[WiFiAppStateManager dealloc](&v10, "dealloc");
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_callbackContext = a4;
  self->_callbackFunction = a3;
}

- (void)registerBundleCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_bundleCallbackContext = a4;
  self->_bundleCallbackFunction = a3;
}

- (void)registerAppUnregistrationFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_unregisteredCallbackContext = a4;
  self->_unregisteredCallbackFunction = a3;
}

- (void)registerForegroundAppTrackerFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_fgAppTrackerCallbackContext = a4;
  self->_fgAppTrackerCallbackFunction = a3;
}

- (void)registerAppReporterCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_appReporterCallbackContext = a4;
  self->_appReporterCallbackFunction = a3;
}

- (void)_applicationStateMonitorHandler:(__CFDictionary *)a3
{
  value = 0LL;
  unsigned int valuePtr = 0;
  v41 = 0LL;
  unsigned int v40 = 0;
  v39 = 0LL;
  unsigned int v38 = 0;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  v35 = sub_100127460;
  v36 = sub_100127470;
  uint64_t v37 = 0LL;
  if (!a3)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null userInfo" message:3 "-[WiFiAppStateManager _applicationStateMonitorHandler:]"];
    }
    goto LABEL_57;
  }

  if (!self->_queue)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Nil queue" message:3];
    }
    goto LABEL_57;
  }

  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
  }
  if (!valuePtr)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: pidForStateChange(%d)" message:3 valuePtr];
    }
    goto LABEL_57;
  }

  CFMutableSetRef v6 = CFDictionaryGetValue(a3, BKSApplicationStateDisplayIDKey);
  if (!v6)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null bundleID" message:3];
    }
    goto LABEL_57;
  }

  applications = self->_applications;
  if (!applications)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null applications" message:3];
    }
    goto LABEL_57;
  }

  if (CFDictionaryGetValueIfPresent(applications, v6, (const void **)&v41))
  {
    if (v41) {
      CFNumberGetValue((CFNumberRef)v41, kCFNumberIntType, &v40);
    }
  }

  else
  {
    uint64_t v8 = -[WiFiAppStateManager _getAppCapabilitiesForBundleID:](self, "_getAppCapabilitiesForBundleID:", valuePtr);
    unsigned int v40 = v8;
    -[WiFiAppStateManager _registerApplication:capabilities:](self, "_registerApplication:capabilities:", v6, v8);
  }

  if (!CFDictionaryGetValueIfPresent(a3, BKSApplicationStateKey, (const void **)&v39))
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Null BKSApplicationStateKey" message:3];
    }
LABEL_57:
    objc_autoreleasePoolPop(v19);
    goto LABEL_44;
  }

  CFNumberGetValue((CFNumberRef)v39, kCFNumberIntType, &v38);
  unsigned int v9 = v38;
  CFTypeRef v10 = CFRetain(v6);
  v33[5] = (uint64_t)v10;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012747C;
  block[3] = &unk_1001E5AC8;
  BOOL v30 = v9 != 1;
  BOOL v31 = v9 == 8;
  unsigned int v29 = v40;
  block[4] = self;
  block[5] = &v32;
  dispatch_async(queue, block);
  if (-[WiFiAppStateManager _appUsesWiFiNetwork:](self, "_appUsesWiFiNetwork:", v40)
    || -[WiFiUserInteractionMonitor hasRealTimeAppProperty:]( +[WiFiUserInteractionMonitor sharedInstance](&OBJC_CLASS___WiFiUserInteractionMonitor, "sharedInstance"),  "hasRealTimeAppProperty:",  v6))
  {
    -[WiFiAppStateManager _appStateChanged:bundleID:capabilities:]( self,  "_appStateChanged:bundleID:capabilities:",  v38,  v6,  v40);
  }

  if (-[WiFiAppStateManager _isMonitoringChangesForBundleID:](self, "_isMonitoringChangesForBundleID:", v6)
    && self->_bundleCallbackFunction)
  {
    v12 = (dispatch_queue_s *)self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001274F0;
    v26[3] = &unk_1001E5AF0;
    v26[4] = self;
    v26[5] = v6;
    unsigned int v27 = v38;
    dispatch_async(v12, v26);
  }

  unsigned int v13 = v38;
  if (v38 == 1)
  {
    -[WiFiAppStateManager _unRegisterApplication:](self, "_unRegisterApplication:", v6);
    unsigned int v13 = v38;
  }

  if (v13 - 1 < 2 || v13 == 4)
  {
    foregroundAppBundleIDs = self->_foregroundAppBundleIDs;
    if (foregroundAppBundleIDs)
    {
      if (-[NSMutableArray containsObject:](foregroundAppBundleIDs, "containsObject:", v6))
      {
        -[NSMutableArray removeObject:](self->_foregroundAppBundleIDs, "removeObject:", v6);
        if (self->_fgAppTrackerCallbackContext)
        {
          if (self->_fgAppTrackerCallbackFunction && self->_queue)
          {
            uint64_t v22 = 0LL;
            v23 = &v22;
            uint64_t v24 = 0x2020000000LL;
            id v25 = 0LL;
            if (-[NSMutableArray count](self->_foregroundAppBundleIDs, "count"))
            {
              id v18 = [[self->_foregroundAppBundleIDs lastObject] copy];
              v23[3] = (uint64_t)v18;
            }

            v15 = (dispatch_queue_s *)self->_queue;
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_100127554;
            v20[3] = &unk_1001E5AA0;
            v20[4] = self;
            v20[5] = &v22;
            v16 = v20;
            goto LABEL_43;
          }
        }
      }
    }
  }

  else if (v13 == 8)
  {
    v14 = self->_foregroundAppBundleIDs;
    if (v14 || (v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray), (self->_foregroundAppBundleIDs = v14) != 0LL))
    {
    }

    if (self->_fgAppTrackerCallbackContext && self->_fgAppTrackerCallbackFunction && self->_queue)
    {
      uint64_t v22 = 0LL;
      v23 = &v22;
      uint64_t v24 = 0x2020000000LL;
      id v25 = (id)0xAAAAAAAAAAAAAAAALL;
      id v25 = [[self->_foregroundAppBundleIDs lastObject] copy];
      v15 = (dispatch_queue_s *)self->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100127504;
      v21[3] = &unk_1001E5AA0;
      v21[4] = self;
      v21[5] = &v22;
      v16 = v21;
LABEL_43:
      dispatch_async(v15, v16);
      _Block_object_dispose(&v22, 8);
    }
  }

- (void)_unRegisterApplication:(__CFString *)a3
{
  if (a3)
  {
    applications = self->_applications;
    if (applications)
    {
      CFDictionaryRemoveValue(applications, a3);
      return;
    }

    CFMutableSetRef v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _applications" message:3];
    }
  }

  else
  {
    CFMutableSetRef v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null bundleID" message:3];
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_registerApplication:(__CFString *)a3 capabilities:(int)a4
{
  int valuePtr = a4;
  if (a3)
  {
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      applications = self->_applications;
      if (applications)
      {
        CFDictionaryAddValue(applications, a3, v7);
      }

      else
      {
        v11 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: null _applications" message:3 "-[WiFiAppStateManager _registerApplication:capabilities:]"];
        }
        objc_autoreleasePoolPop(v11);
      }

      CFRelease(v7);
    }

    else
    {
      CFTypeRef v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: null capabilitiesRef" message:3 "-[WiFiAppStateManager _registerApplication:capabilities:]"];
      }
      objc_autoreleasePoolPop(v10);
    }
  }

  else
  {
    unsigned int v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null bundleID" message:3 "-[WiFiAppStateManager _registerApplication:capabilities:]"];
    }
    objc_autoreleasePoolPop(v9);
  }

- (void)_setApplicationState:(__CFString *)a3 active:(BOOL)a4 underLock:(BOOL)a5 capabilities:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v11 = sub_10003B44C(a3);
  if (!a3)
  {
    unsigned int v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null bundleID" message:3 "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]"];
    }
    goto LABEL_46;
  }

  unsigned int v12 = v11;
  activeApplications = self->_activeApplications;
  if (!activeApplications)
  {
    unsigned int v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null active applications" message:3 "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]"];
    }
    goto LABEL_46;
  }

  if (!self->_backgroundApplications)
  {
    unsigned int v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null background applications" message:3];
    }
    goto LABEL_46;
  }

  if (!v12)
  {
    unsigned int v12 = -[WiFiUserInteractionMonitor hasRealTimeAppProperty:]( +[WiFiUserInteractionMonitor sharedInstance](&OBJC_CLASS___WiFiUserInteractionMonitor, "sharedInstance"),  "hasRealTimeAppProperty:",  a3);
    activeApplications = self->_activeApplications;
  }

  unsigned __int8 Count = CFSetGetCount(activeApplications);
  unsigned __int8 v15 = CFSetGetCount(self->_backgroundApplications);
  v16 = self->_activeApplications;
  if (v8)
  {
    CFSetAddValue(v16, a3);
    backgroundApplications = self->_backgroundApplications;
LABEL_10:
    CFSetRemoveValue(backgroundApplications, a3);
    goto LABEL_12;
  }

  CFSetRemoveValue(v16, a3);
  unsigned __int8 v18 = -[WiFiAppStateManager _appUsesBackgroundNetwork:](self, "_appUsesBackgroundNetwork:", v6);
  backgroundApplications = self->_backgroundApplications;
  if ((v18 & 1) == 0 && !v7) {
    goto LABEL_10;
  }
  CFSetAddValue(backgroundApplications, a3);
LABEL_12:
  unsigned __int8 v19 = CFSetGetCount(self->_activeApplications);
  unsigned __int8 v20 = CFSetGetCount(self->_backgroundApplications);
  v21 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]" message:3, "%s %d bgBefore=%d bgAfter=%d fgBefore=%d fgAfter=%d", 401, v15, v20, Count, v19];
  }
  objc_autoreleasePoolPop(v21);
  if (Count != v19)
  {
    if (Count >= v19)
    {
      -[WiFiAppStateManager setAppInForeground:](self, "setAppInForeground:", 0LL);
      queue = (dispatch_queue_s *)self->_queue;
      if (queue)
      {
        int v22 = 2;
        if (self->_appReporterCallbackFunction && v12)
        {
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          v37[2] = sub_100127BF8;
          v37[3] = &unk_1001E5B18;
          int v38 = 0;
          v37[4] = self;
          dispatch_async(queue, v37);
          int v22 = 2;
        }

        goto LABEL_16;
      }
    }

    else
    {
      -[WiFiAppStateManager setAppInForeground:](self, "setAppInForeground:", 1LL);
      unsigned int v27 = (dispatch_queue_s *)self->_queue;
      if (v27)
      {
        int v22 = 1;
        if (self->_appReporterCallbackFunction && v12)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = sub_100127BA4;
          v39[3] = &unk_1001E5B18;
          unsigned int v40 = v12;
          v39[4] = self;
          dispatch_async(v27, v39);
          int v22 = 1;
        }

        goto LABEL_16;
      }
    }

    unsigned int v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Nil queue" message:3];
    }
LABEL_46:
    objc_autoreleasePoolPop(v29);
    return;
  }

  int v22 = 0;
LABEL_16:
  else {
    int v23 = 4;
  }
  if (v15 == v20) {
    int v24 = v22;
  }
  else {
    int v24 = v23;
  }
  if (self->_queue)
  {
    if (self->_callbackFunction)
    {
      uint64_t v33 = 0LL;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000LL;
      uint64_t v36 = 0LL;
      CFTypeRef v25 = CFRetain(a3);
      v34[3] = (uint64_t)v25;
      v26 = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100127C4C;
      block[3] = &unk_1001E5B40;
      int v32 = v24;
      block[4] = self;
      block[5] = &v33;
      dispatch_async(v26, block);
      _Block_object_dispose(&v33, 8);
    }
  }

  else
  {
    BOOL v30 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: No queue" message:3];
    }
    objc_autoreleasePoolPop(v30);
  }

- (id)_getStringOfAppState:(unsigned int)a3
{
  if (a3 - 1 > 7) {
    return @"WiFiApplicationStateUnknown";
  }
  else {
    return off_1001E5B60[a3 - 1];
  }
}

- (void)_appStateChanged:(unsigned int)a3 bundleID:(__CFString *)a4 capabilities:(int)a5
{
  if (a4)
  {
    switch(a3)
    {
      case 1u:
      case 2u:
      case 4u:
        BOOL v5 = a4;
        uint64_t v6 = 0LL;
        goto LABEL_5;
      case 8u:
        BOOL v5 = a4;
        uint64_t v6 = 1LL;
LABEL_5:
        -[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]( self,  "_setApplicationState:active:underLock:capabilities:",  v5,  v6,  0LL,  *(void *)&a5);
        break;
      default:
        return;
    }
  }

  else
  {
    BOOL v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null bundleID" message:3 "-[WiFiAppStateManager _appStateChanged:bundleID:capabilities:]"];
    }
    objc_autoreleasePoolPop(v7);
  }

- (int)_getAppCapabilitiesForBundleID:(int)a3
{
  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    uint64_t v5 = *(void *)&a3;
    id v6 = -[BKSApplicationStateMonitor bundleInfoValueForKey:PID:]( applicationStateMonitor,  "bundleInfoValueForKey:PID:",  @"SBUsesNetwork",  *(void *)&a3);
    if (v6)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
        LODWORD(v6) = [v6 unsignedIntValue];
      }
      else {
        LODWORD(v6) = 0;
      }
    }

    id v8 = -[BKSApplicationStateMonitor bundleInfoValueForKey:PID:]( self->_applicationStateMonitor,  "bundleInfoValueForKey:PID:",  @"UIRequiresPersistentWiFi",  v5);
    if (v8)
    {
      unsigned int v9 = v8;
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
      }
    }
  }

  else
  {
    unsigned int v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null _applicationStateMonitor" message:3 "-[WiFiAppStateManager _getAppCapabilitiesForBundleID:]"];
    }
    objc_autoreleasePoolPop(v12);
    LODWORD(v6) = 0;
  }

  return (int)v6;
}

- (BOOL)_appUsesWiFiNetwork:(int)a3
{
  return (a3 & 6) != 0;
}

- (BOOL)_appUsesBackgroundNetwork:(int)a3
{
  return (a3 >> 3) & 1;
}

- (void)startMonitoringBundleId:(__CFString *)a3
{
  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor) {
      CFSetAddValue(bundleIdsToMonitor, a3);
    }
  }

- (void)stopMonitoringBundleId:(__CFString *)a3
{
  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor) {
      CFSetRemoveValue(bundleIdsToMonitor, a3);
    }
  }

- (BOOL)_isMonitoringChangesForBundleID:(__CFString *)a3
{
  if (a3)
  {
    bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor)
    {
      bundleIdsToMonitor = (const __CFSet *)CFSetGetCount(bundleIdsToMonitor);
      if (bundleIdsToMonitor) {
        LOBYTE(bundleIdsToMonitor) = CFSetContainsValue(self->_bundleIdsToMonitor, a3) != 0;
      }
    }
  }

  else
  {
    LOBYTE(bundleIdsToMonitor) = 0;
  }

  return (char)bundleIdsToMonitor;
}

- (BOOL)appInForeground
{
  return self->_appInForeground;
}

- (void)setAppInForeground:(BOOL)a3
{
  self->_appInForeground = a3;
}

@end