@interface WiFiUserInteractionMonitor
+ (BOOL)checkIfMatchesHomeBundleIds:(id)a3;
+ (BOOL)checkIfMatchesNonNetworkingBundleIds:(id)a3;
+ (id)getHomeBundleIds;
+ (id)getKnownNonNetworkingBundleIds;
+ (id)sharedInstance;
- (BOOL)_canTrigger11axPerfStudyForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5;
- (BOOL)_isCellularDataAllowedForApp:(id)a3;
- (BOOL)_isSymptomTrackingRtTrafficForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5;
- (BOOL)anyCallInProgress;
- (BOOL)callHostedOnThisDevice;
- (BOOL)canTrigger11axPerfStudyForBackgroundFlows;
- (BOOL)canTrigger11axPerfStudyForForegroundFlows;
- (BOOL)carModeActive;
- (BOOL)hasRealTimeAppProperty:(id)a3;
- (BOOL)initialSetupCompleted;
- (BOOL)isAVConferenceActive;
- (BOOL)isAirplayActiveOverInfra;
- (BOOL)isAnyCallInProgress;
- (BOOL)isAskToJoinAllowed;
- (BOOL)isCallHostedOnThisDevice;
- (BOOL)isCarModeActive;
- (BOOL)isCarPlay;
- (BOOL)isCellularDataUsable;
- (BOOL)isCellularInexpensive5G;
- (BOOL)isCoPresenceActive;
- (BOOL)isDeviceLocked;
- (BOOL)isDisplayOn;
- (BOOL)isFirstUserUnlocked;
- (BOOL)isInGameMode;
- (BOOL)isInHomeScreen;
- (BOOL)isInNonNetworkingApp;
- (BOOL)isInitialSetupCompleted;
- (BOOL)isLowQualityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isMediaPlaying;
- (BOOL)isNetworkRecommendationAllowed;
- (BOOL)isNetworkingAppInForeground;
- (BOOL)isPersonalHotspotRecommendationAllowed;
- (BOOL)isPriorityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isPublicNetwork:(__WiFiNetwork *)a3;
- (BOOL)isRealTimeAppActive;
- (BOOL)isSetupCompleted;
- (BOOL)isUsingSustainedCellularData;
- (BOOL)isUsingSustainedWiFiData;
- (BOOL)isWiFiCallInProgress;
- (BOOL)navigating;
- (BOOL)setupCompleted;
- (BOOL)wifiCallInProgress;
- (NSDate)periodicTasksLastRanAt;
- (NSDictionary)appAwareDetails;
- (NSMutableArray)clients;
- (NSMutableDictionary)appAttributes;
- (NSMutableDictionary)overrideNetworkState;
- (NSMutableSet)monitoredInterfaceNames;
- (NSMutableSet)runningForegroundApps;
- (NSMutableSet)runningNetworkingApps;
- (NSSet)cellularDataStatusMap;
- (NSString)cellularInterfaceName;
- (OS_dispatch_mach)managedEventDispatchPort;
- (OS_dispatch_queue)internalQueue;
- (WiFiUserInteractionMonitorNetworkAgent)rtTrafficAgent;
- (__CTServerConnection)ctServerConnection;
- (double)cellularL3MBPS;
- (double)wifiL3MBPS;
- (id)_initPrivate;
- (id)_stateInfo;
- (id)description;
- (int)gameNotifyToken;
- (int)managedEventNotifyToken;
- (unint64_t)_applicationNotifyState;
- (unint64_t)cellularIfTotalBytes;
- (unint64_t)cellularIfTotalPackets;
- (unint64_t)cellularL3PPS;
- (unint64_t)overrideApplicationState;
- (unint64_t)symptomBackgroundFlowProperties;
- (unint64_t)symptomForegroundFlowProperties;
- (unint64_t)wifiIfTotalBytes;
- (unint64_t)wifiIfTotalInputBytes;
- (unint64_t)wifiIfTotalInputPackets;
- (unint64_t)wifiIfTotalOutputBytes;
- (unint64_t)wifiIfTotalOutputPackets;
- (unint64_t)wifiIfTotalPackets;
- (unint64_t)wifiL3PPS;
- (unsigned)managedEventNotifyPort;
- (unsigned)symptomBackgroundFlowClassification;
- (unsigned)symptomForegroundFlowClassification;
- (void)_handleManagedEventNotification;
- (void)_notifyCaptiveWithApplicationState:(unint64_t)a3;
- (void)dealloc;
- (void)dumpOverrideNetworkState;
- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)resetBackgroundApps;
- (void)resetOverrideNetworkStates;
- (void)resetOverrideStates;
- (void)runPeriodicTasks;
- (void)setAnyCallInProgress:(BOOL)a3;
- (void)setAppAttributes:(id)a3;
- (void)setAppAwareDetails:(id)a3;
- (void)setApplicationRunningState:(BOOL)a3 foregroundState:(BOOL)a4 andNetworkingState:(BOOL)a5 forBundleId:(id)a6;
- (void)setCallHostedOnThisDevice:(BOOL)a3;
- (void)setCarModeActive:(BOOL)a3;
- (void)setCellularDataStatusMap:(id)a3;
- (void)setCellularIfTotalBytes:(unint64_t)a3;
- (void)setCellularIfTotalPackets:(unint64_t)a3;
- (void)setCellularInterfaceName:(id)a3;
- (void)setCellularL3MBPS:(double)a3;
- (void)setCellularL3PPS:(unint64_t)a3;
- (void)setClients:(id)a3;
- (void)setCurrentDisplayState:(BOOL)a3 andLockState:(BOOL)a4;
- (void)setGameNotifyToken:(int)a3;
- (void)setInitialSetupCompleted:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsAirplayActiveOverInfra:(BOOL)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setIsDisplayOn:(BOOL)a3;
- (void)setIsFirstUserUnlocked:(BOOL)a3;
- (void)setIsInGameMode:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setManagedEventDispatchPort:(id)a3;
- (void)setManagedEventNotifyPort:(unsigned int)a3;
- (void)setManagedEventNotifyToken:(int)a3;
- (void)setMonitoredInterfaceNames:(id)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setOverrideApplicationState:(unint64_t)a3;
- (void)setOverrideNetworkState:(id)a3;
- (void)setPeriodicTasksLastRanAt:(id)a3;
- (void)setRtTrafficAgent:(id)a3;
- (void)setRunningForegroundApps:(id)a3;
- (void)setRunningNetworkingApps:(id)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setSymptomBackgroundFlowClassification:(unsigned int)a3;
- (void)setSymptomBackgroundFlowProperties:(unint64_t)a3;
- (void)setSymptomForegroundFlowClassification:(unsigned int)a3;
- (void)setSymptomForegroundFlowProperties:(unint64_t)a3;
- (void)setWifiCallInProgress:(BOOL)a3;
- (void)setWifiIfTotalBytes:(unint64_t)a3;
- (void)setWifiIfTotalInputBytes:(unint64_t)a3;
- (void)setWifiIfTotalInputPackets:(unint64_t)a3;
- (void)setWifiIfTotalOutputBytes:(unint64_t)a3;
- (void)setWifiIfTotalOutputPackets:(unint64_t)a3;
- (void)setWifiIfTotalPackets:(unint64_t)a3;
- (void)setWifiL3MBPS:(double)a3;
- (void)setWifiL3PPS:(unint64_t)a3;
- (void)startMonitoringInterface:(id)a3;
- (void)unregisterStateChangeCallback:(void *)a3;
- (void)updateOverrideNetworkState:(id)a3 overrideValue:(unint64_t)a4;
@end

