@interface CSDMessagingConversationMessage
+ (Class)activeLightweightParticipantsType;
+ (Class)activeParticipantsType;
+ (Class)activitySessionsType;
+ (Class)addedMembersType;
+ (Class)invitationPreferencesType;
+ (Class)lightweightMembersType;
+ (Class)removedMembersType;
- (BOOL)constitutesLetMeInApproval;
- (BOOL)guestModeEnabled;
- (BOOL)hasAvMode;
- (BOOL)hasConversationGroupUUIDString;
- (BOOL)hasDisconnectedReason;
- (BOOL)hasEnclosedEncryptedType;
- (BOOL)hasEncryptedMessage;
- (BOOL)hasGuestModeEnabled;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasIsLetMeInApproved;
- (BOOL)hasJoinedMetadata;
- (BOOL)hasLetMeInDelegationHandle;
- (BOOL)hasLetMeInDelegationUUID;
- (BOOL)hasLink;
- (BOOL)hasNickname;
- (BOOL)hasPresentationMode;
- (BOOL)hasProtoUpgradeSessionUUID;
- (BOOL)hasReportData;
- (BOOL)hasRequestBlobRecoveryOptions;
- (BOOL)hasScreenShareContext;
- (BOOL)hasShouldSuppressInCallUI;
- (BOOL)hasStagedActivitySession;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLetMeInApproved;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuppressInCallUI;
- (CSDMessagingConversationActivitySession)stagedActivitySession;
- (CSDMessagingConversationJoinedMetadata)joinedMetadata;
- (CSDMessagingConversationLink)link;
- (CSDMessagingConversationMessage)initWithEncryptedMessage:(id)a3 enclosedType:(int)a4 link:(id)a5;
- (CSDMessagingConversationMessage)initWithType:(int)a3 groupUUID:(id)a4 link:(id)a5;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingEncryptedConversationMessage)encryptedMessage;
- (CSDMessagingScreenShareContext)screenShareContext;
- (NSMutableArray)activeLightweightParticipants;
- (NSMutableArray)activeParticipants;
- (NSMutableArray)activitySessions;
- (NSMutableArray)addedMembers;
- (NSMutableArray)invitationPreferences;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)removedMembers;
- (NSSet)tuInvitationPreferences;
- (NSString)conversationGroupUUIDString;
- (NSString)highlightIdentifier;
- (NSString)letMeInDelegationHandle;
- (NSString)letMeInDelegationUUID;
- (NSString)nickname;
- (NSString)protoUpgradeSessionUUID;
- (NSUUID)conversationGroupUUID;
- (TUConversationLink)tuConversationLink;
- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3;
- (id)activeParticipantsAtIndex:(unint64_t)a3;
- (id)activitySessionsAtIndex:(unint64_t)a3;
- (id)addedMembersAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enclosedEncryptedTypeAsString:(int)a3;
- (id)invitationPreferencesAtIndex:(unint64_t)a3;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)presentationModeAsString:(int)a3;
- (id)removedMembersAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsEnclosedEncryptedType:(id)a3;
- (int)StringAsPresentationMode:(id)a3;
- (int)StringAsType:(id)a3;
- (int)avMode;
- (int)enclosedEncryptedType;
- (int)presentationMode;
- (int)requestBlobRecoveryOptions;
- (int)type;
- (unint64_t)activeLightweightParticipantsCount;
- (unint64_t)activeParticipantsCount;
- (unint64_t)activitySessionsCount;
- (unint64_t)addedMembersCount;
- (unint64_t)hash;
- (unint64_t)invitationPreferencesCount;
- (unint64_t)lightweightMembersCount;
- (unint64_t)removedMembersCount;
- (unint64_t)resolvedPresentationMode;
- (unsigned)disconnectedReason;
- (unsigned)version;
- (void)addActiveLightweightParticipants:(id)a3;
- (void)addActiveParticipants:(id)a3;
- (void)addActivitySessions:(id)a3;
- (void)addAddedMembers:(id)a3;
- (void)addInvitationPreferences:(id)a3;
- (void)addLightweightMembers:(id)a3;
- (void)addRemovedMembers:(id)a3;
- (void)clearActiveLightweightParticipants;
- (void)clearActiveParticipants;
- (void)clearActivitySessions;
- (void)clearAddedMembers;
- (void)clearInvitationPreferences;
- (void)clearLightweightMembers;
- (void)clearRemovedMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveLightweightParticipants:(id)a3;
- (void)setActiveParticipants:(id)a3;
- (void)setActivitySessions:(id)a3;
- (void)setAddedMembers:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationGroupUUID:(id)a3;
- (void)setConversationGroupUUIDString:(id)a3;
- (void)setDisconnectedReason:(unsigned int)a3;
- (void)setEnclosedEncryptedType:(int)a3;
- (void)setEncryptedMessage:(id)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasDisconnectedReason:(BOOL)a3;
- (void)setHasEnclosedEncryptedType:(BOOL)a3;
- (void)setHasGuestModeEnabled:(BOOL)a3;
- (void)setHasIsLetMeInApproved:(BOOL)a3;
- (void)setHasPresentationMode:(BOOL)a3;
- (void)setHasRequestBlobRecoveryOptions:(BOOL)a3;
- (void)setHasShouldSuppressInCallUI:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setIsLetMeInApproved:(BOOL)a3;
- (void)setJoinedMetadata:(id)a3;
- (void)setLetMeInDelegationHandle:(id)a3;
- (void)setLetMeInDelegationUUID:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPresentationMode:(int)a3;
- (void)setProtoUpgradeSessionUUID:(id)a3;
- (void)setRemovedMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setRequestBlobRecoveryOptions:(int)a3;
- (void)setScreenShareContext:(id)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setTUInvitationPreferences:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationMessage

