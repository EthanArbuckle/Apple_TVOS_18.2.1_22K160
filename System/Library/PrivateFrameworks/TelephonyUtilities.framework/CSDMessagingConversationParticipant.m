@interface CSDMessagingConversationParticipant
+ (id)participantWithCSDConversationJoinContext:(id)a3;
+ (id)participantWithCSDConversationParticipant:(id)a3;
+ (id)participantWithTUConversationParticipant:(id)a3;
- (BOOL)guestModeEnabled;
- (BOOL)hasAssociation;
- (BOOL)hasAvMode;
- (BOOL)hasAvcData;
- (BOOL)hasGuestModeEnabled;
- (BOOL)hasHandle;
- (BOOL)hasIdentifier;
- (BOOL)hasIsGFTDowngradeToOneToOneAvailable;
- (BOOL)hasIsGondolaCallingAvailable;
- (BOOL)hasIsLightweight;
- (BOOL)hasIsMomentsAvailable;
- (BOOL)hasIsPersonaAvailable;
- (BOOL)hasIsPhotosSharePlayAvailable;
- (BOOL)hasIsScreenSharingAvailable;
- (BOOL)hasIsSpatialPersonaEnabled;
- (BOOL)hasIsUPlusNDowngradeAvailable;
- (BOOL)hasIsUPlusOneAVLessAvailable;
- (BOOL)hasIsUPlusOneScreenSharingAvailable;
- (BOOL)hasIsUPlusOneVisionToVisionAvailable;
- (BOOL)hasOptions;
- (BOOL)hasPersonaHandshakeData;
- (BOOL)hasPresentationMode;
- (BOOL)hasSharePlayProtocolVersion;
- (BOOL)hasSpatialPersonaGenerationCounter;
- (BOOL)hasSupportsLeaveContext;
- (BOOL)hasSupportsRequestToScreenShare;
- (BOOL)hasVersion;
- (BOOL)hasVisionCallEstablishmentVersion;
- (BOOL)hasVisionFeatureVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isGondolaCallingAvailable;
- (BOOL)isLightweight;
- (BOOL)isMomentsAvailable;
- (BOOL)isPersonaAvailable;
- (BOOL)isPhotosSharePlayAvailable;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneAVLessAvailable;
- (BOOL)isUPlusOneScreenSharingAvailable;
- (BOOL)isUPlusOneVisionToVisionAvailable;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsLeaveContext;
- (BOOL)supportsRequestToScreenShare;
- (CSDConversationParticipant)csdConversationParticipant;
- (CSDMessagingConversationParticipantAssociation)association;
- (CSDMessagingHandle)handle;
- (NSData)avcData;
- (NSData)personaHandshakeData;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)presentationModeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsPresentationMode:(id)a3;
- (int)avMode;
- (int)presentationMode;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)resolvedPresentationMode;
- (unsigned)options;
- (unsigned)sharePlayProtocolVersion;
- (unsigned)spatialPersonaGenerationCounter;
- (unsigned)version;
- (unsigned)visionCallEstablishmentVersion;
- (unsigned)visionFeatureVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setAvcData:(id)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasGuestModeEnabled:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setHasIsGondolaCallingAvailable:(BOOL)a3;
- (void)setHasIsLightweight:(BOOL)a3;
- (void)setHasIsMomentsAvailable:(BOOL)a3;
- (void)setHasIsPersonaAvailable:(BOOL)a3;
- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3;
- (void)setHasIsScreenSharingAvailable:(BOOL)a3;
- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3;
- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setHasPresentationMode:(BOOL)a3;
- (void)setHasSharePlayProtocolVersion:(BOOL)a3;
- (void)setHasSpatialPersonaGenerationCounter:(BOOL)a3;
- (void)setHasSupportsLeaveContext:(BOOL)a3;
- (void)setHasSupportsRequestToScreenShare:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3;
- (void)setHasVisionFeatureVersion:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setIsGondolaCallingAvailable:(BOOL)a3;
- (void)setIsLightweight:(BOOL)a3;
- (void)setIsMomentsAvailable:(BOOL)a3;
- (void)setIsPersonaAvailable:(BOOL)a3;
- (void)setIsPhotosSharePlayAvailable:(BOOL)a3;
- (void)setIsScreenSharingAvailable:(BOOL)a3;
- (void)setIsSpatialPersonaEnabled:(BOOL)a3;
- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3;
- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setOptions:(unsigned int)a3;
- (void)setPersonaHandshakeData:(id)a3;
- (void)setPresentationMode:(int)a3;
- (void)setSharePlayProtocolVersion:(unsigned int)a3;
- (void)setSpatialPersonaGenerationCounter:(unsigned int)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVisionCallEstablishmentVersion:(unsigned int)a3;
- (void)setVisionFeatureVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipant

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasIdentifier
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (BOOL)hasAvcData
{
  return self->_avcData != 0LL;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isMomentsAvailable = a3;
}

