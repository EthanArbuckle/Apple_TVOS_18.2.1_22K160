@interface CSDMessagingCall
+ (Class)remoteParticipantHandlesType;
- (BOOL)hasCallerNameFromNetwork;
- (BOOL)hasDestinationID;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHandle;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasLocalSenderIdentityAccountUUIDString;
- (BOOL)hasLocalSenderIdentityUUIDString;
- (BOOL)hasProtoCallModel;
- (BOOL)hasProtoConferenced;
- (BOOL)hasProtoDisconnectedReason;
- (BOOL)hasProtoEmergency;
- (BOOL)hasProtoFailureExpected;
- (BOOL)hasProtoHasSentInvitation;
- (BOOL)hasProtoNeedsManualInCallSounds;
- (BOOL)hasProtoOriginatingUIType;
- (BOOL)hasProtoOutgoing;
- (BOOL)hasProtoProvider;
- (BOOL)hasProtoSOS;
- (BOOL)hasProtoService;
- (BOOL)hasProtoShouldSuppressRingtone;
- (BOOL)hasProtoSoundRegion;
- (BOOL)hasProtoStatus;
- (BOOL)hasProtoSupportsDTMFUpdates;
- (BOOL)hasProtoSupportsEmergencyFallback;
- (BOOL)hasProtoSupportsTTYWithVoice;
- (BOOL)hasProtoTTYType;
- (BOOL)hasProtoTimeConnected;
- (BOOL)hasProtoUplinkMuted;
- (BOOL)hasProtoVideo;
- (BOOL)hasProtoVoicemail;
- (BOOL)hasProtoWantsHoldMusic;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasUniqueProxyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCall:(id)a3;
- (BOOL)isVideo;
- (BOOL)protoConferenced;
- (BOOL)protoEmergency;
- (BOOL)protoFailureExpected;
- (BOOL)protoHasSentInvitation;
- (BOOL)protoNeedsManualInCallSounds;
- (BOOL)protoOutgoing;
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
- (CSDMessagingCall)initWithCall:(id)a3;
- (CSDMessagingCallModel)protoCallModel;
- (CSDMessagingCallProvider)protoProvider;
- (CSDMessagingHandle)handle;
- (NSDate)dateConnected;
- (NSMutableArray)remoteParticipantHandles;
- (NSSet)remoteParticipantTUHandles;
- (NSString)callerNameFromNetwork;
- (NSString)destinationID;
- (NSString)groupUUIDString;
- (NSString)isoCountryCode;
- (NSString)localSenderIdentityAccountUUIDString;
- (NSString)localSenderIdentityUUIDString;
- (NSString)sourceIdentifier;
- (NSString)uniqueProxyIdentifier;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallModel)callModel;
- (TUCallProvider)tuProvider;
- (TUHandle)tuHandle;
- (double)protoTimeConnected;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3;
- (int64_t)soundRegion;
- (unint64_t)hash;
- (unint64_t)remoteParticipantHandlesCount;
- (unsigned)protoDisconnectedReason;
- (unsigned)protoOriginatingUIType;
- (unsigned)protoService;
- (unsigned)protoSoundRegion;
- (unsigned)protoStatus;
- (unsigned)protoTTYType;
- (void)addRemoteParticipantHandles:(id)a3;
- (void)clearRemoteParticipantHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallModel:(id)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setConferenced:(BOOL)a3;
- (void)setDateConnected:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasProtoConferenced:(BOOL)a3;
- (void)setHasProtoDisconnectedReason:(BOOL)a3;
- (void)setHasProtoEmergency:(BOOL)a3;
- (void)setHasProtoFailureExpected:(BOOL)a3;
- (void)setHasProtoHasSentInvitation:(BOOL)a3;
- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setHasProtoOriginatingUIType:(BOOL)a3;
- (void)setHasProtoOutgoing:(BOOL)a3;
- (void)setHasProtoSOS:(BOOL)a3;
- (void)setHasProtoService:(BOOL)a3;
- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setHasProtoSoundRegion:(BOOL)a3;
- (void)setHasProtoStatus:(BOOL)a3;
- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setHasProtoTTYType:(BOOL)a3;
- (void)setHasProtoTimeConnected:(BOOL)a3;
- (void)setHasProtoUplinkMuted:(BOOL)a3;
- (void)setHasProtoVideo:(BOOL)a3;
- (void)setHasProtoVoicemail:(BOOL)a3;
- (void)setHasProtoWantsHoldMusic:(BOOL)a3;
- (void)setHasSentInvitation:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityAccountUUIDString:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalSenderIdentityUUIDString:(id)a3;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProtoCallModel:(id)a3;
- (void)setProtoConferenced:(BOOL)a3;
- (void)setProtoDisconnectedReason:(unsigned int)a3;
- (void)setProtoEmergency:(BOOL)a3;
- (void)setProtoFailureExpected:(BOOL)a3;
- (void)setProtoHasSentInvitation:(BOOL)a3;
- (void)setProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setProtoOriginatingUIType:(unsigned int)a3;
- (void)setProtoOutgoing:(BOOL)a3;
- (void)setProtoProvider:(id)a3;
- (void)setProtoSOS:(BOOL)a3;
- (void)setProtoService:(unsigned int)a3;
- (void)setProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setProtoSoundRegion:(unsigned int)a3;
- (void)setProtoStatus:(unsigned int)a3;
- (void)setProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setProtoTTYType:(unsigned int)a3;
- (void)setProtoTimeConnected:(double)a3;
- (void)setProtoUplinkMuted:(BOOL)a3;
- (void)setProtoVideo:(BOOL)a3;
- (void)setProtoVoicemail:(BOOL)a3;
- (void)setProtoWantsHoldMusic:(BOOL)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteParticipantTUHandles:(id)a3;
- (void)setSOS:(BOOL)a3;
- (void)setService:(int)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setTtyType:(int)a3;
- (void)setTuHandle:(id)a3;
- (void)setTuProvider:(id)a3;
- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)updateRelayCall:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCall

- (BOOL)hasUniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier != 0LL;
}

- (void)setProtoStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_protoStatus = a3;
}

- (void)setHasProtoStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProtoStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setProtoConferenced:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_protoConferenced = a3;
}

- (void)setHasProtoConferenced:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProtoConferenced
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasDestinationID
{
  return self->_destinationID != 0LL;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0LL;
}

- (void)setProtoService:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_protoService = a3;
}

- (void)setHasProtoService:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProtoService
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setProtoWantsHoldMusic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_protoWantsHoldMusic = a3;
}

- (void)setHasProtoWantsHoldMusic:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasProtoWantsHoldMusic
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setProtoDisconnectedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_protoDisconnectedReason = a3;
}

- (void)setHasProtoDisconnectedReason:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasProtoDisconnectedReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setProtoVoicemail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_protoVoicemail = a3;
}

- (void)setHasProtoVoicemail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasProtoVoicemail
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCallerNameFromNetwork
{
  return self->_callerNameFromNetwork != 0LL;
}

- (void)setProtoTimeConnected:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_protoTimeConnected = a3;
}

- (void)setHasProtoTimeConnected:(BOOL)a3
{
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasProtoTimeConnected
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setProtoOutgoing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_protoOutgoing = a3;
}

- (void)setHasProtoOutgoing:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasProtoOutgoing
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setProtoShouldSuppressRingtone:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_protoShouldSuppressRingtone = a3;
}

- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProtoShouldSuppressRingtone
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setProtoNeedsManualInCallSounds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_protoNeedsManualInCallSounds = a3;
}

- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProtoNeedsManualInCallSounds
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProtoSoundRegion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_protoSoundRegion = a3;
}

- (void)setHasProtoSoundRegion:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProtoSoundRegion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setProtoEmergency:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_protoEmergency = a3;
}

- (void)setHasProtoEmergency:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProtoEmergency
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setProtoHasSentInvitation:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_protoHasSentInvitation = a3;
}

- (void)setHasProtoHasSentInvitation:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasProtoHasSentInvitation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (void)setProtoSOS:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_protoSOS = a3;
}

- (void)setHasProtoSOS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasProtoSOS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasProtoProvider
{
  return self->_protoProvider != 0LL;
}

- (void)setProtoVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_protoVideo = a3;
}

- (void)setHasProtoVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProtoVideo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setProtoUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_protoUplinkMuted = a3;
}

- (void)setHasProtoUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasProtoUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasProtoCallModel
{
  return self->_protoCallModel != 0LL;
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
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_remoteParticipantHandles;
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
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protoTTYType = a3;
}

- (void)setHasProtoTTYType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtoTTYType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setProtoSupportsTTYWithVoice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_protoSupportsTTYWithVoice = a3;
}

- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasProtoSupportsTTYWithVoice
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0LL;
}

- (void)setProtoOriginatingUIType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_protoOriginatingUIType = a3;
}

- (void)setHasProtoOriginatingUIType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasProtoOriginatingUIType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setProtoFailureExpected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_protoFailureExpected = a3;
}

- (void)setHasProtoFailureExpected:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProtoFailureExpected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProtoSupportsEmergencyFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_protoSupportsEmergencyFallback = a3;
}

- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasProtoSupportsEmergencyFallback
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0LL;
}

- (void)setProtoSupportsDTMFUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_protoSupportsDTMFUpdates = a3;
}

- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProtoSupportsDTMFUpdates
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingCall;
  id v3 = -[CSDMessagingCall description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    [v3 setObject:uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_protoStatus));
    [v4 setObject:v7 forKey:@"protoStatus"];

    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoConferenced));
    [v4 setObject:v8 forKey:@"protoConferenced"];
  }

  destinationID = self->_destinationID;
  if (destinationID) {
    [v4 setObject:destinationID forKey:@"destinationID"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v4 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_protoService));
    [v4 setObject:v45 forKey:@"protoService"];

    $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v11 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_68;
    }
  }

  else if ((*(_DWORD *)&v11 & 0x200000) == 0)
  {
    goto LABEL_13;
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_protoWantsHoldMusic));
  [v4 setObject:v46 forKey:@"protoWantsHoldMusic"];

  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  if ((*(_BYTE *)&v11 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v11 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100095E84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    PBDataWriterWriteStringField(v4, uniqueProxyIdentifier, 1LL);
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_protoStatus, 2LL);
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }

  if ((*(_BYTE *)&has & 0x80) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_protoConferenced, 3LL);
  }
  destinationID = self->_destinationID;
  if (destinationID) {
    PBDataWriterWriteStringField(v5, destinationID, 4LL);
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    PBDataWriterWriteStringField(v5, sourceIdentifier, 5LL);
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_protoService, 6LL);
    $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v10 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_66;
    }
  }

  else if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
    goto LABEL_13;
  }

  PBDataWriterWriteBOOLField(v5, self->_protoWantsHoldMusic, 7LL);
  $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_uniqueProxyIdentifier)
  {
    objc_msgSend(v4, "setUniqueProxyIdentifier:");
    id v4 = v16;
  }

  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_protoStatus;
    *((_DWORD *)v4 + 38) |= 0x20u;
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_BYTE *)v4 + 136) = self->_protoConferenced;
    *((_DWORD *)v4 + 38) |= 0x80u;
  }

  if (self->_destinationID)
  {
    objc_msgSend(v16, "setDestinationID:");
    id v4 = v16;
  }

  if (self->_sourceIdentifier)
  {
    objc_msgSend(v16, "setSourceIdentifier:");
    id v4 = v16;
  }

  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_protoService;
    *((_DWORD *)v4 + 38) |= 8u;
    $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v6 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_63;
    }
  }

  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_13;
  }

  *((_BYTE *)v4 + 150) = self->_protoWantsHoldMusic;
  *((_DWORD *)v4 + 38) |= 0x200000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_uniqueProxyIdentifier, "copyWithZone:", a3);
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = (void *)v5[16];
  v5[16] = v6;

  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_protoStatus;
    *((_DWORD *)v5 + 38) |= 0x20u;
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_BYTE *)v5 + 136) = self->_protoConferenced;
    *((_DWORD *)v5 + 38) |= 0x80u;
  }

  id v9 = -[NSString copyWithZone:](self->_destinationID, "copyWithZone:", a3);
  unint64_t v10 = (void *)v5[3];
  v5[3] = v9;

  id v11 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  $FE257B6BB2BF625D40F79B47F1EB918B v12 = (void *)v5[15];
  v5[15] = v11;

  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_protoService;
    *((_DWORD *)v5 + 38) |= 8u;
    $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&v13 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_44;
    }
  }

  else if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
    goto LABEL_7;
  }

  *((_BYTE *)v5 + 150) = self->_protoWantsHoldMusic;
  *((_DWORD *)v5 + 38) |= 0x200000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&v13 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if ((unint64_t)uniqueProxyIdentifier | *((void *)v4 + 16))
  {
  }

  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  int v8 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_protoStatus != *((_DWORD *)v4 + 26)) {
      goto LABEL_181;
    }
  }

  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_181;
    }
    if (self->_protoConferenced)
    {
      if (!*((_BYTE *)v4 + 136)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_181;
    }
  }

  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_181;
  }

  destinationID = self->_destinationID;
  if ((unint64_t)destinationID | *((void *)v4 + 3)
    && !-[NSString isEqual:](destinationID, "isEqual:"))
  {
    goto LABEL_181;
  }

  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 15))
  {
  }

  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_protoService != *((_DWORD *)v4 + 24)) {
      goto LABEL_181;
    }
  }

  else if ((v12 & 8) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoWantsHoldMusic)
    {
      if (!*((_BYTE *)v4 + 150)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 150))
    {
      goto LABEL_181;
    }
  }

  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_protoDisconnectedReason != *((_DWORD *)v4 + 20)) {
      goto LABEL_181;
    }
  }

  else if ((v12 & 2) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v12 & 0x100000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoVoicemail)
    {
      if (!*((_BYTE *)v4 + 149)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 149))
    {
      goto LABEL_181;
    }
  }

  else if ((v12 & 0x100000) != 0)
  {
    goto LABEL_181;
  }

  callerNameFromNetwork = self->_callerNameFromNetwork;
  if ((unint64_t)callerNameFromNetwork | *((void *)v4 + 2))
  {
    $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  }

  int v14 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&v11 & 1) != 0)
  {
  }

  else if ((v14 & 1) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoOutgoing)
    {
      if (!*((_BYTE *)v4 + 141)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 141))
    {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoShouldSuppressRingtone)
    {
      if (!*((_BYTE *)v4 + 143)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 143))
    {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v14 & 0x800) == 0) {
      goto LABEL_181;
    }
    if (self->_protoNeedsManualInCallSounds)
    {
      if (!*((_BYTE *)v4 + 140)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x800) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_protoSoundRegion != *((_DWORD *)v4 + 25)) {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0) {
      goto LABEL_181;
    }
    if (self->_protoEmergency)
    {
      if (!*((_BYTE *)v4 + 137)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0) {
      goto LABEL_181;
    }
    if (self->_protoHasSentInvitation)
    {
      if (!*((_BYTE *)v4 + 139)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 139))
    {
      goto LABEL_181;
    }
  }

  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_181;
  }

  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  }

  int v16 = *((_DWORD *)v4 + 38);
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSOS)
    {
      if (!*((_BYTE *)v4 + 142)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 142))
    {
      goto LABEL_181;
    }
  }

  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_181;
  }

  protoProvider = self->_protoProvider;
  if ((unint64_t)protoProvider | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingCallProvider isEqual:](protoProvider, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  }

  int v18 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    if ((v18 & 0x80000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoVideo)
    {
      if (!*((_BYTE *)v4 + 148)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 148))
    {
      goto LABEL_181;
    }
  }

  else if ((v18 & 0x80000) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    if ((v18 & 0x40000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoUplinkMuted)
    {
      if (!*((_BYTE *)v4 + 147)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 147))
    {
      goto LABEL_181;
    }
  }

  else if ((v18 & 0x40000) != 0)
  {
    goto LABEL_181;
  }

  protoCallModel = self->_protoCallModel;
  if ((unint64_t)protoCallModel | *((void *)v4 + 9)
    && !-[CSDMessagingCallModel isEqual:](protoCallModel, "isEqual:"))
  {
    goto LABEL_181;
  }

  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if ((unint64_t)localSenderIdentityUUIDString | *((void *)v4 + 8))
  {
  }

  remoteParticipantHandles = self->_remoteParticipantHandles;
  if ((unint64_t)remoteParticipantHandles | *((void *)v4 + 14))
  {
  }

  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if ((unint64_t)localSenderIdentityAccountUUIDString | *((void *)v4 + 7))
  {
  }

  $FE257B6BB2BF625D40F79B47F1EB918B v23 = self->_has;
  int v24 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_protoTTYType != *((_DWORD *)v4 + 27)) {
      goto LABEL_181;
    }
  }

  else if ((v24 & 0x40) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_DWORD *)&v23 & 0x20000) != 0)
  {
    if ((v24 & 0x20000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSupportsTTYWithVoice)
    {
      if (!*((_BYTE *)v4 + 146)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_181;
    }
  }

  else if ((v24 & 0x20000) != 0)
  {
    goto LABEL_181;
  }

  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 6))
  {
    $FE257B6BB2BF625D40F79B47F1EB918B v23 = self->_has;
  }

  int v26 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&v23 & 4) != 0)
  {
    if ((v26 & 4) == 0 || self->_protoOriginatingUIType != *((_DWORD *)v4 + 21)) {
      goto LABEL_181;
    }
  }

  else if ((v26 & 4) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
    if ((v26 & 0x200) == 0) {
      goto LABEL_181;
    }
    if (self->_protoFailureExpected)
    {
      if (!*((_BYTE *)v4 + 138)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 138))
    {
      goto LABEL_181;
    }
  }

  else if ((v26 & 0x200) != 0)
  {
    goto LABEL_181;
  }

  if ((*(_DWORD *)&v23 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSupportsEmergencyFallback)
    {
      if (!*((_BYTE *)v4 + 145)) {
        goto LABEL_181;
      }
    }

    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_181;
    }
  }

  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_181;
  }

  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 4))
  {
    $FE257B6BB2BF625D40F79B47F1EB918B v23 = self->_has;
  }

  if ((*(_WORD *)&v23 & 0x8000) != 0)
  {
    if ((*((_DWORD *)v4 + 38) & 0x8000) != 0)
    {
      if (self->_protoSupportsDTMFUpdates)
      {
        if (!*((_BYTE *)v4 + 144)) {
          goto LABEL_181;
        }
      }

      else if (*((_BYTE *)v4 + 144))
      {
        goto LABEL_181;
      }

      BOOL v28 = 1;
      goto LABEL_182;
    }

- (unint64_t)hash
{
  NSUInteger v48 = -[NSString hash](self->_uniqueProxyIdentifier, "hash");
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    uint64_t v47 = 2654435761LL * self->_protoStatus;
    if ((*(_BYTE *)&has & 0x80) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v47 = 0LL;
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v46 = 2654435761LL * self->_protoConferenced;
      goto LABEL_6;
    }
  }

  uint64_t v46 = 0LL;
LABEL_6:
  NSUInteger v45 = -[NSString hash](self->_destinationID, "hash");
  NSUInteger v44 = -[NSString hash](self->_sourceIdentifier, "hash");
  $FE257B6BB2BF625D40F79B47F1EB918B v4 = self->_has;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
    uint64_t v43 = 2654435761LL * self->_protoService;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
    {
LABEL_8:
      uint64_t v42 = 2654435761LL * self->_protoWantsHoldMusic;
      if ((*(_BYTE *)&v4 & 2) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v41 = 0LL;
      if ((*(_DWORD *)&v4 & 0x100000) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v43 = 0LL;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v42 = 0LL;
  if ((*(_BYTE *)&v4 & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v41 = 2654435761LL * self->_protoDisconnectedReason;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_10:
    uint64_t v40 = 2654435761LL * self->_protoVoicemail;
    goto LABEL_15;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 16)) {
    -[CSDMessagingCall setUniqueProxyIdentifier:](self, "setUniqueProxyIdentifier:");
  }
  int v5 = *((_DWORD *)v4 + 38);
  if ((v5 & 0x20) != 0)
  {
    self->_protoStatus = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x20u;
    int v5 = *((_DWORD *)v4 + 38);
  }

  if ((v5 & 0x80) != 0)
  {
    self->_protoConferenced = *((_BYTE *)v4 + 136);
    *(_DWORD *)&self->_has |= 0x80u;
  }

  if (*((void *)v4 + 3)) {
    -[CSDMessagingCall setDestinationID:](self, "setDestinationID:");
  }
  if (*((void *)v4 + 15)) {
    -[CSDMessagingCall setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  int v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 8) != 0)
  {
    self->_protoService = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 8u;
    int v6 = *((_DWORD *)v4 + 38);
    if ((v6 & 0x200000) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_31;
    }
  }

  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_13;
  }

  self->_protoWantsHoldMusic = *((_BYTE *)v4 + 150);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (unsigned)protoStatus
{
  return self->_protoStatus;
}

- (BOOL)protoConferenced
{
  return self->_protoConferenced;
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

- (unsigned)protoService
{
  return self->_protoService;
}

- (BOOL)protoWantsHoldMusic
{
  return self->_protoWantsHoldMusic;
}

- (unsigned)protoDisconnectedReason
{
  return self->_protoDisconnectedReason;
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

- (double)protoTimeConnected
{
  return self->_protoTimeConnected;
}

- (BOOL)protoOutgoing
{
  return self->_protoOutgoing;
}

- (BOOL)protoShouldSuppressRingtone
{
  return self->_protoShouldSuppressRingtone;
}

- (BOOL)protoNeedsManualInCallSounds
{
  return self->_protoNeedsManualInCallSounds;
}

- (unsigned)protoSoundRegion
{
  return self->_protoSoundRegion;
}

- (BOOL)protoEmergency
{
  return self->_protoEmergency;
}

- (BOOL)protoHasSentInvitation
{
  return self->_protoHasSentInvitation;
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

- (CSDMessagingCallModel)protoCallModel
{
  return self->_protoCallModel;
}

- (void)setProtoCallModel:(id)a3
{
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

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
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

- (BOOL)protoSupportsDTMFUpdates
{
  return self->_protoSupportsDTMFUpdates;
}

- (void).cxx_destruct
{
}

- (CSDMessagingCall)initWithCall:(id)a3
{
  id v4 = a3;
  int v5 = -[CSDMessagingCall init](self, "init");
  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    -[CSDMessagingCall setUniqueProxyIdentifier:](v5, "setUniqueProxyIdentifier:", v6);

    -[CSDMessagingCall setStatus:](v5, "setStatus:", [v4 status]);
    -[CSDMessagingCall setConferenced:](v5, "setConferenced:", [v4 isConferenced]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    -[CSDMessagingCall setTuHandle:](v5, "setTuHandle:", v7);

    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);
    -[CSDMessagingCall setSourceIdentifier:](v5, "setSourceIdentifier:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    -[CSDMessagingCall setTuProvider:](v5, "setTuProvider:", v9);

    -[CSDMessagingCall setVideo:](v5, "setVideo:", [v4 isVideo]);
    -[CSDMessagingCall setDisconnectedReason:](v5, "setDisconnectedReason:", [v4 disconnectedReason]);
    -[CSDMessagingCall setWantsHoldMusic:](v5, "setWantsHoldMusic:", [v4 wantsHoldMusic]);
    -[CSDMessagingCall setVoicemail:](v5, "setVoicemail:", [v4 isVoicemail]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 callerNameFromNetwork]);
    -[CSDMessagingCall setCallerNameFromNetwork:](v5, "setCallerNameFromNetwork:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dateConnected]);
    -[CSDMessagingCall setDateConnected:](v5, "setDateConnected:", v11);

    -[CSDMessagingCall setOutgoing:](v5, "setOutgoing:", [v4 isOutgoing]);
    -[CSDMessagingCall setShouldSuppressRingtone:]( v5,  "setShouldSuppressRingtone:",  [v4 shouldSuppressRingtone]);
    -[CSDMessagingCall setNeedsManualInCallSounds:]( v5,  "setNeedsManualInCallSounds:",  [v4 needsManualInCallSounds]);
    -[CSDMessagingCall setSoundRegion:](v5, "setSoundRegion:", [v4 soundRegion]);
    -[CSDMessagingCall setEmergency:](v5, "setEmergency:", [v4 isEmergency]);
    -[CSDMessagingCall setFailureExpected:](v5, "setFailureExpected:", [v4 isFailureExpected]);
    -[CSDMessagingCall setSupportsEmergencyFallback:]( v5,  "setSupportsEmergencyFallback:",  [v4 supportsEmergencyFallback]);
    -[CSDMessagingCall setSOS:](v5, "setSOS:", [v4 isSOS]);
    -[CSDMessagingCall setSupportsDTMFUpdates:](v5, "setSupportsDTMFUpdates:", [v4 supportsDTMFUpdates]);
    -[CSDMessagingCall setHasSentInvitation:](v5, "setHasSentInvitation:", [v4 hasSentInvitation]);
    else {
      id v12 = [v4 isUplinkMuted];
    }
    -[CSDMessagingCall setUplinkMuted:](v5, "setUplinkMuted:", v12);
    $FE257B6BB2BF625D40F79B47F1EB918B v13 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    -[CSDMessagingCall setCallModel:](v5, "setCallModel:", v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    -[CSDMessagingCall setLocalSenderIdentityUUID:](v5, "setLocalSenderIdentityUUID:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityAccountUUID]);
    -[CSDMessagingCall setLocalSenderIdentityAccountUUID:](v5, "setLocalSenderIdentityAccountUUID:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteParticipantHandles]);
    -[CSDMessagingCall setRemoteParticipantTUHandles:](v5, "setRemoteParticipantTUHandles:", v16);

    -[CSDMessagingCall setTtyType:](v5, "setTtyType:", [v4 ttyType]);
    -[CSDMessagingCall setSupportsTTYWithVoice:]( v5,  "setSupportsTTYWithVoice:",  [v4 supportsTTYWithVoice]);
    -[CSDMessagingCall setOriginatingUIType:](v5, "setOriginatingUIType:", [v4 originatingUIType]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    -[CSDMessagingCall setGroupUUIDString:](v5, "setGroupUUIDString:", v18);
  }

  return v5;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCall protoStatus](self, "protoStatus")) {
    -[CSDMessagingCall setProtoStatus:](self, "setProtoStatus:", v3);
  }
}

- (void)setConferenced:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoConferenced](self, "protoConferenced")) {
    -[CSDMessagingCall setProtoConferenced:](self, "setProtoConferenced:", v3);
  }
}

- (void)setService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCall protoService](self, "protoService")) {
    -[CSDMessagingCall setProtoService:](self, "setProtoService:", v3);
  }
}

- (void)setDisconnectedReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCall protoDisconnectedReason](self, "protoDisconnectedReason")) {
    -[CSDMessagingCall setProtoDisconnectedReason:](self, "setProtoDisconnectedReason:", v3);
  }
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoWantsHoldMusic](self, "protoWantsHoldMusic")) {
    -[CSDMessagingCall setProtoWantsHoldMusic:](self, "setProtoWantsHoldMusic:", v3);
  }
}