- (CSDMessagingConversationMessage)initWithType:(int)a3 groupUUID:(id)a4 link:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = -[CSDMessagingConversationMessage init](self, "init");
  -[CSDMessagingConversationMessage setType:](v10, "setType:", v6);
  if (v8) {
    -[CSDMessagingConversationMessage setConversationGroupUUID:](v10, "setConversationGroupUUID:", v8);
  }
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v9,  1LL));
    -[CSDMessagingConversationMessage setLink:](v10, "setLink:", v11);
  }

  return v10;
}

- (CSDMessagingConversationMessage)initWithEncryptedMessage:(id)a3 enclosedType:(int)a4 link:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = -[CSDMessagingConversationMessage init](self, "init");
  -[CSDMessagingConversationMessage setType:](v10, "setType:", 13LL);
  -[CSDMessagingConversationMessage setEncryptedMessage:](v10, "setEncryptedMessage:", v9);

  -[CSDMessagingConversationMessage setEnclosedEncryptedType:](v10, "setEnclosedEncryptedType:", v5);
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v8,  0LL));
    -[CSDMessagingConversationMessage setLink:](v10, "setLink:", v11);
  }

  return v10;
}

- (BOOL)constitutesLetMeInApproval
{
  if (-[CSDMessagingConversationMessage hasType](self, "hasType")
    && -[CSDMessagingConversationMessage type](self, "type") == 16
    && -[CSDMessagingConversationMessage hasIsLetMeInApproved](self, "hasIsLetMeInApproved"))
  {
    return -[CSDMessagingConversationMessage isLetMeInApproved](self, "isLetMeInApproved");
  }

  else
  {
    return 0;
  }

- (TUConversationLink)tuConversationLink
{
  if (-[CSDMessagingConversationMessage hasLink](self, "hasLink"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](self, "link"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuConversationLink]);
  }

  else
  {
    v4 = 0LL;
  }

  return (TUConversationLink *)v4;
}

- (unint64_t)resolvedPresentationMode
{
  if (!-[CSDMessagingConversationMessage hasPresentationMode](self, "hasPresentationMode")) {
    return -[CSDMessagingConversationMessage avMode](self, "avMode") == 0;
  }
  unsigned int v3 = -[CSDMessagingConversationMessage presentationMode](self, "presentationMode");
  if (v3 == 1) {
    return 1LL;
  }
  else {
    return 2LL * (v3 == 2);
  }
}

- (NSSet)tuInvitationPreferences
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage invitationPreferences](self, "invitationPreferences", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) tuInvitationPreference]);
        if (v9) {
          [v3 addObject:v9];
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = [v3 copy];
  return (NSSet *)v10;
}

- (NSUUID)conversationGroupUUID
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage conversationGroupUUIDString](self, "conversationGroupUUIDString"));
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage conversationGroupUUIDString](self, "conversationGroupUUIDString"));
    id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setConversationGroupUUID:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[CSDMessagingConversationMessage setConversationGroupUUIDString:](self, "setConversationGroupUUIDString:", v4);
}

