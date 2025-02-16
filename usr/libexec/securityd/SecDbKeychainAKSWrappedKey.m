@interface SecDbKeychainAKSWrappedKey
- (NSData)refKeyBlob;
- (NSData)serializedRepresentation;
- (NSData)wrappedKey;
- (SecDbKeychainAKSWrappedKey)initWithData:(id)a3;
- (id)initRefKeyWrappedKeyWithData:(id)a3 refKeyBlob:(id)a4;
- (id)initRegularWrappedKeyWithData:(id)a3;
- (unsigned)type;
@end

@implementation SecDbKeychainAKSWrappedKey

- (id)initRegularWrappedKeyWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecDbKeychainAKSWrappedKey;
  v5 = -[SecDbKeychainAKSWrappedKey init](&v9, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___SecDbKeychainSerializedAKSWrappedKey);
    serializedHolder = v5->_serializedHolder;
    v5->_serializedHolder = v6;

    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](v5->_serializedHolder, "setWrappedKey:", v4);
    -[SecDbKeychainSerializedAKSWrappedKey setType:](v5->_serializedHolder, "setType:", 0LL);
  }

  return v5;
}

- (id)initRefKeyWrappedKeyWithData:(id)a3 refKeyBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SecDbKeychainAKSWrappedKey;
  v8 = -[SecDbKeychainAKSWrappedKey init](&v12, "init");
  if (v8)
  {
    objc_super v9 = objc_alloc_init(&OBJC_CLASS___SecDbKeychainSerializedAKSWrappedKey);
    serializedHolder = v8->_serializedHolder;
    v8->_serializedHolder = v9;

    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](v8->_serializedHolder, "setWrappedKey:", v6);
    -[SecDbKeychainSerializedAKSWrappedKey setRefKeyBlob:](v8->_serializedHolder, "setRefKeyBlob:", v7);
    -[SecDbKeychainSerializedAKSWrappedKey setType:](v8->_serializedHolder, "setType:", 1LL);
  }

  return v8;
}

- (SecDbKeychainAKSWrappedKey)initWithData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SecDbKeychainAKSWrappedKey;
  v5 = -[SecDbKeychainAKSWrappedKey init](&v12, "init");
  if (v5)
  {
    id v6 = -[SecDbKeychainSerializedAKSWrappedKey initWithData:]( objc_alloc(&OBJC_CLASS___SecDbKeychainSerializedAKSWrappedKey),  "initWithData:",  v4);
    serializedHolder = v5->_serializedHolder;
    v5->_serializedHolder = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey wrappedKey](v5->_serializedHolder, "wrappedKey"));
    if (!v8) {
      goto LABEL_5;
    }
    objc_super v9 = (void *)v8;
    if (-[SecDbKeychainSerializedAKSWrappedKey type](v5->_serializedHolder, "type") != 1)
    {
LABEL_6:

      goto LABEL_7;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey refKeyBlob](v5->_serializedHolder, "refKeyBlob"));

    if (!v10)
    {
LABEL_5:
      objc_super v9 = v5;
      v5 = 0LL;
      goto LABEL_6;
    }
  }

- (NSData)serializedRepresentation
{
  return (NSData *)-[SecDbKeychainSerializedAKSWrappedKey data](self->_serializedHolder, "data");
}

- (NSData)wrappedKey
{
  return -[SecDbKeychainSerializedAKSWrappedKey wrappedKey](self->_serializedHolder, "wrappedKey");
}

- (NSData)refKeyBlob
{
  return -[SecDbKeychainSerializedAKSWrappedKey refKeyBlob](self->_serializedHolder, "refKeyBlob");
}

- (unsigned)type
{
  return -[SecDbKeychainSerializedAKSWrappedKey type](self->_serializedHolder, "type");
}

- (void).cxx_destruct
{
}

@end