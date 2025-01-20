@interface CSDReportingController
+ (CSDReportingController)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDClientManager)clientManager;
- (CSDReportingController)initWithQueue:(id)a3;
- (NSArray)calls;
- (NSMutableArray)reporters;
- (NSMutableDictionary)reportingSessionByStreamToken;
- (NSMutableSet)conversationUUIDs;
- (OS_dispatch_queue)queue;
- (void)addReporter:(id)a3;
- (void)avcBlobRecoveryStartedForConversation:(id)a3;
- (void)avcBlobRecoveryTimedOutForConversation:(id)a3;
- (void)avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a3;
- (void)avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a3;
- (void)avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a3;
- (void)chatReceived:(id)a3;
- (void)connectionSetupReportReceived:(id)a3 eventType:(int64_t)a4 forConversation:(id)a5;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 addedActivatedLink:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)createConversationReportingSession:(id)a3;
- (void)createOneToOneFTReportingSessionForCallWithUUID:(id)a3 withReportingHierarchyToken:(id)a4 withVideo:(BOOL)a5;
- (void)dealloc;
- (void)didCleanUpForStream:(int64_t)a3;
- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4;
- (void)didEndSession:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4;
- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4;
- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)groupActivitiesReportsReceived:(id)a3 forConversation:(id)a4;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleScreeningChanged:(id)a3;
- (void)handoffReportReceived:(id)a3 forConversation:(id)a4;
- (void)idsReportsReceived:(id)a3 forConversation:(id)a4;
- (void)idsReportsReceived:(id)a3 forSessionWithUUID:(id)a4;
- (void)messageRetryFailedForConversationGroupUUID:(id)a3;
- (void)messageRetryStartedForConversationGroupUUID:(id)a3;
- (void)messageRetrySucceededForConversationGroupUUID:(id)a3;
- (void)momentsController:(id)a3 didCleanUpForStream:(int64_t)a4;
- (void)momentsController:(id)a3 didReceiveResultsForStream:(int64_t)a4 withTransactionID:(id)a5;
- (void)momentsController:(id)a3 didStartRequestForStream:(int64_t)a4 withTransactionID:(id)a5;
- (void)momentsController:(id)a3 registeredStream:(int64_t)a4 withAvailability:(int)a5;
- (void)momentsReportingSession:(id)a3 didGenerateUsageReport:(id)a4;
- (void)oneToOneModeSwitchFailureForConversation:(id)a3 isOneToOneMode:(BOOL)a4;
- (void)receivedLetMeInRequestForConversation:(id)a3;
- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4;
- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5;
- (void)remoteMemberNotInMemberListForConversation:(id)a3;
- (void)reportAllCallsBackgrounded;
- (void)reportCallEnteredForeground:(id)a3;
- (void)reportJoinDurationLongerThanThreasholdForCallUUID:(id)a3 report:(id)a4;
- (void)reportProviderFailedWithAction:(id)a3 forCall:(id)a4;
- (void)reportRelayMessageReceived:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)reportRouteWasPicked:(id)a3;
- (void)reportRouteWasPickedByAnyTrigger:(id)a3;
- (void)reportTimedOutPickingRoute:(id)a3;
- (void)reportTransactionGroupCompleted:(id)a3;
- (void)reportingController:(id)a3 letMeInRequestStateChangedForConversation:(id)a4;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)sentLetMeInRequestForConversation:(id)a3 isApproved:(BOOL)a4;
- (void)setReporters:(id)a3;
- (void)transitionAttemptForConversation:(id)a3;
- (void)voipAppBecameDisabledFromLaunching:(id)a3;
- (void)voipAppFailedToPostIncomingCall:(id)a3;
- (void)voipDOSCallIgnored:(id)a3;
- (void)voipPushDroppedOnTheFloor:(id)a3;
@end

@implementation CSDReportingController

+ (CSDReportingController)sharedInstance
{
  return (CSDReportingController *)+[CSDReportingController sharedInstanceWithQueue:]( &OBJC_CLASS___CSDReportingController,  "sharedInstanceWithQueue:",  &_dispatch_main_q);
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017BE1C;
  block[3] = &unk_1003D7730;
  id v8 = a3;
  uint64_t v3 = qword_10044D140;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10044D140, block);
  }
  id v5 = (id)qword_10044D138;

  return v5;
}

