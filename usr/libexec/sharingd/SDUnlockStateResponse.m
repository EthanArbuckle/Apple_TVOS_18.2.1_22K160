@interface SDUnlockStateResponse
- (BOOL)hasPasscodeEnabled;
- (BOOL)hasUnlockEnabled;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)passcodeEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)unlockEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPasscodeEnabled:(BOOL)a3;
- (void)setHasUnlockEnabled:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPasscodeEnabled:(BOOL)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockStateResponse

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unlockEnabled = a3;
}

- (void)setHasUnlockEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnlockEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_passcodeEnabled = a3;
}

- (void)setHasPasscodeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPasscodeEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockStateResponse;
  id v3 = -[SDUnlockStateResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStateResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_unlockEnabled));
    [v3 setObject:v8 forKey:@"unlockEnabled"];

    if ((*(_BYTE *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_4;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
  [v3 setObject:v7 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_passcodeEnabled));
    [v3 setObject:v5 forKey:@"passcodeEnabled"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockStateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    PBDataWriterWriteBOOLField(v6, self->_unlockEnabled, 2LL);
    id v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField(v6, self->_passcodeEnabled, 3LL);
    id v4 = v6;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v4[13] = self->_unlockEnabled;
    v4[16] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((_DWORD *)v4 + 2) = self->_version;
  v4[16] |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[12] = self->_passcodeEnabled;
    v4[16] |= 2u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_version;
    *((_BYTE *)result + 16) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)result + 13) = self->_unlockEnabled;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_BYTE *)result + 12) = self->_passcodeEnabled;
  *((_BYTE *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_version != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_unlockEnabled)
    {
      if (!*((_BYTE *)v4 + 13)) {
        goto LABEL_17;
      }
    }

    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }

  BOOL v6 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_passcodeEnabled)
      {
        if (!*((_BYTE *)v4 + 12)) {
          goto LABEL_17;
        }
      }

      else if (*((_BYTE *)v4 + 12))
      {
        goto LABEL_17;
      }

      BOOL v6 = 1;
      goto LABEL_18;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0LL;
    return v3 ^ v2 ^ v4;
  }

  uint64_t v2 = 2654435761LL * self->_version;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_unlockEnabled;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_passcodeEnabled;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    self->_unlockEnabled = *((_BYTE *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 16) & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  self->_version = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_passcodeEnabled = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }

- (unsigned)version
{
  return self->_version;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (BOOL)passcodeEnabled
{
  return self->_passcodeEnabled;
}

@end