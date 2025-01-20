@interface CSDFaceTimeIMAVProviderDelegate
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (CSDFaceTimeIMAVProviderDelegate)initWithQueue:(id)a3;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (CXProvider)provider;
- (NSMutableOrderedSet)cachedChats;
- (OS_dispatch_queue)queue;
- (id)chatWithUUID:(id)a3;
- (id)failureContextForChat:(id)a3;
- (id)imAccountForActionBlock;
- (id)providerDidBegin;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (unsigned)IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)_endChatWithUUID:(id)a3 withEndedReason:(unsigned int)a4;
- (void)_requestPendingInvites;
- (void)_setUpListeners;
- (void)_updateProviderForConnectedChat:(id)a3;
- (void)_updateProviderForConnectingChat:(id)a3;
- (void)_updateProviderForEndedChat:(id)a3;
- (void)daemonConnected:(id)a3;
- (void)dealloc;
- (void)endCallWithUUID:(id)a3;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)handleChatCallInfoChangedNotification:(id)a3;
- (void)handleChatConferenceIDChangedNotification:(id)a3;
- (void)handleChatConferenceMetadataUpdated:(id)a3;
- (void)handleChatFirstRemoteFrameArrived:(id)a3;
- (void)handleChatInFrequencyChangedNotification:(id)a3;
- (void)handleChatInvitationSent:(id)a3;
- (void)handleChatMayRequireBreakBeforeMakeChanged:(id)a3;
- (void)handleChatOutFrequencyChangedNotification:(id)a3;
- (void)handleChatStateChanged:(id)a3;
- (void)inviteIMAVPeersWithAction:(id)a3 tokensToExclude:(id)a4 joinCallActionToFulfill:(id)a5;
- (void)invitedToIMAVChat:(id)a3;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)registerChat:(id)a3;
- (void)setCachedChats:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setImAccountForActionBlock:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
@end

@implementation CSDFaceTimeIMAVProviderDelegate

