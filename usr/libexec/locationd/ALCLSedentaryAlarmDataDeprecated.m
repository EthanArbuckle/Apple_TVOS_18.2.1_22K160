@interface ALCLSedentaryAlarmDataDeprecated
- (BOOL)didWake;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)firedTime;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDidWake:(BOOL)a3;
- (void)setFiredTime:(double)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLSedentaryAlarmDataDeprecated

- (id)typeAsString:(int)a3
{
  if (a3 >= 8) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_101873838[a3];
  }
}

- (int)StringAsType:(id)a3
{
  return 0;
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
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLSedentaryAlarmDataDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLSedentaryAlarmDataDeprecated description](&v3, "description"),  -[ALCLSedentaryAlarmDataDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firedTime),  @"firedTime");
  uint64_t type = self->_type;
  else {
    v5 = off_101873838[type];
  }
  [v3 setObject:v5 forKey:@"type"];
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_didWake),  @"didWake");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp),  @"timestamp");
  }
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry),  @"regularEntry");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B6AAD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteDoubleField(a3, 4LL, self->_timestamp);
  }
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 5LL);
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_firedTime;
  *((_DWORD *)a3 + 6) = self->_type;
  *((_BYTE *)a3 + 28) = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }

  *((_BYTE *)a3 + 29) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((void *)result + 1) = *(void *)&self->_firedTime;
  *((_DWORD *)result + 6) = self->_type;
  *((_BYTE *)result + 28) = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_timestamp;
    *((_BYTE *)result + 32) |= 1u;
  }

  *((_BYTE *)result + 29) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_didWake)
    {
      if (!*((_BYTE *)a3 + 28)) {
        goto LABEL_15;
      }
    }

    else if (*((_BYTE *)a3 + 28))
    {
LABEL_15:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_15;
    }

    int v8 = *((unsigned __int8 *)a3 + 29);
    if (self->_regularEntry) {
      LOBYTE(v7) = v8 != 0;
    }
    else {
      LOBYTE(v7) = v8 == 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  double firedTime = self->_firedTime;
  double v4 = -firedTime;
  if (firedTime >= 0.0) {
    double v4 = self->_firedTime;
  }
  double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  uint64_t type = self->_type;
  BOOL didWake = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double timestamp = self->_timestamp;
    double v16 = -timestamp;
    if (timestamp >= 0.0) {
      double v16 = self->_timestamp;
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

  return (2654435761LL * type) ^ v14 ^ (2654435761LL * self->_regularEntry) ^ v11 ^ (2654435761LL * didWake);
}

- (void)mergeFrom:(id)a3
{
  self->_double firedTime = *((double *)a3 + 1);
  self->_uint64_t type = *((_DWORD *)a3 + 6);
  self->_BOOL didWake = *((_BYTE *)a3 + 28);
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_double timestamp = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

  self->_regularEntry = *((_BYTE *)a3 + 29);
}

- (double)firedTime
{
  return self->_firedTime;
}

- (void)setFiredTime:(double)a3
{
  self->_double firedTime = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)didWake
{
  return self->_didWake;
}

- (void)setDidWake:(BOOL)a3
{
  self->_BOOL didWake = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end