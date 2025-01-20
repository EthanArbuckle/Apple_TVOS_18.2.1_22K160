@interface CSDMessagingRelayMessage
+ (Class)conversationMembersType;
+ (Class)conversationsType;
+ (Class)endpointIDSDestinationURIsType;
+ (Class)handlesToInviteType;
+ (Class)otherUniqueProxyIdentifiersType;
+ (Class)prominenceEntryType;
+ (Class)protoCallType;
+ (Class)providersType;
+ (Class)remoteParticipantHandlesType;
+ (Class)routesType;
- (BOOL)hasCallerNameFromNetwork;
- (BOOL)hasContactIdentifier;
- (BOOL)hasConversationUUIDString;
- (BOOL)hasDestinationID;
- (BOOL)hasDtmfUpdateDigits;
- (BOOL)hasDummyPayload;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHandle;
- (BOOL)hasHardPauseDigits;
- (BOOL)hasHardPauseState;
- (BOOL)hasHostCallCreationTime;
- (BOOL)hasImage;
- (BOOL)hasInviteData;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasJoinConversationRequestURLString;
- (BOOL)hasLocalSenderIdentityAccountUUIDString;
- (BOOL)hasLocalSenderIdentityUUIDString;
- (BOOL)hasMessageSendTime;
- (BOOL)hasOBSOLETEConferenceIdentifier;
- (BOOL)hasProtoCallCapabilitiesState;
- (BOOL)hasProtoCallModel;
- (BOOL)hasProtoCallModelState;
- (BOOL)hasProtoCannotBeAnswered;
- (BOOL)hasProtoCannotRelayAudioOrVideoOnPairedDevice;
- (BOOL)hasProtoDTMFKey;
- (BOOL)hasProtoDisconnectedReason;
- (BOOL)hasProtoDisplayContext;
- (BOOL)hasProtoEmergency;
- (BOOL)hasProtoExpectedEndpointOnMessagingDevice;
- (BOOL)hasProtoFailureExpected;
- (BOOL)hasProtoNeedsManualInCallSounds;
- (BOOL)hasProtoOriginatingUIType;
- (BOOL)hasProtoPriority;
- (BOOL)hasProtoProtocolVersion;
- (BOOL)hasProtoProvider;
- (BOOL)hasProtoRemoteUplinkMuted;
- (BOOL)hasProtoSOS;
- (BOOL)hasProtoService;
- (BOOL)hasProtoShouldSuppressRingtone;
- (BOOL)hasProtoSoundRegion;
- (BOOL)hasProtoSupportsDTMFUpdates;
- (BOOL)hasProtoSupportsEmergencyFallback;
- (BOOL)hasProtoSupportsTTYWithVoice;
- (BOOL)hasProtoTTYType;
- (BOOL)hasProtoUplinkMuted;
- (BOOL)hasProtoVideo;
- (BOOL)hasProtoVoicemail;
- (BOOL)hasProtoWantsHoldMusic;
- (BOOL)hasReceivedMessageType;
- (BOOL)hasRequestActionType;
- (BOOL)hasRoute;
- (BOOL)hasSenderIDSIdentifier;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasSystemVolume;
- (BOOL)hasType;
- (BOOL)hasUniqueProxyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVideo;
- (BOOL)protoCannotBeAnswered;
- (BOOL)protoCannotRelayAudioOrVideoOnPairedDevice;
- (BOOL)protoEmergency;
- (BOOL)protoExpectedEndpointOnMessagingDevice;
- (BOOL)protoFailureExpected;
- (BOOL)protoNeedsManualInCallSounds;
- (BOOL)protoRemoteUplinkMuted;
- (BOOL)protoSOS;
- (BOOL)protoShouldSuppressRingtone;
- (BOOL)protoSupportsDTMFUpdates;
- (BOOL)protoSupportsEmergencyFallback;
- (BOOL)protoSupportsTTYWithVoice;
- (BOOL)protoUplinkMuted;
- (BOOL)protoVideo;
- (BOOL)protoVoicemail;
- (BOOL)protoWantsHoldMusic;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)inviteData;
- (CSDMessagingCallCapabilitiesState)protoCallCapabilitiesState;
- (CSDMessagingCallDisplayContext)protoDisplayContext;
- (CSDMessagingCallModel)protoCallModel;
- (CSDMessagingCallModelState)protoCallModelState;
- (CSDMessagingCallProvider)protoProvider;
- (CSDMessagingHandle)handle;
- (CSDMessagingRelayMessage)initWithDictionary:(id)a3;
- (CSDMessagingRelayMessage)initWithType:(int)a3;
- (CSDMessagingRelayMessage)initWithType:(int)a3 uniqueProxyIdentifier:(id)a4;
- (CSDMessagingRoute)route;
- (IDSDestination)endpointIDSDestination;
- (NSArray)tuProviders;
- (NSData)dummyPayload;
- (NSData)image;
- (NSData)protoDTMFKey;
- (NSMutableArray)conversationMembers;
- (NSMutableArray)conversations;
- (NSMutableArray)endpointIDSDestinationURIs;
- (NSMutableArray)handlesToInvites;
- (NSMutableArray)otherUniqueProxyIdentifiers;
- (NSMutableArray)prominenceEntrys;
- (NSMutableArray)protoCalls;
- (NSMutableArray)providers;
- (NSMutableArray)remoteParticipantHandles;
- (NSMutableArray)routes;
- (NSSet)remoteParticipantTUHandles;
- (NSString)callerNameFromNetwork;
- (NSString)contactIdentifier;
- (NSString)conversationUUIDString;
- (NSString)destinationID;
- (NSString)dtmfUpdateDigits;
- (NSString)groupUUIDString;
- (NSString)hardPauseDigits;
- (NSString)isoCountryCode;
- (NSString)joinConversationRequestURLString;
- (NSString)localSenderIdentityAccountUUIDString;
- (NSString)localSenderIdentityUUIDString;
- (NSString)oBSOLETEConferenceIdentifier;
- (NSString)receivedMessageTypeString;
- (NSString)senderIDSIdentifier;
- (NSString)sourceIdentifier;
- (NSString)typeString;
- (NSString)uniqueProxyIdentifier;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallCapabilitiesState)callCapabilitiesState;
- (TUCallDisplayContext)displayContext;
- (TUCallModel)callModel;
- (TUCallProvider)tuProvider;
- (TUDialRequest)dialRequest;
- (TUHandle)tuHandle;
- (TUJoinConversationRequest)joinConversationRequest;
- (double)hostCallCreationTime;
- (double)messageSendTime;
- (float)systemVolume;
- (id)conversationMembersAtIndex:(unint64_t)a3;
- (id)conversationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointIDSDestinationURIsAtIndex:(unint64_t)a3;
- (id)handlesToInviteAtIndex:(unint64_t)a3;
- (id)initAddRemoteMemberMessageWithMembers:(id)a3 otherInvitedHandles:(id)a4 conversationWithUUID:(id)a5;
- (id)initBuzzMemberMessage:(id)a3 conversationUUID:(id)a4;
- (id)otherUniqueProxyIdentifiersAtIndex:(unint64_t)a3;
- (id)prominenceEntryAtIndex:(unint64_t)a3;
- (id)protoCallAtIndex:(unint64_t)a3;
- (id)providersAtIndex:(unint64_t)a3;
- (id)receivedMessageTypeAsString:(int)a3;
- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3;
- (id)requestActionTypeAsString:(int)a3;
- (id)routesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsReceivedMessageType:(id)a3;
- (int)StringAsRequestActionType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)receivedMessageType;
- (int)requestActionType;
- (int)type;
- (int64_t)priority;
- (int64_t)soundRegion;
- (unint64_t)conversationMembersCount;
- (unint64_t)conversationsCount;
- (unint64_t)endpointIDSDestinationURIsCount;
- (unint64_t)handlesToInvitesCount;
- (unint64_t)hash;
- (unint64_t)otherUniqueProxyIdentifiersCount;
- (unint64_t)prominenceEntrysCount;
- (unint64_t)protoCallsCount;
- (unint64_t)providersCount;
- (unint64_t)remoteParticipantHandlesCount;
- (unint64_t)routesCount;
- (unsigned)DTMFKey;
- (unsigned)hardPauseState;
- (unsigned)protoDisconnectedReason;
- (unsigned)protoOriginatingUIType;
- (unsigned)protoPriority;
- (unsigned)protoProtocolVersion;
- (unsigned)protoService;
- (unsigned)protoSoundRegion;
- (unsigned)protoTTYType;
- (void)addCall:(id)a3;
- (void)addConversationMembers:(id)a3;
- (void)addConversations:(id)a3;
- (void)addEndpointIDSDestinationURIs:(id)a3;
- (void)addHandlesToInvite:(id)a3;
- (void)addOtherUniqueProxyIdentifiers:(id)a3;
- (void)addProminenceEntry:(id)a3;
- (void)addProtoCall:(id)a3;
- (void)addProtocolVersion;
- (void)addProviders:(id)a3;
- (void)addRemoteParticipantHandles:(id)a3;
- (void)addRoutes:(id)a3;
- (void)clearConversationMembers;
- (void)clearConversations;
- (void)clearEndpointIDSDestinationURIs;
- (void)clearHandlesToInvites;
- (void)clearOtherUniqueProxyIdentifiers;
- (void)clearProminenceEntrys;
- (void)clearProtoCalls;
- (void)clearProviders;
- (void)clearRemoteParticipantHandles;
- (void)clearRoutes;
- (void)copyTo:(id)a3;
- (void)customizeForProtocolVersion:(int)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallCapabilitiesState:(id)a3;
- (void)setCallModel:(id)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setCannotBeAnswered:(BOOL)a3;
- (void)setCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setConversationMembers:(id)a3;
- (void)setConversationUUIDString:(id)a3;
- (void)setConversations:(id)a3;
- (void)setDTMFKey:(unsigned __int8)a3;
- (void)setDestinationID:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setDisplayContext:(id)a3;
- (void)setDtmfUpdateDigits:(id)a3;
- (void)setDummyPayload:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setEndpointIDSDestination:(id)a3;
- (void)setEndpointIDSDestinationURIs:(id)a3;
- (void)setExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandlesToInvites:(id)a3;
- (void)setHardPauseDigits:(id)a3;
- (void)setHardPauseDigitsState:(int)a3;
- (void)setHardPauseState:(unsigned int)a3;
- (void)setHasHardPauseState:(BOOL)a3;
- (void)setHasHostCallCreationTime:(BOOL)a3;
- (void)setHasMessageSendTime:(BOOL)a3;
- (void)setHasProtoCannotBeAnswered:(BOOL)a3;
- (void)setHasProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setHasProtoDisconnectedReason:(BOOL)a3;
- (void)setHasProtoEmergency:(BOOL)a3;
- (void)setHasProtoExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setHasProtoFailureExpected:(BOOL)a3;
- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setHasProtoOriginatingUIType:(BOOL)a3;
- (void)setHasProtoPriority:(BOOL)a3;
- (void)setHasProtoProtocolVersion:(BOOL)a3;
- (void)setHasProtoRemoteUplinkMuted:(BOOL)a3;
- (void)setHasProtoSOS:(BOOL)a3;
- (void)setHasProtoService:(BOOL)a3;
- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setHasProtoSoundRegion:(BOOL)a3;
- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setHasProtoTTYType:(BOOL)a3;
- (void)setHasProtoUplinkMuted:(BOOL)a3;
- (void)setHasProtoVideo:(BOOL)a3;
- (void)setHasProtoVoicemail:(BOOL)a3;
- (void)setHasProtoWantsHoldMusic:(BOOL)a3;
- (void)setHasReceivedMessageType:(BOOL)a3;
- (void)setHasRequestActionType:(BOOL)a3;
- (void)setHasSystemVolume:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHostCallCreationTime:(double)a3;
- (void)setImage:(id)a3;
- (void)setInviteData:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJoinConversationRequestURLString:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityAccountUUIDString:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalSenderIdentityUUIDString:(id)a3;
- (void)setMessageSendTime:(double)a3;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOBSOLETEConferenceIdentifier:(id)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOtherUniqueProxyIdentifiers:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProminenceEntrys:(id)a3;
- (void)setProtoCallCapabilitiesState:(id)a3;
- (void)setProtoCallModel:(id)a3;
- (void)setProtoCallModelState:(id)a3;
- (void)setProtoCalls:(id)a3;
- (void)setProtoCannotBeAnswered:(BOOL)a3;
- (void)setProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setProtoDTMFKey:(id)a3;
- (void)setProtoDisconnectedReason:(unsigned int)a3;
- (void)setProtoDisplayContext:(id)a3;
- (void)setProtoEmergency:(BOOL)a3;
- (void)setProtoExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setProtoFailureExpected:(BOOL)a3;
- (void)setProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setProtoOriginatingUIType:(unsigned int)a3;
- (void)setProtoPriority:(unsigned int)a3;
- (void)setProtoProtocolVersion:(unsigned int)a3;
- (void)setProtoProvider:(id)a3;
- (void)setProtoRemoteUplinkMuted:(BOOL)a3;
- (void)setProtoSOS:(BOOL)a3;
- (void)setProtoService:(unsigned int)a3;
- (void)setProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setProtoSoundRegion:(unsigned int)a3;
- (void)setProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setProtoTTYType:(unsigned int)a3;
- (void)setProtoUplinkMuted:(BOOL)a3;
- (void)setProtoVideo:(BOOL)a3;
- (void)setProtoVoicemail:(BOOL)a3;
- (void)setProtoWantsHoldMusic:(BOOL)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setProviders:(id)a3;
- (void)setReceivedMessageType:(int)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteParticipantTUHandles:(id)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRequestActionType:(int)a3;
- (void)setRoute:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSOS:(BOOL)a3;
- (void)setSenderIDSIdentifier:(id)a3;
- (void)setService:(int)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setSystemVolume:(float)a3;
- (void)setTtyType:(int)a3;
- (void)setTuHandle:(id)a3;
- (void)setTuProvider:(id)a3;
- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4;
- (void)setTuProviders:(id)a3;
- (void)setType:(int)a3;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingRelayMessage

- (CSDMessagingRelayMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"type"]);
  v6 = -[CSDMessagingRelayMessage initWithType:](self, "initWithType:", [v5 intValue]);

  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100047D80;
    v8[3] = &unk_1003D7F60;
    v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }

  return v6;
}

- (CSDMessagingRelayMessage)initWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingRelayMessage;
  id v4 = -[CSDMessagingRelayMessage init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    -[CSDMessagingRelayMessage setType:](v4, "setType:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    unsigned int v7 = [v6 pairedDeviceExists];

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v8 timeIntervalSince1970];
      -[CSDMessagingRelayMessage setMessageSendTime:](v5, "setMessageSendTime:");
    }
  }

  return v5;
}

- (CSDMessagingRelayMessage)initWithType:(int)a3 uniqueProxyIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned int v7 = -[CSDMessagingRelayMessage initWithType:](self, "initWithType:", v4);
  v8 = v7;
  if (v7) {
    -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](v7, "setUniqueProxyIdentifier:", v6);
  }

  return v8;
}

- (id)initAddRemoteMemberMessageWithMembers:(id)a3 otherInvitedHandles:(id)a4 conversationWithUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[CSDMessagingRelayMessage initWithType:](self, "initWithType:", 52LL);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[CSDMessagingRelayMessage setConversationMembers:](v11, "setConversationMembers:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[CSDMessagingRelayMessage setHandlesToInvites:](v11, "setHandlesToInvites:", v13);

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v32 = v8;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage conversationMembers](v11, "conversationMembers"));
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v19));
          [v20 addObject:v21];

          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v16);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v22 = v9;
    id v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage handlesToInvites](v11, "handlesToInvites"));
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v27));
          [v28 addObject:v29];

          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v24);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    -[CSDMessagingRelayMessage setConversationUUIDString:](v11, "setConversationUUIDString:", v30);

    id v8 = v32;
  }

  return v11;
}

- (id)initBuzzMemberMessage:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CSDMessagingRelayMessage initWithType:](self, "initWithType:", 51LL);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v6));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v9));
    -[CSDMessagingRelayMessage setConversationMembers:](v8, "setConversationMembers:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    -[CSDMessagingRelayMessage setConversationUUIDString:](v8, "setConversationUUIDString:", v11);
  }

  return v8;
}

- (NSString)typeString
{
  uint64_t v2 = -[CSDMessagingRelayMessage type](self, "type");
  if (v2 >= 0x39) {
    return (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v2));
  }
  else {
    return (NSString *)off_1003D7F80[(int)v2];
  }
}

- (NSString)receivedMessageTypeString
{
  uint64_t v2 = -[CSDMessagingRelayMessage receivedMessageType](self, "receivedMessageType");
  if (v2 >= 0x39) {
    return (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v2));
  }
  else {
    return (NSString *)off_1003D7F80[(int)v2];
  }
}

- (TUDialRequest)dialRequest
{
  if (-[CSDMessagingRelayMessage type](self, "type") != 2) {
    return (TUDialRequest *)0LL;
  }
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TUDialRequest);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage tuProvider](self, "tuProvider"));
  v5 = -[TUDialRequest initWithProvider:](v3, "initWithProvider:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage tuHandle](self, "tuHandle"));
  -[TUDialRequest setHandle:](v5, "setHandle:", v6);

  -[TUDialRequest setVideo:](v5, "setVideo:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage sourceIdentifier](self, "sourceIdentifier"));
  -[TUDialRequest setAudioSourceIdentifier:](v5, "setAudioSourceIdentifier:", v7);

  if (-[CSDMessagingRelayMessage isVoicemail](self, "isVoicemail"))
  {
    uint64_t v8 = 2LL;
LABEL_7:
    -[TUDialRequest setDialType:](v5, "setDialType:", v8);
    goto LABEL_8;
  }

  if (-[CSDMessagingRelayMessage isEmergency](self, "isEmergency"))
  {
    uint64_t v8 = 1LL;
    goto LABEL_7;
  }

- (TUJoinConversationRequest)joinConversationRequest
{
  if (-[CSDMessagingRelayMessage type](self, "type") == 50)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingRelayMessage joinConversationRequestURLString]( self,  "joinConversationRequestURLString"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));

    v5 = -[TUJoinConversationRequest initWithURL:]( objc_alloc(&OBJC_CLASS___TUJoinConversationRequest),  "initWithURL:",  v4);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage protoService](self, "protoService")) {
    -[CSDMessagingRelayMessage setProtoService:](self, "setProtoService:", v3);
  }
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoWantsHoldMusic](self, "protoWantsHoldMusic")) {
    -[CSDMessagingRelayMessage setProtoWantsHoldMusic:](self, "setProtoWantsHoldMusic:", v3);
  }
}

- (void)setDisconnectedReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage protoDisconnectedReason](self, "protoDisconnectedReason")) {
    -[CSDMessagingRelayMessage setProtoDisconnectedReason:](self, "setProtoDisconnectedReason:", v3);
  }
}

- (void)setCannotBeAnswered:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoCannotBeAnswered](self, "protoCannotBeAnswered")) {
    -[CSDMessagingRelayMessage setProtoCannotBeAnswered:](self, "setProtoCannotBeAnswered:", v3);
  }
}

- (unsigned)DTMFKey
{
  id v2 = objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoDTMFKey](self, "protoDTMFKey"));
  unsigned __int8 v3 = *(_BYTE *)[v2 bytes];

  return v3;
}

- (void)setDTMFKey:(unsigned __int8)a3
{
  unsigned __int8 v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v5, 1LL));
  -[CSDMessagingRelayMessage setProtoDTMFKey:](self, "setProtoDTMFKey:", v4);
}

