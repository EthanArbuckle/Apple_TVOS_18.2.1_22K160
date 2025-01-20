@interface SDUnlockClassALongTermKeyResponse
- (BOOL)hasErrorCode;
- (BOOL)hasLongTermKey;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
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
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockClassALongTermKeyResponse

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

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0LL;
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
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockClassALongTermKeyResponse;
  id v3 = -[SDUnlockClassALongTermKeyResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_sessionID));
    [v3 setObject:v6 forKey:@"sessionID"];
  }

  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v8 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockClassALongTermKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_sessionID, 2LL);
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    PBDataWriterWriteDataField(v6, longTermKey, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 32) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[6] = self->_sessionID;
    *((_BYTE *)v4 + 32) |= 2u;
  }

  if (self->_longTermKey)
  {
    id v6 = v4;
    objc_msgSend(v4, "setLongTermKey:");
    v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 32) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v5[6] = self->_sessionID;
    *((_BYTE *)v5 + 32) |= 2u;
  }

  id v8 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 32) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }

  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }

    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_sessionID;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  unint64_t v5 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 32);
  }

  if ((v5 & 2) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SDUnlockClassALongTermKeyResponse setLongTermKey:](self, "setLongTermKey:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
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