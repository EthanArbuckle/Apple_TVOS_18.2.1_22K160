@interface TASKIPAddress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ipAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ttl;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setTtl:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKIPAddress

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKIPAddress;
  id v3 = -[TASKIPAddress description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKIPAddress dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  ipAddress = self->_ipAddress;
  if (ipAddress) {
    [v3 setObject:ipAddress forKey:@"ipAddress"];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_ttl));
  [v4 setObject:v6 forKey:@"ttl"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009F768((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ipAddress = self->_ipAddress;
  id v5 = a3;
  PBDataWriterWriteDataField(v5, ipAddress, 1LL);
  PBDataWriterWriteUint32Field(v5, self->_ttl, 2LL);
}

- (void)copyTo:(id)a3
{
  ipAddress = self->_ipAddress;
  id v5 = a3;
  [v5 setIpAddress:ipAddress];
  v5[4] = self->_ttl;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_ipAddress, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 4) = self->_ttl;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((ipAddress = self->_ipAddress, !((unint64_t)ipAddress | *((void *)v4 + 1)))

  return v7;
}

- (unint64_t)hash
{
  return (2654435761LL * self->_ttl) ^ (unint64_t)-[NSData hash](self->_ipAddress, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[TASKIPAddress setIpAddress:](self, "setIpAddress:");
    id v4 = v5;
  }

  self->_ttl = v4[4];
}

- (NSData)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
}

- (unsigned)ttl
{
  return self->_ttl;
}

- (void)setTtl:(unsigned int)a3
{
  self->_ttl = a3;
}

- (void).cxx_destruct
{
}

@end