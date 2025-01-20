@interface CSDAbstractFaceTimeConversationProviderDelegate
- (BOOL)_isWaitingToJoinForConversationUUID:(id)a3;
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isAudioSessionActive;
- (BOOL)isConversationJoiningOrJoined:(id)a3;
- (BOOL)isLocalMemberOf:(id)a3 associatedTo:(id)a4;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isManagingPendingConversationForCallWithUUID:(id)a3;
- (BOOL)isWaitingToJoinForConversationUUID:(id)a3;
- (BOOL)shouldAutomaticallyLeaveConversation:(id)a3;
- (BOOL)usesAudioSession;
- (CSDAbstractFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (CSDAbstractFaceTimeConversationProviderDelegate)initWithQueue:(id)a3 conversationManager:(id)a4 networkSupport:(id)a5 serverBag:(id)a6 featureFlags:(id)a7 invitationResolver:(id)a8;
- (CSDConversationInvitationResolving)invitationResolver;
- (CSDConversationManager)conversationManager;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (CXProvider)provider;
- (FTDeviceSupport)deviceSupport;
- (FTNetworkSupport)networkSupport;
- (NSMutableDictionary)callUUIDsByConversationUUID;
- (NSMutableDictionary)conversationUUIDsByCallUUID;
- (NSMutableSet)callUUIDsUpgradedForAVMode;
- (NSMutableSet)conversationUUIDsAwaitingActiveAudioSession;
- (NSMutableSet)conversationUUIDsWaitingToJoin;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_findPendingConversationWithCallUUID:(id)a3;
- (id)callUUIDForConversationUUID:(id)a3;
- (id)conversationUUIDForCallUUID:(id)a3;
- (id)pendingConversationUUIDForCallWithUUID:(id)a3;
- (id)providerDidBegin;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (void)associateCallUUID:(id)a3 withConversationUUID:(id)a4 waitingToJoin:(BOOL)a5;
- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4;
- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forParticipantWithHandle:(id)a6 forConversation:(id)a7;
- (void)conversationManager:(id)a3 conversation:(id)a4 removedActiveParticipant:(id)a5 withReason:(unint64_t)a6;
- (void)conversationManager:(id)a3 reportedNewIncomingConversation:(id)a4 fromHandle:(id)a5;
- (void)dealloc;
- (void)displayGreenTeaAlertForAppleTV;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)enqueueConversationWaitingForAudioWithConversationUUID:(id)a3;
- (void)enqueueOrStartAudioForConversationUUID:(id)a3;
- (void)fullfillPendingJoinActionsForCallUUIDIfNecessary:(id)a3;
- (void)handleAudioInterruptionPropertiesChanged:(id)a3;
- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5;
- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4;
- (void)proceedToJoinForConversation:(id)a3 action:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)removeActiveAudioSessionObjectForConversationWithUUID:(id)a3;
- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 callUUID:(id)a5 isReRing:(BOOL)a6;
- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 isReRing:(BOOL)a5;
- (void)setAudioSessionActive:(BOOL)a3;
- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4;
- (void)setConversationUUID:(id)a3 forCallUUID:(id)a4;
- (void)setDeviceSupport:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setInvitationResolver:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
- (void)setWaitingToJoin:(BOOL)a3 forConversationUUID:(id)a4;
- (void)startAudioForConversationsIfNecessary;
- (void)updateNetworkCriticalStateIfNecessary;
@end

@implementation CSDAbstractFaceTimeConversationProviderDelegate

- (CSDAbstractFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v12 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
  v13 = -[CSDAbstractFaceTimeConversationProviderDelegate initWithQueue:conversationManager:networkSupport:serverBag:featureFlags:invitationResolver:]( self,  "initWithQueue:conversationManager:networkSupport:serverBag:featureFlags:invitationResolver:",  v9,  v10,  0LL,  v12,  v11,  v8);

  return v13;
}

- (CSDAbstractFaceTimeConversationProviderDelegate)initWithQueue:(id)a3 conversationManager:(id)a4 networkSupport:(id)a5 serverBag:(id)a6 featureFlags:(id)a7 invitationResolver:(id)a8
{
  id v36 = a3;
  id v35 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CSDAbstractFaceTimeConversationProviderDelegate;
  v19 = -[CSDAbstractFaceTimeConversationProviderDelegate init](&v37, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a3);
    objc_storeStrong((id *)&v20->_conversationManager, a4);
    -[CSDConversationManager addDelegate:queue:]( v20->_conversationManager,  "addDelegate:queue:",  v20,  v20->_queue,  v35,  v36);
    if (v15) {
      v21 = (FTNetworkSupport *)v15;
    }
    else {
      v21 = (FTNetworkSupport *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    }
    networkSupport = v20->_networkSupport;
    v20->_networkSupport = v21;

    objc_storeStrong((id *)&v20->_serverBag, a6);
    objc_storeStrong((id *)&v20->_invitationResolver, a8);
    objc_storeStrong((id *)&v20->_featureFlags, a7);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    conversationUUIDsWaitingToJoin = v20->_conversationUUIDsWaitingToJoin;
    v20->_conversationUUIDsWaitingToJoin = (NSMutableSet *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    callUUIDsByConversationUUID = v20->_callUUIDsByConversationUUID;
    v20->_callUUIDsByConversationUUID = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    conversationUUIDsByCallUUID = v20->_conversationUUIDsByCallUUID;
    v20->_conversationUUIDsByCallUUID = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    conversationUUIDsAwaitingActiveAudioSession = v20->_conversationUUIDsAwaitingActiveAudioSession;
    v20->_conversationUUIDsAwaitingActiveAudioSession = (NSMutableSet *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    callUUIDsUpgradedForAVMode = v20->_callUUIDsUpgradedForAVMode;
    v20->_callUUIDsUpgradedForAVMode = (NSMutableSet *)v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v33 addObserver:v20 selector:"handleAudioInterruptionPropertiesChanged:" name:@"CSDCallAudioInterruptionPropertiesChangedNotification" object:0];
  }

  return v20;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDAbstractFaceTimeConversationProviderDelegate;
  -[CSDAbstractFaceTimeConversationProviderDelegate dealloc](&v4, "dealloc");
}

- (NSMutableSet)conversationUUIDsWaitingToJoin
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_conversationUUIDsWaitingToJoin;
}

