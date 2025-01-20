@interface CSDCallStateMonitor
+ (double)breakBeforeMakeTimeout;
- (BOOL)isAudioMutedForHoldMusic;
- (BOOL)wantsBreakBeforeMakeForCall:(id)a3;
- (CSDCallStateMonitor)initWithCallCenter:(id)a3;
- (CSDCallStateMonitor)initWithCallCenter:(id)a3 featureFlags:(id)a4 serverBag:(id)a5;
- (CSDConversationServerBag)serverBag;
- (CSDRTTSettings)rttSettings;
- (CSDRouteManager)routeManager;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)callDurationLimitTimer;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (id)_ringingTimerForCallWithIdentifier:(id)a3;
- (id)setUpBreakBeforeMakeTimeout;
- (int)lockStateNotificationToken;
- (int)passcodeLockedOrBlockedNotificationToken;
- (int)requestCLTMThrottleUncapToken;
- (void)_cleanCallMediaCache;
- (void)_disconnectOrPullExistingCallsForCallIfNecessary:(id)a3;
- (void)_handleAudioReadyForCall:(id)a3;
- (void)_handleCallConnected:(id)a3;
- (void)_handleCallDurationTimerFired;
- (void)_handleCallMayRequireBreakBeforeMakeChanged:(id)a3;
- (void)_handleCallStartedConnecting:(id)a3;
- (void)_handleCallStatusChanged:(id)a3;
- (void)_notifyCLTMOfIncomingCall;
- (void)_pushCallToAlternateDestinationIfNecessary:(id)a3;
- (void)_setUpBreakBeforeMakeTimeoutIfNecessaryForCall:(id)a3;
- (void)_setUpCallDurationLimitIfNecessary;
- (void)_updateCallMutingForHoldMusic;
- (void)callIsOnHoldChangedNotification:(id)a3;
- (void)clearUplinkMutedCacheIfNecessary;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)disconnectActiveCallsBasedOnCallStatusForCall:(id)a3;
- (void)disconnectAllCallsBesides:(id)a3;
- (void)enableEmergencyModeIfNecessaryForCall:(id)a3;
- (void)handleCallConnectedNotification:(id)a3;
- (void)handleCallHasStartedOutgoingChangedNotification:(id)a3;
- (void)handleCallMayRequireBreakBeforeMakeChangedNotification:(id)a3;
- (void)handleCallOneToOneModeChangedNotification:(id)a3;
- (void)handleCallStartedConnectingNotification:(id)a3;
- (void)handleCallStatusChangedNotification:(id)a3;
- (void)handleCallUpgradedToVideoNotification:(id)a3;
- (void)handleCallWantsHoldMusicChangedNotification:(id)a3;
- (void)leaveAVLessConversationsIfNecessaryForCall:(id)a3;
- (void)setAudioMutedForHoldMusic:(BOOL)a3;
- (void)setCallDurationLimitTimer:(id)a3;
- (void)setHeySiriEnabled:(BOOL)a3;
- (void)setLockStateNotificationToken:(int)a3;
- (void)setPasscodeLockedOrBlockedNotificationToken:(int)a3;
- (void)setRequestCLTMThrottleUncapToken:(int)a3;
- (void)setRttSettings:(id)a3;
- (void)setSetUpBreakBeforeMakeTimeout:(id)a3;
@end

@implementation CSDCallStateMonitor

- (CSDCallStateMonitor)initWithCallCenter:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v6 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
  v7 = -[CSDCallStateMonitor initWithCallCenter:featureFlags:serverBag:]( self,  "initWithCallCenter:featureFlags:serverBag:",  v4,  v5,  v6);

  return v7;
}

