@interface BackgroundTaskAgentMonitor
- (BOOL)initNetworkLinkQualityMonitoring;
- (BOOL)initPowerSourceMonitoring;
- (BOOL)isInVoiceCall;
- (BOOL)isPowerPluggedin;
- (BOOL)isRoaming;
- (BOOL)isScreenBlanked;
- (BOOL)pendingNetworkUpdate;
- (BOOL)primaryLinkIsCellular;
- (BOOL)shouldRescheduleTimer;
- (BOOL)systemWillSleep;
- (BackgroundTaskAgentMonitor)initWithTarget:(id)a3 selector:(SEL)a4 queue:(id)a5;
- (NSTimer)networkStabilizationTimer;
- (OS_dispatch_queue)queue;
- (SEL)selector;
- (double)batteryLevel;
- (double)getKernelMonotonicClock;
- (double)lastPowerPluggedinTime;
- (double)lastScreenBlankedTime;
- (double)systemToMonotonicTimeOffset;
- (id)target;
- (int)numAdjustTimeJobs;
- (int)primaryLinkQuality;
- (unsigned)rootDomainConnect;
- (void)cancelNetworkStabilizationTimer;
- (void)dealloc;
- (void)debugPrintMonitorStatus;
- (void)decrementNumAdjustTimeJobs;
- (void)decrementNumJobsNotAllowedDuringVoiceCall;
- (void)decrementNumJobsNotAllowedWhileRoaming;
- (void)decrementNumNetworkJobs;
- (void)decrementNumPowerPluggedinJobs;
- (void)decrementNumScreenBlankedJobs;
- (void)incrementNumAdjustTimeJobs;
- (void)incrementNumJobsNotAllowedDuringVoiceCall;
- (void)incrementNumJobsNotAllowedWhileRoaming;
- (void)incrementNumNetworkJobs;
- (void)incrementNumPowerPluggedinJobs;
- (void)incrementNumScreenBlankedJobs;
- (void)networkStabilizationTimerHandler;
- (void)notifyWhenBatteryLevel:(double)a3;
- (void)processRegistrationNotification;
- (void)rescheduleNetworkStabilizationTimer;
- (void)setIsInVoiceCall:(BOOL)a3;
- (void)setIsScreenBlanked:(BOOL)a3;
- (void)setNetworkStabilizationTimer:(id)a3;
- (void)setPendingNetworkUpdate:(BOOL)a3;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setShouldRescheduleTimer:(BOOL)a3;
- (void)setSystemToMonotonicTimeOffset:(double)a3;
- (void)setSystemWillSleep:(BOOL)a3;
- (void)updateBatteryLevel:(unsigned int)a3;
- (void)updateCallState;
- (void)updateNetworkLinkQuality;
- (void)updatePluggedinState:(unsigned int)a3;
- (void)updateRoamingState;
@end

@implementation BackgroundTaskAgentMonitor

