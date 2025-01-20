@interface CSDCall
- (BOOL)endDueToHandoff;
- (BOOL)faceTimeIDStatusRefreshed;
- (BOOL)hasAudioFinished;
- (BOOL)hasAudioInterruption;
- (BOOL)hasIdentifiedSpamInCallerName;
- (BOOL)hasNondisclosedGreeting;
- (BOOL)hasStartedOutgoing;
- (BOOL)ignoresBluetoothDeviceUID;
- (BOOL)isAnsweringMachineAvailable;
- (BOOL)isEmergency;
- (BOOL)isKnownCaller;
- (BOOL)isLocalUserInHomeCountry;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOutgoing;
- (BOOL)isSOS;
- (BOOL)isSendingAudio;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isVoicemail;
- (BOOL)joinedFromLink;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsConversationOrVideoRelaySupport;
- (BOOL)needsConversationRelaySupport;
- (BOOL)remoteDoesHandoff;
- (BOOL)shouldHandleMuteRequests;
- (BOOL)shouldOverrideCallStatus;
- (BOOL)shouldOwnMuteHandler;
- (BOOL)startAsHandoff;
- (BOOL)startAsOneToOneMode;
- (BOOL)temporaryRequireInCallSounds;
- (BOOL)uplinkWasExplicitlyMuted;
- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4;
- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4 idQueryController:(id)a5;
- (CSDCallDataSource)dataSource;
- (CSDCallDelegate)delegate;
- (CSDIDSTransport)relayClientTransport;
- (CSDMuteProcessAttributionProtocol)audioApplication;
- (CXCall)cxCall;
- (IDSDestination)expectedRelayClientDestination;
- (IDSIDQueryController)idQueryController;
- (NSDate)dateStartedOutgoing;
- (NSDate)temporaryDateStartedOutgoing;
- (NSDictionary)handoffActivityUserInfo;
- (NSDictionary)silencingUserInfo;
- (NSSet)activeRemoteParticipants;
- (NSString)handoffDynamicIdentifier;
- (NSString)ringtoneSubscriptionIdentifier;
- (OS_dispatch_source)timeoutTimer;
- (TUDialRequest)dialRequest;
- (TUDynamicCallDisplayContext)dynamicDisplayContext;
- (id)displayContext;
- (id)handle;
- (int)callRelaySupport;
- (int)callStatus;
- (int)callStatusFromOverride;
- (int)callStatusFromUnderlyingSource;
- (int)faceTimeIDStatus;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bytesOfDataUsed;
- (int64_t)identificationCategory;
- (int64_t)junkConfidence;
- (int64_t)liveVoicemailStatus;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (int64_t)transmissionState;
- (unint64_t)initialLinkType;
- (void)_refreshFaceTimeIDSStatus;
- (void)_refreshFaceTimeIDSStatusIfNecessary;
- (void)dealloc;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnect;
- (void)disconnectCallWithReason:(int)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)handleUpdatedPropertiesAfterChangesInBlock:(id)a3;
- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)propertiesChanged;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setAnsweringMachineAvailable:(BOOL)a3;
- (void)setAnsweringMachineStreamToken:(int64_t)a3;
- (void)setAudioApplication:(id)a3;
- (void)setBytesOfDataUsed:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDateConnected:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateSentInvitation:(id)a3;
- (void)setDateStartedConnecting:(id)a3;
- (void)setDateStartedOutgoing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialRequest:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setDynamicDisplayContext:(id)a3;
- (void)setEndDueToHandoff:(BOOL)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setExpectedRelayClientDestination:(id)a3;
- (void)setFaceTimeIDStatus:(int)a3;
- (void)setFaceTimeIDStatusRefreshed:(BOOL)a3;
- (void)setHasAudioFinished:(BOOL)a3;
- (void)setHasAudioInterruption:(BOOL)a3;
- (void)setIdentificationCategory:(int64_t)a3;
- (void)setIdentifiedSpamInCallerName:(BOOL)a3;
- (void)setIsKnownCaller:(BOOL)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setJoinedFromLink:(BOOL)a3;
- (void)setJunkConfidence:(int64_t)a3;
- (void)setLiveVoicemailStatus:(int64_t)a3;
- (void)setLocalUserInHomeCountry:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNondisclosedGreeting:(BOOL)a3;
- (void)setRelayClientTransport:(id)a3;
- (void)setRemoteDoesHandoff:(BOOL)a3;
- (void)setRingtoneSubscriptionIdentifier:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setScreeningAnnouncementHasFinished:(BOOL)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSilencingUserInfo:(id)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setStartAsHandoff:(BOOL)a3;
- (void)setStartAsOneToOneMode:(BOOL)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setTemporaryDateStartedOutgoing:(id)a3;
- (void)setTemporaryRequireInCallSounds:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTransitionStatus:(int)a3;
- (void)setTransmissionState:(int64_t)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUplinkWasExplicitlyMuted:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)setWasDialAssisted:(BOOL)a3;
- (void)unmuteAfterDisconnect;
- (void)unsuppressRingtoneIfNecessary;
- (void)updateWithProxyCall:(id)a3;
@end