- (CSDCallStateMonitor)initWithCallCenter:(id)a3 featureFlags:(id)a4 serverBag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSDCallStateMonitor;
  v12 = -[CSDCallStateMonitor init](&v22, "init");
  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 queue]);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_callCenter, a3);
    objc_storeStrong((id *)&v12->_featureFlags, a4);
    objc_storeStrong((id *)&v12->_serverBag, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v12 selector:"handleCallHasStartedOutgoingChangedNotification:" name:@"CSDCallHasStartedOutgoingChangedNotification" object:0];
    [v15 addObserver:v12 selector:"handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v15 addObserver:v12 selector:"handleCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v15 addObserver:v12 selector:"handleCallStartedConnectingNotification:" name:TUCallCenterCallStartedConnectingNotification object:0];
    [v15 addObserver:v12 selector:"handleCallConnectedNotification:" name:TUCallCenterCallConnectedNotification object:0];
    [v15 addObserver:v12 selector:"handleCallMayRequireBreakBeforeMakeChangedNotification:" name:@"CSDCallMayRequireBreakBeforeMakeChangedNotification" object:0];
    [v15 addObserver:v12 selector:"handleCallWantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];
    [v15 addObserver:v12 selector:"callIsOnHoldChangedNotification:" name:TUCallIsOnHoldChangedNotification object:0];
    [v15 addObserver:v12 selector:"handleCallOneToOneModeChangedNotification:" name:@"CSDCallOneToOneModeChangedNotification" object:0];
    [v15 addObserver:v12 selector:"handleCallUpgradedToVideoNotification:" name:TUCallUpgradedToVideoNotification object:0];
    notify_register_check( (const char *)[@"com.apple.request.hipuncap" UTF8String],  &v12->_requestCLTMThrottleUncapToken);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 conversationManager]);
    [v16 addDelegate:v12 queue:v12->_queue];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100054640;
    v20[3] = &unk_1003D8248;
    id v21 = v9;
    v17 = objc_retainBlock(v20);
    id setUpBreakBeforeMakeTimeout = v12->_setUpBreakBeforeMakeTimeout;
    v12->_id setUpBreakBeforeMakeTimeout = v17;
  }

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callDurationLimitTimer](self, "callDurationLimitTimer"));
  if (v4)
  {
    v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callDurationLimitTimer](self, "callDurationLimitTimer"));
    dispatch_source_cancel(v5);
  }

  notify_cancel(self->_requestCLTMThrottleUncapToken);
  notify_cancel(self->_lockStateNotificationToken);
  notify_cancel(self->_passcodeLockedOrBlockedNotificationToken);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDCallStateMonitor;
  -[CSDCallStateMonitor dealloc](&v6, "dealloc");
}

- (void)handleCallHasStartedOutgoingChangedNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[CSDCallStateMonitor _handleCallHasStartedOutgoingChanged:](self, "_handleCallHasStartedOutgoingChanged:", v4);
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CSDCall, v6);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDCallStateMonitor _handleCallStatusChanged:](self, "_handleCallStatusChanged:", v9);
  }

  else
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not handling call status changed notification for object that is not CSDCall: %@",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)handleCallStartedConnectingNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[CSDCallStateMonitor _handleCallStartedConnecting:](self, "_handleCallStartedConnecting:", v4);
}

- (void)handleCallConnectedNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[CSDCallStateMonitor _handleCallConnected:](self, "_handleCallConnected:", v4);
}

- (void)handleCallMayRequireBreakBeforeMakeChangedNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[CSDCallStateMonitor _handleCallMayRequireBreakBeforeMakeChanged:]( self,  "_handleCallMayRequireBreakBeforeMakeChanged:",  v4);
}

- (void)handleCallWantsHoldMusicChangedNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[CSDCallStateMonitor _handleCallWantsHoldMusicChanged:](self, "_handleCallWantsHoldMusicChanged:", v4);
}