- (CSDReportingController)initWithQueue:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CSDReportingController;
  v6 = -[CSDReportingController init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v7->_queue);
    clientManager = v7->_clientManager;
    v7->_clientManager = v8;

    -[CSDClientManager setRequiredConnectionCapability:]( v7->_clientManager,  "setRequiredConnectionCapability:",  @"modify-reports");
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TUReportingControllerXPCClient reportingControllerServerXPCInterface]( &OBJC_CLASS___TUReportingControllerXPCClient,  "reportingControllerServerXPCInterface"));
    -[CSDClientManager setExportedInterface:](v7->_clientManager, "setExportedInterface:", v10);

    -[CSDClientManager setExportedObject:](v7->_clientManager, "setExportedObject:", v7);
    -[CSDClientManager setInterruptionHandler:](v7->_clientManager, "setInterruptionHandler:", &stru_1003DBF98);
    -[CSDClientManager setInvalidationHandler:](v7->_clientManager, "setInvalidationHandler:", &stru_1003DBFB8);
    -[CSDClientManager startListeningOnMachServiceWithName:]( v7->_clientManager,  "startListeningOnMachServiceWithName:",  @"com.apple.telephonyutilities.callservicesdaemon.reportingcontroller");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    reporters = v7->_reporters;
    v7->_reporters = (NSMutableArray *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    reportingSessionByStreamToken = v7->_reportingSessionByStreamToken;
    v7->_reportingSessionByStreamToken = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    conversationUUIDs = v7->_conversationUUIDs;
    v7->_conversationUUIDs = (NSMutableSet *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v7 selector:"handleCallStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v17 addObserver:v7 selector:"handleCallStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v17 addObserver:v7 selector:"handleScreeningChanged:" name:TUCallCenterIsScreeningChangedNotification object:0];
    queue = (dispatch_queue_s *)v7->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10017C1DC;
    v20[3] = &unk_1003D7758;
    v21 = v7;
    id v22 = v5;
    dispatch_async(queue, v20);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDReportingController;
  -[CSDReportingController dealloc](&v4, "dealloc");
}

- (void)addReporter:(id)a3
{
  id v4 = a3;
  if (TUSimulatedModeEnabled(v4))
  {
    id v5 = sub_1001704C4();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not adding reporter %@ since simulated mode is enabled",  (uint8_t *)&v8,  0xCu);
    }
  }

  if ((objc_opt_respondsToSelector(v4, "setDataSource:") & 1) != 0) {
    [v4 setDataSource:self];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
  [v7 addObject:v4];
}

- (void)handleScreeningChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDReportingController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017C420;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDReportingController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017C640;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)reportJoinDurationLongerThanThreasholdForCallUUID:(id)a3 report:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "reportJoinDurationLongerThanThreashold for callUUID: %@",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "reportingController:forCallUUID:report:") & 1) != 0) {
          [v15 reportingController:self forCallUUID:v6 report:v7];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)reportCallEnteredForeground:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "for call: %@", buf, 0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:callEnteredForeground:") & 1) != 0) {
          [v12 reportingController:self callEnteredForeground:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)reportAllCallsBackgrounded
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
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
        if ((objc_opt_respondsToSelector(v10, "allCallsBackgroundedForReportingController:") & 1) != 0) {
          [v10 allCallsBackgroundedForReportingController:self];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)reportRelayMessageReceived:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "for message: %@", buf, 0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "reportingController:relayMessageReceived:fromPairedDevice:") & 1) != 0) {
          [v14 reportingController:self relayMessageReceived:v6 fromPairedDevice:v4];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (void)reportTransactionGroupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "transactionGroup: %@", buf, 0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:transactionGroupCompleted:") & 1) != 0) {
          [v12 reportingController:self transactionGroupCompleted:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)reportProviderFailedWithAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "with action: %@ for call %@", buf, 0x16u);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "reportingController:providerFailedWithAction:forCall:") & 1) != 0) {
          [v15 reportingController:self providerFailedWithAction:v6 forCall:v7];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)reportRouteWasPicked:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "route: %@", buf, 0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      id v11 = "reportingController:pickedRoute:forCall:";
      __int128 v19 = "reportingController:pickedRoute:forCall:";
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        if ((objc_opt_respondsToSelector(v12, v11) & 1) != 0)
        {
          id v13 = v8;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController calls](self, "calls"));
          id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                objc_msgSend( v12,  "reportingController:pickedRoute:forCall:",  self,  v4,  *(void *)(*((void *)&v21 + 1) + 8 * (void)i),  v19);
              }

              id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v16);
          }

          id v8 = v13;
          id v11 = v19;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v8);
  }
}

