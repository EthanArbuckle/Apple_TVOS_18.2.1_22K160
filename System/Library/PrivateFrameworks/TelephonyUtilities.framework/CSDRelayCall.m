@interface CSDRelayCall
- (BOOL)canBeAnsweredWithAudioOrVideoRelayWithRequest:(id)a3;
- (BOOL)canBeAnsweredWithRequest:(id)a3;
- (BOOL)canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:(id)a3;
- (BOOL)cannotRelayAudioOrVideo;
- (BOOL)isConferenceActive;
- (BOOL)isConversation;
- (BOOL)isEmergency;
- (BOOL)isFailureExpected;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isOutgoing;
- (BOOL)isRemoteUplinkMuted;
- (BOOL)isSOS;
- (BOOL)isSendingAudio;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVoicemail;
- (BOOL)needsManualInCallSounds;
- (BOOL)shouldOwnMuteHandler;
- (BOOL)supportsDisplayingFaceTimeAudioCalls;
- (BOOL)supportsEmergencyFallback;
- (BOOL)supportsScreening;
- (BOOL)supportsTTYWithVoice;
- (CSDRelayCall)initWithRelayMessage:(id)a3 outgoing:(BOOL)a4;
- (CSDRelayCallDelegate)relayDelegate;
- (NSDictionary)remoteInviteDictionary;
- (NSSet)remoteParticipantHandles;
- (NSString)callerNameFromNetwork;
- (NSString)isoCountryCode;
- (NSUUID)callGroupUUID;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallDisplayContext)displayContext;
- (TUCallProvider)localProvider;
- (TUCallProvider)provider;
- (TUHandle)handle;
- (TUJoinConversationRequest)joinConversationRequest;
- (id)audioCategory;
- (id)audioMode;
- (id)initOutgoingWithDialRequest:(id)a3;
- (id)initOutgoingWithJoinConversationRequest:(id)a3;
- (int)callRelaySupport;
- (int)callStatus;
- (int)originatingUIType;
- (int)ttyType;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bluetoothAudioFormat;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (int64_t)spatialAudioSourceIdentifier;
- (unint64_t)initialLinkType;
- (void)answerWithRequest:(id)a3;
- (void)becomeEndpointForPullFromRemoteDevice;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnectWithReason:(int)a3;
- (void)groupWithOtherCall:(id)a3;
- (void)hold;
- (void)joinConversationWithRequest:(id)a3;
- (void)performUplinkMuted:(BOOL)a3;
- (void)playLocalDTMFToneForKey:(unsigned __int8)a3;
- (void)sendHardPauseDigits;
- (void)setBluetoothAudioFormat:(int64_t)a3;
- (void)setCallGroupUUID:(id)a3;
- (void)setCallStatus:(int)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setCannotRelayAudioOrVideo:(BOOL)a3;
- (void)setConversation:(BOOL)a3;
- (void)setDisplayContext:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHardPauseDigits:(id)a3;
- (void)setHardPauseDigitsState:(int)a3;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setIsSendingAudio:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJoinConversationRequest:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocallyConnected;
- (void)setLocallyConnecting;
- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3;
- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3 stopConference:(BOOL)a4;
- (void)setLocallyHasSentInvitation;
- (void)setLocallyHasStartedOutgoing;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setRelayDelegate:(id)a3;
- (void)setRemoteInviteDictionary:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setSOS:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setTtyType:(int)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)startConferenceForAnsweredCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)startConferenceForDialedCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)startConferenceForPulledCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4;
- (void)stopConference;
- (void)ungroup;
- (void)unhold;
- (void)updateWithRelayMessage:(id)a3;
@end

@implementation CSDRelayCall

- (id)initOutgoingWithDialRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  v6 = -[CSDRelayCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:]( self,  "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:",  v5,  [v4 endpointOnCurrentDevice]);

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    localSenderIdentityUUID = v6->_localSenderIdentityUUID;
    v6->_localSenderIdentityUUID = (NSUUID *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 localSenderIdentityAccountUUID]);
    localSenderIdentityAccountUUID = v6->_localSenderIdentityAccountUUID;
    v6->_localSenderIdentityAccountUUID = (NSUUID *)v9;

    v6->_ttyType = TUCallTTYTypeForTUDialRequestTTYType([v4 ttyType]);
    -[CSDCall setupInputMuteHandlerWithFeatureFlags:](v6, "setupInputMuteHandlerWithFeatureFlags:", 0LL);
  }

  return v6;
}