@implementation CSDCall

- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4 idQueryController:(id)a5
{
  v8 = (IDSIDQueryController *)a5;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CSDCall;
  v10 = -[CSDCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:]( &v16,  "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:",  v9,  [a4 isEndpointOnCurrentDevice]);

  idQueryController = v10->_idQueryController;
  v10->_idQueryController = v8;
  v12 = v8;

  uint64_t v13 = IDSServiceNameFaceTime;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](v10, "queue"));
  -[IDSIDQueryController addDelegate:forService:listenerID:queue:]( v12,  "addDelegate:forService:listenerID:queue:",  v10,  v13,  @"com.apple.TUCallCenter",  v14);

  return v10;
}

- (CSDCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](&OBJC_CLASS___IDSIDQueryController, "sharedInstance"));
  id v9 = -[CSDCall initWithUniqueProxyIdentifier:configuration:idQueryController:]( self,  "initWithUniqueProxyIdentifier:configuration:idQueryController:",  v7,  v6,  v8);

  return v9;
}

- (void)dealloc
{
  id v3 = sub_1001704C4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Call is being deallocated", buf, 2u);
  }

  -[CSDCall setTimeoutTimer:](self, "setTimeoutTimer:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDCall;
  -[CSDCall dealloc](&v5, "dealloc");
}

- (void)unmuteAfterDisconnect
{
}

- (int)callRelaySupport
{
  if (-[CSDCall isConversation](self, "isConversation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall remoteParticipantHandles](self, "remoteParticipantHandles"));
    if ([v4 count] == (id)1)
    {
      if (-[CSDCall isSendingVideo](self, "isSendingVideo"))
      {
        else {
          int v3 = 2;
        }
      }

      else
      {
        int v3 = 2;
      }
    }

    else
    {
      int v3 = 1;
    }

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConversationForCall:self]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activitySessions]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

    if (v8 && [v8 state] == (id)1) {
      int v3 = 1;
    }
  }

  else if (-[CSDCall isVideo](self, "isVideo"))
  {
    return 1;
  }

  else
  {
    return 2;
  }

  return v3;
}

- (BOOL)needsConversationOrVideoRelaySupport
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall remoteParticipantHandles](self, "remoteParticipantHandles"));
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)needsConversationRelaySupport
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall remoteParticipantHandles](self, "remoteParticipantHandles"));
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 isValid] & 1) == 0)
  {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"CSDCall.m", 243, @"dialRequest is invalid: %@", v7 object file lineNumber description];
  }

  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "dialRequest: %@ displayContext: %@",  buf,  0x16u);
  }

  -[CSDCall setDialRequest:](self, "setDialRequest:", v7);
  -[CSDCall setWasDialAssisted:](self, "setWasDialAssisted:", [v7 isDialAssisted]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 audioSourceIdentifier]);
  -[CSDCall setSourceIdentifier:](self, "setSourceIdentifier:", v11);

  if (v8)
  {
    v12 = objc_alloc(&OBJC_CLASS___TUDynamicCallDisplayContext);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](self, "queue"));
    v14 = -[TUDynamicCallDisplayContext initWithDisplayContext:call:serialQueue:]( v12,  "initWithDisplayContext:call:serialQueue:",  v8,  self,  v13);
    -[CSDCall setDynamicDisplayContext:](self, "setDynamicDisplayContext:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dynamicDisplayContext](self, "dynamicDisplayContext"));
    [v15 setDelegate:self];
  }
}

