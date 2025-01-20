@interface IDSGroupStatusNotificationParameters
- (IDSGroupStatusNotificationParameters)init;
- (NSArray)publishedStreams;
- (NSData)clientJoinContextData;
- (NSData)clientLeaveContextData;
- (NSData)participantData;
- (NSData)participantInfo;
- (NSData)participantMirageHandshakeBlob;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)subscribedStreams;
- (NSDictionary)urisToParticipantIDs;
- (NSNumber)commandContext;
- (NSNumber)generationCounter;
- (NSNumber)isInitiator;
- (NSNumber)joinType;
- (NSNumber)maxConcurrentStreams;
- (NSNumber)participantID;
- (NSNumber)quickRelayUserType;
- (NSString)relaySessionID;
- (void)setClientJoinContextData:(id)a3;
- (void)setClientLeaveContextData:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setGenerationCounter:(id)a3;
- (void)setIsInitiator:(id)a3;
- (void)setJoinType:(id)a3;
- (void)setMaxConcurrentStreams:(id)a3;
- (void)setParticipantData:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setParticipantInfo:(id)a3;
- (void)setParticipantMirageHandshakeBlob:(id)a3;
- (void)setPublishedStreams:(id)a3;
- (void)setQuickRelayUserType:(id)a3;
- (void)setRelaySessionID:(id)a3;
- (void)setSubscribedStreams:(id)a3;
- (void)setUrisToParticipantIDs:(id)a3;
@end

@implementation IDSGroupStatusNotificationParameters

- (IDSGroupStatusNotificationParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSGroupStatusNotificationParameters;
  return -[IDSGroupStatusNotificationParameters init](&v3, "init");
}

- (NSNumber)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(id)a3
{
}

- (NSNumber)quickRelayUserType
{
  return self->_quickRelayUserType;
}

- (void)setQuickRelayUserType:(id)a3
{
}

- (NSNumber)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(id)a3
{
}

- (NSNumber)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
}

- (NSNumber)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSData)participantData
{
  return self->_participantData;
}

- (void)setParticipantData:(id)a3
{
}

- (NSData)participantInfo
{
  return self->_participantInfo;
}

- (void)setParticipantInfo:(id)a3
{
}

- (NSArray)publishedStreams
{
  return self->_publishedStreams;
}

- (void)setPublishedStreams:(id)a3
{
}

- (NSDictionary)subscribedStreams
{
  return self->_subscribedStreams;
}

- (void)setSubscribedStreams:(id)a3
{
}

- (NSNumber)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (void)setMaxConcurrentStreams:(id)a3
{
}

- (NSNumber)generationCounter
{
  return self->_generationCounter;
}

- (void)setGenerationCounter:(id)a3
{
}

- (NSDictionary)urisToParticipantIDs
{
  return self->_urisToParticipantIDs;
}

- (void)setUrisToParticipantIDs:(id)a3
{
}

- (NSData)clientJoinContextData
{
  return self->_clientJoinContextData;
}

- (void)setClientJoinContextData:(id)a3
{
}

- (NSData)clientLeaveContextData
{
  return self->_clientLeaveContextData;
}

- (void)setClientLeaveContextData:(id)a3
{
}

- (NSString)relaySessionID
{
  return self->_relaySessionID;
}

- (void)setRelaySessionID:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (NSData)participantMirageHandshakeBlob
{
  return self->_participantMirageHandshakeBlob;
}

- (void)setParticipantMirageHandshakeBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end