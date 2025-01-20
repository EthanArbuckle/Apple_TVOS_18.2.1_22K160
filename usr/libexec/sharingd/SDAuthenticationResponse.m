@interface SDAuthenticationResponse
- (BOOL)hasAksToken;
- (BOOL)hasAwdlInfo;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aksToken;
- (NSData)awdlInfo;
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
- (void)setAwdlInfo:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationResponse

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

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0LL;
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

- (BOOL)hasAksToken
{
  return self->_aksToken != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationResponse;
  id v3 = -[SDAuthenticationResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    [v3 setObject:awdlInfo forKey:@"awdlInfo"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v7 forKey:@"errorCode"];
  }

  aksToken = self->_aksToken;
  if (aksToken) {
    [v3 setObject:aksToken forKey:@"aksToken"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v8;
  }

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v8, sessionID, 2LL);
    id v4 = v8;
  }

  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
  {
    PBDataWriterWriteDataField(v8, awdlInfo, 3LL);
    id v4 = v8;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_errorCode, 4LL);
    id v4 = v8;
  }

  aksToken = self->_aksToken;
  if (aksToken)
  {
    PBDataWriterWriteDataField(v8, aksToken, 5LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
  }

  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v5;
  }

  if (self->_awdlInfo)
  {
    objc_msgSend(v5, "setAwdlInfo:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  if (self->_aksToken)
  {
    objc_msgSend(v5, "setAksToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[10] = self->_version;
    *((_BYTE *)v5 + 44) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  id v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_errorCode;
    *((_BYTE *)v6 + 44) |= 1u;
  }

  id v11 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v9 = 0;
    goto LABEL_19;
  }

  sessionID = self->_sessionID;
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }

  aksToken = self->_aksToken;
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_19:

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
  NSUInteger v4 = -[NSString hash](self->_sessionID, "hash");
  unint64_t v5 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSData hash](self->_aksToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[11] & 2) != 0)
  {
    self->_version = v4[10];
    *(_BYTE *)&self->_has |= 2u;
  }

  unint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[SDAuthenticationResponse setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationResponse setAwdlInfo:](self, "setAwdlInfo:");
    NSUInteger v4 = v5;
  }

  if ((v4[11] & 1) != 0)
  {
    self->_errorCode = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationResponse setAksToken:](self, "setAksToken:");
    NSUInteger v4 = v5;
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

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end