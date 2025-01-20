@interface SDAuthenticationPairingResponse
- (BOOL)hasErrorCode;
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestArmingUI;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestArmingUI;
- (NSData)longTermKey;
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
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestArmingUI:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingResponse

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0LL;
}

- (BOOL)hasToken
{
  return self->_token != 0LL;
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

- (void)setRequestArmingUI:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRequestArmingUI
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationPairingResponse;
  id v3 = -[SDAuthenticationPairingResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
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
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v11 forKey:@"errorCode"];

    char v10 = (char)self->_has;
  }

  if ((v10 & 8) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_requestArmingUI));
    [v3 setObject:v12 forKey:@"requestArmingUI"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field(v9, self->_type, 2LL);
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    PBDataWriterWriteStringField(v9, sessionID, 3LL);
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    PBDataWriterWriteDataField(v9, longTermKey, 4LL);
  }
  token = self->_token;
  if (token) {
    PBDataWriterWriteDataField(v9, token, 5LL);
  }
  char v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_errorCode, 6LL);
    char v8 = (char)self->_has;
  }

  if ((v8 & 8) != 0) {
    PBDataWriterWriteBOOLField(v9, self->_requestArmingUI, 7LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[11] = self->_version;
    *((_BYTE *)v4 + 52) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 52) |= 2u;
  }

  v7 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v7;
  }

  if (self->_longTermKey)
  {
    objc_msgSend(v7, "setLongTermKey:");
    v4 = v7;
  }

  if (self->_token)
  {
    objc_msgSend(v7, "setToken:");
    v4 = v7;
  }

  char v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 52) |= 1u;
    char v6 = (char)self->_has;
  }

  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_requestArmingUI;
    *((_BYTE *)v4 + 52) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[11] = self->_version;
    *((_BYTE *)v5 + 52) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v5[10] = self->_type;
    *((_BYTE *)v5 + 52) |= 2u;
  }

  id v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  id v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  id v12 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v13 = (void *)v6[4];
  v6[4] = v12;

  char v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 52) |= 1u;
    char v14 = (char)self->_has;
  }

  if ((v14 & 8) != 0)
  {
    *((_BYTE *)v6 + 48) = self->_requestArmingUI;
    *((_BYTE *)v6 + 52) |= 8u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_version != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_25;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }

  sessionID = self->_sessionID;
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 2))
  {
  }

  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 4))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_25;
    }
  }

  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_25;
  }

  BOOL v9 = (*((_BYTE *)v4 + 52) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
    {
LABEL_25:
      BOOL v9 = 0;
      goto LABEL_26;
    }

    if (self->_requestArmingUI)
    {
      if (!*((_BYTE *)v4 + 48)) {
        goto LABEL_25;
      }
    }

    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_25;
    }

    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_type;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  NSUInteger v5 = -[NSString hash](self->_sessionID, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  unint64_t v7 = (unint64_t)-[NSData hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v8 = 2654435761LL * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v9 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }

  uint64_t v8 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v9 = 2654435761LL * self->_requestArmingUI;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 4u;
    char v5 = *((_BYTE *)v4 + 52);
  }

  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }

  id v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationPairingResponse setSessionID:](self, "setSessionID:");
    id v4 = v7;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingResponse setLongTermKey:](self, "setLongTermKey:");
    id v4 = v7;
  }

  if (*((void *)v4 + 4))
  {
    -[SDAuthenticationPairingResponse setToken:](self, "setToken:");
    id v4 = v7;
  }

  char v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v6 = *((_BYTE *)v4 + 52);
  }

  if ((v6 & 8) != 0)
  {
    self->_requestArmingUI = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
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

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
}

@end