- (id)initOutgoingWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  uint64_t v7 = -[CSDRelayCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:]( self,  "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:",  v6,  [v4 endpointOnCurrentDevice]);

  if (v7)
  {
    -[CSDRelayCall setConversation:](v7, "setConversation:", 1LL);
    v8 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
    v10 = -[NSMutableSet initWithCapacity:](v8, "initWithCapacity:", [v9 count]);

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteMembers", 0));
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) handles]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 anyObject]);
          -[NSMutableSet addObject:](v10, "addObject:", v17);

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }

    remoteParticipantHandles = v7->_remoteParticipantHandles;
    v7->_remoteParticipantHandles = &v10->super;

    -[CSDCall setupInputMuteHandlerWithFeatureFlags:](v7, "setupInputMuteHandlerWithFeatureFlags:", 0LL);
  }

  return v7;
}

- (CSDRelayCall)initWithRelayMessage:(id)a3 outgoing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  v8 = -[CSDRelayCall initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v7);

  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 tuHandle]);
    handle = v8->_handle;
    v8->_handle = (TUHandle *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 isoCountryCode]);
    id v12 = (NSString *)[v11 copy];
    isoCountryCode = v8->_isoCountryCode;
    v8->_isoCountryCode = v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 callerNameFromNetwork]);
    v15 = (NSString *)[v14 copy];
    callerNameFromNetwork = v8->_callerNameFromNetwork;
    v8->_callerNameFromNetwork = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 tuProvider]);
    provider = v8->_provider;
    v8->_provider = (TUCallProvider *)v17;

    v8->_failureExpected = [v6 isFailureExpected];
    v8->_supportsEmergencyFallback = [v6 supportsEmergencyFallback];
    v8->_video = [v6 isVideo];
    v8->_voicemail = [v6 isVoicemail];
    v8->_needsManualInCallSounds = [v6 needsManualInCallSounds];
    v8->_outgoing = v4;
    if (v4) {
      int v19 = 3;
    }
    else {
      int v19 = 4;
    }
    v8->_callStatus = v19;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 inviteData]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 relayInviteDictionary]);
    __int128 v22 = (NSDictionary *)[v21 copy];
    remoteInviteDictionary = v8->_remoteInviteDictionary;
    v8->_remoteInviteDictionary = v22;

    v8->_remoteUplinkMuted = [v6 isRemoteUplinkMuted];
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v6 localSenderIdentityUUID]);
    localSenderIdentityUUID = v8->_localSenderIdentityUUID;
    v8->_localSenderIdentityUUID = (NSUUID *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v6 localSenderIdentityAccountUUID]);
    localSenderIdentityAccountUUID = v8->_localSenderIdentityAccountUUID;
    v8->_localSenderIdentityAccountUUID = (NSUUID *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 remoteParticipantTUHandles]);
    remoteParticipantHandles = v8->_remoteParticipantHandles;
    v8->_remoteParticipantHandles = (NSSet *)v28;

    v8->_ttyType = [v6 ttyType];
    v8->_supportsTTYWithVoice = [v6 supportsTTYWithVoice];
    -[CSDCall setSupportsDTMFUpdates:](v8, "setSupportsDTMFUpdates:", [v6 supportsDTMFUpdates]);
    -[CSDRelayCall setConversation:](v8, "setConversation:", [v6 hasGroupUUIDString]);
    v30 = objc_alloc(&OBJC_CLASS___NSUUID);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUIDString]);
    v32 = -[NSUUID initWithUUIDString:](v30, "initWithUUIDString:", v31);
    -[CSDRelayCall setCallGroupUUID:](v8, "setCallGroupUUID:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceIdentifier]);
    -[CSDRelayCall setSourceIdentifier:](v8, "setSourceIdentifier:", v33);

    -[CSDCall setSoundRegion:](v8, "setSoundRegion:", [v6 soundRegion]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 callModel]);
    -[CSDCall setModel:](v8, "setModel:", v34);

    -[CSDCall setupInputMuteHandlerWithFeatureFlags:](v8, "setupInputMuteHandlerWithFeatureFlags:", 0LL);
  }

  return v8;
}