@implementation WiFiUserInteractionMonitor

+ (id)sharedInstance
{
  if (qword_100219EC8 != -1) {
    dispatch_once(&qword_100219EC8, &stru_1001E69B8);
  }
  return (id)qword_100219EC0;
}

- (id)_initPrivate
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___WiFiUserInteractionMonitor;
  v2 = -[WiFiUserInteractionMonitor init](&v23, "init");
  if (!v2) {
    goto LABEL_16;
  }
  v3 = [NSMutableArray array];
  -[WiFiUserInteractionMonitor setClients:](v2, "setClients:", v3);

  v4 = [WiFiUserInteractionMonitor clients];
  if (!v4) {
    goto LABEL_15;
  }
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.WiFiUserInteractionMonitor", v6);
  -[WiFiUserInteractionMonitor setInternalQueue:](v2, "setInternalQueue:", v7);

  v4 = [WiFiUserInteractionMonitor internalQueue];
  if (!v4) {
    goto LABEL_15;
  }
  v8 = [NSMutableSet set];
  -[WiFiUserInteractionMonitor setMonitoredInterfaceNames:](v2, "setMonitoredInterfaceNames:", v8);

  v4 = [WiFiUserInteractionMonitor monitoredInterfaceNames];
  if (!v4) {
    goto LABEL_15;
  }
  -[WiFiUserInteractionMonitor setAnyCallInProgress:](v2, "setAnyCallInProgress:", 0LL);
  -[WiFiUserInteractionMonitor setWifiCallInProgress:](v2, "setWifiCallInProgress:", 0LL);
  -[WiFiUserInteractionMonitor setCallHostedOnThisDevice:](v2, "setCallHostedOnThisDevice:", 0LL);
  -[WiFiUserInteractionMonitor setIsCarPlay:](v2, "setIsCarPlay:", 0LL);
  -[WiFiUserInteractionMonitor setIsMediaPlaying:](v2, "setIsMediaPlaying:", 0LL);
  -[WiFiUserInteractionMonitor setIsAirplayActiveOverInfra:](v2, "setIsAirplayActiveOverInfra:", 0LL);
  if (&_managed_event_fetch)
  {
    if (!notify_register_mach_port( kSymptomManagedEventWiFiAppAwareNotification,  &v2->_managedEventNotifyPort,  0,  &v2->_managedEventNotifyToken))
    {
      v9 = -[WiFiUserInteractionMonitor internalQueue];
      f = (void *)dispatch_mach_create_f("com.apple.wifid.WiFiUserInteractionMonitor", v9, v2, sub_10013FDEC);
      -[WiFiUserInteractionMonitor setManagedEventDispatchPort:](v2, "setManagedEventDispatchPort:", f);

      v4 = [WiFiUserInteractionMonitor managedEventDispatchPort];
      if (!v4) {
        goto LABEL_15;
      }
      v11 = -[WiFiUserInteractionMonitor managedEventDispatchPort];
      dispatch_mach_connect( v11,  -[WiFiUserInteractionMonitor managedEventNotifyPort](v2, "managedEventNotifyPort"),  0LL,  0LL);

      goto LABEL_9;
    }

- (void)dealloc
{
  v3 = -[WiFiUserInteractionMonitor managedEventDispatchPort];

  if (v3)
  {
    v4 = -[WiFiUserInteractionMonitor managedEventDispatchPort];
    dispatch_mach_cancel();
  }

  if (-[WiFiUserInteractionMonitor managedEventNotifyToken](self, "managedEventNotifyToken"))
  {
    notify_cancel(-[WiFiUserInteractionMonitor managedEventNotifyToken](self, "managedEventNotifyToken"));
    -[WiFiUserInteractionMonitor setManagedEventNotifyToken:](self, "setManagedEventNotifyToken:", 0LL);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
  v6 = (void *)[v5 allObjects];

  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v10);
        v12 = [self rtTrafficAgent];

        if (v12)
        {
          v13 = [self rtTrafficAgent];
          v14 = [v13 registration];
          [v14 removeNetworkAgentFromInterfaceNamed:v11];
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  v15 = -[WiFiUserInteractionMonitor monitoredInterfaceNames];
  [v15 removeAllObjects];

  v16 = [NSNotificationCenter defaultCenter];
  [v16 removeObserver:self];

  v17 = -[WiFiUserInteractionMonitor clients];
  [v17 removeAllObjects];

  v18 = -[WiFiUserInteractionMonitor overrideNetworkState];
  [v18 removeAllObjects];

  ctServerConnectionRef = self->_ctServerConnectionRef;
  if (ctServerConnectionRef) {
    CFRelease(ctServerConnectionRef);
  }
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___WiFiUserInteractionMonitor;
  -[WiFiUserInteractionMonitor dealloc](&v20, "dealloc");
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnectionRef;
}

- (void)startMonitoringInterface:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    v4 = -[WiFiUserInteractionMonitor monitoredInterfaceNames];
    unsigned __int8 v5 = [v4 containsObject:v10];

    if ((v5 & 1) == 0)
    {
      v6 = -[WiFiUserInteractionMonitor monitoredInterfaceNames];
      [v6 addObject:v10];

      id v7 = [self rtTrafficAgent];
      if (v7)
      {
        id v8 = [self rtTrafficAgent];
        uint64_t v9 = (void *)[v8 registration];
        [v9 addNetworkAgentToInterfaceNamed:v10];
      }
    }
  }
}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v11 = a3;
  v6 = objc_autoreleasePoolPush();
  id v7 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    id v8 = objc_retainBlock(v11);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitor registerStateChangeCallback:withCallbackContext:]", v8, a4 message];
  }

  objc_autoreleasePoolPop(v6);
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___WiFiUserInteractionMonitorClient);
  -[WiFiUserInteractionMonitorClient setCallback:](v9, "setCallback:", v11);
  -[WiFiUserInteractionMonitorClient setContext:](v9, "setContext:", a4);
  id v10 = -[WiFiUserInteractionMonitor clients];
  [v10 addObject:v9];
}

- (void)unregisterStateChangeCallback:(void *)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6)
  {
    id v8 = v5;
    goto LABEL_13;
  }

  id v7 = v6;
  id v8 = 0LL;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
      if ([v11 context] == a3)
      {
        id v12 = v11;

        id v8 = v12;
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }

  while (v7);

  if (v8)
  {
    v13 = -[WiFiUserInteractionMonitor clients];
    [v13 removeObject:v8];

LABEL_13:
  }

- (void)setApplicationRunningState:(BOOL)a3 foregroundState:(BOOL)a4 andNetworkingState:(BOOL)a5 forBundleId:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  if (!v10) {
    goto LABEL_25;
  }
  id v11 = objc_autoreleasePoolPush();
  if (a3)
  {
    if (v7)
    {
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: %@ entered foreground", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
      }
      objc_autoreleasePoolPop(v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      [v12 addObject:v10];
    }

    else
    {
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: %@ entered background", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
      }
      objc_autoreleasePoolPop(v11);
      id v12 = -[WiFiUserInteractionMonitor runningForegroundApps];
      [v12 removeObject:v10];
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
    __int128 v15 = v14;
    if (v6)
    {
      [v14 addObject:v10];
      goto LABEL_16;
    }
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: %@ exited", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10 message];
    }
    objc_autoreleasePoolPop(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    [v13 removeObject:v10];

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
    __int128 v15 = v14;
  }

  [v14 removeObject:v10];