- (void)reportRouteWasPickedByAnyTrigger:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "picked route: %@", buf, 0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      id v11 = "reportingController:pickedRoute:updatedByAnyTriggerForCall:";
      __int128 v19 = "reportingController:pickedRoute:updatedByAnyTriggerForCall:";
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        if ((objc_opt_respondsToSelector(v12, v11) & 1) != 0)
        {
          id v13 = v8;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController calls](self, "calls"));
          id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                objc_msgSend( v12,  "reportingController:pickedRoute:updatedByAnyTriggerForCall:",  self,  v4,  *(void *)(*((void *)&v21 + 1) + 8 * (void)i),  v19);
              }

              id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v16);
          }

          id v8 = v13;
          id v11 = v19;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v8);
  }
}

- (void)reportTimedOutPickingRoute:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "route: %@", buf, 0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      id v11 = "reportingController:timedOutPickingRoute:forCall:";
      __int128 v19 = "reportingController:timedOutPickingRoute:forCall:";
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        if ((objc_opt_respondsToSelector(v12, v11) & 1) != 0)
        {
          id v13 = v8;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController calls](self, "calls"));
          id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                objc_msgSend( v12,  "reportingController:timedOutPickingRoute:forCall:",  self,  v4,  *(void *)(*((void *)&v21 + 1) + 8 * (void)i),  v19);
              }

              id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v16);
          }

          id v8 = v13;
          id v11 = v19;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v8);
  }
}

- (void)createOneToOneFTReportingSessionForCallWithUUID:(id)a3 withReportingHierarchyToken:(id)a4 withVideo:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDReportingController queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10017D83C;
  v13[3] = &unk_1003D8FE0;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  BOOL v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)createConversationReportingSession:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDReportingController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10017DAB4;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)idsReportsReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "reportingController:receivedIDSReports:forConversation:") & 1) != 0) {
          [v13 reportingController:self receivedIDSReports:v6 forConversation:v7];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (void)idsReportsReceived:(id)a3 forSessionWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "reportingController:receivedIDSReports:forSessionWithUUID:") & 1) != 0) {
          [v13 reportingController:self receivedIDSReports:v6 forSessionWithUUID:v7];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (void)chatReceived:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "chat=%@", buf, 0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:receivedIDSChat:") & 1) != 0) {
          [v12 reportingController:self receivedIDSChat:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)handoffReportReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    *(_DWORD *)buf = 138412546;
    __int128 v23 = v10;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "handoffReportReceived for conversationUUID %@, %@",  buf,  0x16u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, "reportingController:receivedHandoffReport:forConversation:") & 1) != 0) {
          [v16 reportingController:self receivedHandoffReport:v6 forConversation:v7];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v13);
  }
}

- (void)connectionSetupReportReceived:(id)a3 eventType:(int64_t)a4 forConversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRTCConnectionSetup eventTypeNameFrom:]( &OBJC_CLASS___CSDRTCConnectionSetup,  "eventTypeNameFrom:",  a4));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    *(_DWORD *)buf = 138412546;
    __int128 v26 = v12;
    __int16 v27 = 2112;
    __int128 v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "connectionSetupReport received eventType %@ for conversationUUID %@",  buf,  0x16u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v19,  "reportingController:receivedConnectionSetupReport:eventType:forConversation:") & 1) != 0) {
          [v19 reportingController:self receivedConnectionSetupReport:v8 eventType:a4 forConversation:v9];
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v16);
  }
}

