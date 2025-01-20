@interface CLStreamedLocationInternal
- (BOOL)hasRawCoordinateLatitude;
- (BOOL)hasRawCoordinateLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLStreamedLocationInternal)initWithDaemonLocation:(const CLDaemonLocation *)a3;
- (double)rawCoordinateLatitude;
- (double)rawCoordinateLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)mergeIntoDaemonLocation:(CLDaemonLocation *)a3;
- (void)setHasRawCoordinateLatitude:(BOOL)a3;
- (void)setHasRawCoordinateLongitude:(BOOL)a3;
- (void)setRawCoordinateLatitude:(double)a3;
- (void)setRawCoordinateLongitude:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLStreamedLocationInternal

- (CLStreamedLocationInternal)initWithDaemonLocation:(const CLDaemonLocation *)a3
{
  v4 = -[CLStreamedLocationInternal init](self, "init");
  v5 = v4;
  if (v4)
  {
  }

  return v5;
}

- (void)mergeIntoDaemonLocation:(CLDaemonLocation *)a3
{
  if (-[CLStreamedLocationInternal hasRawCoordinateLatitude](self, "hasRawCoordinateLatitude"))
  {
    -[CLStreamedLocationInternal rawCoordinateLatitude](self, "rawCoordinateLatitude");
    *(void *)((char *)&a3->lifespan + 4) = v5;
  }

  if (-[CLStreamedLocationInternal hasRawCoordinateLongitude](self, "hasRawCoordinateLongitude"))
  {
    -[CLStreamedLocationInternal rawCoordinateLongitude](self, "rawCoordinateLongitude");
    *(void *)(&a3->type + 1) = v6;
  }

- (void)setRawCoordinateLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawCoordinateLatitude = a3;
}

- (void)setHasRawCoordinateLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawCoordinateLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRawCoordinateLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rawCoordinateLongitude = a3;
}

- (void)setHasRawCoordinateLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRawCoordinateLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamedLocationInternal;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLStreamedLocationInternal description](&v3, "description"),  -[CLStreamedLocationInternal dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLatitude),  @"rawCoordinateLatitude");
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLongitude),  @"rawCoordinateLongitude");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100C59CD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_rawCoordinateLatitude);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField(a3, 2LL, self->_rawCoordinateLongitude);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((void *)a3 + 2) = *(void *)&self->_rawCoordinateLongitude;
    *((_BYTE *)a3 + 24) |= 2u;
    return;
  }

  *((void *)a3 + 1) = *(void *)&self->_rawCoordinateLatitude;
  *((_BYTE *)a3 + 24) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)result + 1) = *(void *)&self->_rawCoordinateLatitude;
    *((_BYTE *)result + 24) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_rawCoordinateLongitude;
    *((_BYTE *)result + 24) |= 2u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v7) = 0;
      return v7;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 24) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    double rawCoordinateLatitude = self->_rawCoordinateLatitude;
    double v6 = -rawCoordinateLatitude;
    if (rawCoordinateLatitude >= 0.0) {
      double v6 = self->_rawCoordinateLatitude;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((has & 2) != 0)
  {
    double rawCoordinateLongitude = self->_rawCoordinateLongitude;
    double v11 = -rawCoordinateLongitude;
    if (rawCoordinateLongitude >= 0.0) {
      double v11 = self->_rawCoordinateLongitude;
    }
    double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 24) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_double rawCoordinateLongitude = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }

  self->_double rawCoordinateLatitude = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 24) & 2) != 0) {
    goto LABEL_5;
  }
}

- (double)rawCoordinateLatitude
{
  return self->_rawCoordinateLatitude;
}

- (double)rawCoordinateLongitude
{
  return self->_rawCoordinateLongitude;
}

@end