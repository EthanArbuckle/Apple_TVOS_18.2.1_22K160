@interface CSDMessagingMemberAssociationClaim
- (BOOL)hasAssociatedPseudonym;
- (BOOL)hasConversationGroupUUIDString;
- (BOOL)hasPrimaryAvcIdentifier;
- (BOOL)hasPrimaryHandle;
- (BOOL)hasPrimaryIdentifier;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)associatedPseudonym;
- (CSDMessagingHandle)primaryHandle;
- (NSString)conversationGroupUUIDString;
- (NSString)primaryAvcIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tuAssociationForHandle:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)primaryIdentifier;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedPseudonym:(id)a3;
- (void)setConversationGroupUUIDString:(id)a3;
- (void)setHasPrimaryIdentifier:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPrimaryAvcIdentifier:(id)a3;
- (void)setPrimaryHandle:(id)a3;
- (void)setPrimaryIdentifier:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingMemberAssociationClaim

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasPrimaryHandle
{
  return self->_primaryHandle != 0LL;
}

- (void)setPrimaryIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_primaryIdentifier = a3;
}

- (void)setHasPrimaryIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrimaryIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPrimaryAvcIdentifier
{
  return self->_primaryAvcIdentifier != 0LL;
}

- (BOOL)hasAssociatedPseudonym
{
  return self->_associatedPseudonym != 0LL;
}

- (BOOL)hasConversationGroupUUIDString
{
  return self->_conversationGroupUUIDString != 0LL;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingMemberAssociationClaim;
  id v3 = -[CSDMessagingMemberAssociationClaim description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  primaryHandle = self->_primaryHandle;
  if (primaryHandle)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](primaryHandle, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"primaryHandle"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_primaryIdentifier));
    [v3 setObject:v7 forKey:@"primaryIdentifier"];
  }

  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if (primaryAvcIdentifier) {
    [v3 setObject:primaryAvcIdentifier forKey:@"primaryAvcIdentifier"];
  }
  associatedPseudonym = self->_associatedPseudonym;
  if (associatedPseudonym)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](associatedPseudonym, "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"associatedPseudonym"];
  }

  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString) {
    [v3 setObject:conversationGroupUUIDString forKey:@"conversationGroupUUIDString"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_type));
    [v3 setObject:v12 forKey:@"type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BC4A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field(v8, self->_version, 1LL);
  }
  primaryHandle = self->_primaryHandle;
  if (primaryHandle) {
    PBDataWriterWriteSubmessage(v8, primaryHandle, 2LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v8, self->_primaryIdentifier, 3LL);
  }
  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if (primaryAvcIdentifier) {
    PBDataWriterWriteStringField(v8, primaryAvcIdentifier, 4LL);
  }
  associatedPseudonym = self->_associatedPseudonym;
  if (associatedPseudonym) {
    PBDataWriterWriteSubmessage(v8, associatedPseudonym, 5LL);
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString) {
    PBDataWriterWriteStringField(v8, conversationGroupUUIDString, 6LL);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field(v8, self->_type, 7LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[13] = self->_version;
    *((_BYTE *)v4 + 56) |= 4u;
  }

  v5 = v4;
  if (self->_primaryHandle)
  {
    objc_msgSend(v4, "setPrimaryHandle:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_primaryIdentifier;
    *((_BYTE *)v4 + 56) |= 1u;
  }

  if (self->_primaryAvcIdentifier)
  {
    objc_msgSend(v5, "setPrimaryAvcIdentifier:");
    v4 = v5;
  }

  if (self->_associatedPseudonym)
  {
    objc_msgSend(v5, "setAssociatedPseudonym:");
    v4 = v5;
  }

  if (self->_conversationGroupUUIDString)
  {
    objc_msgSend(v5, "setConversationGroupUUIDString:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[12] = self->_type;
    *((_BYTE *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[13] = self->_version;
    *((_BYTE *)v5 + 56) |= 4u;
  }

  id v7 = -[CSDMessagingHandle copyWithZone:](self->_primaryHandle, "copyWithZone:", a3);
  id v8 = (void *)v6[5];
  v6[5] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = self->_primaryIdentifier;
    *((_BYTE *)v6 + 56) |= 1u;
  }

  id v9 = -[NSString copyWithZone:](self->_primaryAvcIdentifier, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = -[CSDMessagingHandle copyWithZone:](self->_associatedPseudonym, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = -[NSString copyWithZone:](self->_conversationGroupUUIDString, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((_BYTE *)v6 + 56) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_version != *((_DWORD *)v4 + 13)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_25;
  }

  primaryHandle = self->_primaryHandle;
  if ((unint64_t)primaryHandle | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingHandle isEqual:](primaryHandle, "isEqual:"))
    {
LABEL_25:
      BOOL v11 = 0;
      goto LABEL_26;
    }

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_primaryIdentifier != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_25;
  }

  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if ((unint64_t)primaryAvcIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](primaryAvcIdentifier, "isEqual:"))
  {
    goto LABEL_25;
  }

  associatedPseudonym = self->_associatedPseudonym;
  if ((unint64_t)associatedPseudonym | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingHandle isEqual:](associatedPseudonym, "isEqual:")) {
      goto LABEL_25;
    }
  }

  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if ((unint64_t)conversationGroupUUIDString | *((void *)v4 + 3))
  {
  }

  BOOL v11 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
    BOOL v11 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[CSDMessagingHandle hash](self->_primaryHandle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v5 = 2654435761u * self->_primaryIdentifier;
  }
  else {
    unint64_t v5 = 0LL;
  }
  NSUInteger v6 = -[NSString hash](self->_primaryAvcIdentifier, "hash");
  unint64_t v7 = -[CSDMessagingHandle hash](self->_associatedPseudonym, "hash");
  NSUInteger v8 = -[NSString hash](self->_conversationGroupUUIDString, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v9 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[14] & 4) != 0)
  {
    self->_version = v4[13];
    *(_BYTE *)&self->_has |= 4u;
  }

  primaryHandle = self->_primaryHandle;
  uint64_t v7 = *((void *)v5 + 5);
  id v10 = v5;
  if (primaryHandle)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingHandle mergeFrom:](primaryHandle, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingMemberAssociationClaim setPrimaryHandle:](self, "setPrimaryHandle:");
  }

  id v5 = v10;