- (void)setVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoVoicemail](self, "protoVoicemail")) {
    -[CSDMessagingRelayMessage setProtoVoicemail:](self, "setProtoVoicemail:", v3);
  }
}

- (void)setHardPauseDigitsState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage hardPauseState](self, "hardPauseState")) {
    -[CSDMessagingRelayMessage setHardPauseState:](self, "setHardPauseState:", v3);
  }
}

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage protoProtocolVersion](self, "protoProtocolVersion")) {
    -[CSDMessagingRelayMessage setProtoProtocolVersion:](self, "setProtoProtocolVersion:", v3);
  }
}

- (void)addProtocolVersion
{
}

- (void)customizeForProtocolVersion:(int)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage hardPauseDigits](self, "hardPauseDigits"));

  if (a3 < 2 && v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage hardPauseDigits](self, "hardPauseDigits"));
    uint64_t v7 = TUHardPauseDigitsDisplayString();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage hardPauseDigits](self, "hardPauseDigits"));
      int v15 = 138412802;
      int64_t v16 = (int64_t)v11;
      __int16 v17 = 2112;
      uint64_t v18 = (uint64_t)v8;
      __int16 v19 = 1024;
      int v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Replacing hardPauseDigits '%@' with '%@' since protocolVersion is %d",  (uint8_t *)&v15,  0x1Cu);
    }

    -[CSDMessagingRelayMessage setHardPauseDigits:](self, "setHardPauseDigits:", v8);
  }

  else if (a3 > 2)
  {
    return;
  }

  if ((-[CSDMessagingRelayMessage soundRegion](self, "soundRegion") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v12 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = -[CSDMessagingRelayMessage soundRegion](self, "soundRegion");
      int v15 = 134218496;
      int64_t v16 = v14;
      __int16 v17 = 2048;
      uint64_t v18 = 1LL;
      __int16 v19 = 1024;
      int v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Replacing soundRegion %ld with %ld since protocolVersion is %d",  (uint8_t *)&v15,  0x1Cu);
    }

    -[CSDMessagingRelayMessage setSoundRegion:](self, "setSoundRegion:", 1LL);
  }

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoShouldSuppressRingtone](self, "protoShouldSuppressRingtone")) {
    -[CSDMessagingRelayMessage setProtoShouldSuppressRingtone:](self, "setProtoShouldSuppressRingtone:", v3);
  }
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoNeedsManualInCallSounds](self, "protoNeedsManualInCallSounds")) {
    -[CSDMessagingRelayMessage setProtoNeedsManualInCallSounds:](self, "setProtoNeedsManualInCallSounds:", v3);
  }
}

- (void)setCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    || -[CSDMessagingRelayMessage protoCannotRelayAudioOrVideoOnPairedDevice]( self,  "protoCannotRelayAudioOrVideoOnPairedDevice"))
  {
    -[CSDMessagingRelayMessage setProtoCannotRelayAudioOrVideoOnPairedDevice:]( self,  "setProtoCannotRelayAudioOrVideoOnPairedDevice:",  v3);
  }

- (void)setExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    || -[CSDMessagingRelayMessage protoExpectedEndpointOnMessagingDevice]( self,  "protoExpectedEndpointOnMessagingDevice"))
  {
    -[CSDMessagingRelayMessage setProtoExpectedEndpointOnMessagingDevice:]( self,  "setProtoExpectedEndpointOnMessagingDevice:",  v3);
  }

- (int64_t)soundRegion
{
  return self->_protoSoundRegion;
}

- (void)setSoundRegion:(int64_t)a3
{
  if (self->_protoSoundRegion != a3) {
    self->_protoSoundRegion = a3;
  }
}

- (void)setCallCapabilitiesState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[CSDMessagingCallCapabilitiesState initWithCallCapabilitiesState:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallCapabilitiesState),  "initWithCallCapabilitiesState:",  v4);

  -[CSDMessagingRelayMessage setProtoCallCapabilitiesState:](self, "setProtoCallCapabilitiesState:", v5);
}

- (TUCallCapabilitiesState)callCapabilitiesState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallCapabilitiesState](self, "protoCallCapabilitiesState"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);

  return (TUCallCapabilitiesState *)v3;
}

- (void)setEmergency:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoEmergency](self, "protoEmergency")) {
    -[CSDMessagingRelayMessage setProtoEmergency:](self, "setProtoEmergency:", v3);
  }
}

- (void)setFailureExpected:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoFailureExpected](self, "protoFailureExpected")) {
    -[CSDMessagingRelayMessage setProtoFailureExpected:](self, "setProtoFailureExpected:", v3);
  }
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoSupportsEmergencyFallback](self, "protoSupportsEmergencyFallback")) {
    -[CSDMessagingRelayMessage setProtoSupportsEmergencyFallback:](self, "setProtoSupportsEmergencyFallback:", v3);
  }
}

- (void)setSOS:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoSOS](self, "protoSOS")) {
    -[CSDMessagingRelayMessage setProtoSOS:](self, "setProtoSOS:", v3);
  }
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoSupportsDTMFUpdates](self, "protoSupportsDTMFUpdates")) {
    -[CSDMessagingRelayMessage setProtoSupportsDTMFUpdates:](self, "setProtoSupportsDTMFUpdates:", v3);
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoUplinkMuted](self, "protoUplinkMuted")) {
    -[CSDMessagingRelayMessage setProtoUplinkMuted:](self, "setProtoUplinkMuted:", v3);
  }
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoRemoteUplinkMuted](self, "protoRemoteUplinkMuted")) {
    -[CSDMessagingRelayMessage setProtoRemoteUplinkMuted:](self, "setProtoRemoteUplinkMuted:", v3);
  }
}

- (TUCallModel)callModel
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___TUCallModel);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v6 = [v5 supportsHolding];
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v6 = [v5 holdAllowed];
  }

  -[TUCallModel setSupportsHolding:](v3, "setSupportsHolding:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v9 = [v8 supportsGrouping];
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v9 = [v8 mergeable];
  }

  -[TUCallModel setSupportsGrouping:](v3, "setSupportsGrouping:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v12 = [v11 supportsUngrouping];
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v12 = [v11 takingCallsPrivateAllowed];
  }

  -[TUCallModel setSupportsUngrouping:](v3, "setSupportsUngrouping:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v13)
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    unint64_t v15 = (unint64_t)[v14 supportsUnambiguousMultiPartyState];
  }

  else
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    unint64_t v15 = [v14 ambiguityState] == 0;
  }

  -[TUCallModel setSupportsUnambiguousMultiPartyState:](v3, "setSupportsUnambiguousMultiPartyState:", v15);

  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v16)
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v18 = [v17 supportsAddCall];
  }

  else
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v18 = [v17 addCallAllowed];
  }

  -[TUCallModel setSupportsAddCall:](v3, "setSupportsAddCall:", v18);

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v19)
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v21 = [v20 supportsSendingToVoicemail];
  }

  else
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v21 = [v20 sendToVoicemailAllowed];
  }

  -[TUCallModel setSupportsSendingToVoicemail:](v3, "setSupportsSendingToVoicemail:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
    id v24 = [v23 supportsDTMF];
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
    id v24 = [v23 sendToVoicemailAllowed];
  }

  -[TUCallModel setSupportsDTMF:](v3, "setSupportsDTMF:", v24);

  return v3;
}

- (void)setCallModel:(id)a3
{
  id v42 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));

  if (!v4)
  {
    unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___CSDMessagingCallModel);
    -[CSDMessagingRelayMessage setProtoCallModel:](self, "setProtoCallModel:", v5);
  }

  id v6 = [v42 supportsHolding];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v7 setSupportsHolding:v6];

  id v8 = [v42 supportsGrouping];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v9 setSupportsGrouping:v8];

  id v10 = [v42 supportsUngrouping];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v11 setSupportsUngrouping:v10];

  id v12 = [v42 supportsDTMF];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v13 setSupportsDTMF:v12];

  id v14 = [v42 supportsUnambiguousMultiPartyState];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v15 setSupportsUnambiguousMultiPartyState:v14];

  id v16 = [v42 supportsAddCall];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v17 setSupportsAddCall:v16];

  id v18 = [v42 supportsSendingToVoicemail];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModel](self, "protoCallModel"));
  [v19 setSupportsSendingToVoicemail:v18];

  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  if (!v20)
  {
    id v21 = objc_alloc_init(&OBJC_CLASS___CSDMessagingCallModelState);
    -[CSDMessagingRelayMessage setProtoCallModelState:](self, "setProtoCallModelState:", v21);
  }

  uint64_t v22 = [v42 supportsUnambiguousMultiPartyState] ^ 1;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v23 setAmbiguityState:v22];

  id v24 = [v42 supportsHolding];
  int v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v25 setSwappable:v24];

  id v26 = [v42 supportsGrouping];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v27 setMergeable:v26];

  id v28 = [v42 supportsHolding];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v29 setHoldAllowed:v28];

  id v30 = [v42 supportsAddCall];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v31 setAddCallAllowed:v30];

  id v32 = [v42 supportsUngrouping];
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v33 setTakingCallsPrivateAllowed:v32];

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v34 setHardPauseAvailable:1];

  id v35 = [v42 supportsUnambiguousMultiPartyState];
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v36 setEndAndAnswerAllowed:v35];

  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v38 = [v37 isHoldAndAnswerAllowed];
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v39 setHoldAndAnswerAllowed:v38];

  id v40 = [v42 supportsSendingToVoicemail];
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoCallModelState](self, "protoCallModelState"));
  [v41 setSendToVoicemailAllowed:v40];
}

- (void)addCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[CSDMessagingCall initWithCall:](objc_alloc(&OBJC_CLASS___CSDMessagingCall), "initWithCall:", v4);

  -[CSDMessagingRelayMessage addProtoCall:](self, "addProtoCall:", v5);
}

