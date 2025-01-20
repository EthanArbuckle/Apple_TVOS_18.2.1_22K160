@interface CSDMessagingConversationLink
+ (Class)invitedHandlesType;
+ (id)linkWithTUConversationLink:(id)a3 includeGroupUUID:(BOOL)a4;
- (BOOL)hasCreationDateEpochTime;
- (BOOL)hasGeneratorDescriptor;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasIsActivated;
- (BOOL)hasLinkLifetimeScope;
- (BOOL)hasLinkName;
- (BOOL)hasOriginatorHandle;
- (BOOL)hasPrivateKey;
- (BOOL)hasPseudonym;
- (BOOL)hasPseudonymExpirationDateEpochTime;
- (BOOL)hasPublicKey;
- (BOOL)isActivated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptor;
- (CSDMessagingHandle)originatorHandle;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSMutableArray)invitedHandles;
- (NSString)groupUUIDString;
- (NSString)linkName;
- (NSString)pseudonym;
- (NSUUID)groupUUID;
- (TUConversationLink)tuConversationLink;
- (TUConversationLinkDescriptor)tuConversationLinkDescriptor;
- (TUHandle)originatorTUHandle;
- (double)creationDateEpochTime;
- (double)pseudonymExpirationDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)invitedHandlesAtIndex:(unint64_t)a3;
- (id)linkLifetimeScopeAsString:(int)a3;
- (int)StringAsLinkLifetimeScope:(id)a3;
- (int)linkLifetimeScope;
- (unint64_t)hash;
- (unint64_t)invitedHandlesCount;
- (void)addInvitedHandles:(id)a3;
- (void)clearInvitedHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDateEpochTime:(double)a3;
- (void)setGeneratorDescriptor:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasCreationDateEpochTime:(BOOL)a3;
- (void)setHasIsActivated:(BOOL)a3;
- (void)setHasLinkLifetimeScope:(BOOL)a3;
- (void)setHasPseudonymExpirationDateEpochTime:(BOOL)a3;
- (void)setInvitedHandles:(id)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setLinkLifetimeScope:(int)a3;
- (void)setLinkName:(id)a3;
- (void)setOriginatorHandle:(id)a3;
- (void)setPrivateKey:(id)a3;
- (void)setPseudonym:(id)a3;
- (void)setPseudonymExpirationDateEpochTime:(double)a3;
- (void)setPublicKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationLink

- (TUConversationLink)tuConversationLink
{
  if (-[CSDMessagingConversationLink hasCreationDateEpochTime](self, "hasCreationDateEpochTime"))
  {
    -[CSDMessagingConversationLink creationDateEpochTime](self, "creationDateEpochTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }

  else
  {
    v3 = 0LL;
  }

  if (-[CSDMessagingConversationLink hasPseudonymExpirationDateEpochTime](self, "hasPseudonymExpirationDateEpochTime"))
  {
    -[CSDMessagingConversationLink pseudonymExpirationDateEpochTime](self, "pseudonymExpirationDateEpochTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }

  else
  {
    v4 = 0LL;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink invitedHandles](self, "invitedHandles"));
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v10) tuHandle]);
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  v12 = objc_alloc(&OBJC_CLASS___TUConversationLink);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink pseudonym](self, "pseudonym"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink publicKey](self, "publicKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink groupUUID](self, "groupUUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink originatorTUHandle](self, "originatorTUHandle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink linkName](self, "linkName"));
  LOBYTE(v20) = 0;
  v18 = -[TUConversationLink initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:]( v12,  "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberH andles:locallyCreated:linkName:linkLifetimeScope:deleteReason:",  v13,  v14,  v15,  v16,  v3,  0LL,  v4,  v5,  v20,  v17,  -[CSDMessagingConversationLink linkLifetimeScope](self, "linkLifetimeScope"),  0LL);

  return v18;
}

