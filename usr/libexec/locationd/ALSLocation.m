@interface ALSLocation
- (BOOL)hasAltitude;
- (BOOL)hasConfidence;
- (BOOL)hasInfoMask;
- (BOOL)hasLocationType;
- (BOOL)hasReach;
- (BOOL)hasScore;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)accuracy;
- (int)altitude;
- (int)confidence;
- (int)locationType;
- (int)reach;
- (int)verticalAccuracy;
- (int64_t)latitude;
- (int64_t)longitude;
- (unint64_t)hash;
- (unsigned)infoMask;
- (unsigned)score;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccuracy:(int)a3;
- (void)setAltitude:(int)a3;
- (void)setConfidence:(int)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasInfoMask:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasReach:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setInfoMask:(unsigned int)a3;
- (void)setLatitude:(int64_t)a3;
- (void)setLocationType:(int)a3;
- (void)setLongitude:(int64_t)a3;
- (void)setReach:(int)a3;
- (void)setScore:(unsigned int)a3;
- (void)setVerticalAccuracy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocation

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAltitude:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVerticalAccuracy:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setReach:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_reach = a3;
}

- (void)setHasReach:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReach
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setInfoMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_infoMask = a3;
}

- (void)setHasInfoMask:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInfoMask
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALSLocation;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALSLocation description](&v3, "description"),  -[ALSLocation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude),  @"Latitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude),  @"Longitude");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accuracy),  @"accuracy");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_locationType),  @"locationType");
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_altitude),  @"altitude");
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100B87820((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_locationType, 4LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_altitude, 5LL);
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_latitude;
  *((void *)a3 + 2) = self->_longitude;
  *((_DWORD *)a3 + 6) = self->_accuracy;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_locationType;
    *((_BYTE *)a3 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 7) = self->_altitude;
  *((_BYTE *)a3 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((void *)result + 1) = self->_latitude;
  *((void *)result + 2) = self->_longitude;
  *((_DWORD *)result + 6) = self->_accuracy;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 10) = self->_locationType;
    *((_BYTE *)result + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 7) = self->_altitude;
  *((_BYTE *)result + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_latitude != *((void *)a3 + 1)
      || self->_longitude != *((void *)a3 + 2)
      || self->_accuracy != *((_DWORD *)a3 + 6))
    {
      goto LABEL_39;
    }

    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_locationType != *((_DWORD *)a3 + 10)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
LABEL_39:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_altitude != *((_DWORD *)a3 + 7)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_39;
    }

    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_verticalAccuracy != *((_DWORD *)a3 + 13)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_39;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 8)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_39;
    }

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_score != *((_DWORD *)a3 + 12)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_39;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_reach != *((_DWORD *)a3 + 11)) {
        goto LABEL_39;
      }
    }

    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_39;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 56) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_infoMask != *((_DWORD *)a3 + 9)) {
        goto LABEL_39;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_locationType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761LL * self->_altitude;
      if ((*(_BYTE *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0LL;
      if ((*(_BYTE *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761LL * self->_verticalAccuracy;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761LL * self->_confidence;
    goto LABEL_10;
  }

- (void)mergeFrom:(id)a3
{
  self->_latitude = *((void *)a3 + 1);
  self->_longitude = *((void *)a3 + 2);
  self->_accuracy = *((_DWORD *)a3 + 6);
  char v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 8) != 0)
  {
    self->_locationType = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
    char v3 = *((_BYTE *)a3 + 56);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_altitude = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 1u;
  char v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_longitude = a3;
}

- (int)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(int)a3
{
  self->_accuracy = a3;
}

- (int)locationType
{
  return self->_locationType;
}

- (int)altitude
{
  return self->_altitude;
}

- (int)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (int)confidence
{
  return self->_confidence;
}

- (unsigned)score
{
  return self->_score;
}

- (int)reach
{
  return self->_reach;
}

- (unsigned)infoMask
{
  return self->_infoMask;
}

@end