- (void)setTUInvitationPreferences:(id)a3
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
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationInvitationPreference invitationPreferenceWithTUConversationInvitationPreference:]( &OBJC_CLASS___CSDMessagingConversationInvitationPreference,  "invitationPreferenceWithTUConversationInvitationPreference:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8)));
        -[CSDMessagingConversationMessage addInvitationPreferences:](self, "addInvitationPreferences:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)type
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  else {
    __int16 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Invitation"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Upgrade"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"AddMember"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"BlobRecoveryRequest"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"BlobRecoveryResponse"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"RespondedElsewhere"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"AddActivitySession"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"Decline"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"LetMeInRequest"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"LinkCreated"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"NicknameUpdated"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"EncryptedConversationMessage"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"LetMeInDelegation"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"LetMeInDelegationResponse"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"LetMeInResponse"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"RemoveMember"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"RemoveActivitySession"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"RequestVideoUpgrade"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"UpdateActivity"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"LinkInvalidated"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"AddLightweightMember"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"LinkChanged"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"UpdateActivityImage"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"GuestModeUpdated"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"Endorse"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"AddHighlight"])
  {
    int v4 = 30;
  }

  else if ([v3 isEqualToString:@"RemoveHighlight"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"UpdateJoinedMetadata"])
  {
    int v4 = 32;
  }

  else if ([v3 isEqualToString:@"ParticipantUpdated"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"RegisterMessagesGroupUUID"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"ScreenShareRequest"])
  {
    int v4 = 35;
  }

  else if ([v3 isEqualToString:@"ScreenShareResponse"])
  {
    int v4 = 36;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_shouldSuppressInCallUI = a3;
}

- (void)setHasShouldSuppressInCallUI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasShouldSuppressInCallUI
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearActiveParticipants
{
}

- (void)addActiveParticipants:(id)a3
{
  id v4 = a3;
  activeParticipants = self->_activeParticipants;
  id v8 = v4;
  if (!activeParticipants)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_activeParticipants;
    self->_activeParticipants = v6;

    id v4 = v8;
    activeParticipants = self->_activeParticipants;
  }

  -[NSMutableArray addObject:](activeParticipants, "addObject:", v4);
}

- (unint64_t)activeParticipantsCount
{
  return (unint64_t)-[NSMutableArray count](self->_activeParticipants, "count");
}

- (id)activeParticipantsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_activeParticipants, "objectAtIndex:", a3);
}

+ (Class)activeParticipantsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationParticipant, a2);
}

- (BOOL)hasConversationGroupUUIDString
{
  return self->_conversationGroupUUIDString != 0LL;
}

- (void)clearAddedMembers
{
}

- (void)addAddedMembers:(id)a3
{
  id v4 = a3;
  addedMembers = self->_addedMembers;
  id v8 = v4;
  if (!addedMembers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_addedMembers;
    self->_addedMembers = v6;

    id v4 = v8;
    addedMembers = self->_addedMembers;
  }

  -[NSMutableArray addObject:](addedMembers, "addObject:", v4);
}

- (unint64_t)addedMembersCount
{
  return (unint64_t)-[NSMutableArray count](self->_addedMembers, "count");
}

- (id)addedMembersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_addedMembers, "objectAtIndex:", a3);
}

+ (Class)addedMembersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
}

- (void)setDisconnectedReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_disconnectedReason = a3;
}

- (void)setHasDisconnectedReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisconnectedReason
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasProtoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID != 0LL;
}

- (void)clearActivitySessions
{
}

- (void)addActivitySessions:(id)a3
{
  id v4 = a3;
  activitySessions = self->_activitySessions;
  id v8 = v4;
  if (!activitySessions)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_activitySessions;
    self->_activitySessions = v6;

    id v4 = v8;
    activitySessions = self->_activitySessions;
  }

  -[NSMutableArray addObject:](activitySessions, "addObject:", v4);
}

- (unint64_t)activitySessionsCount
{
  return (unint64_t)-[NSMutableArray count](self->_activitySessions, "count");
}

- (id)activitySessionsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_activitySessions, "objectAtIndex:", a3);
}

+ (Class)activitySessionsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationActivitySession, a2);
}