- (void)setVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoVoicemail](self, "protoVoicemail")) {
    -[CSDMessagingCall setProtoVoicemail:](self, "setProtoVoicemail:", v3);
  }
}

- (void)setOutgoing:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoOutgoing](self, "protoOutgoing")) {
    -[CSDMessagingCall setProtoOutgoing:](self, "setProtoOutgoing:", v3);
  }
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoShouldSuppressRingtone](self, "protoShouldSuppressRingtone")) {
    -[CSDMessagingCall setProtoShouldSuppressRingtone:](self, "setProtoShouldSuppressRingtone:", v3);
  }
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoNeedsManualInCallSounds](self, "protoNeedsManualInCallSounds")) {
    -[CSDMessagingCall setProtoNeedsManualInCallSounds:](self, "setProtoNeedsManualInCallSounds:", v3);
  }
}

- (void)setEmergency:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoEmergency](self, "protoEmergency")) {
    -[CSDMessagingCall setProtoEmergency:](self, "setProtoEmergency:", v3);
  }
}

- (void)setFailureExpected:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoFailureExpected](self, "protoFailureExpected")) {
    -[CSDMessagingCall setProtoFailureExpected:](self, "setProtoFailureExpected:", v3);
  }
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoSupportsEmergencyFallback](self, "protoSupportsEmergencyFallback")) {
    -[CSDMessagingCall setProtoSupportsEmergencyFallback:](self, "setProtoSupportsEmergencyFallback:", v3);
  }
}