- (TUConversationLinkDescriptor)tuConversationLinkDescriptor
{
  if (!-[CSDMessagingConversationLink hasGeneratorDescriptor](self, "hasGeneratorDescriptor")) {
    goto LABEL_9;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink generatorDescriptor](self, "generatorDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink generatorDescriptor](self, "generatorDescriptor"));
  if (([v4 hasGeneratorVersion] & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink originatorTUHandle](self, "originatorTUHandle"));

  if (!v5)
  {
LABEL_9:
    id v19 = 0LL;
    return (TUConversationLinkDescriptor *)v19;
  }

  id v6 = objc_alloc(&OBJC_CLASS___TUConversationLinkOriginator);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink generatorDescriptor](self, "generatorDescriptor"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 generatorID]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink generatorDescriptor](self, "generatorDescriptor"));
  uint64_t v10 = [v9 generatorVersion];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink originatorTUHandle](self, "originatorTUHandle"));
  id v12 = [v6 initWithIdentifier:v8 revision:v10 handle:v11];

  id v13 = objc_alloc(&OBJC_CLASS___TUMutableConversationLinkDescriptor);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink groupUUID](self, "groupUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink pseudonym](self, "pseudonym"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink publicKey](self, "publicKey"));
  id v17 = [v13 initWithGroupUUID:v14 originator:v12 pseudonym:v15 publicKey:v16];

  if (-[CSDMessagingConversationLink hasIsActivated](self, "hasIsActivated")) {
    BOOL v18 = -[CSDMessagingConversationLink isActivated](self, "isActivated");
  }
  else {
    BOOL v18 = 1LL;
  }
  [v17 setActivated:v18];
  objc_msgSend( v17,  "setLinkLifetimeScope:",  -[CSDMessagingConversationLink linkLifetimeScope](self, "linkLifetimeScope"));
  if (-[CSDMessagingConversationLink hasCreationDateEpochTime](self, "hasCreationDateEpochTime"))
  {
    -[CSDMessagingConversationLink creationDateEpochTime](self, "creationDateEpochTime");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    [v17 setCreationDate:v21];
  }

  if (-[CSDMessagingConversationLink hasPseudonymExpirationDateEpochTime](self, "hasPseudonymExpirationDateEpochTime"))
  {
    -[CSDMessagingConversationLink pseudonymExpirationDateEpochTime](self, "pseudonymExpirationDateEpochTime");
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    [v17 setExpirationDate:v22];
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink invitedHandles](self, "invitedHandles", 0LL));
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)v28) tuHandle]);
        [v23 addObject:v29];

        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v26);
  }

  [v17 setInvitedHandles:v23];
  if (-[CSDMessagingConversationLink hasPrivateKey](self, "hasPrivateKey"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink privateKey](self, "privateKey"));
    [v17 setPrivateKey:v30];
  }

  if (-[CSDMessagingConversationLink hasLinkName](self, "hasLinkName"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink linkName](self, "linkName"));
    [v17 setName:v31];
  }

  id v19 = [v17 copy];

  return (TUConversationLinkDescriptor *)v19;
}

