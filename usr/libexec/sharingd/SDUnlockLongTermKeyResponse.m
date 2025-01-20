@interface SDUnlockLongTermKeyResponse
- (BOOL)hasKeyFailed;
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyFailed;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
- (NSString)requestID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyFailed:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKeyFailed:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockLongTermKeyResponse

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

- (BOOL)hasRequestID
{
  return self->_requestID != 0LL;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0LL;
}

- (void)setKeyFailed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyFailed = a3;
}

- (void)setHasKeyFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyFailed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockLongTermKeyResponse;
  id v3 = -[SDUnlockLongTermKeyResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_keyFailed));
    [v3 setObject:v7 forKey:@"keyFailed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockLongTermKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
  }
  requestID = self->_requestID;
  if (requestID) {
    PBDataWriterWriteStringField(v6, requestID, 2LL);
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    PBDataWriterWriteDataField(v6, longTermKey, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField(v6, self->_keyFailed, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v5 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    v4 = v5;
  }

  if (self->_longTermKey)
  {
    objc_msgSend(v5, "setLongTermKey:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_keyFailed;
    *((_BYTE *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 28) = self->_keyFailed;
    *((_BYTE *)v6 + 32) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_13;
  }

  requestID = self->_requestID;
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 1))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }

    if (self->_keyFailed)
    {
      if (!*((_BYTE *)v4 + 28)) {
        goto LABEL_13;
      }
    }

    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_13;
    }

    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_requestID, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761LL * self->_keyFailed;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDUnlockLongTermKeyResponse setRequestID:](self, "setRequestID:");
    id v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SDUnlockLongTermKeyResponse setLongTermKey:](self, "setLongTermKey:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_keyFailed = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (BOOL)keyFailed
{
  return self->_keyFailed;
}

- (void).cxx_destruct
{
}

@end