@interface CSDMessagingConversationRelayMessage
+ (Class)activeParticipantsType;
+ (Class)remoteMembersType;
- (BOOL)hasAvMode;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasInitiator;
- (BOOL)hasLocalMember;
- (BOOL)hasLocallyCreated;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasReportData;
- (BOOL)hasState;
- (BOOL)hasType;
- (BOOL)hasUUIDString;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyCreated;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationMember)localMember;
- (CSDMessagingConversationRelayMessage)initWithConversation:(id)a3;
- (CSDMessagingConversationRelayMessage)initWithRemoteMembers:(id)a3;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingHandle)initiator;
- (NSMutableArray)activeParticipants;
- (NSMutableArray)remoteMembers;
- (NSSet)tuConversationMembers;
- (NSSet)tuConversationParticipants;
- (NSString)groupUUIDString;
- (NSString)messagesGroupUUIDString;
- (NSString)uUIDString;
- (id)activeParticipantsAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteMembersAtIndex:(unint64_t)a3;
- (id)stateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)avMode;
- (int)state;
- (int)type;
- (int64_t)relayType;
- (int64_t)tuState;
- (unint64_t)activeParticipantsCount;
- (unint64_t)hash;
- (unint64_t)remoteMembersCount;
- (unint64_t)tuAVMode;
- (unsigned)version;
- (void)addActiveParticipants:(id)a3;
- (void)addRemoteMembers:(id)a3;
- (void)clearActiveParticipants;
- (void)clearRemoteMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveParticipants:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationMembers:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasLocallyCreated:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInitiator:(id)a3;
- (void)setLocalMember:(id)a3;
- (void)setLocallyCreated:(BOOL)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setState:(int)a3;
- (void)setStateforTUState:(int64_t)a3;
- (void)setType:(int)a3;
- (void)setUUIDString:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationRelayMessage

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D9538[a3];
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConversationCreated"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"ConversationChanged"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ConversationRemoved"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)state
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D9550[a3];
  }
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConversationStateWaiting"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"ConversationStatePreparing"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"ConversationStateJoining"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"ConversationStateJoined"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"ConversationStateLeaving"])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUUIDString
{
  return self->_uUIDString != 0LL;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0LL;
}

- (BOOL)hasMessagesGroupUUIDString
{
  return self->_messagesGroupUUIDString != 0LL;
}

- (void)setLocallyCreated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locallyCreated = a3;
}

- (void)setHasLocallyCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocallyCreated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasInitiator
{
  return self->_initiator != 0LL;
}

- (BOOL)hasLocalMember
{
  return self->_localMember != 0LL;
}

- (void)clearRemoteMembers
{
}

- (void)addRemoteMembers:(id)a3
{
  id v4 = a3;
  remoteMembers = self->_remoteMembers;
  id v8 = v4;
  if (!remoteMembers)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_remoteMembers;
    self->_remoteMembers = v6;

    id v4 = v8;
    remoteMembers = self->_remoteMembers;
  }

  -[NSMutableArray addObject:](remoteMembers, "addObject:", v4);
}

- (unint64_t)remoteMembersCount
{
  return (unint64_t)-[NSMutableArray count](self->_remoteMembers, "count");
}

- (id)remoteMembersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_remoteMembers, "objectAtIndex:", a3);
}

+ (Class)remoteMembersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationMember, a2);
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
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_activeParticipants;
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

- (int)avMode
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D9578[a3];
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