- (CSDFaceTimeIMAVProviderDelegate)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIMAVProviderDelegate;
  v6 = -[CSDFaceTimeIMAVProviderDelegate init](&v11, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    cachedChats = v6->_cachedChats;
    v6->_cachedChats = (NSMutableOrderedSet *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    id imAccountForActionBlock = v6->_imAccountForActionBlock;
    v6->_id imAccountForActionBlock = &stru_1003D7AB8;
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIMAVProviderDelegate;
  -[CSDFaceTimeIMAVProviderDelegate dealloc](&v4, "dealloc");
}

- (void)_setUpListeners
{
  if ((+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeAudioCalls") & 1) != 0 || +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeVideoCalls"))
  {
    if (qword_10044CE60
      || ((v3 = (void **)CUTWeakLinkSymbol("IMDaemonDidConnectNotification", @"IMAVCore")) == 0LL
        ? (objc_super v4 = 0LL)
        : (objc_super v4 = *v3),
          objc_storeStrong((id *)&qword_10044CE60, v4),
          qword_10044CE60))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v5 addObserver:self selector:"daemonConnected:" name:qword_10044CE60 object:0];
    }

    else
    {
      id v8 = sub_1001704C4();
      id v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMDaemonDidConnectNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE68
      || ((v6 = (void **)CUTWeakLinkSymbol("IMAVChatStateChangedNotification", @"IMAVCore")) == 0LL
        ? (uint64_t v7 = 0LL)
        : (uint64_t v7 = *v6),
          objc_storeStrong((id *)&qword_10044CE68, v7),
          qword_10044CE68))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 addObserver:self selector:"handleChatStateChanged:" name:qword_10044CE68 object:0];
    }

    else
    {
      id v12 = sub_1001704C4();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatStateChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE70
      || ((v10 = (void **)CUTWeakLinkSymbol("IMAVChatParticipantReceivedFirstFrameNotification", @"IMAVCore")) == 0LL
        ? (objc_super v11 = 0LL)
        : (objc_super v11 = *v10),
          objc_storeStrong((id *)&qword_10044CE70, v11),
          qword_10044CE70))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v13 addObserver:self selector:"handleChatFirstRemoteFrameArrived:" name:qword_10044CE70 object:0];
    }

    else
    {
      id v16 = sub_1001704C4();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatParticipantReceivedFirstFrameNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE78
      || ((v14 = (void **)CUTWeakLinkSymbol("IMAVChatParticipantInvitationDeliveredNotification", @"IMAVCore")) == 0LL
        ? (v15 = 0LL)
        : (v15 = *v14),
          objc_storeStrong((id *)&qword_10044CE78, v15),
          qword_10044CE78))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v17 addObserver:self selector:"handleChatInvitationSent:" name:qword_10044CE78 object:0];
    }

    else
    {
      id v20 = sub_1001704C4();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatParticipantInvitationDeliveredNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE80
      || ((v18 = (void **)CUTWeakLinkSymbol("IMAVChatParticipantCallInfoChangedNotification", @"IMAVCore")) == 0LL
        ? (v19 = 0LL)
        : (v19 = *v18),
          objc_storeStrong((id *)&qword_10044CE80, v19),
          qword_10044CE80))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v21 addObserver:self selector:"handleChatCallInfoChangedNotification:" name:qword_10044CE80 object:0];
    }

    else
    {
      id v24 = sub_1001704C4();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatParticipantCallInfoChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE88
      || ((v22 = (void **)CUTWeakLinkSymbol("IMAVChatConferenceIDChangedNotification", @"IMAVCore")) == 0LL
        ? (v23 = 0LL)
        : (v23 = *v22),
          objc_storeStrong((id *)&qword_10044CE88, v23),
          qword_10044CE88))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v25 addObserver:self selector:"handleChatConferenceIDChangedNotification:" name:qword_10044CE88 object:0];
    }

    else
    {
      id v28 = sub_1001704C4();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatConferenceIDChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE90
      || ((v26 = (void **)CUTWeakLinkSymbol("IMAVChatConferenceMetadataUpdatedNotification", @"IMAVCore")) == 0LL
        ? (v27 = 0LL)
        : (v27 = *v26),
          objc_storeStrong((id *)&qword_10044CE90, v27),
          qword_10044CE90))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v29 addObserver:self selector:"handleChatConferenceMetadataUpdated:" name:qword_10044CE90 object:0];
    }

    else
    {
      id v32 = sub_1001704C4();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatConferenceMetadataUpdatedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CE98
      || ((v30 = (void **)CUTWeakLinkSymbol("IMAVChatMayRequireBreakBeforeMakeChangedNotification", @"IMAVCore")) == 0LL
        ? (v31 = 0LL)
        : (v31 = *v30),
          objc_storeStrong((id *)&qword_10044CE98, v31),
          qword_10044CE98))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v33 addObserver:self selector:"handleChatMayRequireBreakBeforeMakeChanged:" name:qword_10044CE98 object:0];
    }

    else
    {
      id v36 = sub_1001704C4();
      v33 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatMayRequireBreakBeforeMakeChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CEA0
      || ((v34 = (void **)CUTWeakLinkSymbol("IMAVChatParticipantInFrequencyChangedNotification", @"IMAVCore")) == 0LL
        ? (v35 = 0LL)
        : (v35 = *v34),
          objc_storeStrong((id *)&qword_10044CEA0, v35),
          qword_10044CEA0))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v37 addObserver:self selector:"handleChatInFrequencyChangedNotification:" name:qword_10044CEA0 object:0];
    }

    else
    {
      id v40 = sub_1001704C4();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatParticipantInFrequencyChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    if (qword_10044CEA8
      || ((v38 = (void **)CUTWeakLinkSymbol("IMAVChatParticipantOutFrequencyChangedNotification", @"IMAVCore")) == 0LL
        ? (v39 = 0LL)
        : (v39 = *v38),
          objc_storeStrong((id *)&qword_10044CEA8, v39),
          qword_10044CEA8))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v41 addObserver:self selector:"handleChatOutFrequencyChangedNotification:" name:qword_10044CEA8 object:0];
    }

    else
    {
      id v48 = sub_1001704C4();
      v41 = (void *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 138412290;
        v50 = @"IMAVChatParticipantOutFrequencyChangedNotification";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v41,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.",  (uint8_t *)&v49,  0xCu);
      }
    }

    v42 = (void *)CUTWeakLinkClass(@"IMAVController", @"IMAVCore");
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 sharedInstance]);
    [v43 addDelegate:self queue:&_dispatch_main_q];

    v44 = (void *)objc_claimAutoreleasedReturnValue([v42 sharedInstance]);
    [v44 setIMAVCapabilities:25 toCaps:25];

    v45 = (void *)objc_claimAutoreleasedReturnValue([v42 sharedInstance]);
    [v45 setupIMAVController];

    v46 = (void *)objc_claimAutoreleasedReturnValue([v42 sharedInstance]);
    [v46 setBlockIncomingInvitationsDuringCall:0];

    v47 = (void *)objc_claimAutoreleasedReturnValue([v42 sharedInstance]);
    [v47 setBlockMultipleIncomingInvitations:1];

    -[CSDFaceTimeIMAVProviderDelegate _requestPendingInvites](self, "_requestPendingInvites");
  }

