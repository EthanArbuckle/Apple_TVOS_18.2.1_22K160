@interface SDAuthenticationApprovePrompt
- (BOOL)biometricOnly;
- (BOOL)hasAppName;
- (BOOL)hasBiometricOnly;
- (BOOL)hasBundleID;
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBiometricOnly:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setHasBiometricOnly:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationApprovePrompt

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

- (BOOL)hasAppName
{
  return self->_appName != 0LL;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0LL;
}

- (void)setBiometricOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_biometricOnly = a3;
}

- (void)setHasBiometricOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBiometricOnly
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationApprovePrompt;
  id v3 = -[SDAuthenticationApprovePrompt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationApprovePrompt dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_biometricOnly));
    [v3 setObject:v10 forKey:@"biometricOnly"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationApprovePromptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint32Field(v8, self->_type, 2LL);
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    PBDataWriterWriteStringField(v8, sessionID, 3LL);
  }
  appName = self->_appName;
  if (appName) {
    PBDataWriterWriteStringField(v8, appName, 4LL);
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    PBDataWriterWriteStringField(v8, bundleID, 5LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField(v8, self->_biometricOnly, 6LL);
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }

  if (self->_appName)
  {
    objc_msgSend(v6, "setAppName:");
    v4 = v6;
  }

  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_biometricOnly;
    *((_BYTE *)v4 + 44) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[9] = self->_version;
    *((_BYTE *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v5[8] = self->_type;
    *((_BYTE *)v5 + 44) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v13 = (void *)v6[2];
  v6[2] = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 40) = self->_biometricOnly;
    *((_BYTE *)v6 + 44) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_20;
  }

  sessionID = self->_sessionID;
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 1))
  {
  }

  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 2))
  {
  }

  BOOL v9 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
    {
LABEL_20:
      BOOL v9 = 0;
      goto LABEL_21;
    }

    if (self->_biometricOnly)
    {
      if (!*((_BYTE *)v4 + 40)) {
        goto LABEL_20;
      }
    }

    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_20;
    }

    BOOL v9 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_type;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  NSUInteger v5 = -[NSString hash](self->_sessionID, "hash");
  NSUInteger v6 = -[NSString hash](self->_appName, "hash");
  NSUInteger v7 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761LL * self->_biometricOnly;
  }
  else {
    uint64_t v8 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 44);
  }

  if ((v5 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationApprovePrompt setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }

  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationApprovePrompt setAppName:](self, "setAppName:");
    id v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationApprovePrompt setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    self->_biometricOnly = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 4u;
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

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void).cxx_destruct
{
}

@end