- (void)setTuHandle:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  -[CSDMessagingRelayMessage setDestinationID:](self, "setDestinationID:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v4));
  -[CSDMessagingRelayMessage setHandle:](self, "setHandle:", v6);
}

- (TUHandle)tuHandle
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage handle](self, "handle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuHandle]);

  if (!v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage destinationID](self, "destinationID"));
    if (v5) {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v5));
    }
    else {
      id v4 = 0LL;
    }
  }

  return (TUHandle *)v4;
}

- (NSArray)tuProviders
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage providers](self, "providers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage providers](self, "providers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) provider]);
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return (NSArray *)v11;
}

- (void)setTuProviders:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider);
        __int128 v13 = -[CSDMessagingCallProvider initWithProvider:](v12, "initWithProvider:", v11, (void)v14);
        [v5 addObject:v13];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[CSDMessagingRelayMessage setProviders:](self, "setProviders:", v5);
}

- (TUCallProvider)tuProvider
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoProvider](self, "protoProvider"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);

  if (!v4)
  {
    char v7 = 0;
    unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TUCallProviderManager providerWithService:video:]( v5,  "providerWithService:video:",  -[CSDMessagingRelayMessage service](self, "service"),  &v7));
  }

  return (TUCallProvider *)v4;
}

- (void)setTuProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = -[CSDMessagingCallProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithProvider:",  v5);
    -[CSDMessagingRelayMessage setProtoProvider:](self, "setProtoProvider:", v4);
    -[CSDMessagingRelayMessage setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v5,  -[CSDMessagingRelayMessage isVideo](self, "isVideo")));
  }

  else
  {
    -[CSDMessagingRelayMessage setProtoProvider:](self, "setProtoProvider:", 0LL);
  }
}

- (BOOL)isVideo
{
  char v6 = 0;
  if (-[CSDMessagingRelayMessage hasProtoVideo](self, "hasProtoVideo")) {
    return -[CSDMessagingRelayMessage protoVideo](self, "protoVideo");
  }
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
  id v4 =  -[TUCallProviderManager providerWithService:video:]( v3,  "providerWithService:video:",  -[CSDMessagingRelayMessage service](self, "service"),  &v6);

  return v6 != 0;
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSDMessagingRelayMessage setProtoVideo:](self, "setProtoVideo:");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage tuProvider](self, "tuProvider"));
  -[CSDMessagingRelayMessage setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v5,  v3));
}

- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    char v6 = -[CSDMessagingCallProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithProvider:",  v8);
    -[CSDMessagingRelayMessage setProtoProvider:](self, "setProtoProvider:", v6);
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage tuProvider](self, "tuProvider"));
    -[CSDMessagingRelayMessage setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v7,  v4));
  }

  else
  {
    -[CSDMessagingRelayMessage setProtoProvider:](self, "setProtoProvider:", 0LL);
  }

  -[CSDMessagingRelayMessage setProtoVideo:](self, "setProtoVideo:", v4);
}

- (TUCallDisplayContext)displayContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage protoDisplayContext](self, "protoDisplayContext"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 displayContext]);

  return (TUCallDisplayContext *)v3;
}

- (void)setDisplayContext:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = -[CSDMessagingCallDisplayContext initWithCallDisplayContext:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallDisplayContext),  "initWithCallDisplayContext:",  v4);
  }

  else
  {
    id v5 = 0LL;
  }

  -[CSDMessagingRelayMessage setProtoDisplayContext:](self, "setProtoDisplayContext:", v5);
}

- (IDSDestination)endpointIDSDestination
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage endpointIDSDestinationURIs](self, "endpointIDSDestinationURIs"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage endpointIDSDestinationURIs](self, "endpointIDSDestinationURIs", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithURI:]( &OBJC_CLASS___IDSDestination,  "destinationWithURI:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9)));
        [v4 addObject:v10];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  if ([v4 count]) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v4));
  }
  else {
    uint64_t v11 = 0LL;
  }

  return (IDSDestination *)v11;
}

- (void)setEndpointIDSDestination:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 destinationURIs]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v5 = [v4 mutableCopy];
  -[CSDMessagingRelayMessage setEndpointIDSDestinationURIs:](self, "setEndpointIDSDestinationURIs:", v5);
}

- (NSUUID)localSenderIdentityUUID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage localSenderIdentityUUIDString](self, "localSenderIdentityUUIDString"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage localSenderIdentityUUIDString](self, "localSenderIdentityUUIDString"));
    id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[CSDMessagingRelayMessage setLocalSenderIdentityUUIDString:](self, "setLocalSenderIdentityUUIDString:", v4);
}

- (NSUUID)localSenderIdentityAccountUUID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingRelayMessage localSenderIdentityAccountUUIDString]( self,  "localSenderIdentityAccountUUIDString"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingRelayMessage localSenderIdentityAccountUUIDString]( self,  "localSenderIdentityAccountUUIDString"));
    id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[CSDMessagingRelayMessage setLocalSenderIdentityAccountUUIDString:]( self,  "setLocalSenderIdentityAccountUUIDString:",  v4);
}

- (NSSet)remoteParticipantTUHandles
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage remoteParticipantHandles](self, "remoteParticipantHandles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage remoteParticipantHandles](self, "remoteParticipantHandles", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) tuHandle]);
        if (v10) {
          [v4 addObject:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return (NSSet *)v11;
}

- (void)setRemoteParticipantTUHandles:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8)));
        if (v9) {
          -[CSDMessagingRelayMessage addRemoteParticipantHandles:](self, "addRemoteParticipantHandles:", v9);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)setTtyType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage protoTTYType](self, "protoTTYType")) {
    -[CSDMessagingRelayMessage setProtoTTYType:](self, "setProtoTTYType:", v3);
  }
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingRelayMessage protoSupportsTTYWithVoice](self, "protoSupportsTTYWithVoice")) {
    -[CSDMessagingRelayMessage setProtoSupportsTTYWithVoice:](self, "setProtoSupportsTTYWithVoice:", v3);
  }
}

- (int64_t)priority
{
  return self->_protoPriority;
}

- (void)setPriority:(int64_t)a3
{
  if (self->_protoPriority != a3) {
    -[CSDMessagingRelayMessage setProtoPriority:](self, "setProtoPriority:");
  }
}

- (void)setOriginatingUIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingRelayMessage protoOriginatingUIType](self, "protoOriginatingUIType")) {
    -[CSDMessagingRelayMessage setProtoOriginatingUIType:](self, "setProtoOriginatingUIType:", v3);
  }
}

- (int)type
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x39) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D8620[a3];
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }

  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }

  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }

  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }

  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }

  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }

  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }

  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }

  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }

  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }

  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }

  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }

  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }

  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }

  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }

  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }

  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }

  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }

  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }

  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }

  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }

  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }

  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier != 0LL;
}

- (BOOL)hasDestinationID
{
  return self->_destinationID != 0LL;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0LL;
}

- (BOOL)hasProtoCallModelState
{
  return self->_protoCallModelState != 0LL;
}

- (void)setProtoService:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_protoService = a3;
}

- (void)setHasProtoService:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProtoService
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setProtoWantsHoldMusic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_protoWantsHoldMusic = a3;
}

- (void)setHasProtoWantsHoldMusic:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasProtoWantsHoldMusic
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setProtoCannotBeAnswered:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_protoCannotBeAnswered = a3;
}

- (void)setHasProtoCannotBeAnswered:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProtoCannotBeAnswered
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasProtoDTMFKey
{
  return self->_protoDTMFKey != 0LL;
}

- (void)setProtoDisconnectedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_protoDisconnectedReason = a3;
}

- (void)setHasProtoDisconnectedReason:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProtoDisconnectedReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasOBSOLETEConferenceIdentifier
{
  return self->_oBSOLETEConferenceIdentifier != 0LL;
}

- (void)setProtoVoicemail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_protoVoicemail = a3;
}

- (void)setHasProtoVoicemail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasProtoVoicemail
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasCallerNameFromNetwork
{
  return self->_callerNameFromNetwork != 0LL;
}

- (void)clearProtoCalls
{
}

- (void)addProtoCall:(id)a3
{
  id v4 = a3;
  protoCalls = self->_protoCalls;
  id v8 = v4;
  if (!protoCalls)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_protoCalls;
    self->_protoCalls = v6;

    id v4 = v8;
    protoCalls = self->_protoCalls;
  }

  -[NSMutableArray addObject:](protoCalls, "addObject:", v4);
}

- (unint64_t)protoCallsCount
{
  return (unint64_t)-[NSMutableArray count](self->_protoCalls, "count");
}

- (id)protoCallAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_protoCalls, "objectAtIndex:", a3);
}

+ (Class)protoCallType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingCall, a2);
}

- (BOOL)hasHardPauseDigits
{
  return self->_hardPauseDigits != 0LL;
}

- (void)setHardPauseState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_hardPauseState = a3;
}

- (void)setHasHardPauseState:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasHardPauseState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)receivedMessageType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0) {
    return self->_receivedMessageType;
  }
  else {
    return 0;
  }
}

- (void)setReceivedMessageType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_receivedMessageType = a3;
}

- (void)setHasReceivedMessageType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasReceivedMessageType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)receivedMessageTypeAsString:(int)a3
{
  if (a3 >= 0x39) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D8620[a3];
  }
}

- (int)StringAsReceivedMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }

  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }

  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }

  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }

  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }

  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }

  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }

  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }

  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }

  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }

  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }

  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }

  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }

  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }

  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }

  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }

  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }

  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }

  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }

  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }

  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }

  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }

  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protoProtocolVersion = a3;
}

- (void)setHasProtoProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtoProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setProtoShouldSuppressRingtone:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_protoShouldSuppressRingtone = a3;
}

- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasProtoShouldSuppressRingtone
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasDummyPayload
{
  return self->_dummyPayload != 0LL;
}

- (void)setHostCallCreationTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_hostCallCreationTime = a3;
}

