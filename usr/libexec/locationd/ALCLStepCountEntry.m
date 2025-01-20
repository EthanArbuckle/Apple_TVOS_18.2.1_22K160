@interface ALCLStepCountEntry
- (BOOL)hasPace;
- (BOOL)hasRecordId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)distance;
- (double)pace;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)recordId;
- (unint64_t)hash;
- (unsigned)count;
- (unsigned)floorsAscended;
- (unsigned)floorsDescended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setDistance:(double)a3;
- (void)setFloorsAscended:(unsigned int)a3;
- (void)setFloorsDescended:(unsigned int)a3;
- (void)setHasPace:(BOOL)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPace:(double)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLStepCountEntry

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPace:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPace
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLStepCountEntry;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLStepCountEntry description](&v3, "description"),  -[ALCLStepCountEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp),  @"timestamp");
  }
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count),  @"count");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distance),  @"distance");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsAscended),  @"floorsAscended");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsDescended),  @"floorsDescended");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pace),  @"pace");
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId),  @"recordId");
  }
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry),  @"regularEntry");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10024FE48((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_timestamp);
  }
  PBDataWriterWriteUint32Field(a3, self->_count, 2LL);
  PBDataWriterWriteDoubleField(a3, 3LL, self->_distance);
  PBDataWriterWriteUint32Field(a3, self->_floorsAscended, 4LL);
  PBDataWriterWriteUint32Field(a3, self->_floorsDescended, 5LL);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 6LL, self->_pace);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_recordId, 7LL);
  }
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 8LL);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 3) = *(void *)&self->_timestamp;
    *((_BYTE *)a3 + 52) |= 2u;
  }

  *((_DWORD *)a3 + 8) = self->_count;
  *((void *)a3 + 1) = *(void *)&self->_distance;
  *((_DWORD *)a3 + 9) = self->_floorsAscended;
  *((_DWORD *)a3 + 10) = self->_floorsDescended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_pace;
    *((_BYTE *)a3 + 52) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordId;
    *((_BYTE *)a3 + 52) |= 4u;
  }

  *((_BYTE *)a3 + 48) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_timestamp;
    *((_BYTE *)result + 52) |= 2u;
  }

  *((_DWORD *)result + 8) = self->_count;
  *((void *)result + 1) = *(void *)&self->_distance;
  *((_DWORD *)result + 9) = self->_floorsAscended;
  *((_DWORD *)result + 10) = self->_floorsDescended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_pace;
    *((_BYTE *)result + 52) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 11) = self->_recordId;
    *((_BYTE *)result + 52) |= 4u;
  }

  *((_BYTE *)result + 48) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }

    if (self->_count != *((_DWORD *)a3 + 8)
      || self->_distance != *((double *)a3 + 1)
      || self->_floorsAscended != *((_DWORD *)a3 + 9)
      || self->_floorsDescended != *((_DWORD *)a3 + 10))
    {
      goto LABEL_23;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_23;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_recordId != *((_DWORD *)a3 + 11)) {
        goto LABEL_23;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_23;
    }

    int v6 = *((unsigned __int8 *)a3 + 48);
    if (self->_regularEntry) {
      LOBYTE(v5) = v6 != 0;
    }
    else {
      LOBYTE(v5) = v6 == 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    double v9 = fmod(v7, 1.84467441e19);
    unint64_t v10 = 2654435761u * (unint64_t)v9;
    unint64_t v11 = v10 + (unint64_t)v8;
    if (v8 <= 0.0) {
      unint64_t v11 = 2654435761u * (unint64_t)v9;
    }
    unint64_t v12 = v10 - (unint64_t)fabs(v8);
    if (v8 < 0.0) {
      unint64_t v4 = v12;
    }
    else {
      unint64_t v4 = v11;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  unsigned int count = self->_count;
  double distance = self->_distance;
  double v15 = -distance;
  if (distance >= 0.0) {
    double v15 = self->_distance;
  }
  double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  unint64_t v19 = v18 + (unint64_t)v17;
  double v20 = fabs(v17);
  if (v17 <= 0.0) {
    unint64_t v19 = v18;
  }
  unint64_t v21 = v18 - (unint64_t)v20;
  if (v17 < 0.0) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v19;
  }
  unsigned int floorsAscended = self->_floorsAscended;
  unsigned int floorsDescended = self->_floorsDescended;
  if ((has & 1) != 0)
  {
    double pace = self->_pace;
    double v27 = -pace;
    if (pace >= 0.0) {
      double v27 = self->_pace;
    }
    double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
      if ((has & 4) == 0) {
        goto LABEL_28;
      }
    }

    else
    {
      v25 -= (unint64_t)fabs(v29);
      if ((has & 4) == 0)
      {
LABEL_28:
        uint64_t v30 = 0LL;
        return (2654435761LL * count) ^ (2654435761LL * floorsAscended) ^ (2654435761LL * floorsDescended) ^ v25 ^ v30 ^ (2654435761LL * self->_regularEntry) ^ v4 ^ v22;
      }
    }
  }

  else
  {
    unint64_t v25 = 0LL;
    if ((has & 4) == 0) {
      goto LABEL_28;
    }
  }

  uint64_t v30 = 2654435761LL * self->_recordId;
  return (2654435761LL * count) ^ (2654435761LL * floorsAscended) ^ (2654435761LL * floorsDescended) ^ v25 ^ v30 ^ (2654435761LL * self->_regularEntry) ^ v4 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    self->_double timestamp = *((double *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

  self->_unsigned int count = *((_DWORD *)a3 + 8);
  self->_double distance = *((double *)a3 + 1);
  self->_unsigned int floorsAscended = *((_DWORD *)a3 + 9);
  self->_unsigned int floorsDescended = *((_DWORD *)a3 + 10);
  char v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 1) != 0)
  {
    self->_double pace = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    char v3 = *((_BYTE *)a3 + 52);
  }

  if ((v3 & 4) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }

  self->_regularEntry = *((_BYTE *)a3 + 48);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_unsigned int count = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_double distance = a3;
}

- (unsigned)floorsAscended
{
  return self->_floorsAscended;
}

- (void)setFloorsAscended:(unsigned int)a3
{
  self->_unsigned int floorsAscended = a3;
}

- (unsigned)floorsDescended
{
  return self->_floorsDescended;
}

- (void)setFloorsDescended:(unsigned int)a3
{
  self->_unsigned int floorsDescended = a3;
}

- (double)pace
{
  return self->_pace;
}

- (int)recordId
{
  return self->_recordId;
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