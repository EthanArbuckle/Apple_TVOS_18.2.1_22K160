@interface WiFiUsageLinkSession
- (BOOL)useSavedJoinStats;
- (WiFiUsageLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)addDictionary:(id)a3 withKeysPrefix:(id)a4 toFlatDictionary:(id)a5;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
- (void)displayStateDidChange:(BOOL)a3;
- (void)faultEventDetected:(unint64_t)a3;
- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4;
- (void)handleFaultEventWithReason:(id)a3;
- (void)interfaceRankingDidChange:(BOOL)a3;
- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7;
- (void)linkQualityDidChange:(id)a3;
- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)performLinkTestFor:(id)a3 isTriggeredByFault:(BOOL)a4;
- (void)processDHCPChanges:(id)a3;
- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11;
- (void)processIPv4Changes:(id)a3;
- (void)processIPv6Changes:(id)a3;
- (void)rangingCompleted;
- (void)retryLinkTestInOneMinute;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
- (void)updateLinkRecoveryDisabled:(BOOL)a3;
- (void)updateLinkTestInterval:(unint64_t)a3;
@end

@implementation WiFiUsageLinkSession

- (WiFiUsageLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v9,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  4LL,  a3,  a4);
  v4->_linkUp = 0;
  lastLinkTest = v4->_lastLinkTest;
  v4->_lastLinkTest = 0LL;

  v4->_numLinkTestFailures = 0LL;
  v4->_didHandleFaultEvent = 0;
  v4->_didBecomePrimary = 0;
  v4->_foundSuccessfulLinkTest = 0;
  v4->_numLinkRecoverySkips = 0LL;
  v4->_periodicLinkTestInterval = 60LL;
  lastFaultEventHandled = v4->_lastFaultEventHandled;
  v4->_lastFaultEventHandled = 0LL;

  v4->_band = 3;
  -[WiFiUsageSession setLinkRecoveryDisabled:](v4, "setLinkRecoveryDisabled:", 0LL);
  linkTestResult = v4->_linkTestResult;
  v4->_linkTestResult = 0LL;

  return v4;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (a6 && !-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
    -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]( &v15,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_,  v12,  a4,  a5,  a6,  v13);
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
    -[WiFiUsageSession updateAssociatedNetworkDetails:](&v14, sel_updateAssociatedNetworkDetails_, v13);
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
    -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]( &v15,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_,  v12,  a4,  a5,  a6,  v13);
  }
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v12 = a7;
  id v13 = v12;
  BOOL v14 = !self->_linkUp && v10;
  char v15 = !self->_linkUp || v10;
  [v12 connectedBss];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_band = [v16 band];

  if ((v15 & 1) == 0 && -[WiFiUsageSession isAssociated](self, "isAssociated"))
  {
    v17 = -[WiFiUsageSession networkDetails](self, "networkDetails");
    v18 = (void *)[v17 copy];
    -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", v18);
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]( &v32,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_,  v10,  v9,  a5,  a6,  v13);
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[WiFiUsageSession networkDetails](self, "networkDetails");
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      __int16 v35 = 2113;
      v36 = v19;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: link session started for %{private}@",  buf,  0x16u);
    }

    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    self->_linkUp = 1;
    [v13 connectedBss];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = +[WiFiUsageLQMTransformations maxPhyModeFrom:]( WiFiUsageLQMTransformations,  "maxPhyModeFrom:",  [v20 phyMode]);

    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
    if (v21 > -[WiFiUsageSession maxPhyMode](&v31, sel_maxPhyMode))
    {
      v30.receiver = self;
      v30.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
      -[WiFiUsageSession setMaxPhyMode:](&v30, sel_setMaxPhyMode_, v21);
    }

    [v13 connectedBss];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 bssid];
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    bssid = self->_bssid;
    self->_bssid = v23;

    [v13 networkName];
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    ssid = self->_ssid;
    self->_ssid = v25;
LABEL_20:

    goto LABEL_21;
  }

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v27 = -[WiFiUsageSession networkDetails](self, "networkDetails");
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      __int16 v35 = 2113;
      v36 = v27;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: link session ended for %{private}@",  buf,  0x16u);
    }

    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    self->_linkUp = 0;
    lastLinkTest = self->_lastLinkTest;
    self->_lastLinkTest = 0LL;

    self->_didBecomePrimary = 0;
    self->_foundSuccessfulLinkTest = 0;
    self->_numLinkTestFailures = 0LL;
    self->_numLinkRecoverySkips = 0LL;
    v29 = self->_bssid;
    self->_bssid = 0LL;

    ssid = self->_ssid;
    self->_ssid = 0LL;
    goto LABEL_20;
  }

