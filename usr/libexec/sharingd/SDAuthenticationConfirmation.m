@interface SDAuthenticationConfirmation
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasSuccess;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationConfirmation

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationConfirmation;
  id v3 = -[SDAuthenticationConfirmation description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationConfirmation dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_success));
    [v3 setObject:v7 forKey:@"success"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v8 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationConfirmationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    PBDataWriterWriteStringField(v6, sessionID, 2LL);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_success, 3LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 32) |= 2u;
  }

  if (self->_sessionID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_success;
    *((_BYTE *)v4 + 32) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 32) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v6 + 28) = self->_success;
    *((_BYTE *)v6 + 32) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
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
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }

  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 2))
  {
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) != 0)
    {
      if (self->_success)
      {
        if (!*((_BYTE *)v4 + 28)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }

      if (!*((_BYTE *)v4 + 28)) {
        goto LABEL_18;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_sessionID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_success;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6;
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761LL * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SDAuthenticationConfirmation setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_success = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 32);
  }

  if ((v5 & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end