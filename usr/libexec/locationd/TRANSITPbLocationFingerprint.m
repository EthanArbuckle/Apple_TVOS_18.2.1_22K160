@interface TRANSITPbLocationFingerprint
- (BOOL)hasLatitude;
- (BOOL)hasLocationId;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)modes;
- (double)modesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)locationId;
- (unint64_t)macs;
- (unint64_t)macsAtIndex:(unint64_t)a3;
- (unint64_t)macsCount;
- (unint64_t)modesCount;
- (void)addMacs:(unint64_t)a3;
- (void)addModes:(double)a3;
- (void)clearMacs;
- (void)clearModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationId:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationId:(unint64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setMacs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setModes:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprint

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprint;
  -[TRANSITPbLocationFingerprint dealloc](&v3, "dealloc");
}

- (void)setLocationId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locationId = a3;
}

- (void)setHasLocationId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)macsCount
{
  return self->_macs.count;
}

- (unint64_t)macs
{
  return self->_macs.list;
}

- (void)clearMacs
{
}

- (void)addMacs:(unint64_t)a3
{
}

- (unint64_t)macsAtIndex:(unint64_t)a3
{
  p_macs = &self->_macs;
  unint64_t count = self->_macs.count;
  if (count <= a3) {
    -[NSException raise]( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%tu) is out of range (%tu)",  a3,  count),  0LL),  "raise");
  }
  return p_macs->list[a3];
}

- (void)setMacs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)modesCount
{
  return self->_modes.count;
}

- (double)modes
{
  return self->_modes.list;
}

- (void)clearModes
{
}

- (void)addModes:(double)a3
{
}

- (double)modesAtIndex:(unint64_t)a3
{
  p_modes = &self->_modes;
  unint64_t count = self->_modes.count;
  if (count <= a3) {
    -[NSException raise]( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%tu) is out of range (%tu)",  a3,  count),  0LL),  "raise");
  }
  return p_modes->list[a3];
}

- (void)setModes:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprint;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbLocationFingerprint description](&v3, "description"),  -[TRANSITPbLocationFingerprint dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude),  @"latitude");
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_locationId),  @"locationId");
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude),  @"longitude");
LABEL_5:
  [v3 setObject:PBRepeatedUInt64NSArray(&self->_macs) forKey:@"macs"];
  [v3 setObject:PBRepeatedDoubleNSArray(&self->_modes) forKey:@"modes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100838ED4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(a3, self->_locationId, 1LL);
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(a3, 2LL, self->_latitude);
  if ((*(_BYTE *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField(a3, 3LL, self->_longitude);
LABEL_5:
  if (self->_macs.count)
  {
    unint64_t v6 = 0LL;
    do
      PBDataWriterWriteUint64Field(a3, self->_macs.list[v6++], 4LL);
    while (v6 < self->_macs.count);
  }

  p_modes = &self->_modes;
  if (p_modes->count)
  {
    unint64_t v8 = 0LL;
    do
      PBDataWriterWriteDoubleField(a3, 5LL, p_modes->list[v8++]);
    while (v8 < p_modes->count);
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    *((void *)a3 + 7) = *(void *)&self->_latitude;
    *((_BYTE *)a3 + 80) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((void *)a3 + 8) = self->_locationId;
  *((_BYTE *)a3 + 80) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_15;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((void *)a3 + 9) = *(void *)&self->_longitude;
    *((_BYTE *)a3 + 80) |= 4u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unint64_t v7 = (char *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  unint64_t v8 = v7;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((void *)v7 + 7) = *(void *)&self->_latitude;
    v7[80] |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  *((void *)v7 + 8) = self->_locationId;
  v7[80] |= 2u;
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((void *)v7 + 9) = *(void *)&self->_longitude;
    v7[80] |= 4u;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 2) == 0 || self->_locationId != *((void *)a3 + 8)) {
      return 0;
    }
  }

  else if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
    return 0;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 80) & 1) != 0)
  {
    return 0;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
    return 0;
  }

  return 0;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_locationId;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0LL;
    goto LABEL_11;
  }

  unint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double latitude = self->_latitude;
  double v6 = -latitude;
  if (latitude >= 0.0) {
    double v6 = self->_latitude;
  }
  double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }

  else
  {
    v9 -= (unint64_t)fabs(v8);
  }

- (void)mergeFrom:(id)a3
{
  char v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 2) != 0)
  {
    self->_locationId = *((void *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*((_BYTE *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_double latitude = *((double *)a3 + 7);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
LABEL_4:
    self->_double longitude = *((double *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }

- (unint64_t)locationId
{
  return self->_locationId;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end