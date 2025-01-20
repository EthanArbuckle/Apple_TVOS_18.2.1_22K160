@interface CSDProviderCall
- (AVAudioSession)proxyAVAudioSession;
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)hasBeenRedirected;
- (BOOL)hasConnected;
- (BOOL)hasEnded;
- (BOOL)hasStartedConnecting;
- (BOOL)ignoresBluetoothDeviceUID;
- (BOOL)isBlocked;
- (BOOL)isConversation;
- (BOOL)isDomestic;
- (BOOL)isDownlinkMuted;
- (BOOL)isEmergency;
- (BOOL)isExpanseProvider;
- (BOOL)isFailureExpected;
- (BOOL)isHeld;
- (BOOL)isInjectingAudio;
- (BOOL)isInternational;
- (BOOL)isMutuallyExclusiveCall;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOutgoing;
- (BOOL)isReRing;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSendingVideo;
- (BOOL)isSharingScreen;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isUnderlyingUplinkMuted;
- (BOOL)isUplinkMuted;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mediaPlaybackOnExternalDevice;
- (BOOL)mixesVoiceWithMedia;
- (BOOL)needsManualInCallSounds;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)prefersToPlayDuringWombat;
- (BOOL)sendingVideo;
- (BOOL)shouldAcceptDateConnectedProviderUpdates;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsScreening;
- (BOOL)supportsTTYWithVoice;
- (BOOL)usesSystemMuting;
- (BOOL)wantsStagingArea;
- (CSDPauseDigitsQueue)pauseDigitsQueue;
- (CSDProviderCall)initWithHandoffContext:(id)a3 backingCallSource:(id)a4;
- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4;
- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4;
- (CSDProviderCallDelegate)providerCallDelegate;
- (CXAbstractProviderSource)providerSource;
- (CXCallFailureContext)failureContext;
- (CXCallSource)backingCallSource;
- (CXCallUpdate)mergedCallUpdate;
- (LSApplicationRecord)applicationRecord;
- (NSDictionary)silencingUserInfo;
- (NSNotificationCenter)defaultNotificationCenter;
- (NSString)providerIdentifier;
- (NSUUID)callGroupUUID;
- (TUCallCenter)callCenter;
- (TUDynamicCallDisplayContext)dynamicDisplayContext;
- (TUFeatureFlags)featureFlags;
- (TUParticipant)activeRemoteParticipant;
- (TUUserConfiguration)userConfiguration;
- (id)_dialDelayForRequest:(id)a3;
- (id)activeRemoteParticipantForCallUpdate:(id)a3;
- (id)activeRemoteParticipants;
- (id)audioCategory;
- (id)audioMode;
- (id)callHistoryIdentifier;
- (id)callerNameFromNetwork;
- (id)conversationID;
- (id)cxScreenShareAttributesForCallAttributes:(id)a3;
- (id)dialDelayForRequest;
- (id)endedReasonUserInfo;
- (id)handle;
- (id)handoffActivityUserInfo;
- (id)handoffDynamicIdentifier;
- (id)hardPauseDigits;
- (id)imageURLForCXSandboxExtendedURL:(id)a3;
- (id)initIncomingWithBackingCallSource:(id)a3 UUID:(id)a4 update:(id)a5;
- (id)initOutgoingWithDialRequest:(id)a3;
- (id)initOutgoingWithDialRequest:(id)a3 configuration:(id)a4;
- (id)initOutgoingWithJoinConversationRequest:(id)a3;
- (id)initOutgoingWithRequestedStartCallAction:(id)a3 backingCallSource:(id)a4;
- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8;
- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8 configuration:(id)a9;
- (id)initOutgoingWithUpdate:(id)a3 callUUID:(id)a4 backingCallSource:(id)a5 isExpanseProvider:(BOOL)a6;
- (id)initiator;
- (id)isoCountryCode;
- (id)localMemberHandleValue;
- (id)localSenderIdentityAccountUUID;
- (id)localSenderIdentityUUID;
- (id)provider;
- (id)providerContext;
- (id)remoteParticipantHandles;
- (id)screenShareAttributes;
- (id)startCallActionWithDialRequest:(id)a3;
- (id)startCallBlock;
- (id)systemControllerSetUplinkMutedBlock;
- (id)systemControllerUplinkMutedBlock;
- (id)tokens;
- (id)tuScreenShareAttributesForScreenAttributes:(id)a3;
- (id)usesSystemMutingBlock;
- (int)_switchFromFailureReasonToDisconnectedReason:(int64_t)a3;
- (int)callStatusFromUnderlyingSource;
- (int)hardPauseDigitsState;
- (int)originatingUIType;
- (int)ttyType;
- (int64_t)_switchToCXCallFailureReasonFromTUCallDisconnectedReason:(int)a3;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bluetoothAudioFormat;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (int64_t)screenSharingIntention;
- (int64_t)serviceStatus;
- (int64_t)soundRegion;
- (int64_t)transmissionMode;
- (int64_t)videoStreamToken;
- (unint64_t)initialLinkType;
- (unint64_t)screenSharingType;
- (void)_sendDTMFDigits:(id)a3 type:(int64_t)a4;
- (void)_sendSoftPauseDigitsIfNecessary;
- (void)_setIsOnHold:(BOOL)a3;
- (void)answerWithRequest:(id)a3;
- (void)askProviderToAllowAudioInjection:(BOOL)a3;
- (void)dealloc;
- (void)dequeueNextPauseDigits;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnectWithReason:(int)a3;
- (void)groupWithOtherCall:(id)a3;
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
- (void)hold;
- (void)joinConversationWithRequest:(id)a3;
- (void)pauseDigitsQueueChanged:(id)a3;
- (void)performUplinkMuted:(BOOL)a3;
- (void)playRemoteDTMFToneForKey:(unsigned __int8)a3;
- (void)sendHardPauseDigits;
- (void)setActiveRemoteParticipant:(id)a3;
- (void)setBackingCallSource:(id)a3;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallGroupUUID:(id)a3;
- (void)setConversation:(BOOL)a3;
- (void)setDateConnected:(id)a3;
- (void)setDefaultNotificationCenter:(id)a3;
- (void)setDialDelayForRequest:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3;
- (void)setDynamicDisplayContext:(id)a3;
- (void)setEndedReason:(int64_t)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setFailureContext:(id)a3;
- (void)setHeld:(BOOL)a3;
- (void)setInjectingAudio:(BOOL)a3;
- (void)setIsSendingVideo:(BOOL)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMergedCallUpdate:(id)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setPauseDigitsQueue:(id)a3;
- (void)setProviderCallDelegate:(id)a3;
- (void)setProviderFailureReasonIfNecessary:(int64_t)a3;
- (void)setProviderSource:(id)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(int)a3;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4;
- (void)setShouldAcceptDateConnectedProviderUpdates:(BOOL)a3;
- (void)setSilencingUserInfo:(id)a3;
- (void)setStartCallBlock:(id)a3;
- (void)setSystemControllerSetUplinkMutedBlock:(id)a3;
- (void)setSystemControllerUplinkMutedBlock:(id)a3;
- (void)setTtyType:(int)a3;
- (void)setUnderlyingUplinkMuted:(BOOL)a3;
- (void)setUnderlyingUplinkMuted:(BOOL)a3 bottomUpMute:(BOOL)a4;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUsesSystemMutingBlock:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)setWantsStagingArea:(BOOL)a3;
- (void)systemMuteStatusChanged:(id)a3;
- (void)ungroup;
- (void)unhold;
- (void)updateForDisconnection;
- (void)updateWithCallUpdate:(id)a3;
- (void)updateWithCallUpdate:(id)a3 notifyDelegate:(BOOL)a4;
@end

@implementation CSDProviderCall

- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___CSDProviderCallConfiguration);
  -[CSDProviderCallConfiguration setEndpointOnCurrentDevice:](v7, "setEndpointOnCurrentDevice:", v4);
  v8 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  -[CSDProviderCallConfiguration setFeatureFlags:](v7, "setFeatureFlags:", v8);

  v9 = -[CSDProviderCall initWithUniqueProxyIdentifier:configuration:]( self,  "initWithUniqueProxyIdentifier:configuration:",  v6,  v7);
  return v9;
}

- (CSDProviderCall)initWithUniqueProxyIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  v8 = -[CSDCall initWithUniqueProxyIdentifier:configuration:]( &v35,  "initWithUniqueProxyIdentifier:configuration:",  v6,  v7);
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 featureFlags]);
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = (TUFeatureFlags *)v9;

    v8->_held = [v7 isHeld];
    objc_initWeak(&location, v8);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004C020;
    v32[3] = &unk_1003D8170;
    objc_copyWeak(&v33, &location);
    v11 = objc_retainBlock(v32);
    id dialDelayForRequest = v8->_dialDelayForRequest;
    v8->_id dialDelayForRequest = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[CXCallUpdate callUpdateWithDefaultValuesSet](&OBJC_CLASS___CXCallUpdate, "callUpdateWithDefaultValuesSet"));
    mergedCallUpdate = v8->_mergedCallUpdate;
    v8->_mergedCallUpdate = (CXCallUpdate *)v13;

    v8->_outgoing = [v7 isOutgoing];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 providerIdentifier]);
    v16 = (NSString *)[v15 copy];
    providerIdentifier = v8->_providerIdentifier;
    v8->_providerIdentifier = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 providerSource]);
    providerSource = v8->_providerSource;
    v8->_providerSource = (CXAbstractProviderSource *)v18;

    v20 = objc_alloc_init(&OBJC_CLASS___TUUserConfiguration);
    userConfiguration = v8->_userConfiguration;
    v8->_userConfiguration = v20;

    v8->_prefersToPlayDuringWombat = 1;
    if ([v7 transmissionMode]) {
      -[CXCallUpdate setTransmissionMode:]( v8->_mergedCallUpdate,  "setTransmissionMode:",  [v7 transmissionMode]);
    }
    if ([v7 accessoryButtonEventsEnabled]) {
      -[CXCallUpdate setAccessoryButtonEventsEnabled:]( v8->_mergedCallUpdate,  "setAccessoryButtonEventsEnabled:",  [v7 accessoryButtonEventsEnabled]);
    }
    if (-[TUFeatureFlags nameAndPhotoEnabled](v8->_featureFlags, "nameAndPhotoEnabled"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](&OBJC_CLASS___IMDaemonController, "sharedInstance"));
      uint64_t v23 = TUBundleIdentifierCallServicesDaemon;
      unsigned __int8 v24 = [v22 hasListenerForID:TUBundleIdentifierCallServicesDaemon];

      if ((v24 & 1) == 0)
      {
        id v25 = sub_1001704C4();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Connecting to IMDaemonController...",  v31,  2u);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](&OBJC_CLASS___IMDaemonController, "sharedInstance"));
        [v27 addListenerID:v23 capabilities:kFZListenerCapAccounts];
      }
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultNotificationCenter]);
    v29 = v28;
    if (!v28) {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    }
    objc_storeStrong((id *)&v8->_defaultNotificationCenter, v29);
    if (!v28) {

    }
    -[NSNotificationCenter addObserver:selector:name:object:]( v8->_defaultNotificationCenter,  "addObserver:selector:name:object:",  v8,  "systemMuteStatusChanged:",  TUAudioSystemUplinkMuteStatusChangedNotification,  0LL);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)initIncomingWithBackingCallSource:(id)a3 UUID:(id)a4 update:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc(&OBJC_CLASS___CSDProviderCallConfiguration);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v14 = -[CSDProviderCallConfiguration initWithProviderIdentifier:](v12, "initWithProviderIdentifier:", v13);

  -[CSDProviderCallConfiguration setEndpointOnCurrentDevice:](v14, "setEndpointOnCurrentDevice:", 1LL);
  v15 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  -[CSDProviderCallConfiguration setFeatureFlags:](v14, "setFeatureFlags:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  v17 = -[CSDProviderCall initWithUniqueProxyIdentifier:configuration:]( self,  "initWithUniqueProxyIdentifier:configuration:",  v16,  v14);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_backingCallSource, a3);
    v17->_video = [v10 hasVideo];
    id v21 = [v10 hasSet];
    LODWORD(v22) = v18;
    if ((v18 & 1) == 0) {
      v17->_sendingVideo = v17->_video;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sanitizedCallUpdate", v21, v22));
    -[CSDProviderCall updateWithCallUpdate:](v17, "updateWithCallUpdate:", v19);
  }

  return v17;
}

- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = -[CSDProviderCallConfiguration initWithProviderIdentifier:]( objc_alloc(&OBJC_CLASS___CSDProviderCallConfiguration),  "initWithProviderIdentifier:",  v15);
  -[CSDProviderCallConfiguration setEndpointOnCurrentDevice:](v17, "setEndpointOnCurrentDevice:", v9);
  int v18 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  -[CSDProviderCallConfiguration setFeatureFlags:](v17, "setFeatureFlags:", v18);

  id v19 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:configuration:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:o riginatingUIType:configuration:",  v16,  v15,  v14,  v10,  v9,  v8,  v17);
  return v19;
}

- (id)initOutgoingWithUniqueProxyIdentifier:(id)a3 backingCallSourceIdentifier:(id)a4 callUpdate:(id)a5 isVideo:(BOOL)a6 endpointOnCurrentDevice:(BOOL)a7 originatingUIType:(int)a8 configuration:(id)a9
{
  id v13 = a5;
  id v14 = -[CSDProviderCall initWithUniqueProxyIdentifier:configuration:]( self,  "initWithUniqueProxyIdentifier:configuration:",  a3,  a9);
  id v15 = (id *)v14;
  if (v14)
  {
    v14->_outgoing = 1;
    v14->_video = a6;
    v14->_sendingVideo = a6;
    v14->_originatingUIType = a8;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteHandle]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);

    if (v17)
    {
      int v18 = objc_alloc(&OBJC_CLASS___CSDPauseDigitsQueue);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteHandle]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
      id v21 = -[CSDPauseDigitsQueue initWithDestinationID:](v18, "initWithDestinationID:", v20);
      id v22 = v15[48];
      v15[48] = v21;

      [v15[48] setDelegate:v15];
      id v23 = sub_1001704C4();
      unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v15[48];
        int v35 = 138412290;
        id v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Created pause digits queue: %@",  (uint8_t *)&v35,  0xCu);
      }

      v26 = objc_alloc(&OBJC_CLASS___CXHandle);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteHandle]);
      id v28 = [v27 type];
      v29 = (void *)objc_claimAutoreleasedReturnValue([v15[48] baseDestinationID]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteHandle]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 siriDisplayName]);
      v32 = -[CXHandle initWithType:value:siriDisplayName:](v26, "initWithType:value:siriDisplayName:", v28, v29, v31);
      [v13 setRemoteHandle:v32];
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v13 sanitizedCallUpdate]);
    [v15 updateWithCallUpdate:v33];
  }

  return v15;
}

- (id)initOutgoingWithUpdate:(id)a3 callUUID:(id)a4 backingCallSource:(id)a5 isExpanseProvider:(BOOL)a6
{
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a4 UUIDString]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  id v15 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:o riginatingUIType:",  v13,  v14,  v12,  [v12 hasVideo],  1,  0);

  if (v15)
  {
    *((_BYTE *)v15 + 197) = a6;
    objc_storeStrong((id *)v15 + 39, a5);
  }

  return v15;
}

- (id)initOutgoingWithDialRequest:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate initWithDialRequest:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithDialRequest:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v9 = [v4 isVideo];
  id v10 = [v4 endpointOnCurrentDevice];
  id v11 = [v4 originatingUIType];

  id v12 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:o riginatingUIType:",  v6,  v8,  v5,  v9,  v10,  v11);
  return v12;
}

- (id)initOutgoingWithDialRequest:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[CXCallUpdate initWithDialRequest:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithDialRequest:", v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 provider]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v12 = [v7 isVideo];
  id v13 = [v7 endpointOnCurrentDevice];
  id v14 = [v7 originatingUIType];

  id v15 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:configuration:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:o riginatingUIType:configuration:",  v9,  v11,  v8,  v12,  v13,  v14,  v6);
  return v15;
}

- (id)initOutgoingWithRequestedStartCallAction:(id)a3 backingCallSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[CXCallUpdate initWithStartCallAction:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithStartCallAction:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 callUUID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v13 = [v8 isVideo];
  unsigned int v14 = [v8 isRelay];

  id v15 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:o riginatingUIType:",  v11,  v12,  v9,  v13,  v14 ^ 1,  0LL);
  if (v15) {
    objc_storeStrong(v15 + 39, a4);
  }

  return v15;
}

- (id)initOutgoingWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate initWithJoinConversationRequest:]( objc_alloc(&OBJC_CLASS___CXCallUpdate),  "initWithJoinConversationRequest:",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = -[CSDProviderCall initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:originatingUIType:]( self,  "initOutgoingWithUniqueProxyIdentifier:backingCallSourceIdentifier:callUpdate:isVideo:endpointOnCurrentDevice:or iginatingUIType:",  v7,  @"com.apple.telephonyutilities.callservicesd.FaceTimeProvider",  v5,  1,  [v4 endpointOnCurrentDevice],  objc_msgSend(v4, "originatingUIType"));

  if (v8)
  {
    *((_BYTE *)v8 + 205) = [v4 isVideoEnabled];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    if ([v9 count] == (id)1)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
      if (v10)
      {
        [*((id *)v8 + 47) setConversation:1];
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 otherInvitedHandles]);
        if ([v11 count])
        {
          [*((id *)v8 + 47) setConversation:1];
        }

        else
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
          if ([v12 isDefaultProvider])
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 participantAssociation]);
            [*((id *)v8 + 47) setConversation:v13 != 0];
          }

          else
          {
            [*((id *)v8 + 47) setConversation:1];
          }
        }
      }
    }

    else
    {
      [*((id *)v8 + 47) setConversation:1];
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationProvider expanseProvider](&OBJC_CLASS___TUConversationProvider, "expanseProvider"));
    *((_BYTE *)v8 + 197) = [v14 isEqual:v15];
  }

  return v8;
}

- (CSDProviderCall)initWithHandoffContext:(id)a3 backingCallSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CSDProviderCall init](self, "init");
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backingCallSource, a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteHandle]);
    -[CXCallUpdate setRemoteHandle:](v9->_mergedCallUpdate, "setRemoteHandle:", v10);

    v9->_outgoing = [v6 isOutgoing];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v12 = (NSString *)[v11 copy];
    providerIdentifier = v9->_providerIdentifier;
    v9->_providerIdentifier = v12;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall dealloc](&v3, "dealloc");
}

- (NSNotificationCenter)defaultNotificationCenter
{
  defaultNotificationCenter = self->_defaultNotificationCenter;
  if (!defaultNotificationCenter)
  {
    id v4 = (NSNotificationCenter *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
    v5 = self->_defaultNotificationCenter;
    self->_defaultNotificationCenter = v4;

    defaultNotificationCenter = self->_defaultNotificationCenter;
  }

  return defaultNotificationCenter;
}

- (void)performUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Asked to perform uplinkMuted: %d",  (uint8_t *)v7,  8u);
  }

  -[CSDProviderCall setUplinkMuted:](self, "setUplinkMuted:", v3);
}

- (void)systemMuteStatusChanged:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004CDF4;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v4, block);
}

- (TUCallCenter)callCenter
{
  callCenter = self->_callCenter;
  if (!callCenter)
  {
    id v4 = (TUCallCenter *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v5 = self->_callCenter;
    self->_callCenter = v4;

    callCenter = self->_callCenter;
  }

  return callCenter;
}

- (id)usesSystemMutingBlock
{
  id usesSystemMutingBlock = self->_usesSystemMutingBlock;
  if (!usesSystemMutingBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_10004D110;
    v7[3] = &unk_1003D8198;
    objc_copyWeak(&v8, &location);
    id v4 = objc_retainBlock(v7);
    id v5 = self->_usesSystemMutingBlock;
    self->_id usesSystemMutingBlock = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    id usesSystemMutingBlock = self->_usesSystemMutingBlock;
  }

  return objc_retainBlock(usesSystemMutingBlock);
}

- (id)systemControllerUplinkMutedBlock
{
  id systemControllerUplinkMutedBlock = self->_systemControllerUplinkMutedBlock;
  if (!systemControllerUplinkMutedBlock)
  {
    self->_id systemControllerUplinkMutedBlock = &stru_1003D81B8;

    id systemControllerUplinkMutedBlock = self->_systemControllerUplinkMutedBlock;
  }

  return objc_retainBlock(systemControllerUplinkMutedBlock);
}

- (id)systemControllerSetUplinkMutedBlock
{
  id systemControllerSetUplinkMutedBlock = self->_systemControllerSetUplinkMutedBlock;
  if (!systemControllerSetUplinkMutedBlock)
  {
    self->_id systemControllerSetUplinkMutedBlock = &stru_1003D81F8;

    id systemControllerSetUplinkMutedBlock = self->_systemControllerSetUplinkMutedBlock;
  }

  return objc_retainBlock(systemControllerSetUplinkMutedBlock);
}

- (void)updateWithCallUpdate:(id)a3
{
}

- (void)updateWithCallUpdate:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sanitizedCallUpdate]);
  -[CSDCall setTemporaryRequireInCallSounds:](self, "setTemporaryRequireInCallSounds:", 0LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004D318;
  v10[3] = &unk_1003D7828;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v10);
  if (v4) {
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (int)_switchFromFailureReasonToDisconnectedReason:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1A && ((0x3FF9FFFu >> a3) & 1) != 0)
  {
    unsigned int v6 = dword_100378DAC[a3];
  }

  else
  {
    id v4 = sub_1001704C4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Set disconnect reason to dial failed, failure reason: %ld",  (uint8_t *)&v10,  0xCu);
    }

    unsigned int v6 = 17;
  }

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    int64_t v11 = a3;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "failure reason: %ld, disconnected reason: %ld",  (uint8_t *)&v10,  0x16u);
  }

  return v6;
}