- (void)setHasHostCallCreationTime:(BOOL)a3
{
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasHostCallCreationTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setMessageSendTime:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_messageSendTime = a3;
}

- (void)setHasMessageSendTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMessageSendTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setProtoNeedsManualInCallSounds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_protoNeedsManualInCallSounds = a3;
}

- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProtoNeedsManualInCallSounds
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_protoCannotRelayAudioOrVideoOnPairedDevice = a3;
}

- (void)setHasProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProtoCannotRelayAudioOrVideoOnPairedDevice
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setProtoExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_protoExpectedEndpointOnMessagingDevice = a3;
}

- (void)setHasProtoExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasProtoExpectedEndpointOnMessagingDevice
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0LL;
}

- (BOOL)hasProtoCallCapabilitiesState
{
  return self->_protoCallCapabilitiesState != 0LL;
}

- (void)setProtoSoundRegion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_protoSoundRegion = a3;
}

- (void)setHasProtoSoundRegion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProtoSoundRegion
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setProtoEmergency:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_protoEmergency = a3;
}

- (void)setHasProtoEmergency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasProtoEmergency
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)clearOtherUniqueProxyIdentifiers
{
}

- (void)addOtherUniqueProxyIdentifiers:(id)a3
{
  id v4 = a3;
  otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  id v8 = v4;
  if (!otherUniqueProxyIdentifiers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_otherUniqueProxyIdentifiers;
    self->_otherUniqueProxyIdentifiers = v6;

    id v4 = v8;
    otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  }

  -[NSMutableArray addObject:](otherUniqueProxyIdentifiers, "addObject:", v4);
}

- (unint64_t)otherUniqueProxyIdentifiersCount
{
  return (unint64_t)-[NSMutableArray count](self->_otherUniqueProxyIdentifiers, "count");
}

- (id)otherUniqueProxyIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_otherUniqueProxyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)otherUniqueProxyIdentifiersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

- (BOOL)hasProtoCallModel
{
  return self->_protoCallModel != 0LL;
}

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (void)setProtoSOS:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_protoSOS = a3;
}

- (void)setHasProtoSOS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasProtoSOS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)clearProviders
{
}

- (void)addProviders:(id)a3
{
  id v4 = a3;
  providers = self->_providers;
  id v8 = v4;
  if (!providers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_providers;
    self->_providers = v6;

    id v4 = v8;
    providers = self->_providers;
  }

  -[NSMutableArray addObject:](providers, "addObject:", v4);
}

- (unint64_t)providersCount
{
  return (unint64_t)-[NSMutableArray count](self->_providers, "count");
}

- (id)providersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_providers, "objectAtIndex:", a3);
}

+ (Class)providersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingCallProvider, a2);
}

- (BOOL)hasProtoDisplayContext
{
  return self->_protoDisplayContext != 0LL;
}

- (BOOL)hasInviteData
{
  return self->_inviteData != 0LL;
}

- (BOOL)hasProtoProvider
{
  return self->_protoProvider != 0LL;
}

- (void)setProtoVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_protoVideo = a3;
}

- (void)setHasProtoVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasProtoVideo
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setProtoUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_protoUplinkMuted = a3;
}

- (void)setHasProtoUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasProtoUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setProtoRemoteUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_protoRemoteUplinkMuted = a3;
}

- (void)setHasProtoRemoteUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasProtoRemoteUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSystemVolume:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_systemVolume = a3;
}

- (void)setHasSystemVolume:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSystemVolume
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasLocalSenderIdentityUUIDString
{
  return self->_localSenderIdentityUUIDString != 0LL;
}

- (void)clearRemoteParticipantHandles
{
}

- (void)addRemoteParticipantHandles:(id)a3
{
  id v4 = a3;
  remoteParticipantHandles = self->_remoteParticipantHandles;
  id v8 = v4;
  if (!remoteParticipantHandles)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_remoteParticipantHandles;
    self->_remoteParticipantHandles = v6;

    id v4 = v8;
    remoteParticipantHandles = self->_remoteParticipantHandles;
  }

  -[NSMutableArray addObject:](remoteParticipantHandles, "addObject:", v4);
}

- (unint64_t)remoteParticipantHandlesCount
{
  return (unint64_t)-[NSMutableArray count](self->_remoteParticipantHandles, "count");
}

- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_remoteParticipantHandles, "objectAtIndex:", a3);
}

+ (Class)remoteParticipantHandlesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingHandle, a2);
}

- (BOOL)hasLocalSenderIdentityAccountUUIDString
{
  return self->_localSenderIdentityAccountUUIDString != 0LL;
}

- (void)setProtoTTYType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_protoTTYType = a3;
}

- (void)setHasProtoTTYType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProtoTTYType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProtoSupportsTTYWithVoice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_protoSupportsTTYWithVoice = a3;
}

- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasProtoSupportsTTYWithVoice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)requestActionType
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0) {
    return self->_requestActionType;
  }
  else {
    return 0;
  }
}

- (void)setRequestActionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_requestActionType = a3;
}

- (void)setHasRequestActionType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequestActionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)requestActionTypeAsString:(int)a3
{
  if (a3 >= 0x39) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D8620[a3];
  }
}

- (int)StringAsRequestActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }

  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }

  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }

  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }

  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }

  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }

  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }

  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }

  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }

  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }

  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }

  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }

  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }

  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }

  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }

  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }

  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }

  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }

  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }

  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }

  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }

  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }

  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }

  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }

  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }

  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearRoutes
{
}

- (void)addRoutes:(id)a3
{
  id v4 = a3;
  routes = self->_routes;
  id v8 = v4;
  if (!routes)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_routes;
    self->_routes = v6;

    id v4 = v8;
    routes = self->_routes;
  }

  -[NSMutableArray addObject:](routes, "addObject:", v4);
}

- (unint64_t)routesCount
{
  return (unint64_t)-[NSMutableArray count](self->_routes, "count");
}

- (id)routesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_routes, "objectAtIndex:", a3);
}

+ (Class)routesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingRoute, a2);
}

- (BOOL)hasRoute
{
  return self->_route != 0LL;
}

- (void)clearEndpointIDSDestinationURIs
{
}

- (void)addEndpointIDSDestinationURIs:(id)a3
{
  id v4 = a3;
  endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  id v8 = v4;
  if (!endpointIDSDestinationURIs)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_endpointIDSDestinationURIs;
    self->_endpointIDSDestinationURIs = v6;

    id v4 = v8;
    endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  }

  -[NSMutableArray addObject:](endpointIDSDestinationURIs, "addObject:", v4);
}

- (unint64_t)endpointIDSDestinationURIsCount
{
  return (unint64_t)-[NSMutableArray count](self->_endpointIDSDestinationURIs, "count");
}

- (id)endpointIDSDestinationURIsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_endpointIDSDestinationURIs, "objectAtIndex:", a3);
}

+ (Class)endpointIDSDestinationURIsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0LL;
}

- (void)setProtoPriority:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_protoPriority = a3;
}

- (void)setHasProtoPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProtoPriority
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setProtoOriginatingUIType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_protoOriginatingUIType = a3;
}

- (void)setHasProtoOriginatingUIType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProtoOriginatingUIType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setProtoFailureExpected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_protoFailureExpected = a3;
}

- (void)setHasProtoFailureExpected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasProtoFailureExpected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setProtoSupportsEmergencyFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_protoSupportsEmergencyFallback = a3;
}

- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasProtoSupportsEmergencyFallback
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0LL;
}

- (void)clearConversations
{
}

- (void)addConversations:(id)a3
{
  id v4 = a3;
  conversations = self->_conversations;
  id v8 = v4;
  if (!conversations)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_conversations;
    self->_conversations = v6;

    id v4 = v8;
    conversations = self->_conversations;
  }

  -[NSMutableArray addObject:](conversations, "addObject:", v4);
}

- (unint64_t)conversationsCount
{
  return (unint64_t)-[NSMutableArray count](self->_conversations, "count");
}

- (id)conversationsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_conversations, "objectAtIndex:", a3);
}

+ (Class)conversationsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationRelayMessage, a2);
}

- (BOOL)hasJoinConversationRequestURLString
{
  return self->_joinConversationRequestURLString != 0LL;
}

- (BOOL)hasConversationUUIDString
{
  return self->_conversationUUIDString != 0LL;
}

- (void)clearConversationMembers
{
}

- (void)addConversationMembers:(id)a3
{
  id v4 = a3;
  conversationMembers = self->_conversationMembers;
  id v8 = v4;
  if (!conversationMembers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_conversationMembers;
    self->_conversationMembers = v6;

    id v4 = v8;
    conversationMembers = self->_conversationMembers;
  }

  -[NSMutableArray addObject:](conversationMembers, "addObject:", v4);
}

- (unint64_t)conversationMembersCount
{
  return (unint64_t)-[NSMutableArray count](self->_conversationMembers, "count");
}

- (id)conversationMembersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_conversationMembers, "objectAtIndex:", a3);
}

+ (Class)conversationMembersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
}

- (void)clearHandlesToInvites
{
}

- (void)addHandlesToInvite:(id)a3
{
  id v4 = a3;
  handlesToInvites = self->_handlesToInvites;
  id v8 = v4;
  if (!handlesToInvites)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_handlesToInvites;
    self->_handlesToInvites = v6;

    id v4 = v8;
    handlesToInvites = self->_handlesToInvites;
  }

  -[NSMutableArray addObject:](handlesToInvites, "addObject:", v4);
}

- (unint64_t)handlesToInvitesCount
{
  return (unint64_t)-[NSMutableArray count](self->_handlesToInvites, "count");
}

- (id)handlesToInviteAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_handlesToInvites, "objectAtIndex:", a3);
}

+ (Class)handlesToInviteType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingHandle, a2);
}

- (void)clearProminenceEntrys
{
}