- (NSUUID)groupUUID
{
  if (-[CSDMessagingConversationLink hasGroupUUIDString](self, "hasGroupUUIDString"))
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUUID);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink groupUUIDString](self, "groupUUIDString"));
    v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (TUHandle)originatorTUHandle
{
  if (-[CSDMessagingConversationLink hasOriginatorHandle](self, "hasOriginatorHandle"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink originatorHandle](self, "originatorHandle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuHandle]);
  }

  else
  {
    v4 = 0LL;
  }

  return (TUHandle *)v4;
}

+ (id)linkWithTUConversationLink:(id)a3 includeGroupUUID:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationLink);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pseudonym]);
  -[CSDMessagingConversationLink setPseudonym:](v6, "setPseudonym:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 publicKey]);
  -[CSDMessagingConversationLink setPublicKey:](v6, "setPublicKey:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 linkName]);
  -[CSDMessagingConversationLink setLinkName:](v6, "setLinkName:", v9);

  -[CSDMessagingConversationLink setLinkLifetimeScope:]( v6,  "setLinkLifetimeScope:",  [v5 linkLifetimeScope]);
  if (v4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 groupUUID]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 groupUUID]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      -[CSDMessagingConversationLink setGroupUUIDString:](v6, "setGroupUUIDString:", v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 originatorHandle]);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v13));
      -[CSDMessagingConversationLink setOriginatorHandle:](v6, "setOriginatorHandle:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 invitedMemberHandles]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15 count]));

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitedMemberHandles", 0));
      id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          __int128 v21 = 0LL;
          do
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v21)));
            [v16 addObject:v22];

            __int128 v21 = (char *)v21 + 1;
          }

          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v19);
      }

      -[CSDMessagingConversationLink setInvitedHandles:](v6, "setInvitedHandles:", v16);
    }
  }

  return v6;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationLink;
  id v3 = -[CSDMessagingConversationLink description](&v10, "description");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = TULoggableStringForObject();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v7));

  return v8;
}

- (BOOL)hasPseudonym
{
  return self->_pseudonym != 0LL;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0LL;
}

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0LL;
}

- (void)clearInvitedHandles
{
}

- (void)addInvitedHandles:(id)a3
{
  id v4 = a3;
  invitedHandles = self->_invitedHandles;
  id v8 = v4;
  if (!invitedHandles)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_invitedHandles;
    self->_invitedHandles = v6;

    id v4 = v8;
    invitedHandles = self->_invitedHandles;
  }

  -[NSMutableArray addObject:](invitedHandles, "addObject:", v4);
}

- (unint64_t)invitedHandlesCount
{
  return (unint64_t)-[NSMutableArray count](self->_invitedHandles, "count");
}

- (id)invitedHandlesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_invitedHandles, "objectAtIndex:", a3);
}

+ (Class)invitedHandlesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingHandle, a2);
}

- (void)setCreationDateEpochTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDateEpochTime = a3;
}

- (void)setHasCreationDateEpochTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDateEpochTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0LL;
}

- (BOOL)hasOriginatorHandle
{
  return self->_originatorHandle != 0LL;
}

- (void)setPseudonymExpirationDateEpochTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pseudonymExpirationDateEpochTime = a3;
}

- (void)setHasPseudonymExpirationDateEpochTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPseudonymExpirationDateEpochTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsActivated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isActivated = a3;
}

- (void)setHasIsActivated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActivated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasGeneratorDescriptor
{
  return self->_generatorDescriptor != 0LL;
}

- (BOOL)hasLinkName
{
  return self->_linkName != 0LL;
}

- (int)linkLifetimeScope
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_linkLifetimeScope;
  }
  else {
    return 0;
  }
}

- (void)setLinkLifetimeScope:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_linkLifetimeScope = a3;
}

