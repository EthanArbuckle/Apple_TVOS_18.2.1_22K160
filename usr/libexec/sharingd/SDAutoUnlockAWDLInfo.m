@interface SDAutoUnlockAWDLInfo
- (BOOL)authPrompt;
- (BOOL)hasAppName;
- (BOOL)hasAuthPrompt;
- (BOOL)hasAwdlInfo;
- (BOOL)hasErrorCode;
- (BOOL)hasIsAuthenticatingForSiri;
- (BOOL)hasKeyData;
- (BOOL)hasPhoneUnlockDate;
- (BOOL)hasSkipMotionCheck;
- (BOOL)hasSupportsConfirmationACK;
- (BOOL)hasUseToken;
- (BOOL)hasVersion;
- (BOOL)isAuthenticatingForSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)skipMotionCheck;
- (BOOL)supportsConfirmationACK;
- (BOOL)useToken;
- (NSData)awdlInfo;
- (NSData)keyData;
- (NSString)appName;
- (double)phoneUnlockDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAuthPrompt:(BOOL)a3;
- (void)setAwdlInfo:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasAuthPrompt:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasIsAuthenticatingForSiri:(BOOL)a3;
- (void)setHasPhoneUnlockDate:(BOOL)a3;
- (void)setHasSkipMotionCheck:(BOOL)a3;
- (void)setHasSupportsConfirmationACK:(BOOL)a3;
- (void)setHasUseToken:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsAuthenticatingForSiri:(BOOL)a3;
- (void)setKeyData:(id)a3;
- (void)setPhoneUnlockDate:(double)a3;
- (void)setSkipMotionCheck:(BOOL)a3;
- (void)setSupportsConfirmationACK:(BOOL)a3;
- (void)setUseToken:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAWDLInfo

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

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0LL;
}

- (void)setUseToken:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_useToken = a3;
}

- (void)setHasUseToken:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasUseToken
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0LL;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAuthPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_authPrompt = a3;
}

- (void)setHasAuthPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAuthPrompt
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_supportsConfirmationACK = a3;
}

- (void)setHasSupportsConfirmationACK:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsConfirmationACK
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppName
{
  return self->_appName != 0LL;
}

- (void)setPhoneUnlockDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneUnlockDate = a3;
}

- (void)setHasPhoneUnlockDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneUnlockDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_skipMotionCheck = a3;
}

- (void)setHasSkipMotionCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSkipMotionCheck
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isAuthenticatingForSiri = a3;
}

- (void)setHasIsAuthenticatingForSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAuthenticatingForSiri
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAWDLInfo;
  id v3 = -[SDAutoUnlockAWDLInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    [v3 setObject:awdlInfo forKey:@"awdlInfo"];
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_useToken));
    [v3 setObject:v6 forKey:@"useToken"];
  }

  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v14 forKey:@"errorCode"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_authPrompt));
  [v3 setObject:v15 forKey:@"authPrompt"];

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_supportsConfirmationACK));
    [v3 setObject:v9 forKey:@"supportsConfirmationACK"];
  }

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field(v9, self->_version, 1LL);
  }
  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    PBDataWriterWriteDataField(v9, awdlInfo, 2LL);
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField(v9, self->_useToken, 3LL);
  }
  keyData = self->_keyData;
  if (keyData) {
    PBDataWriterWriteDataField(v9, keyData, 4LL);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_errorCode, 5LL);
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }

  PBDataWriterWriteBOOLField(v9, self->_authPrompt, 6LL);
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField(v9, self->_supportsConfirmationACK, 7LL);
LABEL_13:
  appName = self->_appName;
  if (appName) {
    PBDataWriterWriteStringField(v9, appName, 8LL);
  }
  char v8 = (char)self->_has;
  if ((v8 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0) {
      goto LABEL_17;
    }
LABEL_24:
    PBDataWriterWriteBOOLField(v9, self->_skipMotionCheck, 10LL);
    if ((*(_BYTE *)&self->_has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  PBDataWriterWriteDoubleField(v9, 9LL, self->_phoneUnlockDate);
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0) {
    goto LABEL_24;
  }
LABEL_17:
  if ((v8 & 0x10) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField(v9, self->_isAuthenticatingForSiri, 11LL);
LABEL_19:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 60) |= 4u;
  }

  v7 = v4;
  if (self->_awdlInfo)
  {
    objc_msgSend(v4, "setAwdlInfo:");
    v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_useToken;
    *((_BYTE *)v4 + 60) |= 0x80u;
  }

  if (self->_keyData)
  {
    objc_msgSend(v7, "setKeyData:");
    v4 = v7;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_errorCode;
    *((_BYTE *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }

  *((_BYTE *)v4 + 52) = self->_authPrompt;
  *((_BYTE *)v4 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 55) = self->_supportsConfirmationACK;
    *((_BYTE *)v4 + 60) |= 0x40u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[12] = self->_version;
    *((_BYTE *)v5 + 60) |= 4u;
  }

  id v7 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  char v8 = (void *)v6[3];
  v6[3] = v7;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v6 + 56) = self->_useToken;
    *((_BYTE *)v6 + 60) |= 0x80u;
  }

  id v9 = -[NSData copyWithZone:](self->_keyData, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_errorCode;
    *((_BYTE *)v6 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }

  *((_BYTE *)v6 + 52) = self->_authPrompt;
  *((_BYTE *)v6 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_BYTE *)v6 + 55) = self->_supportsConfirmationACK;
    *((_BYTE *)v6 + 60) |= 0x40u;
  }

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[60] & 4) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_60;
    }
  }

  else if ((v4[60] & 4) != 0)
  {
    goto LABEL_60;
  }

  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((void *)v4 + 3))
  {
    char has = (char)self->_has;
  }

  int v8 = v4[60];
  if (has < 0)
  {
    if ((v8 & 0x80000000) == 0) {
      goto LABEL_60;
    }
    if (self->_useToken)
    {
      if (!v4[56]) {
        goto LABEL_60;
      }
    }

    else if (v4[56])
    {
      goto LABEL_60;
    }
  }

  else if (v8 < 0)
  {
    goto LABEL_60;
  }

  keyData = self->_keyData;
  if ((unint64_t)keyData | *((void *)v4 + 5))
  {
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    if ((v4[60] & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 8)) {
      goto LABEL_60;
    }
  }

  else if ((v4[60] & 2) != 0)
  {
    goto LABEL_60;
  }

  if ((has & 8) != 0)
  {
    if ((v4[60] & 8) == 0) {
      goto LABEL_60;
    }
    if (self->_authPrompt)
    {
      if (!v4[52]) {
        goto LABEL_60;
      }
    }

    else if (v4[52])
    {
      goto LABEL_60;
    }
  }

  else if ((v4[60] & 8) != 0)
  {
    goto LABEL_60;
  }

  if ((has & 0x40) != 0)
  {
    if ((v4[60] & 0x40) == 0) {
      goto LABEL_60;
    }
    if (self->_supportsConfirmationACK)
    {
      if (!v4[55]) {
        goto LABEL_60;
      }
    }

    else if (v4[55])
    {
      goto LABEL_60;
    }
  }

  else if ((v4[60] & 0x40) != 0)
  {
    goto LABEL_60;
  }

  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 2))
  {
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((v4[60] & 1) != 0)
  {
    goto LABEL_60;
  }

  if ((has & 0x20) != 0)
  {
    if ((v4[60] & 0x20) == 0) {
      goto LABEL_60;
    }
    if (self->_skipMotionCheck)
    {
      if (!v4[54]) {
        goto LABEL_60;
      }
    }

    else if (v4[54])
    {
      goto LABEL_60;
    }
  }

  else if ((v4[60] & 0x20) != 0)
  {
    goto LABEL_60;
  }

  BOOL v11 = (v4[60] & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v4[60] & 0x10) != 0)
    {
      if (self->_isAuthenticatingForSiri)
      {
        if (!v4[53]) {
          goto LABEL_60;
        }
      }

      else if (v4[53])
      {
        goto LABEL_60;
      }

      BOOL v11 = 1;
      goto LABEL_61;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v19 = 0LL;
  }
  unint64_t v3 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0) {
    uint64_t v4 = 2654435761LL * self->_useToken;
  }
  else {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = (unint64_t)-[NSData hash](self->_keyData, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v7 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }

  uint64_t v6 = 2654435761LL * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v7 = 2654435761LL * self->_authPrompt;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v8 = 2654435761LL * self->_supportsConfirmationACK;
    goto LABEL_14;
  }

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  if ((v4[60] & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }

  uint64_t v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockAWDLInfo setAwdlInfo:](self, "setAwdlInfo:");
    uint64_t v4 = v7;
  }

  if (v4[60] < 0)
  {
    self->_useToken = v4[56];
    *(_BYTE *)&self->_has |= 0x80u;
  }

  if (*((void *)v4 + 5))
  {
    -[SDAutoUnlockAWDLInfo setKeyData:](self, "setKeyData:");
    uint64_t v4 = v7;
  }

  char v5 = v4[60];
  if ((v5 & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = v4[60];
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else if ((v4[60] & 8) == 0)
  {
    goto LABEL_11;
  }

  self->_authPrompt = v4[52];
  *(_BYTE *)&self->_has |= 8u;
  if ((v4[60] & 0x40) != 0)
  {
LABEL_12:
    self->_supportsConfirmationACK = v4[55];
    *(_BYTE *)&self->_has |= 0x40u;
  }

- (unsigned)version
{
  return self->_version;
}

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (BOOL)useToken
{
  return self->_useToken;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)authPrompt
{
  return self->_authPrompt;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (double)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void).cxx_destruct
{
}

@end