- (void)addProminenceEntry:(id)a3
{
  id v4 = a3;
  prominenceEntrys = self->_prominenceEntrys;
  id v8 = v4;
  if (!prominenceEntrys)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_prominenceEntrys;
    self->_prominenceEntrys = v6;

    id v4 = v8;
    prominenceEntrys = self->_prominenceEntrys;
  }

  -[NSMutableArray addObject:](prominenceEntrys, "addObject:", v4);
}

- (unint64_t)prominenceEntrysCount
{
  return (unint64_t)-[NSMutableArray count](self->_prominenceEntrys, "count");
}

- (id)prominenceEntryAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_prominenceEntrys, "objectAtIndex:", a3);
}

+ (Class)prominenceEntryType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingParticipantProminenceEntry, a2);
}

- (void)setProtoSupportsDTMFUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_protoSupportsDTMFUpdates = a3;
}

- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProtoSupportsDTMFUpdates
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasDtmfUpdateDigits
{
  return self->_dtmfUpdateDigits != 0LL;
}

- (BOOL)hasImage
{
  return self->_image != 0LL;
}

- (BOOL)hasSenderIDSIdentifier
{
  return self->_senderIDSIdentifier != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingRelayMessage;
  id v3 = -[CSDMessagingRelayMessage description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingRelayMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 0x39) {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      id v5 = off_1003D8620[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }

  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    [v3 setObject:uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  }
  destinationID = self->_destinationID;
  if (destinationID) {
    [v3 setObject:destinationID forKey:@"destinationID"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v3 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  protoCallModelState = self->_protoCallModelState;
  if (protoCallModelState)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingCallModelState dictionaryRepresentation]( protoCallModelState,  "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"protoCallModelState"];
  }

  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_protoService));
    [v3 setObject:v69 forKey:@"protoService"];

    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_16;
  }

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoWantsHoldMusic));
  [v3 setObject:v70 forKey:@"protoWantsHoldMusic"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoCannotBeAnswered));
    [v3 setObject:v12 forKey:@"protoCannotBeAnswered"];
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100070DF8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
  }
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    PBDataWriterWriteStringField(v5, uniqueProxyIdentifier, 2LL);
  }
  destinationID = self->_destinationID;
  if (destinationID) {
    PBDataWriterWriteStringField(v5, destinationID, 3LL);
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    PBDataWriterWriteStringField(v5, sourceIdentifier, 4LL);
  }
  protoCallModelState = self->_protoCallModelState;
  if (protoCallModelState) {
    PBDataWriterWriteSubmessage(v5, protoCallModelState, 5LL);
  }
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_protoService, 6LL);
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_13;
  }

  PBDataWriterWriteBOOLField(v5, self->_protoWantsHoldMusic, 7LL);
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField(v5, self->_protoCannotBeAnswered, 8LL);
LABEL_15:
  protoDTMFKey = self->_protoDTMFKey;
  if (protoDTMFKey) {
    PBDataWriterWriteDataField(v5, protoDTMFKey, 9LL);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint32Field(v5, self->_protoDisconnectedReason, 10LL);
  }
  oBSOLETEConferenceIdentifier = self->_oBSOLETEConferenceIdentifier;
  if (oBSOLETEConferenceIdentifier) {
    PBDataWriterWriteStringField(v5, oBSOLETEConferenceIdentifier, 11LL);
  }
  if ((*((_BYTE *)&self->_has + 3) & 0x10) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_protoVoicemail, 12LL);
  }
  callerNameFromNetwork = self->_callerNameFromNetwork;
  if (callerNameFromNetwork) {
    PBDataWriterWriteStringField(v5, callerNameFromNetwork, 13LL);
  }
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v14 = self->_protoCalls;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v125,  v138,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v126;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v126 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v125 + 1) + 8LL * (void)v18), 14LL);
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v125,  v138,  16LL);
    }

    while (v16);
  }

  hardPauseDigits = self->_hardPauseDigits;
  if (hardPauseDigits) {
    PBDataWriterWriteStringField(v5, hardPauseDigits, 15LL);
  }
  $D957FAF0D32A69CAB50B82F534D16002 v20 = self->_has;
  if ((*(_BYTE *)&v20 & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_hardPauseState, 16LL);
    $D957FAF0D32A69CAB50B82F534D16002 v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x400) == 0)
    {
LABEL_36:
      if ((*(_BYTE *)&v20 & 0x40) == 0) {
        goto LABEL_37;
      }
      goto LABEL_172;
    }
  }

  else if ((*(_WORD *)&v20 & 0x400) == 0)
  {
    goto LABEL_36;
  }

  PBDataWriterWriteInt32Field(v5, self->_receivedMessageType, 17LL);
  $D957FAF0D32A69CAB50B82F534D16002 v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x40) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v20 & 0x400000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    v4[93] = self->_type;
    v4[100] |= 0x2000u;
  }

  v55 = v4;
  if (self->_uniqueProxyIdentifier)
  {
    objc_msgSend(v4, "setUniqueProxyIdentifier:");
    id v4 = v55;
  }

  if (self->_destinationID)
  {
    objc_msgSend(v55, "setDestinationID:");
    id v4 = v55;
  }

  if (self->_sourceIdentifier)
  {
    objc_msgSend(v55, "setSourceIdentifier:");
    id v4 = v55;
  }

  if (self->_protoCallModelState)
  {
    objc_msgSend(v55, "setProtoCallModelState:");
    id v4 = v55;
  }

  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v4[72] = self->_protoService;
    v4[100] |= 0x80u;
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_13;
  }

  *((_BYTE *)v4 + 399) = self->_protoWantsHoldMusic;
  v4[100] |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_14:
    *((_BYTE *)v4 + 384) = self->_protoCannotBeAnswered;
    v4[100] |= 0x4000u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    v5[93] = self->_type;
    v5[100] |= 0x2000u;
  }

  id v7 = -[NSString copyWithZone:](self->_uniqueProxyIdentifier, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[47];
  v6[47] = v7;

  id v9 = -[NSString copyWithZone:](self->_destinationID, "copyWithZone:", a3);
  $D957FAF0D32A69CAB50B82F534D16002 v10 = (void *)v6[8];
  v6[8] = v9;

  id v11 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  $D957FAF0D32A69CAB50B82F534D16002 v12 = (void *)v6[45];
  v6[45] = v11;

  id v13 = -[CSDMessagingCallModelState copyWithZone:](self->_protoCallModelState, "copyWithZone:", a3);
  unint64_t v14 = (void *)v6[28];
  v6[28] = v13;

  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_DWORD *)v6 + 72) = self->_protoService;
    *((_DWORD *)v6 + 100) |= 0x80u;
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }

  *((_BYTE *)v6 + 399) = self->_protoWantsHoldMusic;
  *((_DWORD *)v6 + 100) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    *((_BYTE *)v6 + 384) = self->_protoCannotBeAnswered;
    *((_DWORD *)v6 + 100) |= 0x4000u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v6 = *((_DWORD *)v4 + 100);
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_type != *((_DWORD *)v4 + 93)) {
      goto LABEL_275;
    }
  }

  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_275;
  }

  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if ((unint64_t)uniqueProxyIdentifier | *((void *)v4 + 47)
    && !-[NSString isEqual:](uniqueProxyIdentifier, "isEqual:"))
  {
    goto LABEL_275;
  }

  destinationID = self->_destinationID;
  if ((unint64_t)destinationID | *((void *)v4 + 8))
  {
  }

  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 45))
  {
  }

  protoCallModelState = self->_protoCallModelState;
  if ((unint64_t)protoCallModelState | *((void *)v4 + 28))
  {
    if (!-[CSDMessagingCallModelState isEqual:](protoCallModelState, "isEqual:")) {
      goto LABEL_275;
    }
  }

  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  int v12 = *((_DWORD *)v4 + 100);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_protoService != *((_DWORD *)v4 + 72)) {
      goto LABEL_275;
    }
  }

  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v12 & 0x20000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoWantsHoldMusic)
    {
      if (!*((_BYTE *)v4 + 399)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 399))
    {
      goto LABEL_275;
    }
  }

  else if ((v12 & 0x20000000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoCannotBeAnswered)
    {
      if (!*((_BYTE *)v4 + 384)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 384))
    {
      goto LABEL_275;
    }
  }

  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_275;
  }

  protoDTMFKey = self->_protoDTMFKey;
  if ((unint64_t)protoDTMFKey | *((void *)v4 + 30))
  {
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  }

  int v14 = *((_DWORD *)v4 + 100);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_protoDisconnectedReason != *((_DWORD *)v4 + 62)) {
      goto LABEL_275;
    }
  }

  else if ((v14 & 8) != 0)
  {
    goto LABEL_275;
  }

  oBSOLETEConferenceIdentifier = self->_oBSOLETEConferenceIdentifier;
  if ((unint64_t)oBSOLETEConferenceIdentifier | *((void *)v4 + 23))
  {
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  }

  int v16 = *((_DWORD *)v4 + 100);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v16 & 0x10000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoVoicemail)
    {
      if (!*((_BYTE *)v4 + 398)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 398))
    {
      goto LABEL_275;
    }
  }

  else if ((v16 & 0x10000000) != 0)
  {
    goto LABEL_275;
  }

  callerNameFromNetworuint64_t k = self->_callerNameFromNetwork;
  if ((unint64_t)callerNameFromNetwork | *((void *)v4 + 3)
    && !-[NSString isEqual:](callerNameFromNetwork, "isEqual:"))
  {
    goto LABEL_275;
  }

  protoCalls = self->_protoCalls;
  if ((unint64_t)protoCalls | *((void *)v4 + 29))
  {
  }

  hardPauseDigits = self->_hardPauseDigits;
  if ((unint64_t)hardPauseDigits | *((void *)v4 + 15))
  {
  }

  $D957FAF0D32A69CAB50B82F534D16002 v20 = self->_has;
  int v21 = *((_DWORD *)v4 + 100);
  if ((*(_BYTE *)&v20 & 4) != 0)
  {
    if ((v21 & 4) == 0 || self->_hardPauseState != *((_DWORD *)v4 + 32)) {
      goto LABEL_275;
    }
  }

  else if ((v21 & 4) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
    if ((v21 & 0x400) == 0 || self->_receivedMessageType != *((_DWORD *)v4 + 78)) {
      goto LABEL_275;
    }
  }

  else if ((v21 & 0x400) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_BYTE *)&v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0 || self->_protoProtocolVersion != *((_DWORD *)v4 + 68)) {
      goto LABEL_275;
    }
  }

  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v20 & 0x400000) != 0)
  {
    if ((v21 & 0x400000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoShouldSuppressRingtone)
    {
      if (!*((_BYTE *)v4 + 392)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 392))
    {
      goto LABEL_275;
    }
  }

  else if ((v21 & 0x400000) != 0)
  {
    goto LABEL_275;
  }

  dummyPayload = self->_dummyPayload;
  if ((unint64_t)dummyPayload | *((void *)v4 + 10))
  {
    $D957FAF0D32A69CAB50B82F534D16002 v20 = self->_has;
  }

  int v23 = *((_DWORD *)v4 + 100);
  if ((*(_BYTE *)&v20 & 1) != 0)
  {
  }

  else if ((v23 & 1) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_BYTE *)&v20 & 2) != 0)
  {
  }

  else if ((v23 & 2) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    if ((v23 & 0x80000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoNeedsManualInCallSounds)
    {
      if (!*((_BYTE *)v4 + 389)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 389))
    {
      goto LABEL_275;
    }
  }

  else if ((v23 & 0x80000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_WORD *)&v20 & 0x8000) != 0)
  {
    if ((v23 & 0x8000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoCannotRelayAudioOrVideoOnPairedDevice)
    {
      if (!*((_BYTE *)v4 + 385)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 385))
    {
      goto LABEL_275;
    }
  }

  else if ((v23 & 0x8000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v20 & 0x20000) != 0)
  {
    if ((v23 & 0x20000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoExpectedEndpointOnMessagingDevice)
    {
      if (!*((_BYTE *)v4 + 387)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 387))
    {
      goto LABEL_275;
    }
  }

  else if ((v23 & 0x20000) != 0)
  {
    goto LABEL_275;
  }

  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](contactIdentifier, "isEqual:"))
  {
    goto LABEL_275;
  }

  protoCallCapabilitiesState = self->_protoCallCapabilitiesState;
  if ((unint64_t)protoCallCapabilitiesState | *((void *)v4 + 26))
  {
    if (!-[CSDMessagingCallCapabilitiesState isEqual:](protoCallCapabilitiesState, "isEqual:")) {
      goto LABEL_275;
    }
  }

  $D957FAF0D32A69CAB50B82F534D16002 v26 = self->_has;
  int v27 = *((_DWORD *)v4 + 100);
  if ((*(_WORD *)&v26 & 0x100) != 0)
  {
    if ((v27 & 0x100) == 0 || self->_protoSoundRegion != *((_DWORD *)v4 + 73)) {
      goto LABEL_275;
    }
  }

  else if ((v27 & 0x100) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v26 & 0x10000) != 0)
  {
    if ((v27 & 0x10000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoEmergency)
    {
      if (!*((_BYTE *)v4 + 386)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 386))
    {
      goto LABEL_275;
    }
  }

  else if ((v27 & 0x10000) != 0)
  {
    goto LABEL_275;
  }

  otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  if ((unint64_t)otherUniqueProxyIdentifiers | *((void *)v4 + 24)
    && !-[NSMutableArray isEqual:](otherUniqueProxyIdentifiers, "isEqual:"))
  {
    goto LABEL_275;
  }

  protoCallModel = self->_protoCallModel;
  if ((unint64_t)protoCallModel | *((void *)v4 + 27))
  {
    if (!-[CSDMessagingCallModel isEqual:](protoCallModel, "isEqual:")) {
      goto LABEL_275;
    }
  }

  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 13))
  {
    if (!-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_275;
    }
  }

  int v31 = *((_DWORD *)v4 + 100);
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v31 & 0x200000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSOS)
    {
      if (!*((_BYTE *)v4 + 391)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 391))
    {
      goto LABEL_275;
    }
  }

  else if ((v31 & 0x200000) != 0)
  {
    goto LABEL_275;
  }

  providers = self->_providers;
  if ((unint64_t)providers | *((void *)v4 + 38)
    && !-[NSMutableArray isEqual:](providers, "isEqual:"))
  {
    goto LABEL_275;
  }

  protoDisplayContext = self->_protoDisplayContext;
  if ((unint64_t)protoDisplayContext | *((void *)v4 + 32))
  {
    if (!-[CSDMessagingCallDisplayContext isEqual:](protoDisplayContext, "isEqual:")) {
      goto LABEL_275;
    }
  }

  inviteData = self->_inviteData;
  if ((unint64_t)inviteData | *((void *)v4 + 18))
  {
    if (!-[CSDMessagingAVConferenceInviteData isEqual:](inviteData, "isEqual:")) {
      goto LABEL_275;
    }
  }

  protoProvider = self->_protoProvider;
  if ((unint64_t)protoProvider | *((void *)v4 + 35))
  {
    if (!-[CSDMessagingCallProvider isEqual:](protoProvider, "isEqual:")) {
      goto LABEL_275;
    }
  }

  $D957FAF0D32A69CAB50B82F534D16002 v36 = self->_has;
  int v37 = *((_DWORD *)v4 + 100);
  if ((*(_DWORD *)&v36 & 0x8000000) != 0)
  {
    if ((v37 & 0x8000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoVideo)
    {
      if (!*((_BYTE *)v4 + 397)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 397))
    {
      goto LABEL_275;
    }
  }

  else if ((v37 & 0x8000000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v36 & 0x4000000) != 0)
  {
    if ((v37 & 0x4000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoUplinkMuted)
    {
      if (!*((_BYTE *)v4 + 396)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 396))
    {
      goto LABEL_275;
    }
  }

  else if ((v37 & 0x4000000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v36 & 0x100000) != 0)
  {
    if ((v37 & 0x100000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoRemoteUplinkMuted)
    {
      if (!*((_BYTE *)v4 + 390)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 390))
    {
      goto LABEL_275;
    }
  }

  else if ((v37 & 0x100000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_WORD *)&v36 & 0x1000) != 0)
  {
  }

  else if ((v37 & 0x1000) != 0)
  {
    goto LABEL_275;
  }

  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if ((unint64_t)localSenderIdentityUUIDString | *((void *)v4 + 22)
    && !-[NSString isEqual:](localSenderIdentityUUIDString, "isEqual:"))
  {
    goto LABEL_275;
  }

  remoteParticipantHandles = self->_remoteParticipantHandles;
  if ((unint64_t)remoteParticipantHandles | *((void *)v4 + 40))
  {
  }

  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if ((unint64_t)localSenderIdentityAccountUUIDString | *((void *)v4 + 21))
  {
  }

  $D957FAF0D32A69CAB50B82F534D16002 v41 = self->_has;
  int v42 = *((_DWORD *)v4 + 100);
  if ((*(_WORD *)&v41 & 0x200) != 0)
  {
    if ((v42 & 0x200) == 0 || self->_protoTTYType != *((_DWORD *)v4 + 74)) {
      goto LABEL_275;
    }
  }

  else if ((v42 & 0x200) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v41 & 0x2000000) != 0)
  {
    if ((v42 & 0x2000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSupportsTTYWithVoice)
    {
      if (!*((_BYTE *)v4 + 395)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 395))
    {
      goto LABEL_275;
    }
  }

  else if ((v42 & 0x2000000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_WORD *)&v41 & 0x800) != 0)
  {
    if ((v42 & 0x800) == 0 || self->_requestActionType != *((_DWORD *)v4 + 82)) {
      goto LABEL_275;
    }
  }

  else if ((v42 & 0x800) != 0)
  {
    goto LABEL_275;
  }

  routes = self->_routes;
  route = self->_route;
  if ((unint64_t)route | *((void *)v4 + 42))
  {
    if (!-[CSDMessagingRoute isEqual:](route, "isEqual:")) {
      goto LABEL_275;
    }
  }

  endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  if ((unint64_t)endpointIDSDestinationURIs | *((void *)v4 + 11))
  {
  }

  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 19))
  {
  }

  $D957FAF0D32A69CAB50B82F534D16002 v47 = self->_has;
  int v48 = *((_DWORD *)v4 + 100);
  if ((*(_BYTE *)&v47 & 0x20) != 0)
  {
    if ((v48 & 0x20) == 0 || self->_protoPriority != *((_DWORD *)v4 + 67)) {
      goto LABEL_275;
    }
  }

  else if ((v48 & 0x20) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_BYTE *)&v47 & 0x10) != 0)
  {
    if ((v48 & 0x10) == 0 || self->_protoOriginatingUIType != *((_DWORD *)v4 + 66)) {
      goto LABEL_275;
    }
  }

  else if ((v48 & 0x10) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v47 & 0x40000) != 0)
  {
    if ((v48 & 0x40000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoFailureExpected)
    {
      if (!*((_BYTE *)v4 + 388)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 388))
    {
      goto LABEL_275;
    }
  }

  else if ((v48 & 0x40000) != 0)
  {
    goto LABEL_275;
  }

  if ((*(_DWORD *)&v47 & 0x1000000) != 0)
  {
    if ((v48 & 0x1000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSupportsEmergencyFallback)
    {
      if (!*((_BYTE *)v4 + 394)) {
        goto LABEL_275;
      }
    }

    else if (*((_BYTE *)v4 + 394))
    {
      goto LABEL_275;
    }
  }

  else if ((v48 & 0x1000000) != 0)
  {
    goto LABEL_275;
  }

  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 12)
    && !-[NSString isEqual:](groupUUIDString, "isEqual:"))
  {
    goto LABEL_275;
  }

  conversations = self->_conversations;
  if ((unint64_t)conversations | *((void *)v4 + 7))
  {
  }

  joinConversationRequestURLString = self->_joinConversationRequestURLString;
  if ((unint64_t)joinConversationRequestURLString | *((void *)v4 + 20))
  {
  }

  conversationUUIDString = self->_conversationUUIDString;
  if ((unint64_t)conversationUUIDString | *((void *)v4 + 6))
  {
  }

  conversationMembers = self->_conversationMembers;
  if ((unint64_t)conversationMembers | *((void *)v4 + 5))
  {
  }

  handlesToInvites = self->_handlesToInvites;
  if ((unint64_t)handlesToInvites | *((void *)v4 + 14))
  {
  }

  prominenceEntrys = self->_prominenceEntrys;
  if ((unint64_t)prominenceEntrys | *((void *)v4 + 25))
  {
  }

  int v56 = *((_DWORD *)v4 + 100);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v56 & 0x800000) != 0)
    {
      if (self->_protoSupportsDTMFUpdates)
      {
        if (!*((_BYTE *)v4 + 393)) {
          goto LABEL_275;
        }
        goto LABEL_269;
      }

      if (!*((_BYTE *)v4 + 393)) {
        goto LABEL_269;
      }
    }