- (void)interfaceRankingDidChange:(BOOL)a3
{
  self->_didBecomePrimary = a3;
}

- (BOOL)useSavedJoinStats
{
  return 1;
}

- (id)metricName
{
  return @"com.apple.wifi.linksession";
}

- (void)lockStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_lastLinkTest || (objc_msgSend(v5, "timeIntervalSinceDate:"), v7 > 600.0))
  {
    if (!v3) {
      -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]( self,  "performLinkTestFor:isTriggeredByFault:",  @"LockStateChanged",  0LL);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession lockStateDidChange:](&v8, sel_lockStateDidChange_, v3);
}

- (void)displayStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] date];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_lastLinkTest)
  {
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  objc_msgSend(v5, "timeIntervalSinceDate:");
  if (v7 > 600.0 && v3) {
LABEL_4:
  }
    -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]( self,  "performLinkTestFor:isTriggeredByFault:",  @"DisplayStateChanged",  0LL);
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession displayStateDidChange:](&v8, sel_displayStateDidChange_, v3);
}

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603F50] date];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (([v6 isEqualToString:@"com.apple.PineBoard"] & 1) == 0)
    {
      if ([v6 isEqualToString:@"com.apple.appleseed.FeedbackAssistant"])
      {
        if (!self->_lastFaultIndicationTime || (objc_msgSend(v8, "timeIntervalSinceDate:"), v9 > 60.0))
        {
          if (self->_linkUp && self->_didBecomePrimary)
          {
            objc_storeStrong((id *)&self->_lastFaultIndicationTime, v8);
            -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]( self,  "performLinkTestFor:isTriggeredByFault:",  @"FeedbackAssistant",  0LL);
          }
        }
      }
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession applicationStateDidChange:withAttributes:]( &v10,  sel_applicationStateDidChange_withAttributes_,  v6,  v7);
}

- (void)handleFaultEventWithReason:(id)a3
{
  v23[2] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (_os_feature_enabled_impl()
    && +[WFMeasure isOnSupportedPlatform](&OBJC_CLASS___WFMeasure, "isOnSupportedPlatform")
    && !-[WiFiUsageSession linkRecoveryDisabled](self, "linkRecoveryDisabled")
    && (!_os_feature_enabled_impl() || self->_band))
  {
    [MEMORY[0x189603F50] date];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    unint64_t v21 = 60 * self->_periodicLinkTestInterval;
    if (MGGetBoolAnswer())
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __51__WiFiUsageLinkSession_handleFaultEventWithReason___block_invoke;
      v17[3] = &unk_18A16CE50;
      v17[4] = &v18;
      -[WiFiUsageLinkSession getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"broken_link_interval",  v17);
    }

    if ([v5 isEqualToString:@"LinkTestFailure"]
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
    {
      -[WiFiUsageLinkSession handleFaultEventWithReason:].cold.1();
    }

    p_lastFaultEventHandled = &self->_lastFaultEventHandled;
    if (!self->_lastFaultEventHandled
      || (objc_msgSend(v7, "timeIntervalSinceDate:"), v9 > (double)(unint64_t)v19[3]))
    {
      NSLog( @"%s:%u: Trying to handle fault event for %@\n",  "-[WiFiUsageLinkSession handleFaultEventWithReason:]",  246LL,  v5);
      +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 notifyBrokenLinkRecovery:v5 wasIgnored:0];

      [MEMORY[0x189607958] defaultCenter];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v5;
      v22[0] = @"SessionNotificationBrokenLinkReason";
      v22[1] = @"SessionNotificationInterfaceName";
      -[WiFiUsageSession interfaceName](self, "interfaceName");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:2];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 postNotificationName:@"SessionNotificationBrokenLinkDetected" object:self userInfo:v13];

      self->_didHandleFaultEvent = 1;
      objc_storeStrong((id *)&self->_lastFaultEventHandled, v7);
      objc_storeStrong((id *)&self->_lastFaultEventHandledReason, a3);
      -[WiFiUsageLinkSession retryLinkTestInOneMinute](self, "retryLinkTestInOneMinute");
      _Block_object_dispose(&v18, 8);

      goto LABEL_6;
    }

    BOOL v14 = *p_lastFaultEventHandled;
    [v7 timeIntervalSinceDate:*p_lastFaultEventHandled];
    NSLog( @"%s:%u: Skipping fault event handling kWiFiUsageSessionNotificationBrokenLinkDetected reason: %@ _lastFaultEventHa ndled %@ timeIntervalSinceDate %f _periodicLinkTestInterval %llu\n",  "-[WiFiUsageLinkSession handleFaultEventWithReason:]",  261LL,  v5,  v14,  v15,  v19[3]);
    v16 = +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
    [v16 notifyBrokenLinkRecovery:v5 wasIgnored:3];

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    NSLog( @"%s:%u: Link recovery is currently disabled, skipping fault event handling reason: %@\n",  "-[WiFiUsageLinkSession handleFaultEventWithReason:]",  266LL,  v5);
    +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 notifyBrokenLinkRecovery:v5 wasIgnored:4];
  }

  self->_numLinkTestFailures = 0LL;
