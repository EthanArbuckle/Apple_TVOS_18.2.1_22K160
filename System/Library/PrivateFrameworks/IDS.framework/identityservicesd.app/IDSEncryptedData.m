@interface IDSEncryptedData
- (IDSEncryptedData)initWithData:(id)a3 encryptionType:(int64_t)a4 payloadMetadata:(id)a5;
- (NSData)data;
- (NSData)payloadMetadata;
- (id)description;
- (int64_t)encryptionType;
@end

@implementation IDSEncryptedData

- (IDSEncryptedData)initWithData:(id)a3 encryptionType:(int64_t)a4 payloadMetadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSEncryptedData;
  v11 = -[IDSEncryptedData init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_encryptionType = a4;
    objc_storeStrong((id *)&v12->_payloadMetadata, a5);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t v4 = IDSEncryptionTypeStringFromEncryptionType(self->_encryptionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p encryptionType: %@, dataLength: %lu>",  v3,  self,  v5,  -[NSData length](self->_data, "length")));

  return v6;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)encryptionType
{
  return self->_encryptionType;
}

- (NSData)payloadMetadata
{
  return self->_payloadMetadata;
}

- (void).cxx_destruct
{
}

@end