- (void)_requestPendingInvites
{
  v2 = (void *)CUTWeakLinkClass(@"IMAVController", @"IMAVCore");
  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeAudioCalls"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedInstance]);
    [v3 requestPendingACInvitations];
  }

  if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls]( &OBJC_CLASS___TUCallCapabilities,  "supportsDisplayingFaceTimeVideoCalls"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([v2 sharedInstance]);
    [v4 requestPendingVCInvitations];
  }

- (id)chatWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate cachedChats](self, "cachedChats", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    id v12 = 0LL;
    v13 = v10;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v7);
      }
      id v10 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0) {
        break;
      }
      id v12 = (char *)v12 + 1;
      v13 = v10;
      if (v9 == v12)
      {
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v10 = 0LL;
  }

  os_unfair_lock_unlock(p_accessorLock);
  return v10;
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  return v6 != 0LL;
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  return 0LL;
}

- (void)registerChat:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if ([v6 state] && objc_msgSend(v6, "state") != 5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate cachedChats](self, "cachedChats"));
    [v5 addObject:v6];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate cachedChats](self, "cachedChats"));
    [v5 removeObject:v6];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v5 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  -[CSDFaceTimeIMAVProviderDelegate _endChatWithUUID:withEndedReason:]( self,  "_endChatWithUUID:withEndedReason:",  v5,  27LL);
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v5 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  -[CSDFaceTimeIMAVProviderDelegate _endChatWithUUID:withEndedReason:]( self,  "_endChatWithUUID:withEndedReason:",  v5,  29LL);
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v5 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  -[CSDFaceTimeIMAVProviderDelegate _endChatWithUUID:withEndedReason:]( self,  "_endChatWithUUID:withEndedReason:",  v5,  1LL);
}

- (void)endCallWithUUID:(id)a3
{
  id v5 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  -[CSDFaceTimeIMAVProviderDelegate _endChatWithUUID:withEndedReason:]( self,  "_endChatWithUUID:withEndedReason:",  v5,  8LL);
}

- (void)_endChatWithUUID:(id)a3 withEndedReason:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v6));
  id v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001D524;
    v12[3] = &unk_1003D78C8;
    v13 = v8;
    unsigned int v14 = a4;
    dispatch_async(&_dispatch_main_q, v12);
    id v10 = v13;
  }

  else
  {
    id v11 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asked to end chat with UUID: %@, reason: (%ld) but could not find it",  buf,  0x16u);
    }
  }
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  LOBYTE(v4) = [v6 state] > 2;

  return (char)v4;
}

- (void)inviteIMAVPeersWithAction:(id)a3 tokensToExclude:(id)a4 joinCallActionToFulfill:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D720;
  block[3] = &unk_1003D7B28;
  id v12 = a3;
  v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  dispatch_sync(&_dispatch_main_q, block);
}