- (BOOL)isWaitingToJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A1DFC;
  block[3] = &unk_1003D9650;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)_isWaitingToJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsWaitingToJoin]( self,  "conversationUUIDsWaitingToJoin"));
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (void)setWaitingToJoin:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsWaitingToJoin]( self,  "conversationUUIDsWaitingToJoin"));
    id v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }
  }
}

- (NSMutableDictionary)callUUIDsByConversationUUID
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_callUUIDsByConversationUUID;
}

- (id)callUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1001A2060;
  id v16 = sub_1001A2070;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A2078;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  [v9 setObject:v7 forKeyedSubscript:v6];
}

- (void)removeActiveAudioSessionObjectForConversationWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
  [v6 removeObject:v4];
}

- (void)updateNetworkCriticalStateIfNecessary
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = [v5 count];

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v6) {
      id v9 = @"YES";
    }
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting enableCriticalReliability %@",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate networkSupport](self, "networkSupport"));
  [v10 setEnableCriticalReliability:v6 != 0];
}

- (NSMutableDictionary)conversationUUIDsByCallUUID
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_conversationUUIDsByCallUUID;
}

- (id)conversationUUIDForCallUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1001A2060;
  id v16 = sub_1001A2070;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A241C;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  int v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setConversationUUID:(id)a3 forCallUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  [v9 setObject:v7 forKeyedSubscript:v6];
}

- (void)handleAudioInterruptionPropertiesChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CSDCallAudioInterruptionProviderUserInfoKey"]);
  unsigned int v6 = [v5 isEqualToString:@"CSDCallAudioInterruptionProviderUserInfoAVAudioClient"];

  if (v6)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A25B4;
    block[3] = &unk_1003D7730;
    block[4] = self;
    dispatch_async(v7, block);
  }

- (BOOL)usesAudioSession
{
  return 1;
}

- (void)enqueueConversationWaitingForAudioWithConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
  [v5 addObject:v4];

  -[CSDAbstractFaceTimeConversationProviderDelegate startAudioForConversationsIfNecessary]( self,  "startAudioForConversationsIfNecessary");
}

- (void)enqueueOrStartAudioForConversationUUID:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  unsigned __int8 v5 = [v4 isConversationWithUUIDRedirectingAudio:v7];

  if ((v5 & 1) != 0)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    [v6 startAudioForConversationWithUUID:v7];
  }

  else
  {
    -[CSDAbstractFaceTimeConversationProviderDelegate enqueueConversationWaitingForAudioWithConversationUUID:]( self,  "enqueueConversationWaitingForAudioWithConversationUUID:",  v7);
  }
}

- (void)startAudioForConversationsIfNecessary
{
  if (-[CSDAbstractFaceTimeConversationProviderDelegate usesAudioSession](self, "usesAudioSession")
    && !-[CSDAbstractFaceTimeConversationProviderDelegate isAudioSessionActive](self, "isAudioSessionActive"))
  {
    id v13 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (-[CSDAbstractFaceTimeConversationProviderDelegate usesAudioSession](self, "usesAudioSession")) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      if (-[CSDAbstractFaceTimeConversationProviderDelegate isAudioSessionActive](self, "isAudioSessionActive")) {
        id v15 = @"YES";
      }
      else {
        id v15 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not starting audio for conversation: usesAudioSession: %@, isAudioSessionActive: %@",  buf,  0x16u);
    }
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
    id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(const __CFString **)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v9 = sub_1001704C4();
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting audio for conversation with conversationUUID %@",  buf,  0xCu);
          }

          int v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          [v11 startAudioForConversationWithUUID:v8];
        }

        id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v5);
    }

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
    -[os_log_s removeAllObjects](v12, "removeAllObjects");
  }
}

- (id)_findPendingConversationWithCallUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pseudonymsByCallUUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conversationsByUUID]);
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "pseudonymsByCallUUID: %@, conversationsByUUID: %@",  buf,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonymsByCallUUID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v4]);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationsByUUID]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);

  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    id v27 = v4;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if ([v20 isPendingConversation])
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 link]);
          if (v21)
          {
            __int16 v22 = (void *)v21;
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 link]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pseudonym]);
            unsigned int v25 = [v24 isEqualToString:v13];

            if (v25)
            {
              id v17 = v20;
              goto LABEL_15;
            }
          }
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17) {
        continue;
      }
      break;
    }

- (void)associateCallUUID:(id)a3 withConversationUUID:(id)a4 waitingToJoin:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  -[CSDAbstractFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  v9,  v8);
  -[CSDAbstractFaceTimeConversationProviderDelegate setConversationUUID:forCallUUID:]( self,  "setConversationUUID:forCallUUID:",  v8,  v9);

  -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  v5,  v8);
  -[CSDAbstractFaceTimeConversationProviderDelegate updateNetworkCriticalStateIfNecessary]( self,  "updateNetworkCriticalStateIfNecessary");
}

- (void)conversationManager:(id)a3 reportedNewIncomingConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v8 = (os_log_s *)a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](v7, "provider"));
  unsigned __int8 v11 = -[CSDAbstractFaceTimeConversationProviderDelegate shouldHandleProvider:]( self,  "shouldHandleProvider:",  v10);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v14)
    {
      int v20 = 138412546;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Conversation manager reported a new incoming conversation %@ from handle %@",  (uint8_t *)&v20,  0x16u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate UUID](v7, "UUID"));
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

    if (v13)
    {
      id v17 = sub_1001704C4();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v19 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate UUID]( v7,  "UUID"));
        int v20 = 138412546;
        uint64_t v21 = v19;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Ignoring new conversation %@ since we are already tracking this with call %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    else
    {
      -[CSDAbstractFaceTimeConversationProviderDelegate reportNewIncomingCallForConversation:fromHandle:isReRing:]( self,  "reportNewIncomingCallForConversation:fromHandle:isReRing:",  v7,  v8,  0LL);
    }
  }

  else if (v14)
  {
    int v20 = 138412546;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = (os_log_s *)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ should not handle conversation: %@",  (uint8_t *)&v20,  0x16u);
  }
}

- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forParticipantWithHandle:(id)a6 forConversation:(id)a7
{
  id v9 = a6;
  id v10 = a7;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (v13)
  {
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
      int v19 = 138412546;
      int v20 = v13;
      __int16 v21 = 2112;
      __int16 v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Skipping to report a new call since we already have a call with UUID: %@ for conversationUUID: %@",  (uint8_t *)&v19,  0x16u);
    }
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsUpgradedForAVMode]( self,  "callUUIDsUpgradedForAVMode"));
    [v18 addObject:v17];

    -[CSDAbstractFaceTimeConversationProviderDelegate reportNewIncomingCallForConversation:fromHandle:callUUID:isReRing:]( self,  "reportNewIncomingCallForConversation:fromHandle:callUUID:isReRing:",  v10,  v9,  v17,  0LL);
  }
}

- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 isReRing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[CSDAbstractFaceTimeConversationProviderDelegate reportNewIncomingCallForConversation:fromHandle:callUUID:isReRing:]( self,  "reportNewIncomingCallForConversation:fromHandle:callUUID:isReRing:",  v9,  v8,  v10,  v5);
}

- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 callUUID:(id)a5 isReRing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteMembers]);
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = sub_1001A390C;
  v94[3] = &unk_1003DC698;
  id v14 = v11;
  id v95 = v14;
  id v15 = v10;
  id v96 = v15;
  unsigned int v16 = objc_msgSend(v13, "tu_containsObjectPassingTest:", v94);

  if (v16)
  {
    id v17 = sub_1001704C4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue([v15 UUID]);
      *(_DWORD *)buf = 138412290;
      v101 = v19;
      int v20 = "Incoming call is from associated handle; will not report incoming call for conversation with UUID %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

      goto LABEL_44;
    }

    goto LABEL_44;
  }

  if (([v15 isEligibleForCall] & 1) == 0
    && ([v15 anyActiveParticipantHasAV] & 1) == 0)
  {
    id v33 = sub_1001704C4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue([v15 UUID]);
      *(_DWORD *)buf = 138412290;
      v101 = v19;
      int v20 = "Conversation is not call eligible; will not report incoming call for conversation with UUID %@";
      goto LABEL_16;
    }

    goto LABEL_44;
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 provider]);
  unsigned __int8 v22 = -[CSDAbstractFaceTimeConversationProviderDelegate shouldHandleProvider:]( self,  "shouldHandleProvider:",  v21);

  if ((v22 & 1) == 0)
  {
    id v29 = sub_1001704C4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138412546;
    v101 = self;
    __int16 v102 = 2112;
    id v103 = v15;
    __int128 v30 = "%@ should not handle conversation: %@";
    __int128 v31 = v18;
    uint32_t v32 = 22;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_44;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate networkSupport](self, "networkSupport"));
  unsigned __int8 v24 = [v23 validNetworkReachable];

  if ((v24 & 1) == 0)
  {
    id v34 = sub_1001704C4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    __int128 v30 = "Not reporting call since validNetworkReachable is false";
    __int128 v31 = v18;
    uint32_t v32 = 2;
    goto LABEL_19;
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate deviceSupport](self, "deviceSupport"));
  if (([v25 isGreenTea] & 1) == 0)
  {

LABEL_21:
    BOOL v75 = v6;
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
    v77 = v12;
    v78 = self;
    -[CSDAbstractFaceTimeConversationProviderDelegate associateCallUUID:withConversationUUID:waitingToJoin:]( self,  "associateCallUUID:withConversationUUID:waitingToJoin:",  v12,  v35,  1LL);

    id v36 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteMembers]);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v36 count]));

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    objc_super v37 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteMembers]);
    id v38 = [v37 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v91;
      do
      {
        for (i = 0LL; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v91 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v90 + 1) + 8 * (void)i) handle]);
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v42));
          -[os_log_s addObject:](v18, "addObject:", v43);
        }

        id v39 = [v37 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }

      while (v39);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue([v15 otherInvitedHandles]);
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v44 count]));

    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v87 = 0u;
    __int128 v86 = 0u;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v15 otherInvitedHandles]);
    id v47 = [v46 countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v87;
      do
      {
        for (j = 0LL; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v87 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[CXHandle handleWithTUHandle:]( &OBJC_CLASS___CXHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v86 + 1) + 8LL * (void)j)));
          [v45 addObject:v51];
        }

        id v48 = [v46 countByEnumeratingWithState:&v86 objects:v98 count:16];
      }

      while (v48);
    }

    v52 = -[CXCallUpdate initWithTUConversation:]( objc_alloc(&OBJC_CLASS___CXCallUpdate),  "initWithTUConversation:",  v15);
    -[CXCallUpdate setRemoteParticipantHandles:](v52, "setRemoteParticipantHandles:", v18);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v14));
    -[CXCallUpdate setRemoteHandle:](v52, "setRemoteHandle:", v53);

    -[CXCallUpdate setConversation:](v52, "setConversation:", 1LL);
    -[CXCallUpdate setIsReRing:](v52, "setIsReRing:", v75);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate localSenderIdentityUUID](v52, "localSenderIdentityUUID"));

    v55 = v78;
    if (!v54)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](v78, "conversationManager"));
      v57 = (void *)objc_claimAutoreleasedReturnValue([v15 localMember]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 handle]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v56 senderIdentityUUIDForCallerIDHandle:v58]);
      -[CXCallUpdate setLocalSenderIdentityUUID:](v52, "setLocalSenderIdentityUUID:", v59);
    }

    v60 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate featureFlags]( v78,  "featureFlags"));
    if (-[CSDAbstractFaceTimeConversationProviderDelegate avLessSharePlayEnabled]( v60,  "avLessSharePlayEnabled")
      && ![v15 avMode])
    {
      unsigned __int8 v64 = -[CXCallUpdate hasVideo](v52, "hasVideo");

      if ((v64 & 1) != 0)
      {
LABEL_40:
        if (-[CXCallUpdate hasVideo](v52, "hasVideo"))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate remoteParticipantHandles](v52, "remoteParticipantHandles"));
          id v62 = [v61 count];

          if ((unint64_t)v62 >= 2) {
            -[CXCallUpdate setSendingVideo:]( v52,  "setSendingVideo:",  [v15 resolvedAudioVideoMode] == (id)2);
          }
        }

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](v55, "provider"));
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472LL;
        v79[2] = sub_1001A39CC;
        v79[3] = &unk_1003D7D50;
        v79[4] = v55;
        id v80 = v15;
        id v12 = v77;
        id v81 = v77;
        [v63 reportNewIncomingCallWithUUID:v81 update:v52 completion:v79];

        goto LABEL_44;
      }

      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      v65 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue([v15 activeRemoteParticipants]);
      id v66 = -[CSDAbstractFaceTimeConversationProviderDelegate countByEnumeratingWithState:objects:count:]( v65,  "countByEnumeratingWithState:objects:count:",  &v82,  v97,  16LL);
      if (v66)
      {
        id v67 = v66;
        v74 = v52;
        uint64_t v76 = *(void *)v83;
LABEL_48:
        uint64_t v68 = 0LL;
        while (1)
        {
          if (*(void *)v83 != v76) {
            objc_enumerationMutation(v65);
          }
          v69 = *(void **)(*((void *)&v82 + 1) + 8 * v68);
          v70 = (void *)objc_claimAutoreleasedReturnValue([v69 handle]);
          unsigned __int8 v71 = [v70 isEquivalentToHandle:v14];

          if ((v71 & 1) != 0) {
            break;
          }
          if (v67 == (id)++v68)
          {
            id v67 = -[CSDAbstractFaceTimeConversationProviderDelegate countByEnumeratingWithState:objects:count:]( v65,  "countByEnumeratingWithState:objects:count:",  &v82,  v97,  16LL);
            if (v67) {
              goto LABEL_48;
            }
            v60 = v65;
            v55 = v78;
            v52 = v74;
            goto LABEL_39;
          }
        }

        v60 = v69;

        v55 = v78;
        v52 = v74;
        if (!v60) {
          goto LABEL_40;
        }
        id v72 = sub_1001704C4();
        v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Incoming invite is from an participant %@, upgrading CXCallUpdate",  buf,  0xCu);
        }

        -[CXCallUpdate updatePropertiesForVideo:]( v74,  "updatePropertiesForVideo:",  -[CSDAbstractFaceTimeConversationProviderDelegate audioVideoMode](v60, "audioVideoMode") == (id)2);
      }

      else
      {
        v60 = v65;
      }
    }