- (BOOL)hasReportData
{
  return self->_reportData != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationRelayMessage;
  id v3 = -[CSDMessagingConversationRelayMessage description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  uint64_t type = self->_type;
  if (type >= 3) {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
  }
  else {
    v7 = off_1003D9538[type];
  }
  [v3 setObject:v7 forKey:@"type"];

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    uint64_t state = self->_state;
    if (state >= 5) {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_state));
    }
    else {
      v9 = off_1003D9550[state];
    }
    [v3 setObject:v9 forKey:@"state"];
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000B8644((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(v5, self->_type, 2LL);
  if ((*(_BYTE *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field(v5, self->_state, 3LL);
LABEL_5:
  uUIDString = self->_uUIDString;
  if (uUIDString) {
    PBDataWriterWriteStringField(v5, uUIDString, 4LL);
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    PBDataWriterWriteStringField(v5, groupUUIDString, 5LL);
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    PBDataWriterWriteStringField(v5, messagesGroupUUIDString, 6LL);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_locallyCreated, 7LL);
  }
  initiator = self->_initiator;
  if (initiator) {
    PBDataWriterWriteSubmessage(v5, initiator, 8LL);
  }
  localMember = self->_localMember;
  if (localMember) {
    PBDataWriterWriteSubmessage(v5, localMember, 9LL);
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v12 = self->_remoteMembers;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v27 + 1) + 8LL * (void)i), 10LL);
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    }

    while (v14);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v17 = self->_activeParticipants;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v23 + 1) + 8LL * (void)j), 11LL);
      }

      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    }

    while (v19);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_avMode, 12LL);
  }
  reportData = self->_reportData;
  if (reportData) {
    PBDataWriterWriteSubmessage(v5, reportData, 13LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[22] = self->_version;
    *((_BYTE *)v4 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v4[19] = self->_type;
  *((_BYTE *)v4 + 96) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[18] = self->_state;
    *((_BYTE *)v4 + 96) |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[22] = self->_version;
    *((_BYTE *)v5 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  v5[19] = self->_type;
  *((_BYTE *)v5 + 96) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[18] = self->_state;
    *((_BYTE *)v5 + 96) |= 2u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_version != *((_DWORD *)v4 + 22)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_46;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_type != *((_DWORD *)v4 + 19)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_46;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_state != *((_DWORD *)v4 + 18)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_46;
  }

  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((void *)v4 + 10)
    && !-[NSString isEqual:](uUIDString, "isEqual:"))
  {
    goto LABEL_46;
  }

  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 3))
  {
  }

  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 6))
  {
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x10) != 0)
    {
      if (self->_locallyCreated)
      {
        if (!*((_BYTE *)v4 + 92)) {
          goto LABEL_46;
        }
        goto LABEL_31;
      }

      if (!*((_BYTE *)v4 + 92)) {
        goto LABEL_31;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    uint64_t v15 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v15 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = 2654435761LL * self->_type;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v13 = 2654435761LL * self->_state;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((_BYTE *)v4 + 96);
  if ((v6 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 8u;
    char v6 = *((_BYTE *)v4 + 96);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 96) & 4) == 0)
  {
    goto LABEL_3;
  }

  self->_uint64_t type = *((_DWORD *)v4 + 19);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t state = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 2u;
  }

- (unsigned)version
{
  return self->_version;
}

- (NSString)uUIDString
{
  return self->_uUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (NSString)messagesGroupUUIDString
{
  return self->_messagesGroupUUIDString;
}

- (void)setMessagesGroupUUIDString:(id)a3
{
}

- (BOOL)locallyCreated
{
  return self->_locallyCreated;
}

- (CSDMessagingHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (CSDMessagingConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
}

- (NSMutableArray)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (NSMutableArray)activeParticipants
{
  return self->_activeParticipants;
}

- (void)setActiveParticipants:(id)a3
{
}

- (CSDMessagingConversationReport)reportData
{
  return self->_reportData;
}

- (void)setReportData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (CSDMessagingConversationRelayMessage)initWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
  char v6 = -[CSDMessagingConversationRelayMessage initWithRemoteMembers:](self, "initWithRemoteMembers:", v5);

  -[CSDMessagingConversationRelayMessage setState:](v6, "setState:", [v4 state]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  -[CSDMessagingConversationRelayMessage setUUIDString:](v6, "setUUIDString:", v8);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 groupUUID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  -[CSDMessagingConversationRelayMessage setGroupUUIDString:](v6, "setGroupUUIDString:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 messagesGroupUUID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  -[CSDMessagingConversationRelayMessage setMessagesGroupUUIDString:](v6, "setMessagesGroupUUIDString:", v12);

  -[CSDMessagingConversationRelayMessage setLocallyCreated:]( v6,  "setLocallyCreated:",  [v4 isLocallyCreated]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 initiator]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v13));
  -[CSDMessagingConversationRelayMessage setInitiator:](v6, "setInitiator:", v14);

  uint64_t v15 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationReport);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 report]);
  id v17 = -[CSDMessagingConversationReport initWithTUConversationReport:](v15, "initWithTUConversationReport:", v16);
  -[CSDMessagingConversationRelayMessage setReportData:](v6, "setReportData:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v18));
  -[CSDMessagingConversationRelayMessage setLocalMember:](v6, "setLocalMember:", v19);

  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
  id v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      __int128 v25 = 0LL;
      do
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)v25)));
        -[NSMutableArray addObject:](v20, "addObject:", v26);

        __int128 v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v23);
  }

  -[CSDMessagingConversationRelayMessage setRemoteMembers:](v6, "setRemoteMembers:", v20);
  __int128 v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeRemoteParticipants", 0));
  id v29 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      v32 = 0LL;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithTUConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithTUConversationParticipant:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)v32)));
        -[NSMutableArray addObject:](v27, "addObject:", v33);

        v32 = (char *)v32 + 1;
      }

      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }

    while (v30);
  }

  -[CSDMessagingConversationRelayMessage setActiveParticipants:](v6, "setActiveParticipants:", v27);
  -[CSDMessagingConversationRelayMessage setAvMode:](v6, "setAvMode:", [v4 avMode]);

  return v6;
}