- (void)setHasIsMomentsAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsMomentsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isScreenSharingAvailable = a3;
}

- (void)setHasIsScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsScreenSharingAvailable
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsGondolaCallingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isGondolaCallingAvailable = a3;
}

- (void)setHasIsGondolaCallingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsGondolaCallingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsPersonaAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPersonaAvailable = a3;
}

- (void)setHasIsPersonaAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPersonaAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsLightweight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isLightweight = a3;
}

- (void)setHasIsLightweight:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsLightweight
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSharePlayProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_sharePlayProtocolVersion = a3;
}

- (void)setHasSharePlayProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasSharePlayProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setOptions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasOptions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isGFTDowngradeToOneToOneAvailable = a3;
}

- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsGFTDowngradeToOneToOneAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_guestModeEnabled = a3;
}

- (void)setHasGuestModeEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGuestModeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasAssociation
{
  return self->_association != 0LL;
}

- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isUPlusNDowngradeAvailable = a3;
}

- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsUPlusNDowngradeAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)avMode
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAvMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003D7938 + a3);
  }
}

- (int)StringAsAvMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsLeaveContext = a3;
}

- (void)setHasSupportsLeaveContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsLeaveContext
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isUPlusOneScreenSharingAvailable = a3;
}

- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsUPlusOneScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasPersonaHandshakeData
{
  return self->_personaHandshakeData != 0LL;
}

- (void)setIsSpatialPersonaEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isSpatialPersonaEnabled = a3;
}

- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsSpatialPersonaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isUPlusOneAVLessAvailable = a3;
}

- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsUPlusOneAVLessAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setVisionFeatureVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_visionFeatureVersion = a3;
}

- (void)setHasVisionFeatureVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasVisionFeatureVersion
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setVisionCallEstablishmentVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_visionCallEstablishmentVersion = a3;
}

- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasVisionCallEstablishmentVersion
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isUPlusOneVisionToVisionAvailable = a3;
}

- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsUPlusOneVisionToVisionAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_supportsRequestToScreenShare = a3;
}

- (void)setHasSupportsRequestToScreenShare:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSupportsRequestToScreenShare
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSpatialPersonaGenerationCounter:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_spatialPersonaGenerationCounter = a3;
}

- (void)setHasSpatialPersonaGenerationCounter:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSpatialPersonaGenerationCounter
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsPhotosSharePlayAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPhotosSharePlayAvailable = a3;
}

- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPhotosSharePlayAvailable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)presentationMode
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_presentationMode;
  }
  else {
    return 0;
  }
}

- (void)setPresentationMode:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_presentationMode = a3;
}

- (void)setHasPresentationMode:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPresentationMode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)presentationModeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003D7950 + a3);
  }
}