- (void)fullfillPendingJoinActionsForCallUUIDIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
  id v8 = objc_msgSend( v6,  "pendingCallActionsOfClass:withCallUUID:",  objc_opt_class(CXJoinCallAction, v7),  v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
  unsigned int v11 = [v10 providerDelegate:self isExclusivelyManagingCallWithUUID:v4];

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    id v14 = objc_msgSend( v12,  "pendingCallActionsOfClass:withCallUUID:",  objc_opt_class(CXStartCallAction, v13),  v4);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if ([v15 count])
    {
      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint32_t v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Also going to fulfill start call actions: %@ since we are exclusively managing this call",  buf,  0xCu);
      }
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v15]);

    id v9 = (void *)v18;
  }

  if ([v9 count])
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v23), "fulfill", (void)v26);
          uint64_t v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v21);
    }
  }

  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID",  (void)v26));
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v4]);

  if (v25) {
    -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  0LL,  v25);
  }
}

- (void)displayGreenTeaAlertForAppleTV
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = TUBundle(v2, v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"GREEN_TEA_APPLE_TV_FAIL_TITLE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  [v2 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  uint64_t v9 = TUBundle(v7, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"GREEN_TEA_APPLE_TV_FAIL_BODY" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  [v2 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  uint64_t v14 = TUBundle(v12, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"OK" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  [v2 setObject:v16 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  SInt32 error = 0;
  CFUserNotificationCreate(0LL, 0.0, 0LL, &error, (CFDictionaryRef)v2);
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  if (v7
    && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager")),  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationsByUUID]),  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7)),  v10,  v9,  v8,  v10))
  {
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = -[CSDAbstractFaceTimeConversationProviderDelegate isManagingPendingConversationForCallWithUUID:]( self,  "isManagingPendingConversationForCallWithUUID:",  v4);
  }

  return v11;
}

- (BOOL)isManagingPendingConversationForCallWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager",  0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationsByUUID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
        unsigned __int8 v16 = [v15 isEqual:v4];

        if ((v16 & 1) != 0)
        {
          BOOL v17 = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (id)pendingConversationUUIDForCallWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationsByUUID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
        unsigned int v16 = [v15 isEqual:v4];

        if (v16)
        {
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
          goto LABEL_11;
        }

        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 0LL;
LABEL_11:

  return v17;
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 conversationsByUUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

    if (v9) {
      BOOL v10 = ((unint64_t)[v9 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  return 0LL;
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "endCallWithUUIDAsAnsweredElsewhere: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( self,  "leaveConversationForCallUUID:endedReason:",  v4,  4LL);
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "endCallWithUUIDAsDeclinedElsewhere: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( self,  "leaveConversationForCallUUID:endedReason:",  v4,  5LL);
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "endCallWithUUIDAsLocalHangup: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( self,  "leaveConversationForCallUUID:endedReason:",  v4,  -1LL);
}

- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (v10)
  {
    id v11 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002BB09C((uint64_t)v6, (uint64_t)v10, v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    [v13 reportCallWithUUID:v10 failedAtDate:0 withContext:v7];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v33 = v7;
    [v14 providerDelegate:self callWithUUID:v10 endedAtDate:v15 withReason:1 failureContext:v7];

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    [v16 leaveConversationWithUUID:v6];

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsUpgradedForAVMode]( self,  "callUUIDsUpgradedForAVMode"));
    [v17 removeObject:v10];

    -[CSDAbstractFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  0LL,  v6);
    -[CSDAbstractFaceTimeConversationProviderDelegate setConversationUUID:forCallUUID:]( self,  "setConversationUUID:forCallUUID:",  0LL,  v10);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
    id v34 = v6;
    [v18 removeObject:v6];

    -[CSDAbstractFaceTimeConversationProviderDelegate updateNetworkCriticalStateIfNecessary]( self,  "updateNetworkCriticalStateIfNecessary");
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pendingTransactions]);

    id obj = v20;
    id v37 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v43 != v36) {
            objc_enumerationMutation(obj);
          }
          __int128 v22 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 actions]);
          id v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v24)
          {
            id v26 = v24;
            uint64_t v27 = *(void *)v39;
            do
            {
              for (j = 0LL; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v39 != v27) {
                  objc_enumerationMutation(v23);
                }
                __int128 v29 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
                uint64_t v30 = objc_opt_class(&OBJC_CLASS___CXCallAction, v25);
                if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
                {
                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v29 callUUID]);
                  unsigned int v32 = [v31 isEqual:v10];

                  if (v32) {
                    [v29 fail];
                  }
                }
              }

              id v26 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }

            while (v26);
          }
        }

        id v37 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }

      while (v37);
    }

    -[CSDAbstractFaceTimeConversationProviderDelegate endCallWithUUIDAsLocalHangup:]( self,  "endCallWithUUIDAsLocalHangup:",  v10);
    id v6 = v34;
    id v7 = v33;
  }
}

- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v8 = [v7 copy];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
        unsigned int v16 = [v15 isEqual:v5];

        if (v16)
        {
          id v17 = sub_1001704C4();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found an extra conversation that needs to be cleaned up: %@",  buf,  0xCu);
          }

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 conversationsByUUID]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v14]);

          if (v21
            && (__int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 provider]),
                unsigned int v23 = -[CSDAbstractFaceTimeConversationProviderDelegate shouldHandleProvider:]( self,  "shouldHandleProvider:",  v22),  v22,  v23))
          {
            if ([v21 avMode])
            {
              -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( self,  "leaveConversation:withCallUUID:reason:",  v21,  v5,  a4);
LABEL_17:

              goto LABEL_18;
            }

            id v29 = sub_1001704C4();
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v37 = v21;
              id v26 = v25;
              uint64_t v27 = "Not leaving avless conversation on call ending %@";
              uint32_t v28 = 12;
LABEL_15:
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
            }
          }

          else
          {
            id v24 = sub_1001704C4();
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v14;
              __int16 v38 = 2112;
              id v39 = v5;
              id v26 = v25;
              uint64_t v27 = "[WARN] Asked to clean up conversation from our list but could not find it in conversation manager li"
                    "st: %@ callUUID: %@";
              uint32_t v28 = 22;
              goto LABEL_15;
            }
          }

          goto LABEL_17;
        }

- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 provider]);
  unsigned __int8 v11 = -[CSDAbstractFaceTimeConversationProviderDelegate shouldHandleProvider:]( self,  "shouldHandleProvider:",  v10);

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    if ([v12 avLessSharePlayEnabled] && !objc_msgSend(v8, "avMode"))
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsUpgradedForAVMode]( self,  "callUUIDsUpgradedForAVMode"));
      unsigned int v21 = [v20 containsObject:v9];

      if (v21)
      {
        id v22 = sub_1001704C4();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
        int v23 = 138412546;
        id v24 = v9;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Not leaving conversation but stopped tracking callUUID: %@ for conversationUUID: %@",  (uint8_t *)&v23,  0x16u);
LABEL_6:

LABEL_7:
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsUpgradedForAVMode]( self,  "callUUIDsUpgradedForAVMode"));
        [v16 removeObject:v9];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
        -[CSDAbstractFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  0LL,  v17);

        -[CSDAbstractFaceTimeConversationProviderDelegate setConversationUUID:forCallUUID:]( self,  "setConversationUUID:forCallUUID:",  0LL,  v9);
        -[CSDAbstractFaceTimeConversationProviderDelegate updateNetworkCriticalStateIfNecessary]( self,  "updateNetworkCriticalStateIfNecessary");
        goto LABEL_11;
      }
    }

    else
    {
    }

    uint64_t v13 = -[CSDConversationLeaveContext initWithLeaveReason:]( objc_alloc(&OBJC_CLASS___CSDConversationLeaveContext),  "initWithLeaveReason:",  a5 == 102);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    [v14 leaveConversationWithUUID:v15 withContext:v13];

    goto LABEL_6;
  }

  id v18 = sub_1001704C4();
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ should not handle conversation: %@",  (uint8_t *)&v23,  0x16u);
  }

LABEL_11:
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (deviceSupport) {
    return deviceSupport;
  }
  else {
    return (FTDeviceSupport *)(id)objc_claimAutoreleasedReturnValue( +[FTDeviceSupport sharedInstance]( &OBJC_CLASS___FTDeviceSupport,  "sharedInstance"));
  }
}