- (BackgroundTaskAgentMonitor)initWithTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BackgroundTaskAgentMonitor;
  v8 = -[BackgroundTaskAgentMonitor init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    v8->_target = a3;
    v8->_selector = a4;
    v8->_queue = (OS_dispatch_queue *)a5;
    v8->_primaryLinkQuality = 0;
    v8->_primaryLinkIsCellular = 0;
    v8->_networkStabilizationTimer = 0LL;
    v8->_pendingNetworkUpdate = 0;
    if (!-[BackgroundTaskAgentMonitor initNetworkLinkQualityMonitoring](v8, "initNetworkLinkQualityMonitoring")) {
      goto LABEL_5;
    }
    v9->_isScreenBlanked = 0;
    v9->_numScreenBlankedJobs = 0;
    v9->_lastScreenBlankedTime = -1.0;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    v15 = sub_545C;
    v16 = &unk_C588;
    v17 = v9;
    notify_register_dispatch( "com.apple.springboard.hasBlankedScreen",  &v9->_screenBlankedToken,  (dispatch_queue_t)v9->_queue,  handler);
    v15((uint64_t)handler, v9->_screenBlankedToken);
    if (-[BackgroundTaskAgentMonitor initPowerSourceMonitoring](v9, "initPowerSourceMonitoring"))
    {
      v9->_numAdjustTimeJobs = 0;
      double Current = CFAbsoluteTimeGetCurrent();
      -[BackgroundTaskAgentMonitor getKernelMonotonicClock](v9, "getKernelMonotonicClock");
      v9->_systemToMonotonicTimeOffset = Current - v11;
      v9->_numVoiceCallJobs = 0;
      -[BackgroundTaskAgentMonitor updateCallState](v9, "updateCallState");
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_54A4;
      v13[3] = &unk_C4E0;
      v13[4] = v9;
      dispatch_async(&_dispatch_main_q, v13);
      v9->_roamStateChanged = 0;
      -[BackgroundTaskAgentMonitor updateRoamingState](v9, "updateRoamingState");
      v9->systemPowerPortRef = 0LL;
      v9->rootDomainConnect = IORegisterForSystemPower( v9,  &v9->systemPowerPortRef,  (IOServiceInterestCallback)sub_5710,  &v9->pmNotifier);
      IONotificationPortSetDispatchQueue(v9->systemPowerPortRef, (dispatch_queue_t)a5);
      *(_WORD *)&v9->_systemWillSleep = 256;
    }

    else
    {
LABEL_5:

      return 0LL;
    }
  }

  return v9;
}

