@interface SDUnlockSessionKeyExchangeRequest
- (BOOL)hasErrorCode;
- (BOOL)hasKey;
- (BOOL)hasSessionID;
- (BOOL)hasUsingRecord;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usingRecord;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasUsingRecord:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setUsingRecord:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionKeyExchangeRequest

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

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUsingRecord:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_usingRecord = a3;
}

- (void)setHasUsingRecord:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUsingRecord
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest;
  id v3 = -[SDUnlockSessionKeyExchangeRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v9 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_sessionID));
  [v3 setObject:v10 forKey:@"sessionID"];

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_usingRecord));
    [v3 setObject:v5 forKey:@"usingRecord"];
  }

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v6, self->_sessionID, 2LL);
  if ((*(_BYTE *)&self->_has & 8) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField(v6, self->_usingRecord, 3LL);
LABEL_5:
  key = self->_key;
  if (key) {
    PBDataWriterWriteDataField(v6, key, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  v4[6] = self->_sessionID;
  *((_BYTE *)v4 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 32) = self->_usingRecord;
    *((_BYTE *)v4 + 36) |= 8u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  v5[6] = self->_sessionID;
  *((_BYTE *)v5 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 32) = self->_usingRecord;
    *((_BYTE *)v5 + 36) |= 8u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_27;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_27;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_27;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_usingRecord)
    {
      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_27;
      }
    }

    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_27;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_27;
  }

  key = self->_key;
  if (!-[NSData isEqual:](key, "isEqual:"))
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }

  char has = (char)self->_has;
LABEL_23:
  BOOL v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  uint64_t v3 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761LL * self->_usingRecord;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_sessionID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
LABEL_4:
    self->_usingRecord = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 8u;
  }

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)usingRecord
{
  return self->_usingRecord;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end