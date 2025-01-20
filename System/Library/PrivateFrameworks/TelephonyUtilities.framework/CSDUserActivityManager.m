@interface CSDUserActivityManager
+ (CSDUserActivityManager)sharedInstance;
+ (id)allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDUserActivity)handoffActivity;
- (CSDUserActivityCommunicatorProtocol)activityCommunicator;
- (CSDUserActivityManager)initWithQueue:(id)a3 activityCommunicator:(id)a4 callCenter:(id)a5 featureFlags:(id)a6;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (id)dynamicIdentifierForConversation:(id)a3 uplinkMuted:(BOOL)a4 sendingVideo:(BOOL)a5;
- (id)lockdownModeEnabled;
- (void)callConnected:(id)a3;
- (void)callContinuityChanged:(id)a3;
- (void)callIsSendingVideoChanged:(id)a3;
- (void)callIsUplinkMutedChanged:(id)a3;
- (void)callStartedConnecting:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)dealloc;
- (void)deregisterHandoffIdentifiersForConversation:(id)a3;
- (void)endHandoffActivity;
- (void)processStatusChangeAsHandedOffIfNecessaryForCall:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)receivedBroadcastedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4 originatingDeviceType:(id)a5;
- (void)setActivityCommunicator:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setHandoffActivity:(id)a3;
- (void)setLockdownModeEnabled:(id)a3;
- (void)shouldSuppressRingtoneChanged:(id)a3;
- (void)startSuppressRingtoneActivityBroadcastingForCall:(id)a3;
- (void)startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:(id)a3;
- (void)stopAdvertisingForRemovedConversationIfNecessary:(id)a3;
- (void)stoppedReceivingActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)updateAppHistoryActivityForCall;
- (void)updateAudioVideoHandoffPreferencesForCall:(id)a3;
- (void)updateCallHandoffRegistration;
- (void)updateHandoffActivityStateForCall:(id)a3;
- (void)updateHandoffAdvertisementForCall:(id)a3;
- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4;
- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4 uplinkMuted:(BOOL)a5 sendingVideo:(BOOL)a6;
- (void)updateHandoffRegistrationForConversation:(id)a3 fromOldConversation:(id)a4;
- (void)updateSuppressRingtoneActivityListeningState;
@end

@implementation CSDUserActivityManager

+ (CSDUserActivityManager)sharedInstance
{
  return (CSDUserActivityManager *)+[CSDUserActivityManager sharedInstanceWithQueue:]( &OBJC_CLASS___CSDUserActivityManager,  "sharedInstanceWithQueue:",  &_dispatch_main_q);
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001615C;
  block[3] = &unk_1003D7730;
  id v8 = a3;
  uint64_t v3 = qword_10044CE18;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10044CE18, block);
  }
  id v5 = (id)qword_10044CE10;

  return v5;
}

