@interface ALCMCoarseElevationDeprecated
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCoarseElevationDeprecated

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCMCoarseElevationDeprecated;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCMCoarseElevationDeprecated description](&v3, "description"),  -[ALCMCoarseElevationDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended),  @"elevationAscended");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100C67170((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7) {
    LOBYTE(v7) = self->_elevationAscended == *((_DWORD *)a3 + 2);
  }
  return v7;
}

- (unint64_t)hash
{
  return 2654435761LL * self->_elevationAscended;
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
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