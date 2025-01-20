@interface IDSProtoKeyTransparencyTrustedServiceSignature
- (BOOL)hasServiceIdentifier;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedServiceSignature

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0LL;
}

- (BOOL)hasSignature
{
  return self->_signature != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoKeyTransparencyTrustedServiceSignature;
  id v3 = -[IDSProtoKeyTransparencyTrustedServiceSignature description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyTrustedServiceSignature dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"service_identifier"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedServiceSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  serviceIdentifier = self->_serviceIdentifier;
  id v7 = v4;
  if (serviceIdentifier)
  {
    PBDataWriterWriteStringField(v4, serviceIdentifier, 1LL);
    id v4 = v7;
  }

  signature = self->_signature;
  if (signature)
  {
    PBDataWriterWriteDataField(v7, signature, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceIdentifier)
  {
    objc_msgSend(v4, "setServiceIdentifier:");
    id v4 = v5;
  }

  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((serviceIdentifier = self->_serviceIdentifier, !((unint64_t)serviceIdentifier | v4[1]))
     || -[NSString isEqual:](serviceIdentifier, "isEqual:")))
  {
    signature = self->_signature;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_serviceIdentifier, "hash");
  return (unint64_t)-[NSData hash](self->_signature, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[1])
  {
    -[IDSProtoKeyTransparencyTrustedServiceSignature setServiceIdentifier:](self, "setServiceIdentifier:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[IDSProtoKeyTransparencyTrustedServiceSignature setSignature:](self, "setSignature:");
    id v4 = v5;
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end