- (void)setSOS:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoSOS](self, "protoSOS")) {
    -[CSDMessagingCall setProtoSOS:](self, "setProtoSOS:", v3);
  }
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoSupportsDTMFUpdates](self, "protoSupportsDTMFUpdates")) {
    -[CSDMessagingCall setProtoSupportsDTMFUpdates:](self, "setProtoSupportsDTMFUpdates:", v3);
  }
}

- (void)setHasSentInvitation:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoHasSentInvitation](self, "protoHasSentInvitation")) {
    -[CSDMessagingCall setProtoHasSentInvitation:](self, "setProtoHasSentInvitation:", v3);
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoUplinkMuted](self, "protoUplinkMuted")) {
    -[CSDMessagingCall setProtoUplinkMuted:](self, "setProtoUplinkMuted:", v3);
  }
}

- (void)setTtyType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCall protoTTYType](self, "protoTTYType")) {
    -[CSDMessagingCall setProtoTTYType:](self, "setProtoTTYType:", v3);
  }
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[CSDMessagingCall protoSupportsTTYWithVoice](self, "protoSupportsTTYWithVoice")) {
    -[CSDMessagingCall setProtoSupportsTTYWithVoice:](self, "setProtoSupportsTTYWithVoice:", v3);
  }
}

- (void)setOriginatingUIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || -[CSDMessagingCall protoOriginatingUIType](self, "protoOriginatingUIType")) {
    -[CSDMessagingCall setProtoOriginatingUIType:](self, "setProtoOriginatingUIType:", v3);
  }
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