- (void)groupActivitiesReportsReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "groupActivitiesReports received for conversation %@",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "reportingController:receivedGroupActivitiesReports:forConversation:") & 1) != 0) {
          [v15 reportingController:self receivedGroupActivitiesReports:v6 forConversation:v7];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)avcBlobRecoveryStartedForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "blob recovery started for conversation %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:AVCBlobRecoveryStartedForConversation:") & 1) != 0) {
          [v12 reportingController:self AVCBlobRecoveryStartedForConversation:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)remoteMemberNotInMemberListForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "remoteMemberNotInMemberList for conversation %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:remoteMemberNotInMemberListForConversation:") & 1) != 0) {
          [v12 reportingController:self remoteMemberNotInMemberListForConversation:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)transitionAttemptForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "attempted transition for conversation %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:transitionAttemptForConversation:") & 1) != 0) {
          [v12 reportingController:self transitionAttemptForConversation:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)avcBlobRecoveryTimedOutForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "blob recovery timed out for conversation %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:AVCBlobRecoveryTimedOutForConversation:") & 1) != 0) {
          [v12 reportingController:self AVCBlobRecoveryTimedOutForConversation:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)oneToOneModeSwitchFailureForConversation:(id)a3 isOneToOneMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "report oneToOneSwitchFailure %@ for conversation %@",  buf,  0x16u);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v15,  "reportingController:oneToOneModeSwitchFailureForConversation:isOneToOneMode:") & 1) != 0) {
          [v15 reportingController:self oneToOneModeSwitchFailureForConversation:v6 isOneToOneMode:v4];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (void)messageRetryStartedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "message retry started for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:messageRetryStartedForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self messageRetryStartedForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)messageRetryFailedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "message retry failed for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:messageRetryFailedForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self messageRetryFailedForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)messageRetrySucceededForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "message retry succeeded for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:messageRetrySucceededForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self messageRetrySucceededForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "avc blob request message retry started for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v12,  "reportingController:avcBlobRequestMessageRetryStartedForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self avcBlobRequestMessageRetryStartedForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "avc blob request message retry failed for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v12,  "reportingController:avcBlobRequestMessageRetryFailedForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self avcBlobRequestMessageRetryFailedForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "avc blob request message retry succeeded for conversationGroupUUID %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v12,  "reportingController:avcBlobRequestMessageRetrySucceededForConversationGroupUUID:") & 1) != 0) {
          [v12 reportingController:self avcBlobRequestMessageRetrySucceededForConversationGroupUUID:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)voipAppFailedToPostIncomingCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "VoIP app %@ failed to post incoming call",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:voipAppFailedToPostIncomingCall:") & 1) != 0) {
          [v12 reportingController:self voipAppFailedToPostIncomingCall:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)voipAppBecameDisabledFromLaunching:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "VoIP app %@ no longer eligible to launch",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:voipAppBecameDisabledFromLaunching:") & 1) != 0) {
          [v12 reportingController:self voipAppBecameDisabledFromLaunching:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)voipPushDroppedOnTheFloor:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "VoIP push for app %@ dropped on the floor",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:voipPushDroppedOnTheFloor:") & 1) != 0) {
          [v12 reportingController:self voipPushDroppedOnTheFloor:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)voipDOSCallIgnored:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "VoIP DOS detected for %@, ignoring call",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:voipDOSCallIgnored:") & 1) != 0) {
          [v12 reportingController:self voipDOSCallIgnored:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)receivedLetMeInRequestForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "receivedLetMeInRequestForConversation: %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
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
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "reportingController:receivedLetMeInRequestForConversation:") & 1) != 0) {
          [v12 reportingController:self receivedLetMeInRequestForConversation:v4];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)sentLetMeInRequestForConversation:(id)a3 isApproved:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "sentLetMeInRequestForConversation: %@ isApproved: %d",  buf,  0x12u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "reportingController:sentLetMeInResponseForConversation:isApproved:") & 1) != 0) {
          [v14 reportingController:self sentLetMeInResponseForConversation:v6 isApproved:v4];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 1024;
    int v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Send User Score to RTCReporting with UUID:%@ and Score:%d",  buf,  0x12u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "reportingController:callUUID:withUserScore:") & 1) != 0) {
          [v14 reportingController:self callUUID:v6 withUserScore:v4];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (void)didEndSession:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Send activity session ended with startDate %@ endDate%@ session %@",  buf,  0x20u);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v18, "reportingController:didEndSession:startDate:endDate:") & 1) != 0) {
          [v18 reportingController:self didEndSession:v8 startDate:v9 endDate:v10];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v15);
  }
}

- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = -[CSDMomentsReportingSession initWithStreamToken:]( objc_alloc(&OBJC_CLASS___CSDMomentsReportingSession),  "initWithStreamToken:",  a3);
  -[CSDMomentsReportingSession setDelegate:](v9, "setDelegate:", self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reportingSessionByStreamToken](self, "reportingSessionByStreamToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v7 setObject:v9 forKeyedSubscript:v8];

  -[CSDMomentsReportingSession registeredStreamWithAvailability:](v9, "registeredStreamWithAvailability:", v4);
}

- (void)didCleanUpForStream:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reportingSessionByStreamToken](self, "reportingSessionByStreamToken"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  [v6 didCleanUp];
}

- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reportingSessionByStreamToken](self, "reportingSessionByStreamToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  [v9 didStartRequestWithTransactionID:v6];
}

- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reportingSessionByStreamToken](self, "reportingSessionByStreamToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  [v9 didReceiveResultsWithTransactionID:v6];
}

- (void)momentsController:(id)a3 registeredStream:(int64_t)a4 withAvailability:(int)a5
{
}

- (void)momentsController:(id)a3 didCleanUpForStream:(int64_t)a4
{
}

- (void)momentsController:(id)a3 didStartRequestForStream:(int64_t)a4 withTransactionID:(id)a5
{
}

- (void)momentsController:(id)a3 didReceiveResultsForStream:(int64_t)a4 withTransactionID:(id)a5
{
}

- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5
{
}

- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4
{
}

- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
}

- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
}

- (void)momentsReportingSession:(id)a3 didGenerateUsageReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reporting %@", buf, 0xCu);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "reportingController:capturedMomentsUsageReport:") & 1) != 0) {
          [v15 reportingController:self capturedMomentsUsageReport:v7];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reportingSessionByStreamToken](self, "reportingSessionByStreamToken"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v6 streamToken]));
  [v16 setObject:0 forKeyedSubscript:v17];
}

- (NSArray)calls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentAudioAndVideoCalls]);

  return (NSArray *)v3;
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 activeConversations]);
  id v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    uint64_t v22 = *(void *)v30;
    do
    {
      id v7 = 0LL;
      id v23 = v5;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController conversationUUIDs](self, "conversationUUIDs"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
        unsigned __int8 v12 = [v9 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController conversationUUIDs](self, "conversationUUIDs"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
          [v13 addObject:v15];

          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
          id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v26;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v26 != v19) {
                  objc_enumerationMutation(v16);
                }
                __int128 v21 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
                if ((objc_opt_respondsToSelector(v21, "reportingController:addedActiveConversation:") & 1) != 0) {
                  [v21 reportingController:self addedActiveConversation:v8];
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }

            while (v18);
          }

          uint64_t v6 = v22;
          id v5 = v23;
        }

        id v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v5);
  }
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "reportingController:activeRemoteParticipantsChangedForConversation:") & 1) != 0) {
          [v11 reportingController:self activeRemoteParticipantsChangedForConversation:v5];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "reportingController:remoteMembersChangedForConversation:") & 1) != 0) {
          [v11 reportingController:self remoteMembersChangedForConversation:v5];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "reportingController:stateChangedForConversation:") & 1) != 0) {
          [v11 reportingController:self stateChangedForConversation:v5];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)reportingController:(id)a3 letMeInRequestStateChangedForConversation:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "reportingController:letMeInRequestStateChangedForConversation:") & 1) != 0) {
          [v11 reportingController:self letMeInRequestStateChangedForConversation:v5];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v5 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters"));
  id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController conversationUUIDs](self, "conversationUUIDs"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        [v11 removeObject:v13];

        if ((objc_opt_respondsToSelector(v10, "reportingController:removedActiveConversation:") & 1) != 0) {
          [v10 reportingController:self removedActiveConversation:v5];
        }
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }
}

- (void)conversationManager:(id)a3 addedActivatedLink:(id)a4
{
  id v5 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDReportingController reporters](self, "reporters", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "reportingController:addedActivatedLink:") & 1) != 0) {
          [v11 reportingController:self addedActivatedLink:v5];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (NSMutableArray)reporters
{
  return self->_reporters;
}

- (void)setReporters:(id)a3
{
}

- (NSMutableDictionary)reportingSessionByStreamToken
{
  return self->_reportingSessionByStreamToken;
}

- (NSMutableSet)conversationUUIDs
{
  return self->_conversationUUIDs;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (void).cxx_destruct
{
}

@end