- (BOOL)hasNickname
{
  return self->_nickname != 0LL;
}

- (BOOL)hasLink
{
  return self->_link != 0LL;
}

- (BOOL)hasReportData
{
  return self->_reportData != 0LL;
}

- (void)setIsLetMeInApproved:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isLetMeInApproved = a3;
}

- (void)setHasIsLetMeInApproved:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsLetMeInApproved
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasEncryptedMessage
{
  return self->_encryptedMessage != 0LL;
}

- (BOOL)hasLetMeInDelegationHandle
{
  return self->_letMeInDelegationHandle != 0LL;
}

- (BOOL)hasLetMeInDelegationUUID
{
  return self->_letMeInDelegationUUID != 0LL;
}

- (int)enclosedEncryptedType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_enclosedEncryptedType;
  }
  else {
    return 0;
  }
}

- (void)setEnclosedEncryptedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_enclosedEncryptedType = a3;
}

- (void)setHasEnclosedEncryptedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEnclosedEncryptedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)enclosedEncryptedTypeAsString:(int)a3
{
  else {
    __int16 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsEnclosedEncryptedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Invitation"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Upgrade"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"AddMember"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"BlobRecoveryRequest"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"BlobRecoveryResponse"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"RespondedElsewhere"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"AddActivitySession"])
  {
    int v4 = 8;
  }

  else if ([v3 isEqualToString:@"Decline"])
  {
    int v4 = 9;
  }

  else if ([v3 isEqualToString:@"LetMeInRequest"])
  {
    int v4 = 10;
  }

  else if ([v3 isEqualToString:@"LinkCreated"])
  {
    int v4 = 11;
  }

  else if ([v3 isEqualToString:@"NicknameUpdated"])
  {
    int v4 = 12;
  }

  else if ([v3 isEqualToString:@"EncryptedConversationMessage"])
  {
    int v4 = 13;
  }

  else if ([v3 isEqualToString:@"LetMeInDelegation"])
  {
    int v4 = 14;
  }

  else if ([v3 isEqualToString:@"LetMeInDelegationResponse"])
  {
    int v4 = 15;
  }

  else if ([v3 isEqualToString:@"LetMeInResponse"])
  {
    int v4 = 16;
  }

  else if ([v3 isEqualToString:@"RemoveMember"])
  {
    int v4 = 19;
  }

  else if ([v3 isEqualToString:@"RemoveActivitySession"])
  {
    int v4 = 21;
  }

  else if ([v3 isEqualToString:@"RequestVideoUpgrade"])
  {
    int v4 = 22;
  }

  else if ([v3 isEqualToString:@"UpdateActivity"])
  {
    int v4 = 23;
  }

  else if ([v3 isEqualToString:@"LinkInvalidated"])
  {
    int v4 = 24;
  }

  else if ([v3 isEqualToString:@"AddLightweightMember"])
  {
    int v4 = 25;
  }

  else if ([v3 isEqualToString:@"LinkChanged"])
  {
    int v4 = 26;
  }

  else if ([v3 isEqualToString:@"UpdateActivityImage"])
  {
    int v4 = 27;
  }

  else if ([v3 isEqualToString:@"GuestModeUpdated"])
  {
    int v4 = 28;
  }

  else if ([v3 isEqualToString:@"Endorse"])
  {
    int v4 = 29;
  }

  else if ([v3 isEqualToString:@"AddHighlight"])
  {
    int v4 = 30;
  }

  else if ([v3 isEqualToString:@"RemoveHighlight"])
  {
    int v4 = 31;
  }

  else if ([v3 isEqualToString:@"UpdateJoinedMetadata"])
  {
    int v4 = 32;
  }

  else if ([v3 isEqualToString:@"ParticipantUpdated"])
  {
    int v4 = 33;
  }

  else if ([v3 isEqualToString:@"RegisterMessagesGroupUUID"])
  {
    int v4 = 34;
  }

  else if ([v3 isEqualToString:@"ScreenShareRequest"])
  {
    int v4 = 35;
  }

  else if ([v3 isEqualToString:@"ScreenShareResponse"])
  {
    int v4 = 36;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearInvitationPreferences
{
}

- (void)addInvitationPreferences:(id)a3
{
  id v4 = a3;
  invitationPreferences = self->_invitationPreferences;
  id v8 = v4;
  if (!invitationPreferences)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_invitationPreferences;
    self->_invitationPreferences = v6;

    id v4 = v8;
    invitationPreferences = self->_invitationPreferences;
  }

  -[NSMutableArray addObject:](invitationPreferences, "addObject:", v4);
}