- (void)updateWithRelayMessage:(id)a3
{
  id v18 = a3;
  if ([v18 hasProtoProvider])
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v18 tuProvider]);
    -[CSDRelayCall setProvider:](self, "setProvider:", v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v18 tuHandle]);
  -[CSDRelayCall setHandle:](self, "setHandle:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v18 isoCountryCode]);
  -[CSDRelayCall setIsoCountryCode:](self, "setIsoCountryCode:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v18 callerNameFromNetwork]);
  -[CSDRelayCall setCallerNameFromNetwork:](self, "setCallerNameFromNetwork:", v7);

  -[CSDRelayCall setVideo:](self, "setVideo:", [v18 isVideo]);
  -[CSDRelayCall setVoicemail:](self, "setVoicemail:", [v18 isVoicemail]);
  -[CSDRelayCall setNeedsManualInCallSounds:]( self,  "setNeedsManualInCallSounds:",  [v18 needsManualInCallSounds]);
  -[CSDCall setSoundRegion:](self, "setSoundRegion:", [v18 soundRegion]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v18 sourceIdentifier]);
  -[CSDRelayCall setSourceIdentifier:](self, "setSourceIdentifier:", v8);

  -[CSDRelayCall setEmergency:](self, "setEmergency:", [v18 isEmergency]);
  -[CSDRelayCall setFailureExpected:](self, "setFailureExpected:", [v18 isFailureExpected]);
  -[CSDRelayCall setSupportsEmergencyFallback:]( self,  "setSupportsEmergencyFallback:",  [v18 supportsEmergencyFallback]);
  -[CSDRelayCall setSOS:](self, "setSOS:", [v18 isSOS]);
  -[CSDCall setSupportsDTMFUpdates:](self, "setSupportsDTMFUpdates:", [v18 supportsDTMFUpdates]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v18 callModel]);
  -[CSDCall setModel:](self, "setModel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall displayContext](self, "displayContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v18 displayContext]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 displayContextByMergingWithDisplayContext:v11]);
  -[CSDRelayCall setDisplayContext:](self, "setDisplayContext:", v12);

  -[CSDRelayCall setRemoteUplinkMuted:](self, "setRemoteUplinkMuted:", [v18 isRemoteUplinkMuted]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v18 localSenderIdentityUUID]);
  -[CSDRelayCall setLocalSenderIdentityUUID:](self, "setLocalSenderIdentityUUID:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v18 localSenderIdentityAccountUUID]);
  -[CSDRelayCall setLocalSenderIdentityAccountUUID:](self, "setLocalSenderIdentityAccountUUID:", v14);

  -[CSDRelayCall setTtyType:](self, "setTtyType:", [v18 ttyType]);
  -[CSDRelayCall setSupportsTTYWithVoice:](self, "setSupportsTTYWithVoice:", [v18 supportsTTYWithVoice]);
  -[CSDRelayCall setOriginatingUIType:](self, "setOriginatingUIType:", [v18 originatingUIType]);
  -[CSDRelayCall setConversation:](self, "setConversation:", [v18 hasGroupUUIDString]);
  if ([v18 hasGroupUUIDString])
  {
    v15 = objc_alloc(&OBJC_CLASS___NSUUID);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v18 groupUUIDString]);
    uint64_t v17 = -[NSUUID initWithUUIDString:](v15, "initWithUUIDString:", v16);
    -[CSDRelayCall setCallGroupUUID:](self, "setCallGroupUUID:", v17);
  }
}

- (BOOL)isHostedOnCurrentDevice
{
  return 0;
}

- (id)audioCategory
{
  v2 = (void *)qword_10044CF20;
  if (!qword_10044CF20)
  {
    v3 = (void **)CUTWeakLinkSymbol("kMXSessionAudioCategory_PlayAndRecord_NoBluetooth", @"MediaExperience");
    if (v3) {
      BOOL v4 = *v3;
    }
    else {
      BOOL v4 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044CF20, v4);
    v2 = (void *)qword_10044CF20;
  }

  return v2;
}