- (void)updateRelayCall:(id)a3
{
  id v18 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuProvider](self, "tuProvider"));

  if (v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuProvider](self, "tuProvider"));
    [v18 setProvider:v5];
  }

  objc_msgSend(v18, "setCallStatus:", -[CSDMessagingCall status](self, "status"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall handle](self, "handle"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tuHandle]);
  [v18 setHandle:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall isoCountryCode](self, "isoCountryCode"));
  [v18 setIsoCountryCode:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall sourceIdentifier](self, "sourceIdentifier"));
  [v18 setSourceIdentifier:v9];

  objc_msgSend(v18, "setDisconnectedReason:", -[CSDMessagingCall disconnectedReason](self, "disconnectedReason"));
  objc_msgSend(v18, "setWantsHoldMusic:", -[CSDMessagingCall wantsHoldMusic](self, "wantsHoldMusic"));
  objc_msgSend(v18, "setVoicemail:", -[CSDMessagingCall isVoicemail](self, "isVoicemail"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall callerNameFromNetwork](self, "callerNameFromNetwork"));
  [v18 setCallerNameFromNetwork:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall dateConnected](self, "dateConnected"));
  [v18 setDateConnected:v11];

  objc_msgSend(v18, "setOutgoing:", -[CSDMessagingCall isOutgoing](self, "isOutgoing"));
  objc_msgSend(v18, "setVideo:", -[CSDMessagingCall isVideo](self, "isVideo"));
  objc_msgSend( v18,  "setShouldSuppressRingtone:",  -[CSDMessagingCall shouldSuppressRingtone](self, "shouldSuppressRingtone"));
  objc_msgSend( v18,  "setNeedsManualInCallSounds:",  -[CSDMessagingCall needsManualInCallSounds](self, "needsManualInCallSounds"));
  objc_msgSend(v18, "setSoundRegion:", -[CSDMessagingCall soundRegion](self, "soundRegion"));
  objc_msgSend(v18, "setEmergency:", -[CSDMessagingCall isEmergency](self, "isEmergency"));
  objc_msgSend(v18, "setFailureExpected:", -[CSDMessagingCall isFailureExpected](self, "isFailureExpected"));
  objc_msgSend( v18,  "setSupportsEmergencyFallback:",  -[CSDMessagingCall supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  objc_msgSend(v18, "setSOS:", -[CSDMessagingCall isSOS](self, "isSOS"));
  objc_msgSend(v18, "setSupportsDTMFUpdates:", -[CSDMessagingCall supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  objc_msgSend(v18, "setUplinkMuted:", -[CSDMessagingCall isUplinkMuted](self, "isUplinkMuted"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall localSenderIdentityUUID](self, "localSenderIdentityUUID"));
  [v18 setLocalSenderIdentityUUID:v12];

  $FE257B6BB2BF625D40F79B47F1EB918B v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID"));
  [v18 setLocalSenderIdentityAccountUUID:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall remoteParticipantTUHandles](self, "remoteParticipantTUHandles"));
  [v18 setRemoteParticipantHandles:v14];

  objc_msgSend(v18, "setTtyType:", -[CSDMessagingCall ttyType](self, "ttyType"));
  objc_msgSend(v18, "setSupportsTTYWithVoice:", -[CSDMessagingCall supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  objc_msgSend(v18, "setOriginatingUIType:", -[CSDMessagingCall originatingUIType](self, "originatingUIType"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall callModel](self, "callModel"));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall callModel](self, "callModel"));
    [v18 setModel:v16];
  }

  if (-[CSDMessagingCall hasSentInvitation](self, "hasSentInvitation")) {
    [v18 setLocallyHasSentInvitation];
  }
  if (-[CSDMessagingCall isConferenced](self, "isConferenced"))
  {
    id v17 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
    [v18 setCallGroupUUID:v17];
  }

  else
  {
    [v18 setCallGroupUUID:0];
  }
}

- (BOOL)isEqualToCall:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier"));
  if (TUStringsAreEqualOrNil(v5, v6)
    && (unsigned int v7 = [v4 status], v7 == -[CSDMessagingCall status](self, "status"))
    && (unsigned int v8 = [v4 isConferenced],
        v8 == -[CSDMessagingCall isConferenced](self, "isConferenced")))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuHandle](self, "tuHandle"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    if (TUObjectsAreEqualOrNil(v11, v12))
    {
      $FE257B6BB2BF625D40F79B47F1EB918B v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall sourceIdentifier](self, "sourceIdentifier"));
      if (TUStringsAreEqualOrNil(v13, v14))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuProvider](self, "tuProvider"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
        if (TUObjectsAreEqualOrNil(v15, v16))
        {
          NSUInteger v45 = v15;
          unsigned int v17 = [v4 isVideo];
          if (v17 == -[CSDMessagingCall isVideo](self, "isVideo")
            && (unsigned int v18 = [v4 disconnectedReason],
                v18 == -[CSDMessagingCall disconnectedReason](self, "disconnectedReason"))
            && (unsigned int v19 = [v4 wantsHoldMusic],
                v19 == -[CSDMessagingCall wantsHoldMusic](self, "wantsHoldMusic"))
            && (unsigned int v20 = [v4 isVoicemail],
                v20 == -[CSDMessagingCall isVoicemail](self, "isVoicemail")))
          {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 callerNameFromNetwork]);
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall callerNameFromNetwork](self, "callerNameFromNetwork"));
            NSUInteger v44 = (void *)v21;
            int v22 = TUStringsAreEqualOrNil(v21, v43);
            id v15 = v45;
            if (v22)
            {
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 dateConnected]);
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall dateConnected](self, "dateConnected"));
              if (v42 == v23)
              {
                id v41 = v23;
                unsigned int v24 = [v4 isOutgoing];
                if (v24 != -[CSDMessagingCall isOutgoing](self, "isOutgoing")) {
                  goto LABEL_35;
                }
                unsigned int v25 = [v4 shouldSuppressRingtone];
                if (v25 != -[CSDMessagingCall shouldSuppressRingtone](self, "shouldSuppressRingtone")) {
                  goto LABEL_35;
                }
                unsigned int v26 = [v4 needsManualInCallSounds];
                if (v26 != -[CSDMessagingCall needsManualInCallSounds](self, "needsManualInCallSounds")) {
                  goto LABEL_35;
                }
                id v27 = [v4 soundRegion];
                if (v27 != (id)-[CSDMessagingCall soundRegion](self, "soundRegion")) {
                  goto LABEL_35;
                }
                unsigned int v28 = [v4 isEmergency];
                if (v28 == -[CSDMessagingCall isEmergency](self, "isEmergency")
                  && (unsigned int v29 = [v4 isFailureExpected],
                      v29 == -[CSDMessagingCall isFailureExpected](self, "isFailureExpected"))
                  && (unsigned int v30 = [v4 supportsEmergencyFallback],
                      v30 == -[CSDMessagingCall supportsEmergencyFallback](self, "supportsEmergencyFallback"))
                  && (unsigned int v31 = [v4 isSOS], v31 == -[CSDMessagingCall isSOS](self, "isSOS"))
                  && (unsigned int v32 = [v4 supportsDTMFUpdates],
                      v32 == -[CSDMessagingCall supportsDTMFUpdates](self, "supportsDTMFUpdates"))
                  && (unsigned int v33 = [v4 hasSentInvitation],
                      v33 == -[CSDMessagingCall hasSentInvitation](self, "hasSentInvitation"))
                  && (unsigned int v34 = [v4 isUplinkMuted],
                      v34 == -[CSDMessagingCall isUplinkMuted](self, "isUplinkMuted")))
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteParticipantHandles]);
                  NSUInteger v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall remoteParticipantTUHandles](self, "remoteParticipantTUHandles"));
                  uint64_t v40 = v35;
                  if (objc_msgSend(v35, "isEqualToSet:")
                    && (unsigned int v36 = [v4 ttyType],
                        v36 == -[CSDMessagingCall ttyType](self, "ttyType"))
                    && (unsigned int v37 = [v4 supportsTTYWithVoice],
                        v37 == -[CSDMessagingCall supportsTTYWithVoice](self, "supportsTTYWithVoice")))
                  {
                    unsigned int v38 = [v4 originatingUIType];
                    BOOL v9 = v38 == -[CSDMessagingCall originatingUIType](self, "originatingUIType");
                  }

                  else
                  {
                    BOOL v9 = 0;
                  }
                }

                else
                {
LABEL_35:
                  BOOL v9 = 0;
                }

                id v15 = v45;
                __int128 v23 = v41;
              }

              else
              {
                BOOL v9 = 0;
              }
            }

            else
            {
              BOOL v9 = 0;
            }
          }

          else
          {
            BOOL v9 = 0;
            id v15 = v45;
          }
        }

        else
        {
          BOOL v9 = 0;
        }
      }

      else
      {
        BOOL v9 = 0;
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (TUCallModel)callModel
{
  uint64_t v3 = (TUCallModel *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));

  if (v3)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TUCallModel);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsHolding:](v3, "setSupportsHolding:", [v4 supportsHolding]);

    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsGrouping:](v3, "setSupportsGrouping:", [v5 supportsGrouping]);

    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsUngrouping:](v3, "setSupportsUngrouping:", [v6 supportsUngrouping]);

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsUnambiguousMultiPartyState:]( v3,  "setSupportsUnambiguousMultiPartyState:",  [v7 supportsUnambiguousMultiPartyState]);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsAddCall:](v3, "setSupportsAddCall:", [v8 supportsAddCall]);

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsSendingToVoicemail:]( v3,  "setSupportsSendingToVoicemail:",  [v9 supportsSendingToVoicemail]);

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    -[TUCallModel setSupportsDTMF:](v3, "setSupportsDTMF:", [v10 supportsDTMF]);
  }

  return v3;
}

