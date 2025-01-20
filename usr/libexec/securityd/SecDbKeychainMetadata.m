@interface SecDbKeychainMetadata
- (NSData)serializedRepresentation;
- (NSString)tamperCheck;
- (SecDbKeychainMetadata)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6;
- (SecDbKeychainMetadata)initWithData:(id)a3;
- (_SFAuthenticatedCiphertext)ciphertext;
- (_SFAuthenticatedCiphertext)wrappedKey;
@end

@implementation SecDbKeychainMetadata

- (SecDbKeychainMetadata)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SecDbKeychainMetadata;
  v13 = -[SecDbKeychainMetadata init](&v24, "init");
  if (!v13) {
    goto LABEL_8;
  }
  v14 = objc_alloc_init(&OBJC_CLASS___SecDbKeychainSerializedMetadata);
  serializedHolder = v13->_serializedHolder;
  v13->_serializedHolder = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v10,  1LL,  a6));
  -[SecDbKeychainSerializedMetadata setCiphertext:](v13->_serializedHolder, "setCiphertext:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  a6));
  -[SecDbKeychainSerializedMetadata setWrappedKey:](v13->_serializedHolder, "setWrappedKey:", v17);

  -[SecDbKeychainSerializedMetadata setTamperCheck:](v13->_serializedHolder, "setTamperCheck:", v12);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](v13->_serializedHolder, "ciphertext"));
  if (!v18)
  {
LABEL_7:

    v13 = 0LL;
    goto LABEL_8;
  }

  v19 = (void *)v18;
  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](v13->_serializedHolder, "wrappedKey"));
  if (!v20)
  {

    goto LABEL_7;
  }

  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata tamperCheck](v13->_serializedHolder, "tamperCheck"));

  if (!v22) {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (SecDbKeychainMetadata)initWithData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SecDbKeychainMetadata;
  v5 = -[SecDbKeychainMetadata init](&v14, "init");
  if (!v5) {
    goto LABEL_8;
  }
  v6 = -[SecDbKeychainSerializedMetadata initWithData:]( objc_alloc(&OBJC_CLASS___SecDbKeychainSerializedMetadata),  "initWithData:",  v4);
  serializedHolder = v5->_serializedHolder;
  v5->_serializedHolder = v6;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](v5->_serializedHolder, "ciphertext"));
  if (!v8)
  {
LABEL_7:

    v5 = 0LL;
    goto LABEL_8;
  }

  v9 = (void *)v8;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](v5->_serializedHolder, "wrappedKey"));
  if (!v10)
  {

    goto LABEL_7;
  }

  id v11 = (void *)v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata tamperCheck](v5->_serializedHolder, "tamperCheck"));

  if (!v12) {
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (NSData)serializedRepresentation
{
  return (NSData *)-[SecDbKeychainSerializedMetadata data](self->_serializedHolder, "data");
}

- (_SFAuthenticatedCiphertext)ciphertext
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS____SFAuthenticatedCiphertext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](self->_serializedHolder, "ciphertext"));
  id v10 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v3,  v4,  &v10));
  id v6 = v10;

  if (!v5)
  {
    v7 = sub_10001267C("SecError");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: error deserializing ciphertext from metadata: %@",  buf,  0xCu);
    }
  }

  return (_SFAuthenticatedCiphertext *)v5;
}

- (_SFAuthenticatedCiphertext)wrappedKey
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS____SFAuthenticatedCiphertext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](self->_serializedHolder, "wrappedKey"));
  id v10 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v3,  v4,  &v10));
  id v6 = v10;

  if (!v5)
  {
    v7 = sub_10001267C("SecError");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: error deserializing wrappedKey from metadata: %@",  buf,  0xCu);
    }
  }

  return (_SFAuthenticatedCiphertext *)v5;
}

- (NSString)tamperCheck
{
  return -[SecDbKeychainSerializedMetadata tamperCheck](self->_serializedHolder, "tamperCheck");
}

- (void).cxx_destruct
{
}

@end