- (unsigned)IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)_updateProviderForConnectingChat:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 isCaller])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate faceTimeDemuxerDelegate](self, "faceTimeDemuxerDelegate"));
    id v7 = v4;
    id v8 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 GUID]);

    id v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 providerDelegate:self callWithUUID:v10 startedConnectingAtDate:v11];
  }

  id v12 = -[CXCallUpdate initWithIMAVChat:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithIMAVChat:", v4);
  -[CXCallUpdate setFaceTimeTransportType:](v12, "setFaceTimeTransportType:", 1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate provider](self, "provider"));
  id v17 = v4;
  id v14 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v17 GUID]);

  id v16 = -[NSUUID initWithUUIDString:](v14, "initWithUUIDString:", v15);
  [v13 reportCallWithUUID:v16 updated:v12];
}

- (void)_updateProviderForConnectedChat:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 isCaller])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate provider](self, "provider"));
    id v7 = v4;
    id v8 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 GUID]);

    id v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dateConnected]);
    [v6 reportOutgoingCallWithUUID:v10 connectedAtDate:v11];
  }

  else
  {
    id v12 = v4;
    v13 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);

    id v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate provider](self, "provider"));
    id v18 = objc_msgSend( v16,  "pendingCallActionsOfClass:withCallUUID:",  objc_opt_class(CXAnswerCallAction, v17),  v15);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if ([v19 count])
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v21)
      {
        id v22 = v21;
        id v32 = v19;
        id v33 = v4;
        uint64_t v23 = *(void *)v35;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(NSUUID **)(*((void *)&v34 + 1) + 8LL * (void)i);
            id v26 = sub_1001704C4();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Legacy chat with matching UUID connected; attempting to fulfill pending answer call action %@",
                buf,
                0xCu);
            }

            if ((-[NSUUID isComplete](v25, "isComplete") & 1) == 0)
            {
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 dateConnected]);
              if (v28)
              {
                v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 dateConnected]);
                -[NSUUID fulfillWithDateConnected:](v25, "fulfillWithDateConnected:", v29);
              }

              else
              {
                id v30 = sub_1001704C4();
                v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v39 = v25;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Legacy chat did not provide a connection date; Could not fulfill answer call action %@",
                    buf,
                    0xCu);
                }
              }
            }
          }

          id v22 = [v20 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }

        while (v22);
        id v4 = v33;
        __int128 v19 = v32;
      }
    }

    else
    {
      id v31 = sub_1001704C4();
      id v20 = (id)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] No pending answer call actions found with UUID: %@",  buf,  0xCu);
      }
    }
  }
}

- (void)_updateProviderForEndedChat:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  id v7 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 GUID]);

  id v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate provider](self, "provider"));
  id v12 = objc_msgSend( v10,  "pendingCallActionsOfClass:withCallUUID:",  objc_opt_class(CXAnswerCallAction, v11),  v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v20 = sub_1001704C4();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Failing answer call action for chat because it ended before connecting: %@",  buf,  0xCu);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v16);
  }
}