- (void)dealloc
{
  systemPowerPortRef = self->systemPowerPortRef;
  if (systemPowerPortRef)
  {
    IONotificationPortDestroy(systemPowerPortRef);
    self->systemPowerPortRef = 0LL;
  }

  IOServiceClose(self->rootDomainConnect);
  self->rootDomainConnect = 0;
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  self->_dynamicStore = 0LL;
  batteryIONotifyPort = self->_batteryIONotifyPort;
  if (batteryIONotifyPort)
  {
    IONotificationPortDestroy(batteryIONotifyPort);
    self->_batteryIONotifyPort = 0LL;
  }

  io_object_t batteryNotificationRef = self->_batteryNotificationRef;
  if (batteryNotificationRef)
  {
    IOObjectRelease(batteryNotificationRef);
    self->_io_object_t batteryNotificationRef = 0;
  }

  io_object_t batteryEntry = self->_batteryEntry;
  if (batteryEntry)
  {
    IOObjectRelease(batteryEntry);
    self->_io_object_t batteryEntry = 0;
  }

  int screenBlankedToken = self->_screenBlankedToken;
  if (screenBlankedToken) {
    notify_cancel(screenBlankedToken);
  }
  self->_int screenBlankedToken = 0;
  uint64_t powerPluggedinToken = self->_powerPluggedinToken;
  if ((_DWORD)powerPluggedinToken) {
    uint64_t powerPluggedinToken = notify_cancel(powerPluggedinToken);
  }
  self->_uint64_t powerPluggedinToken = 0;
  uint64_t Default = CTTelephonyCenterGetDefault(powerPluggedinToken);
  CTTelephonyCenterRemoveEveryObserver(Default, self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[BackgroundTaskAgentMonitor cancelNetworkStabilizationTimer](self, "cancelNetworkStabilizationTimer");
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BackgroundTaskAgentMonitor;
  -[BackgroundTaskAgentMonitor dealloc](&v12, "dealloc");
}

- (void)notifyWhenBatteryLevel:(double)a3
{
  self->_batteryNotificationThreshold = a3;
  if (_logToConsole) {
    BOOL v4 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: Setting Battery Notification Threshold = %.1f%%",  a3);
  }
  if (_logToFile) {
    BOOL v5 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: Setting Battery Notification Threshold = %.1f%%",  self->_batteryNotificationThreshold);
  }
}

- (void)incrementNumNetworkJobs
{
}

- (void)decrementNumNetworkJobs
{
}

- (void)incrementNumScreenBlankedJobs
{
}

- (void)decrementNumScreenBlankedJobs
{
}

- (void)incrementNumPowerPluggedinJobs
{
}

- (void)decrementNumPowerPluggedinJobs
{
}

- (void)incrementNumAdjustTimeJobs
{
}

- (void)decrementNumAdjustTimeJobs
{
}

- (void)incrementNumJobsNotAllowedDuringVoiceCall
{
}

- (void)decrementNumJobsNotAllowedDuringVoiceCall
{
}

- (void)incrementNumJobsNotAllowedWhileRoaming
{
}

- (void)decrementNumJobsNotAllowedWhileRoaming
{
}

- (void)debugPrintMonitorStatus
{
  if (_logToConsole) {
    BOOL v3 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: numNetworkJobs: %d, numScreenBlankedJobs: %d, numPluggedInJobs: %d, numAdjustTimeJobs: %d",  self->_numNetworkJobs,  self->_numScreenBlankedJobs,  self->_numPowerPluggedinJobs,  self->_numAdjustTimeJobs);
  }
  if (_logToFile) {
    BOOL v4 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: numNetworkJobs: %d, numScreenBlankedJobs: %d, numPluggedInJobs: %d, numAdjustTimeJobs: %d",  self->_numNetworkJobs,  self->_numScreenBlankedJobs,  self->_numPowerPluggedinJobs,  self->_numAdjustTimeJobs);
  }
}

- (BOOL)initNetworkLinkQualityMonitoring
{
  v11.version = 0LL;
  memset(&v11.retain, 0, 24);
  v11.info = self;
  BOOL v3 = SCDynamicStoreCreate( kCFAllocatorDefault,  @"com.apple.backgroundtaskagent",  (SCDynamicStoreCallBack)sub_5D4C,  &v11);
  self->_dynamicStore = v3;
  if (v3)
  {
    SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)-[BackgroundTaskAgentMonitor queue](self, "queue"));
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    BOOL v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCEntNetIPv4);
    CFArrayAppendValue(Mutable, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    CFStringRef v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv6);
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v7);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetLinkQuality);
    CFArrayAppendValue(v5, NetworkInterfaceEntity);
    CFRelease(NetworkInterfaceEntity);
    SCDynamicStoreSetNotificationKeys(self->_dynamicStore, Mutable, v5);
    CFRelease(Mutable);
    CFRelease(v5);
    if (_logToConsole && bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: initNetworkLinkQualityMonitoring - Registered for Notifications");
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: initNetworkLinkQualityMonitoring - Registered for Notifications");
    }
    -[BackgroundTaskAgentMonitor updateNetworkLinkQuality](self, "updateNetworkLinkQuality");
  }

  else
  {
    if (bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: initNetworkLinkQualityMonitoring - SCDynamicStoreCreate Failed");
    }
    if (_logToFile) {
      BOOL v9 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: initNetworkLinkQualityMonitoring - SCDynamicStoreCreate Failed");
    }
  }

  return v3 != 0LL;
}

- (void)rescheduleNetworkStabilizationTimer
{
  if (-[BackgroundTaskAgentMonitor systemWillSleep](self, "systemWillSleep"))
  {
    -[BackgroundTaskAgentMonitor setShouldRescheduleTimer:](self, "setShouldRescheduleTimer:", 1LL);
  }

  else
  {
    -[BackgroundTaskAgentMonitor cancelNetworkStabilizationTimer](self, "cancelNetworkStabilizationTimer");
    -[BackgroundTaskAgentMonitor setNetworkStabilizationTimer:]( self,  "setNetworkStabilizationTimer:",  +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "networkStabilizationTimerHandler",  0LL,  0LL,  5.0));
    -[NSRunLoop addTimer:forMode:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "addTimer:forMode:",  -[BackgroundTaskAgentMonitor networkStabilizationTimer](self, "networkStabilizationTimer"),  NSDefaultRunLoopMode);
    BOOL v3 = -[BackgroundTaskAgentMonitor networkStabilizationTimer](self, "networkStabilizationTimer");
    if (_logToConsole) {
      BOOL v4 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitorTimer Callback: Scheduled NSTimer with Time Interval = %.1f",  5.0);
    }
    if (_logToFile) {
      BOOL v5 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitorTimer Callback: Scheduled NSTimer with Time Interval = %.1f",  5.0);
    }
  }

