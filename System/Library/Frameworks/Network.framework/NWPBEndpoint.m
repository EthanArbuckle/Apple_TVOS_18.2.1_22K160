@interface NWPBEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBEndpoint

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBEndpoint;
  v4 = -[NWPBEndpoint description](&v8, sel_description);
  v5 = -[NWPBEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  if (address)
  {
    v5 = -[NWPBAddressEndpoint dictionaryRepresentation](address, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"address"];
  }

  host = self->_host;
  if (host)
  {
    v7 = -[NWPBHostEndpoint dictionaryRepresentation](host, "dictionaryRepresentation");
    [v3 setObject:v7 forKey:@"host"];
  }

  service = self->_service;
  if (service)
  {
    v9 = -[NWPBServiceEndpoint dictionaryRepresentation](service, "dictionaryRepresentation");
    [v3 setObject:v9 forKey:@"service"];
  }

  interface = self->_interface;
  if (interface)
  {
    v11 = -[NWPBInterface dictionaryRepresentation](interface, "dictionaryRepresentation");
    [v3 setObject:v11 forKey:@"interface"];
  }

  txtRecord = self->_txtRecord;
  if (txtRecord) {
    [v3 setObject:txtRecord forKey:@"txtRecord"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_host)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_service)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_interface)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_txtRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[NWPBAddressEndpoint copyWithZone:](self->_address, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NWPBHostEndpoint copyWithZone:](self->_host, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NWPBServiceEndpoint copyWithZone:](self->_service, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = -[NWPBInterface copyWithZone:](self->_interface, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = -[NSData copyWithZone:](self->_txtRecord, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((address = self->_address, !((unint64_t)address | v4[1]))
     || -[NWPBAddressEndpoint isEqual:](address, "isEqual:"))
    && ((host = self->_host, !((unint64_t)host | v4[2])) || -[NWPBHostEndpoint isEqual:](host, "isEqual:"))
    && ((service = self->_service, !((unint64_t)service | v4[4]))
     || -[NWPBServiceEndpoint isEqual:](service, "isEqual:"))
    && ((interface = self->_interface, !((unint64_t)interface | v4[3]))
     || -[NWPBInterface isEqual:](interface, "isEqual:")))
  {
    txtRecord = self->_txtRecord;
    else {
      char v10 = 1;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NWPBAddressEndpoint hash](self->_address, "hash");
  unint64_t v4 = -[NWPBHostEndpoint hash](self->_host, "hash") ^ v3;
  unint64_t v5 = -[NWPBServiceEndpoint hash](self->_service, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[NWPBInterface hash](self->_interface, "hash");
  return v6 ^ -[NSData hash](self->_txtRecord, "hash");
}

- (void).cxx_destruct
{
}

@end