- (void)updateForDisconnection
{
  v86.receiver = self;
  v86.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall updateForDisconnection](&v86, "updateForDisconnection");
  if (!-[CSDProviderCall isOutgoing](self, "isOutgoing") || -[CSDCall hasStartedOutgoing](self, "hasStartedOutgoing"))
  {
    uint64_t v3 = -[CSDProviderCall endedReason](self, "endedReason");
    if (v3 > 101)
    {
      if (v3 == 102)
      {
        id v36 = sub_1001704C4();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v38 = -[CSDProviderCall endedReason](self, "endedReason");
          *(_DWORD *)buf = 134217984;
          int64_t v88 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to handed off because ended reason is %ld",  buf,  0xCu);
        }

        id v23 = self;
        uint64_t v24 = 7LL;
        goto LABEL_43;
      }

      if (v3 == 103)
      {
        id v39 = sub_1001704C4();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v41 = -[CSDProviderCall endedReason](self, "endedReason");
          *(_DWORD *)buf = 134217984;
          int64_t v88 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to user busy because ended reason is %ld",  buf,  0xCu);
        }

        id v23 = self;
        uint64_t v24 = 15LL;
        goto LABEL_43;
      }

      if (v3 != 104) {
        return;
      }
      id v11 = sub_1001704C4();
      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int64_t v13 = -[CSDProviderCall endedReason](self, "endedReason");
      *(_DWORD *)buf = 134217984;
      int64_t v88 = v13;
      unsigned int v14 = "Setting disconnected reason to remote hangup because ended reason is %ld";
    }

    else
    {
      switch(v3)
      {
        case 1LL:
          id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));

          if (v4)
          {
            id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
            id v6 = [v5 failureReason];

            switch((unint64_t)v6)
            {
              case 0uLL:
                id v7 = sub_1001704C4();
                id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2B30(self);
                }

                -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", 14LL);
                id v9 = self;
                uint64_t v10 = 510LL;
                goto LABEL_52;
              case 1uLL:
                id v50 = sub_1001704C4();
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2BA8(self);
                }

                id v23 = self;
                uint64_t v24 = 18LL;
                goto LABEL_43;
              case 2uLL:
                id v52 = sub_1001704C4();
                v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2C20(self);
                }

                id v23 = self;
                uint64_t v24 = 19LL;
                goto LABEL_43;
              case 3uLL:
                id v54 = sub_1001704C4();
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2C98(self);
                }

                id v23 = self;
                uint64_t v24 = 22LL;
                goto LABEL_43;
              case 4uLL:
                id v56 = sub_1001704C4();
                v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2D10(self);
                }

                id v23 = self;
                uint64_t v24 = 23LL;
                goto LABEL_43;
              case 5uLL:
                id v58 = sub_1001704C4();
                v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2D88(self);
                }

                id v23 = self;
                uint64_t v24 = 24LL;
                goto LABEL_43;
              case 6uLL:
                id v60 = sub_1001704C4();
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2E00(self);
                }

                id v23 = self;
                uint64_t v24 = 16LL;
                goto LABEL_43;
              case 7uLL:
                id v62 = sub_1001704C4();
                v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2E78(self);
                }

                id v23 = self;
                uint64_t v24 = 26LL;
                goto LABEL_43;
              case 8uLL:
                id v64 = sub_1001704C4();
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2EF0(self);
                }

                id v23 = self;
                uint64_t v24 = 27LL;
                goto LABEL_43;
              case 9uLL:
                id v66 = sub_1001704C4();
                v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2F68(self);
                }

                id v23 = self;
                uint64_t v24 = 28LL;
                goto LABEL_43;
              case 0xAuLL:
                id v68 = sub_1001704C4();
                v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2FE0(self);
                }

                id v23 = self;
                uint64_t v24 = 29LL;
                goto LABEL_43;
              case 0xBuLL:
                id v70 = sub_1001704C4();
                v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
                  sub_1002B3058(self);
                }

                id v23 = self;
                uint64_t v24 = 30LL;
                goto LABEL_43;
              case 0xCuLL:
                id v72 = sub_1001704C4();
                v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                  sub_1002B3058(self);
                }

                id v23 = self;
                uint64_t v24 = 32LL;
                goto LABEL_43;
              case 0xDuLL:
                id v74 = sub_1001704C4();
                v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2D88(self);
                }

                id v23 = self;
                uint64_t v24 = 33LL;
                goto LABEL_43;
              case 0xFuLL:
                id v78 = sub_1001704C4();
                v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                  sub_1002B30D0(self);
                }

                id v23 = self;
                uint64_t v24 = 37LL;
                goto LABEL_43;
              case 0x10uLL:
                id v80 = sub_1001704C4();
                v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
                  sub_1002B3148(self);
                }

                id v23 = self;
                uint64_t v24 = 38LL;
                goto LABEL_43;
              case 0x14uLL:
                id v82 = sub_1001704C4();
                v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                  sub_1002B31C0(self);
                }

                id v23 = self;
                uint64_t v24 = 42LL;
                goto LABEL_43;
              case 0x15uLL:
                id v84 = sub_1001704C4();
                v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                  sub_1002B3238(self);
                }

                id v23 = self;
                uint64_t v24 = 43LL;
                goto LABEL_43;
              default:
                id v76 = sub_1001704C4();
                v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
                  sub_1002B2B30(self);
                }

                id v23 = self;
                uint64_t v24 = 14LL;
                goto LABEL_43;
            }
          }

          id v47 = sub_1001704C4();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_1002B2AC4(self);
          }

          -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", 14LL);
          id v9 = self;
          uint64_t v10 = 511LL;
LABEL_52:
          -[CSDProviderCall setProviderFailureReasonIfNecessary:](v9, "setProviderFailureReasonIfNecessary:", v10);
          return;
        case 2LL:
          id v25 = sub_1001704C4();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v27 = -[CSDProviderCall endedReason](self, "endedReason");
            *(_DWORD *)buf = 134217984;
            int64_t v88 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to remote hangup because ended reason is %ld",  buf,  0xCu);
          }

          -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", 6LL);
          goto LABEL_25;
        case 3LL:
LABEL_25:
          if (-[CSDProviderCall hasStartedConnecting](self, "hasStartedConnecting"))
          {
            id v28 = sub_1001704C4();
            __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            int64_t v29 = -[CSDProviderCall endedReason](self, "endedReason");
            *(_DWORD *)buf = 134217984;
            int64_t v88 = v29;
            unsigned int v14 = "Setting disconnected reason to remote hangup because call has started connecting and ended reason is %ld";
          }

          else
          {
            if (!-[CSDProviderCall isOutgoing](self, "isOutgoing")) {
              return;
            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
            unsigned int v43 = [v42 isTelephonyProvider];

            id v44 = sub_1001704C4();
            __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            BOOL v45 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            if (!v43)
            {
              if (v45)
              {
                int64_t v49 = -[CSDProviderCall endedReason](self, "endedReason");
                *(_DWORD *)buf = 134217984;
                int64_t v88 = v49;
                _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to remote unavailable because outgoing call has not started connecting and ended reason is %ld",  buf,  0xCu);
              }

              id v23 = self;
              uint64_t v24 = 5LL;
              goto LABEL_43;
            }

            if (!v45) {
              goto LABEL_29;
            }
            int64_t v46 = -[CSDProviderCall endedReason](self, "endedReason");
            *(_DWORD *)buf = 134217984;
            int64_t v88 = v46;
            unsigned int v14 = "Setting disconnected reason to remote hangup because outgoing call has not started connecting and ende"
                  "d reason is %ld but call is a telephony call";
          }

          break;
        case 4LL:
          id v30 = sub_1001704C4();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v32 = -[CSDProviderCall endedReason](self, "endedReason");
            *(_DWORD *)buf = 134217984;
            int64_t v88 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to answered elsewhere because ended reason is %ld",  buf,  0xCu);
          }

          id v23 = self;
          uint64_t v24 = 1LL;
          goto LABEL_43;
        case 5LL:
          id v33 = sub_1001704C4();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v35 = -[CSDProviderCall endedReason](self, "endedReason");
            *(_DWORD *)buf = 134217984;
            int64_t v88 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Setting disconnected reason to declined elsewhere because ended reason is %ld",  buf,  0xCu);
          }

          id v23 = self;
          uint64_t v24 = 3LL;
          goto LABEL_43;
        default:
          return;
      }
    }

    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
LABEL_29:

LABEL_30:
    id v23 = self;
    uint64_t v24 = 6LL;
    goto LABEL_43;
  }

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
    int64_t v18 = -[CSDProviderCall endedReason](self, "endedReason");
    *(_DWORD *)buf = 138412546;
    int64_t v88 = (int64_t)v17;
    __int16 v89 = 2048;
    int64_t v90 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "updateForDisconnection failureContext: %@, endedReason: %ld",  buf,  0x16u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
    -[CSDCall setDisconnectedReason:]( self,  "setDisconnectedReason:",  -[CSDProviderCall _switchFromFailureReasonToDisconnectedReason:]( self,  "_switchFromFailureReasonToDisconnectedReason:",  [v20 failureReason]));

    return;
  }

  if ((id)-[CSDProviderCall endedReason](self, "endedReason") == (id)2)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
    unsigned int v22 = [v21 isFaceTimeProvider];

    if (v22) {
      goto LABEL_30;
    }
  }

  id v23 = self;
  uint64_t v24 = 17LL;