- (void)_cleanCallMediaCache
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _allCalls]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if ([v10 callStatus] != 6)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeRemoteParticipant]);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 imageURL]);
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);

          if ([v13 length]) {
            [v4 addObject:v13];
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 imageURL]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);

          if ([v15 length]) {
            [v4 addObject:v15];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v7);
  }

  id v29 = 0LL;
  v16 = -[CSDSandboxExtensionDirectory initWithName:error:]( objc_alloc(&OBJC_CLASS___CSDSandboxExtensionDirectory),  "initWithName:error:",  @"Images",  &v29);
  id v17 = v29;
  id v28 = v17;
  unsigned __int8 v18 = -[CSDSandboxExtensionDirectory removeLinksForFilenamesNotInArray:error:]( v16,  "removeLinksForFilenamesNotInArray:error:",  v4,  &v28);
  id v19 = v28;

  if ((v18 & 1) == 0)
  {
    id v20 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1002B3460((uint64_t)v19, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (CSDRouteManager)routeManager
{
  return +[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance");
}

- (BOOL)wantsBreakBeforeMakeForCall:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localSenderIdentityUUID]);
  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TUCallCapabilities senderIdentityCapabilitiesWithUUID:]( &OBJC_CLASS___TUCallCapabilities,  "senderIdentityCapabilitiesWithUUID:",  v4));
    id v6 = v5;
    if (v5)
    {
      unsigned int v7 = -[os_log_s supportsSimultaneousVoiceAndData](v5, "supportsSimultaneousVoiceAndData");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned int v9 = [v8 nonWifiFaceTimeAvailable];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
      unsigned int v11 = [v10 wiFiActiveAndReachable];

      if ((v7 & 1) != 0) {
        int v12 = 0;
      }
      else {
        int v12 = v9 & (v11 ^ 1);
      }
      id v13 = sub_1001704C4();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = @"NO";
        if (v12) {
          v16 = @"YES";
        }
        else {
          v16 = @"NO";
        }
        int v34 = 138413314;
        v35 = v16;
        if (v7) {
          id v17 = @"YES";
        }
        else {
          id v17 = @"NO";
        }
        __int16 v36 = 2112;
        v37 = v17;
        if (v9) {
          unsigned __int8 v18 = @"YES";
        }
        else {
          unsigned __int8 v18 = @"NO";
        }
        __int16 v38 = 2112;
        v39 = v18;
        if (v11) {
          v15 = @"YES";
        }
        __int16 v40 = 2112;
        v41 = v15;
        __int16 v42 = 2112;
        id v43 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Determined wants break before make is %@ (supportsSimultaneousVoiceAndData: %@, nonWifiFaceTimeAvailable: %@, wiFiActiveAndReachable: %@) for call %@",  (uint8_t *)&v34,  0x34u);
      }
    }

    else
    {
      id v26 = sub_1001704C4();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002B3528((uint64_t)v3, v14, v27, v28, v29, v30, v31, v32);
      }
      LOBYTE(v12) = 0;
    }
  }

  else
  {
    id v19 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002B34C4((uint64_t)v3, v6, v20, v21, v22, v23, v24, v25);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (double)breakBeforeMakeTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTServerBag sharedInstance](&OBJC_CLASS___FTServerBag, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"gk-invitation-break-before-make-timeout"]);
  [v3 doubleValue];
  double v4 = 12.0;
  if (v5 > 12.0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTServerBag sharedInstance](&OBJC_CLASS___FTServerBag, "sharedInstance"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"gk-invitation-break-before-make-timeout"]);
    [v7 doubleValue];
    double v4 = v8;
  }

  return v4;
}

