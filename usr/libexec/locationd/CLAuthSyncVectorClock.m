@interface CLAuthSyncVectorClock
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)value;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLAuthSyncVectorClock

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAuthSyncVectorClock;
  -[CLAuthSyncVectorClock dealloc](&v3, "dealloc");
}

- (BOOL)hasKey
{
  return self->_key != 0LL;
}

- (void)setValue:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAuthSyncVectorClock;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLAuthSyncVectorClock description](&v3, "description"),  -[CLAuthSyncVectorClock dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_value),  @"value");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10069F4A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  key = self->_key;
  if (key) {
    PBDataWriterWriteStringField(a3, key, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint32Field(a3, self->_value, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_key) {
    objc_msgSend(a3, "setKey:");
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_value;
    *((_BYTE *)a3 + 20) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[1] = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_value;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) != 0 && self->_value == *((_DWORD *)a3 + 4);
      }
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_value;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[CLAuthSyncVectorClock setKey:](self, "setKey:");
  }
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_value = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unsigned)value
{
  return self->_value;
}

@end