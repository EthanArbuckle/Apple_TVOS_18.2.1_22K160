@interface CSDMessagingConversationParticipantDidJoinContext
+ (Class)lightweightMembersType;
+ (Class)membersType;
+ (Class)otherInvitedHandlesType;
- (BOOL)hasActivitySession;
- (BOOL)hasCollaborationIdentifier;
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
- (BOOL)hasMessage;
- (BOOL)hasMessagesGroupName;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasParticipantAssociation;
- (BOOL)hasProviderIdentifier;
- (BOOL)hasScreenSharingRequest;
- (BOOL)hasSharePlayProtocolVersion;
- (BOOL)hasSupportsLeaveContext;
- (BOOL)hasSupportsRequestToScreenShare;
- (BOOL)hasVersion;
- (BOOL)hasVideo;
- (BOOL)hasVideoEnabled;
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
- (BOOL)video;
- (BOOL)videoEnabled;
- (CSDMessagingConversationActivitySession)activitySession;
- (CSDMessagingConversationMessage)message;
- (CSDMessagingConversationParticipantAssociation)participantAssociation;
- (CSDMessagingScreenShareContext)screenSharingRequest;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)members;
- (NSMutableArray)otherInvitedHandles;
- (NSSet)otherInvitedTUHandles;
- (NSSet)tuConversationMembers;
- (NSSet)tuLightweightMembers;
- (NSString)collaborationIdentifier;
- (NSString)messagesGroupName;
- (NSString)messagesGroupUUIDString;
- (NSString)providerIdentifier;
- (id)allTUConversationMembers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)membersAtIndex:(unint64_t)a3;
- (id)otherInvitedHandlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)lightweightMembersCount;
- (unint64_t)membersCount;
- (unint64_t)otherInvitedHandlesCount;
- (unsigned)sharePlayProtocolVersion;
- (unsigned)version;
- (unsigned)visionCallEstablishmentVersion;
- (unsigned)visionFeatureVersion;
- (void)addLightweightMembers:(id)a3;
- (void)addMembers:(id)a3;
- (void)addOtherInvitedHandles:(id)a3;
- (void)clearLightweightMembers;
- (void)clearMembers;
- (void)clearOtherInvitedHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivitySession:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
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
- (void)setHasSharePlayProtocolVersion:(BOOL)a3;
- (void)setHasSupportsLeaveContext:(BOOL)a3;
- (void)setHasSupportsRequestToScreenShare:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setHasVideoEnabled:(BOOL)a3;
- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3;
- (void)setHasVisionFeatureVersion:(BOOL)a3;
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
- (void)setLightweightMembers:(id)a3;
- (void)setMembers:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setOtherInvitedTUHandles:(id)a3;
- (void)setParticipantAssociation:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setScreenSharingRequest:(id)a3;
- (void)setSharePlayProtocolVersion:(unsigned int)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setTuConversationMembers:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVisionCallEstablishmentVersion:(unsigned int)a3;
- (void)setVisionFeatureVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipantDidJoinContext

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMembers
{
}

- (void)addMembers:(id)a3
{
  id v4 = a3;
  members = self->_members;
  id v8 = v4;
  if (!members)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_members;
    self->_members = v6;

    id v4 = v8;
    members = self->_members;
  }

  -[NSMutableArray addObject:](members, "addObject:", v4);
}

- (unint64_t)membersCount
{
  return (unint64_t)-[NSMutableArray count](self->_members, "count");
}

- (id)membersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_members, "objectAtIndex:", a3);
}

+ (Class)membersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
}

- (BOOL)hasMessage
{
  return self->_message != 0LL;
}

- (BOOL)hasMessagesGroupUUIDString
{
  return self->_messagesGroupUUIDString != 0LL;
}

- (BOOL)hasMessagesGroupName
{
  return self->_messagesGroupName != 0LL;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_isMomentsAvailable = a3;
}

- (void)setHasIsMomentsAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsMomentsAvailable
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasActivitySession
{
  return self->_activitySession != 0LL;
}

- (void)setVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_video = a3;
}

- (void)setHasVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVideo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isScreenSharingAvailable = a3;
}

- (void)setHasIsScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasProviderIdentifier
{
  return self->_providerIdentifier != 0LL;
}

- (void)clearOtherInvitedHandles
{
}

