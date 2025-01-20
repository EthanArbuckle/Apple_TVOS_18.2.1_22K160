@interface SDAuthenticationPairingDisable
- (BOOL)hasPairingID;
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingID;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPairingID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingDisable

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

- (BOOL)hasPairingID
{
  return self->_pairingID != 0LL;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationPairingDisable;
  id v3 = -[SDAuthenticationPairingDisable description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingDisable dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  pairingID = self->_pairingID;
  if (pairingID) {
    [v3 setObject:pairingID forKey:@"pairingID"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_type));
    [v3 setObject:v6 forKey:@"type"];
  }

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingDisableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v7;
  }

  pairingID = self->_pairingID;
  if (pairingID)
  {
    PBDataWriterWriteStringField(v7, pairingID, 2LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_type, 3LL);
    id v4 = v7;
  }

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v7, sessionID, 4LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 32) |= 2u;
  }

  v5 = v4;
  if (self->_pairingID)
  {
    objc_msgSend(v4, "setPairingID:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  if (self->_sessionID)
  {
    objc_msgSend(v5, "setSessionID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 32) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_pairingID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_type;
    *((_BYTE *)v6 + 32) |= 1u;
  }

  id v9 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }

  pairingID = self->_pairingID;
  if ((unint64_t)pairingID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](pairingID, "isEqual:"))
    {
LABEL_17:
      unsigned __int8 v9 = 0;
      goto LABEL_18;
    }

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_17;
  }

  sessionID = self->_sessionID;
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_pairingID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_sessionID, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[8] & 2) != 0)
  {
    self->_version = v4[7];
    *(_BYTE *)&self->_has |= 2u;
  }

  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationPairingDisable setPairingID:](self, "setPairingID:");
    NSUInteger v4 = v5;
  }

  if ((v4[8] & 1) != 0)
  {
    self->_type = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingDisable setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end