- (void)networkStabilizationTimerHandler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_5F28;
  block[3] = &unk_C4E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[BackgroundTaskAgentMonitor queue](self, "queue"), block);
}

- (void)cancelNetworkStabilizationTimer
{
  self->_networkStabilizationTimer = 0LL;
}

- (void)updateNetworkLinkQuality
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFStringRef NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCEntNetIPv4);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  key = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCEntNetIPv6);
  CFArrayAppendValue(Mutable, key);
  BOOL v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  v6 = (const __CFString *)kSCEntNetCommCenter;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetCommCenter);
  CFArrayAppendValue(v5, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  v8 = (const __CFString *)kSCEntNetLinkQuality;
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetLinkQuality);
  CFArrayAppendValue(v5, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  v10 = SCDynamicStoreCopyMultiple(self->_dynamicStore, Mutable, v5);
  CFRelease(Mutable);
  SCDynamicStoreContext v11 = v5;
  objc_super v12 = v10;
  CFRelease(v11);
  if (NetworkGlobalEntity) {
    BOOL v13 = v10 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    BOOL v14 = 0;
    int v15 = 0;
    goto LABEL_64;
  }

  entity = v8;
  theDict = v10;
  Value = (__CFString *)CFDictionaryGetValue(v10, NetworkGlobalEntity);
  v17 = Value;
  if (_logToConsole && bta_logconsole_asl_handle) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv4 netKey: %s, netValue: %s",  (const char *)objc_msgSend(-[__CFString description](NetworkGlobalEntity, "description"), "UTF8String"),  (const char *)objc_msgSend(-[__CFString description](Value, "description"), "UTF8String"));
  }
  objc_super v18 = v6;
  if (_logToFile && bta_logfile_asl_handle) {
    asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv4 netKey: %s, netValue: %s",  (const char *)objc_msgSend(-[__CFString description](NetworkGlobalEntity, "description"), "UTF8String"),  (const char *)objc_msgSend(-[__CFString description](v17, "description"), "UTF8String"));
  }
  if (!v17) {
    goto LABEL_17;
  }
  CFTypeID v19 = CFGetTypeID(v17);
  if (v19 != CFDictionaryGetTypeID())
  {
    v17 = 0LL;
LABEL_17:
    v20 = 0LL;
    int v15 = 0;
    goto LABEL_18;
  }

  v20 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v17, kSCDynamicStorePropNetPrimaryInterface);
  v17 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v17, kSCDynamicStorePropNetPrimaryService);
  int v15 = 1;
LABEL_18:
  CFRelease(NetworkGlobalEntity);
  if (!v20 || !v17)
  {
    v21 = (void *)CFDictionaryGetValue(theDict, key);
    if (_logToConsole && bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv6 netKey: %s, netValue: %s",  (const char *)objc_msgSend(-[__CFString description](key, "description"), "UTF8String"),  (const char *)objc_msgSend(objc_msgSend(v21, "description"), "UTF8String"));
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv6 netKey: %s, netValue: %s",  (const char *)objc_msgSend(-[__CFString description](key, "description"), "UTF8String"),  (const char *)objc_msgSend(objc_msgSend(v21, "description"), "UTF8String"));
    }
    if (v21)
    {
      CFTypeID v22 = CFGetTypeID(v21);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      objc_super v18 = v6;
      v24 = key;
      if (v22 == TypeID)
      {
        v20 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v21, kSCDynamicStorePropNetPrimaryInterface);
        v25 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v21, kSCDynamicStorePropNetPrimaryService);
        v24 = key;
        v17 = v25;
        int v15 = 1;
      }

      goto LABEL_31;
    }

    objc_super v18 = v6;
  }

  v24 = key;