LABEL_6:
}

void __51__WiFiUsageLinkSession_handleFaultEventWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kULSPreferenceBrokenLinkDetectedInterval minBrokenLinkDetectedInterval from %llu to %u",  "-[WiFiUsageLinkSession handleFaultEventWithReason:]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (void)retryLinkTestInOneMinute
{
  dispatch_time_t v3 = dispatch_time(0LL, 60000000000LL);
  -[WiFiUsageSession completionQueue](self, "completionQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke;
  block[3] = &unk_18A16CE78;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained[11984]) {
    v2 = @"didHandleFaultEvent";
  }
  else {
    v2 = @"retryLinkTest";
  }
  [WeakRetained performLinkTestFor:v2 isTriggeredByFault:0];
}

- (void)faultEventDetected:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 notifyFaultEventDetectedWithReason:a3];

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession faultEventDetected:](&v21, sel_faultEventDetected_, a3);
  id v7 = @"Arp Failure";
  switch(a3)
  {
    case 0x11uLL:
      goto LABEL_6;
    case 0x12uLL:
      id v7 = @"SlowWiFiDnsFailure";
      goto LABEL_6;
    case 0x13uLL:
      id v7 = @"SlowWiFiDUT";
      goto LABEL_6;
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      goto LABEL_32;
    case 0x19uLL:
      if (self->_lastFaultIndicationTime)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v16 <= 60.0)
        {
          [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
          NSLog( @"%s kWiFiUsageFaultReasonSiriTimedOut Rejected since _lastFaultIndicationTime %f ago\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  v19);
          +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v12;
          unint64_t v14 = 25LL;
          goto LABEL_30;
        }
      }

      if (self->_linkUp && self->_didBecomePrimary)
      {
        objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
        v11 = @"Siri Timed Out";
        goto LABEL_23;
      }

      NSLog( @"%s kWiFiUsageFaultReasonSiriTimedOut Rejected _linkUp %d _didBecomePrimary %d\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  self->_linkUp,  self->_didBecomePrimary);
      +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = v12;
      unint64_t v14 = 25LL;
      goto LABEL_27;
    case 0x1AuLL:
      if (self->_lastFaultIndicationTime)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v17 <= 600.0)
        {
          [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
          NSLog( @"%s kWiFiUsageFaultReasonApsdTimedOut Rejected since _lastFaultIndicationTime %f ago\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  v20);
          +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v12;
          unint64_t v14 = 26LL;
          goto LABEL_30;
        }
      }

      if (!self->_linkUp || !self->_didBecomePrimary)
      {
        NSLog( @"%s kWiFiUsageFaultReasonApsdTimedOut Rejected _linkUp %d _didBecomePrimary %d\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  self->_linkUp,  self->_didBecomePrimary);
        +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v12;
        unint64_t v14 = 26LL;
        goto LABEL_27;
      }

      objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
      v11 = @"Apsd Timed Out";
LABEL_23:
      objc_super v10 = self;
      BOOL v9 = 1LL;
      goto LABEL_24;
    default:
      if (a3 != 10) {
        goto LABEL_32;
      }
      id v7 = @"SlowWiFiAP";
LABEL_6:
      if (self->_lastFaultIndicationTime)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v8 <= 60.0)
        {
          [v5 timeIntervalSinceDate:self->_lastFaultIndicationTime];
          NSLog( @"%s fault type %lu %@ Rejected since _lastFaultIndicationTime %f ago\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  a3,  v7,  v15);
          +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v12;
          unint64_t v14 = a3;
LABEL_30:
          uint64_t v18 = 1LL;
          goto LABEL_31;
        }
      }

      if (!self->_linkUp || !self->_didBecomePrimary)
      {
        NSLog( @"%s fault type %lu %@ Rejected _linkUp %d _didBecomePrimary %d\n",  "-[WiFiUsageLinkSession faultEventDetected:]",  a3,  v7,  self->_linkUp,  self->_didBecomePrimary);
        +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v12;
        unint64_t v14 = a3;
LABEL_27:
        uint64_t v18 = 2LL;
LABEL_31:
        [v12 notifyFaultReason:v14 wasIgnored:v18];

        goto LABEL_32;
      }

      objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
      BOOL v9 = a3 == 18;
      objc_super v10 = self;
      v11 = v7;
LABEL_24:
      -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]( v10,  "performLinkTestFor:isTriggeredByFault:",  v11,  v9);
LABEL_32:

      return;
  }