- (void)_handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  -[CSDCallStateMonitor _setUpCallDurationLimitIfNecessary](self, "_setUpCallDurationLimitIfNecessary");
  -[CSDCallStateMonitor _updateCallMutingForHoldMusic](self, "_updateCallMutingForHoldMusic");
  switch([v4 status])
  {
    case 3u:
      id v5 = sub_1001704C4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Call started outgoing: %@", buf, 0xCu);
      }

      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);

      id v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v9) {
        goto LABEL_22;
      }
      id v11 = v9;
      uint64_t v12 = *(void *)v35;
      *(void *)&__int128 v10 = 138412290LL;
      __int128 v33 = v10;
      break;
    case 4u:
      -[CSDCallStateMonitor _notifyCLTMOfIncomingCall](self, "_notifyCLTMOfIncomingCall");
      [v4 unsuppressRingtoneIfNecessary];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 timeoutTimer]);
      if (v22)
      {
      }

      else
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
        unsigned __int8 v30 = [v29 isSystemProvider];

        if ((v30 & 1) == 0)
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateMonitor _ringingTimerForCallWithIdentifier:]( self,  "_ringingTimerForCallWithIdentifier:",  v31));
          [v4 setTimeoutTimer:v32];
        }
      }

      goto LABEL_31;
    case 5u:
      [v4 setTimeoutTimer:0];
      goto LABEL_31;
    case 6u:
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
      unsigned __int8 v24 = [v23 hasCurrentCalls];

      if ((v24 & 1) == 0)
      {
        id v25 = sub_1001704C4();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "All calls ended. Setting uplink and downlink muted to NO",  buf,  2u);
        }

        [v4 unmuteAfterDisconnect];
        -[CSDCallStateMonitor clearUplinkMutedCacheIfNecessary](self, "clearUplinkMutedCacheIfNecessary");
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
        [v27 setUplinkMuted:0];

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
        [v28 setDownlinkMuted:0];
      }

      -[CSDCallStateMonitor _cleanCallMediaCache](self, "_cleanCallMediaCache");
      goto LABEL_31;
    default:
LABEL_31:
      uint64_t v21 = 1LL;
      goto LABEL_32;
  }

  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(id *)(*((void *)&v34 + 1) + 8LL * (void)i);
      if (v14 != v4)
      {
        if ([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) isVideo])
        {
          id v15 = sub_1001704C4();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v33;
            id v40 = v14;
            id v17 = v16;
            unsigned __int8 v18 = "Disconnecting video call because another call started outgoing: %@";
            goto LABEL_13;
          }

          goto LABEL_14;
        }

        if ([v4 isVideo]
          && [v14 isUsingBaseband]
          && -[CSDCallStateMonitor wantsBreakBeforeMakeForCall:](self, "wantsBreakBeforeMakeForCall:", v14))
        {
          id v20 = sub_1001704C4();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v33;
            id v40 = v14;
            id v17 = v16;
            unsigned __int8 v18 = "Disconnecting call using the baseband because a video call started outgoing and wantsBreakBeforeMake=YES: %@";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
          }

- (void)clearUplinkMutedCacheIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor serverBag](self, "serverBag"));
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * (void)[v3 clearMuteCacheDelay]);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005549C;
  v6[3] = &unk_1003D7DF0;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleCallStartedConnecting:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Call started connecting: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDCallStateMonitor _disconnectOrPullExistingCallsForCallIfNecessary:]( self,  "_disconnectOrPullExistingCallsForCallIfNecessary:",  v4);
}

- (void)leaveAVLessConversationsIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
  uint64_t v23 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConversationForCall:v4]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 conversationManager]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeConversations]);

  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
        unsigned __int8 v17 = [v15 isEqual:v16];

        if ((v17 & 1) == 0 && [v14 state] == (id)3 && !objc_msgSend(v14, "avMode"))
        {
          id v18 = sub_1001704C4();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v29 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Leaving converstion since we have call that is getting connected: %@",  buf,  0xCu);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 conversationManager]);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
          [v21 leaveConversationWithUUID:v22];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v11);
  }
}

- (void)callIsOnHoldChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  -[CSDCallStateMonitor disconnectActiveCallsBasedOnCallStatusForCall:]( self,  "disconnectActiveCallsBasedOnCallStatusForCall:",  v11);
}