- (void)setCallModel:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingCallModel);
    -[CSDMessagingCall setProtoCallModel:](self, "setProtoCallModel:", v4);

    id v5 = [v19 supportsHolding];
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v6 setSupportsHolding:v5];

    id v7 = [v19 supportsGrouping];
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v8 setSupportsGrouping:v7];

    id v9 = [v19 supportsUngrouping];
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v10 setSupportsUngrouping:v9];

    id v11 = [v19 supportsUnambiguousMultiPartyState];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v12 setSupportsUnambiguousMultiPartyState:v11];

    id v13 = [v19 supportsAddCall];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v14 setSupportsAddCall:v13];

    id v15 = [v19 supportsSendingToVoicemail];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v16 setSupportsSendingToVoicemail:v15];

    id v17 = [v19 supportsDTMF];
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoCallModel](self, "protoCallModel"));
    [v18 setSupportsDTMF:v17];
  }

  else
  {
    -[CSDMessagingCall setProtoCallModel:](self, "setProtoCallModel:", 0LL);
  }
}

- (void)setTuHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  -[CSDMessagingCall setDestinationID:](self, "setDestinationID:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v4));
  -[CSDMessagingCall setHandle:](self, "setHandle:", v6);
}

- (TUHandle)tuHandle
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall handle](self, "handle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuHandle]);

  if (!v4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall destinationID](self, "destinationID"));

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall destinationID](self, "destinationID"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](&OBJC_CLASS___TUHandle, "handleWithDestinationID:", v5));
    }
  }

  return (TUHandle *)v4;
}