- (void)proceedToJoinForConversation:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  unsigned __int8 v9 = -[CSDAbstractFaceTimeConversationProviderDelegate shouldHandleProvider:]( self,  "shouldHandleProvider:",  v8);

  if ((v9 & 1) != 0)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localMember]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);

    if (!v12)
    {
      -[CSDAbstractFaceTimeConversationProviderDelegate fail](v7, "fail");
      goto LABEL_62;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    if ([v13 avLessSharePlayEnabled])
    {
      id v14 = -[CSDAbstractFaceTimeConversationProviderDelegate avMode](v7, "avMode");

      if (!v14) {
        goto LABEL_16;
      }
    }

    else
    {
      unsigned int v16 = [v6 isEligibleForCall];

      if (!v16) {
        goto LABEL_16;
      }
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate callUUID](v7, "callUUID"));
    id v18 = -[CXCallUpdate initWithTUConversation:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithTUConversation:", v6);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate localSenderIdentityUUID](v18, "localSenderIdentityUUID"));

    if (!v19)
    {
      __int128 v20 = v10;
      if ([v6 isLocallyCreated])
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 initiator]);
      }

      else
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 localMember]);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v22 handle]);
      }

      int v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 senderIdentityUUIDForCallerIDHandle:v21]);
      -[CXCallUpdate setLocalSenderIdentityUUID:](v18, "setLocalSenderIdentityUUID:", v24);

      id v10 = v20;
    }

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate callUUID](v7, "callUUID"));
    [v25 reportCallWithUUID:v26 updated:v18];

    -[CSDAbstractFaceTimeConversationProviderDelegate associateCallUUID:withConversationUUID:waitingToJoin:]( self,  "associateCallUUID:withConversationUUID:waitingToJoin:",  v17,  v10,  1LL);
LABEL_16:
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___CSDConversationJoinContext);
    -[CSDConversationJoinContext setShouldSuppressInCallUI:]( v27,  "setShouldSuppressInCallUI:",  -[CSDAbstractFaceTimeConversationProviderDelegate shouldSuppressInCallUI](v7, "shouldSuppressInCallUI"));
    -[CSDConversationJoinContext setWantsStagingArea:]( v27,  "setWantsStagingArea:",  -[CSDAbstractFaceTimeConversationProviderDelegate wantsStagingArea](v7, "wantsStagingArea"));
    if (-[CSDAbstractFaceTimeConversationProviderDelegate isVideoEnabled](v7, "isVideoEnabled"))
    {
      uint32_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
      if ([v28 groupFacetimeAsAServiceEnabled])
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
        -[CSDConversationJoinContext setVideoEnabled:](v27, "setVideoEnabled:", [v29 supportsVideo]);
      }

      else
      {
        -[CSDConversationJoinContext setVideoEnabled:](v27, "setVideoEnabled:", 1LL);
      }
    }

    else
    {
      -[CSDConversationJoinContext setVideoEnabled:](v27, "setVideoEnabled:", 0LL);
    }

    -[CSDConversationJoinContext setVideo:]( v27,  "setVideo:",  -[CSDAbstractFaceTimeConversationProviderDelegate isVideo](v7, "isVideo"));
    -[CSDConversationJoinContext setUpgrade:]( v27,  "setUpgrade:",  -[CSDAbstractFaceTimeConversationProviderDelegate isUpgrade](v7, "isUpgrade"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate upgradeSessionUUID](v7, "upgradeSessionUUID"));
    -[CSDConversationJoinContext setUpgradeSessionUUID:](v27, "setUpgradeSessionUUID:", v30);

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
    -[CSDConversationJoinContext setProvider:](v27, "setProvider:", v31);

    -[CSDConversationJoinContext setAvMode:]( v27,  "setAvMode:",  (int)-[CSDAbstractFaceTimeConversationProviderDelegate avMode](v7, "avMode"));
    -[CSDConversationJoinContext setPresentationMode:]( v27,  "setPresentationMode:",  -[CSDAbstractFaceTimeConversationProviderDelegate presentationMode](v7, "presentationMode"));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate joinCallActivity](v7, "joinCallActivity"));
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 tuActivity]);
    -[CSDConversationJoinContext setActivity:](v27, "setActivity:", v33);

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    LODWORD(v33) = [v34 callScreeningEnabled];

    if ((_DWORD)v33) {
      -[CSDConversationJoinContext setScreening:]( v27,  "setScreening:",  -[CSDAbstractFaceTimeConversationProviderDelegate isScreening](v7, "isScreening"));
    }
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    if ([v35 conversationHandoffEnabled])
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate associationIdentifier]( v7,  "associationIdentifier"));

      if (!v36) {
        goto LABEL_28;
      }
      id v37 = objc_alloc_init(&OBJC_CLASS___TUConversationParticipantAssociation);
      -[CSDConversationJoinContext setParticipantAssociation:](v27, "setParticipantAssociation:", v37);

      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate associationIdentifier]( v7,  "associationIdentifier"));
      id v39 = [v38 unsignedLongLongValue];
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext participantAssociation](v27, "participantAssociation"));
      [v40 setIdentifier:v39];

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate associationAVCIdentifier]( v7,  "associationAVCIdentifier"));
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationJoinContext participantAssociation](v27, "participantAssociation"));
      [v41 setAvcIdentifier:v35];
    }

