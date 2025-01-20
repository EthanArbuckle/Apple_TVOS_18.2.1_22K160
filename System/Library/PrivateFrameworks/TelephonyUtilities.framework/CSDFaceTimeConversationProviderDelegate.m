@interface CSDFaceTimeConversationProviderDelegate
+ (id)callScreenShareAttributesForAction:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isUnansweredOutgoingOneToOneConversation:(id)a3;
- (BOOL)isWaitingForRemoteJoinForConversationUUID:(id)a3;
- (BOOL)linkContainsValidLocalHandle:(id)a3;
- (BOOL)shouldHandleProvider:(id)a3;
- (BOOL)shouldHandleProviderWithIdentifier:(id)a3;
- (CSDBlockUtilitiesProtocol)blockUtilities;
- (CSDFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (NSMutableDictionary)recentlyDeletedCallUUIDsByConversationUUID;
- (NSMutableSet)conversationUUIDsUpgradedFromAVLess;
- (NSMutableSet)conversationUUIDsWaitingForRemoteJoin;
- (id)_findPendingConversationWithCallUUID:(id)a3;
- (id)activatedLinkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)allowsScreenSharingBlock;
- (id)deletedLinkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)linkForJoinCallAction:(id)a3 inLinks:(id)a4;
- (id)linkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)validateLinkForJoinCallActionIfNecessary:(id)a3 withError:(id *)a4;
- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)_failConversation:(id)a3 failureReason:(int64_t)a4 providerEndedReason:(int64_t)a5;
- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4;
- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forConversation:(id)a6;
- (void)conversationManager:(id)a3 connectionDidStartForConversation:(id)a4;
- (void)conversationManager:(id)a3 conversation:(id)a4 addedActiveParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 changedBytesOfDataUsed:(int64_t)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 failedWithContext:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 receivedMessage:(id)a5 fromHandle:(id)a6 withUpdate:(id)a7;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5;
- (void)conversationManager:(id)a3 joinConversationWithRequest:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChanged:(id)a4 forConversation:(id)a5;
- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4;
- (void)conversationManager:(id)a3 reportedHandedOffConversation:(id)a4 replacedByIdentifier:(unint64_t)a5 localizedHandoffRecipientDeviceCategory:(id)a6;
- (void)conversationManager:(id)a3 reportedInvalidLinkForPendingConversation:(id)a4;
- (void)conversationManager:(id)a3 reportedLetMeInRejectedForPendingConversation:(id)a4;
- (void)conversationManager:(id)a3 reportedRemoteDoesHandedOffForConversation:(id)a4;
- (void)declineConversation:(id)a3 reason:(int64_t)a4 destinations:(id)a5;
- (void)declineRemoteDevicesForConversation:(id)a3 reason:(int64_t)a4;
- (void)declineRemoteMembersForConversation:(id)a3 reason:(int64_t)a4;
- (void)handleDeclineMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleInvitationMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleInvitationMessageForLetMeIn:(id)a3 forConversation:(id)a4 pendingConversation:(id)a5 link:(id)a6 fromHandle:(id)a7;
- (void)handleMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleNicknameUpdateMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleReceivedVideoUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleRemoveMembersMessage:(id)a3 forConversation:(id)a4;
- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withAliases:(id)a6;
- (void)handleScreenShareMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5;
- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4;
- (void)performJoinCallAction:(id)a3;
- (void)proceedToNewPendingConversationForLink:(id)a3 action:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)setAllowsScreenSharingBlock:(id)a3;
- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4;
- (void)setWaitingForRemoteJoin:(BOOL)a3 forConversationUUID:(id)a4;
- (void)startOutgoingOneToOneTimeoutIfNecessary:(id)a3;
@end

@implementation CSDFaceTimeConversationProviderDelegate

- (CSDFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  v5 = -[CSDAbstractFaceTimeConversationProviderDelegate initWithConversationManager:queue:invitationResolver:]( &v14,  "initWithConversationManager:queue:invitationResolver:",  a3,  a4,  a5);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    recentlyDeletedCallUUIDsByConversationUUID = v5->_recentlyDeletedCallUUIDsByConversationUUID;
    v5->_recentlyDeletedCallUUIDsByConversationUUID = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    conversationUUIDsWaitingForRemoteJoin = v5->_conversationUUIDsWaitingForRemoteJoin;
    v5->_conversationUUIDsWaitingForRemoteJoin = (NSMutableSet *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___CSDBlockUtilities);
    blockUtilities = v5->_blockUtilities;
    v5->_blockUtilities = (CSDBlockUtilitiesProtocol *)v10;

    id allowsScreenSharingBlock = v5->_allowsScreenSharingBlock;
    v5->_id allowsScreenSharingBlock = &stru_1003DB140;
  }

  return v5;
}

- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

    if (v9)
    {
      id v10 = sub_1001704C4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v7]);
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = 0LL;
        __int16 v25 = 2112;
        id v26 = v7;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "callUUID: %@, callUUIDsByConversationUUID[%@]: %@",  buf,  0x20u);
      }

      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v7]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate recentlyDeletedCallUUIDsByConversationUUID]( self,  "recentlyDeletedCallUUIDsByConversationUUID"));
      [v16 setObject:v15 forKeyedSubscript:v7];

      objc_initWeak((id *)buf, self);
      dispatch_time_t v17 = dispatch_time(0LL, 5000000000LL);
      v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10014332C;
      block[3] = &unk_1003D7CB0;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v7;
      dispatch_after(v17, v18, block);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  -[CSDAbstractFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( &v19,  "setCallUUID:forConversationUUID:",  v6,  v7);
}

- (BOOL)isWaitingForRemoteJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate conversationUUIDsWaitingForRemoteJoin]( self,  "conversationUUIDsWaitingForRemoteJoin"));
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (NSMutableSet)conversationUUIDsWaitingForRemoteJoin
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_conversationUUIDsWaitingForRemoteJoin;
}

- (void)setWaitingForRemoteJoin:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (v9)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate conversationUUIDsWaitingForRemoteJoin]( self,  "conversationUUIDsWaitingForRemoteJoin"));
    uint64_t v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }
  }
}

- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  else {
    return 0;
  }
}

+ (id)callScreenShareAttributesForAction:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___TUCallScreenShareAttributes);
  if (v3)
  {
    -[TUCallScreenShareAttributes setDeviceFamily:](v4, "setDeviceFamily:", [v3 deviceFamily]);
    -[TUCallScreenShareAttributes setDeviceHomeButtonType:]( v4,  "setDeviceHomeButtonType:",  [v3 deviceHomeButtonType]);
    -[TUCallScreenShareAttributes setStyle:](v4, "setStyle:", [v3 style]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 displayID]);
    -[TUCallScreenShareAttributes setDisplayID:](v4, "setDisplayID:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 frameRate]);
    -[TUCallScreenShareAttributes setFrameRate:](v4, "setFrameRate:", v6);

    -[TUCallScreenShareAttributes setWindowed:](v4, "setWindowed:", [v3 isWindowed]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 windowUUID]);
    -[TUCallScreenShareAttributes setWindowUUID:](v4, "setWindowUUID:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 displayScale]);
    -[TUCallScreenShareAttributes setDisplayScale:](v4, "setDisplayScale:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 cornerRadius]);
    -[TUCallScreenShareAttributes setCornerRadius:](v4, "setCornerRadius:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 scaleFactor]);
    -[TUCallScreenShareAttributes setScaleFactor:](v4, "setScaleFactor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 systemRootLayerTransform]);
    -[TUCallScreenShareAttributes setSystemRootLayerTransform:](v4, "setSystemRootLayerTransform:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 originalResolution]);
    id v13 = [v12 copy];
    -[TUCallScreenShareAttributes setOriginalResolution:](v4, "setOriginalResolution:", v13);
  }

  return v4;
}

- (BOOL)linkContainsValidLocalHandle:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isLocallyCreated];
  if (v5
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager")),  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 originatorHandle]),  v8 = objc_msgSend(v6, "isValidLocalHandle:", v7),  v7,  v6,  v8))
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = @"YES";
      __int16 v31 = 2112;
      v32 = @"YES";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Link was created locally: %@, using valid local handle: %@",  buf,  0x16u);
    }

- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  -[CSDAbstractFaceTimeConversationProviderDelegate cleanUpConversationIfNecessaryForConversationUUID:failureContext:]( &v9,  "cleanUpConversationIfNecessaryForConversationUUID:failureContext:",  v7,  v6);

  -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  0LL,  v7);
}

- (void)handleMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = sub_1001704C4();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v10 type];
    else {
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v17));
    }
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    *(_DWORD *)buf = 138412546;
    id v22 = v18;
    __int16 v23 = 2112;
    __int128 v24 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received %@ conversation message for %@",  buf,  0x16u);
  }

  unsigned int v20 = [v10 type];
  switch(v20)
  {
    case 1u:
    case 3u:
      -[CSDFaceTimeConversationProviderDelegate handleInvitationMessage:forConversation:fromHandle:]( self,  "handleInvitationMessage:forConversation:fromHandle:",  v10,  v11,  v12);
      break;
    case 2u:
      -[CSDFaceTimeConversationProviderDelegate handleUpgradeMessage:forConversation:fromHandle:withUpdate:]( self,  "handleUpgradeMessage:forConversation:fromHandle:withUpdate:",  v10,  v11,  v12,  v13);
      break;
    case 4u:
    case 5u:
    case 7u:
    case 8u:
    case 0xAu:
    case 0xBu:
      break;
    case 6u:
      -[CSDFaceTimeConversationProviderDelegate handleRespondedElsewhereMessage:forConversation:fromHandle:]( self,  "handleRespondedElsewhereMessage:forConversation:fromHandle:",  v10,  v11,  v12);
      break;
    case 9u:
      goto LABEL_15;
    case 0xCu:
      -[CSDFaceTimeConversationProviderDelegate handleNicknameUpdateMessage:forConversation:fromHandle:withUpdate:]( self,  "handleNicknameUpdateMessage:forConversation:fromHandle:withUpdate:",  v10,  v11,  v12,  v13);
LABEL_15:
      -[CSDFaceTimeConversationProviderDelegate handleDeclineMessage:forConversation:fromHandle:withUpdate:]( self,  "handleDeclineMessage:forConversation:fromHandle:withUpdate:",  v10,  v11,  v12,  v13);
      break;
    default:
      if (v20 == 19)
      {
        -[CSDFaceTimeConversationProviderDelegate handleRemoveMembersMessage:forConversation:]( self,  "handleRemoveMembersMessage:forConversation:",  v10,  v11);
      }

      else if (v20 == 22)
      {
        -[CSDFaceTimeConversationProviderDelegate handleReceivedVideoUpgradeMessage:forConversation:fromHandle:]( self,  "handleReceivedVideoUpgradeMessage:forConversation:fromHandle:",  v10,  v11,  v12);
      }

      break;
  }
}

- (void)handleDeclineMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 state] == (id)3)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      int v20 = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not handling received Decline message from %@ since we are already in a joined conversation with UUID: %@",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    [v13 leaveConversationWithUUID:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v18 providerDelegate:self callWithUUID:v17 endedAtDate:v19 withReason:2 failureContext:0];
    }
  }
}

