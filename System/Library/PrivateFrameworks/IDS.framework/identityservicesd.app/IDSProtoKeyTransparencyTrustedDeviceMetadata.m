@interface IDSProtoKeyTransparencyTrustedDeviceMetadata
- (BOOL)hasStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)status;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedDeviceMetadata

- (void)setStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDeviceMetadata;
  id v3 = -[IDSProtoKeyTransparencyTrustedDeviceMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyTrustedDeviceMetadata dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_status));
    [v3 setObject:v5 forKey:@"status"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timestamp));
    [v3 setObject:v6 forKey:@"timestamp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedDeviceMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_status, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v6, 2LL, self->_timestamp);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_status;
    *((_BYTE *)v4 + 20) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((_BYTE *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_status;
    *((_BYTE *)result + 20) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)result + 1) = *(void *)&self->_timestamp;
    *((_BYTE *)result + 20) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_status != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }

  BOOL v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_status;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0LL;
    return v7 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }

  else
  {
    v7 -= (unint64_t)fabs(v6);
  }

  return v7 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 20);
  }

  if ((v5 & 1) != 0)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)status
{
  return self->_status;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end