- (unint64_t)invitationPreferencesCount
{
  return (unint64_t)-[NSMutableArray count](self->_invitationPreferences, "count");
}

- (id)invitationPreferencesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_invitationPreferences, "objectAtIndex:", a3);
}

+ (Class)invitationPreferencesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationInvitationPreference, a2);
}

- (void)clearRemovedMembers
{
}

- (void)addRemovedMembers:(id)a3
{
  id v4 = a3;
  removedMembers = self->_removedMembers;
  id v8 = v4;
  if (!removedMembers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_removedMembers;
    self->_removedMembers = v6;

    id v4 = v8;
    removedMembers = self->_removedMembers;
  }

  -[NSMutableArray addObject:](removedMembers, "addObject:", v4);
}

- (unint64_t)removedMembersCount
{
  return (unint64_t)-[NSMutableArray count](self->_removedMembers, "count");
}

- (id)removedMembersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_removedMembers, "objectAtIndex:", a3);
}

+ (Class)removedMembersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
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
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_lightweightMembers;
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

- (void)clearActiveLightweightParticipants
{
}

- (void)addActiveLightweightParticipants:(id)a3
{
  id v4 = a3;
  activeLightweightParticipants = self->_activeLightweightParticipants;
  id v8 = v4;
  if (!activeLightweightParticipants)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_activeLightweightParticipants;
    self->_activeLightweightParticipants = v6;

    id v4 = v8;
    activeLightweightParticipants = self->_activeLightweightParticipants;
  }

  -[NSMutableArray addObject:](activeLightweightParticipants, "addObject:", v4);
}

- (unint64_t)activeLightweightParticipantsCount
{
  return (unint64_t)-[NSMutableArray count](self->_activeLightweightParticipants, "count");
}

- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_activeLightweightParticipants, "objectAtIndex:", a3);
}

+ (Class)activeLightweightParticipantsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationParticipant, a2);
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_guestModeEnabled = a3;
}

- (void)setHasGuestModeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGuestModeEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0LL;
}

- (BOOL)hasJoinedMetadata
{
  return self->_joinedMetadata != 0LL;
}

- (BOOL)hasStagedActivitySession
{
  return self->_stagedActivitySession != 0LL;
}

- (int)avMode
{
  if ((*(_WORD *)&self->_has & 1) != 0) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAvMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003DBAC0 + a3);
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

- (void)setRequestBlobRecoveryOptions:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestBlobRecoveryOptions = a3;
}

- (void)setHasRequestBlobRecoveryOptions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestBlobRecoveryOptions
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasScreenShareContext
{
  return self->_screenShareContext != 0LL;
}

- (int)presentationMode
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_presentationMode;
  }
  else {
    return 0;
  }
}

- (void)setPresentationMode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_presentationMode = a3;
}

