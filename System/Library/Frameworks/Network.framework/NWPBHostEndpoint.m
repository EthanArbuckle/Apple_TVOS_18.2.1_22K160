@interface NWPBHostEndpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBHostEndpoint

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBHostEndpoint;
  v4 = -[NWPBHostEndpoint description](&v8, sel_description);
  v5 = -[NWPBHostEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  port = self->_port;
  if (port) {
    [v4 setObject:port forKey:@"port"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBHostEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hostname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_port)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_hostname, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_port, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((hostname = self->_hostname, !((unint64_t)hostname | v4[1]))
     || -[NSString isEqual:](hostname, "isEqual:")))
  {
    port = self->_port;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_hostname, "hash");
  return -[NSString hash](self->_port, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end