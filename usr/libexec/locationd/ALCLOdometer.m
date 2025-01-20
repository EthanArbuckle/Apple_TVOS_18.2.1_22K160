@interface ALCLOdometer
- (BOOL)hasAccuracy;
- (BOOL)hasDistance;
- (BOOL)hasGpsAltitude;
- (BOOL)hasGpsSpeedAccuracy;
- (BOOL)hasQuality;
- (BOOL)hasRawSpeed;
- (BOOL)hasSpeed;
- (BOOL)hasTimestampGps;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestampGps;
- (float)accuracy;
- (float)distance;
- (float)gpsAltitude;
- (float)gpsSpeedAccuracy;
- (float)odometer;
- (float)rawSpeed;
- (float)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)qualityAsString:(int)a3;
- (int)StringAsQuality:(id)a3;
- (int)quality;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccuracy:(float)a3;
- (void)setDistance:(float)a3;
- (void)setGpsAltitude:(float)a3;
- (void)setGpsSpeedAccuracy:(float)a3;
- (void)setHasAccuracy:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasGpsAltitude:(BOOL)a3;
- (void)setHasGpsSpeedAccuracy:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasRawSpeed:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasTimestampGps:(BOOL)a3;
- (void)setOdometer:(float)a3;
- (void)setQuality:(int)a3;
- (void)setRawSpeed:(float)a3;
- (void)setSpeed:(float)a3;
- (void)setTimestampGps:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLOdometer

- (void)setDistance:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAccuracy:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_accuracy = a3;
}

- (void)setHasAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccuracy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setGpsAltitude:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_gpsAltitude = a3;
}

- (void)setHasGpsAltitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGpsAltitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSpeed
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRawSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rawSpeed = a3;
}

- (void)setHasRawSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRawSpeed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setGpsSpeedAccuracy:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_gpsSpeedAccuracy = a3;
}

- (void)setHasGpsSpeedAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasGpsSpeedAccuracy
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampGps
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)quality
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0) {
    return self->_quality;
  }
  else {
    return 0;
  }
}

- (void)setQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasQuality
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)qualityAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_101894730 + a3);
  }
}