- (void)handleNicknameUpdateMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 hasNickname])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 nickname]);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
    [v12 processUpdatedNickname:v13 forHandle:v11 conversationUUID:v14];
  }

  else
  {
    id v15 = sub_1001704C4();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring nickname update message %@ because message doesn't have a nickname set.",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)handleScreenShareMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not honoring screen sharing message",  v8,  2u);
  }
}

- (void)handleReceivedVideoUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = TUCopyIDSCanonicalAddressForHandle(v8);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)v11;
  if (v11)
  {
    v34 = (void *)v11;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 activeRemoteParticipants]);
    id v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v36;
LABEL_4:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
        unsigned __int8 v20 = [v19 isEqualToHandle:v8];

        if ((v20 & 1) != 0) {
          break;
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v21 = v18;

      if (!v21) {
        goto LABEL_17;
      }
      if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)2)
      {
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteMembers]);
        id v23 = [v22 count];

        if (v23 == (id)1)
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

          if (v26)
          {
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
            v28 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
            [v27 setVideo:1 forConversationWithUUID:v28];
          }

          else
          {
            id v33 = sub_1001704C4();
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "[WARN] No call is being tracked, dropping message for conversation: %@",  buf,  0xCu);
            }
          }

          id v12 = v34;

          goto LABEL_25;
        }
      }

      id v31 = sub_1001704C4();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] Conversation %@ is not in the correct state. Dropping message.",  buf,  0xCu);
      }
    }

    else
    {
LABEL_10:

LABEL_17:
      id v29 = sub_1001704C4();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping video upgrade message, since member is not part of conversation.",  buf,  2u);
      }
    }

    id v12 = v34;
  }

  else
  {
    id v30 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not convert %@ to IDS destination",  buf,  0xCu);
    }
  }

- (void)handleUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate serverBag](self, "serverBag"));
  unsigned __int8 v16 = [v15 isAutomaticUpgradingEnabled];

  if ((v16 & 1) == 0)
  {
    id v22 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] Not handling upgrade message for conversation since upgrades are currently disabled.";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    goto LABEL_16;
  }

  if (!v13)
  {
    id v24 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] Not upgrading conversation since there was no join update attached.";
    goto LABEL_15;
  }

  if ([v13 participantUpdateSubtype] != (id)1)
  {
    id v25 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] Not upgrading conversation since the join update has an incorrect subtype.";
    goto LABEL_15;
  }

  if (([v10 hasProtoUpgradeSessionUUID] & 1) == 0)
  {
    id v26 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] Not upgrading conversation as message is missing upgrade token.";
    goto LABEL_15;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 participantDestinationID]);
  id v34 = 0LL;
  id v18 = [v17 _stripPotentialTokenURIWithToken:&v34];
  BOOL v19 = (os_log_s *)v34;

  if (v19)
  {
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10014469C;
    v28[3] = &unk_1003DB168;
    id v29 = (os_log_s *)v10;
    id v30 = v12;
    id v31 = v13;
    v32 = self;
    id v33 = v11;
    [v20 providerDelegate:self requestedUpgradeToExistingCallForConversation:v33 withSessionToken:v19 completion:v28];

    id v21 = v29;
  }

  else
  {
    id v27 = sub_1001704C4();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not upgrading conversation as message is missing remote token.",  buf,  2u);
    }
  }

LABEL_16:
}

- (void)handleRemoveMembersMessage:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 removedMembers]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "removedMembers", 0));
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v15) tuConversationMember]);
        [v10 addObject:v16];

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  [v17 removeRemoteMembers:v10 fromConversationWithUUID:v18];
}

- (void)handleInvitationMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 pseudonym]);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 removePendingConversationWithPseudonym:v14]);

    if (v15)
    {
      -[CSDFaceTimeConversationProviderDelegate handleInvitationMessageForLetMeIn:forConversation:pendingConversation:link:fromHandle:]( self,  "handleInvitationMessageForLetMeIn:forConversation:pendingConversation:link:fromHandle:",  v8,  v9,  v15,  v12,  v10);
      goto LABEL_42;
    }

    if ([v8 hasIsLetMeInApproved] && objc_msgSend(v8, "isLetMeInApproved"))
    {
      id v16 = sub_1001704C4();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v9, "UUID"));
        *(_DWORD *)buf = 138412290;
        v58 = v18;
        __int128 v19 = "Not ringing for incoming invitation message for %@ since message is a LMI approval";
        __int128 v20 = v17;
        uint32_t v21 = 12;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);

        goto LABEL_12;
      }

      goto LABEL_12;
    }
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v9, "UUID"));
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);

  if (v15)
  {
    id v24 = sub_1001704C4();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v9, "UUID"));
      *(_DWORD *)buf = 138412546;
      v58 = v18;
      __int16 v59 = 2112;
      v60 = v15;
      __int128 v19 = "Ignoring incoming invitation message for %@ since we are already tracking this with call %@";
      __int128 v20 = v17;
      uint32_t v21 = 22;
      goto LABEL_11;
    }

- (void)handleInvitationMessageForLetMeIn:(id)a3 forConversation:(id)a4 pendingConversation:(id)a5 link:(id)a6 fromHandle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (CXCallFailureContext *)a7;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationGroupUUID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationGroupUUID]);
  unsigned int v19 = [v17 isEqual:v18];

  if ((v19 & 1) == 0)
  {
    id v20 = sub_1001704C4();
    uint32_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v22 = (CXCallFailureContext *)objc_claimAutoreleasedReturnValue([v12 conversationGroupUUID]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationGroupUUID]);
      *(_DWORD *)buf = 138412802;
      v64 = v22;
      __int16 v65 = 2112;
      id v66 = v23;
      __int16 v67 = 2112;
      id v68 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring incoming invitation (LMI approval) because message's group UUID %@ did not match the pending con versation's expected group UUID %@. (link: %@)",  buf,  0x20u);
    }
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 approverHandle]);
  unsigned __int8 v25 = [v24 isEquivalentToHandle:v16];

  if ((v25 & 1) != 0)
  {
    int v26 = v19 ^ 1;
    uint64_t v27 = 522LL;
  }

  else
  {
    id v28 = sub_1001704C4();
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v14 approverHandle]);
      *(_DWORD *)buf = 138412546;
      v64 = v16;
      __int16 v65 = 2112;
      id v66 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring incoming invitation (LMI approval) because it was sent from handle %@ instead of expected approverHandle %@",  buf,  0x16u);
    }

    int v26 = 1;
    uint64_t v27 = 524LL;
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v14 link]);
  unsigned __int8 v32 = [v31 isEquivalentToConversationLink:v15];

  if ((v32 & 1) == 0)
  {
    id v51 = sub_1001704C4();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = (CXCallFailureContext *)v15;
      __int16 v65 = 2112;
      id v66 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring incoming invitation (LMI approval) because message's link %@ did not match the link the user tap ped (pendingConversation: %@)",  buf,  0x16u);
    }

    uint64_t v27 = 523LL;
    goto LABEL_26;
  }

  if (v26)
  {
LABEL_26:
    v43 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
    -[CXCallFailureContext setFailureReason:](v43, "setFailureReason:", 0LL);
    -[CXCallFailureContext setProviderEndedReason:](v43, "setProviderEndedReason:", v27);
    v53 = (CXCallFailureContext *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    -[CSDFaceTimeConversationProviderDelegate cleanUpConversationIfNecessaryForConversationUUID:failureContext:]( self,  "cleanUpConversationIfNecessaryForConversationUUID:failureContext:",  v53,  v43);
    goto LABEL_36;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v34]);

  if (!v35)
  {
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v14 temporaryGroupUUID]);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v37]);
  }

  if ([v12 type] == 1
    && ([v13 letMeInRequestState] == (id)2 || objc_msgSend(v14, "letMeInRequestState") == (id)2))
  {
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    [v38 updateLetMeInRequestState:3 addLink:v15 forConversationWithUUID:v39];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
  -[CSDAbstractFaceTimeConversationProviderDelegate associateCallUUID:withConversationUUID:waitingToJoin:]( self,  "associateCallUUID:withConversationUUID:waitingToJoin:",  v35,  v40,  1LL);

  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v41 queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145CD4;
  block[3] = &unk_1003D7730;
  v43 = v35;
  v62 = v43;
  dispatch_async(v42, block);

  id v44 = sub_1001704C4();
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "LMI: Shuttling in to new conversation and stopping the pending one (moving callUUID %@ to new conversation).",  buf,  0xCu);
  }

  v46 = objc_alloc_init(&OBJC_CLASS___CSDConversationJoinContext);
  -[CSDConversationJoinContext setWantsStagingArea:](v46, "setWantsStagingArea:", 1LL);
  -[CSDConversationJoinContext setRepresentsTransitionFromPending:](v46, "setRepresentsTransitionFromPending:", 1LL);
  -[CSDConversationJoinContext setAvMode:](v46, "setAvMode:", 2LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v13 provider]);
  -[CSDConversationJoinContext setProvider:](v46, "setProvider:", v47);

  -[CSDConversationJoinContext setVideoEnabled:](v46, "setVideoEnabled:", [v14 isVideoEnabled]);
  -[CSDConversationJoinContext setVideo:](v46, "setVideo:", [v14 isVideo]);
  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
  unsigned int v49 = [v48 avLessSharePlayEnabled];

  if (v49)
  {
    if ([v12 hasAvMode])
    {
      uint64_t v50 = (int)[v12 avMode];
    }

    else if (-[CSDConversationJoinContext isVideo](v46, "isVideo"))
    {
      uint64_t v50 = 2LL;
    }

    else
    {
      uint64_t v50 = 1LL;
    }

    -[CSDConversationJoinContext setAvMode:](v46, "setAvMode:", v50);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
  [v54 joinExistingConversationWithUUID:v55 context:v46];

  if ([v14 isUplinkMuted])
  {
    id v56 = sub_1001704C4();
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = (CXCallFailureContext *)v13;
      __int16 v65 = 2112;
      id v66 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Setting uplinkMuted for conversation: %@ since pendingConversation:%@ has uplinkMuted",  buf,  0x16u);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    [v58 setUplinkMuted:1 forConversationWithUUID:v59];
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
  -[CSDAbstractFaceTimeConversationProviderDelegate enqueueOrStartAudioForConversationUUID:]( self,  "enqueueOrStartAudioForConversationUUID:",  v60);

  v53 = v62;
LABEL_36:
}

- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withAliases:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
  id v16 = [v15 length];
  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v19)
    {
      LOWORD(v37) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring responded elsewhere message since it was not sent from a valid handle.",  (uint8_t *)&v37,  2u);
    }

    goto LABEL_22;
  }

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 initiator]);
    uint32_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteMembers]);
    int v37 = 138413058;
    unsigned int v38 = v20;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2048;
    id v42 = [v21 count];
    __int16 v43 = 2112;
    id v44 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "handleRespondedElsewhereMessage: initiator: %@, handle: %@, remotemember count: %lu, allAliases: %@",  (uint8_t *)&v37,  0x2Au);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteMembers]);
  if ([v22 count] != (id)1)
  {
    unsigned __int8 v24 = [v13 containsObject:v15];

    if ((v24 & 1) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    id v28 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v11 initiator]);
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v26 normalizedValue]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v12 normalizedValue]);
    int v37 = 138412802;
    unsigned int v38 = v29;
    __int16 v39 = 2112;
    id v40 = v30;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring responded elsewhere message since this did not come from the originator (%@), handle: %@, or one o f our aliases: %@.",  (uint8_t *)&v37,  0x20u);

    goto LABEL_20;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 initiator]);
  if (![v23 isEquivalentToHandle:v12])
  {
    unsigned __int8 v27 = [v13 containsObject:v15];

    if ((v27 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

LABEL_10:
  if ([v11 state] != (id)2 && objc_msgSend(v11, "state") != (id)3)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v32]);

    if (!v18) {
      goto LABEL_22;
    }
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    -[CSDFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  0LL,  v33);

    -[CSDAbstractFaceTimeConversationProviderDelegate setConversationUUID:forCallUUID:]( self,  "setConversationUUID:forCallUUID:",  0LL,  v18);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  0LL,  v34);

    -[CSDAbstractFaceTimeConversationProviderDelegate updateNetworkCriticalStateIfNecessary]( self,  "updateNetworkCriticalStateIfNecessary");
    uint64_t v35 = [v10 disconnectedReason];
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    [v36 reportCallWithUUID:v18 endedAtDate:0 privateReason:v35];

    if ([v11 state] != (id)1) {
      goto LABEL_22;
    }
    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    [v26 leaveConversationWithUUID:v29];