- (void)addOtherInvitedHandles:(id)a3
{
  id v4 = a3;
  otherInvitedHandles = self->_otherInvitedHandles;
  id v8 = v4;
  if (!otherInvitedHandles)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_otherInvitedHandles;
    self->_otherInvitedHandles = v6;

    id v4 = v8;
    otherInvitedHandles = self->_otherInvitedHandles;
  }

  -[NSMutableArray addObject:](otherInvitedHandles, "addObject:", v4);
}

- (unint64_t)otherInvitedHandlesCount
{
  return (unint64_t)-[NSMutableArray count](self->_otherInvitedHandles, "count");
}

- (id)otherInvitedHandlesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_otherInvitedHandles, "objectAtIndex:", a3);
}

+ (Class)otherInvitedHandlesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingHandle, a2);
}

- (void)setIsPersonaAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_isPersonaAvailable = a3;
}

- (void)setHasIsPersonaAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsPersonaAvailable
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)clearLightweightMembers
{
}

- (void)addLightweightMembers:(id)a3
{
  id v4 = a3;
  lightweightMembers = self->_lightweightMembers;
  id v8 = v4;
  if (!lightweightMembers)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_lightweightMembers;
    self->_lightweightMembers = v6;

    id v4 = v8;
    lightweightMembers = self->_lightweightMembers;
  }

  -[NSMutableArray addObject:](lightweightMembers, "addObject:", v4);
}

- (unint64_t)lightweightMembersCount
{
  return (unint64_t)-[NSMutableArray count](self->_lightweightMembers, "count");
}

- (id)lightweightMembersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lightweightMembers, "objectAtIndex:", a3);
}

+ (Class)lightweightMembersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
}

- (void)setIsLightweight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_isLightweight = a3;
}

- (void)setHasIsLightweight:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsLightweight
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsGondolaCallingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_isGondolaCallingAvailable = a3;
}

- (void)setHasIsGondolaCallingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasIsGondolaCallingAvailable
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setVideoEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_videoEnabled = a3;
}

- (void)setHasVideoEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVideoEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSharePlayProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_sharePlayProtocolVersion = a3;
}

- (void)setHasSharePlayProtocolVersion:(BOOL)a3
{
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSharePlayProtocolVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_isGFTDowngradeToOneToOneAvailable = a3;
}

- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasIsGFTDowngradeToOneToOneAvailable
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasParticipantAssociation
{
  return self->_participantAssociation != 0LL;
}

- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isUPlusNDowngradeAvailable = a3;
}

- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsUPlusNDowngradeAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasCollaborationIdentifier
{
  return self->_collaborationIdentifier != 0LL;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_supportsLeaveContext = a3;
}

- (void)setHasSupportsLeaveContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSupportsLeaveContext
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isUPlusOneScreenSharingAvailable = a3;
}

- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsUPlusOneScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsSpatialPersonaEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isSpatialPersonaEnabled = a3;
}

- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsSpatialPersonaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isUPlusOneAVLessAvailable = a3;
}

- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsUPlusOneAVLessAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setVisionFeatureVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_visionFeatureVersion = a3;
}

- (void)setHasVisionFeatureVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasVisionFeatureVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVisionCallEstablishmentVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_visionCallEstablishmentVersion = a3;
}

- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasVisionCallEstablishmentVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasScreenSharingRequest
{
  return self->_screenSharingRequest != 0LL;
}

- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isUPlusOneVisionToVisionAvailable = a3;
}

- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsUPlusOneVisionToVisionAvailable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_supportsRequestToScreenShare = a3;
}

- (void)setHasSupportsRequestToScreenShare:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSupportsRequestToScreenShare
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsPhotosSharePlayAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isPhotosSharePlayAvailable = a3;
}

- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsPhotosSharePlayAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)dictionaryRepresentation
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  if (-[NSMutableArray count](self->_members, "count"))
  {
    v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_members, "count"));
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    v6 = self->_members;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v71,  v77,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v72;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v72 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v71 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v71,  v77,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v5 forKey:@"members"];
  }

  message = self->_message;
  if (message)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage dictionaryRepresentation](message, "dictionaryRepresentation"));
    [v3 setObject:v13 forKey:@"message"];
  }

  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    [v3 setObject:messagesGroupUUIDString forKey:@"messagesGroupUUIDString"];
  }
  messagesGroupName = self->_messagesGroupName;
  if (messagesGroupName) {
    [v3 setObject:messagesGroupName forKey:@"messagesGroupName"];
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isMomentsAvailable));
    [v3 setObject:v16 forKey:@"isMomentsAvailable"];
  }

  activitySession = self->_activitySession;
  if (activitySession)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySession dictionaryRepresentation]( activitySession,  "dictionaryRepresentation"));
    [v3 setObject:v18 forKey:@"activitySession"];
  }

  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_video));
    [v3 setObject:v20 forKey:@"video"];

    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isScreenSharingAvailable));
    [v3 setObject:v21 forKey:@"isScreenSharingAvailable"];
  }

  providerIdentifier = self->_providerIdentifier;
  if (providerIdentifier) {
    [v3 setObject:providerIdentifier forKey:@"providerIdentifier"];
  }
  if (-[NSMutableArray count](self->_otherInvitedHandles, "count"))
  {
    v23 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_otherInvitedHandles, "count"));
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    v24 = self->_otherInvitedHandles;
    id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v67,  v76,  16LL);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v68;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v68 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v67 + 1) + 8 * (void)j) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v23, "addObject:", v29);
        }

        id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v67,  v76,  16LL);
      }

      while (v26);
    }

    [v3 setObject:v23 forKey:@"otherInvitedHandles"];
  }

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPersonaAvailable));
    [v3 setObject:v30 forKey:@"isPersonaAvailable"];
  }

  if (-[NSMutableArray count](self->_lightweightMembers, "count"))
  {
    v31 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_lightweightMembers, "count"));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    v32 = self->_lightweightMembers;
    id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v64;
      do
      {
        for (k = 0LL; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v64 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v63 + 1) + 8 * (void)k),  "dictionaryRepresentation",  (void)v63));
          -[NSMutableArray addObject:](v31, "addObject:", v37);
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
      }

      while (v34);
    }

    [v3 setObject:v31 forKey:@"lightweightMembers"];
  }

  $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
  if ((*(_BYTE *)&v38 & 0x40) != 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isLightweight));
    [v3 setObject:v52 forKey:@"isLightweight"];

    $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
    if ((*(_BYTE *)&v38 & 0x20) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v38 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_76;
    }
  }

  else if ((*(_BYTE *)&v38 & 0x20) == 0)
  {
    goto LABEL_50;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isGondolaCallingAvailable,  (void)v63));
  [v3 setObject:v53 forKey:@"isGondolaCallingAvailable"];

  $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x80000) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v38 & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_77;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000A3D10((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
  }
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v6 = self->_members;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v41 + 1) + 8LL * (void)v10), 2LL);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
    }

    while (v8);
  }

  message = self->_message;
  if (message) {
    PBDataWriterWriteSubmessage(v5, message, 3LL);
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    PBDataWriterWriteStringField(v5, messagesGroupUUIDString, 4LL);
  }
  messagesGroupName = self->_messagesGroupName;
  if (messagesGroupName) {
    PBDataWriterWriteStringField(v5, messagesGroupName, 5LL);
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isMomentsAvailable, 6LL);
  }
  activitySession = self->_activitySession;
  if (activitySession) {
    PBDataWriterWriteSubmessage(v5, activitySession, 7LL);
  }
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_video, 8LL);
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }

  if ((*(_WORD *)&has & 0x400) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isScreenSharingAvailable, 9LL);
  }
  providerIdentifier = self->_providerIdentifier;
  if (providerIdentifier) {
    PBDataWriterWriteStringField(v5, providerIdentifier, 10LL);
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v17 = self->_otherInvitedHandles;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v37 + 1) + 8LL * (void)v21), 11LL);
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
    }

    while (v19);
  }

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isPersonaAvailable, 12LL);
  }
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v22 = self->_lightweightMembers;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      id v26 = 0LL;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v33 + 1) + 8LL * (void)v26), 13LL);
        id v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
    }

    while (v24);
  }

  $91AFCFBBFCC236A698A91430C8570A63 v27 = self->_has;
  if ((*(_BYTE *)&v27 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isLightweight, 14LL);
    $91AFCFBBFCC236A698A91430C8570A63 v27 = self->_has;
    if ((*(_BYTE *)&v27 & 0x20) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v27 & 0x80000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_70;
    }
  }

  else if ((*(_BYTE *)&v27 & 0x20) == 0)
  {
    goto LABEL_44;
  }

  PBDataWriterWriteBOOLField(v5, self->_isGondolaCallingAvailable, 15LL);
  $91AFCFBBFCC236A698A91430C8570A63 v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x80000) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v27 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_71;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[25] = self->_version;
    v4[32] |= 2u;
  }

  id v23 = v4;
  if (-[CSDMessagingConversationParticipantDidJoinContext membersCount](self, "membersCount"))
  {
    [v23 clearMembers];
    unint64_t v5 = -[CSDMessagingConversationParticipantDidJoinContext membersCount](self, "membersCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext membersAtIndex:](self, "membersAtIndex:", i));
        [v23 addMembers:v8];
      }
    }
  }

  if (self->_message) {
    objc_msgSend(v23, "setMessage:");
  }
  uint64_t v9 = v23;
  if (self->_messagesGroupUUIDString)
  {
    objc_msgSend(v23, "setMessagesGroupUUIDString:");
    uint64_t v9 = v23;
  }

  if (self->_messagesGroupName)
  {
    objc_msgSend(v23, "setMessagesGroupName:");
    uint64_t v9 = v23;
  }

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v9[115] = self->_isMomentsAvailable;
    *((_DWORD *)v9 + 32) |= 0x80u;
  }

  if (self->_activitySession)
  {
    objc_msgSend(v23, "setActivitySession:");
    uint64_t v9 = v23;
  }

  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v9[126] = self->_video;
    *((_DWORD *)v9 + 32) |= 0x40000u;
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v9[118] = self->_isScreenSharingAvailable;
    *((_DWORD *)v9 + 32) |= 0x400u;
  }

  if (self->_providerIdentifier) {
    objc_msgSend(v23, "setProviderIdentifier:");
  }
  if (-[CSDMessagingConversationParticipantDidJoinContext otherInvitedHandlesCount](self, "otherInvitedHandlesCount"))
  {
    [v23 clearOtherInvitedHandles];
    unint64_t v11 = -[CSDMessagingConversationParticipantDidJoinContext otherInvitedHandlesCount]( self,  "otherInvitedHandlesCount");
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0LL; j != v12; ++j)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext otherInvitedHandlesAtIndex:]( self,  "otherInvitedHandlesAtIndex:",  j));
        [v23 addOtherInvitedHandles:v14];
      }
    }
  }

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *((_BYTE *)v23 + 116) = self->_isPersonaAvailable;
    *((_DWORD *)v23 + 32) |= 0x100u;
  }

  if (-[CSDMessagingConversationParticipantDidJoinContext lightweightMembersCount](self, "lightweightMembersCount"))
  {
    [v23 clearLightweightMembers];
    unint64_t v15 = -[CSDMessagingConversationParticipantDidJoinContext lightweightMembersCount](self, "lightweightMembersCount");
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0LL; k != v16; ++k)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext lightweightMembersAtIndex:]( self,  "lightweightMembersAtIndex:",  k));
        [v23 addLightweightMembers:v18];
      }
    }
  }

  $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
  uint64_t v20 = v23;
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    *((_BYTE *)v23 + 114) = self->_isLightweight;
    *((_DWORD *)v23 + 32) |= 0x40u;
    $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
    if ((*(_BYTE *)&v19 & 0x20) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v19 & 0x80000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_61;
    }
  }

  else if ((*(_BYTE *)&v19 & 0x20) == 0)
  {
    goto LABEL_35;
  }

  *((_BYTE *)v23 + 113) = self->_isGondolaCallingAvailable;
  *((_DWORD *)v23 + 32) |= 0x20u;
  $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v19 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_62;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[25] = self->_version;
    v5[32] |= 2u;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v7 = self->_members;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      unint64_t v11 = 0LL;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addMembers:v12];

        unint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
    }

    while (v9);
  }

  id v13 = -[CSDMessagingConversationMessage copyWithZone:](self->_message, "copyWithZone:", a3);
  v14 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v13;

  id v15 = -[NSString copyWithZone:](self->_messagesGroupUUIDString, "copyWithZone:", a3);
  unint64_t v16 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v15;

  id v17 = -[NSString copyWithZone:](self->_messagesGroupName, "copyWithZone:", a3);
  id v18 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v17;

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *((_BYTE *)v6 + 115) = self->_isMomentsAvailable;
    *((_DWORD *)v6 + 32) |= 0x80u;
  }

  id v19 = -[CSDMessagingConversationActivitySession copyWithZone:](self->_activitySession, "copyWithZone:", a3);
  uint64_t v20 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v19;

  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((_BYTE *)v6 + 126) = self->_video;
    *((_DWORD *)v6 + 32) |= 0x40000u;
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_BYTE *)v6 + 118) = self->_isScreenSharingAvailable;
    *((_DWORD *)v6 + 32) |= 0x400u;
  }

  id v22 = -[NSString copyWithZone:](self->_providerIdentifier, "copyWithZone:", a3);
  id v23 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v22;

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v24 = self->_otherInvitedHandles;
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)v28) copyWithZone:a3];
        [v6 addOtherInvitedHandles:v29];

        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
    }

    while (v26);
  }

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *((_BYTE *)v6 + 116) = self->_isPersonaAvailable;
    *((_DWORD *)v6 + 32) |= 0x100u;
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  $91AFCFBBFCC236A698A91430C8570A63 v30 = self->_lightweightMembers;
  id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      __int128 v34 = 0LL;
      do
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)v34), "copyWithZone:", a3, (void)v46);
        [v6 addLightweightMembers:v35];

        __int128 v34 = (char *)v34 + 1;
      }

      while (v32 != v34);
      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
    }

    while (v32);
  }

  $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x40) != 0)
  {
    *((_BYTE *)v6 + 114) = self->_isLightweight;
    *((_DWORD *)v6 + 32) |= 0x40u;
    $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
    if ((*(_BYTE *)&v36 & 0x20) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v36 & 0x80000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_54;
    }
  }

  else if ((*(_BYTE *)&v36 & 0x20) == 0)
  {
    goto LABEL_34;
  }

  *((_BYTE *)v6 + 113) = self->_isGondolaCallingAvailable;
  *((_DWORD *)v6 + 32) |= 0x20u;
  $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v36 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_55;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v6 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_version != *((_DWORD *)v4 + 25)) {
      goto LABEL_172;
    }
  }

  else if ((v6 & 2) != 0)
  {
    goto LABEL_172;
  }

  members = self->_members;
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingConversationMessage isEqual:](message, "isEqual:")) {
      goto LABEL_172;
    }
  }

  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 7))
  {
  }

  messagesGroupName = self->_messagesGroupName;
  if ((unint64_t)messagesGroupName | *((void *)v4 + 6))
  {
  }

  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  int v12 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_172;
    }
    if (self->_isMomentsAvailable)
    {
      if (!*((_BYTE *)v4 + 115)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 115))
    {
      goto LABEL_172;
    }
  }

  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_172;
  }

  activitySession = self->_activitySession;
  if ((unint64_t)activitySession | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingConversationActivitySession isEqual:](activitySession, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }

  int v14 = *((_DWORD *)v4 + 32);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0) {
      goto LABEL_172;
    }
    if (self->_video)
    {
      if (!*((_BYTE *)v4 + 126)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 126))
    {
      goto LABEL_172;
    }
  }

  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0) {
      goto LABEL_172;
    }
    if (self->_isScreenSharingAvailable)
    {
      if (!*((_BYTE *)v4 + 118)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 118))
    {
      goto LABEL_172;
    }
  }

  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_172;
  }

  providerIdentifier = self->_providerIdentifier;
  if ((unint64_t)providerIdentifier | *((void *)v4 + 10)
    && !-[NSString isEqual:](providerIdentifier, "isEqual:"))
  {
    goto LABEL_172;
  }

  otherInvitedHandles = self->_otherInvitedHandles;
  if ((unint64_t)otherInvitedHandles | *((void *)v4 + 8))
  {
  }

  $91AFCFBBFCC236A698A91430C8570A63 v17 = self->_has;
  int v18 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0) {
      goto LABEL_172;
    }
    if (self->_isPersonaAvailable)
    {
      if (!*((_BYTE *)v4 + 116)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_172;
    }
  }

  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_172;
  }

  lightweightMembers = self->_lightweightMembers;
  if ((unint64_t)lightweightMembers | *((void *)v4 + 3))
  {
    $91AFCFBBFCC236A698A91430C8570A63 v17 = self->_has;
  }

  int v20 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&v17 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0) {
      goto LABEL_172;
    }
    if (self->_isLightweight)
    {
      if (!*((_BYTE *)v4 + 114)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_172;
    }
  }

  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_BYTE *)&v17 & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0) {
      goto LABEL_172;
    }
    if (self->_isGondolaCallingAvailable)
    {
      if (!*((_BYTE *)v4 + 113)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_172;
    }
  }

  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_DWORD *)&v17 & 0x80000) != 0)
  {
    if ((v20 & 0x80000) == 0) {
      goto LABEL_172;
    }
    if (self->_videoEnabled)
    {
      if (!*((_BYTE *)v4 + 127)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 127))
    {
      goto LABEL_172;
    }
  }

  else if ((v20 & 0x80000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_BYTE *)&v17 & 1) != 0)
  {
    if ((v20 & 1) == 0 || self->_sharePlayProtocolVersion != *((_DWORD *)v4 + 24)) {
      goto LABEL_172;
    }
  }

  else if ((v20 & 1) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_BYTE *)&v17 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0) {
      goto LABEL_172;
    }
    if (self->_isGFTDowngradeToOneToOneAvailable)
    {
      if (!*((_BYTE *)v4 + 112)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_172;
    }
  }

  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_172;
  }

  participantAssociation = self->_participantAssociation;
  if ((unint64_t)participantAssociation | *((void *)v4 + 9))
  {
    if (!-[CSDMessagingConversationParticipantAssociation isEqual:](participantAssociation, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v17 = self->_has;
  }

  int v22 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    if ((v22 & 0x1000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusNDowngradeAvailable)
    {
      if (!*((_BYTE *)v4 + 120)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_172;
    }
  }

  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_172;
  }

  collaborationIdentifier = self->_collaborationIdentifier;
  if ((unint64_t)collaborationIdentifier | *((void *)v4 + 2))
  {
    $91AFCFBBFCC236A698A91430C8570A63 v17 = self->_has;
  }

  int v24 = *((_DWORD *)v4 + 32);
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    if ((v24 & 0x10000) == 0) {
      goto LABEL_172;
    }
    if (self->_supportsLeaveContext)
    {
      if (!*((_BYTE *)v4 + 124)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 124))
    {
      goto LABEL_172;
    }
  }

  else if ((v24 & 0x10000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_WORD *)&v17 & 0x4000) != 0)
  {
    if ((v24 & 0x4000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneScreenSharingAvailable)
    {
      if (!*((_BYTE *)v4 + 122)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 122))
    {
      goto LABEL_172;
    }
  }

  else if ((v24 & 0x4000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    if ((v24 & 0x800) == 0) {
      goto LABEL_172;
    }
    if (self->_isSpatialPersonaEnabled)
    {
      if (!*((_BYTE *)v4 + 119)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 119))
    {
      goto LABEL_172;
    }
  }

  else if ((v24 & 0x800) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_WORD *)&v17 & 0x2000) != 0)
  {
    if ((v24 & 0x2000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneAVLessAvailable)
    {
      if (!*((_BYTE *)v4 + 121)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_172;
    }
  }

  else if ((v24 & 0x2000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_BYTE *)&v17 & 8) != 0)
  {
    if ((v24 & 8) == 0 || self->_visionFeatureVersion != *((_DWORD *)v4 + 27)) {
      goto LABEL_172;
    }
  }

  else if ((v24 & 8) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_BYTE *)&v17 & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_visionCallEstablishmentVersion != *((_DWORD *)v4 + 26)) {
      goto LABEL_172;
    }
  }

  else if ((v24 & 4) != 0)
  {
    goto LABEL_172;
  }

  screenSharingRequest = self->_screenSharingRequest;
  if ((unint64_t)screenSharingRequest | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingScreenShareContext isEqual:](screenSharingRequest, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v17 = self->_has;
  }

  int v26 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v17 & 0x8000) != 0)
  {
    if ((v26 & 0x8000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneVisionToVisionAvailable)
    {
      if (!*((_BYTE *)v4 + 123)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 123))
    {
      goto LABEL_172;
    }
  }

  else if ((v26 & 0x8000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v26 & 0x20000) == 0) {
      goto LABEL_172;
    }
    if (self->_supportsRequestToScreenShare)
    {
      if (!*((_BYTE *)v4 + 125)) {
        goto LABEL_172;
      }
    }

    else if (*((_BYTE *)v4 + 125))
    {
      goto LABEL_172;
    }
  }

  else if ((v26 & 0x20000) != 0)
  {
    goto LABEL_172;
  }

  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v26 & 0x200) != 0)
    {
      if (self->_isPhotosSharePlayAvailable)
      {
        if (!*((_BYTE *)v4 + 117)) {
          goto LABEL_172;
        }
      }

      else if (*((_BYTE *)v4 + 117))
      {
        goto LABEL_172;
      }

      BOOL v27 = 1;
      goto LABEL_173;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v38 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v38 = 0LL;
  }
  unint64_t v37 = (unint64_t)-[NSMutableArray hash](self->_members, "hash");
  unint64_t v36 = -[CSDMessagingConversationMessage hash](self->_message, "hash");
  NSUInteger v35 = -[NSString hash](self->_messagesGroupUUIDString, "hash");
  NSUInteger v34 = -[NSString hash](self->_messagesGroupName, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0) {
    uint64_t v33 = 2654435761LL * self->_isMomentsAvailable;
  }
  else {
    uint64_t v33 = 0LL;
  }
  unint64_t v32 = -[CSDMessagingConversationActivitySession hash](self->_activitySession, "hash");
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v31 = 2654435761LL * self->_video;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v31 = 0LL;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_9:
      uint64_t v30 = 2654435761LL * self->_isScreenSharingAvailable;
      goto LABEL_12;
    }
  }

  uint64_t v30 = 0LL;