- (CSDUserActivityManager)initWithQueue:(id)a3 activityCommunicator:(id)a4 callCenter:(id)a5 featureFlags:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CSDUserActivityManager;
  v15 = -[CSDUserActivityManager init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_featureFlags, a6);
    objc_storeStrong((id *)&v16->_activityCommunicator, a4);
    -[CSDUserActivityCommunicatorProtocol setDelegate:](v16->_activityCommunicator, "setDelegate:", v16);
    objc_storeWeak((id *)&v16->_callCenter, v13);
    id lockdownModeEnabled = v16->_lockdownModeEnabled;
    v16->_id lockdownModeEnabled = &stru_1003D7988;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v16 selector:"callStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v18 addObserver:v16 selector:"callStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v18 addObserver:v16 selector:"callContinuityChanged:" name:TUCallCenterCallContinuityStateChangedNotification object:0];
    [v18 addObserver:v16 selector:"shouldSuppressRingtoneChanged:" name:TUCallShouldSuppressRingingChangedNotification object:0];
    [v18 addObserver:v16 selector:"callStartedConnecting:" name:TUCallCenterCallStartedConnectingNotification object:0];
    [v18 addObserver:v16 selector:"callConnected:" name:TUCallCenterCallConnectedNotification object:0];
    [v18 addObserver:v16 selector:"callIsUplinkMutedChanged:" name:TUCallIsUplinkMutedChangedNotification object:0];
    [v18 addObserver:v16 selector:"callIsSendingVideoChanged:" name:TUCallIsSendingVideoChangedNotification object:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](v16, "callCenter"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 providerManager]);
    [v20 addDelegate:v16 queue:v16->_queue];

    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 conversationManager]);
    [v21 addDelegate:v16 queue:v16->_queue];

    -[CSDUserActivityManager updateCallHandoffRegistration](v16, "updateCallHandoffRegistration");
    -[CSDUserActivityManager updateAppHistoryActivityForCall](v16, "updateAppHistoryActivityForCall");
    -[CSDUserActivityManager updateSuppressRingtoneActivityListeningState]( v16,  "updateSuppressRingtoneActivityListeningState");
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 currentCalls]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

    if (v23)
    {
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___CSDCall, v24);
      if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0)
      {
        -[CSDUserActivityManager updateHandoffActivityStateForCall:](v16, "updateHandoffActivityStateForCall:", v23);
        id v26 = sub_1001704C4();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "It's interesting that we have a call here when we don't really expect one %@",  buf,  0xCu);
        }
      }
    }
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationManager]);
  [v5 removeDelegate:self];

  TURemoveEveryTelephonyCenterObserver(self);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDUserActivityManager;
  -[CSDUserActivityManager dealloc](&v6, "dealloc");
}

- (void)updateCallHandoffRegistration
{
  if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
    [v3 stopListeningForActivityType:2 dynamicIdentifier:0];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providerManager]);

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 providers]);
    id v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = v6;
          v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handoffIdentifiers]);
          id v9 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v22;
            do
            {
              for (i = 0LL; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v22 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
                id v14 = sub_1001704C4();
                v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v30 = v13;
                  __int16 v31 = 2112;
                  v32 = v7;
                  _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Registering to handle call handoff activity type with dynamic identifier %@ for provider %@",  buf,  0x16u);
                }

                v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
                [v16 listenForActivityType:2 dynamicIdentifier:v13];
              }

              id v10 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
            }

            while (v10);
          }

          uint64_t v6 = v20 + 1;
        }

        while ((id)(v20 + 1) != v19);
        id v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
      }

      while (v19);
    }
  }

- (void)updateHandoffActivityStateForCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (![v4 isHostedOnCurrentDevice])
  {
LABEL_28:
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager handoffActivity](self, "handoffActivity"));

    if (v25) {
      -[CSDUserActivityManager endHandoffActivity](self, "endHandoffActivity");
    }
    goto LABEL_30;
  }

  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Frontmost call is hosted here ...",  (uint8_t *)&v26,  2u);
  }

  unsigned int v8 = [v4 isEndpointOnCurrentDevice];
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "... and it is an endpoint here ...",  (uint8_t *)&v26,  2u);
    }

    unsigned __int8 v12 = +[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling");
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) != 0)
    {
      if (v15)
      {
        LOWORD(v26) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "... but we are a primary device. Not broadcasting frontmost call",  (uint8_t *)&v26,  2u);
      }

      goto LABEL_28;
    }

    if (v15)
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "... and we are a secondary device ...",  (uint8_t *)&v26,  2u);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffDynamicIdentifier]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffActivityUserInfo]);
    id v22 = sub_1001704C4();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v20 && v21)
    {
      if (v24)
      {
        int v26 = 138412290;
        *(void *)__int128 v27 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "... using a broadcast activity with dynamic identifier: %@.",  (uint8_t *)&v26,  0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:]( &OBJC_CLASS___CSDUserActivity,  "activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:",  2LL,  v20,  v21,  0LL));
    }

    else
    {
      if (v24)
      {
        int v26 = 67109376;
        *(_DWORD *)__int128 v27 = v20 == 0LL;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = v21 == 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] ... but no dynamic identifier could be found (%d) or no handoff user info exists (%d). Not broadcasting frontmost call",  (uint8_t *)&v26,  0xEu);
      }

      v16 = 0LL;
    }

    if (!v16) {
      goto LABEL_28;
    }
  }

  else
  {
    if (v11)
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "... and it is being relayed elsewhere. Using a local activity",  (uint8_t *)&v26,  2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:]( &OBJC_CLASS___CSDUserActivity,  "activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:",  1LL,  0LL,  0LL,  0LL));
    if (!v16) {
      goto LABEL_28;
    }
  }

  -[CSDUserActivityManager endHandoffActivity](self, "endHandoffActivity");
  id v17 = sub_1001704C4();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    *(void *)__int128 v27 = v16;
    *(_WORD *)&v27[8] = 2112;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Beginning handoff activity %@ for call %@",  (uint8_t *)&v26,  0x16u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
  [v19 broadcastActivity:v16];

  -[CSDUserActivityManager setHandoffActivity:](self, "setHandoffActivity:", v16);