- (void)setHasLinkLifetimeScope:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkLifetimeScope
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)linkLifetimeScopeAsString:(int)a3
{
  if (!a3) {
    return @"Indefinite";
  }
  if (a3 == 1) {
    char v3 = @"CallDuration";
  }
  else {
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsLinkLifetimeScope:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"CallDuration"];
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  pseudonym = self->_pseudonym;
  if (pseudonym) {
    [v3 setObject:pseudonym forKey:@"pseudonym"];
  }
  publicKey = self->_publicKey;
  if (publicKey) {
    [v4 setObject:publicKey forKey:@"publicKey"];
  }
  privateKey = self->_privateKey;
  if (privateKey) {
    [v4 setObject:privateKey forKey:@"privateKey"];
  }
  if (-[NSMutableArray count](self->_invitedHandles, "count"))
  {
    id v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_invitedHandles, "count"));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v9 = self->_invitedHandles;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v28 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v11);
    }

    [v4 setObject:v8 forKey:@"invitedHandles"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_creationDateEpochTime));
    [v4 setObject:v15 forKey:@"creationDateEpochTime"];
  }

  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v4 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  originatorHandle = self->_originatorHandle;
  if (originatorHandle)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](originatorHandle, "dictionaryRepresentation"));
    [v4 setObject:v18 forKey:@"originatorHandle"];
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_pseudonymExpirationDateEpochTime));
    [v4 setObject:v20 forKey:@"pseudonymExpirationDateEpochTime"];

    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isActivated));
    [v4 setObject:v21 forKey:@"isActivated"];
  }

  generatorDescriptor = self->_generatorDescriptor;
  if (generatorDescriptor)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationLinkGeneratorDescriptor dictionaryRepresentation]( generatorDescriptor,  "dictionaryRepresentation"));
    [v4 setObject:v23 forKey:@"generatorDescriptor"];
  }

  linkName = self->_linkName;
  if (linkName) {
    [v4 setObject:linkName forKey:@"linkName"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    int linkLifetimeScope = self->_linkLifetimeScope;
    if (linkLifetimeScope)
    {
      if (linkLifetimeScope == 1) {
        __int128 v26 = @"CallDuration";
      }
      else {
        __int128 v26 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_linkLifetimeScope));
      }
    }

    else
    {
      __int128 v26 = @"Indefinite";
    }

    [v4 setObject:v26 forKey:@"linkLifetimeScope"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000960C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  pseudonym = self->_pseudonym;
  if (pseudonym) {
    PBDataWriterWriteStringField(v4, pseudonym, 1LL);
  }
  publicKey = self->_publicKey;
  if (publicKey) {
    PBDataWriterWriteDataField(v5, publicKey, 2LL);
  }
  privateKey = self->_privateKey;
  if (privateKey) {
    PBDataWriterWriteDataField(v5, privateKey, 3LL);
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v9 = self->_invitedHandles;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v19 + 1) + 8LL * (void)i), 4LL);
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteDoubleField(v5, 5LL, self->_creationDateEpochTime);
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    PBDataWriterWriteStringField(v5, groupUUIDString, 6LL);
  }
  originatorHandle = self->_originatorHandle;
  if (originatorHandle) {
    PBDataWriterWriteSubmessage(v5, originatorHandle, 7LL);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 8LL, self->_pseudonymExpirationDateEpochTime);
    char has = (char)self->_has;
  }

  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isActivated, 9LL);
  }
  generatorDescriptor = self->_generatorDescriptor;
  if (generatorDescriptor) {
    PBDataWriterWriteSubmessage(v5, generatorDescriptor, 10LL);
  }
  linkName = self->_linkName;
  if (linkName) {
    PBDataWriterWriteStringField(v5, linkName, 11LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_linkLifetimeScope, 12LL);
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_pseudonym) {
    objc_msgSend(v10, "setPseudonym:");
  }
  if (self->_publicKey) {
    objc_msgSend(v10, "setPublicKey:");
  }
  if (self->_privateKey) {
    objc_msgSend(v10, "setPrivateKey:");
  }
  if (-[CSDMessagingConversationLink invitedHandlesCount](self, "invitedHandlesCount"))
  {
    [v10 clearInvitedHandles];
    unint64_t v4 = -[CSDMessagingConversationLink invitedHandlesCount](self, "invitedHandlesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLink invitedHandlesAtIndex:](self, "invitedHandlesAtIndex:", i));
        [v10 addInvitedHandles:v7];
      }
    }
  }

  id v8 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v10 + 1) = *(void *)&self->_creationDateEpochTime;
    *((_BYTE *)v10 + 100) |= 1u;
  }

  if (self->_groupUUIDString)
  {
    objc_msgSend(v10, "setGroupUUIDString:");
    id v8 = v10;
  }

  if (self->_originatorHandle)
  {
    objc_msgSend(v10, "setOriginatorHandle:");
    id v8 = v10;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8[2] = *(void *)&self->_pseudonymExpirationDateEpochTime;
    *((_BYTE *)v8 + 100) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    *((_BYTE *)v8 + 96) = self->_isActivated;
    *((_BYTE *)v8 + 100) |= 8u;
  }

  if (self->_generatorDescriptor)
  {
    objc_msgSend(v10, "setGeneratorDescriptor:");
    id v8 = v10;
  }

  if (self->_linkName)
  {
    objc_msgSend(v10, "setLinkName:");
    id v8 = v10;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_linkLifetimeScope;
    *((_BYTE *)v8 + 100) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_pseudonym, "copyWithZone:", a3);
  id v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = -[NSData copyWithZone:](self->_publicKey, "copyWithZone:", a3);
  uint64_t v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = -[NSData copyWithZone:](self->_privateKey, "copyWithZone:", a3);
  id v11 = (void *)v5[9];
  v5[9] = v10;

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v12 = self->_invitedHandles;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v28);
        [v5 addInvitedHandles:v17];
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    }

    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(void *)&self->_creationDateEpochTime;
    *((_BYTE *)v5 + 100) |= 1u;
  }

  id v18 = -[NSString copyWithZone:](self->_groupUUIDString, "copyWithZone:", a3, (void)v28);
  __int128 v19 = (void *)v5[4];
  v5[4] = v18;

  id v20 = -[CSDMessagingHandle copyWithZone:](self->_originatorHandle, "copyWithZone:", a3);
  __int128 v21 = (void *)v5[8];
  v5[8] = v20;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_pseudonymExpirationDateEpochTime;
    *((_BYTE *)v5 + 100) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    *((_BYTE *)v5 + 96) = self->_isActivated;
    *((_BYTE *)v5 + 100) |= 8u;
  }

  id v23 = -[CSDMessagingConversationLinkGeneratorDescriptor copyWithZone:]( self->_generatorDescriptor,  "copyWithZone:",  a3);
  __int128 v24 = (void *)v5[3];
  v5[3] = v23;

  id v25 = -[NSString copyWithZone:](self->_linkName, "copyWithZone:", a3);
  __int128 v26 = (void *)v5[7];
  v5[7] = v25;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_linkLifetimeScope;
    *((_BYTE *)v5 + 100) |= 4u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  pseudonym = self->_pseudonym;
  if ((unint64_t)pseudonym | *((void *)v4 + 10))
  {
  }

  publicKey = self->_publicKey;
  if ((unint64_t)publicKey | *((void *)v4 + 11))
  {
  }

  privateKey = self->_privateKey;
  if ((unint64_t)privateKey | *((void *)v4 + 9))
  {
  }

  invitedHandles = self->_invitedHandles;
  if ((unint64_t)invitedHandles | *((void *)v4 + 5))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_40;
  }

  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 4)
    && !-[NSString isEqual:](groupUUIDString, "isEqual:"))
  {
    goto LABEL_40;
  }

  originatorHandle = self->_originatorHandle;
  if ((unint64_t)originatorHandle | *((void *)v4 + 8))
  {
    if (!-[CSDMessagingHandle isEqual:](originatorHandle, "isEqual:")) {
      goto LABEL_40;
    }
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_40;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) != 0)
    {
      if (self->_isActivated)
      {
        if (!*((_BYTE *)v4 + 96)) {
          goto LABEL_40;
        }
        goto LABEL_32;
      }

      if (!*((_BYTE *)v4 + 96)) {
        goto LABEL_32;
      }
    }

