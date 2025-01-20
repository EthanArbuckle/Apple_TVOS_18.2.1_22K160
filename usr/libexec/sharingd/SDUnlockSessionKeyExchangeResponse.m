@interface SDUnlockSessionKeyExchangeResponse
- (BOOL)hasKey;
- (BOOL)hasKeyFailed;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyFailed;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyFailed:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyFailed:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionKeyExchangeResponse

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

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (void)setKeyFailed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_keyFailed = a3;
}

- (void)setHasKeyFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeyFailed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSessionKeyExchangeResponse;
  id v3 = -[SDUnlockSessionKeyExchangeResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_sessionID));
    [v3 setObject:v6 forKey:@"sessionID"];
  }

  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_keyFailed));
    [v3 setObject:v8 forKey:@"keyFailed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_sessionID, 2LL);
  }
  key = self->_key;
  if (key) {
    PBDataWriterWriteDataField(v6, key, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField(v6, self->_keyFailed, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_version;
    *((_BYTE *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[4] = self->_sessionID;
    *((_BYTE *)v4 + 28) |= 1u;
  }

  if (self->_key)
  {
    id v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 24) = self->_keyFailed;
    *((_BYTE *)v4 + 28) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[5] = self->_version;
    *((_BYTE *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[4] = self->_sessionID;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v8 = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 24) = self->_keyFailed;
    *((_BYTE *)v6 + 28) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_17;
  }

  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_keyFailed)
      {
        if (!*((_BYTE *)v4 + 24)) {
          goto LABEL_17;
        }
      }

      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_17;
      }

      BOOL v8 = 1;
      goto LABEL_18;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_sessionID;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  unint64_t v5 = (unint64_t)-[NSData hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761LL * self->_keyFailed;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 28);
  }

  if ((v5 & 1) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SDUnlockSessionKeyExchangeResponse setKey:](self, "setKey:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    self->_keyFailed = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)keyFailed
{
  return self->_keyFailed;
}

- (void).cxx_destruct
{
}

@end