LABEL_16:

  -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:]( self,  "_notifyCaptiveWithApplicationState:",  -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState"));
  if (-[WiFiUserInteractionMonitor hasRealTimeAppProperty:](self, "hasRealTimeAppProperty:", v10))
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients"));
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          __int128 v21 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          __int128 v22 = [v21 callback];
          ((void (**)(void, id, uint64_t))v22)[2](v22, [v21 context], 8);
        }

        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v18);
    }
  }

- (void)setCurrentDisplayState:(BOOL)a3 andLockState:(BOOL)a4
{
  BOOL v4 = a4;
  -[WiFiUserInteractionMonitor setIsDisplayOn:](self, "setIsDisplayOn:", a3);
  -[WiFiUserInteractionMonitor setIsDeviceLocked:](self, "setIsDeviceLocked:", v4);
  if (!-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    && -[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn"))
  {
    -[WiFiUserInteractionMonitor setIsFirstUserUnlocked:](self, "setIsFirstUserUnlocked:", 1LL);
  }

  -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:]( self,  "_notifyCaptiveWithApplicationState:",  -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState"));
}

- (void)setOverrideApplicationState:(unint64_t)a3
{
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") != a3)
  {
    unsigned __int8 v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiUserInteractionMonitor setOverrideApplicationState:] setting override state to %llu" message:3];
    }
    objc_autoreleasePoolPop(v5);
    self->_overrideApplicationState = a3;
    -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:]( self,  "_notifyCaptiveWithApplicationState:",  -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
  }

- (void)updateOverrideNetworkState:(id)a3 overrideValue:(unint64_t)a4
{
  id v10 = a3;
  NSLog(@"updateOverrideNetworkState: ssid %@ state 0x%llx\n", v10, a4);
  BOOL v6 = [self overrideNetworkState];
  BOOL v7 = v6;
  if (a4)
  {
    id v8 = [NSNumber numberWithUnsignedLongLong:a4];
    [v7 setObject:v8 forKey:v10];

LABEL_5:
    goto LABEL_6;
  }

  uint64_t v9 = (void *)[v6 objectForKeyedSubscript:v10];

  if (v9)
  {
    BOOL v7 = [self overrideNetworkState];
    [v7 removeObjectForKey:v10];
    goto LABEL_5;
  }

- (void)resetOverrideStates
{
}

- (void)resetOverrideNetworkStates
{
  v3 = [self overrideNetworkState];

  if (v3)
  {
    BOOL v4 = [self overrideNetworkState];
    [v4 removeAllObjects];

    id v5 = [NSMutableDictionary dictionary];
    -[WiFiUserInteractionMonitor setOverrideNetworkState:](self, "setOverrideNetworkState:", v5);
  }

- (void)dumpOverrideNetworkState
{
  v3 = -[WiFiUserInteractionMonitor overrideNetworkState];

  if (v3)
  {
    id v4 = [self overrideNetworkState];
    NSLog(@"%s: overrideNetworkState %@\n", "-[WiFiUserInteractionMonitor dumpOverrideNetworkState]", v4);
  }

- (void)resetBackgroundApps
{
  id v2 = -[WiFiUserInteractionMonitor runningNetworkingApps];
  [v2 removeAllObjects];
}

- (void)runPeriodicTasks
{
  v3 = [NSDate date];
  id v4 = [self periodicTasksLastRanAt];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  BOOL v7 = [self periodicTasksLastRanAt];
  id v8 = [self periodicTasksLastRanAt];

  if (!v8 || v6 >= 5.0)
  {
    -[WiFiUserInteractionMonitor setPeriodicTasksLastRanAt:](self, "setPeriodicTasksLastRanAt:", v3);
    v40 = 0LL;
    getifaddrs(&v40);
    uint64_t v9 = v40;
    if (v40)
    {
      ifa_data = 0LL;
      do
      {
        if (v9->ifa_name)
        {
          if (v9->ifa_data)
          {
            ifa_addr = v9->ifa_addr;
            if (ifa_addr)
            {
              if (ifa_addr->sa_family == 18)
              {
                id v12 = -[WiFiUserInteractionMonitor monitoredInterfaceNames];
                if ([v12 count])
                {
                  ifa_name = v9->ifa_name;
                  __int128 v14 = -[WiFiUserInteractionMonitor monitoredInterfaceNames];
                  __int128 v15 = (void *)[v14 allObjects];
                  id v16 = [v15 objectAtIndexedSubscript:0];
                  LODWORD(ifa_name) = strcmp(ifa_name, (const char *)[v16 UTF8String]);

                  if (!(_DWORD)ifa_name) {
                    ifa_data = v9->ifa_data;
                  }
                }

                else
                {
                }
              }
            }
          }
        }

        uint64_t v9 = v9->ifa_next;
      }

      while (v9);
      if (ifa_data)
      {
        unint64_t v17 = (ifa_data[11] + ifa_data[10]);
        unint64_t v18 = (ifa_data[7] + ifa_data[5]);
        unint64_t v19 = -[WiFiUserInteractionMonitor wifiIfTotalBytes](self, "wifiIfTotalBytes");
        unint64_t v20 = -[WiFiUserInteractionMonitor wifiIfTotalPackets](self, "wifiIfTotalPackets");
        uint64_t v39 = ifa_data[10];
        unint64_t v21 = -[WiFiUserInteractionMonitor wifiIfTotalInputBytes](self, "wifiIfTotalInputBytes");
        uint64_t v37 = ifa_data[11];
        unint64_t v38 = v21;
        unint64_t v22 = -[WiFiUserInteractionMonitor wifiIfTotalOutputBytes](self, "wifiIfTotalOutputBytes");
        uint64_t v35 = ifa_data[5];
        unint64_t v36 = v22;
        unint64_t v23 = -[WiFiUserInteractionMonitor wifiIfTotalInputPackets](self, "wifiIfTotalInputPackets");
        uint64_t v34 = ifa_data[7];
        unint64_t v24 = -[WiFiUserInteractionMonitor wifiIfTotalOutputPackets](self, "wifiIfTotalOutputPackets");
        -[WiFiUserInteractionMonitor setWifiIfTotalInputBytes:]( self,  "setWifiIfTotalInputBytes:",  ifa_data[10]);
        -[WiFiUserInteractionMonitor setWifiIfTotalOutputBytes:]( self,  "setWifiIfTotalOutputBytes:",  ifa_data[11]);
        -[WiFiUserInteractionMonitor setWifiIfTotalInputPackets:]( self,  "setWifiIfTotalInputPackets:",  ifa_data[5]);
        -[WiFiUserInteractionMonitor setWifiIfTotalOutputPackets:]( self,  "setWifiIfTotalOutputPackets:",  ifa_data[7]);
        if (!v7)
        {
          -[WiFiUserInteractionMonitor setWifiIfTotalBytes:](self, "setWifiIfTotalBytes:", v17);
          -[WiFiUserInteractionMonitor setWifiIfTotalPackets:](self, "setWifiIfTotalPackets:", v18);
          goto LABEL_27;
        }

        unint64_t v25 = v17 - v19;
        if (-[WiFiUserInteractionMonitor wifiIfTotalBytes](self, "wifiIfTotalBytes") < v17) {
          -[WiFiUserInteractionMonitor setWifiL3MBPS:](self, "setWifiL3MBPS:", (double)v25 / v6 * 0.000000953674316);
        }
        -[WiFiUserInteractionMonitor setWifiIfTotalBytes:](self, "setWifiIfTotalBytes:", v17);
        if (-[WiFiUserInteractionMonitor wifiIfTotalPackets](self, "wifiIfTotalPackets") < v18) {
          -[WiFiUserInteractionMonitor setWifiL3PPS:]( self,  "setWifiL3PPS:",  (unint64_t)((double)(v18 - v20) / v6));
        }
        -[WiFiUserInteractionMonitor setWifiIfTotalPackets:](self, "setWifiIfTotalPackets:", v18);
        __int128 v26 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFi data did %llu(input:%llu output:%llu) bytes, %llu(input:%llu output:%llu) packets over %.3f seconds",  "-[WiFiUserInteractionMonitor runPeriodicTasks]",  v25,  v39 - v38,  v37 - v36,  v18 - v20,  v35 - v23,  v34 - v24,  *(void *)&v6);
        }
      }

      else
      {
        __int128 v26 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: failed to find if_data for WiFi interface." message:3 v27 v28 v29 v30 v31 v32 v33];
        }
      }

      objc_autoreleasePoolPop(v26);
LABEL_27:
      freeifaddrs(v40);
    }
  }
}

- (BOOL)isPriorityNetwork:(__WiFiNetwork *)a3
{
  double v5 = sub_100095BC8(a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = [self overrideNetworkState];
  if (v7
    && (id v8 = (void *)v7,
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]),
        v10,
        v9,
        v8,
        v10))
  {
    id v11 = -[WiFiUserInteractionMonitor overrideNetworkState];
    id v12 = [v11 objectForKey:v6];
    id v13 = [v12 unsignedLongLongValue];

    __int128 v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: using overridden isPriorityNetwork state as 0x%llx" message:3, @"-[WiFiUserInteractionMonitor isPriorityNetwork:]", v13];
    }
    objc_autoreleasePoolPop(v14);
    BOOL v15 = v13 & 1;
  }

  else
  {
    BOOL v15 = sub_1000A5674((uint64_t)a3);
  }

  return v15;
}

