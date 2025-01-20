@interface CSDMessagingLinkSyncMessage
- (BOOL)hasCheckInMessage;
- (BOOL)hasRecoverMessage;
- (BOOL)hasType;
- (BOOL)hasUpdateMessage;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingLinkSyncCheckInMessage)checkInMessage;
- (CSDMessagingLinkSyncRecoverMessage)recoverMessage;
- (CSDMessagingLinkSyncUpdateMessage)updateMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCheckInMessage:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRecoverMessage:(id)a3;
- (void)setType:(int)a3;
- (void)setUpdateMessage:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncMessage

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

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1003D82F0 + a3);
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"CheckIn"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"Recover"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUpdateMessage
{
  return self->_updateMessage != 0LL;
}

- (BOOL)hasCheckInMessage
{
  return self->_checkInMessage != 0LL;
}

- (BOOL)hasRecoverMessage
{
  return self->_recoverMessage != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingLinkSyncMessage;
  id v3 = -[CSDMessagingLinkSyncMessage description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4) {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      v7 = *(&off_1003D82F0 + type);
    }
    [v3 setObject:v7 forKey:@"type"];
  }

  updateMessage = self->_updateMessage;
  if (updateMessage)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingLinkSyncUpdateMessage dictionaryRepresentation]( updateMessage,  "dictionaryRepresentation"));
    [v3 setObject:v9 forKey:@"updateMessage"];
  }

  checkInMessage = self->_checkInMessage;
  if (checkInMessage)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingLinkSyncCheckInMessage dictionaryRepresentation]( checkInMessage,  "dictionaryRepresentation"));
    [v3 setObject:v11 forKey:@"checkInMessage"];
  }

  recoverMessage = self->_recoverMessage;
  if (recoverMessage)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingLinkSyncRecoverMessage dictionaryRepresentation]( recoverMessage,  "dictionaryRepresentation"));
    [v3 setObject:v13 forKey:@"recoverMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005EEC0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v9;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v9, self->_type, 2LL);
    id v4 = v9;
  }

  updateMessage = self->_updateMessage;
  if (updateMessage)
  {
    PBDataWriterWriteSubmessage(v9, updateMessage, 3LL);
    id v4 = v9;
  }

  checkInMessage = self->_checkInMessage;
  if (checkInMessage)
  {
    PBDataWriterWriteSubmessage(v9, checkInMessage, 4LL);
    id v4 = v9;
  }

  recoverMessage = self->_recoverMessage;
  if (recoverMessage)
  {
    PBDataWriterWriteSubmessage(v9, recoverMessage, 5LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  v6 = v4;
  if (self->_updateMessage)
  {
    objc_msgSend(v4, "setUpdateMessage:");
    id v4 = v6;
  }

  if (self->_checkInMessage)
  {
    objc_msgSend(v6, "setCheckInMessage:");
    id v4 = v6;
  }

  if (self->_recoverMessage)
  {
    objc_msgSend(v6, "setRecoverMessage:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_version;
    *((_BYTE *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((_BYTE *)v5 + 44) |= 1u;
  }

  id v8 = -[CSDMessagingLinkSyncUpdateMessage copyWithZone:](self->_updateMessage, "copyWithZone:", a3);
  id v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = -[CSDMessagingLinkSyncCheckInMessage copyWithZone:](self->_checkInMessage, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = -[CSDMessagingLinkSyncRecoverMessage copyWithZone:](self->_recoverMessage, "copyWithZone:", a3);
  v13 = (void *)v6[2];
  v6[2] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v9 = 0;
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }

  updateMessage = self->_updateMessage;
  if ((unint64_t)updateMessage | *((void *)v4 + 4)
    && !-[CSDMessagingLinkSyncUpdateMessage isEqual:](updateMessage, "isEqual:"))
  {
    goto LABEL_18;
  }

  checkInMessage = self->_checkInMessage;
  if ((unint64_t)checkInMessage | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingLinkSyncCheckInMessage isEqual:](checkInMessage, "isEqual:")) {
      goto LABEL_18;
    }
  }

  recoverMessage = self->_recoverMessage;
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_type;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ -[CSDMessagingLinkSyncUpdateMessage hash](self->_updateMessage, "hash");
  unint64_t v6 = -[CSDMessagingLinkSyncCheckInMessage hash](self->_checkInMessage, "hash");
  return v5 ^ v6 ^ -[CSDMessagingLinkSyncRecoverMessage hash](self->_recoverMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  char v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    char v6 = *((_BYTE *)v4 + 44);
  }

  if ((v6 & 1) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  updateMessage = self->_updateMessage;
  uint64_t v8 = v5[4];
  v13 = v5;
  if (updateMessage)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingLinkSyncUpdateMessage mergeFrom:](updateMessage, "mergeFrom:");
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingLinkSyncMessage setUpdateMessage:](self, "setUpdateMessage:");
  }

  unint64_t v5 = v13;
LABEL_11:
  checkInMessage = self->_checkInMessage;
  uint64_t v10 = v5[1];
  if (checkInMessage)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[CSDMessagingLinkSyncCheckInMessage mergeFrom:](checkInMessage, "mergeFrom:");
  }

  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[CSDMessagingLinkSyncMessage setCheckInMessage:](self, "setCheckInMessage:");
  }

  unint64_t v5 = v13;
LABEL_17:
  recoverMessage = self->_recoverMessage;
  uint64_t v12 = v5[2];
  if (recoverMessage)
  {
    if (v12)
    {
      -[CSDMessagingLinkSyncRecoverMessage mergeFrom:](recoverMessage, "mergeFrom:");
LABEL_22:
      unint64_t v5 = v13;
    }
  }

  else if (v12)
  {
    -[CSDMessagingLinkSyncMessage setRecoverMessage:](self, "setRecoverMessage:");
    goto LABEL_22;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingLinkSyncUpdateMessage)updateMessage
{
  return self->_updateMessage;
}

- (void)setUpdateMessage:(id)a3
{
}

- (CSDMessagingLinkSyncCheckInMessage)checkInMessage
{
  return self->_checkInMessage;
}

- (void)setCheckInMessage:(id)a3
{
}

- (CSDMessagingLinkSyncRecoverMessage)recoverMessage
{
  return self->_recoverMessage;
}

- (void)setRecoverMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end