LABEL_43:
  -[CSDCall setDisconnectedReason:](v23, "setDisconnectedReason:", v24);
}

- (id)endedReasonUserInfo
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 endedReasonUserInfoForCall:self]);

  return v4;
}

- (int64_t)providerErrorCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  id v3 = [v2 providerErrorCode];

  return (int64_t)v3;
}

- (int64_t)providerEndedReason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  id v3 = [v2 providerEndedReason];

  return (int64_t)v3;
}

- (id)callerNameFromNetwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedCallerName]);

  return v3;
}

- (NSUUID)callGroupUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 participantGroupUUID]);

  return (NSUUID *)v3;
}

- (BOOL)hasBeenRedirected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 hasBeenRedirected];

  return v3;
}

- (id)callHistoryIdentifier
{
  if (-[CSDProviderCall isConversation](self, "isConversation"))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
    id v3 = -[CSDProviderCall callHistoryIdentifier](&v12, "callHistoryIdentifier");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 crossDeviceIdentifier]);
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }

    else
    {
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
      id v9 = -[CSDProviderCall callHistoryIdentifier](&v11, "callHistoryIdentifier");
      id v8 = (id)objc_claimAutoreleasedReturnValue(v9);
    }

    uint64_t v10 = v8;

    return v10;
  }

- (id)handle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteHandle]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  if (!v5)
  {
    int64_t v13 = 0LL;
    goto LABEL_16;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originalPauseDigitsString]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v9]);

    id v7 = (void *)v10;
  }

  id v11 = [v4 type];
  if (v11 == (id)1)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[TUHandle normalizedGenericHandleForValue:](&OBJC_CLASS___TUHandle, "normalizedGenericHandleForValue:", v7));
LABEL_10:
    int64_t v13 = (void *)v12;
    goto LABEL_12;
  }

  if (v11 != (id)2)
  {
    if (v11 != (id)3)
    {
      int64_t v13 = 0LL;
      goto LABEL_15;
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v7));
    goto LABEL_10;
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall isoCountryCode](self, "isoCountryCode"));
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v7,  v14));

LABEL_12:
  if (v13)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 siriDisplayName]);
    [v13 setSiriDisplayName:v7];
LABEL_15:
  }

- (BOOL)isUsingBaseband
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v7 = [v3 hasSet];
  LODWORD(v8) = v4;
  if (((unsigned __int16)v7 & 0x100) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](v2, "mergedCallUpdate", v7, v8));
    LOBYTE(v2) = [v5 isUsingBaseband];
  }

  else if (-[CSDProviderCall service](v2, "service", v7, v8) == 1)
  {
    LODWORD(v2) = +[TUCallCapabilities isWiFiCallingCurrentlyAvailable]( &OBJC_CLASS___TUCallCapabilities,  "isWiFiCallingCurrentlyAvailable") ^ 1;
  }

  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
}

- (BOOL)isBlocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isBlocked];

  return v3;
}

- (BOOL)isVideo
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
  else {
    BOOL video = 0;
  }

  return video;
}

- (BOOL)isThirdPartyVideo
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
  if ([v3 isSystemProvider])
  {
    unsigned __int8 v4 = 0;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
    unsigned __int8 v4 = [v5 hasVideo];
  }

  return v4;
}

- (int64_t)videoStreamToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = [v2 videoStreamToken];

  return (int64_t)v3;
}

- (id)initiator
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unint64_t v10 = (unint64_t)[v3 hasSet];
  LODWORD(v11) = v4;

  if ((v10 & 0x100000000LL) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate", v10, v11));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 initiator]);
LABEL_7:
    uint64_t v8 = v7;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 tuHandle]);

    return v5;
  }

  if (-[CSDProviderCall service](self, "service", v10, v11) == 1
    && !-[CSDProviderCall isOutgoing](self, "isOutgoing"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteHandle]);
    goto LABEL_7;
  }

  id v5 = 0LL;
  return v5;
}

- (BOOL)isRemoteUplinkMuted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isRemoteUplinkMuted];

  return v3;
}

- (id)isoCountryCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 ISOCountryCode]);

  return v3;
}

- (id)localSenderIdentityUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localSenderIdentityUUID]);

  return v3;
}

- (id)localSenderIdentityAccountUUID
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localSenderIdentityAccountUUID]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall localSenderIdentityUUID](self, "localSenderIdentityUUID"));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 senderIdentityForUUID:v5]);
      int v4 = (void *)objc_claimAutoreleasedReturnValue([v7 accountUUID]);
    }

    else
    {
      int v4 = 0LL;
    }
  }

  return v4;
}

- (id)activeRemoteParticipants
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeRemoteParticipantHandles]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeRemoteParticipantHandles]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle tuHandlesWithHandles:](&OBJC_CLASS___CXHandle, "tuHandlesWithHandles:", v6));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  return v7;
}

- (int64_t)audioInterruptionProviderType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = [v2 audioInterruptionProvider];

  if (v3 == (id)1) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)audioInterruptionOperationMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = (char *)[v2 audioInterruptionOperationMode];

  else {
    return (int64_t)v3;
  }
}

- (AVAudioSession)proxyAVAudioSession
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
  if ([v3 isSystemProvider])
  {
    int v4 = 0LL;
  }

  else
  {
    int64_t v5 = -[CSDProviderCall audioInterruptionProviderType](self, "audioInterruptionProviderType");

    if (v5 != 1)
    {
      int v4 = 0LL;
      return (AVAudioSession *)v4;
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVAudioSession retrieveSessionWithID:]( AVAudioSession,  "retrieveSessionWithID:",  [v3 audioSessionID]));
  }

  return (AVAudioSession *)v4;
}

- (id)audioCategory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioCategory]);

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 category]);

    int v4 = (void *)v7;
  }

  return v4;
}

- (int64_t)screenSharingIntention
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int64_t v3 = sub_1000A1640((uint64_t)[v2 screenSharingIntention]);

  return v3;
}

- (id)audioMode
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioMode]);

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 mode]);

    int v4 = (void *)v7;
  }

  return v4;
}

- (BOOL)needsManualInCallSounds
{
  if (-[CSDCall temporaryRequireInCallSounds](self, "temporaryRequireInCallSounds")) {
    return 1;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v5 = [v4 requiresInCallSounds];

  return v5;
}

- (int64_t)soundRegion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int64_t v3 = (char *)[v2 inCallSoundRegion];

  else {
    return (int64_t)v3;
  }
}

- (BOOL)mixesVoiceWithMedia
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 mixesVoiceWithMedia];

  return v3;
}

- (BOOL)ignoresBluetoothDeviceUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 ignoresBluetoothDeviceUID];

  return v3;
}

- (id)providerContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 context]);

  return v3;
}

- (BOOL)isOneToOneModeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isOneToOneModeEnabled];

  return v3;
}

- (int)ttyType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v3 = sub_1000A1614((uint64_t)[v2 ttyType]);

  return v3;
}

- (BOOL)supportsTTYWithVoice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 supportsTTYWithVoice];

  return v3;
}

- (int64_t)bluetoothAudioFormat
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int64_t v3 = sub_1000A1608((uint64_t)[v2 bluetoothAudioFormat]);

  return v3;
}

- (BOOL)isEmergency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isEmergency];

  return v3;
}

- (BOOL)isFailureExpected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isFailureExpected];

  return v3;
}

- (BOOL)supportsEmergencyFallback
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 supportsEmergencyFallback];

  return v3;
}

- (id)handoffDynamicIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 handoffContext]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handoffIdentifier]);

  return v4;
}

- (id)handoffActivityUserInfo
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handoffContext]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffActivityUserInfo]);
  id v6 = [v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v6 setObject:v8 forKeyedSubscript:TUCallUserActivityProviderIdentifierKey];

  id v9 = [v6 copy];
  return v9;
}

- (id)remoteParticipantHandles
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteParticipantHandles]);

  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteParticipantHandles]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle tuHandlesWithHandles:](&OBJC_CLASS___CXHandle, "tuHandlesWithHandles:", v6));

    return v7;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
    id v9 = -[CSDProviderCall remoteParticipantHandles](&v10, "remoteParticipantHandles");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (BOOL)mayRequireBreakBeforeMake
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 mayRequireBreakBeforeMake];

  return v3;
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 prefersExclusiveAccessToCellularNetwork];

  return v3;
}

- (BOOL)shouldSuppressInCallUI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 shouldSuppressInCallUI];

  return v3;
}

- (BOOL)isMutuallyExclusiveCall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isMutuallyExclusiveCall];

  return v3;
}

- (BOOL)isConversation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isConversation];

  return v3;
}

- (id)conversationID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 conversationID]);

  return v3;
}

- (LSApplicationRecord)applicationRecord
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerIdentifier](self, "providerIdentifier"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord csd_applicationRecordForApplicationIdentifier:]( &OBJC_CLASS___LSApplicationRecord,  "csd_applicationRecordForApplicationIdentifier:",  v2));

  return (LSApplicationRecord *)v3;
}

- (id)provider
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerIdentifier](self, "providerIdentifier"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 providerWithIdentifier:v4]);

  return v5;
}

- (int)callStatusFromUnderlyingSource
{
  if (-[CSDProviderCall hasEnded](self, "hasEnded")) {
    return 6;
  }
  if (-[CSDProviderCall isHeld](self, "isHeld")) {
    return 2;
  }
  if (-[CSDProviderCall hasConnected](self, "hasConnected")
    || -[CSDProviderCall isIncoming](self, "isIncoming")
    && -[CSDProviderCall hasStartedConnecting](self, "hasStartedConnecting"))
  {
    return 1;
  }

  if (-[CSDProviderCall isOutgoing](self, "isOutgoing")) {
    return 3;
  }
  return 4;
}

- (BOOL)hasStartedConnecting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall dateStartedConnecting](self, "dateStartedConnecting"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)hasConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall dateConnected](self, "dateConnected"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)hasEnded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall dateEnded](self, "dateEnded"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)hardPauseDigits
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextPauseDigits]);
  if ([v4 isHardPause])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nextPauseDigits]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 digits]);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (int)hardPauseDigitsState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextPauseDigits]);
  unsigned __int8 v5 = [v4 isHardPause];

  if ((v5 & 1) != 0) {
    return 2;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  int v6 = [v7 hasQueuedHardPauseDigits];

  return v6;
}

