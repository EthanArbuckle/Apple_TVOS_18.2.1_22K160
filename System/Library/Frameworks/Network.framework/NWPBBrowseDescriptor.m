@interface NWPBBrowseDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBBrowseDescriptor

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBBrowseDescriptor;
  v4 = -[NWPBBrowseDescriptor description](&v8, sel_description);
  v5 = -[NWPBBrowseDescriptor dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  if (service)
  {
    v5 = -[NWPBServiceBrowse dictionaryRepresentation](service, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"service"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBBrowseDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_service) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[NWPBServiceBrowse copyWithZone:](self->_service, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    service = self->_service;
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
  return -[NWPBServiceBrowse hash](self->_service, "hash");
}

- (void).cxx_destruct
{
}

@end