- (void)setHasPresentationMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPresentationMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)presentationModeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003DBAD8 + a3);
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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationMessage;
  id v3 = -[CSDMessagingConversationMessage description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v42 forKey:@"version"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  int type = self->_type;
  else {
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
  }
  [v3 setObject:v44 forKey:@"type"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_shouldSuppressInCallUI));
    [v3 setObject:v5 forKey:@"shouldSuppressInCallUI"];
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10016C09C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(v5, self->_type, 2LL);
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField(v5, self->_shouldSuppressInCallUI, 3LL);
LABEL_5:
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  uint64_t v7 = self->_activeParticipants;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v79,  v89,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v80;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v80 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v79 + 1) + 8LL * (void)v11), 4LL);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v79,  v89,  16LL);
    }

    while (v9);
  }

  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString) {
    PBDataWriterWriteStringField(v5, conversationGroupUUIDString, 5LL);
  }
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v13 = self->_addedMembers;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v75,  v88,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v76;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v76 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v75 + 1) + 8LL * (void)v17), 6LL);
        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v75,  v88,  16LL);
    }

    while (v15);
  }

  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field(v5, self->_disconnectedReason, 7LL);
  }
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if (protoUpgradeSessionUUID) {
    PBDataWriterWriteStringField(v5, protoUpgradeSessionUUID, 8LL);
  }
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  v19 = self->_activitySessions;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v71,  v87,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v72;
    do
    {
      v23 = 0LL;
      do
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v71 + 1) + 8LL * (void)v23), 9LL);
        v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v71,  v87,  16LL);
    }

    while (v21);
  }

  nickname = self->_nickname;
  if (nickname) {
    PBDataWriterWriteStringField(v5, nickname, 10LL);
  }
  link = self->_link;
  if (link) {
    PBDataWriterWriteSubmessage(v5, link, 11LL);
  }
  reportData = self->_reportData;
  if (reportData) {
    PBDataWriterWriteSubmessage(v5, reportData, 12LL);
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isLetMeInApproved, 13LL);
  }
  encryptedMessage = self->_encryptedMessage;
  if (encryptedMessage) {
    PBDataWriterWriteSubmessage(v5, encryptedMessage, 14LL);
  }
  letMeInDelegationHandle = self->_letMeInDelegationHandle;
  if (letMeInDelegationHandle) {
    PBDataWriterWriteStringField(v5, letMeInDelegationHandle, 15LL);
  }
  letMeInDelegationUUID = self->_letMeInDelegationUUID;
  if (letMeInDelegationUUID) {
    PBDataWriterWriteStringField(v5, letMeInDelegationUUID, 16LL);
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_enclosedEncryptedType, 17LL);
  }
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  v30 = self->_invitationPreferences;
  id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v67,  v86,  16LL);
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v68;
    do
    {
      v34 = 0LL;
      do
      {
        if (*(void *)v68 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v67 + 1) + 8LL * (void)v34), 19LL);
        v34 = (char *)v34 + 1;
      }

      while (v32 != v34);
      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v67,  v86,  16LL);
    }

    while (v32);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v35 = self->_removedMembers;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v63,  v85,  16LL);
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v64;
    do
    {
      v39 = 0LL;
      do
      {
        if (*(void *)v64 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v63 + 1) + 8LL * (void)v39), 20LL);
        v39 = (char *)v39 + 1;
      }

      while (v37 != v39);
      id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v63,  v85,  16LL);
    }

    while (v37);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v40 = self->_lightweightMembers;
  id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v59,  v84,  16LL);
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v60;
    do
    {
      v44 = 0LL;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v59 + 1) + 8LL * (void)v44), 22LL);
        v44 = (char *)v44 + 1;
      }

      while (v42 != v44);
      id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v59,  v84,  16LL);
    }

    while (v42);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v45 = self->_activeLightweightParticipants;
  id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v55,  v83,  16LL);
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v56;
    do
    {
      uint64_t v49 = 0LL;
      do
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v55 + 1) + 8LL * (void)v49), 23LL);
        uint64_t v49 = (char *)v49 + 1;
      }

      while (v47 != v49);
      id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v55,  v83,  16LL);
    }

    while (v47);
  }

  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_guestModeEnabled, 24LL);
  }
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    PBDataWriterWriteStringField(v5, highlightIdentifier, 25LL);
  }
  joinedMetadata = self->_joinedMetadata;
  if (joinedMetadata) {
    PBDataWriterWriteSubmessage(v5, joinedMetadata, 26LL);
  }
  stagedActivitySession = self->_stagedActivitySession;
  if (stagedActivitySession) {
    PBDataWriterWriteSubmessage(v5, stagedActivitySession, 27LL);
  }
  __int16 v53 = (__int16)self->_has;
  if ((v53 & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_avMode, 28LL);
    __int16 v53 = (__int16)self->_has;
  }

  if ((v53 & 0x10) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_requestBlobRecoveryOptions, 29LL);
  }
  screenShareContext = self->_screenShareContext;
  if (screenShareContext) {
    PBDataWriterWriteSubmessage(v5, screenShareContext, 30LL);
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_presentationMode, 31LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    if ((has & 0x20) == 0) {
      goto LABEL_3;
    }
LABEL_73:
    v4[48] = self->_type;
    *((_WORD *)v4 + 102) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  v4[49] = self->_version;
  *((_WORD *)v4 + 102) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_73;
  }
