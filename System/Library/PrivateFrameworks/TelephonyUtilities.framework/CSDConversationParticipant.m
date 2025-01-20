@interface CSDConversationParticipant
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isCameraMixedWithScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipant:(id)a3;
- (BOOL)isGuestModeEnabled;
- (BOOL)isLightweight;
- (BOOL)isLocalAccountHandle;
- (BOOL)isMuted;
- (BOOL)isPseudonym;
- (BOOL)isScreenEnabled;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)pseudonym;
- (CSDConversationParticipant)initWithIDSDictionaryRepresentation:(id)a3;
- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5;
- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5 senderCorrelationIdentifier:(id)a6;
- (NSData)avcData;
- (NSDictionary)idsDictionaryRepresentation;
- (NSString)activeIDSDestination;
- (NSString)avcIdentifier;
- (NSString)senderCorrelationIdentifier;
- (TUConversationParticipant)tuConversationParticipant;
- (TUConversationParticipantAssociation)association;
- (TUConversationParticipantCapabilities)capabilities;
- (TUHandle)handle;
- (id)description;
- (int64_t)audioPriority;
- (int64_t)captionsToken;
- (int64_t)screenToken;
- (int64_t)streamToken;
- (int64_t)videoPriority;
- (unint64_t)audioVideoMode;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)presentationMode;
- (unint64_t)spatialPersonaGenerationCounter;
- (void)setActiveIDSDestination:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioPriority:(int64_t)a3;
- (void)setAudioVideoMode:(unint64_t)a3;
- (void)setAvcIdentifier:(id)a3;
- (void)setCameraMixedWithScreen:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)setCaptionsToken:(int64_t)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setLightweight:(BOOL)a3;
- (void)setLocalAccountHandle:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenToken:(int64_t)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSpatialPersonaGenerationCounter:(unint64_t)a3;
- (void)setStreamToken:(int64_t)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPriority:(int64_t)a3;
@end

@implementation CSDConversationParticipant

- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5 senderCorrelationIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CSDConversationParticipant;
  v13 = -[CSDConversationParticipant init](&v27, "init");
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    objc_storeStrong((id *)&v13->_avcData, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 normalizedValue]);
    id v16 = [v15 length];

    if (v16)
    {
      v17 = (TUHandle *)[v10 copy];
      handle = v14->_handle;
      v14->_handle = v17;
    }

    else
    {
      uint64_t v19 = TUNormalizedHandleForTUHandle(v10);
      handle = (TUHandle *)objc_claimAutoreleasedReturnValue(v19);
      v20 = (TUHandle *)-[TUHandle copy](handle, "copy");
      v21 = v14->_handle;
      v14->_handle = v20;
    }

    v22 = objc_alloc_init(&OBJC_CLASS___TUConversationParticipantCapabilities);
    capabilities = v14->_capabilities;
    v14->_capabilities = v22;

    v24 = (NSString *)[v12 copy];
    senderCorrelationIdentifier = v14->_senderCorrelationIdentifier;
    v14->_senderCorrelationIdentifier = v24;
  }

  return v14;
}

- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5
{
  return -[CSDConversationParticipant initWithIdentifier:handle:avcData:senderCorrelationIdentifier:]( self,  "initWithIdentifier:handle:avcData:senderCorrelationIdentifier:",  a3,  a4,  a5,  0LL);
}

