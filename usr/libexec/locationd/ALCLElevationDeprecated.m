@interface ALCLElevationDeprecated
- (BOOL)hasElevationDescended;
- (BOOL)hasGradeType;
- (BOOL)hasVerticalSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)verticalSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gradeTypeAsString:(int)a3;
- (int)StringAsGradeType:(id)a3;
- (int)gradeType;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (unsigned)elevationDescended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)setElevationDescended:(unsigned int)a3;
- (void)setGradeType:(int)a3;
- (void)setHasElevationDescended:(BOOL)a3;
- (void)setHasGradeType:(BOOL)a3;
- (void)setHasVerticalSpeed:(BOOL)a3;
- (void)setVerticalSpeed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLElevationDeprecated

- (void)setElevationDescended:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_elevationDescended = a3;
}

- (void)setHasElevationDescended:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElevationDescended
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)gradeType
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_gradeType;
  }
  else {
    return 0;
  }
}

- (void)setGradeType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGradeType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)gradeTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_101861B20[a3];
  }
}

- (int)StringAsGradeType:(id)a3
{
  return 0;
}

- (void)setVerticalSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_verticalSpeed = a3;
}

- (void)setHasVerticalSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVerticalSpeed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLElevationDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLElevationDeprecated description](&v3, "description"),  -[ALCLElevationDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended),  @"elevationAscended");
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t gradeType = self->_gradeType;
    if (gradeType >= 4) {
      v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_gradeType);
    }
    else {
      v8 = off_101861B20[gradeType];
    }
    [v3 setObject:v8 forKey:@"gradeType"];
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    return v3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationDescended),  @"elevationDescended");
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)&double v4 = self->_verticalSpeed;
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4),  @"verticalSpeed");
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10093D798((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_elevationDescended, 2LL);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      PBDataWriterWriteFloatField(a3, 4LL, self->_verticalSpeed);
      return;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_gradeType, 3LL);
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_elevationDescended;
    *((_BYTE *)a3 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 5) = LODWORD(self->_verticalSpeed);
      *((_BYTE *)a3 + 24) |= 4u;
      return;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 4) = self->_gradeType;
  *((_BYTE *)a3 + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_elevationDescended;
    *((_BYTE *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 4) = self->_gradeType;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = LODWORD(self->_verticalSpeed);
  *((_BYTE *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
    {
LABEL_17:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_elevationDescended != *((_DWORD *)a3 + 3)) {
        goto LABEL_17;
      }
    }

    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
      goto LABEL_17;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_gradeType != *((_DWORD *)a3 + 4)) {
        goto LABEL_17;
      }
    }

    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 24) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_elevationDescended;
  }
  else {
    uint64_t v2 = 0LL;
  }
  unsigned int elevationAscended = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_gradeType;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v9 = 0LL;
    return v2 ^ v4 ^ v9 ^ (2654435761LL * elevationAscended);
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float verticalSpeed = self->_verticalSpeed;
  float v6 = -verticalSpeed;
  if (verticalSpeed >= 0.0) {
    float v6 = self->_verticalSpeed;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }

  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }

  return v2 ^ v4 ^ v9 ^ (2654435761LL * elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int elevationAscended = *((_DWORD *)a3 + 2);
  char v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 1) != 0)
  {
    self->_elevationDescended = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
    char v3 = *((_BYTE *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_float verticalSpeed = *((float *)a3 + 5);
      *(_BYTE *)&self->_has |= 4u;
      return;
    }
  }

  else if ((*((_BYTE *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_uint64_t gradeType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 24) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_unsigned int elevationAscended = a3;
}

- (unsigned)elevationDescended
{
  return self->_elevationDescended;
}

- (float)verticalSpeed
{
  return self->_verticalSpeed;
}

@end