- (CSDMessagingConversationRelayMessage)initWithRemoteMembers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationRelayMessage;
  id v5 = -[CSDMessagingConversationRelayMessage init](&v8, "init");
  if (v5)
  {
    char v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[CSDMessagingConversationRelayMessage setRemoteMembers:](v5, "setRemoteMembers:", v6);

    -[CSDMessagingConversationRelayMessage setConversationMembers:](v5, "setConversationMembers:", v4);
  }

  return v5;
}

- (NSSet)tuConversationMembers
{
  NSUInteger v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage remoteMembers](self, "remoteMembers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) tuConversationMember]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  return (NSSet *)v10;
}

- (NSSet)tuConversationParticipants
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage activeParticipants](self, "activeParticipants", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) csdConversationParticipant]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tuConversationParticipant]);

        [v3 addObject:v10];
        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  id v11 = [v3 copy];
  return (NSSet *)v11;
}

- (void)setConversationMembers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage remoteMembers](self, "remoteMembers"));

  if (v5)
  {
    id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage remoteMembers](self, "remoteMembers"));
    -[NSMutableArray removeAllObjects](v6, "removeAllObjects");
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[CSDMessagingConversationRelayMessage setRemoteMembers:](self, "setRemoteMembers:", v6);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationRelayMessage remoteMembers](self, "remoteMembers", (void)v15));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v12));
        [v13 addObject:v14];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (void)setStateforTUState:(int64_t)a3
{
  uint64_t v5 = 1LL;
  switch(a3)
  {
    case 0LL:
      -[CSDMessagingConversationRelayMessage setState:](self, "setState:", 0LL);
      uint64_t v5 = 1LL;
      goto LABEL_6;
    case 1LL:
      goto LABEL_6;
    case 2LL:
      uint64_t v5 = 2LL;
      goto LABEL_6;
    case 3LL:
      uint64_t v5 = 3LL;
      goto LABEL_6;
    case 4LL:
      uint64_t v5 = 4LL;
LABEL_6:
      -[CSDMessagingConversationRelayMessage setState:](self, "setState:", v5);
      break;
    default:
      return;
  }

- (int64_t)tuState
{
  uint64_t v2 = -[CSDMessagingConversationRelayMessage state](self, "state") - 1;
  else {
    return 0LL;
  }
}

- (unint64_t)tuAVMode
{
  unsigned int v2 = -[CSDMessagingConversationRelayMessage avMode](self, "avMode");
  if (v2 == 2) {
    return 2LL;
  }
  else {
    return v2 == 1;
  }
}

- (int64_t)relayType
{
  unsigned int v2 = -[CSDMessagingConversationRelayMessage type](self, "type");
  if (v2 == 1) {
    return 2LL;
  }
  else {
    return v2 == 2;
  }
}

@end