- (void)handleCallOneToOneModeChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v15, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v11 isConversation]
    && ([v11 isOneToOneModeEnabled] & 1) == 0
    && ([v11 isEndpointOnCurrentDevice] & 1) == 0
    && [v11 isHostedOnCurrentDevice])
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Pulling relaying calls from client since one to one mode changed for relaying calls if it requires GFT and devic e does not support GFT relay",  (uint8_t *)&v15,  2u);
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
    [v14 pullRelayingGFTCallsFromClientIfNecessary];

    [v11 setUplinkMuted:1];
    [v11 setIsSendingVideo:0];
  }
}

- (void)handleCallUpgradedToVideoNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v14 = 138412546;
    int v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v14, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v11 isVideo])
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      int v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Call upgraded to video: %@",  (uint8_t *)&v14,  0xCu);
    }

    -[CSDCallStateMonitor disconnectAllCallsBesides:](self, "disconnectAllCallsBesides:", v11);
  }
}

- (void)_handleCallConnected:(id)a3
{
  id v4 = a3;
  -[CSDCallStateMonitor enableEmergencyModeIfNecessaryForCall:](self, "enableEmergencyModeIfNecessaryForCall:", v4);
  -[CSDCallStateMonitor _updateCallMutingForHoldMusic](self, "_updateCallMutingForHoldMusic");
  -[CSDCallStateMonitor _handleAudioReadyForCall:](self, "_handleAudioReadyForCall:", v4);
  -[CSDCallStateMonitor leaveAVLessConversationsIfNecessaryForCall:]( self,  "leaveAVLessConversationsIfNecessaryForCall:",  v4);
  -[CSDCallStateMonitor disconnectActiveCallsBasedOnCallStatusForCall:]( self,  "disconnectActiveCallsBasedOnCallStatusForCall:",  v4);
  if ([v4 isVideo])
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Video call connected: %@",  (uint8_t *)&v7,  0xCu);
    }

    -[CSDCallStateMonitor disconnectAllCallsBesides:](self, "disconnectAllCallsBesides:", v4);
  }
}

- (void)disconnectAllCallsBesides:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting to disconnect all calls besides: %@",  buf,  0xCu);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);

  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v21 = v10;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v13);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier", v21));
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        unsigned __int8 v17 = [v15 isEqualToString:v16];

        if ((v17 & 1) == 0)
        {
          id v18 = sub_1001704C4();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            id v28 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Disconnecting call because it is not compatible with call: %@",  buf,  0xCu);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
          [v20 disconnectCall:v14];
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }
}

- (void)disconnectActiveCallsBasedOnCallStatusForCall:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAudioAndVideoCalls]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v19 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v12, "isEqualToCall:", v4, v19) & 1) == 0
          && [v12 status] == 1
          && [v4 status] == 1
          && ([v12 isOnHold] & 1) == 0
          && ([v4 isOnHold] & 1) == 0)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 callGroupUUID]);
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
          unsigned __int8 v15 = [v13 isEqual:v14];

          if ((v15 & 1) == 0)
          {
            id v16 = sub_1001704C4();
            unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              __int128 v25 = v12;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ending current active call %@ because call %@ is going to go active",  buf,  0x16u);
            }

            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
            [v18 disconnectCall:v12];
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v9);
  }
}

- (void)_handleCallMayRequireBreakBeforeMakeChanged:(id)a3
{
}

- (void)enableEmergencyModeIfNecessaryForCall:(id)a3
{
  id v3 = a3;
  if (([v3 isEmergency] & 1) != 0 || objc_msgSend(v3, "isSOS"))
  {
    id v4 = sub_1001704C4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Reporting emergency call to screen time",  buf,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMFEmergencyModeMonitor sharedMonitor](&OBJC_CLASS___DMFEmergencyModeMonitor, "sharedMonitor"));
    id v11 = 0LL;
    unsigned int v7 = [v6 enableEmergencyModeWithError:&v11];
    id v8 = v11;

    if (!v7 || v8)
    {
      id v9 = sub_1001704C4();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002B358C(v7, (uint64_t)v8, v10);
      }
    }
  }
}