- (int)StringAsPresentationMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"AVLessSharePlay"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ContinuitySession"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_identifier));
    [v3 setObject:v6 forKey:@"identifier"];
  }

  handle = self->_handle;
  if (handle)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](handle, "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"handle"];
  }

  avcData = self->_avcData;
  if (avcData) {
    [v3 setObject:avcData forKey:@"avcData"];
  }
  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isMomentsAvailable));
    [v3 setObject:v18 forKey:@"isMomentsAvailable"];

    $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v10 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_40;
    }
  }

  else if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
    goto LABEL_11;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isScreenSharingAvailable));
  [v3 setObject:v19 forKey:@"isScreenSharingAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100012E30((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v12, self->_version, 1LL);
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }

  if ((*(_BYTE *)&has & 1) != 0) {
    PBDataWriterWriteUint64Field(v12, self->_identifier, 2LL);
  }
  handle = self->_handle;
  if (handle) {
    PBDataWriterWriteSubmessage(v12, handle, 3LL);
  }
  avcData = self->_avcData;
  if (avcData) {
    PBDataWriterWriteDataField(v12, avcData, 4LL);
  }
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField(v12, self->_isMomentsAvailable, 5LL);
    $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v7 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_41;
    }
  }

  else if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
    goto LABEL_11;
  }

  PBDataWriterWriteBOOLField(v12, self->_isScreenSharingAvailable, 6LL);
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v4[19] = self->_version;
    v4[26] |= 0x40u;
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_identifier;
    v4[26] |= 1u;
  }

  $F38001990BA1E94C86B335DE43A22703 v9 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    int v4 = v9;
  }

  if (self->_avcData)
  {
    objc_msgSend(v9, "setAvcData:");
    int v4 = v9;
  }

  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    *((_BYTE *)v4 + 92) = self->_isMomentsAvailable;
    v4[26] |= 0x2000u;
    $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v6 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_41;
    }
  }

  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_11;
  }

  *((_BYTE *)v4 + 95) = self->_isScreenSharingAvailable;
  v4[26] |= 0x10000u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  $F38001990BA1E94C86B335DE43A22703 v6 = v5;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v5[19] = self->_version;
    v5[26] |= 0x40u;
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((void *)v5 + 1) = self->_identifier;
    v5[26] |= 1u;
  }

  id v8 = -[CSDMessagingHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  $F38001990BA1E94C86B335DE43A22703 v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = -[NSData copyWithZone:](self->_avcData, "copyWithZone:", a3);
  $F38001990BA1E94C86B335DE43A22703 v11 = (void *)v6[4];
  v6[4] = v10;

  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *((_BYTE *)v6 + 92) = self->_isMomentsAvailable;
    *((_DWORD *)v6 + 26) |= 0x2000u;
    $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v12 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_33;
    }
  }

  else if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
    goto LABEL_7;
  }

  *((_BYTE *)v6 + 95) = self->_isScreenSharingAvailable;
  *((_DWORD *)v6 + 26) |= 0x10000u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  int v7 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 19)) {
      goto LABEL_177;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_identifier != *((void *)v4 + 1)) {
      goto LABEL_177;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_177;
  }

  handle = self->_handle;
  avcData = self->_avcData;
  if ((unint64_t)avcData | *((void *)v4 + 4))
  {
  }

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  int v11 = *((_DWORD *)v4 + 26);
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0) {
      goto LABEL_177;
    }
    if (self->_isMomentsAvailable)
    {
      if (!*((_BYTE *)v4 + 92)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0) {
      goto LABEL_177;
    }
    if (self->_isScreenSharingAvailable)
    {
      if (!*((_BYTE *)v4 + 95)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 95))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0) {
      goto LABEL_177;
    }
    if (self->_isGondolaCallingAvailable)
    {
      if (!*((_BYTE *)v4 + 90)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0) {
      goto LABEL_177;
    }
    if (self->_isPersonaAvailable)
    {
      if (!*((_BYTE *)v4 + 93)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 93))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0) {
      goto LABEL_177;
    }
    if (self->_isLightweight)
    {
      if (!*((_BYTE *)v4 + 91)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 91))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_sharePlayProtocolVersion != *((_DWORD *)v4 + 17)) {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_options != *((_DWORD *)v4 + 12)) {
      goto LABEL_177;
    }
  }

  else if ((v11 & 4) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0) {
      goto LABEL_177;
    }
    if (self->_isGFTDowngradeToOneToOneAvailable)
    {
      if (!*((_BYTE *)v4 + 89)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0) {
      goto LABEL_177;
    }
    if (self->_guestModeEnabled)
    {
      if (!*((_BYTE *)v4 + 88)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_177;
    }
  }

  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_177;
  }

  association = self->_association;
  if ((unint64_t)association | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingConversationParticipantAssociation isEqual:](association, "isEqual:")) {
      goto LABEL_177;
    }
    $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  }

  int v13 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&v10 & 0x40000) != 0)
  {
    if ((v13 & 0x40000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusNDowngradeAvailable)
    {
      if (!*((_BYTE *)v4 + 97)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_177;
    }
  }

  else if ((v13 & 0x40000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_avMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_177;
    }
  }

  else if ((v13 & 2) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    if ((v13 & 0x400000) == 0) {
      goto LABEL_177;
    }
    if (self->_supportsLeaveContext)
    {
      if (!*((_BYTE *)v4 + 101)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_177;
    }
  }

  else if ((v13 & 0x400000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneScreenSharingAvailable)
    {
      if (!*((_BYTE *)v4 + 99)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_177;
    }
  }

  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_177;
  }

  personaHandshakeData = self->_personaHandshakeData;
  if ((unint64_t)personaHandshakeData | *((void *)v4 + 7))
  {
    $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  }

  int v15 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0) {
      goto LABEL_177;
    }
    if (self->_isSpatialPersonaEnabled)
    {
      if (!*((_BYTE *)v4 + 96)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneAVLessAvailable)
    {
      if (!*((_BYTE *)v4 + 98)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_visionFeatureVersion != *((_DWORD *)v4 + 21)) {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_visionCallEstablishmentVersion != *((_DWORD *)v4 + 20)) {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneVisionToVisionAvailable)
    {
      if (!*((_BYTE *)v4 + 100)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    if ((v15 & 0x800000) == 0) {
      goto LABEL_177;
    }
    if (self->_supportsRequestToScreenShare)
    {
      if (!*((_BYTE *)v4 + 102)) {
        goto LABEL_177;
      }
    }

    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x800000) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_spatialPersonaGenerationCounter != *((_DWORD *)v4 + 18)) {
      goto LABEL_177;
    }
  }

  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_177;
  }

  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) != 0)
    {
      if (self->_isPhotosSharePlayAvailable)
      {
        if (!*((_BYTE *)v4 + 94)) {
          goto LABEL_177;
        }
        goto LABEL_172;
      }

      if (!*((_BYTE *)v4 + 94)) {
        goto LABEL_172;
      }
    }

