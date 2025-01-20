@interface CSDMessagingConversationMember
+ (CSDMessagingConversationMember)memberWithTUConversationMember:(id)a3;
- (BOOL)hasAssociationVoucher;
- (BOOL)hasHandle;
- (BOOL)hasLightweightPrimary;
- (BOOL)hasLightweightPrimaryParticipantID;
- (BOOL)hasNickname;
- (BOOL)hasValidationSource;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (CSDMessagingHandle)lightweightPrimary;
- (CSDMessagingVoucher)associationVoucher;
- (NSString)nickname;
- (TUConversationMember)tuConversationMember;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)validationSourceAsString:(int)a3;
- (int)StringAsValidationSource:(id)a3;
- (int)validationSource;
- (unint64_t)hash;
- (unint64_t)lightweightPrimaryParticipantID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociationVoucher:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasLightweightPrimaryParticipantID:(BOOL)a3;
- (void)setHasValidationSource:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLightweightPrimary:(id)a3;
- (void)setLightweightPrimaryParticipantID:(unint64_t)a3;
- (void)setNickname:(id)a3;
- (void)setValidationSource:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationMember

+ (CSDMessagingConversationMember)memberWithTUConversationMember:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationMember);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v5));
  -[CSDMessagingConversationMember setHandle:](v4, "setHandle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 nickname]);
  -[CSDMessagingConversationMember setNickname:](v4, "setNickname:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 lightweightPrimary]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 lightweightPrimary]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v9));
    -[CSDMessagingConversationMember setLightweightPrimary:](v4, "setLightweightPrimary:", v10);

    -[CSDMessagingConversationMember setLightweightPrimaryParticipantID:]( v4,  "setLightweightPrimaryParticipantID:",  [v3 lightweightPrimaryParticipantIdentifier]);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 associationVoucher]);
  if (v11)
  {
    v12 = (void *)v11;
    id v13 = [v3 validationSource];

    if (v13 == (id)2)
    {
      -[CSDMessagingConversationMember setValidationSource:](v4, "setValidationSource:", 2LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 associationVoucher]);
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingVoucher voucherWithTUVoucher:]( &OBJC_CLASS___CSDMessagingVoucher,  "voucherWithTUVoucher:",  v14));
      -[CSDMessagingConversationMember setAssociationVoucher:](v4, "setAssociationVoucher:", v15);
    }
  }

  return v4;
}

- (TUConversationMember)tuConversationMember
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember handle](self, "handle"));

  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember handle](self, "handle")),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tuHandle]),
        v4,
        v5))
  {
    v6 = objc_alloc(&OBJC_CLASS___TUConversationMember);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember nickname](self, "nickname"));
    v8 = -[TUConversationMember initWithHandle:nickname:](v6, "initWithHandle:nickname:", v5, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember lightweightPrimary](self, "lightweightPrimary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tuHandle]);
    -[TUConversationMember setLightweightPrimary:](v8, "setLightweightPrimary:", v10);

    -[TUConversationMember setLightweightPrimaryParticipantIdentifier:]( v8,  "setLightweightPrimaryParticipantIdentifier:",  -[CSDMessagingConversationMember lightweightPrimaryParticipantID](self, "lightweightPrimaryParticipantID"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TUConversationMember lightweightPrimary](v8, "lightweightPrimary"));
    if (v11)
    {
      v12 = (void *)v11;
      id v13 = -[TUConversationMember lightweightPrimaryParticipantIdentifier]( v8,  "lightweightPrimaryParticipantIdentifier");

      if (v13) {
        -[TUConversationMember setIsLightweightMember:](v8, "setIsLightweightMember:", 1LL);
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember associationVoucher](self, "associationVoucher"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tuVoucher]);

    if (v15 && -[CSDMessagingConversationMember validationSource](self, "validationSource") == 2)
    {
      -[TUConversationMember setValidationSource:](v8, "setValidationSource:", 2LL);
      -[TUConversationMember setAssociationVoucher:](v8, "setAssociationVoucher:", v15);
      v16 = objc_alloc(&OBJC_CLASS___CSDMessagingMemberAssociationClaim);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 unsafeData]);
      v18 = -[CSDMessagingMemberAssociationClaim initWithData:](v16, "initWithData:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim tuAssociationForHandle:](v18, "tuAssociationForHandle:", v5));
      -[TUConversationMember setAssociation:](v8, "setAssociation:", v19);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationMember;
  id v3 = -[CSDMessagingConversationMember description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMember dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = TULoggableStringForObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v7));

  return v8;
}

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

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0LL;
}

- (BOOL)hasLightweightPrimary
{
  return self->_lightweightPrimary != 0LL;
}

- (void)setLightweightPrimaryParticipantID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lightweightPrimaryParticipantID = a3;
}

- (void)setHasLightweightPrimaryParticipantID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLightweightPrimaryParticipantID
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)validationSource
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_validationSource;
  }
  else {
    return 0;
  }
}

- (void)setValidationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_validationSource = a3;
}

- (void)setHasValidationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValidationSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)validationSourceAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003D9828 + a3);
  }
}

