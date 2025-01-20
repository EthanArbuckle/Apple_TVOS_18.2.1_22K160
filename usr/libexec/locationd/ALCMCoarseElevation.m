@interface ALCMCoarseElevation
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCoarseElevation

- (int)source
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3) {
    return @"kElevationSourcePhone";
  }
  if (a3 == 1) {
    return @"kElevationSourceWatch";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
}

- (int)StringAsSource:(id)a3
{
  else {
    return [a3 isEqualToString:@"kElevationSourceWatch"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMCoarseElevation;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMCoarseElevation description](&v3, "description"),  -[ALCMCoarseElevation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended),  @"elevationAscended");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int source = self->_source;
    if (source)
    {
      if (source == 1) {
        v5 = @"kElevationSourceWatch";
      }
      else {
        v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_source);
      }
    }

    else
    {
      v5 = @"kElevationSourcePhone";
    }

    [v3 setObject:v5 forKey:@"source"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1006A5F60((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_source, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_source;
    *((_BYTE *)a3 + 16) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_source;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2)) {
      goto LABEL_7;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) != 0 && self->_source == *((_DWORD *)a3 + 3))
      {
        LOBYTE(v5) = 1;
        return v5;
      }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_source;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return v2 ^ (2654435761LL * self->_elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_int source = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_elevationAscended = a3;
}

@end