LABEL_28:
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    unsigned int v43 = [v42 usesModernScreenSharingFromMessages];

    if (v43)
    {
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate tuScreenSharingRequest]( v7,  "tuScreenSharingRequest"));
      -[CSDConversationJoinContext setScreenSharingRequest:](v27, "setScreenSharingRequest:", v44);
    }

    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate notificationStylesByHandleType]( v7,  "notificationStylesByHandleType"));
    id v46 = [v45 count];

    if (v46)
    {
      __int128 v90 = v27;
      __int128 v91 = v10;
      __int128 v92 = self;
      id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      id v48 = v7;
      id obj = (id)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate notificationStylesByHandleType]( v7,  "notificationStylesByHandleType"));
      id v49 = [obj countByEnumeratingWithState:&v94 objects:v98 count:16];
      if (v49)
      {
        id v50 = v49;
        uint64_t v51 = *(void *)v95;
        do
        {
          for (i = 0LL; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v95 != v51) {
              objc_enumerationMutation(obj);
            }
            v53 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)i);
            v54 = objc_alloc(&OBJC_CLASS___TUConversationInvitationPreference);
            id v55 = [v53 integerValue];
            v56 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate notificationStylesByHandleType]( v48,  "notificationStylesByHandleType"));
            v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:v53]);
            v58 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]( v54,  "initWithHandleType:notificationStyles:",  v55,  [v57 integerValue]);

            [v47 addObject:v58];
          }

          id v50 = [obj countByEnumeratingWithState:&v94 objects:v98 count:16];
        }

        while (v50);
      }

      id v59 = [v47 copy];
      uint64_t v27 = v90;
      -[CSDConversationJoinContext setInvitationPreferences:](v90, "setInvitationPreferences:", v59);

      id v60 = sub_1001704C4();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue( -[CSDConversationJoinContext invitationPreferences]( v90,  "invitationPreferences"));
        *(_DWORD *)buf = 138412290;
        v100 = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Invitation preferences were set on the action, using those for the join context: %@",  buf,  0xCu);
      }

      self = v92;
      id v7 = v48;
      id v10 = v91;
    }

    else
    {
      __int128 v85 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationPreferences]);

      if (!v85) {
        goto LABEL_42;
      }
      __int128 v86 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationPreferences]);
      id v87 = [v86 copy];
      -[CSDConversationJoinContext setInvitationPreferences:](v27, "setInvitationPreferences:", v87);

      id v88 = sub_1001704C4();
      id v47 = (void *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v89 = (CSDAbstractFaceTimeConversationProviderDelegate *)objc_claimAutoreleasedReturnValue( -[CSDConversationJoinContext invitationPreferences]( v27,  "invitationPreferences"));
        *(_DWORD *)buf = 138412290;
        v100 = v89;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v47,  OS_LOG_TYPE_DEFAULT,  "Invitation preferences weren't set on the action but existed on the conversation, using those for the join context: %@",  buf,  0xCu);
      }
    }

LABEL_42:
    v63 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate collaborationIdentifier]( v7,  "collaborationIdentifier"));

    if (v63)
    {
      unsigned __int8 v64 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate collaborationIdentifier]( v7,  "collaborationIdentifier"));
      -[CSDConversationJoinContext setCollaborationIdentifier:](v27, "setCollaborationIdentifier:", v64);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsUpgradedForAVMode]( self,  "callUUIDsUpgradedForAVMode"));
    id v66 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate callUUID](v7, "callUUID"));
    unsigned __int8 v67 = [v65 containsObject:v66];

    if (+[AVAudioClient hasActiveAudioSession](&OBJC_CLASS___AVAudioClient, "hasActiveAudioSession")
      || (v67 & 1) == 0)
    {
      -[CSDAbstractFaceTimeConversationProviderDelegate setAudioSessionActive:](self, "setAudioSessionActive:", 1LL);
    }

    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    unsigned int v69 = [v68 lagunaEnabled];

    if (v69) {
      -[CSDAbstractFaceTimeConversationProviderDelegate setAudioSessionActive:](self, "setAudioSessionActive:", 1LL);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    unsigned __int8 v71 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate messagesGroupName](v7, "messagesGroupName"));
    [v70 setMessagesGroupName:v71 onConversationWithUUID:v10];

    id v72 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    [v72 joinExistingConversationWithUUID:v73 context:v27];

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_msgSend( v74,  "setRelaying:forConversationWithUUID:",  -[CSDAbstractFaceTimeConversationProviderDelegate isRelay](v7, "isRelay"),  v10);

    BOOL v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    LODWORD(v73) = TUCallScreeningEnabled(v75, 0LL);

    if ((_DWORD)v73)
    {
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      objc_msgSend( v76,  "setScreening:forConversationWithUUID:",  -[CSDAbstractFaceTimeConversationProviderDelegate isScreening](v7, "isScreening"),  v10);
    }

    if (-[CSDAbstractFaceTimeConversationProviderDelegate isUplinkMuted](v7, "isUplinkMuted"))
    {
      id v77 = sub_1001704C4();
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v100 = v7;
        __int16 v101 = 2112;
        id v102 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Setting uplinkMuted for action: %@ conversation: %@",  buf,  0x16u);
      }

      v79 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v80 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
      [v79 setUplinkMuted:1 forConversationWithUUID:v80];
    }

    id v81 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    unsigned __int8 v82 = [v81 isConversationWithUUIDRedirectingAudio:v10];

    if ((v82 & 1) == 0) {
      -[CSDAbstractFaceTimeConversationProviderDelegate enqueueConversationWaitingForAudioWithConversationUUID:]( self,  "enqueueConversationWaitingForAudioWithConversationUUID:",  v10);
    }
    __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    unsigned int v84 = [v83 isConversationWithUUIDRelaying:v10];

    if (v84) {
      -[CSDAbstractFaceTimeConversationProviderDelegate enqueueOrStartAudioForConversationUUID:]( self,  "enqueueOrStartAudioForConversationUUID:",  v10);
    }

    goto LABEL_62;
  }

  id v15 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v100 = self;
    __int16 v101 = 2112;
    id v102 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ should not handle conversation: %@",  buf,  0x16u);
  }