LABEL_12:
  NSUInteger v29 = -[NSString hash](self->_providerIdentifier, "hash");
  unint64_t v28 = (unint64_t)-[NSMutableArray hash](self->_otherInvitedHandles, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0) {
    uint64_t v27 = 2654435761LL * self->_isPersonaAvailable;
  }
  else {
    uint64_t v27 = 0LL;
  }
  unint64_t v26 = (unint64_t)-[NSMutableArray hash](self->_lightweightMembers, "hash");
  $91AFCFBBFCC236A698A91430C8570A63 v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
    uint64_t v25 = 2654435761LL * self->_isLightweight;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
    {
LABEL_17:
      uint64_t v24 = 2654435761LL * self->_isGondolaCallingAvailable;
      if ((*(_DWORD *)&v4 & 0x80000) != 0) {
        goto LABEL_18;
      }
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v25 = 0LL;
    if ((*(_BYTE *)&v4 & 0x20) != 0) {
      goto LABEL_17;
    }
  }

  uint64_t v24 = 0LL;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_18:
    uint64_t v23 = 2654435761LL * self->_videoEnabled;
    if ((*(_BYTE *)&v4 & 1) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    uint64_t v22 = 0LL;
    if ((*(_BYTE *)&v4 & 0x10) != 0) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_has |= 2u;
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = *((id *)v4 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CSDMessagingConversationParticipantDidJoinContext addMembers:]( self,  "addMembers:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)i));
      }

      id v8 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v8);
  }

  message = self->_message;
  uint64_t v12 = *((void *)v5 + 5);
  if (message)
  {
    if (v12) {
      -[CSDMessagingConversationMessage mergeFrom:](message, "mergeFrom:");
    }
  }

  else if (v12)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setMessage:](self, "setMessage:");
  }

  if (*((void *)v5 + 7)) {
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupUUIDString:]( self,  "setMessagesGroupUUIDString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupName:](self, "setMessagesGroupName:");
  }
  if ((*((_BYTE *)v5 + 128) & 0x80) != 0)
  {
    self->_isMomentsAvailable = *((_BYTE *)v5 + 115);
    *(_DWORD *)&self->_has |= 0x80u;
  }

  activitySession = self->_activitySession;
  uint64_t v14 = *((void *)v5 + 1);
  if (activitySession)
  {
    if (v14) {
      -[CSDMessagingConversationActivitySession mergeFrom:](activitySession, "mergeFrom:");
    }
  }

  else if (v14)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setActivitySession:](self, "setActivitySession:");
  }

  int v15 = *((_DWORD *)v5 + 32);
  if ((v15 & 0x40000) != 0)
  {
    self->_video = *((_BYTE *)v5 + 126);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v15 = *((_DWORD *)v5 + 32);
  }

  if ((v15 & 0x400) != 0)
  {
    self->_isScreenSharingAvailable = *((_BYTE *)v5 + 118);
    *(_DWORD *)&self->_has |= 0x400u;
  }

  if (*((void *)v5 + 10)) {
    -[CSDMessagingConversationParticipantDidJoinContext setProviderIdentifier:](self, "setProviderIdentifier:");
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v16 = *((id *)v5 + 8);
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t j = 0LL; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        -[CSDMessagingConversationParticipantDidJoinContext addOtherInvitedHandles:]( self,  "addOtherInvitedHandles:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)j));
      }

      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }

    while (v18);
  }

  if ((*((_BYTE *)v5 + 129) & 1) != 0)
  {
    self->_isPersonaAvailable = *((_BYTE *)v5 + 116);
    *(_DWORD *)&self->_has |= 0x100u;
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v21 = *((id *)v5 + 3);
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t k = 0LL; k != v23; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        -[CSDMessagingConversationParticipantDidJoinContext addLightweightMembers:]( self,  "addLightweightMembers:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)k),  (void)v33);
      }

      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }

    while (v23);
  }

  int v26 = *((_DWORD *)v5 + 32);
  if ((v26 & 0x40) != 0)
  {
    self->_isLightweight = *((_BYTE *)v5 + 114);
    *(_DWORD *)&self->_has |= 0x40u;
    int v26 = *((_DWORD *)v5 + 32);
    if ((v26 & 0x20) == 0)
    {
LABEL_50:
      if ((v26 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }

  else if ((v26 & 0x20) == 0)
  {
    goto LABEL_50;
  }

  self->_isGondolaCallingAvailable = *((_BYTE *)v5 + 113);
  *(_DWORD *)&self->_has |= 0x20u;
  int v26 = *((_DWORD *)v5 + 32);
  if ((v26 & 0x80000) == 0)
  {
LABEL_51:
    if ((v26 & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_60;
  }

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (CSDMessagingConversationMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)messagesGroupUUIDString
{
  return self->_messagesGroupUUIDString;
}

- (void)setMessagesGroupUUIDString:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (BOOL)isMomentsAvailable
{
  return self->_isMomentsAvailable;
}

- (CSDMessagingConversationActivitySession)activitySession
{
  return self->_activitySession;
}

- (void)setActivitySession:(id)a3
{
}

- (BOOL)video
{
  return self->_video;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_isScreenSharingAvailable;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSMutableArray)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (BOOL)isPersonaAvailable
{
  return self->_isPersonaAvailable;
}

- (NSMutableArray)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (BOOL)isLightweight
{
  return self->_isLightweight;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_isGondolaCallingAvailable;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (unsigned)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_isGFTDowngradeToOneToOneAvailable;
}

- (CSDMessagingConversationParticipantAssociation)participantAssociation
{
  return self->_participantAssociation;
}

- (void)setParticipantAssociation:(id)a3
{
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_isUPlusNDowngradeAvailable;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (BOOL)isUPlusOneScreenSharingAvailable
{
  return self->_isUPlusOneScreenSharingAvailable;
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

- (CSDMessagingScreenShareContext)screenSharingRequest
{
  return self->_screenSharingRequest;
}

- (void)setScreenSharingRequest:(id)a3
{
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_isUPlusOneVisionToVisionAvailable;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_isPhotosSharePlayAvailable;
}

- (void).cxx_destruct
{
}

- (id)allTUConversationMembers
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext members](self, "members"));
  id v4 = (char *)[v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext lightweightMembers](self, "lightweightMembers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  &v4[(void)[v5 count]]));

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext members](self, "members"));
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)v11) tuConversationMember]);
        if (v12) {
          [v6 addObject:v12];
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v9);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext lightweightMembers]( self,  "lightweightMembers",  0LL));
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) tuConversationMember]);
        if (v18) {
          [v6 addObject:v18];
        }

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v15);
  }

  id v19 = [v6 copy];
  return v19;
}