- (void)performLinkTestFor:(id)a3 isTriggeredByFault:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_linkUp && self->_didBecomePrimary)
  {
    NSLog( @"%s:%u: reason[%@], internal:%u\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]",  419LL,  v6,  +[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall"));
    [MEMORY[0x189603F50] date];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_lastLinkTest, v8);
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 hasActivitiesRunning];

    if ((v10 & 1) == 0)
    {
      v11 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      [v11 networkActivityStart:1 activate:1];

      linkTestResult = self->_linkTestResult;
      self->_linkTestResult = 0LL;

      [MEMORY[0x189603FC8] dictionary];
      id v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      unint64_t v14 = self->_linkTestResult;
      self->_linkTestResult = v13;
    }

    uint64_t v15 = objc_alloc(&OBJC_CLASS___WFMeasure);
    unint64_t lastFaultEventHandledOptions = self->_lastFaultEventHandledOptions;
    -[WiFiUsageSession interfaceName](self, "interfaceName");
    double v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = -[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]( v15,  "initWithType:andReason:prevTestedOptions:andInterfaceName:",  2LL,  v7,  lastFaultEventHandledOptions,  v17);

    if (v18)
    {
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke;
      v28[3] = &unk_18A16CEA0;
      BOOL v31 = a4;
      id v29 = v7;
      objc_super v30 = self;
      -[WiFiUsageSession completionQueue](self, "completionQueue");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasure start:withCompletionQueue:](v18, "start:withCompletionQueue:", v28, v19);
    }
  }

  else if (self->_didHandleFaultEvent {
         && [v6 isEqualToString:@"didHandleFaultEvent"])
  }
  {
    NSLog( @"%s:%u: Link not ready after handling fault event %@, resetting parameters...\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]",  802LL,  self->_lastFaultEventHandledReason);
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v21 = v20;
    if (self->_didBecomePrimary) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    [v20 setObject:v22 forKey:@"DidBecomePrimary"];
    if (self->_linkUp) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    [v21 setObject:v23 forKey:@"LinkUp"];
    -[WiFiUsageLinkSession addDictionary:withKeysPrefix:toFlatDictionary:]( self,  "addDictionary:withKeysPrefix:toFlatDictionary:",  v21,  @"FinalResults_",  self->_linkTestResult);
    v24 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    [v24 networkActivityStop:1 withReason:3 withClientMetric:"linkTestResults" withClientDict:self->_linkTestResult andError:0];
    v25 = +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
    [v25 addLinkTestReasonAndResult:v7 result:self->_linkTestResult];

    v26 = self->_linkTestResult;
    self->_linkTestResult = 0LL;

    self->_didHandleFaultEvent = 0;
    lastFaultEventHandledReason = self->_lastFaultEventHandledReason;
    self->_lastFaultEventHandledReason = 0LL;

    self->_unint64_t lastFaultEventHandledOptions = 0LL;
    self->_numLinkTestFailures = 0LL;
  }
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke(uint64_t a1, void *a2)
{
  v168[2] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 statusForDNS];
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v3 statusForLocal];
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v3 statusForInternet];
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v3 dnsServers];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v3 dnsServers];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v132 = [v8 count] == 0;
  }

  else
  {
    BOOL v132 = 1;
  }

  [v3 gatewayAddress];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    [v3 gatewayAddress];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v130 = [v10 length] == 0;
  }

  else
  {
    BOOL v130 = 1;
  }

  [v3 statusForSiriTCP];
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v3 statusForSiriTLS];
  [MEMORY[0x189603FC8] dictionary];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607940] stringWithString:@"LinkTestFailure"];
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  [v142 appendFormat:@"_%@", *(void *)(a1 + 32)];
  [v13 setObject:*(void *)(a1 + 32) forKey:@"Invoke"];
  if (v4) {
    [v13 setObject:v4 forKey:@"DNS"];
  }
  if (v5) {
    [v13 setObject:v5 forKey:@"Local"];
  }
  if (v6) {
    [v13 setObject:v6 forKey:@"Internet"];
  }
  v136 = (__CFString *)v12;
  v129 = (uint64_t *)(a1 + 32);
  if (v11)
  {
    [v13 setObject:v11 forKey:@"SiriTCP"];
    if (!v12)
    {
      int v134 = 0;
LABEL_18:
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = v13;
      [v13 setObject:v14 forKey:@"SiriTrafficClass"];

      goto LABEL_19;
    }

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession systemWakeStateDidChange:wokenByWiFi:](&v4, sel_systemWakeStateDidChange_wokenByWiFi_, a3, a4);
}