LABEL_20:

    goto LABEL_21;
  }

  id v25 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    int v37 = 138412290;
    unsigned int v38 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring message that we've responded elsewhere for conversation %@ since the conversation is already joini ng or is joined.",  (uint8_t *)&v37,  0xCu);
LABEL_21:
  }

- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 allAliases]);
  -[CSDFaceTimeConversationProviderDelegate handleRespondedElsewhereMessage:forConversation:fromHandle:withAliases:]( self,  "handleRespondedElsewhereMessage:forConversation:fromHandle:withAliases:",  v10,  v9,  v8,  v11);
}

- (void)startOutgoingOneToOneTimeoutIfNecessary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationsByUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (!-[CSDFaceTimeConversationProviderDelegate isWaitingForRemoteJoinForConversationUUID:]( self,  "isWaitingForRemoteJoinForConversationUUID:",  v7))
  {
    if (-[CSDFaceTimeConversationProviderDelegate isUnansweredOutgoingOneToOneConversation:]( self,  "isUnansweredOutgoingOneToOneConversation:",  v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate invitationResolver](self, "invitationResolver"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 localMember]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
      unsigned int v14 = [v11 shouldStartRingingTimeoutForConversation:v10 handle:v13];

      if (v14)
      {
        -[CSDFaceTimeConversationProviderDelegate setWaitingForRemoteJoin:forConversationUUID:]( self,  "setWaitingForRemoteJoin:forConversationUUID:",  1LL,  v7);
        dispatch_time_t v15 = dispatch_time(0LL, 30000000000LL);
        id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100146444;
        v17[3] = &unk_1003D7B28;
        v17[4] = self;
        id v18 = v7;
        id v19 = v4;
        id v20 = v10;
        dispatch_after(v15, v16, v17);
      }
    }
  }
}

- (BOOL)isUnansweredOutgoingOneToOneConversation:(id)a3
{
  id v3 = a3;
  if ([v3 state] != (id)2 && objc_msgSend(v3, "state") != (id)1)
  {
    if ([v3 state] == (id)3)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRemoteParticipants", 0));
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v4);
            }
            if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) audioVideoMode])
            {
              BOOL v5 = 0;
              goto LABEL_6;
            }
          }

          id v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      BOOL v5 = 1;
      goto LABEL_6;
    }

- (void)declineRemoteDevicesForConversation:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 devices]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      dispatch_time_t v15 = 0LL;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)IDSCopyIDForDevice(*(void *)(*((void *)&v31 + 1) + 8LL * (void)v15));
        if ([v16 length]) {
          [v10 addObject:v16];
        }

        dispatch_time_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v13);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allAliases]);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      id v23 = 0LL;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = TUCopyIDSCanonicalAddressForDestinationID(*(void *)(*((void *)&v27 + 1) + 8LL * (void)v23));
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if ([v25 length]) {
          [v10 addObject:v25];
        }

        id v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }

    while (v21);
  }

  -[CSDFaceTimeConversationProviderDelegate declineConversation:reason:destinations:]( self,  "declineConversation:reason:destinations:",  v5,  a4,  v10);
}

- (void)declineRemoteMembersForConversation:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteMembers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v8 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "idsDestination", (void)v16));
        if ([v15 length]) {
          [v9 addObject:v15];
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }

  -[CSDFaceTimeConversationProviderDelegate declineConversation:reason:destinations:]( self,  "declineConversation:reason:destinations:",  v6,  a4,  v9);
}

- (void)declineConversation:(id)a3 reason:(int64_t)a4 destinations:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
  uint64_t v13 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v11,  "initWithType:groupUUID:link:",  6LL,  v12,  0LL);

  -[CSDMessagingConversationMessage setDisconnectedReason:](v13, "setDisconnectedReason:", a4);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);

  dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountWithCallerID:v16]);

  __int128 v19 = v8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
  id v21 = sub_1001704C4();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v40 = a4;
    __int16 v41 = 2048;
    id v42 = [v19 count];
    __int16 v43 = 2112;
    id v44 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "declineConversation: reason: %ld, destinations count: %lu, destinations: %@",  buf,  0x20u);
  }

  __int128 v34 = v13;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v13, "data"));
  uint64_t v37 = IDSSendMessageOptionFromIDKey;
  uint64_t v24 = TUCopyIDSCanonicalAddressForDestinationID(v16);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  unsigned int v38 = v25;
  int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
  id v35 = 0LL;
  id v36 = 0LL;
  __int128 v27 = v19;
  unsigned int v28 = [v20 sendData:v23 fromAccount:v18 toDestinations:v19 priority:300 options:v26 identifier:&v36 error:&v35];
  id v29 = v36;
  id v30 = v35;

  id v31 = sub_1001704C4();
  __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  __int128 v33 = v32;
  if (v28)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v40 = (int64_t)v29;
      __int16 v41 = 2112;
      id v42 = v16;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Successfully sent message with identifier: %@ handle:%@ account: %@",  buf,  0x20u);
    }
  }

  else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    sub_1002B78B0();
  }
}

- (void)conversationManager:(id)a3 joinConversationWithRequest:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "joinCallAction", a3));
  -[CSDFaceTimeConversationProviderDelegate performJoinCallAction:](self, "performJoinCallAction:", v5);
}

- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forConversation:(id)a6
{
  id v9 = a6;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    *(_DWORD *)buf = 134218498;
    unint64_t v53 = a4;
    __int16 v54 = 2048;
    unint64_t v55 = a5;
    __int16 v56 = 2112;
    v57 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Mode changing fromMode %lu, toMode: %lu, conversationUUID: %@",  buf,  0x20u);
  }

  if (!a4 && a5)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    -[CSDAbstractFaceTimeConversationProviderDelegate associateCallUUID:withConversationUUID:waitingToJoin:]( self,  "associateCallUUID:withConversationUUID:waitingToJoin:",  v13,  v14,  1LL);

    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsAwaitingActiveAudioSession]( self,  "conversationUUIDsAwaitingActiveAudioSession"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    [v15 addObject:v16];

    if ([v9 state] == (id)3)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
      if ([v17 count] != (id)1)
      {
LABEL_18:

        goto LABEL_19;
      }

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 activeRemoteParticipants]);
      if (![v18 count])
      {

LABEL_17:
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate conversationUUIDsUpgradedFromAVLess]( self,  "conversationUUIDsUpgradedFromAVLess"));
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        [v17 addObject:v32];

        goto LABEL_18;
      }

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 activeRemoteParticipants]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);
      id v21 = [v20 audioVideoMode];

      if (!v21) {
        goto LABEL_17;
      }
    }

- (void)conversationManager:(id)a3 remoteMembersChanged:(id)a4 forConversation:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 state] == (id)3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeConversationProviderDelegate blockUtilities](self, "blockUtilities"));
    unsigned int v11 = [v10 blockListContainsMembers:v8 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

      if (v14)
      {
        dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        [v18 leaveConversationWithUUID:v15];

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeConversationProviderDelegate blockUtilities](self, "blockUtilities"));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
        [v16 reportFailureForReason:16 provider:v17 callUUID:v14 actionToFail:0];
      }
    }
  }
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteMembers]);
  if ([v12 count] != (id)1 && objc_msgSend(v7, "avMode") == (id)1)
  {
    id v13 = [v7 resolvedAudioVideoMode];

    if (v13 != (id)2) {
      goto LABEL_8;
    }
    id v14 = sub_1001704C4();
    dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found that a remote user had upgraded to video, upgrading our local conversation to video",  buf,  2u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    [v6 setVideo:1 forConversationWithUUID:v12];
  }

LABEL_8:
  v90 = -[CXCallUpdate initWithTUConversation:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithTUConversation:", v7);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
  v89 = (__CFString *)v11;
  if (![v16 avLessSharePlayEnabled])
  {
    id v18 = v90;
LABEL_19:

    goto LABEL_20;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 mergedRemoteMembers]);
  id v18 = v90;
  if ([v17 count] != (id)1)
  {
LABEL_18:

    goto LABEL_19;
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 mergedActiveRemoteParticipants]);
  if ([v19 count] != (id)1)
  {

    goto LABEL_18;
  }

  id v20 = [v7 avMode];

  if (!v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 activeRemoteParticipants]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v21 anyObject]);

    if ([v16 audioVideoMode] == (id)2)
    {
      id v22 = sub_1001704C4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "conversationChanged for U+1 call with avMode=video remote participant, upgrading CXCallUpdate to video=1",  buf,  2u);
      }

      -[CXCallUpdate updatePropertiesForVideo:](v90, "updatePropertiesForVideo:", 1LL);
    }

    goto LABEL_19;
  }

- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
  unsigned __int8 v10 = [v9 screenSharingDeskViewEnabled];

  if ((v10 & 1) == 0 && [v8 isScreenEnabled])
  {
    -[CSDFaceTimeConversationProviderDelegate launchScreenSharingAppIfNecessary]( self,  "launchScreenSharingAppIfNecessary");
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Conversation screen sharing changed: %@ \n participant: %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationsByUUID]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);
    unsigned int v12 = [v11 isDefaultProvider];
  }

  else
  {
    unsigned int v12 = 1;
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  unsigned int v13 = -[CSDAbstractFaceTimeConversationProviderDelegate isManagingCallWithUUID:](&v15, "isManagingCallWithUUID:", v4) & v12;

  return v13;
}

- (void)conversationManager:(id)a3 conversation:(id)a4 receivedMessage:(id)a5 fromHandle:(id)a6 withUpdate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v15 = a4;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  -[CSDFaceTimeConversationProviderDelegate handleMessage:forConversation:fromHandle:withUpdate:]( self,  "handleMessage:forConversation:fromHandle:withUpdate:",  v13,  v15,  v12,  v11);
}

