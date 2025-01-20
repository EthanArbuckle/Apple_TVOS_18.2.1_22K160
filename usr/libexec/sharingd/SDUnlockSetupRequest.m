@interface SDUnlockSetupRequest
- (BOOL)hasLongTermKey;
- (BOOL)hasLtkHash;
- (BOOL)hasRemoteNeedsLTK;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remoteNeedsLTK;
- (NSData)longTermKey;
- (NSData)ltkHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRemoteNeedsLTK:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setLtkHash:(id)a3;
- (void)setRemoteNeedsLTK:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupRequest

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

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0LL;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0LL;
}

- (void)setRemoteNeedsLTK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_remoteNeedsLTK = a3;
}

- (void)setHasRemoteNeedsLTK:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemoteNeedsLTK
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSetupRequest;
  id v3 = -[SDUnlockSetupRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  ltkHash = self->_ltkHash;
  if (ltkHash) {
    [v3 setObject:ltkHash forKey:@"ltkHash"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_remoteNeedsLTK));
    [v3 setObject:v9 forKey:@"remoteNeedsLTK"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint32Field(v7, self->_sessionID, 2LL);
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    PBDataWriterWriteDataField(v7, longTermKey, 3LL);
  }
  ltkHash = self->_ltkHash;
  if (ltkHash) {
    PBDataWriterWriteDataField(v7, ltkHash, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField(v7, self->_remoteNeedsLTK, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[6] = self->_sessionID;
    *((_BYTE *)v4 + 36) |= 1u;
  }

  v6 = v4;
  if (self->_longTermKey)
  {
    objc_msgSend(v4, "setLongTermKey:");
    v4 = v6;
  }

  if (self->_ltkHash)
  {
    objc_msgSend(v6, "setLtkHash:");
    v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_remoteNeedsLTK;
    *((_BYTE *)v4 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[6] = self->_sessionID;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  id v8 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  id v10 = -[NSData copyWithZone:](self->_ltkHash, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 32) = self->_remoteNeedsLTK;
    *((_BYTE *)v6 + 36) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_18;
  }

  longTermKey = self->_longTermKey;
  ltkHash = self->_ltkHash;
  if ((unint64_t)ltkHash | *((void *)v4 + 2))
  {
  }

  BOOL v8 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
    {
LABEL_18:
      BOOL v8 = 0;
      goto LABEL_19;
    }

    if (self->_remoteNeedsLTK)
    {
      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_18;
      }
    }

    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_18;
    }

    BOOL v8 = 1;
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
  unint64_t v5 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_ltkHash, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761LL * self->_remoteNeedsLTK;
  }
  else {
    uint64_t v7 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 36);
  }

  if ((v5 & 1) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDUnlockSetupRequest setLongTermKey:](self, "setLongTermKey:");
    id v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[SDUnlockSetupRequest setLtkHash:](self, "setLtkHash:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_remoteNeedsLTK = *((_BYTE *)v4 + 32);
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

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
}

- (BOOL)remoteNeedsLTK
{
  return self->_remoteNeedsLTK;
}

- (void).cxx_destruct
{
}

@end