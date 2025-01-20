@interface SDUnlockSetupSessionCreated
- (BOOL)hasErrorCode;
- (BOOL)hasFailureReasons;
- (BOOL)hasLongTermKey;
- (BOOL)hasLtkHash;
- (BOOL)hasLtkSyncing;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)hasWatchNewLTKSyncStatus;
- (BOOL)hasWatchOldLTKSyncStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)ltkSyncing;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
- (NSData)ltkHash;
- (NSData)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)watchNewLTKSyncStatus;
- (int)watchOldLTKSyncStatus;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)failureReasons;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setFailureReasons:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasFailureReasons:(BOOL)a3;
- (void)setHasLtkSyncing:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWatchNewLTKSyncStatus:(BOOL)a3;
- (void)setHasWatchOldLTKSyncStatus:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setLtkHash:(id)a3;
- (void)setLtkSyncing:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchNewLTKSyncStatus:(int)a3;
- (void)setWatchOldLTKSyncStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupSessionCreated

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0LL;
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

- (void)setFailureReasons:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_failureReasons = a3;
}

- (void)setHasFailureReasons:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureReasons
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLtkSyncing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_ltkSyncing = a3;
}

- (void)setHasLtkSyncing:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLtkSyncing
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_watchOldLTKSyncStatus = a3;
}

- (void)setHasWatchOldLTKSyncStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWatchOldLTKSyncStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_watchNewLTKSyncStatus = a3;
}

- (void)setHasWatchNewLTKSyncStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWatchNewLTKSyncStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSetupSessionCreated;
  id v3 = -[SDUnlockSetupSessionCreated description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_sessionID));
    [v3 setObject:v6 forKey:@"sessionID"];
  }

  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v13 forKey:@"errorCode"];

    char v9 = (char)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_11:
      if ((v9 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_failureReasons));
  [v3 setObject:v14 forKey:@"failureReasons"];

  char v9 = (char)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_12:
    if ((v9 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupSessionCreatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v10 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v10;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v10, self->_sessionID, 2LL);
    id v4 = v10;
  }

  token = self->_token;
  if (token)
  {
    PBDataWriterWriteDataField(v10, token, 3LL);
    id v4 = v10;
  }

  longTermKey = self->_longTermKey;
  if (longTermKey)
  {
    PBDataWriterWriteDataField(v10, longTermKey, 4LL);
    id v4 = v10;
  }

  char v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v10, self->_errorCode, 5LL);
    id v4 = v10;
    char v8 = (char)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_11:
      if ((v8 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }

  PBDataWriterWriteUint32Field(v10, self->_failureReasons, 6LL);
  id v4 = v10;
  char v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 64) |= 8u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v4[8] = self->_sessionID;
    *((_BYTE *)v4 + 64) |= 4u;
  }

  v7 = v4;
  if (self->_token)
  {
    objc_msgSend(v4, "setToken:");
    id v4 = v7;
  }

  if (self->_longTermKey)
  {
    objc_msgSend(v7, "setLongTermKey:");
    id v4 = v7;
  }

  char v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 64) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }

  v4[3] = self->_failureReasons;
  *((_BYTE *)v4 + 64) |= 2u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[12] = self->_version;
    *((_BYTE *)v5 + 64) |= 8u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v5[8] = self->_sessionID;
    *((_BYTE *)v5 + 64) |= 4u;
  }

  id v8 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  char v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  char v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 64) |= 1u;
    char v12 = (char)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_7:
      if ((v12 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }

  *((_DWORD *)v6 + 3) = self->_failureReasons;
  *((_BYTE *)v6 + 64) |= 2u;
  char v12 = (char)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_8:
    if ((v12 & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    *((_DWORD *)v6 + 14) = self->_watchOldLTKSyncStatus;
    *((_BYTE *)v6 + 64) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_46;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_sessionID != *((_DWORD *)v4 + 8)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_46;
  }

  token = self->_token;
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_46;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_failureReasons != *((_DWORD *)v4 + 3)) {
      goto LABEL_46;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_46;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
    {
      if (self->_ltkSyncing)
      {
        if (!*((_BYTE *)v4 + 60)) {
          goto LABEL_46;
        }
        goto LABEL_34;
      }

      if (!*((_BYTE *)v4 + 60)) {
        goto LABEL_34;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_sessionID;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  unint64_t v5 = (unint64_t)-[NSData hash](self->_token, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v7 = 2654435761LL * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v8 = 2654435761LL * self->_failureReasons;
      if ((*(_BYTE *)&self->_has & 0x40) != 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v8 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761LL * self->_ltkSyncing;
    if ((*(_BYTE *)&self->_has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v10 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v11 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_ltkHash, "hash");
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    char v5 = *((_BYTE *)v4 + 64);
  }

  if ((v5 & 4) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }

  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[SDUnlockSetupSessionCreated setToken:](self, "setToken:");
    id v4 = v7;
  }

  if (*((void *)v4 + 2))
  {
    -[SDUnlockSetupSessionCreated setLongTermKey:](self, "setLongTermKey:");
    id v4 = v7;
  }

  char v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v6 = *((_BYTE *)v4 + 64);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_11;
  }

  self->_failureReasons = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  char v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
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

- (unsigned)failureReasons
{
  return self->_failureReasons;
}

- (BOOL)ltkSyncing
{
  return self->_ltkSyncing;
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end