LABEL_31:
  CFRelease(v24);
  BOOL v14 = 0;
  if (v20 && v17)
  {
    CFStringRef v26 = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v17, v18);
    objc_super v12 = theDict;
    v27 = v20;
    v28 = CFDictionaryGetValue(theDict, v26);
    CFRelease(v26);
    BOOL v14 = v28 != 0LL;
    v29 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v27,  entity);
    v30 = v29;
    if (_logToConsole && bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityKey: %s",  (const char *)objc_msgSend(-[__CFString description](v29, "description"), "UTF8String"));
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityKey: %s",  (const char *)objc_msgSend(-[__CFString description](v30, "description"), "UTF8String"));
    }
    v31 = (void *)CFDictionaryGetValue(theDict, v30);
    CFRelease(v30);
    if (v31)
    {
      if (_logToConsole && bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityValue: %s",  (const char *)objc_msgSend(objc_msgSend(v31, "description"), "UTF8String"));
      }
      if (_logToFile && bta_logfile_asl_handle) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityValue: %s",  (const char *)objc_msgSend(objc_msgSend(v31, "description"), "UTF8String"));
      }
      CFTypeID v32 = CFGetTypeID(v31);
      if (v32 == CFDictionaryGetTypeID())
      {
        v33 = CFDictionaryGetValue((CFDictionaryRef)v31, entity);
        CFTypeID v34 = CFGetTypeID(v33);
        if (v34 == CFNumberGetTypeID())
        {
          CFNumberGetValue((CFNumberRef)v33, kCFNumberIntType, &valuePtr);
          if (_logToConsole && bta_logconsole_asl_handle) {
            asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - LinkQuality = %d",  valuePtr);
          }
          if (_logToFile && bta_logfile_asl_handle) {
            asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - LinkQuality = %d",  valuePtr);
          }
          if ((valuePtr - 51) >= 0x32)
          {
            if ((valuePtr + 1) >= 0x34)
            {
              if (valuePtr == -2)
              {
                if (bta_logconsole_asl_handle) {
                  asl_log( (asl_object_t)bta_logconsole_asl_handle,  0,  3,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Primary Interface = %s, Link Quality = IFNET_LQM_THRESH_OFF.",  (const char *)objc_msgSend(-[__CFString description](v27, "description"), "UTF8String"));
                }
                if (_logToFile && bta_logfile_asl_handle) {
                  asl_log( (asl_object_t)bta_logfile_asl_handle,  0,  3,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Primary Interface = %s, Link Quality = IFNET_LQM_THRESH_OFF.",  (const char *)objc_msgSend(-[__CFString description](v27, "description"), "UTF8String"));
                }
              }

              else
              {
                if (bta_logconsole_asl_handle) {
                  asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Unknown link quality value = %d",  valuePtr);
                }
                if (_logToFile && bta_logfile_asl_handle) {
                  asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Unknown link quality value = %d",  valuePtr);
                }
              }
            }
          }

          else
          {
            int v15 = 2;
          }
        }
      }
    }
  }

  else
  {
    objc_super v12 = theDict;
  }

- (void)setIsScreenBlanked:(BOOL)a3
{
  if (self->_isScreenBlanked != a3)
  {
    self->_isScreenBlanked = a3;
    if (_logToConsole) {
      BOOL v4 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v4 = 1;
    }
    int v5 = !v4;
    if (a3)
    {
      if (v5) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Screen Blanked");
      }
      if (_logToFile) {
        BOOL v6 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Screen Blanked");
      }
      double Current = CFAbsoluteTimeGetCurrent();
    }

    else
    {
      if (v5) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Screen On");
      }
      double Current = -1.0;
      if (_logToFile) {
        BOOL v8 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Screen On");
      }
    }

    self->_lastScreenBlankedTime = Current;
    if (self->_numScreenBlankedJobs >= 1) {
      [self->_target performSelector:self->_selector withObject:0];
    }
  }

