@interface SignedObjectHolder
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (BOOL)hasSignature;
- (NSData)object;
- (Signature)signature;
- (SignedObject)signedObject;
- (SignedObjectHolder)init;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySignatureVerifier)verifier;
- (id)data;
- (id)diagnosticsJsonDictionary;
- (id)signatureDiagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setObject:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedObject:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation SignedObjectHolder

- (NSData)object
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 object]);

  return (NSData *)v3;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  [v5 setObject:v4];
}

- (Signature)signature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 signature]);

  return (Signature *)v3;
}

- (void)setSignature:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  [v5 setSignature:v4];
}

- (BOOL)hasSignature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  unsigned __int8 v3 = [v2 hasSignature];

  return v3;
}

- (id)data
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 data]);

  return v3;
}

- (SignedObjectHolder)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SignedObjectHolder;
  v2 = -[SignedObjectHolder init](&v5, "init");
  if (v2)
  {
    unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___SignedObject);
    -[SignedObjectHolder setSignedObject:](v2, "setSignedObject:", v3);
  }

  return v2;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___SignedObject,  "parseFromData:error:",  a3,  a4));
  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([a1 signedTypeWithObject:v5]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = objc_opt_class(a1, v11);
  if (v12 == objc_opt_class(&OBJC_CLASS___SignedObjectHolder, v13))
  {
    id v16 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"AbstractClassException", @"This is an abstract class. To use it, please subclass.", 0LL));
    objc_exception_throw(v16);
    return +[SignedObjectHolder signedTypeWithObject:](v17, v18, v19);
  }

  else
  {
    v14 = objc_alloc_init(&OBJC_CLASS___SignedObjectHolder);

    return v14;
  }

+ (id)signedTypeWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(a1, v5);
  if (v6 == objc_opt_class(&OBJC_CLASS___SignedObjectHolder, v7))
  {
    id v10 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"AbstractClassException", @"This is an abstract class. To use it, please subclass.", 0LL));
    objc_exception_throw(v10);
    return -[SignedObjectHolder signatureDiagnosticsJsonDictionary](v11, v12);
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SignedObjectHolder);

    return v8;
  }

- (id)signatureDiagnosticsJsonDictionary
{
  v15[0] = @"signature";
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signature]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  v16[0] = v5;
  v15[1] = @"signingKeySpkiHash";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 signingKeySpkihash]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  v16[1] = v8;
  v15[2] = @"algorithm";
  unint64_t v9 = Signature_SignatureAlgorithm_EnumDescriptor();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  SEL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFormatNameForValue:", objc_msgSend(v11, "algorithm")));
  v16[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

  return v13;
}

- (id)diagnosticsJsonDictionary
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder object](self, "object"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"object"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signatureDiagnosticsJsonDictionary](self, "signatureDiagnosticsJsonDictionary"));
  [v3 setObject:v6 forKeyedSubscript:@"signature"];

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v3 = objc_opt_class(self, a2);
  if (v3 != objc_opt_class(&OBJC_CLASS___SignedObjectHolder, v4)) {
    return 0LL;
  }
  id v6 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException, "exceptionWithName:reason:userInfo:", @"AbstractClassException", @"This is an abstract class. To use it, please subclass.", 0LL));
  objc_exception_throw(v6);
  return (unint64_t)-[SignedObjectHolder signedObject](v7, v8);
}

- (SignedObject)signedObject
{
  return (SignedObject *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSignedObject:(id)a3
{
}

- (TransparencySignatureVerifier)verifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end