- (void)conversationManager:(id)a3 conversation:(id)a4 failedWithContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Conversation with UUID %@ failed with context: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  -[CSDFaceTimeConversationProviderDelegate cleanUpConversationIfNecessaryForConversationUUID:failureContext:]( self,  "cleanUpConversationIfNecessaryForConversationUUID:failureContext:",  v13,  v8);
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedActiveParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationsByUUID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (!v13)
  {
    id v20 = sub_1001704C4();
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_17;
    }

    id v21 = (CXCallUpdate *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 conversationsByUUID]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allValues]);
    int v35 = 138412546;
    id v36 = v21;
    __int16 v37 = 2112;
    id v38 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Exiting addedActiveParticipant callback early since conversation with UUID %@ has been removed - current conversations are %@",  (uint8_t *)&v35,  0x16u);

LABEL_15:
    goto LABEL_16;
  }

  if ([v13 state] == (id)1)
  {
    id v14 = [v13 letMeInRequestState];
    if ([v13 isOneToOneModeEnabled])
    {
      if (v14 == (id)3)
      {
        id v15 = sub_1001704C4();
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = (CXCallUpdate *)[v13 state];
          id v18 = [v13 letMeInRequestState];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          int v35 = 134218754;
          id v36 = v17;
          __int16 v37 = 2048;
          id v38 = v18;
          __int16 v39 = 2112;
          id v40 = v19;
          __int16 v41 = 2112;
          id v42 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Not reporting a U+1 call as connecting when active participant is added since it is going through LMI flow(state %ld and LMI state %ld) and should not connect until user presses join in the staging area; conversatio"
            "n UUID %@: addedActiveParticipant %@.",
            (uint8_t *)&v35,
            0x2Au);
        }

        goto LABEL_16;
      }

      goto LABEL_10;
    }
  }

  else if ([v13 isOneToOneModeEnabled])
  {
LABEL_10:
    id v25 = sub_1001704C4();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v27 = (CXCallUpdate *)[v13 state];
      id v28 = [v13 letMeInRequestState];
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
      int v35 = 134218754;
      id v36 = v27;
      __int16 v37 = 2048;
      id v38 = v28;
      __int16 v39 = 2112;
      id v40 = v29;
      __int16 v41 = 2112;
      id v42 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Reporting call as connecting and isConversation=true since conversation (state: %ld LMI state: %ld) with UUID %@ : addedActiveParticipant %@.",  (uint8_t *)&v35,  0x2Au);
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v31]);

    id v21 = -[CXCallUpdate initWithTUConversation:]( objc_alloc(&OBJC_CLASS___CXCallUpdate),  "initWithTUConversation:",  v13);
    if (v16)
    {
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
      [v32 reportCallWithUUID:v16 updated:v21];

      if ([v13 isLocallyCreated])
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v33 providerDelegate:self callWithUUID:v16 startedConnectingAtDate:v34];
      }
    }

    goto LABEL_15;
  }

- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

  if (v8)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ending callUUID:%@ with conversation with UUID %@:",  (uint8_t *)&v13,  0x16u);
    }

    -[CSDFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  0LL,  v5);
    -[CSDAbstractFaceTimeConversationProviderDelegate setConversationUUID:forCallUUID:]( self,  "setConversationUUID:forCallUUID:",  0LL,  v8);
    -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  0LL,  v5);
    -[CSDAbstractFaceTimeConversationProviderDelegate removeActiveAudioSessionObjectForConversationWithUUID:]( self,  "removeActiveAudioSessionObjectForConversationWithUUID:",  v5);
    -[CSDAbstractFaceTimeConversationProviderDelegate updateNetworkCriticalStateIfNecessary]( self,  "updateNetworkCriticalStateIfNecessary");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v11 reportCallWithUUID:v8 endedAtDate:v12 reason:2];
  }
}

- (void)conversationManager:(id)a3 conversation:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11) {
    goto LABEL_5;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate recentlyDeletedCallUUIDsByConversationUUID]( self,  "recentlyDeletedCallUUIDsByConversationUUID"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  id v14 = sub_1001704C4();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "CallUUID: %@ is fetched from recentlyDeletedCallUUIDsByConversationUUID since the call was ended and we could not find it in callUUIDsByConversationUUID",  (uint8_t *)&v20,  0xCu);
  }

  if (v11)
  {
LABEL_5:
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate recentlyDeletedCallUUIDsByConversationUUID]( self,  "recentlyDeletedCallUUIDsByConversationUUID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    [v16 setObject:0 forKeyedSubscript:v17];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    [v18 reportCallWithUUID:v11 crossDeviceIdentifier:v19 changedBytesOfDataUsed:a5];
  }
}

- (void)conversationManager:(id)a3 reportedLetMeInRejectedForPendingConversation:(id)a4
{
  id v6 = a4;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDFaceTimeConversationProviderDelegate _failConversation:failureReason:providerEndedReason:]( self,  "_failConversation:failureReason:providerEndedReason:",  v6,  8LL,  521LL);
}

- (void)conversationManager:(id)a3 reportedInvalidLinkForPendingConversation:(id)a4
{
  id v6 = a4;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDFaceTimeConversationProviderDelegate _failConversation:failureReason:providerEndedReason:]( self,  "_failConversation:failureReason:providerEndedReason:",  v6,  9LL,  526LL);
}

- (void)_failConversation:(id)a3 failureReason:(int64_t)a4 providerEndedReason:(int64_t)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  if (v12)
  {
    -[CSDFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( self,  "leaveConversation:withCallUUID:reason:",  v8,  v12,  1LL);
    int v13 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
    -[CXCallFailureContext setFailureReason:](v13, "setFailureReason:", a4);
    -[CXCallFailureContext setProviderEndedReason:](v13, "setProviderEndedReason:", a5);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    [v14 reportCallWithUUID:v12 failedAtDate:0 withContext:v13];

    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v15 providerDelegate:self callWithUUID:v12 endedAtDate:v16 withReason:2 failureContext:0];
  }

  else
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      int v20 = 134218242;
      int64_t v21 = a4;
      __int16 v22 = 2112;
      id v23 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not fail conversation with reason %ld callUUID not found for conversation UUID %@",  (uint8_t *)&v20,  0x16u);
    }
  }
}

- (void)conversationManager:(id)a3 reportedHandedOffConversation:(id)a4 replacedByIdentifier:(unint64_t)a5 localizedHandoffRecipientDeviceCategory:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  if (v14)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 callWithCallUUID:v16]);

    [v17 setEndDueToHandoff:1];
    id v18 = -[CXCallUpdate initWithTUConversation:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithTUConversation:", v9);
    -[CXCallUpdate setLocalizedHandoffRecipientDeviceCategory:](v18, "setLocalizedHandoffRecipientDeviceCategory:", v10);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
    -[CXCallUpdate setHandoffRecipientParticipant:](v18, "setHandoffRecipientParticipant:", v19);

    -[CSDFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( self,  "leaveConversation:withCallUUID:reason:",  v9,  v14,  102LL);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    [v20 reportCallWithUUID:v14 updated:v18];

    int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v21 reportCallWithUUID:v14 endedAtDate:v22 privateReason:102];

    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate faceTimeDemuxerDelegate]( self,  "faceTimeDemuxerDelegate"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v23 providerDelegate:self callWithUUID:v14 endedAtDate:v24 withReason:102 failureContext:0];
  }

  else
  {
    id v25 = sub_1001704C4();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      int v28 = 138412290;
      id v29 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not report conversation as continued as could not find call for conversation UUID %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)conversationManager:(id)a3 reportedRemoteDoesHandedOffForConversation:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 callWithCallUUID:v11]);

    [v12 setRemoteDoesHandoff:1];
    id v13 = sub_1001704C4();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }

    int v18 = 138412290;
    __int128 v19 = v12;
    __int16 v15 = "reportedRemoteDoesHandedOffForConversation: for call: %@";
    id v16 = (os_log_s *)v14;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0xCu);
    goto LABEL_7;
  }

  id v17 = sub_1001704C4();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    int v18 = 138412290;
    __int128 v19 = v14;
    __int16 v15 = "[WARN] Could not report conversation: not find call for conversation UUID %@";
    id v16 = (os_log_s *)v12;
    goto LABEL_6;
  }

- (void)conversationManager:(id)a3 connectionDidStartForConversation:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  if (v8)
  {
    -[CSDFaceTimeConversationProviderDelegate startOutgoingOneToOneTimeoutIfNecessary:]( self,  "startOutgoingOneToOneTimeoutIfNecessary:",  v8);
  }

  else
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B79D0();
    }
  }
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 138412290;
    id v42 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Joining conversation for answer call action: %@",  (uint8_t *)&v41,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeConversationProviderDelegate blockUtilities](self, "blockUtilities"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteMembers]);
  unsigned int v17 = [v15 blockListContainsMembers:v16 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

  if (v17)
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

    if (!v20)
    {
LABEL_35:

      goto LABEL_36;
    }

    int64_t v21 = (CSDConversationJoinContext *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate blockUtilities]( self,  "blockUtilities"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
    -[CSDConversationJoinContext reportFailureForReason:provider:callUUID:actionToFail:]( v21,  "reportFailureForReason:provider:callUUID:actionToFail:",  16LL,  v22,  v20,  v5);

LABEL_34:
    goto LABEL_35;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 link]);
  if (!v23 || (id v24 = (void *)v23, v25 = TULockdownModeEnabled(), v24, !v25))
  {
    int v28 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v28 callWithCallUUID:v30]);

    if (!v14)
    {
      id v32 = sub_1001704C4();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1002B79FC();
      }

      [v5 fail];
      goto LABEL_35;
    }

    else {
      uint64_t v31 = 0LL;
    }
    int64_t v21 = objc_alloc_init(&OBJC_CLASS___CSDConversationJoinContext);
    else {
      uint64_t v34 = 0LL;
    }
    -[CSDConversationJoinContext setVideo:](v21, "setVideo:", v34);
    else {
      uint64_t v35 = 0LL;
    }
    -[CSDConversationJoinContext setVideoEnabled:](v21, "setVideoEnabled:", v35);
    if (-[CSDConversationJoinContext isVideo](v21, "isVideo")) {
      uint64_t v36 = 2LL;
    }
    else {
      uint64_t v36 = 1LL;
    }
    -[CSDConversationJoinContext setAvMode:](v21, "setAvMode:", v36);
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);
    -[CSDConversationJoinContext setProvider:](v21, "setProvider:", v37);

    -[CSDConversationJoinContext setScreening:](v21, "setScreening:", [v5 screening]);
    -[CSDConversationJoinContext setSpatialPersonaEnabled:]( v21,  "setSpatialPersonaEnabled:",  [v14 isSpatialPersonaEnabled]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags"));
    unsigned int v39 = [v38 lagunaEnabled];

    if (v39) {
      -[CSDAbstractFaceTimeConversationProviderDelegate setAudioSessionActive:](self, "setAudioSessionActive:", 1LL);
    }
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    [v40 joinExistingConversationWithUUID:v11 context:v21];

    -[CSDAbstractFaceTimeConversationProviderDelegate enqueueOrStartAudioForConversationUUID:]( self,  "enqueueOrStartAudioForConversationUUID:",  v11);
    -[CSDFaceTimeConversationProviderDelegate declineRemoteDevicesForConversation:reason:]( self,  "declineRemoteDevicesForConversation:reason:",  v14,  4LL);
    goto LABEL_34;
  }

  id v26 = sub_1001704C4();
  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1002B7A5C();
  }

  [v5 fail];