LABEL_9:
  if ((*((_BYTE *)v5 + 56) & 1) != 0)
  {
    self->_primaryIdentifier = *((void *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v5 + 4))
  {
    -[CSDMessagingMemberAssociationClaim setPrimaryAvcIdentifier:](self, "setPrimaryAvcIdentifier:");
    id v5 = v10;
  }

  associatedPseudonym = self->_associatedPseudonym;
  uint64_t v9 = *((void *)v5 + 2);
  if (associatedPseudonym)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[CSDMessagingHandle mergeFrom:](associatedPseudonym, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[CSDMessagingMemberAssociationClaim setAssociatedPseudonym:](self, "setAssociatedPseudonym:");
  }

  id v5 = v10;
LABEL_19:
  if (*((void *)v5 + 3))
  {
    -[CSDMessagingMemberAssociationClaim setConversationGroupUUIDString:](self, "setConversationGroupUUIDString:");
    id v5 = v10;
  }

  if ((*((_BYTE *)v5 + 56) & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingHandle)primaryHandle
{
  return self->_primaryHandle;
}

- (void)setPrimaryHandle:(id)a3
{
}

- (unint64_t)primaryIdentifier
{
  return self->_primaryIdentifier;
}

- (NSString)primaryAvcIdentifier
{
  return self->_primaryAvcIdentifier;
}

- (void)setPrimaryAvcIdentifier:(id)a3
{
}

- (CSDMessagingHandle)associatedPseudonym
{
  return self->_associatedPseudonym;
}

- (void)setAssociatedPseudonym:(id)a3
{
}

- (NSString)conversationGroupUUIDString
{
  return self->_conversationGroupUUIDString;
}

- (void)setConversationGroupUUIDString:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (id)tuAssociationForHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim primaryHandle](self, "primaryHandle"));
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tuHandle]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim associatedPseudonym](self, "associatedPseudonym"));
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tuHandle]);

  id v9 = [v4 isEqualToHandle:v6];
  unsigned int v10 = [v4 isEqualToHandle:v8];

  if ((_DWORD)v9 == v10)
  {
    id v11 = 0LL;
  }

  else
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___TUConversationMemberAssociation);
    objc_msgSend(v11, "setType:", -[CSDMessagingMemberAssociationClaim type](self, "type"));
    [v11 setPrimary:v9];
    if ((_DWORD)v9)
    {
      [v11 setHandle:v8];
    }

    else
    {
      [v11 setHandle:v6];
      objc_msgSend( v11,  "setIdentifier:",  -[CSDMessagingMemberAssociationClaim primaryIdentifier](self, "primaryIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim primaryAvcIdentifier](self, "primaryAvcIdentifier"));
      id v13 = [v12 copy];
      [v11 setAvcIdentifier:v13];
    }
  }

  return v11;
}

@end