- (void)daemonConnected:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E4AC;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)handleChatStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  +[CSDSignposts trace:](&OBJC_CLASS___CSDSignposts, "trace:", 2LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  -[CSDFaceTimeIMAVProviderDelegate registerChat:](self, "registerChat:", v7);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001E5F8;
  v10[3] = &unk_1003D7758;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (id)failureContextForChat:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 endedReason] == 12)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
    -[CXCallFailureContext setFailureReason:](v6, "setFailureReason:", 2LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    unsigned int v9 = [v7 supportsWLAN];
    if (([v8 allowAnyNetwork] & 1) != 0
      || ([v4 isVideo] & 1) == 0
      && ([v7 supportsNonWiFiCalling] & 1) != 0
      || [v4 isVideo] && objc_msgSend(v7, "supportsNonWiFiFaceTime"))
    {
      uint64_t v10 = TUBundle();
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"CALL_FAILED_NO_NETWORK_CONNECTION_TITLE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[CXCallFailureContext setTitle:](v6, "setTitle:", v12);

      unsigned int v13 = [v4 isVideo];
      uint64_t v14 = TUBundle();
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = v15;
      uint64_t v17 = @"CALL_FAILED_NO_LOCAL_NETWORK_WLAN_MESSAGE";
      if (v13) {
        uint64_t v17 = @"ALERT_VIDEO_FAILED_NO_LOCAL_NETWORK_WLAN_MESSAGE";
      }
      id v18 = @"ALERT_VIDEO_FAILED_NO_LOCAL_NETWORK_WIFI_MESSAGE";
      if (!v13) {
        id v18 = @"CALL_FAILED_NO_LOCAL_NETWORK_WIFI_MESSAGE";
      }
      if (v9) {
        __int128 v19 = v17;
      }
      else {
        __int128 v19 = v18;
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:v19 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[CXCallFailureContext setMessage:](v6, "setMessage:", v20);

      if ([v7 supportsCellularData])
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
        if (([v21 isAirplaneModeEnabled] & 1) == 0)
        {
          unsigned __int8 v80 = [v21 isSIMRemoved];

          -[CXCallFailureContext setHasWiFiSettingsRemediation:](v6, "setHasWiFiSettingsRemediation:", 1LL);
          if ((v80 & 1) == 0) {
            -[CXCallFailureContext setHasCellularSettingsRemediation:](v6, "setHasCellularSettingsRemediation:", 1LL);
          }
          goto LABEL_35;
        }
      }
    }

    else
    {
      unsigned int v34 = [v4 isVideo];
      uint64_t v35 = TUBundle();
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      __int128 v37 = v36;
      v38 = @"CALL_FAILED_NO_LOCAL_WLAN_MESSAGE";
      if (v34) {
        v38 = @"ALERT_VIDEO_FAILED_NO_LOCAL_WLAN_MESSAGE";
      }
      v39 = @"ALERT_VIDEO_FAILED_NO_LOCAL_WIFI_MESSAGE";
      if (!v34) {
        v39 = @"CALL_FAILED_NO_LOCAL_WIFI_MESSAGE";
      }
      if (v9) {
        id v40 = v38;
      }
      else {
        id v40 = v39;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:v40 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[CXCallFailureContext setMessage:](v6, "setMessage:", v41);
    }

    -[CXCallFailureContext setHasWiFiSettingsRemediation:](v6, "setHasWiFiSettingsRemediation:", 1LL);
LABEL_35:

    goto LABEL_80;
  }

  if ([v4 endedReason] != 28)
  {
    if ([v4 endedReason] == 26)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      uint64_t v42 = TUBundle();
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"ALERT_VIDEO_FAILED_TITLE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[CXCallFailureContext setTitle:](v6, "setTitle:", v44);

      -[CXCallFailureContext setFailureReason:](v6, "setFailureReason:", 2LL);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v4 otherIMHandle]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 ID]);

      LODWORD(v45) = [v46 destinationIdIsPhoneNumber];
      uint64_t v47 = TUBundle();
      id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      int v49 = v48;
      if ((_DWORD)v45) {
        v50 = @"ALERT_VIDEO_FAILED_REMOTE_INCOMPATIBLE_MESSAGE_%@_NUMBER";
      }
      else {
        v50 = @"ALERT_VIDEO_FAILED_REMOTE_INCOMPATIBLE_MESSAGE_%@_NAME";
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue( [v48 localizedStringForKey:v50 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v51,  @"<display_name>"));
      -[CXCallFailureContext setMessage:](v6, "setMessage:", v52);
    }

    else
    {
      if ([v4 endedReason] == 13
        || [v4 endedReason] == 16 && objc_msgSend(v4, "endedError") == -1)
      {
        id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
        unsigned int v65 = [v4 isVideo];
        uint64_t v66 = TUBundle();
        v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v68 = v67;
        if (v65) {
          v69 = @"ALERT_VIDEO_NOT_AVAILABLE_TITLE";
        }
        else {
          v69 = @"CALL_NOT_AVAILABLE_TITLE";
        }
        v70 = (void *)objc_claimAutoreleasedReturnValue( [v67 localizedStringForKey:v69 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
        -[CXCallFailureContext setTitle:](v6, "setTitle:", v70);

        -[CXCallFailureContext setFailureReason:](v6, "setFailureReason:", 2LL);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v4 otherIMHandle]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v71 ID]);

        unsigned int v72 = [v46 destinationIdIsPhoneNumber];
        unsigned int v73 = [v4 isVideo];
        uint64_t v74 = TUBundle();
        v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v76 = v75;
        v77 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NAME";
        if (v73) {
          v77 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NAME";
        }
        v78 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NUMBER";
        if (!v73) {
          v78 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NUMBER";
        }
        if (v72) {
          v79 = v78;
        }
        else {
          v79 = v77;
        }
      }

      else
      {
        if ([v4 endedReason] != 24
          && [v4 endedReason] != 23
          && ([v4 endedReason] != 16 || objc_msgSend(v4, "endedError") != 6400))
        {
          if ([v4 endedReason] == 6
            && [v4 endedError] == 32005)
          {
            v97 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
            id v6 = v97;
            uint64_t v98 = 4LL;
          }

          else
          {
            if ([v4 endedReason] != 30)
            {
              id v6 = 0LL;
              goto LABEL_80;
            }

            v97 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
            id v6 = v97;
            uint64_t v98 = 5LL;
          }

          -[CXCallFailureContext setFailureReason:](v97, "setFailureReason:", v98);
          goto LABEL_80;
        }

        id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
        unsigned int v82 = [v4 isVideo];
        uint64_t v83 = TUBundle();
        v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
        v85 = v84;
        if (v82) {
          v86 = @"ALERT_VIDEO_FAILED_TITLE";
        }
        else {
          v86 = @"CALL_FAILED_TITLE";
        }
        v87 = (void *)objc_claimAutoreleasedReturnValue( [v84 localizedStringForKey:v86 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
        -[CXCallFailureContext setTitle:](v6, "setTitle:", v87);

        -[CXCallFailureContext setFailureReason:](v6, "setFailureReason:", 1LL);
        v88 = (void *)objc_claimAutoreleasedReturnValue([v4 otherIMHandle]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v88 ID]);

        unsigned int v89 = [v46 destinationIdIsPhoneNumber];
        unsigned int v90 = [v4 isVideo];
        uint64_t v91 = TUBundle();
        v75 = (void *)objc_claimAutoreleasedReturnValue(v91);
        v76 = v75;
        v92 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NUMBER";
        if (v90) {
          v92 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NUMBER";
        }
        v93 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NAME";
        if (!v90) {
          v93 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NAME";
        }
        if (v89) {
          v79 = v92;
        }
        else {
          v79 = v93;
        }
      }

      v94 = (void *)objc_claimAutoreleasedReturnValue( [v75 localizedStringForKey:v79 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v94,  @"<display_name>"));
      -[CXCallFailureContext setMessage:](v6, "setMessage:", v95);
    }

    goto LABEL_80;
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
  -[CXCallFailureContext setFailureReason:](v6, "setFailureReason:", 1LL);
  if ([v4 endedError] == 5087)
  {
    unsigned int v22 = [v4 isVideo];
    uint64_t v23 = TUBundle();
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v25 = v24;
    if (v22) {
      id v26 = @"ALERT_VIDEO_FAILED_TITLE";
    }
    else {
      id v26 = @"CALL_FAILED_TITLE";
    }
    id v27 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:v26 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    -[CXCallFailureContext setTitle:](v6, "setTitle:", v27);

    unsigned int v28 = [v4 isVideo];
    uint64_t v29 = TUBundle();
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    if (v28) {
      id v32 = @"ALERT_VIDEO_FAILED_BAD_NONCE_TIMESTAMP";
    }
    else {
      id v32 = @"CALL_FAILED_BAD_NONCE_TIMESTAMP";
    }
    id v33 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:v32 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    -[CXCallFailureContext setMessage:](v6, "setMessage:", v33);

    -[CXCallFailureContext setHasDateAndTimeSettingsRemediation:](v6, "setHasDateAndTimeSettingsRemediation:", 1LL);
  }

  else
  {
    unsigned int v53 = [v4 endedError];
    unsigned int v54 = [v4 isVideo];
    uint64_t v55 = TUBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = v56;
    if (v54) {
      v58 = @"ALERT_VIDEO_FAILED_TITLE";
    }
    else {
      v58 = @"CALL_FAILED_TITLE";
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue( [v56 localizedStringForKey:v58 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    -[CXCallFailureContext setTitle:](v6, "setTitle:", v59);

    unsigned int v60 = [v4 isVideo];
    uint64_t v61 = TUBundle();
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    id v7 = v62;
    if (v53 != 7001)
    {
      if ((v60 & 1) != 0) {
        v81 = @"ALERT_VIDEO_FAILED_REGION_INFO_INSUFFICIENT";
      }
      else {
        v81 = @"CALL_FAILED_REGION_INFO_INSUFFICIENT";
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue( [v62 localizedStringForKey:v81 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
      -[CXCallFailureContext setMessage:](v6, "setMessage:", v8);
      goto LABEL_35;
    }

    if (v60) {
      v63 = @"ALERT_VIDEO_FAILED_UPDATE_LOCATION_MESSAGE";
    }
    else {
      v63 = @"CALL_FAILED_UPDATE_LOCATION_MESSAGE";
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue( [v62 localizedStringForKey:v63 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    -[CXCallFailureContext setMessage:](v6, "setMessage:", v64);

    -[CXCallFailureContext setHasLocationSettingsRemediation:](v6, "setHasLocationSettingsRemediation:", 1LL);
  }

- (void)handleChatFirstRemoteFrameArrived:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001F55C;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)handleChatInvitationSent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001F6D8;
  v9[3] = &unk_1003D7758;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)handleChatCallInfoChangedNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 avChat]);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F8B8;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v4;
  uint64_t v14 = self;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)handleChatConferenceIDChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if ([v5 state] >= 2)
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001FACC;
    v9[3] = &unk_1003D7758;
    id v10 = v5;
    id v11 = self;
    dispatch_async(v8, v9);
  }
}

- (void)handleChatConferenceMetadataUpdated:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001FCC0;
  v10[3] = &unk_1003D7758;
  void v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);
}

