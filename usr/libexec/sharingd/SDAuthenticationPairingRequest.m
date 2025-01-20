@interface SDAuthenticationPairingRequest
- (BOOL)hasLongTermKey;
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
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
- (void)setLongTermKey:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingRequest

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

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationPairingRequest;
  id v3 = -[SDAuthenticationPairingRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_type));
    [v3 setObject:v6 forKey:@"type"];
  }

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v8 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v8;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_type, 2LL);
    id v4 = v8;
  }

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v8, sessionID, 3LL);
    id v4 = v8;
  }

  longTermKey = self->_longTermKey;
  if (longTermKey)
  {
    PBDataWriterWriteDataField(v8, longTermKey, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v6;
  }

  if (self->_longTermKey)
  {
    objc_msgSend(v6, "setLongTermKey:");
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
    *((_DWORD *)v5 + 7) = self->_version;
    *((_BYTE *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  id v10 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v8 = 0;
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_16;
  }

  sessionID = self->_sessionID;
  longTermKey = self->_longTermKey;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_type;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ -[NSString hash](self->_sessionID, "hash");
  return v5 ^ (unint64_t)-[NSData hash](self->_longTermKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 32);
  }

  if ((v5 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingRequest setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }

  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationPairingRequest setLongTermKey:](self, "setLongTermKey:");
    id v4 = v6;
  }
}

- (unsigned)version
{
  return self->_version;
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

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end