- (BOOL)isInternational
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerIdentifier](self, "providerIdentifier"));
  if (TUStringsAreCaseInsensitiveEqual(v3, @"com.apple.coretelephony"))
  {
    unsigned __int8 v4 = -[CSDProviderCall isIncoming](self, "isIncoming");

    if ((v4 & 1) != 0)
    {
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 account]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 isoCountryCode]);

      if ([v7 length])
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall isoCountryCode](self, "isoCountryCode"));
        if ([v8 length])
        {
          int v9 = TUStringsAreCaseInsensitiveEqual(v7, @"kr");
          if ((TUStringsAreCaseInsensitiveEqual(v7, @"cn") & 1) != 0
            || (TUStringsAreCaseInsensitiveEqual(v7, @"hk") & 1) != 0)
          {
            int v10 = 1;
          }

          else
          {
            int v10 = TUStringsAreCaseInsensitiveEqual(v7, @"mo");
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall userConfiguration](self, "userConfiguration"));
          unsigned int v16 = [v15 simulateInternationalCall];

          BOOL v11 = 0;
          if (TUStringsAreCaseInsensitiveEqual(v7, v8) && v9 | v10 | v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall remoteParticipantHandles](self, "remoteParticipantHandles"));
            int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 anyObject]);

            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
            if ([v19 length])
            {
              v20 = (void *)_PNCopyInternationalPrefix(v19, v8);
              BOOL v11 = [v20 length] != 0;
            }

            else
            {
              BOOL v11 = 0;
            }
          }

          goto LABEL_23;
        }

        id v13 = sub_1001704C4();
        unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v22 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "International status is false; celluar network ISO country code is not available.",
            v22,
            2u);
        }
      }

      else
      {
        id v12 = sub_1001704C4();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "International status is false; service provider ISO country code is not available.",
            buf,
            2u);
        }
      }

      BOOL v11 = 0;
LABEL_23:

      return v11;
    }
  }

  else
  {
  }

  return 0;
}

- (BOOL)isDomestic
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall handle](self, "handle"));
  id v4 = [v3 type];

  if (v4 != (id)2) {
    return 0;
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 account]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 isoCountryCode]);

  uint64_t v8 = (void *)_PNCopyInternationalCodeForCountry(v7);
  __int128 v9 = INIT_DECOMPOSED_PHONE_NUMBER[1];
  v17[0] = INIT_DECOMPOSED_PHONE_NUMBER[0];
  v17[1] = v9;
  __int128 v10 = INIT_DECOMPOSED_PHONE_NUMBER[3];
  v17[2] = INIT_DECOMPOSED_PHONE_NUMBER[2];
  v17[3] = v10;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall handle](self, "handle"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);

  id v13 = v12;
  if (PNDecomposeForCountry([v13 UTF8String], v7, v17) && *(void *)&v17[0])
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    unsigned __int8 v15 = [v8 isEqualToString:v14];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)isSendingVideo
{
  return -[CSDProviderCall sendingVideo](self, "sendingVideo");
}

- (BOOL)isUplinkMuted
{
  if (-[CSDProviderCall isUnderlyingUplinkMuted](self, "isUnderlyingUplinkMuted")) {
    return 1;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
  unsigned __int8 v4 = [v3 isUplinkMuted];

  return v4;
}

- (BOOL)isDownlinkMuted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
  unsigned __int8 v3 = [v2 isDownlinkMuted];

  return v3;
}

- (unint64_t)initialLinkType
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"]);
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"]);
    id v7 = [v6 unsignedIntegerValue];
  }

  else
  {
    id v7 = 0LL;
  }

  return (unint64_t)v7;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"]);
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"]);
    id v7 = [v6 unsignedIntegerValue];
  }

  else
  {
    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"]);
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerContext](self, "providerContext"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"]);
    id v7 = [v6 unsignedIntegerValue];
  }

  else
  {
    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (int64_t)serviceStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = [v2 serviceStatus];

  if (v3 == (id)1) {
    return 1LL;
  }
  else {
    return 2LL * (v3 == (id)2);
  }
}

- (int64_t)transmissionMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v3 = [v2 transmissionMode];

  if (v3 == (id)1) {
    return 1LL;
  }
  else {
    return 2LL * (v3 == (id)2);
  }
}

- (BOOL)accessoryButtonEventsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 accessoryButtonEventsEnabled];

  return v3;
}

- (BOOL)usesSystemMuting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
  unsigned __int8 v3 = [v2 isSystemProvider];

  return v3;
}

- (BOOL)supportsScreening
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 supportsScreening];

  return v3;
}

- (void)setHeld:(BOOL)a3
{
  if (self->_held != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100050154;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setOutgoing:(BOOL)a3
{
  if (self->_outgoing != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000501E8;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setSendingVideo:(BOOL)a3
{
  if (self->_sendingVideo != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10005027C;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setVideo:(BOOL)a3
{
  if (self->_video != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100050310;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setFailureContext:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_1000503DC;
    v7[3] = &unk_1003D7758;
    void v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setCallGroupUUID:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 participantGroupUUID]);
  char v6 = TUObjectsAreEqualOrNil(v5, v7);

  if ((v6 & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000504B4;
    v8[3] = &unk_1003D7758;
    v8[4] = self;
    id v9 = v7;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v8);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDateConnected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall setDateConnected:](&v4, "setDateConnected:", a3);
  -[CSDProviderCall setFailureContext:](self, "setFailureContext:", 0LL);
  -[CSDProviderCall _sendSoftPauseDigitsIfNecessary](self, "_sendSoftPauseDigitsIfNecessary");
}

- (void)setProviderSource:(id)a3
{
  char v5 = (CXAbstractProviderSource *)a3;
  if (self->_providerSource != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_providerSource, a3);
    char v5 = v6;
  }
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[CSDProviderCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice");
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall setEndpointOnCurrentDevice:](&v10, "setEndpointOnCurrentDevice:", v3);
  if (v5 != v3)
  {
    id v6 = objc_alloc(&OBJC_CLASS___CXSetRelayingCallAction);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v8 = [v6 initWithCallUUID:v7 relaying:v3 ^ 1];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v9 performCallAction:v8 forCall:self];
  }

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[CSDProviderCall isScreening](self, "isScreening");
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall setScreening:](&v11, "setScreening:", v3);
  if (v5 != v3)
  {
    if (!v3)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[CSDProviderCall setDateScreeningEnded:](self, "setDateScreeningEnded:", v6);
    }

    id v7 = objc_alloc(&OBJC_CLASS___CXSetScreeningCallAction);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v9 = [v7 initWithCallUUID:v8 screening:v3];

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v10 performCallAction:v9 forCall:self];
  }

- (void)setInjectingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CSDProviderCall isInjectingAudio](self, "isInjectingAudio") != a3)
  {
    self->_injectingAudio = v3;
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      unsigned int v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "setting injecting audio to %d",  (uint8_t *)&v11,  8u);
    }

    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = -[CSDProviderCall isInjectingAudio](self, "isInjectingAudio");
      int v11 = 67109378;
      unsigned int v12 = v9;
      __int16 v13 = 2112;
      unsigned int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting notification injecting audio changed: %d %@",  (uint8_t *)&v11,  0x12u);
    }

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall notificationCenter](self, "notificationCenter"));
    [v10 postNotificationName:@"CSDCallInjectingAudioChangedNotification" object:self];
  }

