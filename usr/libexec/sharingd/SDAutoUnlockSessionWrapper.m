@interface SDAutoUnlockSessionWrapper
- (BOOL)hasAksSessionID;
- (BOOL)hasAuthTag;
- (BOOL)hasAwdlCacheID;
- (BOOL)hasEncryptedPayload;
- (BOOL)hasMessageType;
- (BOOL)hasNonce;
- (BOOL)hasPayload;
- (BOOL)hasSenderID;
- (BOOL)hasSessionID;
- (BOOL)hasUseProxy;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useProxy;
- (NSData)authTag;
- (NSData)encryptedPayload;
- (NSData)nonce;
- (NSData)payload;
- (NSData)senderID;
- (NSData)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)aksSessionID;
- (unsigned)awdlCacheID;
- (unsigned)messageType;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAksSessionID:(unsigned int)a3;
- (void)setAuthTag:(id)a3;
- (void)setAwdlCacheID:(unsigned int)a3;
- (void)setEncryptedPayload:(id)a3;
- (void)setHasAksSessionID:(BOOL)a3;
- (void)setHasAwdlCacheID:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasUseProxy:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMessageType:(unsigned int)a3;
- (void)setNonce:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSenderID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setUseProxy:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockSessionWrapper

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (BOOL)hasPayload
{
  return self->_payload != 0LL;
}

- (void)setMessageType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSenderID
{
  return self->_senderID != 0LL;
}

- (void)setUseProxy:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_useProxy = a3;
}

- (void)setHasUseProxy:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUseProxy
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAwdlCacheID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_awdlCacheID = a3;
}

- (void)setHasAwdlCacheID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAwdlCacheID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAksSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aksSessionID = a3;
}

- (void)setHasAksSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAksSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncryptedPayload
{
  return self->_encryptedPayload != 0LL;
}

- (BOOL)hasAuthTag
{
  return self->_authTag != 0LL;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockSessionWrapper;
  id v3 = -[SDAutoUnlockSessionWrapper description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_messageType));
    [v3 setObject:v7 forKey:@"messageType"];
  }

  senderID = self->_senderID;
  if (senderID) {
    [v3 setObject:senderID forKey:@"senderID"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_useProxy));
    [v3 setObject:v15 forKey:@"useProxy"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_awdlCacheID));
  [v3 setObject:v16 forKey:@"awdlCacheID"];

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_aksSessionID));
    [v3 setObject:v10 forKey:@"aksSessionID"];
  }

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockSessionWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v12;
  }

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteDataField(v12, sessionID, 2LL);
    id v4 = v12;
  }

  payload = self->_payload;
  if (payload)
  {
    PBDataWriterWriteDataField(v12, payload, 3LL);
    id v4 = v12;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v12, self->_messageType, 4LL);
    id v4 = v12;
  }

  senderID = self->_senderID;
  if (senderID)
  {
    PBDataWriterWriteDataField(v12, senderID, 5LL);
    id v4 = v12;
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v12, self->_useProxy, 6LL);
    id v4 = v12;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  PBDataWriterWriteUint32Field(v12, self->_awdlCacheID, 7LL);
  id v4 = v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field(v12, self->_aksSessionID, 8LL);
    id v4 = v12;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[20] = self->_version;
    *((_BYTE *)v4 + 88) |= 8u;
  }

  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v6;
  }

  if (self->_payload)
  {
    objc_msgSend(v6, "setPayload:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_messageType;
    *((_BYTE *)v4 + 88) |= 4u;
  }

  if (self->_senderID)
  {
    objc_msgSend(v6, "setSenderID:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 84) = self->_useProxy;
    *((_BYTE *)v4 + 88) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }

  v4[6] = self->_awdlCacheID;
  *((_BYTE *)v4 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    v4[2] = self->_aksSessionID;
    *((_BYTE *)v4 + 88) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5[20] = self->_version;
    *((_BYTE *)v5 + 88) |= 8u;
  }

  id v7 = -[NSData copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[9];
  v6[9] = v7;

  id v9 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v10 = (void *)v6[7];
  v6[7] = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_messageType;
    *((_BYTE *)v6 + 88) |= 4u;
  }

  id v11 = -[NSData copyWithZone:](self->_senderID, "copyWithZone:", a3);
  id v12 = (void *)v6[8];
  v6[8] = v11;

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *((_DWORD *)v6 + 6) = self->_awdlCacheID;
    *((_BYTE *)v6 + 88) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  *((_BYTE *)v6 + 84) = self->_useProxy;
  *((_BYTE *)v6 + 88) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 2) = self->_aksSessionID;
    *((_BYTE *)v6 + 88) |= 1u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_version != *((_DWORD *)v4 + 20)) {
      goto LABEL_43;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_43;
  }

  sessionID = self->_sessionID;
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 7))
  {
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_messageType != *((_DWORD *)v4 + 10)) {
      goto LABEL_43;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_43;
  }

  senderID = self->_senderID;
  if ((unint64_t)senderID | *((void *)v4 + 8))
  {
    char has = (char)self->_has;
  }

  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    {
      if (self->_useProxy)
      {
        if (!*((_BYTE *)v4 + 84)) {
          goto LABEL_43;
        }
        goto LABEL_27;
      }

      if (!*((_BYTE *)v4 + 84)) {
        goto LABEL_27;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_sessionID, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_payload, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761LL * self->_messageType;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = (unint64_t)-[NSData hash](self->_senderID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    uint64_t v8 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v9 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v10 = 0LL;
    goto LABEL_14;
  }

  uint64_t v8 = 2654435761LL * self->_useProxy;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v9 = 2654435761LL * self->_awdlCacheID;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v10 = 2654435761LL * self->_aksSessionID;
LABEL_14:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v12 = v10 ^ (unint64_t)-[NSData hash](self->_encryptedPayload, "hash");
  unint64_t v13 = v12 ^ (unint64_t)-[NSData hash](self->_authTag, "hash");
  return v11 ^ v13 ^ (unint64_t)-[NSData hash](self->_nonce, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }

  id v6 = v4;
  if (*((void *)v4 + 9))
  {
    -[SDAutoUnlockSessionWrapper setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }

  if (*((void *)v4 + 7))
  {
    -[SDAutoUnlockSessionWrapper setPayload:](self, "setPayload:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }

  if (*((void *)v4 + 8))
  {
    -[SDAutoUnlockSessionWrapper setSenderID:](self, "setSenderID:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 0x10) != 0)
  {
    self->_useProxy = *((_BYTE *)v4 + 84);
    *(_BYTE *)&self->_has |= 0x10u;
    char v5 = *((_BYTE *)v4 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 88) & 2) == 0)
  {
    goto LABEL_13;
  }

  self->_awdlCacheID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_14:
    self->_aksSessionID = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unsigned)version
{
  return self->_version;
}

- (NSData)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (NSData)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (unsigned)awdlCacheID
{
  return self->_awdlCacheID;
}

- (unsigned)aksSessionID
{
  return self->_aksSessionID;
}

- (NSData)encryptedPayload
{
  return self->_encryptedPayload;
}

- (void)setEncryptedPayload:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end