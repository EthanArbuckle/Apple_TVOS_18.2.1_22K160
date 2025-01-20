@interface SDUnlockLockStateUpdated
- (BOOL)hasUnlocked;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unlocked;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUnlocked:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setUnlocked:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockLockStateUpdated

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

- (void)setUnlocked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_unlocked = a3;
}

- (void)setHasUnlocked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUnlocked
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockLockStateUpdated;
  id v3 = -[SDUnlockLockStateUpdated description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockStateUpdated dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_unlocked));
    [v3 setObject:v6 forKey:@"unlocked"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockLockStateUpdatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_unlocked, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_version;
    *((_BYTE *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 12) = self->_unlocked;
    *((_BYTE *)v4 + 16) |= 2u;
  }
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
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_unlocked;
    *((_BYTE *)result + 16) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_version != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_9;
  }

  BOOL v6 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v6 = 0;
      goto LABEL_10;
    }

    if (self->_unlocked)
    {
      if (!*((_BYTE *)v4 + 12)) {
        goto LABEL_9;
      }
    }

    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_9;
    }

    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_unlocked;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 16);
  }

  if ((v5 & 2) != 0)
  {
    self->_unlocked = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

@end