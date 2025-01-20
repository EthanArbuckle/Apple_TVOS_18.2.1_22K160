@interface IDSEncryptionMetadata
- (IDSEncryptionMetadata)init;
- (IDSEncryptionMetadata)initWithAdditionalEncryptionResult:(id)a3;
- (IDSEncryptionMetadata)initWithEncryptionType:(int64_t)a3;
- (IDSEncryptionMetadata)initWithMPIdentityIdentifier:(id)a3;
- (NSMutableDictionary)additionalEncryptionResult;
- (int64_t)encryptionType;
@end

@implementation IDSEncryptionMetadata

- (IDSEncryptionMetadata)init
{
  return -[IDSEncryptionMetadata initWithEncryptionType:](self, "initWithEncryptionType:", -1LL);
}

- (IDSEncryptionMetadata)initWithEncryptionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSEncryptionMetadata;
  result = -[IDSEncryptionMetadata init](&v5, "init");
  if (result) {
    result->_encryptionType = a3;
  }
  return result;
}

- (IDSEncryptionMetadata)initWithMPIdentityIdentifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSEncryptionMetadata;
  objc_super v5 = -[IDSEncryptionMetadata init](&v7, "init");
  if (v5) {
    v5->_encryptionType = sub_1002B2050(v4);
  }

  return v5;
}

- (IDSEncryptionMetadata)initWithAdditionalEncryptionResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSEncryptionMetadata;
  v6 = -[IDSEncryptionMetadata init](&v9, "init");
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_additionalEncryptionResult, a3);
  }

  return v7;
}

- (int64_t)encryptionType
{
  return self->_encryptionType;
}

- (NSMutableDictionary)additionalEncryptionResult
{
  return self->_additionalEncryptionResult;
}

- (void).cxx_destruct
{
}

@end