- (void)disconnect
{
}

- (void)disconnectCallWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = (int)v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "diconnectCallWithReason: %lu",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDCall disconnectWithReason:](self, "disconnectWithReason:", v3);
}

- (void)unsuppressRingtoneIfNecessary
{
  if (-[CSDCall shouldSuppressRingtone](self, "shouldSuppressRingtone"))
  {
    id v3 = objc_alloc_init((Class)CUTWeakLinkClass(@"SFCoordinatedAlertRequest", @"Sharing"));
    [v3 setType:2];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C4FD8;
    v7[3] = &unk_1003D97A8;
    objc_copyWeak(&v9, &location);
    id v4 = v3;
    id v8 = v4;
    [v4 setCompletionHandler:v7];
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting coordinated alert request to determine ringtone un-suppression: %@",  buf,  0xCu);
    }

    [v4 start];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)updateWithProxyCall:(id)a3
{
  id v4 = a3;
  -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", [v4 disconnectedReason]);
  -[CSDCall setShouldSuppressRingtone:](self, "setShouldSuppressRingtone:", [v4 shouldSuppressRingtone]);
  id v5 = [v4 wantsHoldMusic];

  -[CSDCall setWantsHoldMusic:](self, "setWantsHoldMusic:", v5);
}

- (void)setHasAudioInterruption:(BOOL)a3
{
  if (self->_hasAudioInterruption != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000C52B0;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setRelayClientTransport:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall relayClientTransport](self, "relayClientTransport"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C537C;
    v7[3] = &unk_1003D7758;
    void v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setTransitionStatus:(int)a3
{
  if (-[CSDCall transitionStatus](self, "transitionStatus") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C540C;
    v5[3] = &unk_1003D78C8;
    int v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setWantsHoldMusic:(BOOL)a3
{
  if (-[CSDCall wantsHoldMusic](self, "wantsHoldMusic") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C54C4;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setWasDialAssisted:(BOOL)a3
{
  if (-[CSDCall wasDialAssisted](self, "wasDialAssisted") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C557C;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setScreeningAnnouncementHasFinished:(BOOL)a3
{
  if (-[CSDCall screeningAnnouncementHasFinished](self, "screeningAnnouncementHasFinished") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5634;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setDisconnectedReason:(int)a3
{
  if (-[CSDCall disconnectedReason](self, "disconnectedReason") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C56EC;
    v5[3] = &unk_1003D78C8;
    int v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  if (-[CSDCall shouldSuppressRingtone](self, "shouldSuppressRingtone") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C57A4;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setFaceTimeIDStatus:(int)a3
{
  if (-[CSDCall faceTimeIDStatus](self, "faceTimeIDStatus") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C585C;
    v5[3] = &unk_1003D78C8;
    int v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setSoundRegion:(int64_t)a3
{
  if (-[CSDCall soundRegion](self, "soundRegion") != (id)a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5910;
    v5[3] = &unk_1003D7708;
    v5[4] = self;
    void v5[5] = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setModel:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDCall model](self, "model"));

  char v5 = v6;
  if (v4 != v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C59EC;
    v7[3] = &unk_1003D7758;
    id v8 = v6;
    id v9 = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");

    char v5 = v6;
  }
}

- (void)setAnsweringMachineStreamToken:(int64_t)a3
{
  if (-[CSDCall answeringMachineStreamToken](self, "answeringMachineStreamToken") != (id)a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5A9C;
    v5[3] = &unk_1003D7708;
    v5[4] = self;
    void v5[5] = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  if (-[CSDCall supportsDTMFUpdates](self, "supportsDTMFUpdates") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5B50;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  if (-[CSDCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5C08;
    v5[3] = &unk_1003D7878;
    BOOL v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CSDCall isScreening](self, "isScreening") != a3)
  {
    -[CSDCall setWasScreened:](self, "setWasScreened:", -[CSDCall wasScreened](self, "wasScreened") | v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000C5CD4;
    v5[3] = &unk_1003D7878;
    BOOL v6 = v3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setDateSentInvitation:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateSentInvitation](self, "dateSentInvitation"));
  char v6 = TUObjectsAreEqualOrNil(v5, v4);

  if ((v6 & 1) != 0)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateSentInvitation](self, "dateSentInvitation"));
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "self.dateSentInvitation: %@, dateSentInvitation: %@",  buf,  0x16u);
    }
  }

  else
  {
    if (-[CSDCall isOutgoing](self, "isOutgoing"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedOutgoing](self, "dateStartedOutgoing"));

      if (!v10) {
        -[CSDCall setDateStartedOutgoing:](self, "setDateStartedOutgoing:", v4);
      }
    }

    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CSDCall;
    -[CSDCall setDateSentInvitation:](&v11, "setDateSentInvitation:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDateStartedConnecting:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedConnecting](self, "dateStartedConnecting"));
  char v6 = TUObjectsAreEqualOrNil(v5, v4);

  if ((v6 & 1) == 0)
  {
    if (-[CSDCall isOutgoing](self, "isOutgoing"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateSentInvitation](self, "dateSentInvitation"));

      if (!v7) {
        -[CSDCall setDateSentInvitation:](self, "setDateSentInvitation:", v4);
      }
    }

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSDCall;
    -[CSDCall setDateStartedConnecting:](&v8, "setDateStartedConnecting:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDateConnected:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateConnected](self, "dateConnected"));
  char v6 = TUObjectsAreEqualOrNil(v5, v4);

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedConnecting](self, "dateStartedConnecting"));

    if (!v7) {
      -[CSDCall setDateStartedConnecting:](self, "setDateStartedConnecting:", v4);
    }
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSDCall;
    -[CSDCall setDateConnected:](&v8, "setDateConnected:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDateEnded:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateEnded](self, "dateEnded"));
  char v6 = TUObjectsAreEqualOrNil(v5, v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSDCall;
    -[CSDCall setDateEnded:](&v7, "setDateEnded:", v4);
    -[CSDCall updateForDisconnection](self, "updateForDisconnection");
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDateStartedOutgoing:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedOutgoing](self, "dateStartedOutgoing"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C6100;
    v7[3] = &unk_1003D7758;
    void v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setIsKnownCaller:(BOOL)a3
{
  if (-[CSDCall isKnownCaller](self, "isKnownCaller") != a3)
  {
    self->_isKnownCaller = a3;
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setUplinkMuted:(BOOL)a3
{
  if (a3) {
    -[CSDCall setUplinkWasExplicitlyMuted:](self, "setUplinkWasExplicitlyMuted:", 1LL);
  }
}

- (BOOL)shouldOwnMuteHandler
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Call with UPI %@ cannot own mute handler since it is held",  (uint8_t *)&v7,  0xCu);
  }

  return 0;
}

- (BOOL)shouldHandleMuteRequests
{
  if (-[CSDCall status](self, "status") != 1
    && -[CSDCall status](self, "status") != 3
    && -[CSDCall status](self, "status") != 2)
  {
    id v8 = sub_1001704C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 1024;
      unsigned int v14 = -[CSDCall status](self, "status");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Call with UPI %@ cannot handle mute control requests since the call status is not eligible for mute control %d",  (uint8_t *)&v11,  0x12u);
    }

    goto LABEL_15;
  }

  if (-[CSDCall isScreening](self, "isScreening"))
  {
    id v3 = sub_1001704C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
      int v11 = 138412290;
      id v12 = v5;
      id v6 = "Call with UPI %@ cannot handle mute control requests since it is screening";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, 0xCu);
    }
  }

  else
  {
    if ((-[CSDCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice") & 1) != 0
      || (-[CSDCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice") & 1) != 0)
    {
      return 1;
    }

    id v10 = sub_1001704C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
      int v11 = 138412290;
      id v12 = v5;
      id v6 = "Call with UPI %@ cannot handle mute control requests since it is not endpoint for the call";
      goto LABEL_14;
    }
  }

- (void)setTimeoutTimer:(id)a3
{
  id v5 = a3;
  p_timeoutTimer = (id *)&self->_timeoutTimer;
  int v7 = (dispatch_source_s *)*p_timeoutTimer;
  id v8 = v5;
  if (*p_timeoutTimer != v5)
  {
    if (v7) {
      dispatch_source_cancel(v7);
    }
    objc_storeStrong(p_timeoutTimer, a3);
    if (*p_timeoutTimer) {
      dispatch_activate((dispatch_object_t)*p_timeoutTimer);
    }
  }
}

- (void)setTransmissionState:(int64_t)a3
{
  if (self->_transmissionState != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000C6550;
    v4[3] = &unk_1003D7708;
    v4[4] = self;
    void v4[5] = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (int)callStatus
{
  if (-[CSDCall shouldOverrideCallStatus](self, "shouldOverrideCallStatus")) {
    return -[CSDCall callStatusFromOverride](self, "callStatusFromOverride");
  }
  else {
    return -[CSDCall callStatusFromUnderlyingSource](self, "callStatusFromUnderlyingSource");
  }
}

- (int)callStatusFromUnderlyingSource
{
  return 0;
}

- (BOOL)shouldOverrideCallStatus
{
  return -[CSDCall disconnectedReason](self, "disconnectedReason") == 17
      || -[CSDCall disconnectedReason](self, "disconnectedReason") == 14
      || -[CSDCall disconnectedReason](self, "disconnectedReason") == 21;
}

- (int)callStatusFromOverride
{
  return 6;
}

- (BOOL)hasStartedOutgoing
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall temporaryDateStartedOutgoing](self, "temporaryDateStartedOutgoing"));
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedOutgoing](self, "dateStartedOutgoing"));
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (int64_t)audioInterruptionProviderType
{
  return 1LL;
}

- (int64_t)audioInterruptionOperationMode
{
  return 0LL;
}

- (id)handle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSDCall;
    id v6 = -[CSDCall handle](&v8, "handle");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (BOOL)isOutgoing
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___CSDCall;
    BOOL v4 = -[CSDCall isOutgoing](&v6, "isOutgoing");
  }

  return v4;
}

- (BOOL)isVoicemail
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
    unsigned __int8 v5 = [v4 dialType] == (id)2;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSDCall;
    unsigned __int8 v5 = -[CSDCall isVoicemail](&v7, "isVoicemail");
  }

  return v5;
}

- (BOOL)isEmergency
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
    unsigned __int8 v5 = [v4 dialType] == (id)1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSDCall;
    unsigned __int8 v5 = -[CSDCall isEmergency](&v7, "isEmergency");
  }

  return v5;
}

- (BOOL)isSOS
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
    unsigned __int8 v5 = [v4 isSOS];
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSDCall;
    unsigned __int8 v5 = -[CSDCall isSOS](&v7, "isSOS");
  }

  return v5;
}

- (NSString)handoffDynamicIdentifier
{
  return 0LL;
}

- (NSDictionary)handoffActivityUserInfo
{
  return 0LL;
}

- (int)faceTimeIDStatus
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDCall;
  return -[CSDCall faceTimeIDStatus](&v4, "faceTimeIDStatus");
}

- (void)_refreshFaceTimeIDSStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall provider](self, "provider"));
  unsigned int v4 = [v3 isFaceTimeProvider];

  if (v4)
  {
    unsigned __int8 v5 = self;
    uint64_t v6 = 2LL;
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall handle](self, "handle"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall idQueryController](self, "idQueryController"));
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall handle](self, "handle"));
      uint64_t v12 = TUCopyIDSCanonicalAddressForHandle();
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = IDSServiceNameFaceTime;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](self, "queue"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000C6AA0;
      v16[3] = &unk_1003D97D0;
      v16[4] = self;
      [v10 currentIDStatusForDestination:v13 service:v14 listenerID:@"com.apple.TUCallCenter" queue:v15 completionBlock:v16];

      return;
    }

    unsigned __int8 v5 = self;
    uint64_t v6 = 0LL;
  }

  -[CSDCall setFaceTimeIDStatus:](v5, "setFaceTimeIDStatus:", v6);
}

