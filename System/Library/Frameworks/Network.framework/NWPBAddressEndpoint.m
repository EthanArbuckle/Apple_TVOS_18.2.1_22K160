@interface NWPBAddressEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBAddressEndpoint

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBAddressEndpoint;
  v4 = -[NWPBAddressEndpoint description](&v8, sel_description);
  v5 = -[NWPBAddressEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  address = self->_address;
  if (address) {
    [v3 setObject:address forKey:@"address"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBAddressEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_address) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_address, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    address = self->_address;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_address, "hash");
}

- (void).cxx_destruct
{
}

@end