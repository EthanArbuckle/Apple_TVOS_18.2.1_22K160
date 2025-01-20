@interface ALCMElevation
- (BOOL)hasElevationDescended;
- (BOOL)hasGradeType;
- (BOOL)hasRawGradeType;
- (BOOL)hasSource;
- (BOOL)hasVerticalSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)verticalSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gradeTypeAsString:(int)a3;
- (id)rawGradeTypeAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsGradeType:(id)a3;
- (int)StringAsRawGradeType:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)gradeType;
- (int)rawGradeType;
- (int)source;
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
- (void)setHasRawGradeType:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasVerticalSpeed:(BOOL)a3;
- (void)setRawGradeType:(int)a3;
- (void)setSource:(int)a3;
- (void)setVerticalSpeed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMElevation

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
    return off_10182B670[a3];
  }
}

- (int)StringAsGradeType:(id)a3
{
  return 0;
}

- (void)setVerticalSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_verticalSpeed = a3;
}

- (void)setHasVerticalSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVerticalSpeed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)rawGradeType
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_rawGradeType;
  }
  else {
    return 0;
  }
}

- (void)setRawGradeType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rawGradeType = a3;
}

- (void)setHasRawGradeType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRawGradeType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)rawGradeTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return off_10182B670[a3];
  }
}

- (int)StringAsRawGradeType:(id)a3
{
  return 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3) {
    return @"Phone";
  }
  if (a3 == 1) {
    return @"Watch";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsSource:(id)a3
{
  else {
    return [a3 isEqualToString:@"Watch"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMElevation;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMElevation description](&v3, "description"),  -[ALCMElevation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended),  @"elevationAscended");
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationDescended),  @"elevationDescended");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  uint64_t gradeType = self->_gradeType;
  if (gradeType >= 4) {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_gradeType);
  }
  else {
    v7 = off_10182B670[gradeType];
  }
  [v3 setObject:v7 forKey:@"gradeType"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100223F88((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteInt32Field(a3, self->_gradeType, 3LL);
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_elevationDescended;
    *((_BYTE *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)a3 + 4) = self->_gradeType;
  *((_BYTE *)a3 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_elevationDescended;
    *((_BYTE *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)result + 4) = self->_gradeType;
  *((_BYTE *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }

    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_elevationDescended != *((_DWORD *)a3 + 3)) {
        goto LABEL_27;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_27;
    }

    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_gradeType != *((_DWORD *)a3 + 4)) {
        goto LABEL_27;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
      goto LABEL_27;
    }

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
    }

    else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_27;
    }

    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_rawGradeType != *((_DWORD *)a3 + 5)) {
        goto LABEL_27;
      }
    }

    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_27;
    }

    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_source != *((_DWORD *)a3 + 6)) {
        goto LABEL_27;
      }
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_elevationDescended;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761LL * self->_gradeType;
  }
  else {
    uint64_t v5 = 0LL;
  }
  unsigned int elevationAscended = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    float verticalSpeed = self->_verticalSpeed;
    float v9 = -verticalSpeed;
    if (verticalSpeed >= 0.0) {
      float v9 = self->_verticalSpeed;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }

    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  if ((has & 4) != 0)
  {
    uint64_t v12 = 2654435761LL * self->_rawGradeType;
    if ((has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v13 = 0LL;
    return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761LL * elevationAscended);
  }

  uint64_t v12 = 0LL;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v13 = 2654435761LL * self->_source;
  return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761LL * elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int elevationAscended = *((_DWORD *)a3 + 2);
  char v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_elevationDescended = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
    char v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)a3 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_uint64_t gradeType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  char v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
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