- (unint64_t)hash
{
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    uint64_t v35 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&has & 1) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v35 = 0LL;
    if ((*(_BYTE *)&has & 1) != 0)
    {
LABEL_3:
      unint64_t v34 = 2654435761u * self->_identifier;
      goto LABEL_6;
    }
  }

  unint64_t v34 = 0LL;
LABEL_6:
  unint64_t v33 = -[CSDMessagingHandle hash](self->_handle, "hash");
  unint64_t v32 = (unint64_t)-[NSData hash](self->_avcData, "hash");
  $F38001990BA1E94C86B335DE43A22703 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    uint64_t v31 = 2654435761LL * self->_isMomentsAvailable;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
    {
LABEL_8:
      uint64_t v30 = 2654435761LL * self->_isScreenSharingAvailable;
      if ((*(_WORD *)&v4 & 0x800) != 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }

  else
  {
    uint64_t v31 = 0LL;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v30 = 0LL;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_9:
    uint64_t v29 = 2654435761LL * self->_isGondolaCallingAvailable;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x40) != 0)
  {
    self->_version = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x40u;
    int v6 = *((_DWORD *)v4 + 26);
  }

  if ((v6 & 1) != 0)
  {
    self->_identifier = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }

  handle = self->_handle;
  uint64_t v8 = *((void *)v5 + 5);
  id v14 = v5;
  if (handle)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingConversationParticipant setHandle:](self, "setHandle:");
  }

  id v5 = v14;
