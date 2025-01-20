@interface SDAuthenticationRequest
- (BOOL)hasAksToken;
- (BOOL)hasAwdlInfo;
- (BOOL)hasRangingToken;
- (BOOL)hasRegistrationID;
- (BOOL)hasSessionID;
- (BOOL)hasSessionStartDate;
- (BOOL)hasType;
- (BOOL)hasUnlockDate;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aksToken;
- (NSData)awdlInfo;
- (NSData)rangingToken;
- (NSString)registrationID;
- (NSString)sessionID;
- (double)sessionStartDate;
- (double)unlockDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAksToken:(id)a3;
- (void)setAwdlInfo:(id)a3;
- (void)setHasSessionStartDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUnlockDate:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRangingToken:(id)a3;
- (void)setRegistrationID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionStartDate:(double)a3;
- (void)setType:(unsigned int)a3;
- (void)setUnlockDate:(double)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0LL;
}

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0LL;
}

- (BOOL)hasRangingToken
{
  return self->_rangingToken != 0LL;
}

- (void)setUnlockDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_unlockDate = a3;
}

- (void)setHasUnlockDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUnlockDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAksToken
{
  return self->_aksToken != 0LL;
}

- (void)setSessionStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionStartDate = a3;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRegistrationID
{
  return self->_registrationID != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAuthenticationRequest;
  id v3 = -[SDAuthenticationRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_type));
    [v3 setObject:v6 forKey:@"type"];
  }

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    [v3 setObject:awdlInfo forKey:@"awdlInfo"];
  }
  rangingToken = self->_rangingToken;
  if (rangingToken) {
    [v3 setObject:rangingToken forKey:@"rangingToken"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_unlockDate));
    [v3 setObject:v10 forKey:@"unlockDate"];
  }

  aksToken = self->_aksToken;
  if (aksToken) {
    [v3 setObject:aksToken forKey:@"aksToken"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_sessionStartDate));
    [v3 setObject:v12 forKey:@"sessionStartDate"];
  }

  registrationID = self->_registrationID;
  if (registrationID) {
    [v3 setObject:registrationID forKey:@"registrationID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v11 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v11;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_type, 2LL);
    id v4 = v11;
  }

  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v11, sessionID, 3LL);
    id v4 = v11;
  }

  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
  {
    PBDataWriterWriteDataField(v11, awdlInfo, 4LL);
    id v4 = v11;
  }

  rangingToken = self->_rangingToken;
  if (rangingToken)
  {
    PBDataWriterWriteDataField(v11, rangingToken, 5LL);
    id v4 = v11;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v11, 6LL, self->_unlockDate);
    id v4 = v11;
  }

  aksToken = self->_aksToken;
  if (aksToken)
  {
    PBDataWriterWriteDataField(v11, aksToken, 7LL);
    id v4 = v11;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v11, 8LL, self->_sessionStartDate);
    id v4 = v11;
  }

  registrationID = self->_registrationID;
  if (registrationID)
  {
    PBDataWriterWriteStringField(v11, registrationID, 9LL);
    id v4 = v11;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[17] = self->_version;
    *((_BYTE *)v4 + 72) |= 8u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v4[16] = self->_type;
    *((_BYTE *)v4 + 72) |= 4u;
  }

  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v6;
  }

  if (self->_awdlInfo)
  {
    objc_msgSend(v6, "setAwdlInfo:");
    id v4 = v6;
  }

  if (self->_rangingToken)
  {
    objc_msgSend(v6, "setRangingToken:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_unlockDate;
    *((_BYTE *)v4 + 72) |= 2u;
  }

  if (self->_aksToken)
  {
    objc_msgSend(v6, "setAksToken:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_sessionStartDate;
    *((_BYTE *)v4 + 72) |= 1u;
  }

  if (self->_registrationID)
  {
    objc_msgSend(v6, "setRegistrationID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[17] = self->_version;
    *((_BYTE *)v5 + 72) |= 8u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v5[16] = self->_type;
    *((_BYTE *)v5 + 72) |= 4u;
  }

  id v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  id v10 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  id v11 = (void *)v6[4];
  v6[4] = v10;

  id v12 = -[NSData copyWithZone:](self->_rangingToken, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[2] = *(void *)&self->_unlockDate;
    *((_BYTE *)v6 + 72) |= 2u;
  }

  id v14 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = *(void *)&self->_sessionStartDate;
    *((_BYTE *)v6 + 72) |= 1u;
  }

  id v16 = -[NSString copyWithZone:](self->_registrationID, "copyWithZone:", a3);
  v17 = (void *)v6[6];
  v6[6] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_version != *((_DWORD *)v4 + 17)) {
      goto LABEL_33;
    }
  }

  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_33;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_33;
    }
  }

  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_33;
  }

  sessionID = self->_sessionID;
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((void *)v4 + 4))
  {
  }

  rangingToken = self->_rangingToken;
  if ((unint64_t)rangingToken | *((void *)v4 + 5))
  {
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_33;
  }

  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](aksToken, "isEqual:"))
    {
LABEL_33:
      unsigned __int8 v11 = 0;
      goto LABEL_34;
    }

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_33;
  }

  registrationID = self->_registrationID;
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761LL * self->_type;
      goto LABEL_6;
    }
  }

  uint64_t v4 = 0LL;
LABEL_6:
  NSUInteger v5 = -[NSString hash](self->_sessionID, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  unint64_t v7 = (unint64_t)-[NSData hash](self->_rangingToken, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    double unlockDate = self->_unlockDate;
    double v10 = -unlockDate;
    if (unlockDate >= 0.0) {
      double v10 = self->_unlockDate;
    }
    double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }

    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  unint64_t v13 = (unint64_t)-[NSData hash](self->_aksToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double sessionStartDate = self->_sessionStartDate;
    double v16 = -sessionStartDate;
    if (sessionStartDate >= 0.0) {
      double v16 = self->_sessionStartDate;
    }
    double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }

    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ -[NSString hash](self->_registrationID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_has |= 8u;
    char v5 = *((_BYTE *)v4 + 72);
  }

  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }

  id v6 = v4;
  if (*((void *)v4 + 7))
  {
    -[SDAuthenticationRequest setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }

  if (*((void *)v4 + 4))
  {
    -[SDAuthenticationRequest setAwdlInfo:](self, "setAwdlInfo:");
    id v4 = v6;
  }

  if (*((void *)v4 + 5))
  {
    -[SDAuthenticationRequest setRangingToken:](self, "setRangingToken:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    self->_double unlockDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationRequest setAksToken:](self, "setAksToken:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_double sessionStartDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 6))
  {
    -[SDAuthenticationRequest setRegistrationID:](self, "setRegistrationID:");
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

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (NSData)rangingToken
{
  return self->_rangingToken;
}

- (void)setRangingToken:(id)a3
{
}

- (double)unlockDate
{
  return self->_unlockDate;
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSString)registrationID
{
  return self->_registrationID;
}

- (void)setRegistrationID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end