- (void)_refreshFaceTimeIDSStatusIfNecessary
{
  if (!-[CSDCall faceTimeIDStatusRefreshed](self, "faceTimeIDStatusRefreshed"))
  {
    -[CSDCall setFaceTimeIDStatusRefreshed:](self, "setFaceTimeIDStatusRefreshed:", 1LL);
    -[CSDCall _refreshFaceTimeIDSStatus](self, "_refreshFaceTimeIDSStatus");
  }

- (NSDictionary)silencingUserInfo
{
  silencingUserInfo = self->_silencingUserInfo;
  if (!silencingUserInfo)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    unsigned __int8 v5 = self->_silencingUserInfo;
    self->_silencingUserInfo = v4;

    silencingUserInfo = self->_silencingUserInfo;
  }

  return silencingUserInfo;
}

- (id)displayContext
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dynamicDisplayContext](self, "dynamicDisplayContext"));
  if (v3) {
    goto LABEL_4;
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](self, "queue"));

  if (v4)
  {
    unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___TUDynamicCallDisplayContext);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dialRequest](self, "dialRequest"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contactIdentifier]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](self, "queue"));
    id v9 = -[TUDynamicCallDisplayContext initWithCall:contactIdentifier:serialQueue:cacheOnly:]( v5,  "initWithCall:contactIdentifier:serialQueue:cacheOnly:",  self,  v7,  v8,  -[CSDCall isIncoming](self, "isIncoming") ^ 1);
    -[CSDCall setDynamicDisplayContext:](self, "setDynamicDisplayContext:", v9);

    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dynamicDisplayContext](self, "dynamicDisplayContext"));
    [v3 setDelegate:self];