- (BOOL)isPublicNetwork:(__WiFiNetwork *)a3
{
  v3 = (CFDictionaryRef *)a3;
  double v5 = sub_100095BC8(a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = [self overrideNetworkState];
  if (v7
    && (id v8 = (void *)v7,
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]),
        v10,
        v9,
        v8,
        v10))
  {
    id v11 = [self overrideNetworkState];
    id v12 = [v11 objectForKey:v6];
    unint64_t v13 = (unint64_t)[v12 unsignedLongLongValue];

    __int128 v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: using overridden isPublicNetwork state as 0x%llx" message:3,  @"-[WiFiUserInteractionMonitor isPublicNetwork:]",  v13];
    }
    objc_autoreleasePoolPop(v14);
    v3 = (CFDictionaryRef *)((v13 >> 1) & 1);
  }

  else
  {
    LOBYTE(v3) = sub_1000A57CC(v3) != 0;
  }

  return (char)v3;
}

- (BOOL)isLowQualityNetwork:(__WiFiNetwork *)a3
{
  uint64_t v3 = (uint64_t)a3;
  double v5 = sub_100095BC8(a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = [self overrideNetworkState];
  if (v7
    && (id v8 = (void *)v7,
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]),
        v10,
        v9,
        v8,
        v10))
  {
    id v11 = -[WiFiUserInteractionMonitor overrideNetworkState];
    id v12 = [v11 objectForKey:v6];
    unint64_t v13 = (unint64_t)[v12 unsignedLongLongValue];

    __int128 v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using overridden isLowQualityNetwork state as 0x%llx",  "-[WiFiUserInteractionMonitor isLowQualityNetwork:]",  v13);
    }
    objc_autoreleasePoolPop(v14);
    uint64_t v3 = (v13 >> 2) & 1;
  }

  else
  {
    LOBYTE(v3) = sub_1000A580C(v3);
  }

  return v3;
}

- (BOOL)isSetupCompleted
{
  if (&_BYSetupAssistantNeedsToRun && !-[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted"))
  {
    -[WiFiUserInteractionMonitor setSetupCompleted:]( self,  "setSetupCompleted:",  BYSetupAssistantNeedsToRun() ^ 1);
    uint64_t v3 = objc_autoreleasePoolPush();
    id v4 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      unsigned int v5 = -[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted");
      double v6 = "not completed";
      if (v5) {
        double v6 = "completed";
      }
      objc_msgSend(v4, "WFLog:message:", 3, "%s: Setup is %s", "-[WiFiUserInteractionMonitor isSetupCompleted]", v6);
    }

    objc_autoreleasePoolPop(v3);
  }

  else
  {
    -[WiFiUserInteractionMonitor setSetupCompleted:](self, "setSetupCompleted:", 1LL);
  }

  return -[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted");
}

- (BOOL)isInitialSetupCompleted
{
  if (&_BYSetupAssistantNeedsToRun) {
    BOOL v3 = &_BYSetupAssistantHasCompletedInitialRun == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted"))
  {
    -[WiFiUserInteractionMonitor setInitialSetupCompleted:](self, "setInitialSetupCompleted:", 1LL);
  }

  else
  {
    if ((BYSetupAssistantHasCompletedInitialRun() & 1) != 0) {
      uint64_t v4 = 1LL;
    }
    else {
      uint64_t v4 = BYSetupAssistantNeedsToRun() ^ 1;
    }
    -[WiFiUserInteractionMonitor setInitialSetupCompleted:](self, "setInitialSetupCompleted:", v4);
    unsigned int v5 = objc_autoreleasePoolPush();
    double v6 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      unsigned int v7 = -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted");
      id v8 = "not completed";
      if (v7) {
        id v8 = "completed";
      }
      objc_msgSend( v6,  "WFLog:message:",  3,  "%s: Initial setup is %s",  "-[WiFiUserInteractionMonitor isInitialSetupCompleted]",  v8);
    }

    objc_autoreleasePoolPop(v5);
  }

  return -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted");
}

- (BOOL)isUsingSustainedWiFiData
{
  return v3 > 2.0 || -[WiFiUserInteractionMonitor wifiL3PPS](self, "wifiL3PPS") > 0x28;
}

- (BOOL)isUsingSustainedCellularData
{
  return v3 > 2.0 || -[WiFiUserInteractionMonitor cellularL3PPS](self, "cellularL3PPS") > 0x28;
}

- (BOOL)isCellularDataUsable
{
  double v3 = [self cellularDataStatusMap];

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](self, "cellularDataStatusMap"));
    unsigned int v5 = [v4 containsObject:@"WiFiCellularDataStatusNoLTE"] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isCellularInexpensive5G
{
  id v2 = self;
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using overridden inexpensive cellular state as 0x%llx",  "-[WiFiUserInteractionMonitor isCellularInexpensive5G]",  -[WiFiUserInteractionMonitor overrideApplicationState](v2, "overrideApplicationState"));
    }
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](v2, "overrideApplicationState") >> 7) & 1;
  }

  else
  {
    uint64_t v4 = (void *)[v2 cellularDataStatusMap];

    if (v4)
    {
      unsigned int v5 = [v2 cellularInterfaceName];
      if (sub_10003B4E8(v5))
      {
        LOBYTE(v2) = 0;
      }

      else
      {
        double v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](v2, "cellularDataStatusMap"));
        LOBYTE(v2) = [v6 containsObject:@"WiFiCellularDataStatus5GAvailable"];
      }
    }

    else
    {
      LOBYTE(v2) = 0;
    }
  }

  return (char)v2;
}