- (void)askProviderToAllowAudioInjection:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CSDProviderCall isInjectingAudio](self, "isInjectingAudio") != a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
    unsigned int v6 = [v5 isFaceTimeProvider];

    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___CXSetAllowUplinkAudioInjectionAction);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
      id v12 = [v7 initWithCallUUID:v8 willInject:v3];

      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
      [v9 performCallAction:v12 forCall:self];
    }

    else
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider"));
      unsigned int v11 = [v10 isTelephonyProvider];

      if (v11) {
        -[CSDProviderCall setInjectingAudio:](self, "setInjectingAudio:", v3);
      }
    }
  }

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setBluetoothAudioFormat:](&v6, "setBluetoothAudioFormat:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050A1C;
  v5[3] = &unk_1003D7708;
  v5[4] = self;
  v5[5] = a3;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setMixesVoiceWithMedia:](&v7, "setMixesVoiceWithMedia:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050AF4;
  v5[3] = &unk_1003D7878;
  v5[4] = self;
  BOOL v6 = a3;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setMediaPlaybackOnExternalDevice:](&v7, "setMediaPlaybackOnExternalDevice:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100050B98;
  v5[3] = &unk_1003D7878;
  v5[4] = self;
  BOOL v6 = a3;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (id)startCallActionWithDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall callCenter](self, "callCenter"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100050E00;
  v21[3] = &unk_1003D79F0;
  v21[4] = self;
  id v6 = [v5 anyCallPassesTest:v21];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteHandle]);
  unsigned int v9 = v8;
  if (v8) {
    objc_super v10 = v8;
  }
  else {
    objc_super v10 = -[CXHandle initWithType:](objc_alloc(&OBJC_CLASS___CXHandle), "initWithType:", 2LL);
  }
  unsigned int v11 = v10;

  id v12 = objc_alloc(&OBJC_CLASS___CXStartCallAction);
  __int16 v13 = objc_alloc(&OBJC_CLASS___NSUUID);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  unsigned __int8 v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);
  unsigned int v16 = -[CXStartCallAction initWithCallUUID:handle:](v12, "initWithCallUUID:handle:", v15, v11);

  -[CXStartCallAction setVideo:](v16, "setVideo:", -[CSDProviderCall isVideo](self, "isVideo"));
  -[CXStartCallAction setRelay:]( v16,  "setRelay:",  -[CSDProviderCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice") ^ 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 contactIdentifier]);
  -[CXStartCallAction setContactIdentifier:](v16, "setContactIdentifier:", v17);

  -[CXStartCallAction setUpgrade:](v16, "setUpgrade:", v6);
  -[CXStartCallAction setRetry:](v16, "setRetry:", [v4 isRedial]);
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
  -[CXStartCallAction setLocalSenderIdentityUUID:](v16, "setLocalSenderIdentityUUID:", v18);

  -[CXStartCallAction setShouldSuppressInCallUI:]( v16,  "setShouldSuppressInCallUI:",  [v4 shouldSuppressInCallUI]);
  [v4 localLandscapeAspectRatio];
  -[CXStartCallAction setLocalLandscapeAspectRatio:](v16, "setLocalLandscapeAspectRatio:");
  [v4 localPortraitAspectRatio];
  -[CXStartCallAction setLocalPortraitAspectRatio:](v16, "setLocalPortraitAspectRatio:");
  id v19 = [v4 dialType];
  if (v19 == (id)2)
  {
    -[CXStartCallAction setVoicemail:](v16, "setVoicemail:", 1LL);
  }

  else if (v19 == (id)1)
  {
    -[CXStartCallAction setEmergency:](v16, "setEmergency:", 1LL);
  }

  return v16;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall dialWithRequest:displayContext:](&v34, "dialWithRequest:displayContext:", v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callSourceForDialRequest:v6]);
  if (v9)
  {
    -[CSDProviderCall setBackingCallSource:](self, "setBackingCallSource:", v9);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall startCallActionWithDialRequest:](self, "startCallActionWithDialRequest:", v6));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 siriDisplayName]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
    [v13 setSiriDisplayName:v12];

    objc_initWeak(&location, self);
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    id v28 = sub_100051154;
    int64_t v29 = &unk_1003D8220;
    objc_copyWeak(&v32, &location);
    id v30 = v8;
    id v14 = v10;
    id v31 = v14;
    dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0LL, &v26);
    -[CSDProviderCall setStartCallBlock:](self, "setStartCallBlock:", v15, v26, v27, v28, v29);

    unsigned int v16 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[CSDProviderCall dialDelayForRequest](self, "dialDelayForRequest"));
    uint64_t v17 = ((uint64_t (**)(void, id))v16)[2](v16, v6);
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18)
    {
      id v19 = sub_1001704C4();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[CSDProviderCall dialWithRequest:displayContext:]";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "CSDProviderCall %s: Delaying dial due to Low Power Mode",  buf,  0xCu);
      }

      dispatch_time_t v21 = dispatch_time(0, 1000000000 * (void)[v18 unsignedIntegerValue]);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CSDProviderCall queue](self, "queue"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall startCallBlock](self, "startCallBlock"));
      dispatch_after(v21, (dispatch_queue_t)v22, v23);
    }

    else
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CSDProviderCall startCallBlock](self, "startCallBlock"));
      (*(void (**)(void))(v22 + 16))();
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  else
  {
    id v24 = sub_1001704C4();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1002B32B0();
    }

    -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", 17LL);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (id)_dialDelayForRequest:(id)a3
{
  return 0LL;
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSDProviderCall joinConversationWithRequest: %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callSourceForJoinConversationRequest:v4]);
  -[CSDProviderCall setBackingCallSource:](self, "setBackingCallSource:", v8);

  if (-[CSDCall callStatus](self, "callStatus") == 4)
  {
    -[CSDProviderCall setShouldAcceptDateConnectedProviderUpdates:]( self,  "setShouldAcceptDateConnectedProviderUpdates:",  1LL);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDCall setDateStartedConnecting:](self, "setDateStartedConnecting:", v9);
  }

  if (![v4 originatingUIType])
  {
    id v10 = sub_1001704C4();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1002B3314();
    }
  }

  -[CSDCall setIsSendingAudio:](self, "setIsSendingAudio:", 1LL);
  -[CSDProviderCall setWantsStagingArea:](self, "setWantsStagingArea:", [v4 wantsStagingArea]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
  -[CSDCall setJoinedFromLink:](self, "setJoinedFromLink:", v12 != 0LL);

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 audioSourceIdentifier]);
  -[CSDProviderCall setSourceIdentifier:](self, "setSourceIdentifier:", v13);

  -[CSDProviderCall setIsUnderlyingLinksConnected:](self, "setIsUnderlyingLinksConnected:", 1LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 joinCallAction]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 conversationLink]);
  if (v15
    && (unsigned int v16 = (void *)v15,
        unsigned int v17 = -[CSDProviderCall lockdownModeEnabled](self, "lockdownModeEnabled"),
        v16,
        v17))
  {
    -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", 29LL);
    int64_t v18 = 0LL;
    id v19 = 0LL;
    v20 = 0LL;
  }

  else
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 conversationLink]);
    if (v21
      && (uint64_t v22 = (void *)v21,
          unsigned __int8 v23 = [v4 isJoiningConversationWithLink],
          v22,
          (v23 & 1) == 0))
    {
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v50 callerID]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v26));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v27));
      id v28 = sub_1001704C4();
      int64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v20;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "LMI: callerID is: %@", buf, 0xCu);
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v30 pseudonym]);

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
      int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v31 publicKey]);
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 callerID]);
      if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 callerID]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v25));
      }

      else
      {
        v20 = 0LL;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
      if (v19)
      {
        unsigned int v32 = [v4 isJoiningConversationWithLink];

        if (v32)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v33 pseudonym]);

          objc_super v34 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationLink]);
          int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v34 publicKey]);
        }

        else
        {
          int64_t v18 = 0LL;
          id v19 = 0LL;
        }
      }

      else
      {
        int64_t v18 = 0LL;
      }
    }
  }

  [v14 setCallerID:v20];
  [v14 setPseudonym:v19];
  [v14 setPublicKey:v18];
  [v14 setScreenShareRequestType:0];
  int64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall featureFlags](self, "featureFlags"));
  unsigned int v36 = [v35 usesModernScreenSharingFromMessages];

  if (v36)
  {
    if ([v4 requestToShareScreen])
    {
      uint64_t v37 = 1LL;
    }

    else
    {
      if (![v4 requestToShareMyScreen])
      {
LABEL_31:
        objc_msgSend( v14,  "setShouldSendLegacyScreenSharingInvite:",  objc_msgSend(v4, "shouldSendLegacyScreenSharingInvite"));
        goto LABEL_32;
      }

      uint64_t v37 = 2LL;
    }

    [v14 setScreenShareRequestType:v37];
    goto LABEL_31;
  }

- (void)answerWithRequest:(id)a3
{
  id v4 = a3;
  if (-[CSDProviderCall isScreening](self, "isScreening")
    && ([v4 sendToScreening] & 1) == 0
    && -[CSDCall callStatus](self, "callStatus") == 1)
  {
    -[CSDProviderCall setScreening:](self, "setScreening:", 0LL);
    id v5 = (CXAnswerCallAction *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);
    -[CSDProviderCall setSourceIdentifier:](self, "setSourceIdentifier:", v5);
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
    -[CSDProviderCall answerWithRequest:](&v11, "answerWithRequest:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDCall setDateStartedConnecting:](self, "setDateStartedConnecting:", v6);

    id v7 = objc_alloc(&OBJC_CLASS___CXAnswerCallAction);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v5 = -[CXAnswerCallAction initWithCallUUID:](v7, "initWithCallUUID:", v8);

    if ([v4 behavior] == (id)4 || objc_msgSend(v4, "downgradeToAudio"))
    {
      -[CSDProviderCall setIsSendingVideo:](self, "setIsSendingVideo:", 0LL);
      if (!-[CSDProviderCall isConversation](self, "isConversation")) {
        -[CSDProviderCall setVideo:](self, "setVideo:", 0LL);
      }
      -[CXAnswerCallAction setDowngradeToAudio:](v5, "setDowngradeToAudio:", 1LL);
    }

    else {
      uint64_t v9 = -[CSDProviderCall isSendingVideo](self, "isSendingVideo") ^ 1;
    }
    -[CXAnswerCallAction setPauseVideoToStart:](v5, "setPauseVideoToStart:", v9);
    [v4 localLandscapeAspectRatio];
    -[CXAnswerCallAction setLocalLandscapeAspectRatio:](v5, "setLocalLandscapeAspectRatio:");
    [v4 localPortraitAspectRatio];
    -[CXAnswerCallAction setLocalPortraitAspectRatio:](v5, "setLocalPortraitAspectRatio:");
    -[CXAnswerCallAction setScreening:](v5, "setScreening:", [v4 sendToScreening]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v10 performCallAction:v5 forCall:self];
  }
}

- (void)hold
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100051A4C;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v2);
}

- (void)unhold
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100051AEC;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v2);
}

- (void)_setIsOnHold:(BOOL)a3
{
  BOOL v3 = a3;
  if ((-[CSDProviderCall isPTT](self, "isPTT") & 1) == 0)
  {
    id v5 = objc_alloc(&OBJC_CLASS___CXSetHeldCallAction);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v10 = -[CXSetHeldCallAction initWithCallUUID:onHold:](v5, "initWithCallUUID:onHold:", v6, v3);

    if (-[CSDProviderCall status](self, "status") == 1 && v3)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
      id v8 = [v7 dequeueAllPauseDigits];
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v9 performCallAction:v10 forCall:self];
  }

- (void)groupWithOtherCall:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  id v4 = a3;
  -[CSDProviderCall groupWithOtherCall:](&v10, "groupWithOtherCall:", v4);
  id v5 = objc_alloc(&OBJC_CLASS___CXSetGroupCallAction);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCall uniqueProxyIdentifierUUID]( self,  "uniqueProxyIdentifierUUID",  v10.receiver,  v10.super_class));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifierUUID]);

  id v8 = -[CXSetGroupCallAction initWithCallUUID:callUUIDToGroupWith:]( v5,  "initWithCallUUID:callUUIDToGroupWith:",  v6,  v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v9 performCallAction:v8 forCall:self];
}

- (void)ungroup
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall ungroup](&v7, "ungroup");
  BOOL v3 = objc_alloc(&OBJC_CLASS___CXSetGroupCallAction);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v5 = -[CXSetGroupCallAction initWithCallUUID:callUUIDToGroupWith:]( v3,  "initWithCallUUID:callUUIDToGroupWith:",  v4,  0LL);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v6 performCallAction:v5 forCall:self];
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall disconnectWithReason:](&v24, "disconnectWithReason:");
  if ((-[CSDProviderCall isPTT](self, "isPTT") & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall startCallBlock](self, "startCallBlock"));

    if (v5)
    {
      id v6 = sub_1001704C4();
      objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect call while it is in low power mode delay- cancelling start call block and marking disconnected",  buf,  2u);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall startCallBlock](self, "startCallBlock"));
      dispatch_block_cancel(v8);

      -[CSDProviderCall setStartCallBlock:](self, "setStartCallBlock:", 0LL);
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
      -[CSDProviderCall setFailureContext:](self, "setFailureContext:", v9);

      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
      [v10 setFailureReason:0];

      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[CSDCall setDateEnded:](self, "setDateEnded:", v11);

      -[CSDCall propertiesChanged](self, "propertiesChanged");
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));

      if (!v12)
      {
        __int16 v13 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
        -[CSDProviderCall setFailureContext:](self, "setFailureContext:", v13);
      }

      int64_t v14 = -[CSDProviderCall _switchToCXCallFailureReasonFromTUCallDisconnectedReason:]( self,  "_switchToCXCallFailureReasonFromTUCallDisconnectedReason:",  v3);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
      [v15 setFailureReason:v14];

      id v16 = sub_1001704C4();
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
        id v19 = [v18 failureReason];
        *(_DWORD *)buf = 134217984;
        id v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "disconnectWithReason: set failureReason to %lu",  buf,  0xCu);
      }

      v20 = objc_alloc(&OBJC_CLASS___CXEndCallAction);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
      uint64_t v22 = -[CXEndCallAction initWithCallUUID:](v20, "initWithCallUUID:", v21);

      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
      [v23 performCallAction:v22 forCall:self];
    }
  }