- (id)audioMode
{
  v2 = (void *)qword_10044CF28;
  if (!qword_10044CF28)
  {
    v3 = (void **)CUTWeakLinkSymbol("kMXSessionAudioMode_RemoteVoiceChat", @"MediaExperience");
    if (v3) {
      BOOL v4 = *v3;
    }
    else {
      BOOL v4 = 0LL;
    }
    objc_storeStrong((id *)&qword_10044CF28, v4);
    v2 = (void *)qword_10044CF28;
  }

  return v2;
}

- (int64_t)audioInterruptionOperationMode
{
  return 4LL;
}

- (int64_t)audioInterruptionProviderType
{
  return 2LL;
}

- (int)callRelaySupport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall provider](self, "provider"));
  unsigned int v4 = [v3 isSystemProvider];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
  return -[CSDCall callRelaySupport](&v6, "callRelaySupport");
}

- (BOOL)supportsScreening
{
  return 0;
}

- (TUCallDisplayContext)displayContext
{
  displayContext = self->_displayContext;
  if (displayContext) {
    return displayContext;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
  id v4 = -[CSDCall displayContext](&v5, "displayContext");
  return (TUCallDisplayContext *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)canBeAnsweredWithRequest:(id)a3
{
  id v4 = a3;
  if (-[CSDRelayCall canBeAnsweredWithAudioOrVideoRelayWithRequest:]( self,  "canBeAnsweredWithAudioOrVideoRelayWithRequest:",  v4)
    || -[CSDRelayCall canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:]( self,  "canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:",  v4))
  {
    BOOL v5 = 1;
  }

  else if (-[CSDRelayCall isVideo](self, "isVideo") && [v4 behavior] == (id)4)
  {
    BOOL v5 = -[CSDRelayCall supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls");
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canBeAnsweredWithAudioOrVideoRelayWithRequest:(id)a3
{
  id v4 = a3;
  if (-[CSDRelayCall hasRelaySupport:](self, "hasRelaySupport:", 2LL)) {
    unsigned int v5 = !-[CSDRelayCall canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:]( self,  "canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:",  v4);
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canOnlyBeAnsweredWithoutAudioOrVideoRelayWithRequest:(id)a3
{
  else {
    return -[CSDRelayCall cannotRelayAudioOrVideo](self, "cannotRelayAudioOrVideo");
  }
}

- (TUCallProvider)localProvider
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall provider](self, "provider"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localProviderWithIdentifier:v5]);

  return (TUCallProvider *)v6;
}

- (NSSet)remoteParticipantHandles
{
  remoteParticipantHandles = self->_remoteParticipantHandles;
  if (remoteParticipantHandles) {
    return remoteParticipantHandles;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
  id v4 = -[CSDRelayCall remoteParticipantHandles](&v5, "remoteParticipantHandles");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callCapabilitiesState]);
  unsigned __int8 v4 = [v3 supportsDisplayingFaceTimeAudioCalls];

  return v4;
}

- (void)setCallStatus:(int)a3
{
  if (self->_callStatus != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A2E4;
    v4[3] = &unk_1003D78C8;
    v4[4] = self;
    int v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setFailureExpected:(BOOL)a3
{
  if (self->_failureExpected != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A378;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  if (self->_supportsEmergencyFallback != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A40C;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  if (self->_needsManualInCallSounds != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A4A0;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  if (self->_remoteUplinkMuted != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A534;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setTtyType:(int)a3
{
  if (self->_ttyType != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A5C8;
    v4[3] = &unk_1003D78C8;
    v4[4] = self;
    int v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  if (self->_supportsTTYWithVoice != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A65C;
    v4[3] = &unk_1003D7878;
    v4[4] = self;
    BOOL v5 = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  if (self->_bluetoothAudioFormat != a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009A6EC;
    v4[3] = &unk_1003D7708;
    v4[4] = self;
    void v4[5] = a3;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v4);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setHandle:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall handle](self, "handle"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009A7B4;
    v7[3] = &unk_1003D7758;
    v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setCallerNameFromNetwork:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall callerNameFromNetwork](self, "callerNameFromNetwork"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009A87C;
    v7[3] = &unk_1003D7758;
    v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setCallGroupUUID:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall callGroupUUID](self, "callGroupUUID"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009A944;
    v7[3] = &unk_1003D7758;
    v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setDisplayContext:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall displayContext](self, "displayContext"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009AA0C;
    v7[3] = &unk_1003D7758;
    v7[4] = self;
    id v8 = v6;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)setHardPauseDigitsState:(int)a3
{
  if (-[CSDRelayCall hardPauseDigitsState](self, "hardPauseDigitsState") != a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10009AA9C;
    v5[3] = &unk_1003D78C8;
    int v6 = a3;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }

- (void)setHardPauseDigits:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall hardPauseDigits](self, "hardPauseDigits"));
  char v5 = TUObjectsAreEqualOrNil(v4, v6);

  if ((v5 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009AB88;
    v7[3] = &unk_1003D7758;
    id v8 = v6;
    uint64_t v9 = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v7);
    -[CSDCall propertiesChanged](self, "propertiesChanged");
  }
}

- (void)groupWithOtherCall:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall callGroupUUID](self, "callGroupUUID"));

  if (v5)
  {
    id v6 = sub_1001704C4();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to group call because it is already grouped: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);

    if (!v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      [v4 setCallGroupUUID:v9];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
    -[CSDRelayCall setCallGroupUUID:](self, "setCallGroupUUID:", v10);

    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    -[os_log_s relayCall:didGroupWithOtherCall:](v7, "relayCall:didGroupWithOtherCall:", self, v4);
  }
}

- (void)ungroup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall callGroupUUID](self, "callGroupUUID"));

  if (v3)
  {
    -[CSDRelayCall setCallGroupUUID:](self, "setCallGroupUUID:", 0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    [v6 relayCallDidUngroup:self];
  }

  else
  {
    id v4 = sub_1001704C4();
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to ungroup call because it isn't grouped: %@",  buf,  0xCu);
    }
  }

- (BOOL)shouldOwnMuteHandler
{
  if (-[CSDRelayCall isConferenceActive](self, "isConferenceActive"))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
    return -[CSDCall shouldOwnMuteHandler](&v7, "shouldOwnMuteHandler");
  }

  else
  {
    id v4 = sub_1001704C4();
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Call with UPI %@ cannot handle mute control requests since it is a relay call without conference active",  buf,  0xCu);
    }

    return 0;
  }

- (BOOL)isConferenceActive
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v3 activeConferenceConnectionForIdentifier:v4]);
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (BOOL)isUplinkMuted
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  unsigned __int8 v5 = [v3 isMutedForIdentifier:v4];

  return v5;
}

- (void)performUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Asked to perform uplinkMuted: %d",  (uint8_t *)v8,  8u);
  }

  -[CSDRelayCall setUplinkMuted:](self, "setUplinkMuted:", v3);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v7 relayCallDidPerformUplinkMuted:self uplinkMuted:v3];
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
  -[CSDCall setUplinkMuted:](&v18, "setUplinkMuted:");
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v20[0]) = v3;
    WORD2(v20[0]) = 2112;
    *(void *)((char *)v20 + 6) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting uplinkMuted to %d for call %@",  buf,  0x12u);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 activeConferenceConnectionForIdentifier:v8]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
    unsigned int v12 = [v10 isMutedForIdentifier:v11];

    if (v12 != v3)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
      [v13 setMuted:v3 forIdentifier:v14];

      -[CSDCall updateUplinkMuted:](self, "updateUplinkMuted:", v3);
    }
  }

  else
  {
    id v15 = sub_1001704C4();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = @"NO";
      if (v3) {
        uint64_t v17 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v20[0] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Ignoring set uplinkMuted: %@, since there is no connection",  buf,  0xCu);
    }
  }
}