- (unint64_t)hash
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v90 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v90 = 0LL;
  }
  NSUInteger v89 = -[NSString hash](self->_uniqueProxyIdentifier, "hash");
  NSUInteger v88 = -[NSString hash](self->_destinationID, "hash");
  NSUInteger v87 = -[NSString hash](self->_sourceIdentifier, "hash");
  unint64_t v86 = -[CSDMessagingCallModelState hash](self->_protoCallModelState, "hash");
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
    uint64_t v85 = 0LL;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v84 = 0LL;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }

  uint64_t v85 = 2654435761LL * self->_protoService;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v84 = 2654435761LL * self->_protoWantsHoldMusic;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v83 = 2654435761LL * self->_protoCannotBeAnswered;
    goto LABEL_11;
  }

- (void)mergeFrom:(id)a3
{
  $D957FAF0D32A69CAB50B82F534D16002 v4 = a3;
  id v5 = v4;
  if ((*((_BYTE *)v4 + 401) & 0x20) != 0)
  {
    self->_uint64_t type = v4[93];
    *(_DWORD *)&self->_has |= 0x2000u;
  }

  if (*((void *)v4 + 47)) {
    -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](self, "setUniqueProxyIdentifier:");
  }
  if (*((void *)v5 + 8)) {
    -[CSDMessagingRelayMessage setDestinationID:](self, "setDestinationID:");
  }
  if (*((void *)v5 + 45)) {
    -[CSDMessagingRelayMessage setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  protoCallModelState = self->_protoCallModelState;
  uint64_t v7 = *((void *)v5 + 28);
  if (protoCallModelState)
  {
    if (v7) {
      -[CSDMessagingCallModelState mergeFrom:](protoCallModelState, "mergeFrom:");
    }
  }

  else if (v7)
  {
    -[CSDMessagingRelayMessage setProtoCallModelState:](self, "setProtoCallModelState:");
  }

  int v8 = *((_DWORD *)v5 + 100);
  if ((v8 & 0x80) != 0)
  {
    self->_protoService = *((_DWORD *)v5 + 72);
    *(_DWORD *)&self->_has |= 0x80u;
    int v8 = *((_DWORD *)v5 + 100);
    if ((v8 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x4000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }

  self->_protoWantsHoldMusic = *((_BYTE *)v5 + 399);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)v5 + 100) & 0x4000) != 0)
  {
LABEL_17:
    self->_protoCannotBeAnswered = *((_BYTE *)v5 + 384);
    *(_DWORD *)&self->_has |= 0x4000u;
  }

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (CSDMessagingCallModelState)protoCallModelState
{
  return self->_protoCallModelState;
}