- (int)StringAsQuality:(id)a3
{
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLOdometer;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLOdometer description](&v3, "description"),  -[ALCLOdometer dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_distance;
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4),  @"distance");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *(float *)&double v4 = self->_accuracy;
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4),  @"accuracy");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_101014A2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField(a3, 1LL, self->_distance);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteFloatField(a3, 2LL, self->_accuracy);
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = LODWORD(self->_distance);
    *((_BYTE *)a3 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 4) = LODWORD(self->_accuracy);
  *((_BYTE *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_distance);
    *((_BYTE *)result + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 4) = LODWORD(self->_accuracy);
  *((_BYTE *)result + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (!v7) {
    return v7;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 4) != 0)
  {
    goto LABEL_42;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    goto LABEL_42;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
    goto LABEL_42;
  }

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 0x80) != 0)
  {
    goto LABEL_42;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
  {
    goto LABEL_42;
  }

  if (self->_odometer != *((float *)a3 + 8))
  {
LABEL_42:
    LOBYTE(v7) = 0;
    return v7;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
  {
    goto LABEL_42;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    goto LABEL_42;
  }

  LOBYTE(v7) = (*((_BYTE *)a3 + 48) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_quality != *((_DWORD *)a3 + 9)) {
      goto LABEL_42;
    }
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float distance = self->_distance;
    float v6 = -distance;
    if (distance >= 0.0) {
      float v6 = self->_distance;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((has & 2) != 0)
  {
    float accuracy = self->_accuracy;
    float v11 = -accuracy;
    if (accuracy >= 0.0) {
      float v11 = self->_accuracy;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((has & 8) != 0)
  {
    float gpsAltitude = self->_gpsAltitude;
    float v16 = -gpsAltitude;
    if (gpsAltitude >= 0.0) {
      float v16 = self->_gpsAltitude;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }

    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  if (has < 0)
  {
    float speed = self->_speed;
    float v21 = -speed;
    if (speed >= 0.0) {
      float v21 = self->_speed;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    float v24 = fmodf(v22, 1.8447e19);
    unint64_t v25 = 2654435761u * (unint64_t)v24;
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        unint64_t v19 = v25 + (unint64_t)v23;
      }
      else {
        unint64_t v19 = 2654435761u * (unint64_t)v24;
      }
      if ((has & 0x40) == 0) {
        goto LABEL_43;
      }
    }

    else
    {
      unint64_t v19 = v25 - (unint64_t)fabsf(v23);
      if ((has & 0x40) == 0)
      {
LABEL_43:
        unint64_t v34 = 0LL;
        goto LABEL_44;
      }
    }
  }

  else
  {
    unint64_t v19 = 0LL;
    if ((has & 0x40) == 0) {
      goto LABEL_43;
    }
  }

  float rawSpeed = self->_rawSpeed;
  float v27 = -rawSpeed;
  if (rawSpeed >= 0.0) {
    float v27 = self->_rawSpeed;
  }
  float v28 = floorf(v27 + 0.5);
  float v29 = (float)(v27 - v28) * 1.8447e19;
  float v30 = fmodf(v28, 1.8447e19);
  unint64_t v31 = 2654435761u * (unint64_t)v30;
  unint64_t v32 = v31 + (unint64_t)v29;
  if (v29 <= 0.0) {
    unint64_t v32 = 2654435761u * (unint64_t)v30;
  }
  unint64_t v33 = v31 - (unint64_t)fabsf(v29);
  if (v29 < 0.0) {
    unint64_t v34 = v33;
  }
  else {
    unint64_t v34 = v32;
  }
LABEL_44:
  float odometer = self->_odometer;
  float v36 = -odometer;
  if (odometer >= 0.0) {
    float v36 = self->_odometer;
  }
  float v37 = floorf(v36 + 0.5);
  float v38 = (float)(v36 - v37) * 1.8447e19;
  float v39 = fmodf(v37, 1.8447e19);
  unint64_t v40 = 2654435761u * (unint64_t)v39;
  unint64_t v41 = v40 + (unint64_t)v38;
  if (v38 <= 0.0) {
    unint64_t v41 = 2654435761u * (unint64_t)v39;
  }
  unint64_t v42 = v40 - (unint64_t)fabsf(v38);
  if (v38 < 0.0) {
    unint64_t v43 = v42;
  }
  else {
    unint64_t v43 = v41;
  }
  if ((has & 0x10) != 0)
  {
    float gpsSpeedAccuracy = self->_gpsSpeedAccuracy;
    float v46 = -gpsSpeedAccuracy;
    if (gpsSpeedAccuracy >= 0.0) {
      float v46 = self->_gpsSpeedAccuracy;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }

    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }

  else
  {
    unint64_t v44 = 0LL;
  }

  if ((has & 1) != 0)
  {
    double timestampGps = self->_timestampGps;
    double v51 = -timestampGps;
    if (timestampGps >= 0.0) {
      double v51 = self->_timestampGps;
    }
    double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
      if ((has & 0x20) == 0) {
        goto LABEL_70;
      }
    }

    else
    {
      v49 -= (unint64_t)fabs(v53);
      if ((has & 0x20) == 0)
      {
LABEL_70:
        uint64_t v54 = 0LL;
        return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
      }
    }
  }

  else
  {
    unint64_t v49 = 0LL;
    if ((has & 0x20) == 0) {
      goto LABEL_70;
    }
  }

  uint64_t v54 = 2654435761LL * self->_quality;
  return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_float distance = *((float *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    char v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_float accuracy = *((float *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  char v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

- (float)distance
{
  return self->_distance;
}

- (float)accuracy
{
  return self->_accuracy;
}

- (float)gpsAltitude
{
  return self->_gpsAltitude;
}

- (float)speed
{
  return self->_speed;
}

- (float)rawSpeed
{
  return self->_rawSpeed;
}

- (float)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(float)a3
{
  self->_float odometer = a3;
}

- (float)gpsSpeedAccuracy
{
  return self->_gpsSpeedAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

@end