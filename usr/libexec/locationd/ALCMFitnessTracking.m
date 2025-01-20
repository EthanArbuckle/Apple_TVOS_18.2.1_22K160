@interface ALCMFitnessTracking
- (BOOL)fitnessTrackingEnabled;
- (BOOL)hasPowerSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)powerSourceAsString:(int)a3;
- (int)StringAsPowerSource:(id)a3;
- (int)powerSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFitnessTrackingEnabled:(BOOL)a3;
- (void)setHasPowerSource:(BOOL)a3;
- (void)setPowerSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMFitnessTracking

- (int)powerSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_powerSource;
  }
  else {
    return 0;
  }
}

- (void)setPowerSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_powerSource = a3;
}

- (void)setHasPowerSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)powerSourceAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_101893D88 + a3);
  }
}

- (int)StringAsPowerSource:(id)a3
{
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMFitnessTracking;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMFitnessTracking description](&v3, "description"),  -[ALCMFitnessTracking dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fitnessTrackingEnabled),  @"fitnessTrackingEnabled");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t powerSource = self->_powerSource;
    if (powerSource >= 4) {
      v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_powerSource);
    }
    else {
      v5 = (NSString *)*(&off_101893D88 + powerSource);
    }
    [v3 setObject:v5 forKey:@"powerSource"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100FF61A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_powerSource, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_BYTE *)a3 + 12) = self->_fitnessTrackingEnabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_powerSource;
    *((_BYTE *)a3 + 16) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((_BYTE *)result + 12) = self->_fitnessTrackingEnabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_powerSource;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    if (self->_fitnessTrackingEnabled)
    {
      if (!*((_BYTE *)a3 + 12)) {
        goto LABEL_10;
      }
    }

    else if (*((_BYTE *)a3 + 12))
    {
LABEL_10:
      LOBYTE(v7) = 0;
      return v7;
    }

    LOBYTE(v7) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) == 0 || self->_powerSource != *((_DWORD *)a3 + 2)) {
        goto LABEL_10;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_powerSource;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return v2 ^ (2654435761LL * self->_fitnessTrackingEnabled);
}

- (void)mergeFrom:(id)a3
{
  self->_fitnessTrackingEnabled = *((_BYTE *)a3 + 12);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_uint64_t powerSource = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

- (BOOL)fitnessTrackingEnabled
{
  return self->_fitnessTrackingEnabled;
}

- (void)setFitnessTrackingEnabled:(BOOL)a3
{
  self->_fitnessTrackingEnabled = a3;
}

@end