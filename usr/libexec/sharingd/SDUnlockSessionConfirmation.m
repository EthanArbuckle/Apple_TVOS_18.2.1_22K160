@interface SDUnlockSessionConfirmation
- (BOOL)hasSessionID;
- (BOOL)hasSuccess;
- (BOOL)hasSupportsACK;
- (BOOL)hasSuppressNotification;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (BOOL)supportsACK;
- (BOOL)suppressNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasSupportsACK:(BOOL)a3;
- (void)setHasSuppressNotification:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setSupportsACK:(BOOL)a3;
- (void)setSuppressNotification:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionConfirmation

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

- (void)setSupportsACK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsACK = a3;
}

- (void)setHasSupportsACK:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsACK
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSuppressNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suppressNotification = a3;
}

- (void)setHasSuppressNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressNotification
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSessionConfirmation;
  id v3 = -[SDUnlockSessionConfirmation description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionConfirmation dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v7 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_sessionID));
  [v3 setObject:v8 forKey:@"sessionID"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_supportsACK));
    [v3 setObject:v10 forKey:@"supportsACK"];

    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_6;
  }

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionConfirmationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_version, 1LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v5, self->_sessionID, 2LL);
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    PBDataWriterWriteBOOLField(v5, self->_supportsACK, 4LL);
    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_version;
    *((_BYTE *)v4 + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  v4[2] = self->_sessionID;
  *((_BYTE *)v4 + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *((_BYTE *)v4 + 17) = self->_supportsACK;
    *((_BYTE *)v4 + 20) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_version;
    *((_BYTE *)result + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 2) = self->_sessionID;
  *((_BYTE *)result + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_version != *((_DWORD *)v4 + 3)) {
      goto LABEL_30;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 2)) {
      goto LABEL_30;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_30;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 16)) {
        goto LABEL_30;
      }
    }

    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_30;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_30;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_supportsACK)
    {
      if (!*((_BYTE *)v4 + 17)) {
        goto LABEL_30;
      }
    }

    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_30;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_30;
  }

  BOOL v6 = (*((_BYTE *)v4 + 20) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
    {
      if (self->_suppressNotification)
      {
        if (!*((_BYTE *)v4 + 18)) {
          goto LABEL_30;
        }
      }

      else if (*((_BYTE *)v4 + 18))
      {
        goto LABEL_30;
      }

      BOOL v6 = 1;
      goto LABEL_31;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_sessionID;
      if ((*(_BYTE *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761LL * self->_success;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0LL;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_sessionID = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    self->_supportsACK = *((_BYTE *)v4 + 17);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 20) & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)supportsACK
{
  return self->_supportsACK;
}

- (BOOL)suppressNotification
{
  return self->_suppressNotification;
}

@end