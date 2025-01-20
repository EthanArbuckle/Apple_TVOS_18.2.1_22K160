@interface SDAuthenticationToken
- (BOOL)hasAksToken;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aksToken;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAksToken:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationToken

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (BOOL)hasAksToken
{
  return self->_aksToken != 0LL;
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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationToken;
  id v3 = -[SDAuthenticationToken description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationToken dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  aksToken = self->_aksToken;
  if (aksToken) {
    [v3 setObject:aksToken forKey:@"aksToken"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v7 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_version, 1LL);
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    PBDataWriterWriteStringField(v6, sessionID, 2LL);
  }
  aksToken = self->_aksToken;
  if (aksToken) {
    PBDataWriterWriteDataField(v6, aksToken, 3LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 2u;
  }

  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v5;
  }

  if (self->_aksToken)
  {
    objc_msgSend(v5, "setAksToken:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_errorCode;
    *((_BYTE *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((_BYTE *)v5 + 36) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((_BYTE *)v6 + 36) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    BOOL v8 = 0;
    goto LABEL_16;
  }

  sessionID = self->_sessionID;
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((void *)v4 + 1))
  {
  }

  BOOL v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_sessionID, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_aksToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[9] & 2) != 0)
  {
    self->_version = v4[8];
    *(_BYTE *)&self->_has |= 2u;
  }

  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationToken setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationToken setAksToken:](self, "setAksToken:");
    NSUInteger v4 = v5;
  }

  if ((v4[9] & 1) != 0)
  {
    self->_errorCode = v4[4];
    *(_BYTE *)&self->_has |= 1u;
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

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end