- (BOOL)isAskToJoinAllowed
{
  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: setup not completed. Not allowing ask-to-join.",  "-[WiFiUserInteractionMonitor isAskToJoinAllowed]",  v6,  v7);
    }
    goto LABEL_8;
  }

  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: navigating(%d) or in call(%d). Not allowing ask-to-join.",  "-[WiFiUserInteractionMonitor isAskToJoinAllowed]",  -[WiFiUserInteractionMonitor navigating](self, "navigating"),  -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    BOOL v4 = 0;
    goto LABEL_9;
  }

  if (!-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground")) {
    return 0;
  }
  double v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: in FG networking app. Allowing atj.",  "-[WiFiUserInteractionMonitor isAskToJoinAllowed]");
  }
  BOOL v4 = 1;
LABEL_9:
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isNetworkRecommendationAllowed
{
  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: setup not completed. Not allowing recommendation." message:3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", v6, v7];
    }
    goto LABEL_8;
  }

  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: navigating(%d) or in call(%d). Not allowing recommendation.",  "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]",  -[WiFiUserInteractionMonitor navigating](self, "navigating"),  -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    BOOL v4 = 0;
    goto LABEL_9;
  }

  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: cellular is 5G and inexpensive. Not allowing recommendation.",  "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]",  v6,  v7);
    }
    goto LABEL_8;
  }

  if (-[WiFiUserInteractionMonitor isUsingSustainedCellularData](self, "isUsingSustainedCellularData"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: in active cellular data usage. Allowing recommendation.",  "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
    }
  }

  else if (-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: in FG networking app. Allowing recommendation.",  "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
    }
  }

  else
  {
    if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen")
      || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp")
      || -[WiFiUserInteractionMonitor isCellularDataUsable](self, "isCellularDataUsable"))
    {
      return 0;
    }

    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: in an app and no cellular. Allowing recommendation." message:3];
    }
  }

  BOOL v4 = 1;
LABEL_9:
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isPersonalHotspotRecommendationAllowed
{
  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: setup not completed. Not allowing recommendation." message:3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6];
    }
    goto LABEL_8;
  }

  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: navigating(%d) or in call(%d). Not allowing recommendation.",  "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]",  -[WiFiUserInteractionMonitor navigating](self, "navigating"),  -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
    }
LABEL_8:
    objc_autoreleasePoolPop(v3);
    return 0;
  }

  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: cellular is 5G and inexpensive. Not allowing recommendation.",  "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]",  v5,  v6);
    }
    goto LABEL_8;
  }

  if (-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    || !-[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn"))
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Device locked or Display is OFF. Not allowing recommendation.",  "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]",  v5,  v6);
    }
    goto LABEL_8;
  }

  return 1;
}

+ (id)getHomeBundleIds
{
  return &off_1002058D0;
}

+ (BOOL)checkIfMatchesHomeBundleIds:(id)a3
{
  id v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = [OBJC_CLASS___WiFiUserInteractionMonitor getHomeBundleIds];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString", (void)v11));
        LOBYTE(v8) = [v9 containsString:v8];

        if ((v8 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

+ (id)getKnownNonNetworkingBundleIds
{
  return &off_1002058E8;
}

+ (BOOL)checkIfMatchesNonNetworkingBundleIds:(id)a3
{
  id v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = [OBJC_CLASS___WiFiUserInteractionMonitor getKnownNonNetworkingBundleIds];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = 1;
      if (objc_msgSend(v3, "rangeOfString:options:", *(void *)(*((void *)&v11 + 1) + 8 * v8), 1, (void)v11) != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isInHomeScreen
{
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    id v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using overridden application state as %llu",  "-[WiFiUserInteractionMonitor isInHomeScreen]",  -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") >> 2) & 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    id v6 = [v5 count];

    if (v6)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      uint64_t v8 = (void *)[v7 allObjects];

      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            if (!+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:]( &OBJC_CLASS___WiFiUserInteractionMonitor,  "checkIfMatchesHomeBundleIds:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)))
            {
              LOBYTE(v4) = 0;
              goto LABEL_16;
            }
          }

          id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      LOBYTE(v4) = 1;
LABEL_16:
    }

    else
    {
      __int128 v13 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: no runningForegroundApps" message:3];
      }
      objc_autoreleasePoolPop(v13);
      LOBYTE(v4) = 1;
    }
  }

  return v4;
}

- (BOOL)isNetworkingAppInForeground
{
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    id v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using overridden application state as %llu",  "-[WiFiUserInteractionMonitor isNetworkingAppInForeground]",  -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    objc_autoreleasePoolPop(v3);
    return -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") & 1;
  }

  else if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen") {
         || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp"))
  }
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    id v6 = [NSMutableSet setWithSet:v5];

    BOOL v4 = [self runningNetworkingApps];
    [v6 intersectSet:v4];

    LOBYTE(v4) = [v6 count] != 0;
  }

  return (char)v4;
}

- (BOOL)hasRealTimeAppProperty:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1001422A8;
  uint64_t v32 = sub_1001422B8;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted")) {
    goto LABEL_7;
  }
  unsigned int v5 = !-[WiFiUserInteractionMonitor isFirstUserUnlocked](self, "isFirstUserUnlocked");
  if (!v4) {
    LOBYTE(v5) = 1;
  }
  if ((v5 & 1) != 0)
  {
LABEL_7:
    unsigned __int8 v10 = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAttributes](self, "appAttributes"));
    uint64_t v7 = [v6 objectForKey:v4];
    uint64_t v8 = (void *)v29[5];
    v29[5] = v7;

    id v9 = (void *)v29[5];
    if (v9)
    {
      unsigned __int8 v10 = [v9 BOOLValue];
    }

    else
    {
      if (objc_opt_class(&OBJC_CLASS___LSApplicationRecord))
      {
        dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
        __int128 v13 = (dispatch_queue_s *)[self internalQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001422C0;
        block[3] = &unk_1001E6A28;
        id v14 = v4;
        id v20 = v14;
        unint64_t v22 = &v24;
        unint64_t v23 = &v28;
        __int128 v15 = v12;
        unint64_t v21 = v15;
        dispatch_async(v13, block);

        dispatch_time_t v16 = dispatch_time(0LL, 10000000LL);
        if (dispatch_semaphore_wait(v15, v16))
        {
          __int128 v17 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"%s: timed out waiting for LSApplicationRecord" message:3];
          }
          objc_autoreleasePoolPop(v17);
        }

        else if (v29[5])
        {
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAttributes](self, "appAttributes"));
          [v18 setObject:v29[5] forKey:v14];
        }
      }

      unsigned __int8 v10 = *((_BYTE *)v25 + 24) != 0;
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