LABEL_4:
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dynamicDisplayContext](self, "dynamicDisplayContext"));
  id v11 = [v10 copy];

  return v11;
}

- (int64_t)providerErrorCode
{
  return 0LL;
}

- (int64_t)providerEndedReason
{
  return 0LL;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return 0;
}

- (BOOL)mixesVoiceWithMedia
{
  return 0;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return 0;
}

- (CXCall)cxCall
{
  id v3 = objc_alloc(&OBJC_CLASS___CXCall);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  unsigned __int8 v5 = -[CXCall initWithUUID:](v3, "initWithUUID:", v4);

  -[CXCall setOutgoing:](v5, "setOutgoing:", -[CSDCall isOutgoing](self, "isOutgoing"));
  -[CXCall setOnHold:](v5, "setOnHold:", -[CSDCall isOnHold](self, "isOnHold"));
  -[CXCall setHasConnected:](v5, "setHasConnected:", -[CSDCall isConnected](self, "isConnected"));
  -[CXCall setHasEnded:](v5, "setHasEnded:", -[CSDCall status](self, "status") == 6);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall provider](self, "provider"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[CXCall setProviderIdentifier:](v5, "setProviderIdentifier:", v7);

  -[CXCall setEndpointOnCurrentDevice:]( v5,  "setEndpointOnCurrentDevice:",  -[CSDCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  -[CXCall setHostedOnCurrentDevice:]( v5,  "setHostedOnCurrentDevice:",  -[CSDCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  else {
    uint64_t v8 = (uint64_t)-[CSDCall isThirdPartyVideo](self, "isThirdPartyVideo");
  }
  -[CXCall setVideo:](v5, "setVideo:", v8);
  -[CXCall setScreening:](v5, "setScreening:", -[CSDCall isScreening](self, "isScreening"));
  return v5;
}

- (void)propertiesChanged
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSDCall delegate](self, "delegate"));
  [v3 propertiesChangedForCall:self];
}

- (void)handleUpdatedPropertiesAfterChangesInBlock:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall handle](self, "handle"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall callerNameFromNetwork](self, "callerNameFromNetwork"));
  unsigned int v55 = -[CSDCall isInternational](self, "isInternational");
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall relayClientTransport](self, "relayClientTransport"));
  unsigned int v57 = -[CSDCall mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake");
  unsigned int v59 = -[CSDCall hasStartedOutgoing](self, "hasStartedOutgoing");
  unsigned int v60 = -[CSDCall hasAudioInterruption](self, "hasAudioInterruption");
  unsigned int v5 = -[CSDCall isEmergency](self, "isEmergency");
  unsigned int v54 = -[CSDCall isVoicemail](self, "isVoicemail");
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDCall activeRemoteParticipants](self, "activeRemoteParticipants"));
  unsigned int v63 = -[CSDCall isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
  unsigned int v65 = -[CSDCall mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice");
  int64_t v67 = -[CSDCall transmissionState](self, "transmissionState");
  unsigned int v69 = -[CSDCall prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat");
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall remoteParticipantHandles](self, "remoteParticipantHandles"));
  v4[2](v4);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall handle](self, "handle"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall callerNameFromNetwork](self, "callerNameFromNetwork"));
  unsigned int v7 = -[CSDCall isInternational](self, "isInternational");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall relayClientTransport](self, "relayClientTransport"));
  unsigned int v9 = -[CSDCall mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake");
  unsigned int v56 = -[CSDCall hasStartedOutgoing](self, "hasStartedOutgoing");
  unsigned int v58 = -[CSDCall hasAudioInterruption](self, "hasAudioInterruption");
  unsigned int v10 = -[CSDCall isEmergency](self, "isEmergency");
  unsigned int v11 = -[CSDCall isVoicemail](self, "isVoicemail");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall activeRemoteParticipants](self, "activeRemoteParticipants"));
  unsigned int v61 = -[CSDCall isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
  unsigned int v62 = -[CSDCall mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice");
  int64_t v64 = -[CSDCall transmissionState](self, "transmissionState");
  unsigned int v66 = -[CSDCall prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat");
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall remoteParticipantHandles](self, "remoteParticipantHandles"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDCall dynamicDisplayContext](self, "dynamicDisplayContext"));
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    if (!TUObjectsAreEqualOrNil(v75, v74)
      || !TUStringsAreEqualOrNil(v73, v72)
      || ((v5 ^ v10) & 1) != 0
      || ((v55 ^ v7) & 1) != 0
      || ((v54 ^ v11) & 1) != 0)
    {
    }

    else
    {
      unsigned __int8 v15 = [v71 isEqualToSet:v70];

      if ((v15 & 1) != 0) {
        goto LABEL_13;
      }
    }

    id v16 = sub_1001704C4();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = (const __CFString *)self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Invalidating display context for %@",  buf,  0xCu);
    }

    -[CSDCall setDynamicDisplayContext:](self, "setDynamicDisplayContext:", 0LL);
  }

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDCall notificationCenter](self, "notificationCenter"));
  [v4 postNotificationName:@"CSDCallAudioInterruptionPropertiesChangedNotification" object:self];
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCall queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    unsigned int v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Received update about new query cache on service %@",  (uint8_t *)&v9,  0x16u);
  }

  -[CSDCall _refreshFaceTimeIDSStatus](self, "_refreshFaceTimeIDSStatus");
}

