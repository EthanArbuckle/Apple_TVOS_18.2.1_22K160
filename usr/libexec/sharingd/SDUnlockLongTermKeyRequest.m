@interface SDUnlockLongTermKeyRequest
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
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
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockLongTermKeyRequest

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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockLongTermKeyRequest;
  id v3 = -[SDUnlockLongTermKeyRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockLongTermKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v7;
  }

  requestID = self->_requestID;
  if (requestID)
  {
    PBDataWriterWriteStringField(v7, requestID, 2LL);
    id v4 = v7;
  }

  longTermKey = self->_longTermKey;
  if (longTermKey)
  {
    PBDataWriterWriteDataField(v7, longTermKey, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }

  v5 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    id v4 = v5;
  }

  if (self->_longTermKey)
  {
    objc_msgSend(v5, "setLongTermKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  requestID = self->_requestID;
  longTermKey = self->_longTermKey;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[NSString hash](self->_requestID, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_longTermKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_version = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDUnlockLongTermKeyRequest setRequestID:](self, "setRequestID:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SDUnlockLongTermKeyRequest setLongTermKey:](self, "setLongTermKey:");
    unint64_t v4 = v5;
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

- (void).cxx_destruct
{
}

@end