- (TUCallProvider)tuProvider
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall protoProvider](self, "protoProvider"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);

  if (!v4)
  {
    char v7 = 0;
    id v5 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TUCallProviderManager providerWithService:video:]( v5,  "providerWithService:video:",  -[CSDMessagingCall service](self, "service"),  &v7));
  }

  return (TUCallProvider *)v4;
}

- (void)setTuProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = -[CSDMessagingCallProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithProvider:",  v5);
    -[CSDMessagingCall setProtoProvider:](self, "setProtoProvider:", v4);
    -[CSDMessagingCall setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v5,  -[CSDMessagingCall isVideo](self, "isVideo")));
  }

  else
  {
    -[CSDMessagingCall setProtoProvider:](self, "setProtoProvider:", 0LL);
  }
}

- (BOOL)isVideo
{
  char v6 = 0;
  if (-[CSDMessagingCall hasProtoVideo](self, "hasProtoVideo")) {
    return -[CSDMessagingCall protoVideo](self, "protoVideo");
  }
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
  id v4 =  -[TUCallProviderManager providerWithService:video:]( v3,  "providerWithService:video:",  -[CSDMessagingCall service](self, "service"),  &v6);

  return v6 != 0;
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSDMessagingCall setProtoVideo:](self, "setProtoVideo:");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuProvider](self, "tuProvider"));
  -[CSDMessagingCall setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v5,  v3));
}

- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    char v6 = -[CSDMessagingCallProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithProvider:",  v8);
    -[CSDMessagingCall setProtoProvider:](self, "setProtoProvider:", v6);
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall tuProvider](self, "tuProvider"));
    -[CSDMessagingCall setService:]( self,  "setService:",  +[TUCallProviderManager serviceForProvider:video:]( &OBJC_CLASS___TUCallProviderManager,  "serviceForProvider:video:",  v7,  v4));
  }

  else
  {
    -[CSDMessagingCall setProtoProvider:](self, "setProtoProvider:", 0LL);
  }

  -[CSDMessagingCall setProtoVideo:](self, "setProtoVideo:", v4);
}

- (NSDate)dateConnected
{
  if (v3 <= 0.0)
  {
    BOOL v4 = 0LL;
  }

  else
  {
    -[CSDMessagingCall protoTimeConnected](self, "protoTimeConnected");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  return (NSDate *)v4;
}

- (void)setDateConnected:(id)a3
{
}

- (NSUUID)localSenderIdentityUUID
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall localSenderIdentityUUIDString](self, "localSenderIdentityUUIDString"));
  if (v3)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall localSenderIdentityUUIDString](self, "localSenderIdentityUUIDString"));
    char v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    char v6 = 0LL;
  }

  return v6;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[CSDMessagingCall setLocalSenderIdentityUUIDString:](self, "setLocalSenderIdentityUUIDString:", v4);
}

- (NSUUID)localSenderIdentityAccountUUID
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall localSenderIdentityAccountUUIDString](self, "localSenderIdentityAccountUUIDString"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingCall localSenderIdentityAccountUUIDString]( self,  "localSenderIdentityAccountUUIDString"));
    char v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    char v6 = 0LL;
  }

  return v6;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[CSDMessagingCall setLocalSenderIdentityAccountUUIDString:](self, "setLocalSenderIdentityAccountUUIDString:", v4);
}

- (NSSet)remoteParticipantTUHandles
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall remoteParticipantHandles](self, "remoteParticipantHandles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCall remoteParticipantHandles](self, "remoteParticipantHandles", 0LL));
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
        double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) tuHandle]);
        if (v10) {
          [v4 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
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
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8)));
        if (v9) {
          -[CSDMessagingCall addRemoteParticipantHandles:](self, "addRemoteParticipantHandles:", v9);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

@end