- (void)_notifyCLTMOfIncomingCall
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = @"com.apple.request.hipuncap";
    __int16 v7 = 2048;
    uint64_t v8 = 2LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Posting CLTM notification %@ and setting state to %llu",  (uint8_t *)&v5,  0x16u);
  }

  notify_set_state(-[CSDCallStateMonitor requestCLTMThrottleUncapToken](self, "requestCLTMThrottleUncapToken"), 2uLL);
  notify_post((const char *)[@"com.apple.request.hipuncap" UTF8String]);
}

- (void)_disconnectOrPullExistingCallsForCallIfNecessary:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _allCalls]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v7) {
    goto LABEL_24;
  }
  id v8 = v7;
  char v19 = 0;
  uint64_t v9 = *(void *)v21;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v20 + 1) + 8LL * (void)v10);
      if (v11 != v4)
      {
        unsigned int v12 = [v4 isHostedOnCurrentDevice];
        if (v12 != [v11 isHostedOnCurrentDevice]
          || (unsigned int v13 = [v4 isEndpointOnCurrentDevice],
              v13 != [v11 isEndpointOnCurrentDevice]))
        {
          if ([v4 isEndpointOnCurrentDevice]
            && [v11 isHostedOnCurrentDevice]
            && ([v11 isEndpointOnCurrentDevice] & 1) == 0)
          {
            id v17 = sub_1001704C4();
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v11;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Requesting to pull call %@ because its continuity state is different from call %@",  buf,  0x16u);
            }

            char v19 = 1;
          }

          else
          {
            id v14 = sub_1001704C4();
            unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v11;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Disconnecting call %@ because its continuity state is different from call %@",  buf,  0x16u);
            }

            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
            -[os_log_s disconnectCall:](v16, "disconnectCall:", v11);
          }
        }
      }

      uint64_t v10 = (char *)v10 + 1;
    }

    while (v8 != v10);
    id v18 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    id v8 = v18;
  }

  while (v18);

  if ((v19 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
    [v6 pullRelayingCallsFromClient];
LABEL_24:
  }
}

- (void)_pushCallToAlternateDestinationIfNecessary:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endpointIDSDestination]);

  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointIDSDestination]);
      int v27 = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "An endpointIDSDestination %@ is present for call %@ so pushing all hosted calls to that destination",  (uint8_t *)&v27,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 endpointIDSDestination]);
    [v11 pushHostedCallsToDestination:v13];
LABEL_11:

    goto LABEL_12;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 endpointRapportMediaSystemIdentifier]);
  if ([v15 length])
  {

LABEL_8:
    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 endpointRapportMediaSystemIdentifier]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 endpointRapportEffectiveIdentifier]);
      int v27 = 138412802;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "An endpointRapportMediaSystemIdentifier=%@ or endpointRapportEffectiveIdentifier=%@ is present on dial r equest for call %@ so attempting to pick matching route",  (uint8_t *)&v27,  0x20u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 endpointRapportMediaSystemIdentifier]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 endpointRapportEffectiveIdentifier]);
    [v11 pickRouteForRapportDeviceWithMediaSystemIdentifier:v13 effectiveIdentifier:v26];

    goto LABEL_11;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 endpointRapportEffectiveIdentifier]);
  id v18 = [v17 length];

  if (v18) {
    goto LABEL_8;
  }
LABEL_12:
}

- (void)_setUpBreakBeforeMakeTimeoutIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  if ([v4 status] == 3
    && [v4 isVideo]
    && [v4 mayRequireBreakBeforeMake])
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting up break before make timeout for call: %@",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor setUpBreakBeforeMakeTimeout](self, "setUpBreakBeforeMakeTimeout"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100056AB0;
    v11[3] = &unk_1003D7758;
    v11[4] = self;
    id v12 = v5;
    uint64_t v9 = (void (*)(void *, void *))v8[2];
    id v10 = v5;
    v9(v8, v11);
  }
}

