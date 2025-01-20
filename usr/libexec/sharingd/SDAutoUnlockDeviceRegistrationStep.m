@interface SDAutoUnlockDeviceRegistrationStep
- (BOOL)hasErrorCode;
- (BOOL)hasStepData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)stepData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setStepData:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockDeviceRegistrationStep

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

- (BOOL)hasStepData
{
  return self->_stepData != 0LL;
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
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep;
  id v3 = -[SDAutoUnlockDeviceRegistrationStep description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  stepData = self->_stepData;
  if (stepData) {
    [v3 setObject:stepData forKey:@"stepData"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_errorCode));
    [v3 setObject:v6 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockDeviceRegistrationStepReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v6;
  }

  stepData = self->_stepData;
  if (stepData)
  {
    PBDataWriterWriteDataField(v6, stepData, 2LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 3LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 2u;
  }

  if (self->_stepData)
  {
    v5 = v4;
    objc_msgSend(v4, "setStepData:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 28) |= 2u;
  }

  id v7 = -[NSData copyWithZone:](self->_stepData, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 28) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }

  stepData = self->_stepData;
  if ((unint64_t)stepData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](stepData, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }

    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
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
  unint64_t v4 = (unint64_t)-[NSData hash](self->_stepData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_errorCode;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[7] & 2) != 0)
  {
    self->_version = v4[6];
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[SDAutoUnlockDeviceRegistrationStep setStepData:](self, "setStepData:");
    unint64_t v4 = v5;
  }

  if ((v4[7] & 1) != 0)
  {
    self->_errorCode = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)stepData
{
  return self->_stepData;
}

- (void)setStepData:(id)a3
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