- (void)processIPv4Changes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession processIPv4Changes:](&v3, sel_processIPv4Changes_, a3);
}

- (void)processIPv6Changes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession processIPv6Changes:](&v3, sel_processIPv6Changes_, a3);
}

- (void)processDHCPChanges:(id)a3
{
  BOOL linkUp = self->_linkUp;
  id v5 = a3;
  NSLog( @"%s:%d, _linkUp[%d], dictionary: %@",  "-[WiFiUsageLinkSession processDHCPChanges:]",  897LL,  linkUp,  v5);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession processDHCPChanges:](&v6, sel_processDHCPChanges_, v5);
}

- (void)rangingCompleted
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession rangingCompleted](&v3, sel_rangingCompleted);
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession processDriverAvailability:available:version:flags:eventID:reason:subReason:minorReason:reasonString:]( &v11,  sel_processDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString_,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11);
}

- (void)linkQualityDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUsageLinkSession;
  -[WiFiUsageSession linkQualityDidChange:](&v7, sel_linkQualityDidChange_, a3);
  [MEMORY[0x189603F50] date];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (!self->_lastLinkTest
    || (objc_msgSend(v4, "timeIntervalSinceDate:"), v6 > (double)(60 * self->_periodicLinkTestInterval)))
  {
    -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]( self,  "performLinkTestFor:isTriggeredByFault:",  @"periodicTestHourly",  0LL);
  }
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  NSLog( @"%s Link recovery disabled = %u",  "-[WiFiUsageLinkSession updateLinkRecoveryDisabled:]",  -[WiFiUsageSession linkRecoveryDisabled](self, "linkRecoveryDisabled"));
}

- (void)updateLinkTestInterval:(unint64_t)a3
{
  self->_periodicLinkTestInterval = a3;
  NSLog(@"%s New interval = %lu min", a2, "-[WiFiUsageLinkSession updateLinkTestInterval:]", a3);
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  [MEMORY[0x189604038] standardUserDefaults];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 persistentDomainForName:@"com.apple.wifipolicy.usagelinksession"];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKey:v9];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[WiFiUsageLinkSession getLazyNSNumberPreference:exists:]",  @"com.apple.wifipolicy.usagelinksession",  v9);
    v5[2](v5, v8);
  }
}

- (void)addDictionary:(id)a3 withKeysPrefix:(id)a4 toFlatDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke;
  v11[3] = &unk_18A16CEC8;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
}

void __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v9 = a3;
  [*(id *)(a1 + 32) stringByAppendingString:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) valueForKey:v5];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    [v7 valueForKey:v5];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: keyWithPrefix already exists in dictionary: keyWithPrefix: %@ existing value %@ objValue %@",  "-[WiFiUsageLinkSession addDictionary:withKeysPrefix:toFlatDictionary:]_block_invoke",  v5,  v8,  v9);
  }

  else
  {
    [v7 setObject:v9 forKey:v5];
  }
}

- (void).cxx_destruct
{
}

- (void)handleFaultEventWithReason:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Attemping to reset wifi chip with only LinkTestFailure reason, need more description",  v0,  2u);
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1( uint64_t a1,  uint64_t *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a2;
  int v3 = 136315906;
  objc_super v4 = "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 734;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_fault_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%s:%u: Attempting to reset chip with vague reason %@, linkTestIniated %@\n",  (uint8_t *)&v3,  0x26u);
}

@end