- (BOOL)initPowerSourceMonitoring
{
  kern_return_t v8;
  self->_isPowerPluggedin = 0;
  self->_numPowerPluggedinJobs = 0;
  self->_lastPowerPluggedinTime = -1.0;
  self->_batteryNotificationThreshold = 101.0;
  if (_logToConsole) {
    BOOL v3 = bta_logconsole_asl_handle == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%",  101.0);
  }
  if (_logToFile) {
    BOOL v4 = bta_logfile_asl_handle == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%",  self->_batteryNotificationThreshold);
  }
  int v5 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_batteryIONotifyPort = v5;
  IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)-[BackgroundTaskAgentMonitor queue](self, "queue"));
  BOOL v6 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
  self->_io_object_t batteryEntry = MatchingService;
  BOOL v8 = IOServiceAddInterestNotification( self->_batteryIONotifyPort,  MatchingService,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_6B04,  self,  &self->_batteryNotificationRef);
  if (v8)
  {
    if (bta_logconsole_asl_handle) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: init - Error calling IOServiceAddInterestNotification (0x%08x)",  v8);
    }
    if (_logToFile && bta_logfile_asl_handle) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: init - Error calling IOServiceAddInterestNotification (0x%08x)",  v8);
    }
  }

  else
  {
    -[BackgroundTaskAgentMonitor updateBatteryLevel:](self, "updateBatteryLevel:", self->_batteryEntry);
    -[BackgroundTaskAgentMonitor updatePluggedinState:](self, "updatePluggedinState:", self->_batteryEntry);
  }

  return v8 == 0;
}

- (void)updateBatteryLevel:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", kCFAllocatorDefault, 0);
  CFTypeRef v6 = IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", kCFAllocatorDefault, 0);
  CFStringRef v7 = (void *)v6;
  if (CFProperty) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (!CFProperty)
    {
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  else
  {
    [CFProperty doubleValue];
    if (v9 > 0.0)
    {
      [v7 doubleValue];
      double v11 = v10 * 100.0;
      [CFProperty doubleValue];
      self->_batteryLevel = v11 / v12;
    }
  }

  CFRelease(CFProperty);
  if (v7) {
LABEL_8:
  }
    CFRelease(v7);
LABEL_9:
  if (self->_batteryLevel >= self->_batteryNotificationThreshold)
  {
    if (_logToConsole) {
      BOOL v13 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%. Resetting Threshold to 101.",  self->_batteryNotificationThreshold);
    }
    if (_logToFile) {
      BOOL v14 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%. Resetting Threshold to 101.",  self->_batteryNotificationThreshold);
    }
    self->_batteryNotificationThreshold = 101.0;
    [self->_target performSelector:self->_selector withObject:0];
  }

- (void)updatePluggedinState:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", kCFAllocatorDefault, 0);
  int isPowerPluggedin = self->_isPowerPluggedin;
  unsigned int v6 = [CFProperty intValue];
  int v7 = v6 == 1;
  self->_int isPowerPluggedin = v7;
  if (isPowerPluggedin != v7)
  {
    if (_logToConsole) {
      BOOL v8 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = !v8;
    if (v6 == 1)
    {
      if (v9) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Power Pluggedin");
      }
      if (_logToFile) {
        BOOL v10 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Power Pluggedin");
      }
      double Current = CFAbsoluteTimeGetCurrent();
    }

    else
    {
      if (v9) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Power Unplugged");
      }
      double Current = -1.0;
      if (_logToFile) {
        BOOL v12 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Power Unplugged");
      }
    }

    self->_lastPowerPluggedinTime = Current;
    if (self->_numPowerPluggedinJobs >= 1) {
      [self->_target performSelector:self->_selector withObject:0];
    }
  }