- (BOOL)isRealTimeAppActive
{
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    id v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using overridden application state as %llu",  "-[WiFiUserInteractionMonitor isRealTimeAppActive]",  -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    }
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") >> 6) & 1;
  }

  else if (-[WiFiUserInteractionMonitor isWiFiCallInProgress](self, "isWiFiCallInProgress") {
         || (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent")),
  }
             unsigned __int8 v6 = [v5 isActive],
             v5,
             (v6 & 1) != 0))
  {
LABEL_17:
    LOBYTE(v4) = 1;
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    uint64_t v8 = (void *)[v7 allObjects];

    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (-[WiFiUserInteractionMonitor hasRealTimeAppProperty:]( self,  "hasRealTimeAppProperty:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i)))
          {

            goto LABEL_17;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    LOBYTE(v4) = -[WiFiUserInteractionMonitor _isSymptomTrackingRtTrafficForFlowNamed:withProperties:andClassification:]( self,  "_isSymptomTrackingRtTrafficForFlowNamed:withProperties:andClassification:",  @"foreground",  -[WiFiUserInteractionMonitor symptomForegroundFlowProperties]( self,  "symptomForegroundFlowProperties"),  -[WiFiUserInteractionMonitor symptomForegroundFlowClassification]( self,  "symptomForegroundFlowClassification"));
  }

  return v4;
}

- (BOOL)isInNonNetworkingApp
{
  if (!-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen"))
  {
    uint64_t v3 = [self runningForegroundApps];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      id v6 = [v5 count];

      if (v6)
      {
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
        uint64_t v8 = (void *)[v7 allObjects];

        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
              if (!+[WiFiUserInteractionMonitor checkIfMatchesNonNetworkingBundleIds:]( &OBJC_CLASS___WiFiUserInteractionMonitor,  "checkIfMatchesNonNetworkingBundleIds:",  v13)
                && !+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:]( &OBJC_CLASS___WiFiUserInteractionMonitor,  "checkIfMatchesHomeBundleIds:",  v13))
              {

                return 0;
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        __int128 v14 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: currently no networking app is in the foreground" message:3];
        }
        objc_autoreleasePoolPop(v14);
      }
    }
  }

  return 1;
}

- (BOOL)isAnyCallInProgress
{
  if (-[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress")) {
    return 1;
  }
  BOOL v4 = [self rtTrafficAgent];
  unsigned __int8 v5 = [v4 isActive];

  return v5;
}

- (BOOL)isWiFiCallInProgress
{
  if (-[WiFiUserInteractionMonitor wifiCallInProgress](self, "wifiCallInProgress")) {
    return 1;
  }
  BOOL v4 = [self rtTrafficAgent];
  unsigned __int8 v5 = [v4 isActive];

  return v5;
}

- (BOOL)isAVConferenceActive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (BOOL)isCoPresenceActive
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  if ([v3 avcMinJB])
  {
    BOOL v4 = [self rtTrafficAgent];
    BOOL v5 = (unint64_t)[v4 avcMinJB] < 0x15;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCarModeActive
{
  if (-[WiFiUserInteractionMonitor carModeActive](self, "carModeActive")) {
    return 1;
  }
  else {
    return -[WiFiUserInteractionMonitor navigating](self, "navigating");
  }
}

- (BOOL)isCallHostedOnThisDevice
{
  return -[WiFiUserInteractionMonitor callHostedOnThisDevice](self, "callHostedOnThisDevice");
}

- (BOOL)canTrigger11axPerfStudyForForegroundFlows
{
  return -[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:]( self,  "_canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:",  @"foreground",  -[WiFiUserInteractionMonitor symptomForegroundFlowProperties](self, "symptomForegroundFlowProperties"),  -[WiFiUserInteractionMonitor symptomForegroundFlowClassification]( self,  "symptomForegroundFlowClassification"));
}

- (BOOL)canTrigger11axPerfStudyForBackgroundFlows
{
  return -[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:]( self,  "_canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:",  @"background",  -[WiFiUserInteractionMonitor symptomBackgroundFlowProperties](self, "symptomBackgroundFlowProperties"),  -[WiFiUserInteractionMonitor symptomBackgroundFlowClassification]( self,  "symptomBackgroundFlowClassification"));
}

- (BOOL)_canTrigger11axPerfStudyForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  char v5 = a5;
  unsigned int v6 = a4;
  id v7 = a3;
  if ((v5 & 0x1F) != 0)
  {
    uint64_t v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: app-aware flow:%@ latency:0x%x jitter:0x%x lossTolerance:0x%x duration:0x%x requiredBandwidth:0x%x preferredBandwidth:0x%x", "-[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:]", v7, v6, (v6 >> 1), (v6 >> 2), (v6 >> 3), (v6 >> 4), (v6 >> 5) message];
    }
    objc_autoreleasePoolPop(v8);
    int v9 = ((v6 >> 2) & 1) + ((v6 >> 3) & 1);
    unsigned int v10 = v9 + ((v6 >> 1) & 1);
    unsigned int v11 = v9 + ((v6 >> 4) & 1);
    BOOL v13 = v10 > 2 || v11 > 2 || (v6 & 0xC00) != 0LL;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isSymptomTrackingRtTrafficForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  return (a5 & 0x1F) != 0;
}

- (unint64_t)_applicationNotifyState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
  BOOL v4 = [NSMutableSet setWithSet:v3];

  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
  [v4 minusSet:v5];

  if (-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    || -[WiFiUserInteractionMonitor navigating](self, "navigating")
    || !-[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn")
    || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp"))
  {
    BOOL v6 = 0LL;
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    BOOL v6 = [v9 count] != 0;
  }

  if ([v4 count]) {
    unint64_t v7 = v6 | 2;
  }
  else {
    unint64_t v7 = v6;
  }

  return v7;
}

- (void)_notifyCaptiveWithApplicationState:(unint64_t)a3
{
  if (dword_100219ED0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    char v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100142CC4;
    block[3] = &unk_1001E2620;
    void block[4] = a3;
    dispatch_async(v5, block);
  }

  else
  {
    BOOL v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"notify token is null"];
    }
    objc_autoreleasePoolPop(v6);
  }

- (void)_handleManagedEventNotification
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100142D44;
  v2[3] = &unk_1001E6A50;
  v2[4] = self;
  managed_event_fetch(11LL, v2);
}

- (BOOL)_isCellularDataAllowedForApp:(id)a3
{
  id v4 = a3;
  CFDictionaryRef theDict = 0LL;
  BOOL v5 = 1;
  if (v4)
  {
    ctServerConnectionRef = self->_ctServerConnectionRef;
    if (ctServerConnectionRef)
    {
      _CTServerConnectionCopyCellularUsagePolicy(ctServerConnectionRef, v4, &theDict);
      if (theDict)
      {
        Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kCTCellularUsagePolicyDataAllowed);
        if (Value)
        {
          uint64_t v8 = Value;
          CFTypeID v9 = CFGetTypeID(Value);
          if (v9 == CFBooleanGetTypeID() && !CFBooleanGetValue(v8))
          {
            unsigned int v11 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [(id)qword_100219F60 WFLog:3, "%s: cellular data usage not allowed for %@", "-[WiFiUserInteractionMonitor _isCellularDataAllowedForApp:]", v4 message];
            }
            objc_autoreleasePoolPop(v11);
            BOOL v5 = 0;
          }

          else
          {
            BOOL v5 = 1;
          }
        }

        CFRelease(theDict);
      }
    }
  }

  return v5;
}

