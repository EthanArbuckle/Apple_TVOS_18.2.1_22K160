@interface CSDIDSChat
+ (NSUUID)faceTimeAppUUID;
- (BOOL)hasSentInvitation;
- (BOOL)isConnected;
- (BOOL)isMuted;
- (BOOL)isOutgoing;
- (BOOL)isRelaying;
- (BOOL)isRemoteMomentsAvailable;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSendingAudio;
- (BOOL)isSendingAudioData;
- (BOOL)isSendingVideo;
- (BOOL)isVideo;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)shouldStartAudioPaused;
- (BOOL)shouldStartVideoPaused;
- (BOOL)shouldSuppressInCallUI;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CSDAVConference)conference;
- (CSDExternalIDSDualSession)session;
- (CSDIDSChat)initWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5;
- (CSDIDSChatDelegate)delegate;
- (CXCallFailureContext)failureContext;
- (NSArray)invitedPushTokens;
- (NSDate)dateConnected;
- (NSDate)dateEnded;
- (NSDate)dateReceivedFirstRemoteFrame;
- (NSDate)dateStartedConnecting;
- (NSDictionary)remoteInviteDictionary;
- (NSString)crossDeviceIdentifier;
- (NSString)remoteFromID;
- (NSString)sessionUUID;
- (NSUUID)UUID;
- (NSUUID)localSenderIdentityUUID;
- (NSUUID)upgradeSessionUUID;
- (RTCSecureHierarchyToken)reportingHierarchyToken;
- (TUHandle)handle;
- (id)capabilities;
- (id)conferenceCreationBlock;
- (id)initIncomingWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5 remoteInviteDictionary:(id)a6;
- (id)initOutgoingWithSession:(id)a3 UUID:(id)a4 remoteHandle:(id)a5 wantsVideo:(BOOL)a6 isRelaying:(BOOL)a7;
- (id)inviteCompletion;
- (int)deviceRole;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)spatialAudioSourceIdentifier;
- (int64_t)videoStreamToken;
- (unint64_t)initialLinkType;
- (void)_handlePushTokensInvited:(id)a3 didSendInvitation:(BOOL)a4 didCancelInvitation:(BOOL)a5;
- (void)_setDateEndedIfNecessary;
- (void)_setLocalAspectRatiosForVideoAspectRatioDescriptor:(id)a3;
- (void)answerWithVideoAspectRatioDescriptor:(id)a3;
- (void)cancelInvitationWithAnsweredElsewhere;
- (void)cancelInvitationWithDeclinedElsewhere;
- (void)cancelInvitationWithLocalHangup;
- (void)cancelOrDeclineInvitation;
- (void)conference:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 inputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 outputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 remoteMediaStalled:(BOOL)a4;
- (void)conferenceFinishedPreparing:(id)a3;
- (void)conferenceStarted:(id)a3;
- (void)end;
- (void)mutedChangedForConference:(id)a3;
- (void)prepareConference;
- (void)receivedFirstRemoteFrameForConference:(id)a3;
- (void)remoteVideoPausedForConference:(id)a3;
- (void)sendDataUnreliably:(id)a3;
- (void)sendingAudioChangedForConference:(id)a3;
- (void)session:(id)a3 endedWithReason:(int)a4;
- (void)session:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)session:(id)a3 receivedData:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4;
- (void)sessionStarted:(id)a3;
- (void)setConference:(id)a3;
- (void)setConferenceCreationBlock:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateReceivedFirstRemoteFrame:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasSentInvitation:(BOOL)a3;
- (void)setInviteCompletion:(id)a3;
- (void)setInvitedPushTokens:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setMayRequireBreakBeforeMake:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setRemoteMomentsAvailable:(BOOL)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(int)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setSendingAudioData:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setShouldStartAudioPaused:(BOOL)a3;
- (void)setShouldStartVideoPaused:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setUpgradeSessionUUID:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)startConnectionWithTransport:(id)a3;
- (void)startWithVideoAspectRatioDescriptor:(id)a3 inviteCompletion:(id)a4;
@end

@implementation CSDIDSChat

+ (NSUUID)faceTimeAppUUID
{
  if (qword_10044CEF8 != -1) {
    dispatch_once(&qword_10044CEF8, &stru_1003D8538);
  }
  return (NSUUID *)(id)qword_10044CEF0;
}