- (BOOL)isSendingAudio
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  unsigned __int8 v5 = [v3 isSendingAudioForIdentifier:v4];

  return v5;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDRelayConferenceInterface sharedInstance](&OBJC_CLASS___CSDRelayConferenceInterface, "sharedInstance"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  [v6 setSendingAudio:v3 forIdentifier:v5];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  id v5 = [v3 inputAudioPowerSpectrumTokenForIdentifier:v4];

  return (int64_t)v5;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  id v5 = [v3 outputAudioPowerSpectrumTokenForIdentifier:v4];

  return (int64_t)v5;
}

- (int64_t)spatialAudioSourceIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  id v5 = [v3 spatialAudioSourceIdentifierForIdentifier:v4];

  return (int64_t)v5;
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
  id v6 = a3;
  -[CSDCall dialWithRequest:displayContext:](&v13, "dialWithRequest:displayContext:", v6, a4);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handle", v13.receiver, v13.super_class));
  -[CSDRelayCall setHandle:](self, "setHandle:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  -[CSDRelayCall setProvider:](self, "setProvider:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localSenderIdentityUUID]);
  -[CSDRelayCall setLocalSenderIdentityUUID:](self, "setLocalSenderIdentityUUID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localSenderIdentityAccountUUID]);
  -[CSDRelayCall setLocalSenderIdentityAccountUUID:](self, "setLocalSenderIdentityAccountUUID:", v10);

  -[CSDRelayCall setCallStatus:](self, "setCallStatus:", 3LL);
  -[CSDRelayCall setOutgoing:](self, "setOutgoing:", 1LL);
  -[CSDRelayCall setVoicemail:](self, "setVoicemail:", [v6 dialType] == (id)2);
  -[CSDRelayCall setEmergency:](self, "setEmergency:", [v6 dialType] == (id)1);
  -[CSDRelayCall setSOS:](self, "setSOS:", [v6 isSOS]);
  -[CSDRelayCall setTtyType:](self, "setTtyType:", TUCallTTYTypeForTUDialRequestTTYType([v6 ttyType]));
  id v11 = [v6 originatingUIType];

  -[CSDRelayCall setOriginatingUIType:](self, "setOriginatingUIType:", v11);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v12 relayCallDidDial:self];

  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSDRelayCall joinConversationWithRequest: %@",  (uint8_t *)&v10,  0xCu);
  }

  -[CSDRelayCall setJoinConversationRequest:](self, "setJoinConversationRequest:", v4);
  -[CSDRelayCall setCallStatus:](self, "setCallStatus:", 3LL);
  -[CSDRelayCall setOutgoing:](self, "setOutgoing:", 1LL);
  -[CSDRelayCall setVoicemail:](self, "setVoicemail:", 0LL);
  -[CSDRelayCall setEmergency:](self, "setEmergency:", 0LL);
  -[CSDRelayCall setSOS:](self, "setSOS:", 0LL);
  objc_super v7 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallProviderManager faceTimeProvider](v7, "faceTimeProvider"));
  -[CSDRelayCall setProvider:](self, "setProvider:", v8);

  -[CSDRelayCall setOriginatingUIType:](self, "setOriginatingUIType:", [v4 originatingUIType]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v9 relayCallDidJoin:self];

  -[CSDCall propertiesChanged](self, "propertiesChanged");
}

