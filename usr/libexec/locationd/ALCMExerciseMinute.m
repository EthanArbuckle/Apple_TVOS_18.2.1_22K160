@interface ALCMExerciseMinute
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)avgIntensity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgIntensity:(double)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMExerciseMinute

- (int)mode
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_101888FF8 + a3);
  }
}

- (int)StringAsMode:(id)a3
{
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMExerciseMinute;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMExerciseMinute description](&v3, "description"),  -[ALCMExerciseMinute dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_avgIntensity),  @"avgIntensity");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t mode = self->_mode;
    if (mode >= 3) {
      v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_mode);
    }
    else {
      v5 = (NSString *)*(&off_101888FF8 + mode);
    }
    [v3 setObject:v5 forKey:@"mode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100E7AF70((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_mode, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_avgIntensity;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_mode;
    *((_BYTE *)a3 + 20) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((void *)result + 1) = *(void *)&self->_avgIntensity;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 4) = self->_mode;
    *((_BYTE *)result + 20) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    LOBYTE(v7) = (*((_BYTE *)a3 + 20) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) != 0 && self->_mode == *((_DWORD *)a3 + 4))
      {
        LOBYTE(v7) = 1;
        return v7;
      }

- (unint64_t)hash
{
  double avgIntensity = self->_avgIntensity;
  double v4 = -avgIntensity;
  if (avgIntensity >= 0.0) {
    double v4 = self->_avgIntensity;
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
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v11 = 2654435761LL * self->_mode;
  }
  else {
    uint64_t v11 = 0LL;
  }
  return v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  self->_double avgIntensity = *((double *)a3 + 1);
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_uint64_t mode = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

- (double)avgIntensity
{
  return self->_avgIntensity;
}

- (void)setAvgIntensity:(double)a3
{
  self->_double avgIntensity = a3;
}

@end