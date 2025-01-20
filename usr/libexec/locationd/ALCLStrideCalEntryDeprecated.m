@interface ALCLStrideCalEntryDeprecated
- (BOOL)hasRecordId;
- (BOOL)hasRegularEntry;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)kvalue;
- (double)kvalueTrack;
- (double)score;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)recordId;
- (unint64_t)hash;
- (unsigned)pacebin;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasRegularEntry:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setKvalue:(double)a3;
- (void)setKvalueTrack:(double)a3;
- (void)setPacebin:(unsigned int)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLStrideCalEntryDeprecated

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordId
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

- (void)setRegularEntry:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_regularEntry = a3;
}

- (void)setHasRegularEntry:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegularEntry
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLStrideCalEntryDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLStrideCalEntryDeprecated description](&v3, "description"),  -[ALCLStrideCalEntryDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId),  @"recordId");
  }
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pacebin),  @"pacebin");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_kvalue),  @"kvalue");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_kvalueTrack),  @"kvalueTrack");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_score),  @"score");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp),  @"timestamp");
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry),  @"regularEntry");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100354A28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1LL);
  }
  PBDataWriterWriteUint32Field(a3, self->_pacebin, 2LL);
  PBDataWriterWriteDoubleField(a3, 3LL, self->_kvalue);
  PBDataWriterWriteDoubleField(a3, 4LL, self->_kvalueTrack);
  PBDataWriterWriteDoubleField(a3, 5LL, self->_score);
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 6LL, self->_timestamp);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField(a3, self->_regularEntry, 7LL);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordId;
    *((_BYTE *)a3 + 52) |= 2u;
  }

  *((_DWORD *)a3 + 10) = self->_pacebin;
  *((void *)a3 + 1) = *(void *)&self->_kvalue;
  *((void *)a3 + 2) = *(void *)&self->_kvalueTrack;
  *((void *)a3 + 3) = *(void *)&self->_score;
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      return;
    }
LABEL_7:
    *((_BYTE *)a3 + 48) = self->_regularEntry;
    *((_BYTE *)a3 + 52) |= 4u;
    return;
  }

  *((void *)a3 + 4) = *(void *)&self->_timestamp;
  *((_BYTE *)a3 + 52) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 11) = self->_recordId;
    *((_BYTE *)result + 52) |= 2u;
  }

  *((_DWORD *)result + 10) = self->_pacebin;
  *((void *)result + 1) = *(void *)&self->_kvalue;
  *((void *)result + 2) = *(void *)&self->_kvalueTrack;
  *((void *)result + 3) = *(void *)&self->_score;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)result + 4) = *(void *)&self->_timestamp;
    *((_BYTE *)result + 52) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 48) = self->_regularEntry;
    *((_BYTE *)result + 52) |= 4u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_recordId != *((_DWORD *)a3 + 11)) {
        goto LABEL_18;
      }
    }

    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_18;
    }

    if (self->_pacebin != *((_DWORD *)a3 + 10)
      || self->_kvalue != *((double *)a3 + 1)
      || self->_kvalueTrack != *((double *)a3 + 2)
      || self->_score != *((double *)a3 + 3))
    {
      goto LABEL_18;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_18;
    }

    LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0)
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }

      if (self->_regularEntry)
      {
        if (!*((_BYTE *)a3 + 48)) {
          goto LABEL_18;
        }
      }

      else if (*((_BYTE *)a3 + 48))
      {
        goto LABEL_18;
      }

      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    uint64_t v4 = 2654435761LL * self->_recordId;
  }
  else {
    uint64_t v4 = 0LL;
  }
  unsigned int pacebin = self->_pacebin;
  double kvalue = self->_kvalue;
  double v7 = -kvalue;
  if (kvalue >= 0.0) {
    double v7 = self->_kvalue;
  }
  double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  double kvalueTrack = self->_kvalueTrack;
  double v16 = -kvalueTrack;
  if (kvalueTrack >= 0.0) {
    double v16 = self->_kvalueTrack;
  }
  double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  double v19 = fmod(v17, 1.84467441e19);
  unint64_t v20 = 2654435761u * (unint64_t)v19;
  unint64_t v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0) {
    unint64_t v21 = 2654435761u * (unint64_t)v19;
  }
  unint64_t v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  double score = self->_score;
  double v25 = -score;
  if (score >= 0.0) {
    double v25 = self->_score;
  }
  double v26 = floor(v25 + 0.5);
  double v27 = (v25 - v26) * 1.84467441e19;
  double v28 = fmod(v26, 1.84467441e19);
  unint64_t v29 = 2654435761u * (unint64_t)v28;
  unint64_t v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0) {
    unint64_t v30 = 2654435761u * (unint64_t)v28;
  }
  unint64_t v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0) {
    unint64_t v32 = v31;
  }
  else {
    unint64_t v32 = v30;
  }
  if ((has & 1) != 0)
  {
    double timestamp = self->_timestamp;
    double v35 = -timestamp;
    if (timestamp >= 0.0) {
      double v35 = self->_timestamp;
    }
    double v36 = floor(v35 + 0.5);
    double v37 = (v35 - v36) * 1.84467441e19;
    unint64_t v33 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0) {
        v33 += (unint64_t)v37;
      }
      if ((has & 4) == 0) {
        goto LABEL_36;
      }
    }

    else
    {
      v33 -= (unint64_t)fabs(v37);
      if ((has & 4) == 0)
      {
LABEL_36:
        uint64_t v38 = 0LL;
        return (2654435761LL * pacebin) ^ v23 ^ v4 ^ v14 ^ v32 ^ v33 ^ v38;
      }
    }
  }

  else
  {
    unint64_t v33 = 0LL;
    if ((has & 4) == 0) {
      goto LABEL_36;
    }
  }

  uint64_t v38 = 2654435761LL * self->_regularEntry;
  return (2654435761LL * pacebin) ^ v23 ^ v4 ^ v14 ^ v32 ^ v33 ^ v38;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }

  self->_unsigned int pacebin = *((_DWORD *)a3 + 10);
  self->_double kvalue = *((double *)a3 + 1);
  self->_double kvalueTrack = *((double *)a3 + 2);
  self->_double score = *((double *)a3 + 3);
  if ((*((_BYTE *)a3 + 52) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 52) & 4) == 0) {
      return;
    }
LABEL_7:
    self->_regularEntry = *((_BYTE *)a3 + 48);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }

  self->_double timestamp = *((double *)a3 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 52) & 4) != 0) {
    goto LABEL_7;
  }
}

- (int)recordId
{
  return self->_recordId;
}

- (unsigned)pacebin
{
  return self->_pacebin;
}

- (void)setPacebin:(unsigned int)a3
{
  self->_unsigned int pacebin = a3;
}

- (double)kvalue
{
  return self->_kvalue;
}

- (void)setKvalue:(double)a3
{
  self->_double kvalue = a3;
}

- (double)kvalueTrack
{
  return self->_kvalueTrack;
}

- (void)setKvalueTrack:(double)a3
{
  self->_double kvalueTrack = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_double score = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

@end