- (double)getKernelMonotonicClock
{
  size_t v15 = 4LL;
  if ((byte_DA14 & 1) == 0)
  {
    if (sysctlnametomib("kern.monotonicclock", dword_DA18, (size_t *)&dword_D9F8))
    {
      if (bta_logconsole_asl_handle) {
        asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: getKernelMonotonicClock - Error occurred, no mib to monotonic clock conversion\n");
      }
      double v2 = -1.0;
      if (_logToFile) {
        BOOL v3 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v3 = 1;
      }
      if (!v3) {
        asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  3,  "BackgroundTaskAgentMonitor: getKernelMonotonicClock - Error occurred, no mib to monotonic clock conversion\n");
      }
      return v2;
    }

    byte_DA14 = 1;
  }

  if (sysctl(dword_DA18, dword_D9F8, &v16, &v15, 0LL, 0LL))
  {
    int v5 = (__asl_object_s *)bta_logconsole_asl_handle;
    if (bta_logconsole_asl_handle)
    {
      int v6 = *__error();
      int v7 = __error();
      BOOL v8 = strerror(*v7);
      asl_log(v5, 0LL, 3, "BackgroundTaskAgentMonitor: getKernelMonotonicClock - Error occurred %d %s\n", v6, v8);
    }

    int v9 = (__asl_object_s *)bta_logfile_asl_handle;
    double v2 = -1.0;
    if (_logToFile) {
      BOOL v10 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      __error();
      double v11 = __error();
      strerror(*v11);
      asl_log(v9, 0LL, 3, "BackgroundTaskAgentMonitor: getKernelMonotonicClock - Error occurred %d %s\n");
    }
  }

  else
  {
    if (_logToConsole) {
      BOOL v12 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      asl_log( (asl_object_t)bta_logconsole_asl_handle,  0LL,  5,  "BackgroundTaskAgentMonitor: getKernelMonotonicClock - kern.monotonic = %u\n",  v16);
    }
    if (_logToFile) {
      BOOL v13 = bta_logfile_asl_handle == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13) {
      asl_log( (asl_object_t)bta_logfile_asl_handle,  0LL,  7,  "BackgroundTaskAgentMonitor: getKernelMonotonicClock - kern.monotonic = %u\n",  v16);
    }
    LODWORD(v4) = v16;
    return (double)v4 + 0.5;
  }

  return v2;
}

- (void)setIsInVoiceCall:(BOOL)a3
{
  if (self->_isInVoiceCall != a3)
  {
    if (_logToConsole) {
      BOOL v5 = bta_logconsole_asl_handle == 0;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
    if (a3)
    {
      if (v6) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Started voice call");
      }
      if (_logToFile) {
        BOOL v7 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Started voice call");
      }
    }

    else
    {
      if (v6) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "BackgroundTaskAgentMonitor: Exited voice call");
      }
      if (_logToFile) {
        BOOL v8 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "BackgroundTaskAgentMonitor: Exited voice call");
      }
    }

    self->_isInVoiceCall = a3;
    if (self->_numVoiceCallJobs >= 1) {
      [self->_target performSelector:self->_selector withObject:0];
    }
  }

- (void)updateCallState
{
  BOOL v3 = (void *)CTCopyCurrentCalls(kCFAllocatorDefault, a2);
  id v4 = v3;
  if (!v3 || ![v3 count]) {
    goto LABEL_10;
  }
  int Status = CTCallGetStatus([v3 objectAtIndex:0]);
  if ((Status - 1) < 4)
  {
    int v6 = self;
    uint64_t v7 = 1LL;
LABEL_11:
    -[BackgroundTaskAgentMonitor setIsInVoiceCall:](v6, "setIsInVoiceCall:", v7);
    return;
  }

  if (Status == 5 || Status == 0)
  {
LABEL_10:
    int v6 = self;
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  if (bta_logconsole_asl_handle) {
    asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 3, "BackgroundTaskAgentMonitor: unknown call state");
  }
  if (_logToFile)
  {
    if (bta_logfile_asl_handle) {
      asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 3, "BackgroundTaskAgentMonitor: unknown call state");
    }
  }