LABEL_30:
}

- (void)endHandoffActivity
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager handoffActivity](self, "handoffActivity"));
  if (v4)
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager handoffActivity](self, "handoffActivity"));
      int v10 = 138412290;
      BOOL v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Ending handoff activity: %@",  (uint8_t *)&v10,  0xCu);
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager handoffActivity](self, "handoffActivity"));
    [v8 stopBroadcastingActivity:v9];

    -[CSDUserActivityManager setHandoffActivity:](self, "setHandoffActivity:", 0LL);
  }

- (void)startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4 && [v4 status] == 6 && objc_msgSend(v4, "wasDeclined"))
  {
    id v6 = sub_1001704C4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Broadcasting suppress ringtone activity for declined call: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[CSDUserActivityManager startSuppressRingtoneActivityBroadcastingForCall:]( self,  "startSuppressRingtoneActivityBroadcastingForCall:",  v4);
  }
}

- (void)startSuppressRingtoneActivityBroadcastingForCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:]( &OBJC_CLASS___CSDUserActivity,  "activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:",  3LL,  v7,  0LL,  0LL));
  [v9 broadcastActivity:v8 withTimeout:1 shouldPrioritize:2.0];
}

- (void)updateSuppressRingtoneActivityListeningState
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 callPassingTest:&stru_1003D79C8]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
  if (v8)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
    [v5 listenForActivityType:3 dynamicIdentifier:v7];
  }

  else
  {
    [v5 stopListeningForActivityType:3 dynamicIdentifier:0];
  }
}

- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4
{
  id v6 = a3;
  id v12 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017144;
  v13[3] = &unk_1003D79F0;
  id v14 = v6;
  id v8 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 callPassingTest:v13]);

  if (v9)
  {
    id v10 = [v9 isUplinkMuted];
    uint64_t v11 = (uint64_t)[v9 isSendingVideo];
  }

  else
  {
    id v10 = 0LL;
    uint64_t v11 = 1LL;
  }

  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:]( self,  "updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:",  v8,  v12,  v10,  v11);
}

- (void)updateHandoffAdvertisementForCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || ![v4 isConversation]
    || (uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 callGroupUUID])) == 0
    || (v7 = (void *)v6, unsigned int v8 = [v5 status], v7, v8 != 1))
  {
    id v22 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    else {
      __int128 v23 = @"NO";
    }
    else {
      BOOL v24 = @"NO";
    }
    if (v5) {
      __int128 v25 = @"YES";
    }
    else {
      __int128 v25 = @"NO";
    }
    if (!v5)
    {
      *(_DWORD *)buf = 138413570;
      v44 = v23;
      __int16 v45 = 2112;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v25;
      __int16 v49 = 2112;
      v50 = @"NO";
      __int16 v51 = 2112;
      v52 = @"NO";
      __int16 v53 = 2112;
      v54 = @"NO";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but call didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)",  buf,  0x3Eu);
      goto LABEL_39;
    }

    else {
      int v26 = @"NO";
    }
    v37 = v26;
    __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 callGroupUUID]);
    if (v27) {
      id v28 = @"YES";
    }
    else {
      id v28 = @"NO";
    }
    *(_DWORD *)buf = 138413570;
    else {
      objc_super v29 = @"NO";
    }
    v44 = v23;
    __int16 v45 = 2112;
    v46 = v24;
    __int16 v47 = 2112;
    v48 = v25;
    __int16 v49 = 2112;
    v50 = v37;
    __int16 v51 = 2112;
    v52 = v28;
    __int16 v53 = 2112;
    v54 = v29;
    uint64_t v30 = "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but cal"
          "l didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)";
    __int16 v31 = v14;
    uint32_t v32 = 62;
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);

    goto LABEL_39;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conversationManager]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeConversations]);

  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v12)
  {

LABEL_41:
    id v33 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    v34 = @"YES";
    else {
      v35 = @"NO";
    }
    __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 callGroupUUID]);
    *(_DWORD *)buf = 138412802;
    v44 = v35;
    __int16 v45 = 2112;
    v46 = v34;
    __int16 v47 = 2112;
    v48 = v27;
    uint64_t v30 = "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but cou"
          "ld not find conversation for call with groupUUID: %@";
    __int16 v31 = v14;
    uint32_t v32 = 32;
    goto LABEL_37;
  }

  id v13 = v12;
  v36 = self;
  id v14 = 0LL;
  uint64_t v15 = *(void *)v39;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v39 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 callGroupUUID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 groupUUID]);
      unsigned int v20 = [v18 isEqual:v19];

      if (v20)
      {
        __int128 v21 = v17;

        id v14 = v21;
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  }

  while (v13);

  if (!v14) {
    goto LABEL_41;
  }
  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:]( v36,  "updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:",  v14,  0,  [v5 isUplinkMuted],  objc_msgSend(v5, "isSendingVideo"));
LABEL_39:
}

- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4 uplinkMuted:(BOOL)a5 sendingVideo:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v12 = [v11 conversationHandoffEnabled];

  if (v12)
  {
    id v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager lockdownModeEnabled](self, "lockdownModeEnabled"));
    int v14 = v13[2]();

    if (v14)
    {
      id v15 = sub_1001704C4();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not updating handoff advertisement because lockdown mode is enabled",  buf,  2u);
      }
    }

    else
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDUserActivityManager dynamicIdentifierForConversation:uplinkMuted:sendingVideo:]( self,  "dynamicIdentifierForConversation:uplinkMuted:sendingVideo:",  v9,  v7,  v6));
      if (v16) {
        unsigned __int8 v35 = [v9 shouldAdvertiseConversationHandoff];
      }
      else {
        unsigned __int8 v35 = 0;
      }
      v34 = self;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 queuedActivitiesOfType:5]);

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id obj = v18;
      id v19 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(obj);
            }
            __int128 v23 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dynamicIdentifier]);
            unsigned __int8 v25 = [v24 isEqual:v16];

            if ((v25 & 1) != 0)
            {
              unsigned __int8 v35 = 0;
            }

            else
            {
              int v26 = (void *)objc_claimAutoreleasedReturnValue([v23 dynamicIdentifier]);
              id v27 = v9;
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
              objc_super v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
              unsigned int v30 = [v26 containsString:v29];

              if (v30)
              {
                __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](v34, "activityCommunicator"));
                [v31 stopBroadcastingActivity:v23];
              }

              id v9 = v27;
            }
          }

          id v20 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }

        while (v20);
      }

      if ((v35 & 1) != 0)
      {
        uint32_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:]( &OBJC_CLASS___CSDUserActivity,  "activityWithType:dynamicIdentifier:userInfo:originatingDeviceType:",  5LL,  v16,  0LL,  0LL));
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](v34, "activityCommunicator"));
        [v33 broadcastActivity:v32 withTimeout:1 shouldPrioritize:-1.0];
      }
    }
  }
}

- (void)processStatusChangeAsHandedOffIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  v36 = self;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  if (![v6 isFaceTimeProvider]
    || [v4 status] != 6
    || [v4 disconnectedReason] != 7)
  {

    goto LABEL_29;
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffRecipientParticipant]);

  if (v7)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationManager]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeConversations]);

    id v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (!v11)
    {

      goto LABEL_31;
    }

    id v12 = v11;
    id v37 = 0LL;
    uint64_t v13 = *(void *)v43;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 groupUUID]);
        if ([v16 isEqual:v17])
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 provider]);
          unsigned int v19 = [v18 isDefaultProvider];

          if (!v19) {
            continue;
          }
          v16 = v37;
          id v37 = v15;
        }

        else
        {
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (!v12)
      {

        if (v37)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffRecipientParticipant]);
          id v21 = [v20 unsignedLongLongValue];

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v37 groupUUID]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:]( &OBJC_CLASS___CSDUserActivityManager,  "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:",  v22,  v21));

          id v24 = sub_1001704C4();
          unsigned __int8 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = (void *)objc_claimAutoreleasedReturnValue([v37 UUID]);
            *(_DWORD *)buf = 138412546;
            v48 = v26;
            __int16 v49 = 2048;
            id v50 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "After conversation %@ was handed off elsewhere, re-registering for handoff advertisement for participant % llu so that it can be handed off back",  buf,  0x16u);
          }

          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v27 = v23;
          id v28 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v39;
            do
            {
              for (j = 0LL; j != v29; j = (char *)j + 1)
              {
                if (*(void *)v39 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)j);
                id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](v36, "activityCommunicator"));
                [v33 listenForActivityType:5 dynamicIdentifier:v32];
              }

              id v29 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }

            while (v29);
          }

          v34 = (os_log_s *)v37;
          goto LABEL_33;
        }

- (void)updateHandoffRegistrationForConversation:(id)a3 fromOldConversation:(id)a4
{
  id v47 = a3;
  id v48 = a4;
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v8 = [v7 conversationHandoffEnabled];

  if (v8)
  {
    id v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager lockdownModeEnabled](self, "lockdownModeEnabled"));
    int v10 = v9[2]();

    if (v10)
    {
      id v11 = sub_1001704C4();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not updating handoff registration because lockdown mode is enabled",  buf,  2u);
      }
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      if ([v47 isAnyOtherAccountDeviceActive])
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v47 provider]);
        unsigned int v15 = [v14 isDefaultProvider];

        if (v15)
        {
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v47 activeRemoteParticipants]);
          id v17 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v62;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v62 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
                if ([v21 isLocalAccountHandle])
                {
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v47 groupUUID]);
                  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:]( CSDUserActivityManager,  "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:",  v22,  [v21 identifier]));
                  [v13 unionSet:v23];
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }

            while (v18);
          }
        }
      }

      if (v48 && [v48 isAnyOtherAccountDeviceActive])
      {
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v48 activeRemoteParticipants]);
        id v25 = [v24 countByEnumeratingWithState:&v57 objects:v68 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v58;
          do
          {
            for (j = 0LL; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v58 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
              if ([v29 isLocalAccountHandle])
              {
                uint64_t v30 = objc_claimAutoreleasedReturnValue([v48 groupUUID]);
                __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:]( CSDUserActivityManager,  "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:",  v30,  [v29 identifier]));

                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 anyObject]);
                LOBYTE(v30) = [v13 containsObject:v32];

                if ((v30 & 1) == 0) {
                  [v46 unionSet:v31];
                }
              }
            }

            id v26 = [v24 countByEnumeratingWithState:&v57 objects:v68 count:16];
          }

          while (v26);
        }
      }

      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v12 = v13;
      id v33 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v54;
        do
        {
          for (k = 0LL; k != v34; k = (char *)k + 1)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v12);
            }
            uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)k);
            __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
            [v38 listenForActivityType:5 dynamicIdentifier:v37];
          }

          id v34 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
        }

        while (v34);
      }

      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v39 = v46;
      id v40 = [v39 countByEnumeratingWithState:&v49 objects:v66 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v50;
        do
        {
          for (m = 0LL; m != v41; m = (char *)m + 1)
          {
            if (*(void *)v50 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)m);
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
            [v45 stopListeningForActivityType:5 dynamicIdentifier:v44];
          }

          id v41 = [v39 countByEnumeratingWithState:&v49 objects:v66 count:16];
        }

        while (v41);
      }
    }
  }
}