- (void)setProtoCallModelState:(id)a3
{
}

- (unsigned)protoService
{
  return self->_protoService;
}

- (BOOL)protoWantsHoldMusic
{
  return self->_protoWantsHoldMusic;
}

- (BOOL)protoCannotBeAnswered
{
  return self->_protoCannotBeAnswered;
}

- (NSData)protoDTMFKey
{
  return self->_protoDTMFKey;
}

- (void)setProtoDTMFKey:(id)a3
{
}

- (unsigned)protoDisconnectedReason
{
  return self->_protoDisconnectedReason;
}

- (NSString)oBSOLETEConferenceIdentifier
{
  return self->_oBSOLETEConferenceIdentifier;
}

- (void)setOBSOLETEConferenceIdentifier:(id)a3
{
}

- (BOOL)protoVoicemail
{
  return self->_protoVoicemail;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (void)setCallerNameFromNetwork:(id)a3
{
}

- (NSMutableArray)protoCalls
{
  return self->_protoCalls;
}

- (void)setProtoCalls:(id)a3
{
}

- (NSString)hardPauseDigits
{
  return self->_hardPauseDigits;
}

- (void)setHardPauseDigits:(id)a3
{
}

- (unsigned)hardPauseState
{
  return self->_hardPauseState;
}

- (unsigned)protoProtocolVersion
{
  return self->_protoProtocolVersion;
}

- (BOOL)protoShouldSuppressRingtone
{
  return self->_protoShouldSuppressRingtone;
}

- (NSData)dummyPayload
{
  return self->_dummyPayload;
}

- (void)setDummyPayload:(id)a3
{
}

- (double)hostCallCreationTime
{
  return self->_hostCallCreationTime;
}

- (double)messageSendTime
{
  return self->_messageSendTime;
}

- (BOOL)protoNeedsManualInCallSounds
{
  return self->_protoNeedsManualInCallSounds;
}

- (BOOL)protoCannotRelayAudioOrVideoOnPairedDevice
{
  return self->_protoCannotRelayAudioOrVideoOnPairedDevice;
}

- (BOOL)protoExpectedEndpointOnMessagingDevice
{
  return self->_protoExpectedEndpointOnMessagingDevice;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (CSDMessagingCallCapabilitiesState)protoCallCapabilitiesState
{
  return self->_protoCallCapabilitiesState;
}

- (void)setProtoCallCapabilitiesState:(id)a3
{
}

- (unsigned)protoSoundRegion
{
  return self->_protoSoundRegion;
}

- (BOOL)protoEmergency
{
  return self->_protoEmergency;
}

- (NSMutableArray)otherUniqueProxyIdentifiers
{
  return self->_otherUniqueProxyIdentifiers;
}

- (void)setOtherUniqueProxyIdentifiers:(id)a3
{
}

- (CSDMessagingCallModel)protoCallModel
{
  return self->_protoCallModel;
}

- (void)setProtoCallModel:(id)a3
{
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)protoSOS
{
  return self->_protoSOS;
}

- (NSMutableArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (CSDMessagingCallDisplayContext)protoDisplayContext
{
  return self->_protoDisplayContext;
}

- (void)setProtoDisplayContext:(id)a3
{
}

- (CSDMessagingAVConferenceInviteData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
}

- (CSDMessagingCallProvider)protoProvider
{
  return self->_protoProvider;
}

- (void)setProtoProvider:(id)a3
{
}

- (BOOL)protoVideo
{
  return self->_protoVideo;
}

- (BOOL)protoUplinkMuted
{
  return self->_protoUplinkMuted;
}

- (BOOL)protoRemoteUplinkMuted
{
  return self->_protoRemoteUplinkMuted;
}

- (float)systemVolume
{
  return self->_systemVolume;
}

- (NSString)localSenderIdentityUUIDString
{
  return self->_localSenderIdentityUUIDString;
}

- (void)setLocalSenderIdentityUUIDString:(id)a3
{
}

- (NSMutableArray)remoteParticipantHandles
{
  return self->_remoteParticipantHandles;
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (NSString)localSenderIdentityAccountUUIDString
{
  return self->_localSenderIdentityAccountUUIDString;
}

- (void)setLocalSenderIdentityAccountUUIDString:(id)a3
{
}

- (unsigned)protoTTYType
{
  return self->_protoTTYType;
}

- (BOOL)protoSupportsTTYWithVoice
{
  return self->_protoSupportsTTYWithVoice;
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (CSDMessagingRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (NSMutableArray)endpointIDSDestinationURIs
{
  return self->_endpointIDSDestinationURIs;
}

- (void)setEndpointIDSDestinationURIs:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (unsigned)protoPriority
{
  return self->_protoPriority;
}

- (unsigned)protoOriginatingUIType
{
  return self->_protoOriginatingUIType;
}

- (BOOL)protoFailureExpected
{
  return self->_protoFailureExpected;
}

- (BOOL)protoSupportsEmergencyFallback
{
  return self->_protoSupportsEmergencyFallback;
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (NSMutableArray)conversations
{
  return self->_conversations;
}

- (void)setConversations:(id)a3
{
}

- (NSString)joinConversationRequestURLString
{
  return self->_joinConversationRequestURLString;
}

- (void)setJoinConversationRequestURLString:(id)a3
{
}

- (NSString)conversationUUIDString
{
  return self->_conversationUUIDString;
}

- (void)setConversationUUIDString:(id)a3
{
}

- (NSMutableArray)conversationMembers
{
  return self->_conversationMembers;
}

- (void)setConversationMembers:(id)a3
{
}

- (NSMutableArray)handlesToInvites
{
  return self->_handlesToInvites;
}

- (void)setHandlesToInvites:(id)a3
{
}

- (NSMutableArray)prominenceEntrys
{
  return self->_prominenceEntrys;
}

- (void)setProminenceEntrys:(id)a3
{
}

- (BOOL)protoSupportsDTMFUpdates
{
  return self->_protoSupportsDTMFUpdates;
}

- (NSString)dtmfUpdateDigits
{
  return self->_dtmfUpdateDigits;
}

- (void)setDtmfUpdateDigits:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)senderIDSIdentifier
{
  return self->_senderIDSIdentifier;
}

- (void)setSenderIDSIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end