- (CSDIDSChat)initWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CSDIDSChat;
  v11 = -[CSDIDSChat init](&v20, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 queue]);
    dispatch_assert_queue_V2(v13);

    objc_storeStrong((id *)&v11->_session, a3);
    -[CSDIDSDualSession setDelegate:](v11->_session, "setDelegate:", v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v11->_handle, a4);
    v11->_video = a5;
    v16 = (RTCSecureHierarchyToken *)+[RTCReporting newHierarchyTokenFromParentToken:]( &OBJC_CLASS___RTCReporting,  "newHierarchyTokenFromParentToken:",  0LL);
    reportingHierarchyToken = v11->_reportingHierarchyToken;
    v11->_reportingHierarchyToken = v16;

    id conferenceCreationBlock = v11->_conferenceCreationBlock;
    v11->_id conferenceCreationBlock = &stru_1003D8578;
  }

  return v11;
}

- (id)initIncomingWithSession:(id)a3 remoteHandle:(id)a4 wantsVideo:(BOOL)a5 remoteInviteDictionary:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  v13 = -[CSDIDSChat initWithSession:remoteHandle:wantsVideo:]( self,  "initWithSession:remoteHandle:wantsVideo:",  v11,  a4,  v7);
  if (v13)
  {
    if ([v11 isInitiator])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v16 handleFailureInMethod:a2, v13, @"CSDIDSChat.m", 107, @"Cannot create an incoming chat with an outgoing session: %@", v11 object file lineNumber description];
    }

    objc_storeStrong((id *)&v13->_remoteInviteDictionary, a6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
    [v14 createOneToOneFTReportingSessionForCallWithUUID:v13->_UUID withReportingHierarchyToken:v13->_reportingHierarchyToken withVideo:v7];
  }

  return v13;
}

- (id)initOutgoingWithSession:(id)a3 UUID:(id)a4 remoteHandle:(id)a5 wantsVideo:(BOOL)a6 isRelaying:(BOOL)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  v15 = -[CSDIDSChat initWithSession:remoteHandle:wantsVideo:]( self,  "initWithSession:remoteHandle:wantsVideo:",  v13,  a5,  v8);
  if (v15)
  {
    if (([v13 isInitiator] & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v18 handleFailureInMethod:a2, v15, @"CSDIDSChat.m", 118, @"Cannot create an outgoing chat with an incoming session: %@", v13 object file lineNumber description];
    }

    v15->_outgoing = 1;
    objc_storeStrong((id *)&v15->_UUID, a4);
    v15->_relaying = a7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
    [v16 createOneToOneFTReportingSessionForCallWithUUID:v15->_UUID withReportingHierarchyToken:v15->_reportingHierarchyToken withVideo:v8];
  }

  return v15;
}

- (NSString)sessionUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);

  return (NSString *)v3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (int64_t)videoStreamToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  id v3 = [v2 callID];

  return (int64_t)v3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)spatialAudioSourceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  id v3 = [v2 callID];

  return (int64_t)v3;
}

- (NSDate)dateStartedConnecting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dateStartedConnecting]);

  return (NSDate *)v3;
}

- (NSDate)dateConnected
{
  if (-[CSDIDSChat isVideo](self, "isVideo"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat dateReceivedFirstRemoteFrame](self, "dateReceivedFirstRemoteFrame"));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 dateConnected]);
  }

  return (NSDate *)v3;
}

- (BOOL)isConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (int64_t)endedReason
{
  if (-[CSDIDSChat hasSentInvitation](self, "hasSentInvitation"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat invitedPushTokens](self, "invitedPushTokens"));
    id v4 = [v3 count];

    if (!v4)
    {
      id v13 = sub_1001704C4();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        uint64_t v28 = (uint64_t)self;
        id v10 = "Setting disconnected reason to call failed because invitation was sent but no push tokens were available t"
              "o receive the invitation for call %@";
        id v11 = v9;
        uint32_t v12 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v27, v12);
      }

      goto LABEL_17;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  unsigned int v6 = [v5 endedReason];

  uint64_t v7 = v6;
  switch(v6)
  {
    case 0u:
      goto LABEL_13;
    case 1u:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dateStartedConnecting]);

      if (!v17)
      {
        id v25 = sub_1001704C4();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 134217984;
          uint64_t v28 = 1LL;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Using call ended reason remote ended because CSDIDSDualSession ended reason is %ld",  (uint8_t *)&v27,  0xCu);
        }

        goto LABEL_33;
      }