- (void)deregisterHandoffIdentifiersForConversation:(id)a3
{
  id v10 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v10 groupUUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    [v7 stopListeningForActivityType:5 matchingDynamicIdentifierSubstring:v9];
  }
}

+ (id)allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4
{
  id v5 = a3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:]( &OBJC_CLASS___NSString,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:",  v5,  a4,  0LL,  0LL));
  v13[0] = v6;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:]( &OBJC_CLASS___NSString,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:",  v5,  a4,  0LL,  1LL));
  v13[1] = v7;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:]( &OBJC_CLASS___NSString,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:",  v5,  a4,  1LL,  0LL));
  v13[2] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:]( &OBJC_CLASS___NSString,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:",  v5,  a4,  1LL,  1LL));

  v13[3] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  return v11;
}

- (void)updateAppHistoryActivityForCall
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager callCenter](self, "callCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentAudioAndVideoCalls]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if ([v5 isHostedOnCurrentDevice]
    && ([v5 status] == 3 || objc_msgSend(v5, "status") == 4))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedLabel]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 isoCountryCode]);
    uint64_t v10 = TUFormattedPhoneNumber(v8, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ – %@",  v6,  v11));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);
      [v13 addObject:v17];
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);

    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
      [v13 addObject:v19];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
    uint64_t v21 = TUCallUserActivityDestinationIDKey;
    if (TUCallUserActivityDestinationIDKey)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 value]);

      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
        [v20 setObject:v25 forKeyedSubscript:v21];
      }
    }

    uint64_t v26 = TUCallUserActivityHandleKey;
    if (TUCallUserActivityHandleKey)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dictionaryRepresentation]);

      if (v28)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 dictionaryRepresentation]);
        [v20 setObject:v30 forKeyedSubscript:v26];
      }
    }

    uint64_t v31 = TUCallUserActivityProviderIdentifierKey;
    if (TUCallUserActivityProviderIdentifierKey)
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v5 provider]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);

      if (v33)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v5 provider]);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
        [v20 setObject:v35 forKeyedSubscript:v31];
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[CSDUserActivity appHistoryActivityWithTitle:subtitle:keywords:userInfo:]( &OBJC_CLASS___CSDUserActivity,  "appHistoryActivityWithTitle:subtitle:keywords:userInfo:",  v36,  v12,  v13,  v20));

    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
    [v38 broadcastActivity:v37 withTimeout:1 shouldPrioritize:0.0];

    id v39 = sub_1001704C4();
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v37;
      __int16 v43 = 2112;
      uint64_t v44 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Began app history activity %@ for call %@",  buf,  0x16u);
    }
  }
}

- (void)callStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CSDCall, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDUserActivityManager startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:]( self,  "startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:",  v10);

    -[CSDUserActivityManager updateAppHistoryActivityForCall](self, "updateAppHistoryActivityForCall");
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDUserActivityManager updateHandoffActivityStateForCall:](self, "updateHandoffActivityStateForCall:", v11);

    -[CSDUserActivityManager updateSuppressRingtoneActivityListeningState]( self,  "updateSuppressRingtoneActivityListeningState");
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDUserActivityManager processStatusChangeAsHandedOffIfNecessaryForCall:]( self,  "processStatusChangeAsHandedOffIfNecessaryForCall:",  v12);
  }

  else
  {
    id v13 = sub_1001704C4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      int v18 = 138412546;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = (id)objc_opt_class(&OBJC_CLASS___CSDCall, v16);
      id v17 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Expected %@ to be kind of class %@, but is not",  (uint8_t *)&v18,  0x16u);
    }
  }
}

- (void)callContinuityChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CSDCall, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDUserActivityManager updateHandoffActivityStateForCall:](self, "updateHandoffActivityStateForCall:", v10);
  }

  else
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      int v16 = 138412546;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = (id)objc_opt_class(&OBJC_CLASS___CSDCall, v14);
      id v15 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Expected %@ to be kind of class %@, but is not",  (uint8_t *)&v16,  0x16u);
    }
  }
}

- (void)shouldSuppressRingtoneChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDUserActivityManager updateSuppressRingtoneActivityListeningState]( self,  "updateSuppressRingtoneActivityListeningState");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);

  if ([v6 shouldSuppressRingtone]
    && ([v6 ringtoneSuppressedRemotely] & 1) == 0)
  {
    id v7 = sub_1001704C4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Broadcasting suppress ringtone activity for call that suppressed its ringtone: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[CSDUserActivityManager startSuppressRingtoneActivityBroadcastingForCall:]( self,  "startSuppressRingtoneActivityBroadcastingForCall:",  v6);
  }
}

- (void)callStartedConnecting:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if (([v6 isOutgoing] & 1) == 0)
  {
    id v7 = sub_1001704C4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Broadcasting suppress ringtone activity for incoming call that started connecting: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[CSDUserActivityManager startSuppressRingtoneActivityBroadcastingForCall:]( self,  "startSuppressRingtoneActivityBroadcastingForCall:",  v6);
  }
}

- (void)callConnected:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CSDCall, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    -[CSDUserActivityManager updateHandoffActivityStateForCall:](self, "updateHandoffActivityStateForCall:", v10);
  }

  else
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      int v16 = 138412546;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = (id)objc_opt_class(&OBJC_CLASS___CSDCall, v14);
      id v15 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Expected %@ to be kind of class %@, but is not",  (uint8_t *)&v16,  0x16u);
    }
  }
}

- (void)callIsUplinkMutedChanged:(id)a3
{
  id v8 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 object]);
    -[CSDUserActivityManager updateAudioVideoHandoffPreferencesForCall:]( self,  "updateAudioVideoHandoffPreferencesForCall:",  v7);
  }
}

- (void)callIsSendingVideoChanged:(id)a3
{
  id v8 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 object]);
    -[CSDUserActivityManager updateAudioVideoHandoffPreferencesForCall:]( self,  "updateAudioVideoHandoffPreferencesForCall:",  v7);
  }
}

- (void)updateAudioVideoHandoffPreferencesForCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    if (v4
      && [v4 isConversation]
      && (uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 callGroupUUID])) != 0
      && (id v8 = (void *)v7, v9 = [v4 status], v8, v9 == 1))
    {
      -[CSDUserActivityManager updateHandoffAdvertisementForCall:](self, "updateHandoffAdvertisementForCall:", v4);
    }

    else
    {
      id v10 = sub_1001704C4();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        else {
          id v12 = @"NO";
        }
        else {
          id v13 = @"NO";
        }
        if (v4) {
          uint64_t v14 = @"YES";
        }
        else {
          uint64_t v14 = @"NO";
        }
        if (v4)
        {
          else {
            id v15 = @"NO";
          }
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
          if (v16) {
            id v17 = @"YES";
          }
          else {
            id v17 = @"NO";
          }
          int v19 = 138413570;
          else {
            __int16 v18 = @"NO";
          }
          __int16 v20 = v12;
          __int16 v21 = 2112;
          id v22 = v13;
          __int16 v23 = 2112;
          id v24 = v14;
          __int16 v25 = 2112;
          uint64_t v26 = v15;
          __int16 v27 = 2112;
          id v28 = v17;
          __int16 v29 = 2112;
          uint64_t v30 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but c all didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)",  (uint8_t *)&v19,  0x3Eu);
        }

        else
        {
          int v19 = 138413570;
          __int16 v20 = v12;
          __int16 v21 = 2112;
          id v22 = v13;
          __int16 v23 = 2112;
          id v24 = v14;
          __int16 v25 = 2112;
          uint64_t v26 = @"NO";
          __int16 v27 = 2112;
          id v28 = @"NO";
          __int16 v29 = 2112;
          uint64_t v30 = @"NO";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but c all didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)",  (uint8_t *)&v19,  0x3Eu);
        }
      }
    }
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  -[CSDUserActivityManager updateCallHandoffRegistration](self, "updateCallHandoffRegistration");
}