- (void)_handleAudioReadyForCall:(id)a3
{
  id v4 = a3;
  if ([v4 isRTT])
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor routeManager](self, "routeManager"));
    unsigned int v6 = [v5 isCarPlayRouteAvailable];

    unsigned int v7 = v6 | [v4 isEmergency];
    id v8 = sub_1001704C4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((v7 & 1) != 0)
    {
      if (v10)
      {
        *(_DWORD *)id v14 = 138412290;
        *(void *)&v14[4] = v4;
        id v11 = "CarPlay is connected; unmuting uplink for RTT call %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, v14, 0xCu);
      }
    }

    else if (v10)
    {
      *(_DWORD *)id v14 = 138412290;
      *(void *)&v14[4] = v4;
      id v11 = "CarPlay is not connected; muting uplink for RTT call %@";
      goto LABEL_9;
    }

    id v12 = v4;
    uint64_t v13 = v7 ^ 1;
    goto LABEL_11;
  }

  if (([v4 uplinkWasExplicitlyMuted] & 1) == 0)
  {
    id v12 = v4;
    uint64_t v13 = 0LL;
LABEL_11:
    objc_msgSend(v12, "setUplinkMuted:", v13, *(_OWORD *)v14);
  }
}

- (id)_ringingTimerForCallWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting ringing timer for call with identifier %@",  buf,  0xCu);
  }

  unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor queue](self, "queue"));
  id v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v7);

  dispatch_time_t v9 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100056F44;
  v12[3] = &unk_1003D7CB0;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v4;
  id v10 = v4;
  dispatch_source_set_event_handler(v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
  return v8;
}

- (void)_setUpCallDurationLimitIfNecessary
{
  if (TUIsStoreDemoModeEnabled(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
    unsigned int v4 = [v3 anyCallPassesTest:&stru_1003D8268];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callDurationLimitTimer](self, "callDurationLimitTimer"));
    if (v5 || !v4)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callDurationLimitTimer](self, "callDurationLimitTimer"));
      if (!v11) {
        LOBYTE(v4) = 1;
      }

      if ((v4 & 1) == 0)
      {
        id v12 = sub_1001704C4();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Stopping call duration limit timer",  (uint8_t *)buf,  2u);
        }

        id v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callDurationLimitTimer](self, "callDurationLimitTimer"));
        dispatch_source_cancel(v14);

        -[CSDCallStateMonitor setCallDurationLimitTimer:](self, "setCallDurationLimitTimer:", 0LL);
      }
    }

    else
    {
      id v6 = sub_1001704C4();
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting call duration limit timer as we are in a retail environment",  (uint8_t *)buf,  2u);
      }

      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor queue](self, "queue"));
      dispatch_time_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);

      dispatch_time_t v10 = dispatch_time(0LL, 300000000000LL);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      objc_initWeak(buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100057380;
      handler[3] = &unk_1003D7DF0;
      objc_copyWeak(&v16, buf);
      dispatch_source_set_event_handler(v9, handler);
      -[CSDCallStateMonitor setCallDurationLimitTimer:](self, "setCallDurationLimitTimer:", v9);
      dispatch_activate(v9);
      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
  }

- (void)_handleCallDurationTimerFired
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callContainer](self, "callContainer"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 callsPassingTest:&stru_1003D8288]);

  if ([v4 count])
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Disconnecting restricted calls because the limited call duration timer fired: %@",  buf,  0xCu);
    }

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v11);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter", (void)v25));
          [v13 disconnectCall:v12];

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v9);
    }

    uint64_t v14 = TUBundle();
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"CALL_ENDED" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    uint64_t v17 = TUBundle();
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"CALL_ENDED_DEMO_EXPLANATION" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    uint64_t v20 = TUBundle();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"OK" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"RetailDemoNotification",  v16,  v19,  v22,  0LL,  0LL));

    [v23 setUsesNotificationCenter:0];
    [v23 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
    [v24 addUserNotification:v23 listener:0 completionHandler:0];
  }
}

