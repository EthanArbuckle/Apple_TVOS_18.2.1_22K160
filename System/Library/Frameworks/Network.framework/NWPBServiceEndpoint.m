@interface NWPBServiceEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBServiceEndpoint

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBServiceEndpoint;
  v4 = -[NWPBServiceEndpoint description](&v8, sel_description);
  v5 = -[NWPBServiceEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBServiceEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:")))
  {
    domain = self->_domain;
    else {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_name, "hash");
  NSUInteger v4 = -[NSString hash](self->_type, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_domain, "hash");
}

- (void).cxx_destruct
{
}

@end