- (void)answerWithRequest:(id)a3
{
  id v4 = a3;
  if ((-[CSDRelayCall isConnecting](self, "isConnecting") & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
    -[CSDRelayCall answerWithRequest:](&v6, "answerWithRequest:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    [v5 relayCall:self didAnswerWithRequest:v4];
  }
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[CSDRelayCall status](self, "status") != 6)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___CSDRelayCall;
    -[CSDRelayCall disconnectWithReason:](&v8, "disconnectWithReason:", v3);
    -[CSDRelayCall setCallStatus:](self, "setCallStatus:", 6LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    [v5 relayCallDidDisconnect:self];

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
    [v6 stopConferenceForIdentifier:v7];
  }

- (void)startConferenceForAnsweredCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009B9B8;
  v11[3] = &unk_1003D7C88;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009BAFC;
  v10[3] = &unk_1003D7C88;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)startConferenceForDialedCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009BCD0;
  v11[3] = &unk_1003D7C88;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009BE14;
  v10[3] = &unk_1003D7C88;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)startConferenceForPulledCallWithTransport:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009BFE8;
  v11[3] = &unk_1003D7C88;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009C0F8;
  v10[3] = &unk_1003D7C88;
  [v8 startConferenceForIdentifier:v9 usingTransport:v7 remoteInviteDictionary:v6 didStartHandler:v11 didStopHandler:v10];
}

- (void)stopConference
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CSDRelayConferenceInterface sharedInstance](&OBJC_CLASS___CSDRelayConferenceInterface, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  [v4 stopConferenceForIdentifier:v3];
}

