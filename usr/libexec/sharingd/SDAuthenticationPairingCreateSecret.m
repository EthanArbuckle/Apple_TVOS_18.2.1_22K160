@interface SDAuthenticationPairingCreateSecret
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)token;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingCreateSecret

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (BOOL)hasToken
{
  return self->_token != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationPairingCreateSecret;
  id v3 = -[SDAuthenticationPairingCreateSecret description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingCreateSecret dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingCreateSecretReadFrom((uint64_t)self, (uint64_t)a3);
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

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v7, sessionID, 2LL);
    id v4 = v7;
  }

  token = self->_token;
  if (token)
  {
    PBDataWriterWriteDataField(v7, token, 3LL);
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
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v5;
  }

  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
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

  id v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

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

  sessionID = self->_sessionID;
  token = self->_token;
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
  unint64_t v4 = -[NSString hash](self->_sessionID, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_token, "hash");
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
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationPairingCreateSecret setSessionID:](self, "setSessionID:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingCreateSecret setToken:](self, "setToken:");
    unint64_t v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

- (unsigned)type
{
  return 0;
}

@end