@interface TRANSITPbMacModePair
- (BOOL)hasMac;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mac;
- (double)mode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMac:(id)a3;
- (void)setMode:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbMacModePair

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbMacModePair;
  -[TRANSITPbMacModePair dealloc](&v3, "dealloc");
}

- (BOOL)hasMac
{
  return self->_mac != 0LL;
}

- (void)setMode:(double)a3
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbMacModePair;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbMacModePair description](&v3, "description"),  -[TRANSITPbMacModePair dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  mac = self->_mac;
  if (mac) {
    [v3 setObject:mac forKey:@"mac"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mode),  @"mode");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EDA4D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  mac = self->_mac;
  if (mac) {
    PBDataWriterWriteStringField(a3, mac, 1LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteDoubleField(a3, 2LL, self->_mode);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_mac) {
    objc_msgSend(a3, "setMac:");
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 1) = *(void *)&self->_mode;
    *((_BYTE *)a3 + 24) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[2] = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7[1] = *(id *)&self->_mode;
    *((_BYTE *)v7 + 24) |= 1u;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    mac = self->_mac;
    if (!((unint64_t)mac | *((void *)a3 + 2))
      || (unsigned int v7 = -[NSString isEqual:](mac, "isEqual:")) != 0)
    {
      LOBYTE(v7) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0) {
        LOBYTE(v7) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_mode == *((double *)a3 + 1);
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_mac, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double mode = self->_mode;
    double v6 = -mode;
    if (mode >= 0.0) {
      double v6 = self->_mode;
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

  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[TRANSITPbMacModePair setMac:](self, "setMac:");
  }
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_double mode = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
}

- (double)mode
{
  return self->_mode;
}

@end