- (void)receivedBroadcastedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4 originatingDeviceType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100019248;
  v13[3] = &unk_1003D7A18;
  unsigned int v17 = a3;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)stoppedReceivingActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue", *(void *)&a3, a4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100019674;
  v7[3] = &unk_1003D78C8;
  unsigned int v8 = a3;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:]( self,  "updateHandoffAdvertisementForConversation:fromOldConversation:",  v9,  v7);
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:]( self,  "updateHandoffAdvertisementForConversation:fromOldConversation:",  v9,  v7);
}

- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4
{
  id v6 = a4;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:]( self,  "updateHandoffAdvertisementForConversation:fromOldConversation:",  v6,  0LL);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    int v11 = 136315394;
    id v12 = "-[CSDUserActivityManager conversationManager:activeRemoteParticipantsChangedForConversation:fromOldConversation:]";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Updating handoff registration for conversation UUID %@",  (uint8_t *)&v11,  0x16u);
  }

  -[CSDUserActivityManager updateHandoffRegistrationForConversation:fromOldConversation:]( self,  "updateHandoffRegistrationForConversation:fromOldConversation:",  v6,  v6);
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    int v10 = 136315394;
    int v11 = "-[CSDUserActivityManager conversationManager:addedActiveConversation:]";
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Updating handoff registration for conversation UUID %@",  (uint8_t *)&v10,  0x16u);
  }

  -[CSDUserActivityManager updateHandoffRegistrationForConversation:fromOldConversation:]( self,  "updateHandoffRegistrationForConversation:fromOldConversation:",  v5,  0LL);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 activeConversations]);
  id v10 = [v9 count];

  if (v10)
  {
    -[CSDUserActivityManager deregisterHandoffIdentifiersForConversation:]( self,  "deregisterHandoffIdentifiersForConversation:",  v6);
  }

  else
  {
    id v11 = sub_1001704C4();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No more conversations, unregistering all conversation handoff dynamic identifiers",  v14,  2u);
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
    [v13 stopListeningForActivityType:5 dynamicIdentifier:0];
  }

  -[CSDUserActivityManager stopAdvertisingForRemovedConversationIfNecessary:]( self,  "stopAdvertisingForRemovedConversationIfNecessary:",  v6);
}

- (void)stopAdvertisingForRemovedConversationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  int v19 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](self, "activityCommunicator"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 queuedActivitiesOfType:5]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dynamicIdentifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 groupUUID]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
        unsigned int v17 = [v14 containsString:v16];

        if (v17)
        {
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserActivityManager activityCommunicator](v19, "activityCommunicator"));
          [v18 stopBroadcastingActivity:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }
}

- (id)dynamicIdentifierForConversation:(id)a3 uplinkMuted:(BOOL)a4 sendingVideo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 state] != (id)3) {
    goto LABEL_6;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 provider]);
  if (![v8 isDefaultProvider])
  {
LABEL_8:
    __int16 v12 = 0LL;
    goto LABEL_9;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 activeRemoteParticipants]);
  id v10 = [v9 count];
  if (v10 >= +[TUConversationManager maximumNumberOfInvitedMembers]( &OBJC_CLASS___TUConversationManager,  "maximumNumberOfInvitedMembers"))
  {

    goto LABEL_8;
  }

  id v11 = [v7 avMode];

  if (v11)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:]( NSString,  "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:",  v8,  [v7 localParticipantIdentifier],  v6,  v5));
LABEL_9:

    goto LABEL_10;
  }

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
}

- (CSDUserActivityCommunicatorProtocol)activityCommunicator
{
  return self->_activityCommunicator;
}

- (void)setActivityCommunicator:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return (TUCallCenter *)objc_loadWeakRetained((id *)&self->_callCenter);
}

- (void)setCallCenter:(id)a3
{
}

- (CSDUserActivity)handoffActivity
{
  return self->_handoffActivity;
}

- (void)setHandoffActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

@end