- (unint64_t)hash
{
  NSUInteger v24 = -[NSString hash](self->_pseudonym, "hash");
  unint64_t v23 = (unint64_t)-[NSData hash](self->_publicKey, "hash");
  unint64_t v22 = (unint64_t)-[NSData hash](self->_privateKey, "hash");
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_invitedHandles, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double creationDateEpochTime = self->_creationDateEpochTime;
    double v6 = -creationDateEpochTime;
    if (creationDateEpochTime >= 0.0) {
      double v6 = self->_creationDateEpochTime;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  NSUInteger v9 = -[NSString hash](self->_groupUUIDString, "hash");
  unint64_t v10 = -[CSDMessagingHandle hash](self->_originatorHandle, "hash");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double pseudonymExpirationDateEpochTime = self->_pseudonymExpirationDateEpochTime;
    double v14 = -pseudonymExpirationDateEpochTime;
    if (pseudonymExpirationDateEpochTime >= 0.0) {
      double v14 = self->_pseudonymExpirationDateEpochTime;
    }
    double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }

    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  if ((has & 8) != 0) {
    uint64_t v17 = 2654435761LL * self->_isActivated;
  }
  else {
    uint64_t v17 = 0LL;
  }
  unint64_t v18 = -[CSDMessagingConversationLinkGeneratorDescriptor hash](self->_generatorDescriptor, "hash");
  NSUInteger v19 = -[NSString hash](self->_linkName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v20 = 2654435761LL * self->_linkLifetimeScope;
  }
  else {
    uint64_t v20 = 0LL;
  }
  return v23 ^ v24 ^ v22 ^ v3 ^ v4 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[CSDMessagingConversationLink setPseudonym:](self, "setPseudonym:");
  }
  if (*((void *)v4 + 11)) {
    -[CSDMessagingConversationLink setPublicKey:](self, "setPublicKey:");
  }
  if (*((void *)v4 + 9)) {
    -[CSDMessagingConversationLink setPrivateKey:](self, "setPrivateKey:");
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSDMessagingConversationLink addInvitedHandles:]( self,  "addInvitedHandles:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  (void)v15);
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    self->_double creationDateEpochTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 4)) {
    -[CSDMessagingConversationLink setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  originatorHandle = self->_originatorHandle;
  uint64_t v11 = *((void *)v4 + 8);
  if (originatorHandle)
  {
    if (v11) {
      -[CSDMessagingHandle mergeFrom:](originatorHandle, "mergeFrom:");
    }
  }

  else if (v11)
  {
    -[CSDMessagingConversationLink setOriginatorHandle:](self, "setOriginatorHandle:");
  }

  char v12 = *((_BYTE *)v4 + 100);
  if ((v12 & 2) != 0)
  {
    self->_double pseudonymExpirationDateEpochTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v12 = *((_BYTE *)v4 + 100);
  }

  if ((v12 & 8) != 0)
  {
    self->_isActivated = *((_BYTE *)v4 + 96);
    *(_BYTE *)&self->_has |= 8u;
  }

  generatorDescriptor = self->_generatorDescriptor;
  uint64_t v14 = *((void *)v4 + 3);
  if (generatorDescriptor)
  {
    if (v14) {
      -[CSDMessagingConversationLinkGeneratorDescriptor mergeFrom:](generatorDescriptor, "mergeFrom:");
    }
  }

  else if (v14)
  {
    -[CSDMessagingConversationLink setGeneratorDescriptor:](self, "setGeneratorDescriptor:");
  }

  if (*((void *)v4 + 7)) {
    -[CSDMessagingConversationLink setLinkName:](self, "setLinkName:");
  }
  if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    self->_int linkLifetimeScope = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSMutableArray)invitedHandles
{
  return self->_invitedHandles;
}

- (void)setInvitedHandles:(id)a3
{
}

- (double)creationDateEpochTime
{
  return self->_creationDateEpochTime;
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (CSDMessagingHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
}

- (double)pseudonymExpirationDateEpochTime
{
  return self->_pseudonymExpirationDateEpochTime;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptor
{
  return self->_generatorDescriptor;
}

- (void)setGeneratorDescriptor:(id)a3
{
}

- (NSString)linkName
{
  return self->_linkName;
}

- (void)setLinkName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end