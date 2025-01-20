@interface SDUnlockStashToken
- (BOOL)hasSessionID;
- (BOOL)hasStashToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)stashToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setStashToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockStashToken

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

- (BOOL)hasStashToken
{
  return self->_stashToken != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockStashToken;
  id v3 = -[SDUnlockStashToken description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashToken dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  stashToken = self->_stashToken;
  if (stashToken) {
    [v3 setObject:stashToken forKey:@"stashToken"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockStashTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v7;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_sessionID, 2LL);
    id v4 = v7;
  }

  stashToken = self->_stashToken;
  if (stashToken)
  {
    PBDataWriterWriteDataField(v7, stashToken, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_sessionID;
    *((_BYTE *)v4 + 28) |= 1u;
  }

  if (self->_stashToken)
  {
    v6 = v4;
    objc_msgSend(v4, "setStashToken:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((_BYTE *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_sessionID;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v8 = -[NSData copyWithZone:](self->_stashToken, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v7 = 0;
    goto LABEL_15;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }

  stashToken = self->_stashToken;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2 ^ (unint64_t)-[NSData hash](self->_stashToken, "hash");
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_sessionID;
  return v3 ^ v2 ^ (unint64_t)-[NSData hash](self->_stashToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 28);
  }

  if ((v5 & 1) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SDUnlockStashToken setStashToken:](self, "setStashToken:");
    id v4 = v6;
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

- (NSData)stashToken
{
  return self->_stashToken;
}

- (void)setStashToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end