- (CXCallFailureContext)failureContext
{
  if (-[CSDIDSChat hasSentInvitation](self, "hasSentInvitation"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat invitedPushTokens](self, "invitedPushTokens"));
    id v4 = [v3 count];

    if (!v4)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      uint64_t v7 = v11;
      uint64_t v12 = 1LL;
      goto LABEL_11;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  unsigned int v6 = [v5 endedReason];

  if (v6 != 6)
  {
    uint64_t v7 = (CXCallFailureContext *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));

    if (!v7) {
      return v7;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    id v10 = [v9 endedReason];

    if (v10 == (id)6)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      uint64_t v7 = v11;
      uint64_t v12 = 5LL;
    }

    else
    {
      if (v10 != (id)7)
      {
        uint64_t v7 = 0LL;
        return v7;
      }

      id v11 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      uint64_t v7 = v11;
      uint64_t v12 = 4LL;
    }

- (NSString)crossDeviceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);

  return (NSString *)v3;
}

- (NSString)remoteFromID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteFromID]);

  return (NSString *)v3;
}

- (unint64_t)initialLinkType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  id v3 = [v2 initialLinkType];

  return (unint64_t)v3;
}

- (void)_setDateEndedIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat dateEnded](self, "dateEnded"));

  if (v3) {
    return;
  }
  if (-[CSDIDSChat hasSentInvitation](self, "hasSentInvitation"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat invitedPushTokens](self, "invitedPushTokens"));
    id v5 = [v4 count];

    if (!v5)
    {
LABEL_9:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[CSDIDSChat setDateEnded:](self, "setDateEnded:", v9);
      goto LABEL_10;
    }
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));

  if (!v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));

    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    unsigned int v13 = [v12 state];

    if (v13 != 5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  unsigned int v8 = [v7 state];

  if (v8 == 7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateEnded]);
    -[CSDIDSChat setDateEnded:](self, "setDateEnded:", v10);

LABEL_10:
  }

- (void)_setLocalAspectRatiosForVideoAspectRatioDescriptor:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate", a3));
  [v4 localPortraitAspectRatioForChat:self];
  double v6 = v5;
  double v8 = v7;

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19.width = v6;
    v19.height = v8;
    id v11 = NSStringFromSize(v19);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v20.width = v8;
    v20.height = v6;
    unsigned int v13 = NSStringFromSize(v20);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v15 = 138412546;
    char v16 = v12;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting local portrait aspect ratio %@ and local landscape aspect ratio %@",  (uint8_t *)&v15,  0x16u);
  }

  -[CSDIDSChat setLocalPortraitAspectRatio:](self, "setLocalPortraitAspectRatio:", v6, v8);
  -[CSDIDSChat setLocalLandscapeAspectRatio:](self, "setLocalLandscapeAspectRatio:", v8, v6);
}

- (id)capabilities
{
  if (qword_10044CF08 != -1) {
    dispatch_once(&qword_10044CF08, &stru_1003D8598);
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___VCCapabilities);
  -[VCCapabilities setIsKeyExchangeEnabled:](v3, "setIsKeyExchangeEnabled:", byte_10044CF00 == 0);
  -[VCCapabilities setIsAudioEnabled:](v3, "setIsAudioEnabled:", 1LL);
  -[VCCapabilities setIsVideoEnabled:](v3, "setIsVideoEnabled:", -[CSDIDSChat isVideo](self, "isVideo"));
  -[VCCapabilities setIsDuplexAudioOnly:]( v3,  "setIsDuplexAudioOnly:",  -[VCCapabilities isVideoEnabled](v3, "isVideoEnabled") ^ 1);
  -[VCCapabilities setIsRelayForced:](v3, "setIsRelayForced:", 0LL);
  -[VCCapabilities setIsRelayEnabled:](v3, "setIsRelayEnabled:", 1LL);
  -[VCCapabilities setIsAudioPausedToStart:]( v3,  "setIsAudioPausedToStart:",  -[CSDIDSChat shouldStartAudioPaused](self, "shouldStartAudioPaused"));
  -[VCCapabilities setIsVideoPausedToStart:]( v3,  "setIsVideoPausedToStart:",  -[CSDIDSChat shouldStartVideoPaused](self, "shouldStartVideoPaused"));
  -[VCCapabilities setDeviceRole:](v3, "setDeviceRole:", -[CSDIDSChat deviceRole](self, "deviceRole"));
  return v3;
}

- (int)deviceRole
{
  if (-[CSDIDSChat isRelaying](self, "isRelaying")) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)startWithVideoAspectRatioDescriptor:(id)a3 inviteCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  -[CSDIDSChat _setLocalAspectRatiosForVideoAspectRatioDescriptor:]( self,  "_setLocalAspectRatiosForVideoAspectRatioDescriptor:",  v7);
  -[CSDIDSChat setInviteCompletion:](self, "setInviteCompletion:", v6);

  -[CSDIDSChat prepareConference](self, "prepareConference");
}

- (void)answerWithVideoAspectRatioDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "videoAspectRatioDescriptor: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[CSDIDSChat _setLocalAspectRatiosForVideoAspectRatioDescriptor:]( self,  "_setLocalAspectRatiosForVideoAspectRatioDescriptor:",  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[CSDIDSChat setUpgradeSessionUUID:](self, "setUpgradeSessionUUID:", v7);

  -[CSDIDSChat prepareConference](self, "prepareConference");
}

- (void)cancelOrDeclineInvitation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  unsigned int v4 = [v3 isInitiator];

  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling session", buf, 2u);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    [v8 cancelInvitationWithReason:0];
  }

  else
  {
    if (v7)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Declining session", v9, 2u);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    [v8 declineInvitation];
  }
}

- (void)end
{
  id v3 = sub_1001704C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    NSSize v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "end self: %@", (uint8_t *)&v18, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat dateEnded](self, "dateEnded"));
  if (!v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    if (v6)
    {
      BOOL v7 = (void *)v6;
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
      if ((int)[v8 state] <= 3)
      {
      }

      else
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
        int v10 = [v9 state];

        if (v10 <= 5)
        {
          id v11 = sub_1001704C4();
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Stopping conference",  (uint8_t *)&v18,  2u);
          }

          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
          [v13 stop];
          goto LABEL_16;
        }
      }
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    unsigned int v15 = [v14 state];

    if (v15 == 1)
    {
      -[CSDIDSChat cancelOrDeclineInvitation](self, "cancelOrDeclineInvitation");
LABEL_17:
      -[CSDIDSChat _handlePushTokensInvited:didSendInvitation:didCancelInvitation:]( self,  "_handlePushTokensInvited:didSendInvitation:didCancelInvitation:",  &__NSArray0__struct,  0LL,  1LL);
      return;
    }

    id v16 = sub_1001704C4();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ending session", (uint8_t *)&v18, 2u);
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    [v13 end];
LABEL_16:

    goto LABEL_17;
  }

- (void)cancelInvitationWithAnsweredElsewhere
{
  id v3 = sub_1001704C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v5 cancelInvitationWithReason:1];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v6 cancel];
}

- (void)cancelInvitationWithDeclinedElsewhere
{
  id v3 = sub_1001704C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v5 cancelInvitationWithReason:2];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v6 cancel];
}

- (void)cancelInvitationWithLocalHangup
{
  id v3 = sub_1001704C4();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "for call %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v5 cancelInvitationWithReason:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v6 cancel];
}

- (void)sendDataUnreliably:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v5 sendData:v4];
}

- (BOOL)isSendingAudio
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  unsigned __int8 v3 = [v2 isSendingAudio];

  return v3;
}

- (void)setSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109378;
    BOOL v13 = v3;
    __int16 v14 = 2112;
    unsigned int v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting isSendingAudio to %d for chat %@",  (uint8_t *)&v12,  0x12u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    [v8 setSendingAudio:v3];
  }

  else
  {
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = v3 ^ 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      BOOL v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Conference has not been created yet. Updating shouldStartAudioPaused to %d",  (uint8_t *)&v12,  8u);
    }

    -[CSDIDSChat setShouldStartAudioPaused:](self, "setShouldStartAudioPaused:", v11);
  }

- (BOOL)isSendingAudioData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  unsigned __int8 v3 = [v2 isSendingAudioData];

  return v3;
}

- (void)setSendingAudioData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v3;
    __int16 v10 = 2112;
    BOOL v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting isSendingAudioData to %d for chat %@",  (uint8_t *)v9,  0x12u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    [v8 setSendingAudioData:v3];
  }

- (BOOL)isSendingVideo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  unsigned __int8 v3 = [v2 isSendingVideo];

  return v3;
}

- (void)setSendingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109378;
    BOOL v13 = v3;
    __int16 v14 = 2112;
    unsigned int v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting isSendingVideo to %d for chat %@",  (uint8_t *)&v12,  0x12u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    [v8 setSendingVideo:v3];
  }

  else
  {
    id v9 = sub_1001704C4();
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = v3 ^ 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109120;
      BOOL v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Conference has not been created yet. Updating shouldStartVideoPaused to %d",  (uint8_t *)&v12,  8u);
    }

    -[CSDIDSChat setShouldStartVideoPaused:](self, "setShouldStartVideoPaused:", v11);
  }

