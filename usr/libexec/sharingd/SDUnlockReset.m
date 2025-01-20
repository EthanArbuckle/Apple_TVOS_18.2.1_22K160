@interface SDUnlockReset
- (BOOL)hasErrorString;
- (BOOL)hasResetReason;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)resetReason;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorString:(id)a3;
- (void)setHasResetReason:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setResetReason:(unsigned int)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockReset

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

- (void)setResetReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resetReason = a3;
}

- (void)setHasResetReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResetReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorString
{
  return self->_errorString != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockReset;
  id v3 = -[SDUnlockReset description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockReset dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v8 forKey:@"version"];

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

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_sessionID));
  [v3 setObject:v9 forKey:@"sessionID"];

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_resetReason));
    [v3 setObject:v5 forKey:@"resetReason"];
  }

- (BOOL)readFrom:(id)a3
{
  return SDUnlockResetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v7;
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

  PBDataWriterWriteUint32Field(v7, self->_sessionID, 2LL);
  id v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v7, self->_resetReason, 3LL);
    id v4 = v7;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 4u;
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

  v4[5] = self->_sessionID;
  *((_BYTE *)v4 + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[4] = self->_resetReason;
    *((_BYTE *)v4 + 28) |= 1u;
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
    *((_DWORD *)v5 + 5) = self->_sessionID;
    *((_BYTE *)v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)v5 + 6) = self->_version;
  *((_BYTE *)v5 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_resetReason;
    *((_BYTE *)v5 + 28) |= 1u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_19:
    unsigned __int8 v7 = 0;
    goto LABEL_20;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_resetReason != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }

  errorString = self->_errorString;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0LL;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_errorString, "hash");
  }

  uint64_t v2 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_resetReason;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_errorString, "hash");
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
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_sessionID = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_4:
    self->_resetReason = *((_DWORD *)v4 + 4);
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

- (unsigned)resetReason
{
  return self->_resetReason;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end