- (void)_updateCallMutingForHoldMusic
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter", 0LL));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentAudioAndVideoCalls]);

  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (!v5)
  {

    id v7 = 0LL;
    goto LABEL_21;
  }

  id v6 = v5;
  id v7 = 0LL;
  id v8 = 0LL;
  uint64_t v9 = *(void *)v23;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
      if (![v11 wantsHoldMusic])
      {
        uint64_t v12 = v7;
        id v7 = v11;
        id v13 = v8;
LABEL_10:
        id v14 = v11;

        id v8 = v13;
        continue;
      }

      uint64_t v12 = v8;
      id v13 = v11;
    }

    id v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  }

  while (v6);

  if (v8)
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found active call needing hold music: %@",  buf,  0xCu);
    }

    if (!-[CSDCallStateMonitor isAudioMutedForHoldMusic](self, "isAudioMutedForHoldMusic"))
    {
      id v17 = sub_1001704C4();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Hold music enabled - call is active so muting uplink and downlink",  buf,  2u);
      }

      uint64_t v19 = 1LL;
      [v8 setUplinkMuted:1];
      [v8 setDownlinkMuted:1];
      goto LABEL_25;
    }

    goto LABEL_27;
  }

- (void)setHeySiriEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requesting to enable Hey Siri: %d",  (uint8_t *)v8,  8u);
  }

  id v6 = (void *)CUTWeakLinkClass(@"VTStateManager", @"VoiceTrigger");
  double v7 = 60.0;
  if (v3) {
    double v7 = 0.0;
  }
  [v6 requestPhraseSpotterBypassing:!v3 timeout:v7];
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  if ([v5 state] == (id)3 && !objc_msgSend(v5, "avMode"))
  {
    id v6 = sub_1001704C4();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Disconnecting all calls since we have an AVLess conversation that is Joined: %@",  (uint8_t *)&v14,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 groupUUID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 callForConversationWithGroupUUID:v9]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 presentationContext]);
    if ([v11 mode] == (id)2 && v10)
    {
      unsigned int v12 = [v10 status];

      if (v12 != 4)
      {
LABEL_10:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
        [v13 disconnectAllCalls];

        goto LABEL_11;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateMonitor callCenter](self, "callCenter"));
      [v11 disconnectCall:v10 withReason:1];
    }

    goto LABEL_10;
  }

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)callDurationLimitTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCallDurationLimitTimer:(id)a3
{
}

- (BOOL)isAudioMutedForHoldMusic
{
  return self->_audioMutedForHoldMusic;
}

- (void)setAudioMutedForHoldMusic:(BOOL)a3
{
  self->_audioMutedForHoldMusic = a3;
}

- (int)requestCLTMThrottleUncapToken
{
  return self->_requestCLTMThrottleUncapToken;
}

- (void)setRequestCLTMThrottleUncapToken:(int)a3
{
  self->_requestCLTMThrottleUncapToken = a3;
}

- (int)lockStateNotificationToken
{
  return self->_lockStateNotificationToken;
}

- (void)setLockStateNotificationToken:(int)a3
{
  self->_lockStateNotificationToken = a3;
}

- (int)passcodeLockedOrBlockedNotificationToken
{
  return self->_passcodeLockedOrBlockedNotificationToken;
}

- (void)setPasscodeLockedOrBlockedNotificationToken:(int)a3
{
  self->_passcodeLockedOrBlockedNotificationToken = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (CSDRTTSettings)rttSettings
{
  return self->_rttSettings;
}

- (void)setRttSettings:(id)a3
{
}

- (id)setUpBreakBeforeMakeTimeout
{
  return self->_setUpBreakBeforeMakeTimeout;
}

- (void)setSetUpBreakBeforeMakeTimeout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end