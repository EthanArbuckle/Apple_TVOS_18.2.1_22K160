@interface CSDMessagingConversation
+ (Class)activeLightweightParticipantsType;
+ (Class)activeRemoteParticipantsType;
+ (Class)activitySessionsType;
+ (Class)lightweightMembersType;
+ (Class)otherInvitedHandlesType;
+ (Class)remoteMembersType;
- (BOOL)hasAvMode;
- (BOOL)hasConversationProviderIdentifier;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasInitiator;
- (BOOL)hasLink;
- (BOOL)hasLocalMember;
- (BOOL)hasLocallyCreated;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasReportData;
- (BOOL)hasStagedActivitySession;
- (BOOL)hasUUIDString;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyCreated;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivitySession)stagedActivitySession;
- (CSDMessagingConversationLink)link;
- (CSDMessagingConversationMember)localMember;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingHandle)initiator;
- (NSMutableArray)activeLightweightParticipants;
- (NSMutableArray)activeRemoteParticipants;
- (NSMutableArray)activitySessions;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)otherInvitedHandles;
- (NSMutableArray)remoteMembers;
- (NSString)conversationProviderIdentifier;
- (NSString)groupUUIDString;
- (NSString)highlightIdentifier;
- (NSString)messagesGroupUUIDString;
- (NSString)uUIDString;
- (TUConversationLink)tuConversationLink;
- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3;
- (id)activeRemoteParticipantsAtIndex:(unint64_t)a3;
- (id)activitySessionsAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)otherInvitedHandlesAtIndex:(unint64_t)a3;
- (id)remoteMembersAtIndex:(unint64_t)a3;
- (int)StringAsAvMode:(id)a3;
- (int)avMode;
- (unint64_t)activeLightweightParticipantsCount;
- (unint64_t)activeRemoteParticipantsCount;
- (unint64_t)activitySessionsCount;
- (unint64_t)hash;
- (unint64_t)lightweightMembersCount;
- (unint64_t)otherInvitedHandlesCount;
- (unint64_t)remoteMembersCount;
- (unsigned)version;
- (void)addActiveLightweightParticipants:(id)a3;
- (void)addActiveRemoteParticipants:(id)a3;
- (void)addActivitySessions:(id)a3;
- (void)addLightweightMembers:(id)a3;
- (void)addOtherInvitedHandles:(id)a3;
- (void)addRemoteMembers:(id)a3;
- (void)clearActiveLightweightParticipants;
- (void)clearActiveRemoteParticipants;
- (void)clearActivitySessions;
- (void)clearLightweightMembers;
- (void)clearOtherInvitedHandles;
- (void)clearRemoteMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveLightweightParticipants:(id)a3;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setActivitySessions:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationProviderIdentifier:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasLocallyCreated:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setLocalMember:(id)a3;
- (void)setLocallyCreated:(BOOL)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setUUIDString:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversation

- (TUConversationLink)tuConversationLink
{
  if (-[CSDMessagingConversation hasLink](self, "hasLink"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation link](self, "link"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuConversationLink]);
  }

  else
  {
    v4 = 0LL;
  }

  return (TUConversationLink *)v4;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  *(_BYTE *)&self->_has |= 4u;
  self->_locallyCreated = a3;
}

- (void)setHasLocallyCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocallyCreated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)clearActiveRemoteParticipants
{
}

- (void)addActiveRemoteParticipants:(id)a3
{
  id v4 = a3;
  activeRemoteParticipants = self->_activeRemoteParticipants;
  id v8 = v4;
  if (!activeRemoteParticipants)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_activeRemoteParticipants;
    self->_activeRemoteParticipants = v6;

    id v4 = v8;
    activeRemoteParticipants = self->_activeRemoteParticipants;
  }

  -[NSMutableArray addObject:](activeRemoteParticipants, "addObject:", v4);
}

- (unint64_t)activeRemoteParticipantsCount
{
  return (unint64_t)-[NSMutableArray count](self->_activeRemoteParticipants, "count");
}

- (id)activeRemoteParticipantsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_activeRemoteParticipants, "objectAtIndex:", a3);
}

+ (Class)activeRemoteParticipantsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationParticipant, a2);
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
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_activitySessions;
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