- (NSSet)tuConversationMembers
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext members](self, "members"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext allTUConversationMembers]( self,  "allTUConversationMembers"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];

  return (NSSet *)v11;
}

- (void)setTuConversationMembers:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        unsigned int v10 = [v9 isLightweightMember];
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v9));
        if (v10) {
          -[CSDMessagingConversationParticipantDidJoinContext addLightweightMembers:]( self,  "addLightweightMembers:",  v11);
        }
        else {
          -[CSDMessagingConversationParticipantDidJoinContext addMembers:](self, "addMembers:", v11);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }
}

- (NSSet)otherInvitedTUHandles
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext otherInvitedHandles](self, "otherInvitedHandles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext otherInvitedHandles]( self,  "otherInvitedHandles",  0LL));
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
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) tuHandle]);
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

- (void)setOtherInvitedTUHandles:(id)a3
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
        -[CSDMessagingConversationParticipantDidJoinContext addOtherInvitedHandles:]( self,  "addOtherInvitedHandles:",  v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (NSSet)tuLightweightMembers
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext lightweightMembers](self, "lightweightMembers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext allTUConversationMembers]( self,  "allTUConversationMembers"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];

  return (NSSet *)v11;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext;
  id v3 = -[CSDMessagingConversationParticipantDidJoinContext description](&v10, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  uint64_t v6 = TULoggableStringForObject(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v7));

  return v8;
}

@end