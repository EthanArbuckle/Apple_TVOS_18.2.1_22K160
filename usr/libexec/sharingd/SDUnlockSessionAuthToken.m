@interface SDUnlockSessionAuthToken
- (BOOL)hasAuthToken;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionAuthToken

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

- (BOOL)hasAuthToken
{
  return self->_authToken != 0LL;
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
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSessionAuthToken;
  id v3 = -[SDUnlockSessionAuthToken description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  authToken = self->_authToken;
  if (authToken) {
    [v3 setObject:authToken forKey:@"authToken"];
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
  return SDUnlockSessionAuthTokenReadFrom((uint64_t)self, (uint64_t)a3);
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
  authToken = self->_authToken;
  if (authToken) {
    PBDataWriterWriteDataField(v6, authToken, 3LL);
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
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[5] = self->_sessionID;
    *((_BYTE *)v4 + 28) |= 2u;
  }

  if (self->_authToken)
  {
    id v6 = v4;
    objc_msgSend(v4, "setAuthToken:");
    v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_errorCode;
    *((_BYTE *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 28) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v5[5] = self->_sessionID;
    *((_BYTE *)v5 + 28) |= 2u;
  }

  id v8 = -[NSData copyWithZone:](self->_authToken, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((_BYTE *)v6 + 28) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }

  authToken = self->_authToken;
  if ((unint64_t)authToken | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](authToken, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }

    char has = (char)self->_has;
  }

  BOOL v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
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
  unint64_t v5 = (unint64_t)-[NSData hash](self->_authToken, "hash");
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
  char v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 28);
  }

  if ((v5 & 2) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SDUnlockSessionAuthToken setAuthToken:](self, "setAuthToken:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 4);
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

- (NSData)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
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