- (id)_stateInfo
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = [NSDate date];
  BOOL v5 = [NSString stringWithFormat:@"%p@%@", self, v4];
  BOOL v6 = (objc_class *)objc_opt_class(self);
  unint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v3 setObject:v5 forKeyedSubscript:v8];

  CFTypeID v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAwareDetails](self, "appAwareDetails"));
  [v3 setObject:v9 forKeyedSubscript:@"AppAwareDetails"];

  unsigned int v10 = [NSString stringWithFormat:@"0x%llx" [self symptomForegroundFlowProperties]];
  [v3 setObject:v10 forKeyedSubscript:@"ForegroundFlows"];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%llx",  -[WiFiUserInteractionMonitor symptomBackgroundFlowProperties]( self,  "symptomBackgroundFlowProperties")));
  [v3 setObject:v11 forKeyedSubscript:@"BackgroundFlows"];

  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%x",  -[WiFiUserInteractionMonitor symptomForegroundFlowClassification]( self,  "symptomForegroundFlowClassification")));
  [v3 setObject:v12 forKeyedSubscript:@"ForegroundClassification"];

  BOOL v13 = [NSString stringWithFormat:@"0x%x" [self symptomBackgroundFlowClassification]];
  [v3 setObject:v13 forKeyedSubscript:@"BackgroundClassification"];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
  [v3 setObject:v14 forKeyedSubscript:@"ForegroundApps"];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
  [v3 setObject:v15 forKeyedSubscript:@"NetworkingApps"];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
  [v3 setObject:v16 forKeyedSubscript:@"InterfaceNames"];

  if (-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted")) {
    __int128 v17 = @"YES";
  }
  else {
    __int128 v17 = @"NO";
  }
  [v3 setObject:v17 forKeyedSubscript:@"IsSetupCompleted"];
  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")) {
    __int128 v18 = @"YES";
  }
  else {
    __int128 v18 = @"NO";
  }
  [v3 setObject:v18 forKeyedSubscript:@"IsNavigating"];
  if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen")) {
    __int128 v19 = @"YES";
  }
  else {
    __int128 v19 = @"NO";
  }
  [v3 setObject:v19 forKeyedSubscript:@"IsInHomeScreen"];
  if (-[WiFiUserInteractionMonitor isAnyCallInProgress](self, "isAnyCallInProgress")) {
    id v20 = @"YES";
  }
  else {
    id v20 = @"NO";
  }
  [v3 setObject:v20 forKeyedSubscript:@"IsAnyCallInProgress"];
  if (-[WiFiUserInteractionMonitor isWiFiCallInProgress](self, "isWiFiCallInProgress")) {
    unint64_t v21 = @"YES";
  }
  else {
    unint64_t v21 = @"NO";
  }
  [v3 setObject:v21 forKeyedSubscript:@"IsWiFiCallInProgress"];
  if (-[WiFiUserInteractionMonitor isCallHostedOnThisDevice](self, "isCallHostedOnThisDevice")) {
    unint64_t v22 = @"YES";
  }
  else {
    unint64_t v22 = @"NO";
  }
  [v3 setObject:v22 forKeyedSubscript:@"IsCallHostedOnThisDevice"];
  if (-[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp")) {
    unint64_t v23 = @"YES";
  }
  else {
    unint64_t v23 = @"NO";
  }
  [v3 setObject:v23 forKeyedSubscript:@"IsInNonNetworkingApp"];
  if (-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground")) {
    uint64_t v24 = @"YES";
  }
  else {
    uint64_t v24 = @"NO";
  }
  [v3 setObject:v24 forKeyedSubscript:@"IsNetworkingAppInForeground"];
  if (-[WiFiUserInteractionMonitor isRealTimeAppActive](self, "isRealTimeAppActive")) {
    unint64_t v25 = @"YES";
  }
  else {
    unint64_t v25 = @"NO";
  }
  [v3 setObject:v25 forKeyedSubscript:@"IsRealTimeAppActive"];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  else {
    char v27 = @"NO";
  }
  [v3 setObject:v27 forKeyedSubscript:@"IsAVConferenceActive"];

  uint64_t v28 = (void *)[self rtTrafficAgent];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llums",  [v28 avcMinJB]));
  [v3 setObject:v29 forKeyedSubscript:@"AVCMinJitterBuffer"];

  if (-[WiFiUserInteractionMonitor isCoPresenceActive](self, "isCoPresenceActive")) {
    uint64_t v30 = @"YES";
  }
  else {
    uint64_t v30 = @"NO";
  }
  [v3 setObject:v30 forKeyedSubscript:@"IsCoPresenceActive"];
  if (-[WiFiUserInteractionMonitor isCellularDataUsable](self, "isCellularDataUsable")) {
    uint64_t v31 = @"YES";
  }
  else {
    uint64_t v31 = @"NO";
  }
  [v3 setObject:v31 forKeyedSubscript:@"IsCellularDataUsable"];
  if (-[WiFiUserInteractionMonitor isUsingSustainedCellularData](self, "isUsingSustainedCellularData")) {
    uint64_t v32 = @"YES";
  }
  else {
    uint64_t v32 = @"NO";
  }
  [v3 setObject:v32 forKeyedSubscript:@"IsUsingCellularData"];
  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G")) {
    id v33 = @"YES";
  }
  else {
    id v33 = @"NO";
  }
  [v3 setObject:v33 forKeyedSubscript:@"IsCellularInexpensive5G"];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  uint64_t v35 = (void *)[v34 description];
  [v3 setObject:v35 forKeyedSubscript:@"overrideNetworkState"];

  if (-[WiFiUserInteractionMonitor isAskToJoinAllowed](self, "isAskToJoinAllowed")) {
    unint64_t v36 = @"YES";
  }
  else {
    unint64_t v36 = @"NO";
  }
  [v3 setObject:v36 forKeyedSubscript:@"IsAskToJoinAllowed"];
  if (-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed](self, "isNetworkRecommendationAllowed")) {
    uint64_t v37 = @"YES";
  }
  else {
    uint64_t v37 = @"NO";
  }
  [v3 setObject:v37 forKeyedSubscript:@"IsNetworkRecommendationAllowed"];
  -[WiFiUserInteractionMonitor cellularL3MBPS](self, "cellularL3MBPS");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.2fMBps/%llupps",  v38,  -[WiFiUserInteractionMonitor cellularL3PPS](self, "cellularL3PPS")));
  [v3 setObject:v39 forKeyedSubscript:@"CellularUsage"];

  -[WiFiUserInteractionMonitor wifiL3MBPS](self, "wifiL3MBPS");
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.2fMBps/%llupps",  v40,  -[WiFiUserInteractionMonitor wifiL3PPS](self, "wifiL3PPS")));
  [v3 setObject:v41 forKeyedSubscript:@"WiFiUsage"];

  return v3;
}

- (id)description
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor _stateInfo](self, "_stateInfo"));
  unsigned __int8 v3 = (void *)[v2 description];

  return v3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isAirplayActiveOverInfra
{
  return self->_isAirplayActiveOverInfra;
}

- (void)setIsAirplayActiveOverInfra:(BOOL)a3
{
  self->_isAirplayActiveOverInfra = a3;
}

- (unint64_t)symptomForegroundFlowProperties
{
  return self->_symptomForegroundFlowProperties;
}

- (void)setSymptomForegroundFlowProperties:(unint64_t)a3
{
  self->_symptomForegroundFlowProperties = a3;
}