- (void)setProviderFailureReasonIfNecessary:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));

  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
    -[CSDProviderCall setFailureContext:](self, "setFailureContext:", v6);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
  id v8 = [v7 providerEndedReason];

  if (!v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDProviderCall failureContext](self, "failureContext"));
    [v9 setProviderEndedReason:a3];
  }

- (void)setIsSendingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CSDProviderCall isVideo](self, "isVideo"))
  {
    id v5 = objc_alloc(&OBJC_CLASS___CXSetSendingVideoCallAction);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v8 = [v5 initWithCallUUID:v6 sendingVideo:v3];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v7 performCallAction:v8 forCall:self];
  }

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "attributes: %@", buf, 0xCu);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDProviderCall cxScreenShareAttributesForCallAttributes:]( self,  "cxScreenShareAttributesForCallAttributes:",  v4));
  id v8 = objc_alloc(&OBJC_CLASS___CXSetScreenShareAttributesCallAction);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v10 = [v8 initWithCallUUID:v9 attributes:v7];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v11 performCallAction:v10 forCall:self];

  __int16 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_100052304;
  id v16 = &unk_1003D7758;
  unsigned int v17 = self;
  id v18 = v4;
  id v12 = v4;
  -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", &v13);
  -[CSDCall propertiesChanged](self, "propertiesChanged", v13, v14, v15, v16, v17);
}

- (void)setSharingScreen:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setSharingScreen:](&v15, "setSharingScreen:");
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setSharingScreen: %d", buf, 8u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CXSetSharingScreenCallAction);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v9 = [v7 initWithCallUUID:v8 sharingScreen:v3];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v10 performCallAction:v9 forCall:self];

  self->_sharingScreen = v3;
  unsigned int v11 = +[AVCScreenCapture captureCapabilities](&OBJC_CLASS___AVCScreenCapture, "captureCapabilities");
  if (v3 && v11 == 1) {
    self->_sendingVideo = 0;
  }
  if (!v3)
  {
    id v12 = sub_1001704C4();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Clearing _screenShareAttributes", buf, 2u);
    }

    screenShareAttributes = self->_screenShareAttributes;
    self->_screenShareAttributes = 0LL;
  }

  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setSharingScreen:](&v24, "setSharingScreen:", v4);
  id v7 = objc_alloc(&OBJC_CLASS___CXSetSharingScreenCallAction);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v9 = [v7 initWithCallUUID:v8 sharingScreen:v4];

  id v10 = objc_alloc_init(&OBJC_CLASS___CXScreenShareAttributes);
  objc_msgSend(v10, "setDeviceFamily:", objc_msgSend(v6, "deviceFamily"));
  objc_msgSend(v10, "setDeviceHomeButtonType:", objc_msgSend(v6, "deviceHomeButtonType"));
  objc_msgSend(v10, "setStyle:", objc_msgSend(v6, "style"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 displayID]);
  [v10 setDisplayID:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 frameRate]);
  [v10 setFrameRate:v12];

  objc_msgSend(v10, "setWindowed:", objc_msgSend(v6, "isWindowed"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 windowUUID]);
  [v10 setWindowUUID:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 displayScale]);
  [v10 setDisplayScale:v14];

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 cornerRadius]);
  [v10 setCornerRadius:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 scaleFactor]);
  [v10 setScaleFactor:v16];

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v6 systemRootLayerTransform]);
  [v10 setSystemRootLayerTransform:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 originalResolution]);
  id v19 = [v18 copy];
  [v10 setOriginalResolution:v19];

  [v9 setAttributes:v10];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v20 performCallAction:v9 forCall:self];

  self->_sharingScreen = v4;
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = (TUCallScreenShareAttributes *)v6;
  id v22 = v6;

  unsigned int v23 = +[AVCScreenCapture captureCapabilities](&OBJC_CLASS___AVCScreenCapture, "captureCapabilities");
  if (v4 && v23 == 1) {
    self->_sendingVideo = 0;
  }
  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDCall setUplinkMuted:](&v9, "setUplinkMuted:");
  if (-[CSDProviderCall isUplinkMuted](self, "isUplinkMuted") != v3)
  {
    -[CSDProviderCall setUnderlyingUplinkMuted:](self, "setUnderlyingUplinkMuted:", v3);
    if ((-[CSDProviderCall isPTT](self, "isPTT") & 1) == 0)
    {
      id v5 = objc_alloc(&OBJC_CLASS___CXSetMutedCallAction);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
      id v7 = -[CXSetMutedCallAction initWithCallUUID:muted:](v5, "initWithCallUUID:muted:", v6, v3);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
      [v8 performCallAction:v7 forCall:self];
    }

    -[CSDCall updateUplinkMuted:](self, "updateUplinkMuted:", v3);
  }

- (void)setTtyType:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  -[CSDProviderCall setTtyType:](&v9, "setTtyType:");
  if (-[CSDProviderCall ttyType](self, "ttyType") != a3)
  {
    id v5 = objc_alloc(&OBJC_CLASS___CXSetTTYTypeCallAction);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
    id v7 = [v5 initWithCallUUID:v6 ttyType:sub_1000A15F0(a3)];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
    [v8 performCallAction:v7 forCall:self];
  }

- (void)setUnderlyingUplinkMuted:(BOOL)a3
{
}

- (void)setUnderlyingUplinkMuted:(BOOL)a3 bottomUpMute:(BOOL)a4
{
  BOOL v4 = a3;
  if (!a4)
  {
    if (!a3
      || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall provider](self, "provider")),
          unsigned int v7 = [v6 isTelephonyProvider],
          v6,
          v7))
    {
      id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDProviderCall systemControllerSetUplinkMutedBlock]( self,  "systemControllerSetUplinkMutedBlock"));
      v8[2](v8, v4);
    }
  }

  if (self->_underlyingUplinkMuted != v4)
  {
    self->_underlyingUplinkMuted = v4;
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
      *(_DWORD *)buf = 67109378;
      BOOL v18 = v4;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AVAudioSession muteSessionInput: %d for %@",  buf,  0x12u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall proxyAVAudioSession](self, "proxyAVAudioSession"));
    id v16 = 0LL;
    [v12 muteSessionInput:v4 error:&v16];
    id v13 = v16;

    if (v13)
    {
      id v14 = sub_1001704C4();
      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1002B3380();
      }
    }

    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setDownlinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
  [v4 setDownlinkMuted:v3];
}

- (void)sendHardPauseDigits
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
    int v12 = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    objc_super v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "for call: %@ pauseDigitsQueue: %@",  (uint8_t *)&v12,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextPauseDigits]);

  if (!v7)
  {
    id v9 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v12) = 0;
    id v10 = "[WARN] No next pause digits exist";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 2u);
    goto LABEL_11;
  }

  if (![v7 isHardPause])
  {
    id v11 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v12) = 0;
    id v10 = "[WARN] Next pause digits are not hard pause";
    goto LABEL_10;
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 digits]);
  -[CSDProviderCall _sendDTMFDigits:type:](self, "_sendDTMFDigits:type:", v8, 3LL);
LABEL_11:
}

- (void)playRemoteDTMFToneForKey:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "for call: %@ key: %d", (uint8_t *)&v10, 0x12u);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  id v8 = [v7 dequeueAllPauseDigits];

  LOWORD(v10) = v3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v10,  1LL));
  -[CSDProviderCall _sendDTMFDigits:type:](self, "_sendDTMFDigits:type:", v9, 1LL);
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = sub_1001704C4();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18.double width = width;
    v18.double height = height;
    id v8 = NSStringFromSize(v18);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v14 = 138412546;
    objc_super v15 = self;
    __int16 v16 = 2112;
    BOOL v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "for call: %@ remoteVideoPresentationSize: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___CXSetVideoPresentationSizeCallAction);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v12 = objc_msgSend(v10, "initWithCallUUID:videoPresentationSize:", v11, width, height);

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v13 performCallAction:v12 forCall:self];
}

- (void)setRemoteVideoPresentationState:(int)a3
{
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    int v14 = self;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "for call: %@ remoteVideoPresentationState: %d",  (uint8_t *)&v13,  0x12u);
  }

  uint64_t v7 = (a3 - 1);
  else {
    uint64_t v8 = 0LL;
  }
  id v9 = objc_alloc(&OBJC_CLASS___CXSetVideoPresentationStateCallAction);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v11 = [v9 initWithCallUUID:v10 videoPresentationState:v8];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v12 performCallAction:v11 forCall:self];
}

- (void)dequeueNextPauseDigits
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dequeueing next pause digits", v7, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  id v6 = [v5 dequeueNextPauseDigits];

  -[CSDProviderCall _sendSoftPauseDigitsIfNecessary](self, "_sendSoftPauseDigitsIfNecessary");
}

- (id)cxScreenShareAttributesForCallAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CXScreenShareAttributes);
  objc_msgSend(v4, "setDeviceFamily:", objc_msgSend(v3, "deviceFamily"));
  objc_msgSend(v4, "setDeviceHomeButtonType:", objc_msgSend(v3, "deviceHomeButtonType"));
  objc_msgSend(v4, "setStyle:", objc_msgSend(v3, "style"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 displayID]);
  [v4 setDisplayID:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 frameRate]);
  [v4 setFrameRate:v6];

  objc_msgSend(v4, "setWindowed:", objc_msgSend(v3, "isWindowed"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 windowUUID]);
  [v4 setWindowUUID:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 displayScale]);
  [v4 setDisplayScale:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 cornerRadius]);
  [v4 setCornerRadius:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 scaleFactor]);
  [v4 setScaleFactor:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 systemRootLayerTransform]);
  [v4 setSystemRootLayerTransform:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 originalResolution]);
  id v13 = [v12 copy];
  [v4 setOriginalResolution:v13];

  return v4;
}