LABEL_3:
  if ((has & 0x200) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 202) = self->_shouldSuppressInCallUI;
    *((_WORD *)v4 + 102) |= 0x200u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5[49] = self->_version;
    *((_WORD *)v5 + 102) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }

  v5[48] = self->_type;
  *((_WORD *)v5 + 102) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 202) = self->_shouldSuppressInCallUI;
    *((_WORD *)v5 + 102) |= 0x200u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 49)) {
      goto LABEL_100;
    }
  }

  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_100;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 48)) {
      goto LABEL_100;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_100;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0) {
      goto LABEL_100;
    }
    if (self->_shouldSuppressInCallUI)
    {
      if (!*((_BYTE *)v4 + 202)) {
        goto LABEL_100;
      }
    }

    else if (*((_BYTE *)v4 + 202))
    {
      goto LABEL_100;
    }
  }

  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_100;
  }

  activeParticipants = self->_activeParticipants;
  if ((unint64_t)activeParticipants | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](activeParticipants, "isEqual:"))
  {
    goto LABEL_100;
  }

  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if ((unint64_t)conversationGroupUUIDString | *((void *)v4 + 6))
  {
  }

  addedMembers = self->_addedMembers;
  if ((unint64_t)addedMembers | *((void *)v4 + 4))
  {
  }

  __int16 v11 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_disconnectedReason != *((_DWORD *)v4 + 14)) {
      goto LABEL_100;
    }
  }

  else if ((v11 & 2) != 0)
  {
    goto LABEL_100;
  }

  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if ((unint64_t)protoUpgradeSessionUUID | *((void *)v4 + 18)
    && !-[NSString isEqual:](protoUpgradeSessionUUID, "isEqual:"))
  {
    goto LABEL_100;
  }

  activitySessions = self->_activitySessions;
  if ((unint64_t)activitySessions | *((void *)v4 + 3))
  {
  }

  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 16))
  {
  }

  linuint64_t k = self->_link;
  if ((unint64_t)link | *((void *)v4 + 15))
  {
    if (!-[CSDMessagingConversationLink isEqual:](link, "isEqual:")) {
      goto LABEL_100;
    }
  }

  reportData = self->_reportData;
  if ((unint64_t)reportData | *((void *)v4 + 20))
  {
    if (!-[CSDMessagingConversationReport isEqual:](reportData, "isEqual:")) {
      goto LABEL_100;
    }
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0) {
      goto LABEL_100;
    }
    if (self->_isLetMeInApproved)
    {
      if (!*((_BYTE *)v4 + 201)) {
        goto LABEL_100;
      }
    }

    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_100;
    }
  }

  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_100;
  }

  encryptedMessage = self->_encryptedMessage;
  if ((unint64_t)encryptedMessage | *((void *)v4 + 8)
    && !-[CSDMessagingEncryptedConversationMessage isEqual:](encryptedMessage, "isEqual:"))
  {
    goto LABEL_100;
  }

  letMeInDelegationHandle = self->_letMeInDelegationHandle;
  if ((unint64_t)letMeInDelegationHandle | *((void *)v4 + 12))
  {
  }

  letMeInDelegationUUID = self->_letMeInDelegationUUID;
  if ((unint64_t)letMeInDelegationUUID | *((void *)v4 + 13))
  {
  }

  __int16 v20 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_enclosedEncryptedType != *((_DWORD *)v4 + 15)) {
      goto LABEL_100;
    }
  }

  else if ((v20 & 4) != 0)
  {
    goto LABEL_100;
  }

  invitationPreferences = self->_invitationPreferences;
  if ((unint64_t)invitationPreferences | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](invitationPreferences, "isEqual:"))
  {
    goto LABEL_100;
  }

  removedMembers = self->_removedMembers;
  if ((unint64_t)removedMembers | *((void *)v4 + 19))
  {
  }

  lightweightMembers = self->_lightweightMembers;
  if ((unint64_t)lightweightMembers | *((void *)v4 + 14))
  {
  }

  activeLightweightParticipants = self->_activeLightweightParticipants;
  if ((unint64_t)activeLightweightParticipants | *((void *)v4 + 1))
  {
  }

  __int16 v25 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0) {
      goto LABEL_100;
    }
    if (self->_guestModeEnabled)
    {
      if (!*((_BYTE *)v4 + 200)) {
        goto LABEL_100;
      }
    }

    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_100;
    }
  }

  else if ((v25 & 0x80) != 0)
  {
    goto LABEL_100;
  }

  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((void *)v4 + 9)
    && !-[NSString isEqual:](highlightIdentifier, "isEqual:"))
  {
    goto LABEL_100;
  }

  joinedMetadata = self->_joinedMetadata;
  if ((unint64_t)joinedMetadata | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingConversationJoinedMetadata isEqual:](joinedMetadata, "isEqual:")) {
      goto LABEL_100;
    }
  }

  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  if ((unint64_t)stagedActivitySession | *((void *)v4 + 23))
  {
    if (!-[CSDMessagingConversationActivitySession isEqual:](stagedActivitySession, "isEqual:")) {
      goto LABEL_100;
    }
  }

  __int16 v29 = (__int16)self->_has;
  __int16 v30 = *((_WORD *)v4 + 102);
  if ((v29 & 1) != 0)
  {
    if ((v30 & 1) == 0 || self->_avMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_100;
    }
  }

  else if ((v30 & 1) != 0)
  {
    goto LABEL_100;
  }

  if ((v29 & 0x10) != 0)
  {
    if ((v30 & 0x10) == 0 || self->_requestBlobRecoveryOptions != *((_DWORD *)v4 + 42)) {
      goto LABEL_100;
    }
  }

  else if ((v30 & 0x10) != 0)
  {
    goto LABEL_100;
  }

  screenShareContext = self->_screenShareContext;
  if ((unint64_t)screenShareContext | *((void *)v4 + 22))
  {
    if (-[CSDMessagingScreenShareContext isEqual:](screenShareContext, "isEqual:"))
    {
      __int16 v29 = (__int16)self->_has;
      goto LABEL_95;
    }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    uint64_t v34 = 0LL;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v33 = 0LL;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v34 = 2654435761LL * self->_version;
  if ((has & 0x20) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = 2654435761LL * self->_type;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761LL * self->_shouldSuppressInCallUI;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x40) != 0)
  {
    self->_versiouint64_t n = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 102);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }

  self->_int type = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