LABEL_11:
  if (*((void *)v5 + 4))
  {
    -[CSDMessagingConversationParticipant setAvcData:](self, "setAvcData:");
    id v5 = v14;
  }

  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x2000) != 0)
  {
    self->_isMomentsAvailable = *((_BYTE *)v5 + 92);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v9 = *((_DWORD *)v5 + 26);
    if ((v9 & 0x10000) == 0)
    {
LABEL_15:
      if ((v9 & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }

  else if ((v9 & 0x10000) == 0)
  {
    goto LABEL_15;
  }

  self->_isScreenSharingAvailable = *((_BYTE *)v5 + 95);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x800) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSData)avcData
{
  return self->_avcData;
}

- (void)setAvcData:(id)a3
{
}

- (BOOL)isMomentsAvailable
{
  return self->_isMomentsAvailable;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_isScreenSharingAvailable;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_isGondolaCallingAvailable;
}

- (BOOL)isPersonaAvailable
{
  return self->_isPersonaAvailable;
}

- (BOOL)isLightweight
{
  return self->_isLightweight;
}

- (unsigned)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (unsigned)options
{
  return self->_options;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_isGFTDowngradeToOneToOneAvailable;
}

- (BOOL)guestModeEnabled
{
  return self->_guestModeEnabled;
}

- (CSDMessagingConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_isUPlusNDowngradeAvailable;
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (BOOL)isUPlusOneScreenSharingAvailable
{
  return self->_isUPlusOneScreenSharingAvailable;
}

- (NSData)personaHandshakeData
{
  return self->_personaHandshakeData;
}

- (void)setPersonaHandshakeData:(id)a3
{
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_isSpatialPersonaEnabled;
}

- (BOOL)isUPlusOneAVLessAvailable
{
  return self->_isUPlusOneAVLessAvailable;
}

- (unsigned)visionFeatureVersion
{
  return self->_visionFeatureVersion;
}

- (unsigned)visionCallEstablishmentVersion
{
  return self->_visionCallEstablishmentVersion;
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_isUPlusOneVisionToVisionAvailable;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (unsigned)spatialPersonaGenerationCounter
{
  return self->_spatialPersonaGenerationCounter;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_isPhotosSharePlayAvailable;
}

- (void).cxx_destruct
{
}

+ (id)participantWithCSDConversationJoinContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:]( v4,  "setIsMomentsAvailable:",  [v3 isMomentsAvailable]);
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:]( v4,  "setIsScreenSharingAvailable:",  [v3 isScreenSharingAvailable]);
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:]( v4,  "setIsGondolaCallingAvailable:",  [v3 isGondolaCallingAvailable]);
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:]( v4,  "setIsPersonaAvailable:",  [v3 isPersonaAvailable]);
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:]( v4,  "setIsGFTDowngradeToOneToOneAvailable:",  [v3 isGFTDowngradeToOneToOneAvailable]);
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:]( v4,  "setIsUPlusOneScreenSharingAvailable:",  [v3 isUPlusOneScreenSharingAvailable]);
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:]( v4,  "setSupportsLeaveContext:",  [v3 supportsLeaveContext]);
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:]( v4,  "setIsUPlusNDowngradeAvailable:",  [v3 isUPlusNDowngradeAvailable]);
  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:]( v4,  "setSharePlayProtocolVersion:",  [v3 sharePlayProtocolVersion]);
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:]( v4,  "setVisionFeatureVersion:",  [v3 visionFeatureVersion]);
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:]( v4,  "setVisionCallEstablishmentVersion:",  [v3 visionCallEstablishmentVersion]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 participantAssociation]);
  -[CSDMessagingConversationParticipant setAssociation:](v4, "setAssociation:", v5);

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:]( v4,  "setIsSpatialPersonaEnabled:",  [v3 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:]( v4,  "setIsUPlusOneVisionToVisionAvailable:",  [v3 isUPlusOneVisionToVisionAvailable]);
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:]( v4,  "setIsUPlusOneAVLessAvailable:",  [v3 isUPlusOneAVLessAvailable]);
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:]( v4,  "setSupportsRequestToScreenShare:",  [v3 supportsRequestToScreenShare]);
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:]( v4,  "setIsPhotosSharePlayAvailable:",  [v3 isPhotosSharePlayAvailable]);
  id v6 = [v3 videoEnabled];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 message]);
  -[CSDMessagingConversationParticipant setAvMode:](v4, "setAvMode:", [v7 avMode]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 message]);
  -[CSDMessagingConversationParticipant setPresentationMode:]( v4,  "setPresentationMode:",  [v8 resolvedPresentationMode]);

  -[CSDMessagingConversationParticipant setOptions:](v4, "setOptions:", v6);
  return v4;
}

