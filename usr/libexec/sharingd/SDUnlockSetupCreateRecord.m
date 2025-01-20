@interface SDUnlockSetupCreateRecord
- (BOOL)hasErrorCode;
- (BOOL)hasPairedDeviceID;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)token;
- (NSString)pairedDeviceID;
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
- (void)setPairedDeviceID:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupCreateRecord

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

- (BOOL)hasToken
{
  return self->_token != 0LL;
}

- (BOOL)hasPairedDeviceID
{
  return self->_pairedDeviceID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSetupCreateRecord;
  id v3 = -[SDUnlockSetupCreateRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      if ((has & 1) == 0) {
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v5 forKey:@"errorCode"];
  }

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v8 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v8, self->_sessionID, 2LL);
  id v4 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v8, self->_errorCode, 3LL);
    id v4 = v8;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
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
  *((_BYTE *)v4 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 6) = self->_sessionID;
    *((_BYTE *)v5 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)v5 + 10) = self->_version;
  *((_BYTE *)v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 2) = self->_errorCode;
    *((_BYTE *)v5 + 44) |= 1u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_21:
    unsigned __int8 v8 = 0;
    goto LABEL_22;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }

  token = self->_token;
  pairedDeviceID = self->_pairedDeviceID;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_22:

  return v8;
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
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0LL;
    goto LABEL_8;
  }

  uint64_t v3 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761LL * self->_errorCode;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ (unint64_t)-[NSData hash](self->_token, "hash");
  return v6 ^ -[NSString hash](self->_pairedDeviceID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_sessionID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_4:
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end