- (BOOL)isSendingAudio
{
  return self->_isSendingAudio;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  self->_isSendingAudio = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (int64_t)identificationCategory
{
  return self->_identificationCategory;
}

- (void)setIdentificationCategory:(int64_t)a3
{
  self->_identificationCategory = a3;
}

- (BOOL)isKnownCaller
{
  return self->_isKnownCaller;
}

- (int64_t)liveVoicemailStatus
{
  return self->_liveVoicemailStatus;
}

- (void)setLiveVoicemailStatus:(int64_t)a3
{
  self->_liveVoicemailStatus = a3;
}

- (BOOL)joinedFromLink
{
  return self->_joinedFromLink;
}

- (void)setJoinedFromLink:(BOOL)a3
{
  self->_joinedFromLink = a3;
}

- (BOOL)isLocalUserInHomeCountry
{
  return self->_localUserInHomeCountry;
}

- (void)setLocalUserInHomeCountry:(BOOL)a3
{
  self->_localUserInHomeCountry = a3;
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (void)setAnsweringMachineAvailable:(BOOL)a3
{
  self->_answeringMachineAvailable = a3;
}

- (BOOL)hasNondisclosedGreeting
{
  return self->_nondisclosedGreeting;
}

- (void)setNondisclosedGreeting:(BOOL)a3
{
  self->_nondisclosedGreeting = a3;
}

- (BOOL)hasIdentifiedSpamInCallerName
{
  return self->_identifiedSpamInCallerName;
}

- (void)setIdentifiedSpamInCallerName:(BOOL)a3
{
  self->_identifiedSpamInCallerName = a3;
}

- (CSDCallDelegate)delegate
{
  return (CSDCallDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSDCallDataSource)dataSource
{
  return (CSDCallDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (TUDialRequest)dialRequest
{
  return self->_dialRequest;
}

- (void)setDialRequest:(id)a3
{
}

- (NSDate)dateStartedOutgoing
{
  return self->_dateStartedOutgoing;
}

- (BOOL)uplinkWasExplicitlyMuted
{
  return self->_uplinkWasExplicitlyMuted;
}

- (void)setUplinkWasExplicitlyMuted:(BOOL)a3
{
  self->_uplinkWasExplicitlyMuted = a3;
}

- (BOOL)hasAudioInterruption
{
  return self->_hasAudioInterruption;
}

- (BOOL)hasAudioFinished
{
  return self->_hasAudioFinished;
}

- (void)setHasAudioFinished:(BOOL)a3
{
  self->_hasAudioFinished = a3;
}

- (NSString)ringtoneSubscriptionIdentifier
{
  return self->_ringtoneSubscriptionIdentifier;
}

- (void)setRingtoneSubscriptionIdentifier:(id)a3
{
  self->_ringtoneSubscriptionIdentifier = (NSString *)a3;
}

- (BOOL)ignoresBluetoothDeviceUID
{
  return self->_ignoresBluetoothDeviceUID;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)temporaryRequireInCallSounds
{
  return self->_temporaryRequireInCallSounds;
}

- (void)setTemporaryRequireInCallSounds:(BOOL)a3
{
  self->_temporaryRequireInCallSounds = a3;
}

- (NSDate)temporaryDateStartedOutgoing
{
  return self->_temporaryDateStartedOutgoing;
}

- (void)setTemporaryDateStartedOutgoing:(id)a3
{
}

- (void)setSilencingUserInfo:(id)a3
{
}

- (BOOL)startAsOneToOneMode
{
  return self->_startAsOneToOneMode;
}

- (void)setStartAsOneToOneMode:(BOOL)a3
{
  self->_startAsOneToOneMode = a3;
}

- (BOOL)startAsHandoff
{
  return self->_startAsHandoff;
}

- (void)setStartAsHandoff:(BOOL)a3
{
  self->_startAsHandoff = a3;
}

- (BOOL)endDueToHandoff
{
  return self->_endDueToHandoff;
}

- (void)setEndDueToHandoff:(BOOL)a3
{
  self->_endDueToHandoff = a3;
}

- (BOOL)remoteDoesHandoff
{
  return self->_remoteDoesHandoff;
}

- (void)setRemoteDoesHandoff:(BOOL)a3
{
  self->_remoteDoesHandoff = a3;
}

- (int64_t)bytesOfDataUsed
{
  return self->_bytesOfDataUsed;
}

- (void)setBytesOfDataUsed:(int64_t)a3
{
  self->_bytesOfDataUsed = a3;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (CSDIDSTransport)relayClientTransport
{
  return self->_relayClientTransport;
}

- (IDSDestination)expectedRelayClientDestination
{
  return self->_expectedRelayClientDestination;
}

- (void)setExpectedRelayClientDestination:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (int64_t)transmissionState
{
  return self->_transmissionState;
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  self->_isUnderlyingLinksConnected = a3;
}

- (TUDynamicCallDisplayContext)dynamicDisplayContext
{
  return self->_dynamicDisplayContext;
}

- (void)setDynamicDisplayContext:(id)a3
{
}

- (BOOL)faceTimeIDStatusRefreshed
{
  return self->_faceTimeIDStatusRefreshed;
}

- (void)setFaceTimeIDStatusRefreshed:(BOOL)a3
{
  self->_faceTimeIDStatusRefreshed = a3;
}

- (CSDMuteProcessAttributionProtocol)audioApplication
{
  return self->_audioApplication;
}

- (void)setAudioApplication:(id)a3
{
}

- (IDSIDQueryController)idQueryController
{
  return self->_idQueryController;
}

- (void).cxx_destruct
{
}

@end