+ (id)participantWithCSDConversationParticipant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIdentifier:](v4, "setIdentifier:", [v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v5));
  -[CSDMessagingConversationParticipant setHandle:](v4, "setHandle:", v6);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 avcData]);
  -[CSDMessagingConversationParticipant setAvcData:](v4, "setAvcData:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:]( v4,  "setIsMomentsAvailable:",  [v8 isMomentsAvailable]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:]( v4,  "setIsScreenSharingAvailable:",  [v9 isScreenSharingAvailable]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:]( v4,  "setIsGondolaCallingAvailable:",  [v10 isGondolaCallingAvailable]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:]( v4,  "setIsPersonaAvailable:",  [v11 isPersonaAvailable]);

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:]( v4,  "setIsGFTDowngradeToOneToOneAvailable:",  [v12 isGFTDowngradeToOneToOneAvailable]);

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:]( v4,  "setIsUPlusOneScreenSharingAvailable:",  [v13 isUPlusOneScreenShareAvailable]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:]( v4,  "setIsUPlusOneAVLessAvailable:",  [v14 isUPlusOneAVLessAvailable]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:]( v4,  "setSupportsLeaveContext:",  [v15 supportsLeaveContext]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:]( v4,  "setSupportsRequestToScreenShare:",  [v16 supportsRequestToScreenShare]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:]( v4,  "setIsUPlusNDowngradeAvailable:",  [v17 isUPlusNDowngradeAvailable]);

  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:]( v4,  "setSharePlayProtocolVersion:",  [v18 sharePlayProtocolVersion]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:]( v4,  "setVisionFeatureVersion:",  [v19 visionFeatureVersion]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:]( v4,  "setVisionCallEstablishmentVersion:",  [v20 visionCallEstablishmentVersion]);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:]( v4,  "setIsUPlusOneVisionToVisionAvailable:",  [v21 isUPlusOneVisionToVisionAvailable]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:]( v4,  "setIsPhotosSharePlayAvailable:",  [v22 isPhotosSharePlayAvailable]);

  -[CSDMessagingConversationParticipant setGuestModeEnabled:]( v4,  "setGuestModeEnabled:",  [v3 isGuestModeEnabled]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 association]);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:]( &OBJC_CLASS___CSDMessagingConversationParticipantAssociation,  "participantAssociationWithTUConversationParticipantAssociation:",  v23));
  -[CSDMessagingConversationParticipant setAssociation:](v4, "setAssociation:", v24);

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:]( v4,  "setIsSpatialPersonaEnabled:",  [v3 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipant setSpatialPersonaGenerationCounter:]( v4,  "setSpatialPersonaGenerationCounter:",  [v3 spatialPersonaGenerationCounter]);
  -[CSDMessagingConversationParticipant setPresentationMode:]( v4,  "setPresentationMode:",  [v3 presentationMode]);
  id v25 = [v3 isVideoEnabled];
  id v26 = [v3 audioVideoMode];

  -[CSDMessagingConversationParticipant setAvMode:](v4, "setAvMode:", v26);
  -[CSDMessagingConversationParticipant setOptions:](v4, "setOptions:", v25);
  return v4;
}