- (void)handleChatMayRequireBreakBeforeMakeChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001FEA4;
  v10[3] = &unk_1003D7758;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)handleChatInFrequencyChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020000;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleChatOutFrequencyChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020160;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)invitedToIMAVChat:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002033C;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  -[CSDFaceTimeIMAVProviderDelegate setProvider:](self, "setProvider:", v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002070C;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate cachedChats](self, "cachedChats"));
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000209A8;
        block[3] = &unk_1003D7730;
        void block[4] = v13;
        dispatch_async(&_dispatch_main_q, block);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  if ([v9 state] == 4)
  {
    id v10 = sub_1001704C4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B1E70((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100020B44;
    block[3] = &unk_1003D7828;
    void block[4] = self;
    id v19 = v5;
    id v20 = v9;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling endChat on chat %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020DD4;
  block[3] = &unk_1003D7730;
  id v12 = v9;
  id v14 = v12;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  if ([v9 state] == 4)
  {
    __int128 v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    id v20 = sub_100020F80;
    id v21 = &unk_1003D7878;
    char v23 = [v5 isOnHold] ^ 1;
    id v22 = v9;
    dispatch_async(&_dispatch_main_q, &v18);
  }

  else
  {
    id v10 = sub_1001704C4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B1ED4((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100021194;
  uint64_t v15 = &unk_1003D7758;
  id v10 = v5;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  dispatch_async(&_dispatch_main_q, &v12);
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100021514;
  uint64_t v15 = &unk_1003D7758;
  id v10 = v5;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  dispatch_async(&_dispatch_main_q, &v12);
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002174C;
  block[3] = &unk_1003D7828;
  id v10 = v5;
  id v13 = v10;
  id v14 = v9;
  uint64_t v15 = self;
  id v11 = v9;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100021984;
  uint64_t v15 = &unk_1003D7758;
  id v10 = v5;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  dispatch_async(&_dispatch_main_q, &v12);
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAVProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100021BA4;
  uint64_t v15 = &unk_1003D7758;
  id v10 = v5;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  dispatch_async(&_dispatch_main_q, &v12);
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  return (CSDFaceTimeProviderDelegateManagerDelegate *)objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (id)imAccountForActionBlock
{
  return self->_imAccountForActionBlock;
}

- (void)setImAccountForActionBlock:(id)a3
{
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSMutableOrderedSet)cachedChats
{
  return self->_cachedChats;
}

- (void)setCachedChats:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
}

@end