- (void)hold
{
  if (-[CSDRelayCall status](self, "status") == 2)
  {
    id v3 = sub_1001704C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to hold call because it is already held: %@",  buf,  0xCu);
    }
  }

  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10009C34C;
    v5[3] = &unk_1003D7730;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    -[os_log_s relayCallDidHold:](v4, "relayCallDidHold:", self);
  }
}

- (void)unhold
{
  if (-[CSDRelayCall status](self, "status") == 2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10009C45C;
    v5[3] = &unk_1003D7730;
    v5[4] = self;
    -[CSDCall handleUpdatedPropertiesAfterChangesInBlock:](self, "handleUpdatedPropertiesAfterChangesInBlock:", v5);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
    [v3 relayCallDidUnhold:self];
  }

  else
  {
    id v4 = sub_1001704C4();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to unhold call because it isn't held: %@",  buf,  0xCu);
    }
  }
}

- (void)playLocalDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v5 relayCall:self didPlayLocalDTMFToneForKey:v3];
}

- (void)sendHardPauseDigits
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v3 relayCallDidSendHardPauseDigits:self];
}

- (void)becomeEndpointForPullFromRemoteDevice
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCall relayDelegate](self, "relayDelegate"));
  [v3 relayCallDidBecomeEndpointForPull:self];
}

- (void)setLocallyHasStartedOutgoing
{
  if (-[CSDRelayCall isOutgoing](self, "isOutgoing"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCall dateStartedOutgoing](self, "dateStartedOutgoing"));

    if (!v3)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[CSDCall setDateStartedOutgoing:](self, "setDateStartedOutgoing:", v4);
    }
  }

- (void)setLocallyHasSentInvitation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall dateSentInvitation](self, "dateSentInvitation"));

  if (!v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDCall setDateSentInvitation:](self, "setDateSentInvitation:", v4);
  }

- (void)setLocallyConnecting
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall dateStartedConnecting](self, "dateStartedConnecting"));

  if (!v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDCall setDateStartedConnecting:](self, "setDateStartedConnecting:", v4);
  }

- (void)setLocallyConnected
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall dateConnected](self, "dateConnected"));

  if (!v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSDCall setDateConnected:](self, "setDateConnected:", v4);
  }

- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3
{
}

- (void)setLocallyDisconnectedWithReasonIfNone:(int)a3 stopConference:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (-[CSDRelayCall status](self, "status") != 6)
  {
    -[CSDRelayCall setCallStatus:](self, "setCallStatus:", 6LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
    if (v4) {
      [v8 stopConferenceForIdentifier:v7];
    }
    else {
      [v8 prepareToStopConferenceForIdentifier:v7];
    }
  }

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (int)callStatus
{
  return self->_callStatus;
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSUUID)callGroupUUID
{
  return self->_callGroupUUID;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (BOOL)supportsEmergencyFallback
{
  return self->_supportsEmergencyFallback;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (BOOL)needsManualInCallSounds
{
  return self->_needsManualInCallSounds;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  self->_initialLinkType = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return self->_localSenderIdentityAccountUUID;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (int)ttyType
{
  return self->_ttyType;
}

- (BOOL)supportsTTYWithVoice
{
  return self->_supportsTTYWithVoice;
}

- (int64_t)bluetoothAudioFormat
{
  return self->_bluetoothAudioFormat;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (void)setOriginatingUIType:(int)a3
{
  self->_originatingUIType = a3;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (CSDRelayCallDelegate)relayDelegate
{
  return (CSDRelayCallDelegate *)objc_loadWeakRetained((id *)&self->_relayDelegate);
}

- (void)setRelayDelegate:(id)a3
{
}

- (TUJoinConversationRequest)joinConversationRequest
{
  return self->_joinConversationRequest;
}

- (void)setJoinConversationRequest:(id)a3
{
}

- (BOOL)cannotRelayAudioOrVideo
{
  return self->_cannotRelayAudioOrVideo;
}

- (void)setCannotRelayAudioOrVideo:(BOOL)a3
{
  self->_cannotRelayAudioOrVideo = a3;
}

- (NSDictionary)remoteInviteDictionary
{
  return self->_remoteInviteDictionary;
}

- (void)setRemoteInviteDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end