+ (id)participantWithTUConversationParticipant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIdentifier:](v4, "setIdentifier:", [v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v5));
  -[CSDMessagingConversationParticipant setHandle:](v4, "setHandle:", v6);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:]( v4,  "setIsMomentsAvailable:",  [v7 isMomentsAvailable]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:]( v4,  "setIsScreenSharingAvailable:",  [v8 isScreenSharingAvailable]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:]( v4,  "setIsGondolaCallingAvailable:",  [v9 isGondolaCallingAvailable]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:]( v4,  "setIsPersonaAvailable:",  [v10 isPersonaAvailable]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:]( v4,  "setIsGFTDowngradeToOneToOneAvailable:",  [v11 isGFTDowngradeToOneToOneAvailable]);

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:]( v4,  "setIsUPlusOneScreenSharingAvailable:",  [v12 isUPlusOneScreenShareAvailable]);

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:]( v4,  "setIsUPlusOneAVLessAvailable:",  [v13 isUPlusOneAVLessAvailable]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:]( v4,  "setSupportsLeaveContext:",  [v14 supportsLeaveContext]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:]( v4,  "setSupportsRequestToScreenShare:",  [v15 supportsRequestToScreenShare]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:]( v4,  "setIsUPlusNDowngradeAvailable:",  [v16 isUPlusNDowngradeAvailable]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:]( v4,  "setIsPhotosSharePlayAvailable:",  [v17 isPhotosSharePlayAvailable]);

  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:]( v4,  "setSharePlayProtocolVersion:",  [v18 sharePlayProtocolVersion]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:]( v4,  "setVisionFeatureVersion:",  [v19 visionFeatureVersion]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:]( v4,  "setVisionCallEstablishmentVersion:",  [v20 visionCallEstablishmentVersion]);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 capabilities]);
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:]( v4,  "setIsUPlusOneVisionToVisionAvailable:",  [v21 isUPlusOneVisionToVisionAvailable]);

  -[CSDMessagingConversationParticipant setGuestModeEnabled:]( v4,  "setGuestModeEnabled:",  [v3 isGuestModeEnabled]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 association]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:]( &OBJC_CLASS___CSDMessagingConversationParticipantAssociation,  "participantAssociationWithTUConversationParticipantAssociation:",  v22));
  -[CSDMessagingConversationParticipant setAssociation:](v4, "setAssociation:", v23);

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:]( v4,  "setIsSpatialPersonaEnabled:",  [v3 isSpatialPersonaEnabled]);
  id v24 = [v3 isVideoEnabled];
  -[CSDMessagingConversationParticipant setAvMode:](v4, "setAvMode:", [v3 audioVideoMode]);
  id v25 = [v3 presentationMode];

  -[CSDMessagingConversationParticipant setPresentationMode:](v4, "setPresentationMode:", v25);
  -[CSDMessagingConversationParticipant setOptions:](v4, "setOptions:", v24);
  return v4;
}