LABEL_36:
}

- (id)linkForJoinCallAction:(id)a3 inLinks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v5;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finding a matching link in join call action %@ %@",  buf,  0x16u);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v13);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pseudonym", (void)v24));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 publicKey]);
        unsigned int v17 = [v14 isEquivalentToPseudonym:v15 andPublicKey:v16];

        if (v17)
        {
          id v21 = sub_1001704C4();
          __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = v5;
            __int16 v31 = 2112;
            id v32 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Found matching link for join call action %@ %@",  buf,  0x16u);
          }

          id v20 = [v14 copy];
          __int128 v19 = (os_log_s *)v9;
          goto LABEL_17;
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v18 = sub_1001704C4();
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Couldn't find a matching link in join call action %@",  buf,  0xCu);
  }

  id v20 = 0LL;
LABEL_17:

  return v20;
}

- (id)activatedLinkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finding a matching activated link in join call action %@",  (uint8_t *)&v21,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activatedConversationLinksWithError:a4]);

  if (*a4)
  {
    id v11 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B7A88((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    }

    __int128 v19 = 0LL;
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate linkForJoinCallAction:inLinks:]( self,  "linkForJoinCallAction:inLinks:",  v6,  v10));
  }

  return v19;
}

- (id)deletedLinkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finding a matching deleted link in join call action %@",  (uint8_t *)&v23,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deletedConversationLinksWithError:a4]);

  id v11 = *a4;
  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B7AF0((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
    }

    int v21 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleted links: %@", (uint8_t *)&v23, 0xCu);
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate linkForJoinCallAction:inLinks:]( self,  "linkForJoinCallAction:inLinks:",  v6,  v10));
  }

  return v21;
}

- (id)linkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finding activated link in join call action %@",  (uint8_t *)&v23,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate activatedLinkForJoinCallAction:withError:]( self,  "activatedLinkForJoinCallAction:withError:",  v6,  a4));
  if (*a4)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B7B58((uint64_t)a4, v11, v12, v13, v14, v15, v16, v17);
    }

LABEL_7:
    id v18 = 0LL;
    goto LABEL_12;
  }

  id v19 = sub_1001704C4();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v21)
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      __int128 v26 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not find activated link for join call action %@, link: %@",  (uint8_t *)&v23,  0x16u);
    }

    goto LABEL_7;
  }

  if (v21)
  {
    int v23 = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    __int128 v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found activated link for join call action %@, link: %@",  (uint8_t *)&v23,  0x16u);
  }

  id v18 = v9;
LABEL_12:

  return v18;
}

- (id)validateLinkForJoinCallActionIfNecessary:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Validating link for join call action %@",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
  if (![v9 length])
  {

    goto LABEL_12;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKey]);
  id v11 = [v10 length];

  if (!v11)
  {
LABEL_12:
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  if (TULockdownModeEnabled())
  {
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B7A5C();
    }

    if (a4)
    {
      uint64_t v14 = 3LL;
LABEL_10:
      uint64_t v15 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.calls.callservicesd.links",  v14,  0LL));
      goto LABEL_21;
    }

- (void)performJoinCallAction:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    *(_DWORD *)buf = 138412290;
    v257 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "performJoinCallAction UUID: %@", buf, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate deviceSupport](self, "deviceSupport"));
  if ([v9 isGreenTea])
  {
    if (([v4 isVideo] & 1) == 0)
    {

      goto LABEL_19;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    id v11 = [v10 count];

    if ((unint64_t)v11 >= 2)
    {
LABEL_19:
      id v25 = sub_1001704C4();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v16 = "[WARN] GFT/FTA calls are not allowed on GreenTea devices";
        goto LABEL_21;
      }

      goto LABEL_22;
    }
  }

  else
  {
  }

  if (([v4 isValidScreenSharingRequest] & 1) != 0
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](self, "featureFlags")),
        unsigned int v13 = [v12 usesModernScreenSharingFromMessages],
        v12,
        !v13))
  {
    id v248 = 0LL;
    id v17 = (id)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate validateLinkForJoinCallActionIfNecessary:withError:]( self,  "validateLinkForJoinCallActionIfNecessary:withError:",  v4,  &v248));
    id v18 = v248;
    if (v18)
    {
      id v19 = sub_1001704C4();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1002B7D04();
      }

      id v247 = 0LL;
      BOOL v21 = (TUConversationMember *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate deletedLinkForJoinCallAction:withError:]( self,  "deletedLinkForJoinCallAction:withError:",  v4,  &v247));
      id v22 = v247;
      id v23 = sub_1001704C4();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v257 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Retrieve deleted link: %@", buf, 0xCu);
      }

      [v4 fail];
      goto LABEL_126;
    }

    if (v17)
    {
      if ([v4 isScreening])
      {
        id v26 = sub_1001704C4();
        __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[WARN] Cannot join a call with screening that is link based",  buf,  2u);
        }

        [v4 fail];
        goto LABEL_126;
      }

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v4 callUUID]);
      [v36 addPseudonym:v37 forCallUUID:v38];

      if (([v4 isJoiningConversationWithLink] & 1) == 0)
      {
        id v39 = sub_1001704C4();
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v257 = (TUConversationMember *)v4;
          __int16 v258 = 2112;
          id v259 = v17;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "letMeIn: %@, link: %@", buf, 0x16u);
        }

        int v41 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
        unsigned __int8 v43 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v41 conversationLinkForPseudonym:v42]);

        if (v43
          && -[TUConversationMember isEquivalentToConversationLink:]( v43,  "isEquivalentToConversationLink:",  v17))
        {
          id v44 = sub_1001704C4();
          __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v257 = v43;
            __int16 v258 = 2112;
            id v259 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "get resolved link: %@ for link: %@",  buf,  0x16u);
          }

          v46 = v43;
          id v17 = v46;
        }

        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
        uint64_t v49 = objc_claimAutoreleasedReturnValue([v47 pendingConversationUUIDWithPseudonym:v48]);

        v195 = (void *)v49;
        if (v49)
        {
          if (TUDisableLinks(v50, v51))
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
            unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 conversationsByUUID]);
            id v54 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v49]);

            id v55 = sub_1001704C4();
            uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v257 = v54;
              _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Joining from links is disabled by server bag value, failing pending conversation %@",  buf,  0xCu);
            }

            -[CSDFaceTimeConversationProviderDelegate _failConversation:failureReason:providerEndedReason:]( self,  "_failConversation:failureReason:providerEndedReason:",  v54,  10LL,  527LL);
            v57 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
            [v57 removeAllPendingConversations];
LABEL_48:

            [v4 fail];
LABEL_123:

LABEL_124:
            goto LABEL_125;
          }

          if ([v4 isLetMeIn])
          {
            id v122 = sub_1001704C4();
            v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              v124 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
              *(_DWORD *)buf = 138412290;
              v257 = v124;
              _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "LMI: Asking CSDConversationManager to request let me in approval for pseudonym: %@",  buf,  0xCu);
            }

            v125 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
            v126 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
            [v125 requestLetMeInApprovalForPseudonym:v126];
          }

          id v127 = sub_1001704C4();
          v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v257 = (TUConversationMember *)v49;
            _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "Use existing pendingConversationUUID: %@",  buf,  0xCu);
          }

          v129 = (void *)objc_claimAutoreleasedReturnValue([v4 callUUID]);
          v130 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
          [v130 setObject:v129 forKeyedSubscript:v49];

          [v4 fulfill];
        }

        else if ([v17 canCreateConversations])
        {
          __int128 v100 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          [v100 removeAllPendingConversations];

          __int128 v101 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          __int128 v102 = (void *)objc_claimAutoreleasedReturnValue([v101 conversationsByGroupUUID]);
          v103 = (void *)objc_claimAutoreleasedReturnValue([v17 groupUUID]);
          id v54 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v102 objectForKeyedSubscript:v103]);

          v202 = self;
          if (v54)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationMember link](v54, "link"));
            unsigned int v105 = [v104 isEquivalentToConversationLink:v17];

            if (v105)
            {
              if ((-[TUConversationMember isLocallyCreated](v54, "isLocallyCreated") & 1) != 0
                || (v106 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationMember initiator](v54, "initiator")),
                    v107 = (void *)objc_claimAutoreleasedReturnValue([v17 originatorHandle]),
                    unsigned __int8 v108 = [v106 isEquivalentToHandle:v107],
                    v107,
                    v106,
                    (v108 & 1) != 0))
              {
LABEL_183:
                id v180 = sub_1001704C4();
                v181 = (os_log_s *)objc_claimAutoreleasedReturnValue(v180);
                if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v257 = v54;
                  _os_log_impl( (void *)&_mh_execute_header,  v181,  OS_LOG_TYPE_DEFAULT,  "canUseExistingConversation, proceedToJoinForConversation: %@",  buf,  0xCu);
                }

                -[CSDAbstractFaceTimeConversationProviderDelegate proceedToJoinForConversation:action:]( v202,  "proceedToJoinForConversation:action:",  v54,  v4);
                [v4 fulfill];
              }

              else
              {
                __int128 v245 = 0u;
                __int128 v246 = 0u;
                __int128 v243 = 0u;
                __int128 v244 = 0u;
                v199 = v17;
                v109 = (void *)objc_claimAutoreleasedReturnValue([v17 invitedMemberHandles]);
                id v110 = [v109 countByEnumeratingWithState:&v243 objects:v264 count:16];
                if (v110)
                {
                  id v111 = v110;
                  uint64_t v112 = *(void *)v244;
                  while (2)
                  {
                    for (i = 0LL; i != v111; i = (char *)i + 1)
                    {
                      if (*(void *)v244 != v112) {
                        objc_enumerationMutation(v109);
                      }
                      uint64_t v114 = *(void *)(*((void *)&v243 + 1) + 8LL * (void)i);
                      v115 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationMember initiator](v54, "initiator"));
                      LOBYTE(v114) = [v115 isEquivalentToHandle:v114];

                      if ((v114 & 1) != 0)
                      {

                        id v17 = v199;
                        goto LABEL_183;
                      }
                    }

                    id v111 = [v109 countByEnumeratingWithState:&v243 objects:v264 count:16];
                    if (v111) {
                      continue;
                    }
                    break;
                  }
                }

                id v116 = sub_1001704C4();
                v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
                id v17 = v199;
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                {
                  v118 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationMember initiator](v54, "initiator"));
                  v119 = (void *)objc_claimAutoreleasedReturnValue([v118 value]);
                  v120 = (void *)objc_claimAutoreleasedReturnValue([v199 originatorHandle]);
                  v121 = (void *)objc_claimAutoreleasedReturnValue([v199 invitedMemberHandles]);
                  *(_DWORD *)buf = 138413058;
                  v257 = v54;
                  __int16 v258 = 2112;
                  id v259 = v119;
                  __int16 v260 = 2112;
                  v261 = v120;
                  __int16 v262 = 2112;
                  v263 = v121;
                  _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "Can't use existing conversation %@ because its initiator %@ is not us, not the link creator %@, and not an invited handle to the link %@. Falling back to LMI request/response flow.",  buf,  0x2Au);
                }

                -[CSDFaceTimeConversationProviderDelegate proceedToNewPendingConversationForLink:action:]( v202,  "proceedToNewPendingConversationForLink:action:",  v199,  v4);
              }

              goto LABEL_123;
            }

            id v137 = sub_1001704C4();
            v57 = (void *)objc_claimAutoreleasedReturnValue(v137);
            if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR)) {
              sub_1002B7C4C(v54, (uint64_t)v17, (os_log_s *)v57);
            }
            goto LABEL_48;
          }

          v132 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          v133 = (void *)objc_claimAutoreleasedReturnValue([v17 originatorHandle]);
          unsigned int v134 = [v132 isValidLocalHandle:v133];

          if (v134)
          {
            v135 = (void *)objc_claimAutoreleasedReturnValue([v17 originatorHandle]);
            id v136 = [v135 copy];
          }

          else
          {
            id v136 = 0LL;
          }

          v194 = v43;
          v197 = v4;
          v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          __int128 v239 = 0u;
          __int128 v240 = 0u;
          __int128 v241 = 0u;
          __int128 v242 = 0u;
          id v200 = v17;
          v139 = (void *)objc_claimAutoreleasedReturnValue([v17 invitedMemberHandles]);
          id v140 = [v139 countByEnumeratingWithState:&v239 objects:v255 count:16];
          if (v140)
          {
            id v141 = v140;
            uint64_t v142 = *(void *)v240;
            do
            {
              for (j = 0LL; j != v141; j = (char *)j + 1)
              {
                if (*(void *)v240 != v142) {
                  objc_enumerationMutation(v139);
                }
                v144 = *(void **)(*((void *)&v239 + 1) + 8LL * (void)j);
                if (!v136)
                {
                  v145 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( v202,  "conversationManager"));
                  unsigned int v146 = [v145 isValidLocalHandle:v144];

                  if (v146) {
                    id v136 = [v144 copy];
                  }
                  else {
                    id v136 = 0LL;
                  }
                }

                v147 = -[TUConversationMember initWithHandle:nickname:]( objc_alloc(&OBJC_CLASS___TUConversationMember),  "initWithHandle:nickname:",  v144,  0LL);
                [v138 addObject:v147];
              }

              id v141 = [v139 countByEnumeratingWithState:&v239 objects:v255 count:16];
            }

            while (v141);
          }

          if (([v17 isLocallyCreated] & 1) == 0)
          {
            v148 = objc_alloc(&OBJC_CLASS___TUConversationMember);
            v149 = (void *)objc_claimAutoreleasedReturnValue([v17 originatorHandle]);
            v150 = -[TUConversationMember initWithHandle:nickname:](v148, "initWithHandle:nickname:", v149, 0LL);
            [v138 addObject:v150];
          }

          id v4 = v197;
          unsigned __int8 v43 = v194;
          if (v136)
          {
            id v192 = v136;
            v151 = (void *)objc_claimAutoreleasedReturnValue([v197 otherInvitedHandles]);
            id objb = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v151 count]));

            __int128 v237 = 0u;
            __int128 v238 = 0u;
            __int128 v235 = 0u;
            __int128 v236 = 0u;
            v152 = (void *)objc_claimAutoreleasedReturnValue([v197 otherInvitedHandles]);
            id v153 = [v152 countByEnumeratingWithState:&v235 objects:v254 count:16];
            if (v153)
            {
              id v154 = v153;
              uint64_t v155 = *(void *)v236;
              do
              {
                for (k = 0LL; k != v154; k = (char *)k + 1)
                {
                  if (*(void *)v236 != v155) {
                    objc_enumerationMutation(v152);
                  }
                  if (v157) {
                    [objb addObject:v157];
                  }
                }

                id v154 = [v152 countByEnumeratingWithState:&v235 objects:v254 count:16];
              }

              while (v154);
            }

            __int128 v233 = 0u;
            __int128 v234 = 0u;
            __int128 v231 = 0u;
            __int128 v232 = 0u;
            v203 = (void *)objc_claimAutoreleasedReturnValue([v197 remoteMembers]);
            id v208 = [v203 countByEnumeratingWithState:&v231 objects:v253 count:16];
            if (v208)
            {
              uint64_t v205 = *(void *)v232;
              do
              {
                for (m = 0LL; m != v208; m = (char *)m + 1)
                {
                  if (*(void *)v232 != v205) {
                    objc_enumerationMutation(v203);
                  }
                  v159 = *(void **)(*((void *)&v231 + 1) + 8LL * (void)m);
                  __int128 v227 = 0u;
                  __int128 v228 = 0u;
                  __int128 v229 = 0u;
                  __int128 v230 = 0u;
                  id v160 = objb;
                  id v161 = [v160 countByEnumeratingWithState:&v227 objects:v252 count:16];
                  if (v161)
                  {
                    id v162 = v161;
                    uint64_t v163 = *(void *)v228;
                    do
                    {
                      for (n = 0LL; n != v162; n = (char *)n + 1)
                      {
                        if (*(void *)v228 != v163) {
                          objc_enumerationMutation(v160);
                        }
                        uint64_t v165 = *(void *)(*((void *)&v227 + 1) + 8LL * (void)n);
                        v166 = (void *)objc_claimAutoreleasedReturnValue([v159 tuHandle]);
                        LODWORD(v165) = [v166 isEquivalentToHandle:v165];

                        if ((_DWORD)v165)
                        {
                          v167 = objc_alloc(&OBJC_CLASS___TUConversationMember);
                          v168 = (void *)objc_claimAutoreleasedReturnValue([v159 tuHandle]);
                          v169 = -[TUConversationMember initWithHandle:nickname:]( v167,  "initWithHandle:nickname:",  v168,  0LL);

                          -[TUConversationMember setIsOtherInvitedHandle:](v169, "setIsOtherInvitedHandle:", 1LL);
                          [v138 addObject:v169];
                        }
                      }

                      id v162 = [v160 countByEnumeratingWithState:&v227 objects:v252 count:16];
                    }

                    while (v162);
                  }
                }

                id v208 = [v203 countByEnumeratingWithState:&v231 objects:v253 count:16];
              }

              while (v208);
            }

            v170 = -[TUConversationMember initWithHandle:]( objc_alloc(&OBJC_CLASS___TUConversationMember),  "initWithHandle:",  v192);
            v171 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](v202, "featureFlags"));
            if ([v171 avLessSharePlayEnabled])
            {
              id v4 = v197;
              uint64_t v172 = (uint64_t)[v197 avMode];

              v173 = v200;
              if (v172) {
                id v174 = 0LL;
              }
              else {
                id v174 = [v197 presentationMode];
              }
            }

            else
            {
              id v4 = v197;
              else {
                uint64_t v172 = 1LL;
              }

              id v174 = 0LL;
              v173 = v200;
            }

            v182 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( v202,  "conversationManager"));
            v183 = (void *)objc_claimAutoreleasedReturnValue([v173 groupUUID]);
            v184 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationProvider faceTimeProvider]( &OBJC_CLASS___TUConversationProvider,  "faceTimeProvider"));
            v185 = (void *)objc_claimAutoreleasedReturnValue( [v182 findOrCreateConversationWithGroupUUID:v183 messagesGroupUUID:0 remoteMembers:v138 otherInvitedHandles :objb localMember:v170 remotePushTokens:0 link:v173 activity:0 avMode:v172 presentationMode:v174 conversationProvider:v184  screenSharingRequest:0]);

            if (v185)
            {
              -[CSDAbstractFaceTimeConversationProviderDelegate proceedToJoinForConversation:action:]( v202,  "proceedToJoinForConversation:action:",  v185,  v4);
              v186 = (void *)objc_claimAutoreleasedReturnValue([v185 link]);
              unsigned __int8 v187 = [v173 isEqual:v186];

              id v17 = v173;
              id v136 = v192;
              if ((v187 & 1) != 0)
              {
                int v179 = 0;
              }

              else
              {
                id v188 = sub_1001704C4();
                v189 = (os_log_s *)objc_claimAutoreleasedReturnValue(v188);
                if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                {
                  v190 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v185 link]);
                  *(_DWORD *)buf = 138412546;
                  v257 = v190;
                  __int16 v258 = 2112;
                  id v259 = v173;
                  _os_log_impl( (void *)&_mh_execute_header,  v189,  OS_LOG_TYPE_DEFAULT,  "Use %@ instead of link: %@ for renewal",  buf,  0x16u);
                }

                uint64_t v191 = objc_claimAutoreleasedReturnValue([v185 link]);
                int v179 = 0;
                id v17 = (id)v191;
              }
            }

            else
            {
              [v4 fail];
              int v179 = 1;
              id v17 = v173;
              id v136 = v192;
            }

            unsigned __int8 v43 = v194;
          }

          else
          {
            id v175 = sub_1001704C4();
            v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
            if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
            {
              v177 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v17 originatorHandle]);
              v178 = (void *)objc_claimAutoreleasedReturnValue([v17 invitedMemberHandles]);
              *(_DWORD *)buf = 138412546;
              v257 = v177;
              __int16 v258 = 2112;
              id v259 = v178;
              _os_log_impl( (void *)&_mh_execute_header,  v176,  OS_LOG_TYPE_DEFAULT,  "Even though we have the information needed to create a conversation with this link, none of our currentl y active handles are the link creator %@ or one of the invited handles %@. Falling back to LMI request/response flow.",  buf,  0x16u);
            }

            -[CSDFaceTimeConversationProviderDelegate proceedToNewPendingConversationForLink:action:]( v202,  "proceedToNewPendingConversationForLink:action:",  v17,  v197);
            int v179 = 1;
          }

          self = v202;
          if (v179) {
            goto LABEL_124;
          }
        }

        else
        {
          -[CSDFaceTimeConversationProviderDelegate proceedToNewPendingConversationForLink:action:]( self,  "proceedToNewPendingConversationForLink:action:",  v17,  v4);
        }

        v131 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        v225[0] = _NSConcreteStackBlock;
        v225[1] = 3221225472LL;
        v225[2] = sub_10014BE80;
        v225[3] = &unk_1003DB190;
        id v17 = v17;
        v226 = (TUConversationMember *)v17;
        [v131 renewLinkIfNeeded:v17 completionHandler:v225];

        id v54 = v226;
        goto LABEL_123;
      }
    }

    else
    {
      int v28 = (void *)objc_claimAutoreleasedReturnValue([v4 pseudonym]);
      if ([v28 length])
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 publicKey]);
        id v30 = [v29 length];

        if (v30)
        {
          id v31 = sub_1001704C4();
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_1002B7C20();
          }

          id v224 = 0LL;
          id v33 = (TUConversationMember *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate deletedLinkForJoinCallAction:withError:]( self,  "deletedLinkForJoinCallAction:withError:",  v4,  &v224));
          id v17 = v224;
          id v34 = sub_1001704C4();
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v257 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Deleted link: %@", buf, 0xCu);
          }

          [v4 fail];
          goto LABEL_126;
        }
      }

      else
      {
      }
    }

    v201 = self;
    id v198 = v17;
    id v58 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    v204 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v58 count]));

    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v4 otherInvitedHandles]);
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v59 count]));

    id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v220 = 0u;
    __int128 v221 = 0u;
    __int128 v222 = 0u;
    __int128 v223 = 0u;
    v196 = v4;
    id obj = (id)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    id v62 = [obj countByEnumeratingWithState:&v220 objects:v251 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v221;
      do
      {
        id v65 = 0LL;
        id v206 = v63;
        do
        {
          if (*(void *)v221 != v64) {
            objc_enumerationMutation(obj);
          }
          unsigned int v66 = (TUConversationMember *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v220 + 1)
                                                                                             + 8LL * (void)v65), "tuHandle"));
          if ([v61 containsObject:v66])
          {
            id v67 = sub_1001704C4();
            id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v257 = v66;
              __int16 v258 = 2112;
              id v259 = v61;
              _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "[WARN] Skipping member with handle %@ because it already exists in seen handles: %@",  buf,  0x16u);
            }
          }

          else
          {
            v69 = v61;
            id v68 = -[TUConversationMember initWithHandle:nickname:]( objc_alloc(&OBJC_CLASS___TUConversationMember),  "initWithHandle:nickname:",  v66,  0LL);
            __int128 v216 = 0u;
            __int128 v217 = 0u;
            __int128 v218 = 0u;
            __int128 v219 = 0u;
            v70 = v60;
            id v71 = v60;
            id v72 = [v71 countByEnumeratingWithState:&v216 objects:v250 count:16];
            if (v72)
            {
              id v73 = v72;
              uint64_t v74 = *(void *)v217;
              do
              {
                for (ii = 0LL; ii != v73; ii = (char *)ii + 1)
                {
                  if (*(void *)v217 != v74) {
                    objc_enumerationMutation(v71);
                  }
                  if ([*(id *)(*((void *)&v216 + 1) + 8 * (void)ii) isEquivalentToHandle:v66]) {
                    -[os_log_s setIsOtherInvitedHandle:](v68, "setIsOtherInvitedHandle:", 1LL);
                  }
                }

                id v73 = [v71 countByEnumeratingWithState:&v216 objects:v250 count:16];
              }

              while (v73);
            }

            [v204 addObject:v68];
            id v61 = v69;
            [v69 addObject:v66];
            v60 = v70;
            id v63 = v206;
          }

          id v65 = (char *)v65 + 1;
        }

        while (v65 != v63);
        id v63 = [obj countByEnumeratingWithState:&v220 objects:v251 count:16];
      }

      while (v63);
    }

    __int128 v214 = 0u;
    __int128 v215 = 0u;
    __int128 v212 = 0u;
    __int128 v213 = 0u;
    id v4 = v196;
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v196 otherInvitedHandles]);
    id v77 = [v76 countByEnumeratingWithState:&v212 objects:v249 count:16];
    if (v77)
    {
      id v78 = v77;
      uint64_t v79 = *(void *)v213;
      do
      {
        for (jj = 0LL; jj != v78; jj = (char *)jj + 1)
        {
          if (*(void *)v213 != v79) {
            objc_enumerationMutation(v76);
          }
          id v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v212 + 1) + 8 * (void)jj) tuHandle]);
          [v60 addObject:v81];
        }

        id v78 = [v76 countByEnumeratingWithState:&v212 objects:v249 count:16];
      }

      while (v78);
    }

    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v196 joinCallActivity]);
    v83 = (void *)objc_claimAutoreleasedReturnValue([v82 tuActivity]);

    if (!v204)
    {
      [v196 fail];
      id v17 = v198;
LABEL_97:

LABEL_125:
      id v18 = 0LL;
LABEL_126:

      goto LABEL_127;
    }

    v84 = (void *)objc_claimAutoreleasedReturnValue([v196 callerID]);
    if (v84)
    {
      v85 = objc_alloc(&OBJC_CLASS___TUConversationMember);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v196 callerID]);
      v87 = (void *)objc_claimAutoreleasedReturnValue([v86 tuHandle]);
      obja = -[TUConversationMember initWithHandle:nickname:](v85, "initWithHandle:nickname:", v87, 0LL);
    }

    else
    {
      obja = 0LL;
    }

    id v88 = sub_1001704C4();
    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue([v196 callerID]);
      *(_DWORD *)buf = 138412546;
      v257 = obja;
      __int16 v258 = 2112;
      id v259 = v90;
      _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "localMember: %@, action.callerID: %@",  buf,  0x16u);
    }

    __int128 v91 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate featureFlags](v201, "featureFlags"));
    v193 = v61;
    if ([v91 avLessSharePlayEnabled])
    {
      uint64_t v92 = (uint64_t)[v196 avMode];

      if (!v92)
      {
        id v207 = [v196 presentationMode];
LABEL_92:
        __int128 v93 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( v201,  "conversationManager"));
        __int128 v94 = (void *)objc_claimAutoreleasedReturnValue([v196 groupUUID]);
        __int128 v95 = (void *)objc_claimAutoreleasedReturnValue([v196 messagesGroupUUID]);
        __int128 v96 = (void *)objc_claimAutoreleasedReturnValue([v196 remotePushTokens]);
        __int128 v97 = (void *)objc_claimAutoreleasedReturnValue([v196 conversationProviderIdentifier]);
        __int128 v98 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationProvider providerForIdentifier:]( &OBJC_CLASS___TUConversationProvider,  "providerForIdentifier:",  v97));
        __int128 v99 = (void *)objc_claimAutoreleasedReturnValue( [v93 findOrCreateConversationWithGroupUUID:v94 messagesGroupUUID:v95 remoteMembers:v204 otherInvitedHandles:v60 loca lMember:obja remotePushTokens:v96 link:v198 activity:v83 avMode:v92 presentationMode:v207 conversationProvider:v98 screenSharingRequest:0]);

        if (v99)
        {
          -[CSDAbstractFaceTimeConversationProviderDelegate proceedToJoinForConversation:action:]( v201,  "proceedToJoinForConversation:action:",  v99,  v196);
          id v4 = v196;
          id v61 = v193;
          if (![v196 avMode]) {
            -[CSDFaceTimeConversationProviderDelegate declineRemoteDevicesForConversation:reason:]( v201,  "declineRemoteDevicesForConversation:reason:",  v99,  4LL);
          }
        }

        else
        {
          [v196 fail];
          id v4 = v196;
          id v61 = v193;
        }

        id v17 = v198;
        goto LABEL_97;
      }
    }

    else
    {
      else {
        uint64_t v92 = 1LL;
      }
    }

    id v207 = 0LL;
    goto LABEL_92;
  }

  id v14 = sub_1001704C4();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v16 = "[WARN] Failing join call action because it is not a valid request to screen share";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
  }

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
}