- (void)setRelaying:(BOOL)a3
{
  if (self->_relaying != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1001704C4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109634;
      v9[1] = -[CSDIDSChat isRelaying](self, "isRelaying");
      __int16 v10 = 1024;
      BOOL v11 = v3;
      __int16 v12 = 2112;
      BOOL v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting relaying from %d to %d for chat %@",  (uint8_t *)v9,  0x18u);
    }

    self->_relaying = v3;
    uint64_t v7 = -[CSDIDSChat deviceRole](self, "deviceRole");
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    [v8 setDeviceRole:v7];
  }

- (void)startConnectionWithTransport:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "transport: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat remoteFromID](self, "remoteFromID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat crossDeviceIdentifier](self, "crossDeviceIdentifier"));
  [v7 setRemoteIDSDestinationURI:v8 crossDeviceIdentifier:v9];

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v10 startConnectionWithTransport:v4];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v11, "chatStartedConnecting:") & 1) != 0) {
    [v11 chatStartedConnecting:self];
  }
}

- (void)prepareConference
{
  BOOL v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDIDSChat conferenceCreationBlock](self, "conferenceCreationBlock"));
  uint64_t v4 = v3[2]();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CSDIDSChat setConference:](self, "setConference:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v6 setDelegate:self];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queue]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v9 setDelegateQueue:v8];

  __int16 v17 = objc_alloc_init(&OBJC_CLASS___CSDAVConferenceConfiguration);
  -[CSDAVConferenceConfiguration setRequiresInviteDictionary:](v17, "setRequiresInviteDictionary:", 1LL);
  -[CSDAVConferenceConfiguration setCaller:](v17, "setCaller:", -[CSDIDSChat isOutgoing](self, "isOutgoing"));
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat capabilities](self, "capabilities"));
  -[CSDAVConferenceConfiguration setCapabilities:](v17, "setCapabilities:", v10);

  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "faceTimeAppUUID");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CSDAVConferenceConfiguration setClientUUID:](v17, "setClientUUID:", v13);

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat reportingHierarchyToken](self, "reportingHierarchyToken"));
  -[CSDAVConferenceConfiguration setReportingHierarchyToken:](v17, "setReportingHierarchyToken:", v14);

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat remoteInviteDictionary](self, "remoteInviteDictionary"));
  -[CSDAVConferenceConfiguration setRemoteInviteDictionary:](v17, "setRemoteInviteDictionary:", v15);

  -[CSDIDSChat localPortraitAspectRatio](self, "localPortraitAspectRatio");
  -[CSDAVConferenceConfiguration setLocalPortraitAspectRatio:](v17, "setLocalPortraitAspectRatio:");
  -[CSDIDSChat localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  -[CSDAVConferenceConfiguration setLocalLandscapeAspectRatio:](v17, "setLocalLandscapeAspectRatio:");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v16 prepareWithConfiguration:v17];
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  objc_msgSend(v5, "setRemoteVideoPresentationSize:", width, height);
}

- (void)setRemoteVideoPresentationState:(int)a3
{
  if (a3 == 2) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v4 setRemoteVideoPresentationState:v3];
}

- (void)_handlePushTokensInvited:(id)a3 didSendInvitation:(BOOL)a4 didCancelInvitation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v12 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat inviteCompletion](self, "inviteCompletion"));

  id v9 = v12;
  if (v8)
  {
    -[CSDIDSChat setInvitedPushTokens:](self, "setInvitedPushTokens:", v12);
    -[CSDIDSChat setHasSentInvitation:](self, "setHasSentInvitation:", v6);
    __int16 v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CSDIDSChat inviteCompletion](self, "inviteCompletion"));
    ((void (**)(void, id, BOOL))v10)[2](v10, v12, v5);

    -[CSDIDSChat setInviteCompletion:](self, "setInviteCompletion:", 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
    if (-[CSDIDSChat hasSentInvitation](self, "hasSentInvitation")
      && (objc_opt_respondsToSelector(v11, "chatSentInvitation:") & 1) != 0)
    {
      [v11 chatSentInvitation:self];
    }

    id v9 = v12;
  }
}