LABEL_4:
    self->_shouldSuppressInCallUI = *((_BYTE *)v4 + 202);
    *(_WORD *)&self->_has |= 0x200u;
  }

- (unsigned)version
{
  return self->_version;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (NSMutableArray)activeParticipants
{
  return self->_activeParticipants;
}

- (void)setActiveParticipants:(id)a3
{
}

- (NSString)conversationGroupUUIDString
{
  return self->_conversationGroupUUIDString;
}

- (void)setConversationGroupUUIDString:(id)a3
{
}

- (NSMutableArray)addedMembers
{
  return self->_addedMembers;
}

- (void)setAddedMembers:(id)a3
{
}

- (unsigned)disconnectedReason
{
  return self->_disconnectedReason;
}

- (NSString)protoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID;
}

- (void)setProtoUpgradeSessionUUID:(id)a3
{
}

- (NSMutableArray)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (CSDMessagingConversationReport)reportData
{
  return self->_reportData;
}

- (void)setReportData:(id)a3
{
}

- (BOOL)isLetMeInApproved
{
  return self->_isLetMeInApproved;
}

- (CSDMessagingEncryptedConversationMessage)encryptedMessage
{
  return self->_encryptedMessage;
}

- (void)setEncryptedMessage:(id)a3
{
}

- (NSString)letMeInDelegationHandle
{
  return self->_letMeInDelegationHandle;
}

- (void)setLetMeInDelegationHandle:(id)a3
{
}

- (NSString)letMeInDelegationUUID
{
  return self->_letMeInDelegationUUID;
}

- (void)setLetMeInDelegationUUID:(id)a3
{
}

- (NSMutableArray)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (NSMutableArray)removedMembers
{
  return self->_removedMembers;
}

- (void)setRemovedMembers:(id)a3
{
}

- (NSMutableArray)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (NSMutableArray)activeLightweightParticipants
{
  return self->_activeLightweightParticipants;
}

- (void)setActiveLightweightParticipants:(id)a3
{
}

- (BOOL)guestModeEnabled
{
  return self->_guestModeEnabled;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (CSDMessagingConversationJoinedMetadata)joinedMetadata
{
  return self->_joinedMetadata;
}

- (void)setJoinedMetadata:(id)a3
{
}

- (CSDMessagingConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (int)requestBlobRecoveryOptions
{
  return self->_requestBlobRecoveryOptions;
}

- (CSDMessagingScreenShareContext)screenShareContext
{
  return self->_screenShareContext;
}

- (void)setScreenShareContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end