- (BOOL)hasLink
{
  return self->_link != 0LL;
}

- (BOOL)hasReportData
{
  return self->_reportData != 0LL;
}

- (BOOL)hasConversationProviderIdentifier
{
  return self->_conversationProviderIdentifier != 0LL;
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
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_activeLightweightParticipants;
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

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0LL;
}

- (BOOL)hasStagedActivitySession
{
  return self->_stagedActivitySession != 0LL;
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
    return *(&off_1003D9840 + a3);
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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversation;
  id v3 = -[CSDMessagingConversation description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  uUIDString = self->_uUIDString;
  if (uUIDString) {
    [v3 setObject:uUIDString forKey:@"UUIDString"];
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v3 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    [v3 setObject:messagesGroupUUIDString forKey:@"messagesGroupUUIDString"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_locallyCreated));
    [v3 setObject:v8 forKey:@"locallyCreated"];
  }

  initiator = self->_initiator;
  if (initiator)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](initiator, "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"initiator"];
  }

  localMember = self->_localMember;
  if (localMember)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember dictionaryRepresentation](localMember, "dictionaryRepresentation"));
    [v3 setObject:v12 forKey:@"localMember"];
  }

  if (-[NSMutableArray count](self->_remoteMembers, "count"))
  {
    v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_remoteMembers, "count"));
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    v14 = self->_remoteMembers;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v86,  v95,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v87;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v87 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v86 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v13, "addObject:", v19);
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v86,  v95,  16LL);
      }

      while (v16);
    }

    [v3 setObject:v13 forKey:@"remoteMembers"];
  }

  if (-[NSMutableArray count](self->_activeRemoteParticipants, "count"))
  {
    v20 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_activeRemoteParticipants, "count"));
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    v21 = self->_activeRemoteParticipants;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v82,  v94,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v83 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v82 + 1) + 8 * (void)j) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v20, "addObject:", v26);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v82,  v94,  16LL);
      }

      while (v23);
    }

    [v3 setObject:v20 forKey:@"activeRemoteParticipants"];
  }

  if (-[NSMutableArray count](self->_activitySessions, "count"))
  {
    v27 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_activitySessions, "count"));
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    v28 = self->_activitySessions;
    id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v78,  v93,  16LL);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v79;
      do
      {
        for (k = 0LL; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v79 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v78 + 1) + 8 * (void)k) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v27, "addObject:", v33);
        }

        id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v78,  v93,  16LL);
      }

      while (v30);
    }

    [v3 setObject:v27 forKey:@"activitySessions"];
  }

  link = self->_link;
  if (link)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink dictionaryRepresentation](link, "dictionaryRepresentation"));
    [v3 setObject:v35 forKey:@"link"];
  }

  reportData = self->_reportData;
  if (reportData)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationReport dictionaryRepresentation](reportData, "dictionaryRepresentation"));
    [v3 setObject:v37 forKey:@"reportData"];
  }

  conversationProviderIdentifier = self->_conversationProviderIdentifier;
  if (conversationProviderIdentifier) {
    [v3 setObject:conversationProviderIdentifier forKey:@"conversationProviderIdentifier"];
  }
  if (-[NSMutableArray count](self->_otherInvitedHandles, "count"))
  {
    v39 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_otherInvitedHandles, "count"));
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    v40 = self->_otherInvitedHandles;
    id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v74,  v92,  16LL);
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v75;
      do
      {
        for (m = 0LL; m != v42; m = (char *)m + 1)
        {
          if (*(void *)v75 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v74 + 1) + 8 * (void)m) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v39, "addObject:", v45);
        }

        id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v74,  v92,  16LL);
      }

      while (v42);
    }

    [v3 setObject:v39 forKey:@"otherInvitedHandles"];
  }

  if (-[NSMutableArray count](self->_lightweightMembers, "count"))
  {
    v46 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_lightweightMembers, "count"));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    v47 = self->_lightweightMembers;
    id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v70,  v91,  16LL);
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v71;
      do
      {
        for (n = 0LL; n != v49; n = (char *)n + 1)
        {
          if (*(void *)v71 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v70 + 1) + 8 * (void)n) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v46, "addObject:", v52);
        }

        id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v70,  v91,  16LL);
      }

      while (v49);
    }

    [v3 setObject:v46 forKey:@"lightweightMembers"];
  }

  if (-[NSMutableArray count](self->_activeLightweightParticipants, "count"))
  {
    v53 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_activeLightweightParticipants, "count"));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v54 = self->_activeLightweightParticipants;
    id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v66,  v90,  16LL);
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v67;
      do
      {
        for (ii = 0LL; ii != v56; ii = (char *)ii + 1)
        {
          if (*(void *)v67 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v66 + 1) + 8 * (void)ii) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v53, "addObject:", v59);
        }

        id v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v66,  v90,  16LL);
      }

      while (v56);
    }

    [v3 setObject:v53 forKey:@"activeLightweightParticipants"];
  }

  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    [v3 setObject:highlightIdentifier forKey:@"highlightIdentifier"];
  }
  stagedActivitySession = self->_stagedActivitySession;
  if (stagedActivitySession)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySession dictionaryRepresentation]( stagedActivitySession,  "dictionaryRepresentation"));
    [v3 setObject:v62 forKey:@"stagedActivitySession"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t avMode = self->_avMode;
    if (avMode >= 3) {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_avMode));
    }
    else {
      v64 = *(&off_1003D9840 + avMode);
    }
    [v3 setObject:v64 forKey:@"avMode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CC80C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
  }
  uUIDString = self->_uUIDString;
  if (uUIDString) {
    PBDataWriterWriteStringField(v5, uUIDString, 2LL);
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    PBDataWriterWriteStringField(v5, groupUUIDString, 3LL);
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    PBDataWriterWriteStringField(v5, messagesGroupUUIDString, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_locallyCreated, 5LL);
  }
  initiator = self->_initiator;
  if (initiator) {
    PBDataWriterWriteSubmessage(v5, initiator, 6LL);
  }
  localMember = self->_localMember;
  if (localMember) {
    PBDataWriterWriteSubmessage(v5, localMember, 7LL);
  }
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  v11 = self->_remoteMembers;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v66,  v75,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v67;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v66 + 1) + 8LL * (void)v15), 8LL);
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v66,  v75,  16LL);
    }

    while (v13);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v16 = self->_activeRemoteParticipants;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v62,  v74,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v63;
    do
    {
      v20 = 0LL;
      do
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v62 + 1) + 8LL * (void)v20), 9LL);
        v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v62,  v74,  16LL);
    }

    while (v18);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  v21 = self->_activitySessions;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v58,  v73,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v59;
    do
    {
      v25 = 0LL;
      do
      {
        if (*(void *)v59 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v58 + 1) + 8LL * (void)v25), 10LL);
        v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v58,  v73,  16LL);
    }

    while (v23);
  }

  link = self->_link;
  if (link) {
    PBDataWriterWriteSubmessage(v5, link, 11LL);
  }
  reportData = self->_reportData;
  if (reportData) {
    PBDataWriterWriteSubmessage(v5, reportData, 12LL);
  }
  conversationProviderIdentifier = self->_conversationProviderIdentifier;
  if (conversationProviderIdentifier) {
    PBDataWriterWriteStringField(v5, conversationProviderIdentifier, 14LL);
  }
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v29 = self->_otherInvitedHandles;
  id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v54,  v72,  16LL);
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      v33 = 0LL;
      do
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v54 + 1) + 8LL * (void)v33), 15LL);
        v33 = (char *)v33 + 1;
      }

      while (v31 != v33);
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v54,  v72,  16LL);
    }

    while (v31);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v34 = self->_lightweightMembers;
  id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v50,  v71,  16LL);
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      v38 = 0LL;
      do
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v50 + 1) + 8LL * (void)v38), 16LL);
        v38 = (char *)v38 + 1;
      }

      while (v36 != v38);
      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v50,  v71,  16LL);
    }

    while (v36);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v39 = self->_activeLightweightParticipants;
  id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v46,  v70,  16LL);
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v47;
    do
    {
      uint64_t v43 = 0LL;
      do
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v39);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v46 + 1) + 8LL * (void)v43), 17LL);
        uint64_t v43 = (char *)v43 + 1;
      }

      while (v41 != v43);
      id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v46,  v70,  16LL);
    }

    while (v41);
  }

  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    PBDataWriterWriteStringField(v5, highlightIdentifier, 18LL);
  }
  stagedActivitySession = self->_stagedActivitySession;
  if (stagedActivitySession) {
    PBDataWriterWriteSubmessage(v5, stagedActivitySession, 19LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_avMode, 20LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[36] = self->_version;
    *((_BYTE *)v4 + 152) |= 2u;
  }

  id v30 = v4;
  if (self->_uUIDString)
  {
    objc_msgSend(v4, "setUUIDString:");
    id v4 = v30;
  }

  if (self->_groupUUIDString)
  {
    objc_msgSend(v30, "setGroupUUIDString:");
    id v4 = v30;
  }

  if (self->_messagesGroupUUIDString)
  {
    objc_msgSend(v30, "setMessagesGroupUUIDString:");
    id v4 = v30;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 148) = self->_locallyCreated;
    *((_BYTE *)v4 + 152) |= 4u;
  }

  if (self->_initiator) {
    objc_msgSend(v30, "setInitiator:");
  }
  if (self->_localMember) {
    objc_msgSend(v30, "setLocalMember:");
  }
  if (-[CSDMessagingConversation remoteMembersCount](self, "remoteMembersCount"))
  {
    [v30 clearRemoteMembers];
    unint64_t v5 = -[CSDMessagingConversation remoteMembersCount](self, "remoteMembersCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation remoteMembersAtIndex:](self, "remoteMembersAtIndex:", i));
        [v30 addRemoteMembers:v8];
      }
    }
  }

  if (-[CSDMessagingConversation activeRemoteParticipantsCount](self, "activeRemoteParticipantsCount"))
  {
    [v30 clearActiveRemoteParticipants];
    unint64_t v9 = -[CSDMessagingConversation activeRemoteParticipantsCount](self, "activeRemoteParticipantsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversation activeRemoteParticipantsAtIndex:]( self,  "activeRemoteParticipantsAtIndex:",  j));
        [v30 addActiveRemoteParticipants:v12];
      }
    }
  }

  if (-[CSDMessagingConversation activitySessionsCount](self, "activitySessionsCount"))
  {
    [v30 clearActivitySessions];
    unint64_t v13 = -[CSDMessagingConversation activitySessionsCount](self, "activitySessionsCount");
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0LL; k != v14; ++k)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation activitySessionsAtIndex:](self, "activitySessionsAtIndex:", k));
        [v30 addActivitySessions:v16];
      }
    }
  }

  if (self->_link) {
    objc_msgSend(v30, "setLink:");
  }
  if (self->_reportData) {
    objc_msgSend(v30, "setReportData:");
  }
  if (self->_conversationProviderIdentifier) {
    objc_msgSend(v30, "setConversationProviderIdentifier:");
  }
  if (-[CSDMessagingConversation otherInvitedHandlesCount](self, "otherInvitedHandlesCount"))
  {
    [v30 clearOtherInvitedHandles];
    unint64_t v17 = -[CSDMessagingConversation otherInvitedHandlesCount](self, "otherInvitedHandlesCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0LL; m != v18; ++m)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation otherInvitedHandlesAtIndex:](self, "otherInvitedHandlesAtIndex:", m));
        [v30 addOtherInvitedHandles:v20];
      }
    }
  }

  if (-[CSDMessagingConversation lightweightMembersCount](self, "lightweightMembersCount"))
  {
    [v30 clearLightweightMembers];
    unint64_t v21 = -[CSDMessagingConversation lightweightMembersCount](self, "lightweightMembersCount");
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0LL; n != v22; ++n)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversation lightweightMembersAtIndex:](self, "lightweightMembersAtIndex:", n));
        [v30 addLightweightMembers:v24];
      }
    }
  }

  if (-[CSDMessagingConversation activeLightweightParticipantsCount](self, "activeLightweightParticipantsCount"))
  {
    [v30 clearActiveLightweightParticipants];
    unint64_t v25 = -[CSDMessagingConversation activeLightweightParticipantsCount](self, "activeLightweightParticipantsCount");
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0LL; ii != v26; ++ii)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversation activeLightweightParticipantsAtIndex:]( self,  "activeLightweightParticipantsAtIndex:",  ii));
        [v30 addActiveLightweightParticipants:v28];
      }
    }
  }

  if (self->_highlightIdentifier) {
    objc_msgSend(v30, "setHighlightIdentifier:");
  }
  id v29 = v30;
  if (self->_stagedActivitySession)
  {
    objc_msgSend(v30, "setStagedActivitySession:");
    id v29 = v30;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v29[8] = self->_avMode;
    *((_BYTE *)v29 + 152) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[36] = self->_version;
    *((_BYTE *)v5 + 152) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_uUIDString, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[17];
  v6[17] = v7;

  id v9 = -[NSString copyWithZone:](self->_groupUUIDString, "copyWithZone:", a3);
  unint64_t v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = -[NSString copyWithZone:](self->_messagesGroupUUIDString, "copyWithZone:", a3);
  id v12 = (void *)v6[12];
  v6[12] = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 148) = self->_locallyCreated;
    *((_BYTE *)v6 + 152) |= 4u;
  }

  id v13 = -[CSDMessagingHandle copyWithZone:](self->_initiator, "copyWithZone:", a3);
  unint64_t v14 = (void *)v6[8];
  v6[8] = v13;

  id v15 = -[CSDMessagingConversationMember copyWithZone:](self->_localMember, "copyWithZone:", a3);
  id v16 = (void *)v6[11];
  v6[11] = v15;

  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  unint64_t v17 = self->_remoteMembers;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v84,  v93,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v85;
    do
    {
      unint64_t v21 = 0LL;
      do
      {
        if (*(void *)v85 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v84 + 1) + 8 * (void)v21) copyWithZone:a3];
        [v6 addRemoteMembers:v22];

        unint64_t v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v84,  v93,  16LL);
    }

    while (v19);
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v23 = self->_activeRemoteParticipants;
  id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v80,  v92,  16LL);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v81;
    do
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v81 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v80 + 1) + 8 * (void)v27) copyWithZone:a3];
        [v6 addActiveRemoteParticipants:v28];

        v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v80,  v92,  16LL);
    }

    while (v25);
  }

  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v29 = self->_activitySessions;
  id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v76,  v91,  16LL);
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v77;
    do
    {
      v33 = 0LL;
      do
      {
        if (*(void *)v77 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v76 + 1) + 8 * (void)v33) copyWithZone:a3];
        [v6 addActivitySessions:v34];

        v33 = (char *)v33 + 1;
      }

      while (v31 != v33);
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v76,  v91,  16LL);
    }

    while (v31);
  }

  id v35 = -[CSDMessagingConversationLink copyWithZone:](self->_link, "copyWithZone:", a3);
  id v36 = (void *)v6[10];
  v6[10] = v35;

  id v37 = -[CSDMessagingConversationReport copyWithZone:](self->_reportData, "copyWithZone:", a3);
  v38 = (void *)v6[15];
  v6[15] = v37;

  id v39 = -[NSString copyWithZone:](self->_conversationProviderIdentifier, "copyWithZone:", a3);
  id v40 = (void *)v6[5];
  v6[5] = v39;

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v41 = self->_otherInvitedHandles;
  id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v72,  v90,  16LL);
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v73;
    do
    {
      v45 = 0LL;
      do
      {
        if (*(void *)v73 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)v45) copyWithZone:a3];
        [v6 addOtherInvitedHandles:v46];

        v45 = (char *)v45 + 1;
      }

      while (v43 != v45);
      id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v72,  v90,  16LL);
    }

    while (v43);
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v47 = self->_lightweightMembers;
  id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v68,  v89,  16LL);
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v69;
    do
    {
      __int128 v51 = 0LL;
      do
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(v47);
        }
        id v52 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)v51) copyWithZone:a3];
        [v6 addLightweightMembers:v52];

        __int128 v51 = (char *)v51 + 1;
      }

      while (v49 != v51);
      id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v68,  v89,  16LL);
    }

    while (v49);
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v53 = self->_activeLightweightParticipants;
  id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v64,  v88,  16LL);
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v65;
    do
    {
      __int128 v57 = 0LL;
      do
      {
        if (*(void *)v65 != v56) {
          objc_enumerationMutation(v53);
        }
        id v58 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * (void)v57), "copyWithZone:", a3, (void)v64);
        [v6 addActiveLightweightParticipants:v58];

        __int128 v57 = (char *)v57 + 1;
      }

      while (v55 != v57);
      id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v64,  v88,  16LL);
    }

    while (v55);
  }

  id v59 = -[NSString copyWithZone:](self->_highlightIdentifier, "copyWithZone:", a3);
  __int128 v60 = (void *)v6[7];
  v6[7] = v59;

  id v61 = -[CSDMessagingConversationActivitySession copyWithZone:](self->_stagedActivitySession, "copyWithZone:", a3);
  __int128 v62 = (void *)v6[16];
  v6[16] = v61;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_avMode;
    *((_BYTE *)v6 + 152) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 2) == 0 || self->_version != *((_DWORD *)v4 + 36)) {
      goto LABEL_51;
    }
  }

  else if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
    goto LABEL_51;
  }

  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((void *)v4 + 17)
    && !-[NSString isEqual:](uUIDString, "isEqual:"))
  {
    goto LABEL_51;
  }

  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 6))
  {
  }

  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 12))
  {
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 4) != 0)
    {
      if (self->_locallyCreated)
      {
        if (!*((_BYTE *)v4 + 148)) {
          goto LABEL_51;
        }
        goto LABEL_21;
      }

      if (!*((_BYTE *)v4 + 148)) {
        goto LABEL_21;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v22 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v22 = 0LL;
  }
  NSUInteger v21 = -[NSString hash](self->_uUIDString, "hash");
  NSUInteger v20 = -[NSString hash](self->_groupUUIDString, "hash");
  NSUInteger v19 = -[NSString hash](self->_messagesGroupUUIDString, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761LL * self->_locallyCreated;
  }
  else {
    uint64_t v18 = 0LL;
  }
  unint64_t v17 = -[CSDMessagingHandle hash](self->_initiator, "hash");
  unint64_t v16 = -[CSDMessagingConversationMember hash](self->_localMember, "hash");
  unint64_t v15 = (unint64_t)-[NSMutableArray hash](self->_remoteMembers, "hash");
  unint64_t v14 = (unint64_t)-[NSMutableArray hash](self->_activeRemoteParticipants, "hash");
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_activitySessions, "hash");
  unint64_t v4 = -[CSDMessagingConversationLink hash](self->_link, "hash");
  unint64_t v5 = -[CSDMessagingConversationReport hash](self->_reportData, "hash");
  NSUInteger v6 = -[NSString hash](self->_conversationProviderIdentifier, "hash");
  unint64_t v7 = (unint64_t)-[NSMutableArray hash](self->_otherInvitedHandles, "hash");
  unint64_t v8 = (unint64_t)-[NSMutableArray hash](self->_lightweightMembers, "hash");
  unint64_t v9 = (unint64_t)-[NSMutableArray hash](self->_activeLightweightParticipants, "hash");
  NSUInteger v10 = -[NSString hash](self->_highlightIdentifier, "hash");
  unint64_t v11 = -[CSDMessagingConversationActivitySession hash](self->_stagedActivitySession, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v12 = 2654435761LL * self->_avMode;
  }
  else {
    uint64_t v12 = 0LL;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[38] & 2) != 0)
  {
    self->_versiouint64_t n = v4[36];
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 17)) {
    -[CSDMessagingConversation setUUIDString:](self, "setUUIDString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversation setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  if (*((void *)v5 + 12)) {
    -[CSDMessagingConversation setMessagesGroupUUIDString:](self, "setMessagesGroupUUIDString:");
  }
  if ((*((_BYTE *)v5 + 152) & 4) != 0)
  {
    self->_locallyCreated = *((_BYTE *)v5 + 148);
    *(_BYTE *)&self->_has |= 4u;
  }

  initiator = self->_initiator;
  uint64_t v7 = *((void *)v5 + 8);
  if (initiator)
  {
    if (v7) {
      -[CSDMessagingHandle mergeFrom:](initiator, "mergeFrom:");
    }
  }

  else if (v7)
  {
    -[CSDMessagingConversation setInitiator:](self, "setInitiator:");
  }

  localMember = self->_localMember;
  uint64_t v9 = *((void *)v5 + 11);
  if (localMember)
  {
    if (v9) {
      -[CSDMessagingConversationMember mergeFrom:](localMember, "mergeFrom:");
    }
  }

  else if (v9)
  {
    -[CSDMessagingConversation setLocalMember:](self, "setLocalMember:");
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v10 = *((id *)v5 + 14);
  id v11 = [v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CSDMessagingConversation addRemoteMembers:]( self,  "addRemoteMembers:",  *(void *)(*((void *)&v66 + 1) + 8LL * (void)i));
      }

      id v12 = [v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }

    while (v12);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v15 = *((id *)v5 + 2);
  id v16 = [v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (uint64_t j = 0LL; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CSDMessagingConversation addActiveRemoteParticipants:]( self,  "addActiveRemoteParticipants:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)j));
      }

      id v17 = [v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }

    while (v17);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v20 = *((id *)v5 + 3);
  id v21 = [v20 countByEnumeratingWithState:&v58 objects:v73 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v59;
    do
    {
      for (uint64_t k = 0LL; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v59 != v23) {
          objc_enumerationMutation(v20);
        }
        -[CSDMessagingConversation addActivitySessions:]( self,  "addActivitySessions:",  *(void *)(*((void *)&v58 + 1) + 8LL * (void)k));
      }

      id v22 = [v20 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }

    while (v22);
  }

  linuint64_t k = self->_link;
  uint64_t v26 = *((void *)v5 + 10);
  if (link)
  {
    if (v26) {
      -[CSDMessagingConversationLink mergeFrom:](link, "mergeFrom:");
    }
  }

  else if (v26)
  {
    -[CSDMessagingConversation setLink:](self, "setLink:");
  }

  reportData = self->_reportData;
  uint64_t v28 = *((void *)v5 + 15);
  if (reportData)
  {
    if (v28) {
      -[CSDMessagingConversationReport mergeFrom:](reportData, "mergeFrom:");
    }
  }

  else if (v28)
  {
    -[CSDMessagingConversation setReportData:](self, "setReportData:");
  }

  if (*((void *)v5 + 5)) {
    -[CSDMessagingConversation setConversationProviderIdentifier:](self, "setConversationProviderIdentifier:");
  }
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v29 = *((id *)v5 + 13);
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v72 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      for (uint64_t m = 0LL; m != v31; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        -[CSDMessagingConversation addOtherInvitedHandles:]( self,  "addOtherInvitedHandles:",  *(void *)(*((void *)&v54 + 1) + 8LL * (void)m));
      }

      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v72 count:16];
    }

    while (v31);
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v34 = *((id *)v5 + 9);
  id v35 = [v34 countByEnumeratingWithState:&v50 objects:v71 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t n = 0LL; n != v36; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        -[CSDMessagingConversation addLightweightMembers:]( self,  "addLightweightMembers:",  *(void *)(*((void *)&v50 + 1) + 8LL * (void)n));
      }

      id v36 = [v34 countByEnumeratingWithState:&v50 objects:v71 count:16];
    }

    while (v36);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v39 = *((id *)v5 + 1);
  id v40 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v47;
    do
    {
      for (iuint64_t i = 0LL; ii != v41; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v39);
        }
        -[CSDMessagingConversation addActiveLightweightParticipants:]( self,  "addActiveLightweightParticipants:",  *(void *)(*((void *)&v46 + 1) + 8LL * (void)ii),  (void)v46);
      }

      id v41 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
    }

    while (v41);
  }

  if (*((void *)v5 + 7)) {
    -[CSDMessagingConversation setHighlightIdentifier:](self, "setHighlightIdentifier:");
  }
  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  uint64_t v45 = *((void *)v5 + 16);
  if (stagedActivitySession)
  {
    if (v45) {
      -[CSDMessagingConversationActivitySession mergeFrom:](stagedActivitySession, "mergeFrom:");
    }
  }

  else if (v45)
  {
    -[CSDMessagingConversation setStagedActivitySession:](self, "setStagedActivitySession:");
  }

  if ((*((_BYTE *)v5 + 152) & 1) != 0)
  {
    self->_uint64_t avMode = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
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

- (NSMutableArray)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (NSMutableArray)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
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

- (NSString)conversationProviderIdentifier
{
  return self->_conversationProviderIdentifier;
}

- (void)setConversationProviderIdentifier:(id)a3
{
}

- (NSMutableArray)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
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

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (CSDMessagingConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end