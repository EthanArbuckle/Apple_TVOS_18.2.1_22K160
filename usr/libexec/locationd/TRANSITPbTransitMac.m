@interface TRANSITPbTransitMac
- (BOOL)hasMac;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)mac;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMac:(BOOL)a3;
- (void)setMac:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbTransitMac

- (void)setMac:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mac = a3;
}

- (void)setHasMac:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMac
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbTransitMac;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbTransitMac description](&v3, "description"),  -[TRANSITPbTransitMac dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_mac),  @"mac");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A18694((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(a3, self->_mac, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 1) = self->_mac;
    *((_BYTE *)a3 + 16) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)result + 1) = self->_mac;
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
    LOBYTE(v7) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      LOBYTE(v7) = (*((_BYTE *)a3 + 16) & 1) != 0 && self->_mac == *((void *)a3 + 1);
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761u * self->_mac;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_mac = *((void *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unint64_t)mac
{
  return self->_mac;
}

@end