- (id)tuScreenShareAttributesForScreenAttributes:(id)a3
{
  if (self->_screenShareAttributes)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowUUID]);

    -[TUCallScreenShareAttributes setWindowUUID:](self->_screenShareAttributes, "setWindowUUID:", v5);
    id v6 = self->_screenShareAttributes;
  }

  else
  {
    id v7 = a3;
    id v6 = objc_alloc_init(&OBJC_CLASS___TUCallScreenShareAttributes);
    -[TUCallScreenShareAttributes setDeviceFamily:](v6, "setDeviceFamily:", [v7 deviceFamily]);
    -[TUCallScreenShareAttributes setDeviceHomeButtonType:]( v6,  "setDeviceHomeButtonType:",  [v7 deviceHomeButtonType]);
    -[TUCallScreenShareAttributes setStyle:](v6, "setStyle:", [v7 style]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayID]);
    -[TUCallScreenShareAttributes setDisplayID:](v6, "setDisplayID:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 frameRate]);
    -[TUCallScreenShareAttributes setFrameRate:](v6, "setFrameRate:", v9);

    -[TUCallScreenShareAttributes setWindowed:](v6, "setWindowed:", [v7 isWindowed]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 windowUUID]);
    -[TUCallScreenShareAttributes setWindowUUID:](v6, "setWindowUUID:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 displayScale]);
    -[TUCallScreenShareAttributes setDisplayScale:](v6, "setDisplayScale:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 scaleFactor]);
    -[TUCallScreenShareAttributes setScaleFactor:](v6, "setScaleFactor:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 systemRootLayerTransform]);
    -[TUCallScreenShareAttributes setSystemRootLayerTransform:](v6, "setSystemRootLayerTransform:", v13);

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 originalResolution]);
    id v15 = [v14 copy];
    -[TUCallScreenShareAttributes setOriginalResolution:](v6, "setOriginalResolution:", v15);
  }

  return v6;
}

- (void)_sendDTMFDigits:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sending DTMF digits: %@ type: %ld",  (uint8_t *)&v13,  0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS___CXPlayDTMFCallAction);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall uniqueProxyIdentifierUUID](self, "uniqueProxyIdentifierUUID"));
  id v11 = -[CXPlayDTMFCallAction initWithCallUUID:digits:type:](v9, "initWithCallUUID:digits:type:", v10, v6, a4);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall providerCallDelegate](self, "providerCallDelegate"));
  [v12 performCallAction:v11 forCall:self];
}

- (void)_sendSoftPauseDigitsIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall pauseDigitsQueue](self, "pauseDigitsQueue"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextPauseDigits]);

  if (-[CSDProviderCall isConnected](self, "isConnected")
    && v4
    && ([v4 isHardPause] & 1) == 0)
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 digits]);
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found queued soft pause digits: %@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 digits]);
    -[CSDProviderCall _sendDTMFDigits:type:](self, "_sendDTMFDigits:type:", v8, 2LL);
  }
}

- (int64_t)_switchToCXCallFailureReasonFromTUCallDisconnectedReason:(int)a3
{
  if (a3 < 0x34 && ((0xA33E27DCD0001uLL >> a3) & 1) != 0)
  {
    int64_t v6 = qword_100378E18[a3];
  }

  else
  {
    id v4 = sub_1001704C4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Set failure reason CXCallFailureReasonGenericError, disconnect reason: %ld",  (uint8_t *)&v10,  0xCu);
    }

    int64_t v6 = 0LL;
  }

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    uint64_t v11 = a3;
    __int16 v12 = 2048;
    int64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "disconnect reason: %ld, failureReason: %ld",  (uint8_t *)&v10,  0x16u);
  }

  return v6;
}

- (void)pauseDigitsQueueChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "for pauseDigitsQueue: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDProviderCall;
  id v4 = a3;
  -[CSDCall handleAudioSessionActivationStateChangedTo:](&v6, "handleAudioSessionActivationStateChangedTo:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall backingCallSource](self, "backingCallSource", v6.receiver, v6.super_class));
  [v5 handleAudioSessionActivationStateChangedTo:v4];
}

- (id)activeRemoteParticipantForCallUpdate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 activeRemoteParticipant]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  if ([v5 length])
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sandboxExtendedImageURL]);
    if (v6) {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall imageURLForCXSandboxExtendedURL:](self, "imageURLForCXSandboxExtendedURL:", v6));
    }
    else {
      int v7 = 0LL;
    }
    id v8 = [[TUMutableParticipant alloc] initWithName:v5];
    [v8 setImageURL:v7];
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = [v8 copy];

  return v9;
}

- (id)imageURLForCXSandboxExtendedURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "csd_isSymbolicLink"))
    {
      id v5 = sub_1001704C4();
      objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v35 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[WARN] Symbolic link found for URL %@",  buf,  0xCu);
      }

      int v7 = 0LL;
      goto LABEL_35;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    if (![v9 length])
    {
      id v15 = sub_1001704C4();
      int64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v35 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not determine source file for URL %@",  buf,  0xCu);
      }

      id v14 = 0LL;
      objc_super v6 = 0LL;
      int v7 = 0LL;
      goto LABEL_34;
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 relativePath]);
    unsigned int v11 = [v10 isEqualToString:@"/stock"];

    if (v11)
    {
      id v12 = sub_1001704C4();
      int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not copying generic image", buf, 2u);
      }

      int v7 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", @"/stock");
      id v14 = 0LL;
      objc_super v6 = 0LL;
      goto LABEL_34;
    }

    id v17 = v9;
    if ([v17 length])
    {
      id v33 = 0LL;
      NSSize v18 = -[CSDSandboxExtensionDirectory initWithName:error:]( objc_alloc(&OBJC_CLASS___CSDSandboxExtensionDirectory),  "initWithName:error:",  @"Images",  &v33);
      id v19 = v33;
      id v14 = v19;
      if (v18)
      {
        id v32 = v19;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDSandboxExtensionDirectory createLinkIfNecessaryWithFilename:toURL:error:]( v18,  "createLinkIfNecessaryWithFilename:toURL:error:",  v17,  v8,  &v32));
        id v21 = v32;

        if (!v20)
        {
          id v22 = sub_1001704C4();
          unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            int64_t v35 = v8;
            __int16 v36 = 2112;
            id v37 = v17;
            __int16 v38 = 2112;
            id v39 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Copying URL '%@' to filename '%@'failed with error %@",  buf,  0x20u);
          }
        }

        uint64_t v24 = (uint64_t)[v4 sandboxExtensionHandle];
        if (v24 >= 1)
        {
          uint64_t v25 = v24;
          id v26 = sub_1001704C4();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Releasing sandbox extension handle",  buf,  2u);
          }

          sandbox_extension_release(v25);
        }

        objc_super v6 = v20;
        id v14 = v21;
        goto LABEL_33;
      }

      id v29 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1002B33E4();
      }
    }

    else
    {
      id v28 = sub_1001704C4();
      NSSize v18 = (CSDSandboxExtensionDirectory *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v35 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not determine destination file for URL %@",  buf,  0xCu);
      }

      id v14 = 0LL;
    }

    objc_super v6 = 0LL;
LABEL_33:

    int v7 = v6;
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }

  int v7 = 0LL;
LABEL_36:

  return v7;
}

- (BOOL)isReRing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDProviderCall mergedCallUpdate](self, "mergedCallUpdate"));
  unsigned __int8 v3 = [v2 isReRing];

  return v3;
}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (void)setActiveRemoteParticipant:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (id)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (id)tokens
{
  return self->_tokens;
}

- (BOOL)isExpanseProvider
{
  return self->_expanseProvider;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return self->_mediaPlaybackOnExternalDevice;
}

- (NSDictionary)silencingUserInfo
{
  return self->_silencingUserInfo;
}

- (void)setSilencingUserInfo:(id)a3
{
}

- (BOOL)isUnderlyingUplinkMuted
{
  return self->_underlyingUplinkMuted;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setCallCenter:(id)a3
{
}

- (BOOL)isInjectingAudio
{
  return self->_injectingAudio;
}

- (id)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  self->_isUnderlyingLinksConnected = a3;
}

- (CSDProviderCallDelegate)providerCallDelegate
{
  return (CSDProviderCallDelegate *)objc_loadWeakRetained((id *)&self->_providerCallDelegate);
}

- (void)setProviderCallDelegate:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (CXCallSource)backingCallSource
{
  return self->_backingCallSource;
}

- (void)setBackingCallSource:(id)a3
{
}

- (CXAbstractProviderSource)providerSource
{
  return self->_providerSource;
}

- (BOOL)isHeld
{
  return self->_held;
}

- (int64_t)endedReason
{
  return self->_endedReason;
}

- (void)setEndedReason:(int64_t)a3
{
  self->_endedReason = a3;
}

- (BOOL)sendingVideo
{
  return self->_sendingVideo;
}

- (BOOL)shouldAcceptDateConnectedProviderUpdates
{
  return self->_shouldAcceptDateConnectedProviderUpdates;
}

- (void)setShouldAcceptDateConnectedProviderUpdates:(BOOL)a3
{
  self->_shouldAcceptDateConnectedProviderUpdates = a3;
}

- (CXCallFailureContext)failureContext
{
  return self->_failureContext;
}

- (void)setUsesSystemMutingBlock:(id)a3
{
}

- (void)setSystemControllerUplinkMutedBlock:(id)a3
{
}

- (void)setSystemControllerSetUplinkMutedBlock:(id)a3
{
}

- (id)dialDelayForRequest
{
  return self->_dialDelayForRequest;
}

- (void)setDialDelayForRequest:(id)a3
{
}

- (CXCallUpdate)mergedCallUpdate
{
  return self->_mergedCallUpdate;
}

- (void)setMergedCallUpdate:(id)a3
{
}

- (CSDPauseDigitsQueue)pauseDigitsQueue
{
  return self->_pauseDigitsQueue;
}

- (void)setPauseDigitsQueue:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setDefaultNotificationCenter:(id)a3
{
}

- (TUDynamicCallDisplayContext)dynamicDisplayContext
{
  return self->_dynamicDisplayContext;
}

- (void)setDynamicDisplayContext:(id)a3
{
}

- (id)startCallBlock
{
  return self->_startCallBlock;
}

- (void)setStartCallBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end