- (void)conversationManager:(id)a3 conversation:(id)a4 removedActiveParticipant:(id)a5 withReason:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  objc_initWeak(&location, self);
  __int16 v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  uint64_t v27 = sub_1001A5DC4;
  uint32_t v28 = &unk_1003DC6C0;
  objc_copyWeak(&v33, &location);
  id v14 = v11;
  id v29 = v14;
  id v15 = v12;
  id v30 = v15;
  id v16 = v10;
  id v31 = v16;
  __int128 v32 = self;
  id v17 = objc_retainBlock(&v25);
  if (a6 == 1)
  {
    id v18 = sub_1001704C4();
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Delaying check on whether to end call since participant %@ left conversation due to handoff",  buf,  0xCu);
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate serverBag]( self,  "serverBag",  v25,  v26,  v27,  v28,  v29,  v30));
    dispatch_time_t v21 = dispatch_time(0, 1000000000 * (void)[v20 handoffUPlusOneLeaveTimeout]);
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
    dispatch_after(v21, v22, v17);
  }

  else
  {
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Not delaying check on whether to end call on participant leave",  buf,  2u);
    }

    if (a6 == 2) {
      -[CSDAbstractFaceTimeConversationProviderDelegate displayGreenTeaAlertForAppleTV]( self,  "displayGreenTeaAlertForAppleTV",  v25,  v26,  v27,  v28,  v29,  v30);
    }
    ((void (*)(void ***))v17[2])(v17);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (BOOL)shouldAutomaticallyLeaveConversation:(id)a3
{
  id v4 = a3;
  if (-[CSDAbstractFaceTimeConversationProviderDelegate isConversationJoiningOrJoined:]( self,  "isConversationJoiningOrJoined:",  v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 activeRemoteParticipants]);
    if ([v5 count] == (id)1 && !objc_msgSend(v6, "count")) {
      goto LABEL_9;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    if ([v7 conversationOneToOneModeEnabled])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate serverBag](self, "serverBag"));
      unsigned int v9 = [v8 isFaceTimeMyselfEnabled];

      if (v9
        && ![v5 count]
        && ![v6 count]
        && ([v4 isOneToOneModeEnabled] & 1) != 0)
      {
LABEL_9:
        BOOL v10 = 1;
LABEL_22:

        goto LABEL_23;
      }
    }

    else
    {
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    unsigned int v12 = [v11 lagunaEnabled];

    if (!v12)
    {
      BOOL v10 = 0;
      goto LABEL_22;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_filter:", &stru_1003DC700));
    id v14 = [v13 count];
    if ([v13 count] != (id)2 && v14 != (id)1) {
      goto LABEL_19;
    }
    id v15 = [v6 count];
    if (!v15)
    {
      BOOL v10 = 1;
      goto LABEL_21;
    }

    if (v15 == (id)1)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
      BOOL v10 = -[CSDAbstractFaceTimeConversationProviderDelegate isLocalMemberOf:associatedTo:]( self,  "isLocalMemberOf:associatedTo:",  v4,  v16);
    }

    else
    {
LABEL_19:
      BOOL v10 = 0;
    }

- (BOOL)isConversationJoiningOrJoined:(id)a3
{
  return ((unint64_t)[a3 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isLocalMemberOf:(id)a3 associatedTo:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 handle]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localMember]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 association]);

    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
      unsigned __int8 v10 = [v9 isEquivalentToHandle:v6];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "providerDidBegin: %@", (uint8_t *)&v10, 0xCu);
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate setProvider:](self, "setProvider:", v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate providerDidBegin](self, "providerDidBegin"));

  if (v8)
  {
    unsigned int v9 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate providerDidBegin]( self,  "providerDidBegin"));
    v9[2]();
  }
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "providerDidReset: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  [v8 leaveAllConversations];
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue", a3, a4));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "providerDidDeactivateAudioSession", v8, 2u);
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate setAudioSessionActive:](self, "setAudioSessionActive:", 0LL);
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  id v16 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CXJoinCallAction, v5);
  if ((objc_opt_isKindOfClass(v16, v6) & 1) != 0
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v7), (objc_opt_isKindOfClass(v16, v8) & 1) != 0)
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___CXEndCallAction, v9), (objc_opt_isKindOfClass(v16, v10) & 1) != 0))
  {
    id v11 = v16;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 callUUID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

    if (v14)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      -[CXCallFailureContext setFailureReason:](v15, "setFailureReason:", 0LL);
      -[CXCallFailureContext setProviderEndedReason:](v15, "setProviderEndedReason:", 503LL);
      -[CSDAbstractFaceTimeConversationProviderDelegate cleanUpConversationIfNecessaryForConversationUUID:failureContext:]( self,  "cleanUpConversationIfNecessaryForConversationUUID:failureContext:",  v14,  v15);
    }
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Performing end call action %@",  (uint8_t *)&v22,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14
    || (id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate _findPendingConversationWithCallUUID:]( self,  "_findPendingConversationWithCallUUID:",  v9))) != 0LL)
  {
    if ([v14 avMode])
    {
      -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( self,  "leaveConversation:withCallUUID:reason:",  v14,  v9,  -1LL);
      -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( self,  "leaveConversationForCallUUID:endedReason:",  v9,  -1LL);
    }

    else
    {
      id v15 = sub_1001704C4();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received an end call action for avLess conversation, not leaving the conversation but call will end",  (uint8_t *)&v22,  2u);
      }
    }

    [v5 fulfill];
  }

  else
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 conversationsByUUID]);
      int v22 = 138412802;
      id v23 = v9;
      __int16 v24 = 2112;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for end call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.c onversationManager.conversationsByUUID: %@",  (uint8_t *)&v22,  0x20u);
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_msgSend(v15, "setUplinkMuted:forConversationWithUUID:", objc_msgSend(v5, "isMuted"), v11);
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
    unsigned int v17 = -[CSDAbstractFaceTimeConversationProviderDelegate isManagingPendingConversationForCallWithUUID:]( self,  "isManagingPendingConversationForCallWithUUID:",  v16);

    if (!v17)
    {
      [v5 fail];
      goto LABEL_8;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v19 = [v5 isMuted];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
    dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate pendingConversationUUIDForCallWithUUID:]( self,  "pendingConversationUUIDForCallWithUUID:",  v20));
    [v18 setUplinkMuted:v19 forPendingConversationWithUUID:v21];
  }

  [v5 fulfill];
LABEL_8:
}

- (NSMutableSet)callUUIDsUpgradedForAVMode
{
  return self->_callUUIDsUpgradedForAVMode;
}

- (FTNetworkSupport)networkSupport
{
  return self->_networkSupport;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  return (CSDFaceTimeProviderDelegateManagerDelegate *)objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setDeviceSupport:(id)a3
{
}

- (CSDConversationInvitationResolving)invitationResolver
{
  return self->_invitationResolver;
}

- (void)setInvitationResolver:(id)a3
{
}

- (NSMutableSet)conversationUUIDsAwaitingActiveAudioSession
{
  return self->_conversationUUIDsAwaitingActiveAudioSession;
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionActive;
}

- (void)setAudioSessionActive:(BOOL)a3
{
  self->_audioSessionActive = a3;
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end