- (int)StringAsValidationSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Endorsement"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"Vouched"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAssociationVoucher
{
  return self->_associationVoucher != 0LL;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  handle = self->_handle;
  if (handle)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](handle, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"handle"];
  }

  nickname = self->_nickname;
  if (nickname) {
    [v3 setObject:nickname forKey:@"nickname"];
  }
  lightweightPrimary = self->_lightweightPrimary;
  if (lightweightPrimary)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](lightweightPrimary, "dictionaryRepresentation"));
    [v3 setObject:v9 forKey:@"lightweightPrimary"];
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_lightweightPrimaryParticipantID));
    [v3 setObject:v11 forKey:@"lightweightPrimaryParticipantID"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    uint64_t validationSource = self->_validationSource;
    if (validationSource >= 3) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_validationSource));
    }
    else {
      id v13 = *(&off_1003D9828 + validationSource);
    }
    [v3 setObject:v13 forKey:@"validationSource"];
  }

  associationVoucher = self->_associationVoucher;
  if (associationVoucher)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher dictionaryRepresentation](associationVoucher, "dictionaryRepresentation"));
    [v3 setObject:v15 forKey:@"associationVoucher"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CAB1C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v10;
  }

  handle = self->_handle;
  if (handle)
  {
    PBDataWriterWriteSubmessage(v10, handle, 2LL);
    id v4 = v10;
  }

  nickname = self->_nickname;
  if (nickname)
  {
    PBDataWriterWriteStringField(v10, nickname, 3LL);
    id v4 = v10;
  }

  lightweightPrimary = self->_lightweightPrimary;
  if (lightweightPrimary)
  {
    PBDataWriterWriteSubmessage(v10, lightweightPrimary, 4LL);
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v10, self->_lightweightPrimaryParticipantID, 5LL);
    id v4 = v10;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v10, self->_validationSource, 6LL);
    id v4 = v10;
  }

  associationVoucher = self->_associationVoucher;
  if (associationVoucher)
  {
    PBDataWriterWriteSubmessage(v10, associationVoucher, 7LL);
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[13] = self->_version;
    *((_BYTE *)v4 + 56) |= 4u;
  }

  uint64_t v6 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v6;
  }

  if (self->_nickname)
  {
    objc_msgSend(v6, "setNickname:");
    id v4 = v6;
  }

  if (self->_lightweightPrimary)
  {
    objc_msgSend(v6, "setLightweightPrimary:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_lightweightPrimaryParticipantID;
    *((_BYTE *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[12] = self->_validationSource;
    *((_BYTE *)v4 + 56) |= 2u;
  }

  if (self->_associationVoucher)
  {
    objc_msgSend(v6, "setAssociationVoucher:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[13] = self->_version;
    *((_BYTE *)v5 + 56) |= 4u;
  }

  id v7 = -[CSDMessagingHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  id v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = -[CSDMessagingHandle copyWithZone:](self->_lightweightPrimary, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v6[1] = self->_lightweightPrimaryParticipantID;
    *((_BYTE *)v6 + 56) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_validationSource;
    *((_BYTE *)v6 + 56) |= 2u;
  }

  id v14 = -[CSDMessagingVoucher copyWithZone:](self->_associationVoucher, "copyWithZone:", a3);
  v15 = (void *)v6[2];
  v6[2] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_version != *((_DWORD *)v4 + 13)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_25:
    unsigned __int8 v10 = 0;
    goto LABEL_26;
  }

  handle = self->_handle;
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 5))
  {
  }

  lightweightPrimary = self->_lightweightPrimary;
  if ((unint64_t)lightweightPrimary | *((void *)v4 + 4))
  {
    if (!-[CSDMessagingHandle isEqual:](lightweightPrimary, "isEqual:")) {
      goto LABEL_25;
    }
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_lightweightPrimaryParticipantID != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_25;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_validationSource != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_25;
  }

  associationVoucher = self->_associationVoucher;
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[CSDMessagingHandle hash](self->_handle, "hash");
  NSUInteger v5 = -[NSString hash](self->_nickname, "hash");
  unint64_t v6 = -[CSDMessagingHandle hash](self->_lightweightPrimary, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v7 = 2654435761u * self->_lightweightPrimaryParticipantID;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[CSDMessagingVoucher hash](self->_associationVoucher, "hash");
  }

  unint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761LL * self->_validationSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[CSDMessagingVoucher hash](self->_associationVoucher, "hash");
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

  handle = self->_handle;
  uint64_t v7 = *((void *)v5 + 3);
  id v13 = v5;
  if (handle)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationMember setHandle:](self, "setHandle:");
  }

  id v5 = v13;
LABEL_9:
  if (*((void *)v5 + 5))
  {
    -[CSDMessagingConversationMember setNickname:](self, "setNickname:");
    id v5 = v13;
  }

  lightweightPrimary = self->_lightweightPrimary;
  uint64_t v9 = *((void *)v5 + 4);
  if (lightweightPrimary)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[CSDMessagingHandle mergeFrom:](lightweightPrimary, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationMember setLightweightPrimary:](self, "setLightweightPrimary:");
  }

  id v5 = v13;
LABEL_17:
  char v10 = *((_BYTE *)v5 + 56);
  if ((v10 & 1) != 0)
  {
    self->_lightweightPrimaryParticipantID = *((void *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v10 = *((_BYTE *)v5 + 56);
  }

  if ((v10 & 2) != 0)
  {
    self->_uint64_t validationSource = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }

  associationVoucher = self->_associationVoucher;
  uint64_t v12 = *((void *)v5 + 2);
  if (associationVoucher)
  {
    if (v12)
    {
      -[CSDMessagingVoucher mergeFrom:](associationVoucher, "mergeFrom:");
LABEL_26:
      id v5 = v13;
    }
  }

  else if (v12)
  {
    -[CSDMessagingConversationMember setAssociationVoucher:](self, "setAssociationVoucher:");
    goto LABEL_26;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingHandle)lightweightPrimary
{
  return self->_lightweightPrimary;
}

- (void)setLightweightPrimary:(id)a3
{
}

- (unint64_t)lightweightPrimaryParticipantID
{
  return self->_lightweightPrimaryParticipantID;
}

- (CSDMessagingVoucher)associationVoucher
{
  return self->_associationVoucher;
}

- (void)setAssociationVoucher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end