- (unint64_t)symptomBackgroundFlowProperties
{
  return self->_symptomBackgroundFlowProperties;
}

- (void)setSymptomBackgroundFlowProperties:(unint64_t)a3
{
  self->_symptomBackgroundFlowProperties = a3;
}

- (unsigned)symptomForegroundFlowClassification
{
  return self->_symptomForegroundFlowClassification;
}

- (void)setSymptomForegroundFlowClassification:(unsigned int)a3
{
  self->_symptomForegroundFlowClassification = a3;
}

- (unsigned)symptomBackgroundFlowClassification
{
  return self->_symptomBackgroundFlowClassification;
}

- (void)setSymptomBackgroundFlowClassification:(unsigned int)a3
{
  self->_symptomBackgroundFlowClassification = a3;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (unsigned)managedEventNotifyPort
{
  return self->_managedEventNotifyPort;
}

- (void)setManagedEventNotifyPort:(unsigned int)a3
{
  self->_managedEventNotifyPort = a3;
}

- (int)managedEventNotifyToken
{
  return self->_managedEventNotifyToken;
}

- (void)setManagedEventNotifyToken:(int)a3
{
  self->_managedEventNotifyToken = a3;
}

- (OS_dispatch_mach)managedEventDispatchPort
{
  return self->_managedEventDispatchPort;
}

- (void)setManagedEventDispatchPort:(id)a3
{
}

- (NSDictionary)appAwareDetails
{
  return self->_appAwareDetails;
}

- (void)setAppAwareDetails:(id)a3
{
}

- (WiFiUserInteractionMonitorNetworkAgent)rtTrafficAgent
{
  return self->_rtTrafficAgent;
}

- (void)setRtTrafficAgent:(id)a3
{
}

- (BOOL)anyCallInProgress
{
  return self->_anyCallInProgress;
}

- (void)setAnyCallInProgress:(BOOL)a3
{
  self->_anyCallInProgress = a3;
}

- (BOOL)wifiCallInProgress
{
  return self->_wifiCallInProgress;
}

- (void)setWifiCallInProgress:(BOOL)a3
{
  self->_wifiCallInProgress = a3;
}

- (BOOL)callHostedOnThisDevice
{
  return self->_callHostedOnThisDevice;
}

- (void)setCallHostedOnThisDevice:(BOOL)a3
{
  self->_callHostedOnThisDevice = a3;
}

- (NSMutableSet)runningForegroundApps
{
  return self->_runningForegroundApps;
}

- (void)setRunningForegroundApps:(id)a3
{
}

- (NSMutableSet)runningNetworkingApps
{
  return self->_runningNetworkingApps;
}

- (void)setRunningNetworkingApps:(id)a3
{
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)initialSetupCompleted
{
  return self->_initialSetupCompleted;
}

- (void)setInitialSetupCompleted:(BOOL)a3
{
  self->_initialSetupCompleted = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableSet)monitoredInterfaceNames
{
  return self->_monitoredInterfaceNames;
}

- (void)setMonitoredInterfaceNames:(id)a3
{
}

- (NSDate)periodicTasksLastRanAt
{
  return self->_periodicTasksLastRanAt;
}

- (void)setPeriodicTasksLastRanAt:(id)a3
{
}

- (NSMutableDictionary)overrideNetworkState
{
  return self->_overrideNetworkState;
}

- (void)setOverrideNetworkState:(id)a3
{
}

- (unint64_t)cellularL3PPS
{
  return self->_cellularL3PPS;
}

- (void)setCellularL3PPS:(unint64_t)a3
{
  self->_cellularL3PPS = a3;
}

- (double)cellularL3MBPS
{
  return self->_cellularL3MBPS;
}

- (void)setCellularL3MBPS:(double)a3
{
  self->_cellularL3MBPS = a3;
}

- (unint64_t)cellularIfTotalPackets
{
  return self->_cellularIfTotalPackets;
}

- (void)setCellularIfTotalPackets:(unint64_t)a3
{
  self->_cellularIfTotalPackets = a3;
}

- (unint64_t)cellularIfTotalBytes
{
  return self->_cellularIfTotalBytes;
}

- (void)setCellularIfTotalBytes:(unint64_t)a3
{
  self->_cellularIfTotalBytes = a3;
}

- (unint64_t)wifiL3PPS
{
  return self->_wifiL3PPS;
}

- (void)setWifiL3PPS:(unint64_t)a3
{
  self->_wifiL3PPS = a3;
}

- (double)wifiL3MBPS
{
  return self->_wifiL3MBPS;
}

- (void)setWifiL3MBPS:(double)a3
{
  self->_wifiL3MBPS = a3;
}

- (unint64_t)wifiIfTotalPackets
{
  return self->_wifiIfTotalPackets;
}

- (void)setWifiIfTotalPackets:(unint64_t)a3
{
  self->_wifiIfTotalPackets = a3;
}

- (unint64_t)wifiIfTotalBytes
{
  return self->_wifiIfTotalBytes;
}

- (void)setWifiIfTotalBytes:(unint64_t)a3
{
  self->_wifiIfTotalBytes = a3;
}

- (unint64_t)wifiIfTotalInputPackets
{
  return self->_wifiIfTotalInputPackets;
}

- (void)setWifiIfTotalInputPackets:(unint64_t)a3
{
  self->_wifiIfTotalInputPackets = a3;
}

- (unint64_t)wifiIfTotalOutputPackets
{
  return self->_wifiIfTotalOutputPackets;
}

- (void)setWifiIfTotalOutputPackets:(unint64_t)a3
{
  self->_wifiIfTotalOutputPackets = a3;
}

- (unint64_t)wifiIfTotalInputBytes
{
  return self->_wifiIfTotalInputBytes;
}

- (void)setWifiIfTotalInputBytes:(unint64_t)a3
{
  self->_wifiIfTotalInputBytes = a3;
}

- (unint64_t)wifiIfTotalOutputBytes
{
  return self->_wifiIfTotalOutputBytes;
}

- (void)setWifiIfTotalOutputBytes:(unint64_t)a3
{
  self->_wifiIfTotalOutputBytes = a3;
}

- (unint64_t)overrideApplicationState
{
  return self->_overrideApplicationState;
}

- (BOOL)isFirstUserUnlocked
{
  return self->_isFirstUserUnlocked;
}

- (void)setIsFirstUserUnlocked:(BOOL)a3
{
  self->_isFirstUserUnlocked = a3;
}

- (NSMutableDictionary)appAttributes
{
  return self->_appAttributes;
}

- (void)setAppAttributes:(id)a3
{
}

- (int)gameNotifyToken
{
  return self->_gameNotifyToken;
}

- (void)setGameNotifyToken:(int)a3
{
  self->_gameNotifyToken = a3;
}

- (BOOL)carModeActive
{
  return self->_carModeActive;
}

- (void)setCarModeActive:(BOOL)a3
{
  self->_carModeActive = a3;
}

- (BOOL)isInGameMode
{
  return self->_isInGameMode;
}

- (void)setIsInGameMode:(BOOL)a3
{
  self->_isInGameMode = a3;
}

- (NSString)cellularInterfaceName
{
  return self->_cellularInterfaceName;
}

- (void)setCellularInterfaceName:(id)a3
{
}

- (NSSet)cellularDataStatusMap
{
  return self->_cellularDataStatusMap;
}

- (void)setCellularDataStatusMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end