- (void)updateRoamingState
{
  BOOL isRoaming = self->_isRoaming;
  int Status = (const void *)CTRegistrationGetStatus();
  if (Status && CFEqual(Status, kCTRegistrationStatusRegisteredRoaming))
  {
    self->_BOOL isRoaming = 1;
    if (!isRoaming && self->_numRoamJobs)
    {
      self->_roamStateChanged = 1;
      if (_logToConsole) {
        BOOL v5 = bta_logconsole_asl_handle == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (!v5) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "Device is now roaming");
      }
      if (_logToFile) {
        BOOL v6 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "Device is now roaming");
      }
    }
  }

  else
  {
    self->_BOOL isRoaming = 0;
    if (isRoaming && self->_numRoamJobs != 0)
    {
      self->_roamStateChanged = 1;
      if (_logToConsole) {
        BOOL v8 = bta_logconsole_asl_handle == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8) {
        asl_log((asl_object_t)bta_logconsole_asl_handle, 0LL, 5, "Device has exited roaming");
      }
      if (_logToFile) {
        BOOL v9 = bta_logfile_asl_handle == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        asl_log((asl_object_t)bta_logfile_asl_handle, 0LL, 7, "Device has exited roaming");
      }
    }
  }

- (void)processRegistrationNotification
{
  if (self->_roamStateChanged)
  {
    if (self->_isRoaming) {
      [self->_target performSelector:self->_selector withObject:0];
    }
    else {
      -[BackgroundTaskAgentMonitor rescheduleNetworkStabilizationTimer](self, "rescheduleNetworkStabilizationTimer");
    }
  }

- (int)primaryLinkQuality
{
  return self->_primaryLinkQuality;
}

- (BOOL)primaryLinkIsCellular
{
  return self->_primaryLinkIsCellular;
}

- (BOOL)isScreenBlanked
{
  return self->_isScreenBlanked;
}

- (double)lastScreenBlankedTime
{
  return self->_lastScreenBlankedTime;
}

- (BOOL)isPowerPluggedin
{
  return self->_isPowerPluggedin;
}

- (double)lastPowerPluggedinTime
{
  return self->_lastPowerPluggedinTime;
}

- (BOOL)isInVoiceCall
{
  return self->_isInVoiceCall;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isRoaming
{
  return self->_isRoaming;
}

- (BOOL)pendingNetworkUpdate
{
  return self->_pendingNetworkUpdate;
}

- (void)setPendingNetworkUpdate:(BOOL)a3
{
  self->_pendingNetworkUpdate = a3;
}

- (BOOL)systemWillSleep
{
  return self->_systemWillSleep;
}

- (void)setSystemWillSleep:(BOOL)a3
{
  self->_systemWillSleep = a3;
}

- (BOOL)shouldRescheduleTimer
{
  return self->_shouldRescheduleTimer;
}

- (void)setShouldRescheduleTimer:(BOOL)a3
{
  self->_shouldRescheduleTimer = a3;
}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  return self->_selector;
}

- (NSTimer)networkStabilizationTimer
{
  return self->_networkStabilizationTimer;
}

- (void)setNetworkStabilizationTimer:(id)a3
{
  self->_networkStabilizationTimer = (NSTimer *)a3;
}

- (int)numAdjustTimeJobs
{
  return self->_numAdjustTimeJobs;
}

- (double)systemToMonotonicTimeOffset
{
  return self->_systemToMonotonicTimeOffset;
}

- (void)setSystemToMonotonicTimeOffset:(double)a3
{
  self->_systemToMonotonicTimeOffset = a3;
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (unsigned)rootDomainConnect
{
  return self->rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->rootDomainConnect = a3;
}

@end