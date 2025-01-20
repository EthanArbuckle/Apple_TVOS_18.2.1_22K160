@interface SDAuthenticationPairingCreateRecord
- (BOOL)hasErrorCode;
- (BOOL)hasRequestArmingUI;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestArmingUI;
- (NSData)token;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasRequestArmingUI:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRequestArmingUI:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingCreateRecord

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

- (BOOL)hasToken
{
  return self->_token != 0LL;
}

- (void)setRequestArmingUI:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestArmingUI
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationPairingCreateRecord;
  id v3 = -[SDAuthenticationPairingCreateRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingCreateRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v6 forKey:@"errorCode"];
  }

  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_requestArmingUI));
    [v3 setObject:v8 forKey:@"requestArmingUI"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 3LL);
  }
  token = self->_token;
  if (token) {
    PBDataWriterWriteDataField(v6, token, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField(v6, self->_requestArmingUI, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 40) |= 2u;
  }

  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_requestArmingUI;
    *((_BYTE *)v4 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((_BYTE *)v5 + 40) |= 2u;
  }

  id v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 40) |= 1u;
  }

  id v9 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 36) = self->_requestArmingUI;
    *((_BYTE *)v6 + 40) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }

  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 2))
  {
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_20;
  }

  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3))
  {
    char has = (char)self->_has;
  }

  BOOL v9 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) != 0)
    {
      if (self->_requestArmingUI)
      {
        if (!*((_BYTE *)v4 + 36)) {
          goto LABEL_20;
        }
      }

      else if (*((_BYTE *)v4 + 36))
      {
        goto LABEL_20;
      }

      BOOL v9 = 1;
      goto LABEL_21;
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
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v5 = 0LL;
  }
  unint64_t v6 = (unint64_t)-[NSData hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761LL * self->_requestArmingUI;
  }
  else {
    uint64_t v7 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingCreateRecord setSessionID:](self, "setSessionID:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationPairingCreateRecord setToken:](self, "setToken:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    self->_requestArmingUI = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
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

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
}

- (unsigned)type
{
  return 0;
}

@end