- (void)sessionStarted:(id)a3
{
  id v4 = (CSDIDSChat *)a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    __int16 v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sessionStarted: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  unsigned __int8 v8 = [v7 isMediaAllowedForChat:self];

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteInviteDictionary]);

    if (v10)
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat transport](v4, "transport"));
      -[CSDIDSChat startConnectionWithTransport:](self, "startConnectionWithTransport:", v11);
    }

    else
    {
      id v13 = sub_1001704C4();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
        unsigned int v15 = [v14 state];
        int v16 = 67109120;
        LODWORD(v17) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not starting connection because conference state is %d",  (uint8_t *)&v16,  8u);
      }
    }
  }

  else
  {
    id v12 = sub_1001704C4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      __int16 v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not starting connection because the chat is not allowed to start media: %@",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)session:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "session %@ invitationSentToPushTokens %@ shouldBreakBeforeMake %d",  (uint8_t *)&v12,  0x1Cu);
  }

  -[CSDIDSChat setMayRequireBreakBeforeMake:](self, "setMayRequireBreakBeforeMake:", v5);
  -[CSDIDSChat _handlePushTokensInvited:didSendInvitation:didCancelInvitation:]( self,  "_handlePushTokensInvited:didSendInvitation:didCancelInvitation:",  v9,  1LL,  0LL);
  -[CSDIDSChat _setDateEndedIfNecessary](self, "_setDateEndedIfNecessary");
}

- (void)session:(id)a3 endedWithReason:(int)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "session %@ endedWithReason %d",  (uint8_t *)&v10,  0x12u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  [v9 stop];

  -[CSDIDSChat _handlePushTokensInvited:didSendInvitation:didCancelInvitation:]( self,  "_handlePushTokensInvited:didSendInvitation:didCancelInvitation:",  &__NSArray0__struct,  0LL,  1LL);
  -[CSDIDSChat _setDateEndedIfNecessary](self, "_setDateEndedIfNecessary");
}

- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CSDMessagingCallMessage initWithData:](objc_alloc(&OBJC_CLASS___CSDMessagingCallMessage), "initWithData:", v7);

  id v9 = sub_1001704C4();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v68 = v6;
    *(_WORD *)&v68[8] = 2112;
    v69 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "session %@ receivedInvitationAcceptWithData %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  unsigned __int8 v12 = [v11 isMediaAllowedForChat:self];

  if ((v12 & 1) == 0)
  {
    id v32 = sub_1001704C4();
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v68 = self;
    v33 = "[WARN] Dropping invitation accept since the chat is not allowed to start media: %@";
LABEL_25:
    v35 = v17;
    uint32_t v36 = 12;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v33, buf, v36);
    goto LABEL_34;
  }

  if (!-[CSDIDSChat isOutgoing](self, "isOutgoing"))
  {
    id v34 = sub_1001704C4();
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v68 = self;
    v33 = "[WARN] Ignoring invitation accept since chat is incoming: %@";
    goto LABEL_25;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteFromID]);
  id v14 = [v13 length];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteFromID]);
    id v66 = 0LL;
    id v16 = [v15 _stripPotentialTokenURIWithToken:&v66];
    BOOL v17 = (os_log_s *)v66;

    if (!-[os_log_s length](v17, "length"))
    {
      id v38 = sub_1001704C4();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1002B37A4(v31, v39, v40, v41, v42, v43, v44, v45);
      }
      goto LABEL_33;
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat invitedPushTokens](self, "invitedPushTokens"));
    unsigned __int8 v19 = [v18 containsObject:v17];

    if ((v19 & 1) == 0)
    {
      id v46 = sub_1001704C4();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1002B3864(v31, v47, v48, v49, v50, v51, v52, v53);
      }
      goto LABEL_33;
    }

    if (!v8)
    {
      id v54 = sub_1001704C4();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring incoming accept since accompanying message was nil",  buf,  2u);
      }

      goto LABEL_33;
    }

    if (-[CSDMessagingCallMessage type](v8, "type") != 1)
    {
      id v55 = sub_1001704C4();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = (id)-[CSDMessagingCallMessage type](v8, "type");
        if (v56 >= 3) {
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v56));
        }
        else {
          v57 = off_1003D85B8[(int)v56];
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v68 = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring incoming message since message with type=%@ was not invite.",  buf,  0xCu);
      }

      goto LABEL_33;
    }

    NSSize v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallMessage inviteData](v8, "inviteData"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 faceTimeInviteDictionary]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
    [v22 setRemoteInviteDictionary:v21];

    -[CSDIDSChat setRemoteMomentsAvailable:]( self,  "setRemoteMomentsAvailable:",  -[CSDMessagingCallMessage isMomentsAvailable](v8, "isMomentsAvailable"));
    if (-[CSDMessagingCallMessage hasProtoUpgradeSessionUUID](v8, "hasProtoUpgradeSessionUUID")
      && (id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat upgradeSessionUUID](self, "upgradeSessionUUID")),
          v23,
          !v23))
    {
      v63 = objc_alloc(&OBJC_CLASS___NSUUID);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallMessage protoUpgradeSessionUUID](v8, "protoUpgradeSessionUUID"));
      id v25 = -[NSUUID initWithUUIDString:](v63, "initWithUUIDString:", v64);

      if (v25)
      {
        -[CSDIDSChat setUpgradeSessionUUID:](self, "setUpgradeSessionUUID:", v25);
LABEL_15:

        if (-[CSDMessagingCallMessage hasProtoWantsVideo](v8, "hasProtoWantsVideo"))
        {
          if (-[CSDIDSChat isVideo](self, "isVideo"))
          {
            unsigned int v27 = -[CSDIDSChat isVideo](self, "isVideo");
            unsigned int v28 = -[CSDMessagingCallMessage protoWantsVideo](v8, "protoWantsVideo");
            -[CSDIDSChat setVideo:]( self,  "setVideo:",  -[CSDMessagingCallMessage protoWantsVideo](v8, "protoWantsVideo"));
            if (v27 != v28)
            {
              __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat capabilities](self, "capabilities"));
              [v29 updateCapabilities:v30];
            }
          }
        }

        if ([v6 state] == 3)
        {
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 transport]);
          -[CSDIDSChat startConnectionWithTransport:](self, "startConnectionWithTransport:", v31);
        }

        else
        {
          id v58 = sub_1001704C4();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
            unsigned int v60 = [v59 state];
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
            unsigned int v62 = [v61 state];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v68 = v60;
            *(_WORD *)&v68[4] = 1024;
            *(_DWORD *)&v68[6] = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Not starting connecting because session state is %d and conference state is %d",  buf,  0xEu);
          }
        }

- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "session %@ receivedInvitationDeclineWithData %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "session %@ receivedInvitationCancelWithData %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)session:(id)a3 receivedData:(id)a4
{
  id v5 = a3;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"non-nil";
    if (!a4) {
      id v8 = @"nil";
    }
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "session %@ receivedData (data is %@)",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conferenceFinishedPreparing:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v29, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "faceTimeAppUUID");
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v10 setClientUUID:v9];

  id v11 = [v6 isWiFiAllowedForChat:self];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v12 setWiFiAllowed:v11];

  id v13 = [v6 isCellularDataAllowedForChat:self];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v14 setCellularDataAllowed:v13];

  id v15 = [v6 isCellularDataPreferredForChat:self];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  [v16 setCellularDataPreferred:v15];

  BOOL v17 = objc_alloc_init(&OBJC_CLASS___CSDMessagingCallMessage);
  -[CSDMessagingCallMessage addProtocolVersion](v17, "addProtocolVersion");
  -[CSDMessagingCallMessage setType:](v17, "setType:", 1LL);
  int v18 = objc_alloc(&OBJC_CLASS___CSDMessagingAVConferenceInviteData);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat conference](self, "conference"));
  NSSize v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localInviteDictionary]);
  id v21 = -[CSDMessagingAVConferenceInviteData initWithFaceTimeInviteDictionary:]( v18,  "initWithFaceTimeInviteDictionary:",  v20);
  -[CSDMessagingCallMessage setInviteData:](v17, "setInviteData:", v21);

  -[CSDMessagingCallMessage setShouldSuppressInCallUI:]( v17,  "setShouldSuppressInCallUI:",  -[CSDIDSChat shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat upgradeSessionUUID](self, "upgradeSessionUUID"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
  -[CSDMessagingCallMessage setProtoUpgradeSessionUUID:](v17, "setProtoUpgradeSessionUUID:", v23);

  if ((objc_opt_respondsToSelector(v6, "isMomentsAvailableForChat:") & 1) != 0) {
    -[CSDMessagingCallMessage setMomentsAvailable:]( v17,  "setMomentsAvailable:",  [v6 isMomentsAvailableForChat:self]);
  }
  -[CSDMessagingCallMessage setProtoWantsVideo:](v17, "setProtoWantsVideo:", -[CSDIDSChat isVideo](self, "isVideo"));
  id v24 = sub_1001704C4();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "message: %@", (uint8_t *)&v29, 0xCu);
  }

  unsigned int v26 = -[CSDIDSChat isOutgoing](self, "isOutgoing");
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallMessage data](v17, "data"));
  if (v26) {
    [v27 sendInvitationWithData:v28];
  }
  else {
    [v27 acceptInvitationWithData:v28];
  }
}