- (CSDConversationParticipant)initWithIDSDictionaryRepresentation:(id)a3
{
  uint64_t v4 = IDSSessionParticipantIDKey;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  v7 = (CSDConversationParticipant *)[v6 unsignedLongLongValue];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IDSSessionParticipantDataKey]);
  v9 = -[CSDMessagingConversationParticipant initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipant),  "initWithData:",  v8);
  id v10 = v9;
  if (v7)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant handle](v9, "handle"));
    if (v11
      && (id v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant avcData](v10, "avcData")),
          v13,
          v12,
          v13))
    {
      v14 = (CSDConversationParticipant *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipant csdConversationParticipant]( v10,  "csdConversationParticipant"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](v14, "handle"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant avcData](v10, "avcData"));
      v7 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:senderCorrelationIdentifier:]( self,  "initWithIdentifier:handle:avcData:senderCorrelationIdentifier:",  v7,  v15,  v16,  0LL);

      self = v14;
    }

    else
    {
      v7 = 0LL;
    }
  }

  return v7;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend( v4,  "appendFormat:",  @" identifier=%llu",  -[CSDConversationParticipant identifier](self, "identifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
  [v4 appendFormat:@" handle=%@", v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcData](self, "avcData"));
  v7 = @"YES";
  if (!v6) {
    v7 = @"NO";
  }
  [v4 appendFormat:@" hasAVCData=%@", v7];

  objc_msgSend(v4, "appendFormat:", @" isMuted=%d", -[CSDConversationParticipant isMuted](self, "isMuted"));
  objc_msgSend( v4,  "appendFormat:",  @" isAudioEnabled=%d",  -[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" isVideoEnabled=%d",  -[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" isScreenEnabled=%d",  -[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" streamToken=%ld",  -[CSDConversationParticipant streamToken](self, "streamToken"));
  objc_msgSend( v4,  "appendFormat:",  @" screenToken=%ld",  -[CSDConversationParticipant screenToken](self, "screenToken"));
  objc_msgSend( v4,  "appendFormat:",  @" captionsToken=%ld",  -[CSDConversationParticipant captionsToken](self, "captionsToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcIdentifier](self, "avcIdentifier"));
  [v4 appendFormat:@" avcIdentifier=%@", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant capabilities](self, "capabilities"));
  [v4 appendFormat:@" capabilities=%@", v9];

  objc_msgSend( v4,  "appendFormat:",  @" isAudioPaused=%d",  -[CSDConversationParticipant isAudioPaused](self, "isAudioPaused"));
  objc_msgSend( v4,  "appendFormat:",  @" isLightweight=%d",  -[CSDConversationParticipant isLightweight](self, "isLightweight"));
  objc_msgSend( v4,  "appendFormat:",  @" isLocalAccountHandle=%d",  -[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant association](self, "association"));

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant association](self, "association"));
    [v4 appendFormat:@" association=%@", v11];
  }

  objc_msgSend( v4,  "appendFormat:",  @" isGuestModeEnabled=%d",  -[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier"));
    [v4 appendFormat:@" senderCorrelationIdentifier=%@", v13];
  }

  objc_msgSend( v4,  "appendFormat:",  @" audioPriority=%lu",  -[CSDConversationParticipant audioPriority](self, "audioPriority"));
  objc_msgSend( v4,  "appendFormat:",  @" avMode=%ld",  -[CSDConversationParticipant audioVideoMode](self, "audioVideoMode"));
  objc_msgSend( v4,  "appendFormat:",  @" presentationMode=%ld",  -[CSDConversationParticipant presentationMode](self, "presentationMode"));
  if (-[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled")) {
    objc_msgSend( v4,  "appendFormat:",  @" isSpatialPersonaEnabled=%d",  -[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  }
  if (-[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen")) {
    objc_msgSend( v4,  "appendFormat:",  @" isCameraMixedWithScreen=%d",  -[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  }
  [v4 appendString:@">"];
  id v14 = [v4 copy];

  return v14;
}

- (TUConversationParticipant)tuConversationParticipant
{
  v3 = objc_alloc(&OBJC_CLASS___TUConversationParticipant);
  unint64_t v4 = -[CSDConversationParticipant identifier](self, "identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier"));
  v7 = -[TUConversationParticipant initWithIdentifier:handle:senderCorrelationIdentifier:]( v3,  "initWithIdentifier:handle:senderCorrelationIdentifier:",  v4,  v5,  v6);

  -[TUConversationParticipant setMuted:](v7, "setMuted:", -[CSDConversationParticipant isMuted](self, "isMuted"));
  -[TUConversationParticipant setAudioEnabled:]( v7,  "setAudioEnabled:",  -[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  -[TUConversationParticipant setVideoEnabled:]( v7,  "setVideoEnabled:",  -[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  -[TUConversationParticipant setScreenEnabled:]( v7,  "setScreenEnabled:",  -[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  -[TUConversationParticipant setAudioPaused:]( v7,  "setAudioPaused:",  -[CSDConversationParticipant isAudioPaused](self, "isAudioPaused"));
  -[TUConversationParticipant setStreamToken:]( v7,  "setStreamToken:",  -[CSDConversationParticipant streamToken](self, "streamToken"));
  -[TUConversationParticipant setScreenToken:]( v7,  "setScreenToken:",  -[CSDConversationParticipant screenToken](self, "screenToken"));
  -[TUConversationParticipant setCaptionsToken:]( v7,  "setCaptionsToken:",  -[CSDConversationParticipant captionsToken](self, "captionsToken"));
  -[TUConversationParticipant setAudioPriority:]( v7,  "setAudioPriority:",  -[CSDConversationParticipant audioPriority](self, "audioPriority"));
  -[TUConversationParticipant setVideoPriority:]( v7,  "setVideoPriority:",  -[CSDConversationParticipant videoPriority](self, "videoPriority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcIdentifier](self, "avcIdentifier"));
  -[TUConversationParticipant setAvcIdentifier:](v7, "setAvcIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant activeIDSDestination](self, "activeIDSDestination"));
  -[TUConversationParticipant setActiveIDSDestination:](v7, "setActiveIDSDestination:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant capabilities](self, "capabilities"));
  -[TUConversationParticipant setCapabilities:](v7, "setCapabilities:", v10);

  -[TUConversationParticipant setLightweight:]( v7,  "setLightweight:",  -[CSDConversationParticipant isLightweight](self, "isLightweight"));
  -[TUConversationParticipant setLocalAccountHandle:]( v7,  "setLocalAccountHandle:",  -[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant association](self, "association"));
  -[TUConversationParticipant setAssociation:](v7, "setAssociation:", v11);

  -[TUConversationParticipant setGuestModeEnabled:]( v7,  "setGuestModeEnabled:",  -[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  -[TUConversationParticipant setAudioVideoMode:]( v7,  "setAudioVideoMode:",  -[CSDConversationParticipant audioVideoMode](self, "audioVideoMode"));
  -[TUConversationParticipant setPresentationMode:]( v7,  "setPresentationMode:",  -[CSDConversationParticipant presentationMode](self, "presentationMode"));
  -[TUConversationParticipant setSpatialPersonaEnabled:]( v7,  "setSpatialPersonaEnabled:",  -[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  -[TUConversationParticipant setCameraMixedWithScreen:]( v7,  "setCameraMixedWithScreen:",  -[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  return v7;
}

- (NSDictionary)idsDictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  self));
  v11[0] = IDSSessionParticipantIDKey;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSDConversationParticipant identifier](self, "identifier")));
  v12[0] = v4;
  v11[1] = IDSSessionParticipantDataKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 data]);
  v12[1] = v5;
  v11[2] = IDSGroupSessionMessagesLocalMemberIDKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
  uint64_t v7 = TUCopyIDSCanonicalAddressForHandle(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  return (NSDictionary *)v9;
}

- (BOOL)pseudonym
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 value]);
  unsigned __int8 v4 = [v3 destinationIdIsPseudonym];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CSDConversationParticipant, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[CSDConversationParticipant isEqualToParticipant:](self, "isEqualToParticipant:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4 = a3;
  id v5 = -[CSDConversationParticipant identifier](self, "identifier");
  if (v5 == [v4 identifier])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    if ([v6 isEqualToHandle:v7])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcData](self, "avcData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 avcData]);
      if ([v8 isEqualToData:v9]
        && (unsigned int v10 = -[CSDConversationParticipant isMuted](self, "isMuted"),
            v10 == [v4 isMuted])
        && (unsigned int v11 = -[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled"),
            v11 == [v4 isAudioEnabled])
        && (unsigned int v12 = -[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled"),
            v12 == [v4 isVideoEnabled])
        && (unsigned int v13 = -[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled"),
            v13 == [v4 isScreenEnabled])
        && (id v14 = -[CSDConversationParticipant streamToken](self, "streamToken"), v14 == [v4 streamToken])
        && (id v15 = -[CSDConversationParticipant screenToken](self, "screenToken"), v15 == [v4 screenToken])
        && (id v16 = -[CSDConversationParticipant captionsToken](self, "captionsToken"),
            v16 == [v4 captionsToken]))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcIdentifier](self, "avcIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 avcIdentifier]);
        if (v17 == v18)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant activeIDSDestination](self, "activeIDSDestination"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v4 activeIDSDestination]);
          if (TUStringsAreEqualOrNil(v21, v22))
          {
            v39 = v22;
            uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant capabilities](self, "capabilities"));
            uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 capabilities]);
            v40 = (void *)v23;
            v25 = (void *)v23;
            v26 = (void *)v24;
            if ([v25 isEqualToCapabilities:v24])
            {
              v38 = v21;
              unsigned int v27 = -[CSDConversationParticipant isAudioPaused](self, "isAudioPaused");
              if (v27 == [v4 isAudioPaused]
                && (unsigned int v28 = -[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"),
                    v28 == [v4 isLocalAccountHandle])
                && (unsigned int v29 = -[CSDConversationParticipant isLightweight](self, "isLightweight"),
                    v29 == [v4 isLightweight]))
              {
                uint64_t v30 = objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant association](self, "association"));
                v36 = (void *)objc_claimAutoreleasedReturnValue([v4 association]);
                v37 = (void *)v30;
                if (TUObjectsAreEqualOrNil(v30, v36)
                  && (id v31 = -[CSDConversationParticipant presentationMode](self, "presentationMode"),
                      v31 == [v4 presentationMode])
                  && (unsigned int v32 = -[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"),
                      v32 == [v4 isGuestModeEnabled])
                  && (unsigned int v33 = -[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"),
                      v33 == [v4 isSpatialPersonaEnabled])
                  && (id v34 = -[CSDConversationParticipant spatialPersonaGenerationCounter]( self,  "spatialPersonaGenerationCounter"),  v34 == [v4 spatialPersonaGenerationCounter]))
                {
                  unsigned int v35 = -[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen");
                  unsigned int v19 = v35 ^ [v4 isCameraMixedWithScreen] ^ 1;
                }

                else
                {
                  LOBYTE(v19) = 0;
                }
              }

              else
              {
                LOBYTE(v19) = 0;
              }

              v21 = v38;
            }

            else
            {
              LOBYTE(v19) = 0;
            }

            v22 = v39;
          }

          else
          {
            LOBYTE(v19) = 0;
          }
        }

        else
        {
          LOBYTE(v19) = 0;
        }
      }

      else
      {
        LOBYTE(v19) = 0;
      }
    }

    else
    {
      LOBYTE(v19) = 0;
    }
  }

  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSDConversationParticipant identifier](self, "identifier")));
  unint64_t v3 = (unint64_t)[v39 hash];
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](self, "handle"));
  unint64_t v4 = (unint64_t)[v38 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcData](self, "avcData"));
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];
  if (-[CSDConversationParticipant isMuted](self, "isMuted")) {
    uint64_t v7 = 1231LL;
  }
  else {
    uint64_t v7 = 1237LL;
  }
  unint64_t v8 = v6 ^ v7;
  if (-[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled")) {
    uint64_t v9 = 1231LL;
  }
  else {
    uint64_t v9 = 1237LL;
  }
  uint64_t v10 = v8 ^ v9;
  if (-[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled")) {
    uint64_t v11 = 1231LL;
  }
  else {
    uint64_t v11 = 1237LL;
  }
  uint64_t v12 = v10 ^ v11;
  if (-[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled")) {
    uint64_t v13 = 1231LL;
  }
  else {
    uint64_t v13 = 1237LL;
  }
  unint64_t v14 = v12 ^ v13 ^ v3;
  int64_t v15 = -[CSDConversationParticipant streamToken](self, "streamToken");
  unint64_t v16 = v15 ^ -[CSDConversationParticipant screenToken](self, "screenToken");
  unint64_t v17 = v16 ^ -[CSDConversationParticipant captionsToken](self, "captionsToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant avcIdentifier](self, "avcIdentifier"));
  unint64_t v19 = v17 ^ (unint64_t)[v18 hash];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant activeIDSDestination](self, "activeIDSDestination"));
  unint64_t v21 = v19 ^ (unint64_t)[v20 hash];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant capabilities](self, "capabilities"));
  unint64_t v23 = v21 ^ (unint64_t)[v22 hash];
  if (-[CSDConversationParticipant isAudioPaused](self, "isAudioPaused")) {
    uint64_t v24 = 1231LL;
  }
  else {
    uint64_t v24 = 1237LL;
  }
  unint64_t v25 = v23 ^ v24;
  if (-[CSDConversationParticipant isLightweight](self, "isLightweight")) {
    uint64_t v26 = 1231LL;
  }
  else {
    uint64_t v26 = 1237LL;
  }
  uint64_t v27 = v14 ^ v25 ^ v26;
  if (-[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle")) {
    uint64_t v28 = 1231LL;
  }
  else {
    uint64_t v28 = 1237LL;
  }
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant association](self, "association"));
  unint64_t v30 = v28 ^ (unint64_t)[v29 hash];
  if (-[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled")) {
    uint64_t v31 = 1231LL;
  }
  else {
    uint64_t v31 = 1237LL;
  }
  unint64_t v32 = v30 ^ v31;
  if (-[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled")) {
    uint64_t v33 = 1231LL;
  }
  else {
    uint64_t v33 = 1237LL;
  }
  uint64_t v34 = v32 ^ v33;
  if (-[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen")) {
    uint64_t v35 = 1231LL;
  }
  else {
    uint64_t v35 = 1237LL;
  }
  unint64_t v36 = v27 ^ v34 ^ v35 ^ -[CSDConversationParticipant presentationMode](self, "presentationMode");

  return v36;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSData)avcData
{
  return self->_avcData;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (TUConversationParticipantCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (unint64_t)audioVideoMode
{
  return self->_audioVideoMode;
}

- (void)setAudioVideoMode:(unint64_t)a3
{
  self->_audioVideoMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (unint64_t)spatialPersonaGenerationCounter
{
  return self->_spatialPersonaGenerationCounter;
}

- (void)setSpatialPersonaGenerationCounter:(unint64_t)a3
{
  self->_spatialPersonaGenerationCounter = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (BOOL)isLocalAccountHandle
{
  return self->_localAccountHandle;
}

- (void)setLocalAccountHandle:(BOOL)a3
{
  self->_localAccountHandle = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (int64_t)captionsToken
{
  return self->_captionsToken;
}

- (void)setCaptionsToken:(int64_t)a3
{
  self->_captionsToken = a3;
}

- (int64_t)audioPriority
{
  return self->_audioPriority;
}

- (void)setAudioPriority:(int64_t)a3
{
  self->_audioPriority = a3;
}

- (int64_t)videoPriority
{
  return self->_videoPriority;
}

- (void)setVideoPriority:(int64_t)a3
{
  self->_videoPriority = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
}

- (NSString)activeIDSDestination
{
  return self->_activeIDSDestination;
}

- (void)setActiveIDSDestination:(id)a3
{
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (BOOL)isPseudonym
{
  return self->_pseudonym;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (BOOL)isGuestModeEnabled
{
  return self->_guestModeEnabled;
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  self->_guestModeEnabled = a3;
}

- (void).cxx_destruct
{
}

@end