- (CSDConversationParticipant)csdConversationParticipant
{
  id v3 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
  unint64_t v4 = -[CSDMessagingConversationParticipant identifier](self, "identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant handle](self, "handle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tuHandle]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant avcData](self, "avcData"));
  uint64_t v8 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v3,  "initWithIdentifier:handle:avcData:",  v4,  v6,  v7);

  int v9 = objc_alloc_init(&OBJC_CLASS___TUConversationParticipantCapabilities);
  -[TUConversationParticipantCapabilities setMomentsAvailable:]( v9,  "setMomentsAvailable:",  -[CSDMessagingConversationParticipant isMomentsAvailable](self, "isMomentsAvailable"));
  -[TUConversationParticipantCapabilities setScreenSharingAvailable:]( v9,  "setScreenSharingAvailable:",  -[CSDMessagingConversationParticipant isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  -[TUConversationParticipantCapabilities setGondolaCallingAvailable:]( v9,  "setGondolaCallingAvailable:",  -[CSDMessagingConversationParticipant isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  -[TUConversationParticipantCapabilities setPersonaAvailable:]( v9,  "setPersonaAvailable:",  -[CSDMessagingConversationParticipant isPersonaAvailable](self, "isPersonaAvailable"));
  -[TUConversationParticipantCapabilities setGftDowngradeToOneToOneAvailable:]( v9,  "setGftDowngradeToOneToOneAvailable:",  -[CSDMessagingConversationParticipant isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  -[TUConversationParticipantCapabilities setSupportsLeaveContext:]( v9,  "setSupportsLeaveContext:",  -[CSDMessagingConversationParticipant supportsLeaveContext](self, "supportsLeaveContext"));
  -[TUConversationParticipantCapabilities setSupportsRequestToScreenShare:]( v9,  "setSupportsRequestToScreenShare:",  -[CSDMessagingConversationParticipant supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  -[TUConversationParticipantCapabilities setUPlusNDowngradeAvailable:]( v9,  "setUPlusNDowngradeAvailable:",  -[CSDMessagingConversationParticipant isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  -[TUConversationParticipantCapabilities setUPlusOneScreenShareAvailable:]( v9,  "setUPlusOneScreenShareAvailable:",  -[CSDMessagingConversationParticipant isUPlusOneScreenSharingAvailable](self, "isUPlusOneScreenSharingAvailable"));
  -[TUConversationParticipantCapabilities setUPlusOneAVLessAvailable:]( v9,  "setUPlusOneAVLessAvailable:",  -[CSDMessagingConversationParticipant isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  -[TUConversationParticipantCapabilities setSharePlayProtocolVersion:]( v9,  "setSharePlayProtocolVersion:",  -[CSDMessagingConversationParticipant sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  -[TUConversationParticipantCapabilities setVisionFeatureVersion:]( v9,  "setVisionFeatureVersion:",  -[CSDMessagingConversationParticipant visionFeatureVersion](self, "visionFeatureVersion"));
  -[TUConversationParticipantCapabilities setVisionCallEstablishmentVersion:]( v9,  "setVisionCallEstablishmentVersion:",  -[CSDMessagingConversationParticipant visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  -[TUConversationParticipantCapabilities setUPlusOneVisionToVisionAvailable:]( v9,  "setUPlusOneVisionToVisionAvailable:",  -[CSDMessagingConversationParticipant isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  -[TUConversationParticipantCapabilities setPhotosSharePlayAvailable:]( v9,  "setPhotosSharePlayAvailable:",  -[CSDMessagingConversationParticipant isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  -[CSDConversationParticipant setCapabilities:](v8, "setCapabilities:", v9);
  -[CSDConversationParticipant setLightweight:]( v8,  "setLightweight:",  -[CSDMessagingConversationParticipant isLightweight](self, "isLightweight"));
  -[CSDConversationParticipant setGuestModeEnabled:]( v8,  "setGuestModeEnabled:",  -[CSDMessagingConversationParticipant guestModeEnabled](self, "guestModeEnabled"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant association](self, "association"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tuConversationParticipantAssociation]);
  -[CSDConversationParticipant setAssociation:](v8, "setAssociation:", v11);

  -[CSDConversationParticipant setSpatialPersonaEnabled:]( v8,  "setSpatialPersonaEnabled:",  -[CSDMessagingConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  -[CSDConversationParticipant setSpatialPersonaGenerationCounter:]( v8,  "setSpatialPersonaGenerationCounter:",  -[CSDMessagingConversationParticipant spatialPersonaGenerationCounter](self, "spatialPersonaGenerationCounter"));
  -[CSDConversationParticipant setVideoEnabled:]( v8,  "setVideoEnabled:",  -[CSDMessagingConversationParticipant options](self, "options") & 1 | !-[CSDMessagingConversationParticipant hasOptions]( self,  "hasOptions"));
  if (-[CSDMessagingConversationParticipant hasAvMode](self, "hasAvMode"))
  {
    uint64_t v12 = -[CSDMessagingConversationParticipant avMode](self, "avMode");
  }

  else if (-[CSDConversationParticipant isVideoEnabled](v8, "isVideoEnabled"))
  {
    uint64_t v12 = 2LL;
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  -[CSDConversationParticipant setAudioVideoMode:](v8, "setAudioVideoMode:", v12);
  -[CSDConversationParticipant setPresentationMode:]( v8,  "setPresentationMode:",  -[CSDMessagingConversationParticipant resolvedPresentationMode](self, "resolvedPresentationMode"));

  return v8;
}

- (unint64_t)resolvedPresentationMode
{
  if (!-[CSDMessagingConversationParticipant hasPresentationMode](self, "hasPresentationMode")) {
    return -[CSDMessagingConversationParticipant avMode](self, "avMode") == 0;
  }
  unsigned int v3 = -[CSDMessagingConversationParticipant presentationMode](self, "presentationMode");
  if (v3 == 1) {
    return 1LL;
  }
  else {
    return 2LL * (v3 == 2);
  }
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationParticipant;
  id v3 = -[CSDMessagingConversationParticipant description](&v10, "description");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = TULoggableStringForObject(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v7));

  return v8;
}

@end