- (void)conferenceStarted:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if (-[CSDIDSChat isVideo](self, "isVideo"))
  {
    dispatch_time_t v6 = dispatch_time(0LL, 3000000000LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006A950;
    block[3] = &unk_1003D7730;
    block[4] = self;
    dispatch_after(v6, v8, block);
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v9, "chatConnected:") & 1) != 0) {
      [v9 chatConnected:self];
    }
  }

- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    int64_t v13 = a4;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "reason=%ld error=%@", (uint8_t *)&v12, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
  unsigned int v11 = [v10 state];

  if (v11 == 1) {
    -[CSDIDSChat cancelOrDeclineInvitation](self, "cancelOrDeclineInvitation");
  }
  -[CSDIDSChat _setDateEndedIfNecessary](self, "_setDateEndedIfNecessary");
}

- (void)mutedChangedForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }
}

- (void)sendingAudioChangedForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }
}

- (void)receivedFirstRemoteFrameForConference:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat dateReceivedFirstRemoteFrame](self, "dateReceivedFirstRemoteFrame"));
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDIDSChat setDateReceivedFirstRemoteFrame:](self, "setDateReceivedFirstRemoteFrame:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "chatConnected:") & 1) != 0) {
      [v8 chatConnected:self];
    }
  }

- (void)remoteVideoPausedForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }
}

- (void)conference:(id)a3 remoteMediaStalled:(BOOL)a4
{
  if (a4)
  {
    id v5 = sub_1001704C4();
    dispatch_time_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Remote media stalled for chat: %@. Reconnecting IDS session.",  (uint8_t *)&v8,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat session](self, "session"));
    [v7 reconnectSession];
  }

- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "chat:inputFrequencyLevelChangedTo:") & 1) != 0) {
    [v5 chat:self inputFrequencyLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "chat:outputFrequencyLevelChangedTo:") & 1) != 0) {
    [v5 chat:self outputFrequencyLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 inputLevelChangedTo:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v7, "chat:inputLevelChangedTo:") & 1) != 0)
  {
    *(float *)&double v6 = a4;
    [v7 chat:self inputLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 outputLevelChangedTo:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v7, "chat:outputLevelChangedTo:") & 1) != 0)
  {
    *(float *)&double v6 = a4;
    [v7 chat:self outputLevelChangedTo:v6];
  }
}

- (void)conference:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v6, "chat:changedBytesOfDataUsed:") & 1) != 0) {
    [v6 chat:self changedBytesOfDataUsed:a4];
  }
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSChat delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "chat:receivedData:") & 1) != 0) {
    [v6 chat:self receivedData:v7];
  }
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (CSDIDSChatDelegate)delegate
{
  return (CSDIDSChatDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSDExternalIDSDualSession)session
{
  return self->_session;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

- (BOOL)isRemoteMomentsAvailable
{
  return self->_remoteMomentsAvailable;
}

- (void)setRemoteMomentsAvailable:(BOOL)a3
{
  self->_remoteMomentsAvailable = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
}

- (CSDAVConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
}

- (BOOL)shouldStartAudioPaused
{
  return self->_shouldStartAudioPaused;
}

- (void)setShouldStartAudioPaused:(BOOL)a3
{
  self->_shouldStartAudioPaused = a3;
}

- (BOOL)shouldStartVideoPaused
{
  return self->_shouldStartVideoPaused;
}

- (void)setShouldStartVideoPaused:(BOOL)a3
{
  self->_shouldStartVideoPaused = a3;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return self->_mayRequireBreakBeforeMake;
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  self->_mayRequireBreakBeforeMake = a3;
}

- (BOOL)hasSentInvitation
{
  return self->_hasSentInvitation;
}

- (void)setHasSentInvitation:(BOOL)a3
{
  self->_hasSentInvitation = a3;
}

- (NSDate)dateReceivedFirstRemoteFrame
{
  return self->_dateReceivedFirstRemoteFrame;
}

- (void)setDateReceivedFirstRemoteFrame:(id)a3
{
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
}

- (NSDictionary)remoteInviteDictionary
{
  return self->_remoteInviteDictionary;
}

- (NSArray)invitedPushTokens
{
  return self->_invitedPushTokens;
}

- (void)setInvitedPushTokens:(id)a3
{
}

- (id)inviteCompletion
{
  return self->_inviteCompletion;
}

- (void)setInviteCompletion:(id)a3
{
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (id)conferenceCreationBlock
{
  return self->_conferenceCreationBlock;
}

- (void)setConferenceCreationBlock:(id)a3
{
}

- (RTCSecureHierarchyToken)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end