- (void)proceedToNewPendingConversationForLink:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  [v8 removeAllPendingConversations];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeApprovedConversationWithLink:v6]);

  if (v10)
  {
    -[CSDAbstractFaceTimeConversationProviderDelegate proceedToJoinForConversation:action:]( self,  "proceedToJoinForConversation:action:",  v10,  v7);
    [v7 fulfill];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v12 = objc_alloc(&OBJC_CLASS___TUConversationMember);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 callerID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tuHandle]);
    uint64_t v15 = -[TUConversationMember initWithHandle:nickname:](v12, "initWithHandle:nickname:", v14, 0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "initiatePendingConversationForLink:localMember:isVideoEnabled:",  v6,  v15,  objc_msgSend(v7, "isVideoEnabled")));

    if (v16)
    {
      [v7 fulfill];
      id v17 = -[CXCallUpdate initWithTUConversation:]( objc_alloc(&OBJC_CLASS___CXCallUpdate),  "initWithTUConversation:",  v16);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallUpdate localSenderIdentityUUID](v17, "localSenderIdentityUUID"));

      if (!v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 initiator]);
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v19 senderIdentityUUIDForCallerIDHandle:v20]);
        -[CXCallUpdate setLocalSenderIdentityUUID:](v17, "setLocalSenderIdentityUUID:", v21);
      }

      id v22 = sub_1001704C4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
        int v30 = 138412546;
        id v31 = v24;
        __int16 v32 = 2112;
        id v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "LMI: Reporting LMI call with UUID: %@ update: %@",  (uint8_t *)&v30,  0x16u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);
      [v26 setObject:v25 forKeyedSubscript:v27];

      int v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate provider](self, "provider"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v7 callUUID]);
      [v28 reportCallWithUUID:v29 updated:v17];
    }

    else
    {
      [v7 fail];
    }
  }
}

- (id)_findPendingConversationWithCallUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pseudonymsByCallUUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conversationsByUUID]);
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "pseudonymsByCallUUID: %@, conversationsByUUID: %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonymsByCallUUID]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v4]);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationsByUUID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);

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
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if ([v20 isPendingConversation])
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 link]);
          if (v21)
          {
            id v22 = (void *)v21;
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 link]);
            unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pseudonym]);
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

- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( &v10,  "leaveConversationForCallUUID:endedReason:",  v6,  a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  -[CSDFaceTimeConversationProviderDelegate setWaitingForRemoteJoin:forConversationUUID:]( self,  "setWaitingForRemoteJoin:forConversationUUID:",  0LL,  v9);
}

- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CSDFaceTimeConversationProviderDelegate;
  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( &v30,  "leaveConversation:withCallUUID:reason:",  v8,  v9,  a5);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 link]);
  if (v10)
  {
    id v11 = (void *)v10;
    unsigned int v12 = [v8 isPendingConversation];

    if (v12)
    {
      id v13 = sub_1001704C4();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 link]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pseudonym]);
        *(_DWORD *)buf = 138412546;
        __int16 v32 = v16;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removing pending conversation with pseudonym %@ and callUUID %@",  buf,  0x16u);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 link]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pseudonym]);
      id v20 = [v17 removePendingConversationWithPseudonym:v19];

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 link]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pseudonym]);
      [v21 removePseudonym:v23 forCallUUID:v9];

      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      [v24 notifyDelegatesOfRemovedConversationWithUUID:v25];
    }
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  -[CSDFaceTimeConversationProviderDelegate setCallUUID:forConversationUUID:]( self,  "setCallUUID:forConversationUUID:",  0LL,  v26);

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  -[CSDAbstractFaceTimeConversationProviderDelegate setWaitingToJoin:forConversationUUID:]( self,  "setWaitingToJoin:forConversationUUID:",  0LL,  v27);

  if ([v8 state])
  {
    if ([v8 state] == (id)2)
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteMembers]);
      id v29 = [v28 count];

      if (a5 == 4 && v29 == (id)1) {
        -[CSDFaceTimeConversationProviderDelegate declineRemoteMembersForConversation:reason:]( self,  "declineRemoteMembersForConversation:reason:",  v8,  4LL);
      }
    }
  }

  else
  {
    -[CSDFaceTimeConversationProviderDelegate declineRemoteDevicesForConversation:reason:]( self,  "declineRemoteDevicesForConversation:reason:",  v8,  a5);
  }
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v20, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (([v14 isVideo] & 1) == 0
    && [v14 state] == (id)3
    && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteMembers]),
        id v16 = [v15 count],
        v15,
        v16 == (id)1))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_msgSend(v17, "setAudioPaused:forConversationWithUUID:", objc_msgSend(v5, "isOnHold"), v11);
  }

  else
  {
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1002B7DC4();
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138412290;
    id v46 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v45, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if ([v5 isSendingVideo]
    && (+[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo") & 1) == 0)
  {
    id v26 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Cannot enable video because conversations do not allow video on this device",  (uint8_t *)&v45,  2u);
    }

    goto LABEL_21;
  }

  if (![v5 isSendingVideo]
    || ![v14 isOneToOneModeEnabled]
    || ([v14 isVideo] & 1) != 0
    || ![v14 avMode])
  {
    if ([v5 isSendingVideo])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      unsigned int v18 = [v17 isConversationWithUUIDRedirectingAudio:v11];

      if (v18)
      {
        id v19 = sub_1001704C4();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1002B7E24();
        }
        goto LABEL_21;
      }
    }

    if (v14)
    {
      unsigned __int8 v20 = [v14 isOneToOneModeEnabled];
      unsigned int v21 = [v5 isSendingVideo];
      unsigned int v22 = v21;
      if ((v20 & 1) != 0)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        id v24 = [v5 isSendingVideo];
        if (v22)
        {
          [v23 setVideoEnabled:v24 forConversationWithUUID:v11];

          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          uint64_t v25 = [v5 isSendingVideo] ^ 1;
        }

        else
        {
          uint64_t v25 = v24 ^ 1;
        }

        id v38 = v23;
      }

      else
      {
        if (v21 && ([v14 isVideo] & 1) == 0)
        {
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          objc_msgSend(v32, "setVideo:forConversationWithUUID:", objc_msgSend(v5, "isSendingVideo"), v11);
        }

        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        objc_msgSend(v33, "setVideoEnabled:forConversationWithUUID:", objc_msgSend(v5, "isSendingVideo"), v11);

        id v34 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        unsigned int v35 = [v34 presentationStateForConversationWithUUID:v11];

        id v36 = sub_1001704C4();
        __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v45 = 67109120;
          LODWORD(v46) = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Group conversation has presentation state %d so requesting to unpause video",  (uint8_t *)&v45,  8u);
        }

        id v38 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        id v23 = v38;
        uint64_t v25 = 0LL;
      }

      [v38 setVideoPaused:v25 forConversationWithUUID:v11];
    }

    else
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      unsigned int v28 = -[CSDAbstractFaceTimeConversationProviderDelegate isManagingPendingConversationForCallWithUUID:]( self,  "isManagingPendingConversationForCallWithUUID:",  v27);

      if (!v28)
      {
        id v39 = sub_1001704C4();
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
          unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 conversationsByUUID]);
          int v45 = 138412802;
          id v46 = v41;
          __int16 v47 = 2112;
          __int128 v48 = v42;
          __int16 v49 = 2112;
          uint64_t v50 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for sendingVideo call UUID %@. self.conversationUUIDsByCallUUID: %@ self. conversationManager.conversationsByUUID: %@",  (uint8_t *)&v45,  0x20u);
        }

        goto LABEL_22;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v29 = [v5 isSendingVideo];
      objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate pendingConversationUUIDForCallWithUUID:]( self,  "pendingConversationUUIDForCallWithUUID:",  v30));
      [v23 setVideoEnabled:v29 forPendingConversationWithUUID:v31];
    }

LABEL_40:
    [v5 fulfill];
    goto LABEL_41;
  }

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1002B7E50();
  }
LABEL_21:

LABEL_22:
  [v5 fail];
LABEL_41:
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 138412290;
    id v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v41, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (!v14)
  {
    id v30 = sub_1001704C4();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 conversationsByUUID]);
      int v41 = 138412802;
      id v42 = v32;
      __int16 v43 = 2112;
      id v44 = v33;
      __int16 v45 = 2112;
      id v46 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for screen share call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v41,  0x20u);
    }

    goto LABEL_24;
  }

  if ([v5 isSharingScreen])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    unsigned __int8 v17 = [v16 allActiveConversationParticipantsSupportSharePlay];

    if ((v17 & 1) != 0)
    {
      unsigned int v18 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeConversationProviderDelegate allowsScreenSharingBlock]( self,  "allowsScreenSharingBlock"));
      char v19 = v18[2]();

      if ((v19 & 1) != 0)
      {
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        unsigned int v21 = [v20 isConversationWithUUIDRedirectingAudio:v11];

        if (v21)
        {
          id v22 = sub_1001704C4();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1002B7EA8();
          }

          [v5 fail];
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
        unsigned __int8 v25 = [v24 isScreenSharingAvailable];

        if ((v25 & 1) != 0) {
          goto LABEL_12;
        }
        id v40 = sub_1001704C4();
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1002B7E7C();
        }
      }

      else
      {
        id v39 = sub_1001704C4();
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1002B7F08();
        }
      }
    }

    else
    {
      id v36 = sub_1001704C4();
      __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1002B7F34();
      }

      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      -[os_log_s displaySharePlayUnableToStartAlert](v38, "displaySharePlayUnableToStartAlert");
    }

LABEL_24:
    [v5 fail];
    goto LABEL_25;
  }

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v24, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 conversationsByUUID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);

  if (!v13)
  {
    id v16 = sub_1001704C4();
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      char v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 conversationsByUUID]);
      int v24 = 138412802;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = v19;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for enableVideo call action call UUID %@. self.conversationUUIDsByCallUUID: % @ self.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v24,  0x20u);
    }

    goto LABEL_13;
  }

  if ([v5 isVideoEnabled] && objc_msgSend(v13, "state") != (id)3)
  {
    id v22 = sub_1001704C4();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1002B7F60();
    }

LABEL_13:
    [v5 fail];
    goto LABEL_14;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  objc_msgSend(v14, "setVideo:forConversationWithUUID:", objc_msgSend(v5, "isVideoEnabled"), v10);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  [v15 sendVideoUpgradeMessageforConversationWithUUID:v10];

  [v5 fulfill];
LABEL_14:
}

- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v17, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  id v13 = (void *)objc_opt_class(self, v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 callScreenShareAttributesForAction:v14]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  [v16 setScreenShareAttributes:v15 forConversationWithUUID:v11];

  [v5 fulfill];
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v27, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 conversationsByUUID]);
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v11]);

  if (v17)
  {
    id v18 = [v5 videoPresentationState];
    if (([v14 isOneToOneModeEnabled] & 1) == 0)
    {
      char v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      [v19 setVideoPaused:v18 == (id)2 forConversationWithUUID:v11];
    }

    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_msgSend( v20,  "setPresentationState:forConversationWithUUID:",  -[CSDFaceTimeConversationProviderDelegate TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:]( self,  "TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:",  objc_msgSend(v5, "videoPresentationState")),  v11);

    [v5 fulfill];
  }

  else
  {
    id v21 = sub_1001704C4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      int v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 conversationsByUUID]);
      int v27 = 138412802;
      __int16 v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      __int16 v32 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for set video presentation state action call UUID %@. self.conversationUUIDsB yCallUUID: %@ self.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v27,  0x20u);
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v25, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    [v5 videoPresentationSize];
    double v17 = v16;
    [v5 videoPresentationSize];
    objc_msgSend(v15, "setPresentationRect:forConversationWithUUID:", v11, 0.0, 0.0, v17, v18);

    [v5 fulfill];
  }

  else
  {
    id v19 = sub_1001704C4();
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 conversationsByUUID]);
      int v25 = 138412802;
      __int16 v26 = v21;
      __int16 v27 = 2112;
      __int16 v28 = v22;
      __int16 v29 = 2112;
      id v30 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for set video presentation state action call UUID %@. self.conversationUUIDsB yCallUUID: %@ self.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v25,  0x20u);
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v22, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    objc_msgSend(v15, "setRelaying:forConversationWithUUID:", objc_msgSend(v5, "isRelaying"), v11);

    [v5 fulfill];
  }

  else
  {
    id v16 = sub_1001704C4();
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 conversationsByUUID]);
      int v22 = 138412802;
      id v23 = v18;
      __int16 v24 = 2112;
      int v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for relaying call action call UUID %@. self.conversationUUIDsByCallUUID: %@ s elf.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v22,  0x20u);
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v25, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 link]);

    if (!v15)
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      objc_msgSend(v24, "setScreening:forConversationWithUUID:", objc_msgSend(v5, "isScreening"), v11);

      [v5 fulfill];
      goto LABEL_13;
    }

    id v16 = sub_1001704C4();
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not starting screening on a link based conversation",  (uint8_t *)&v25,  2u);
    }
  }

  else
  {
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      int v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 conversationsByUUID]);
      int v25 = 138412802;
      id v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = v21;
      __int16 v29 = 2112;
      id v30 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for screening call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@",  (uint8_t *)&v25,  0x20u);
    }
  }

  [v5 fail];
LABEL_13:
}

- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v24, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14 && [v14 state] == (id)3 && objc_msgSend(v14, "avMode"))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
    id v16 = [v5 willInject];
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
    [v15 setAudioInjectionAllowed:v16 forConversationWithUUID:v17];

    [v5 fulfill];
  }

  else
  {
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      int v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 conversationsByUUID]);
      int v24 = 138412802;
      id v25 = v20;
      __int16 v26 = 2112;
      __int16 v27 = v21;
      __int16 v28 = 2112;
      __int16 v29 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Did not allow audio injection action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversation Manager.conversationsByUUID: %@",  (uint8_t *)&v24,  0x20u);
    }

    [v5 fail];
  }
}

- (NSMutableSet)conversationUUIDsUpgradedFromAVLess
{
  conversationUUIDsUpgradedFromAVLess = self->_conversationUUIDsUpgradedFromAVLess;
  if (!conversationUUIDsUpgradedFromAVLess)
  {
    id v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v5 = self->_conversationUUIDsUpgradedFromAVLess;
    self->_conversationUUIDsUpgradedFromAVLess = v4;

    conversationUUIDsUpgradedFromAVLess = self->_conversationUUIDsUpgradedFromAVLess;
  }

  return conversationUUIDsUpgradedFromAVLess;
}

- (BOOL)shouldHandleProvider:(id)a3
{
  if (a3) {
    return [a3 isDefaultProvider];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldHandleProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tuConversationProviderForIdentifier:v4]);

  LOBYTE(self) = -[CSDFaceTimeConversationProviderDelegate shouldHandleProvider:](self, "shouldHandleProvider:", v6);
  return (char)self;
}

- (NSMutableDictionary)recentlyDeletedCallUUIDsByConversationUUID
{
  return self->_recentlyDeletedCallUUIDsByConversationUUID;
}

- (id)allowsScreenSharingBlock
{
  return self->_allowsScreenSharingBlock;
}

- (void)setAllowsScreenSharingBlock:(id)a3
{
}

- (CSDBlockUtilitiesProtocol)blockUtilities
{
  return self->_blockUtilities;
}

- (void).cxx_destruct
{
}

@end