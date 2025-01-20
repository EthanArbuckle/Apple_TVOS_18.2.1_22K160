@interface TKSEPKeyServer
- (id)keyForObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (id)serverAttributesOfKey:(id)a3 error:(id *)a4;
- (void)attestWithKey:(id)a3 keyToAttest:(id)a4 nonce:(id)a5 authContext:(id)a6 forceSystemSessionAttestingKey:(BOOL)a7 forceSystemSessionKeyToAttest:(BOOL)a8 reply:(id)a9;
- (void)computeSharedSecretWithKey:(id)a3 publicKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)decapsulateWithKey:(id)a3 encapsulatedKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)deleteKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6;
- (void)generateKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(id)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 reply:(id)a9;
- (void)getAttributesOfKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6;
- (void)lifetimeControlKey:(id)a3 type:(int64_t)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)recryptWithKey:(id)a3 data:(id)a4 attributes:(id)a5 authContext:(id)a6 forceSystemSession:(BOOL)a7 reply:(id)a8;
- (void)signWithKey:(id)a3 digest:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
@end

@implementation TKSEPKeyServer

- (id)serverAttributesOfKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 publicKeyWithError:a4]);
    if (v7)
    {
      v15[0] = @"keyType";
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 keyType]);
      v16[0] = v8;
      v15[1] = @"keySize";
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keySize]);
      v16[1] = v9;
      v15[2] = @"systemKey";
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 systemKey]));
      v16[2] = v10;
      v15[3] = @"systemSessionKey";
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 systemSessionKey]));
      v16[3] = v11;
      v16[4] = v7;
      v15[4] = @"publicKey";
      v15[5] = @"accessControl";
      v12 = (void *)SecAccessControlCopyData([v6 accessControl]);
      v16[5] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  6LL));
    }

    else
    {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)generateKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(id)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void *, void *, void))a9;
  id location = 0LL;
  v19 = (void *)SecAccessControlCreateFromData(kCFAllocatorDefault, a5, &location);
  if (v19)
  {
    v20 = objc_alloc(&OBJC_CLASS___TKSEPKey);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id obj = location;
    LOBYTE(v29) = a8;
    id v22 = -[TKSEPKey initLocalWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]( v20,  "initLocalWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:",  v15,  a4,  v19,  v16,  v17,  v21,  v29,  &obj);
    objc_storeStrong(&location, obj);

    if (v22
      && (id v30 = location,
          v23 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer serverAttributesOfKey:error:]( self,  "serverAttributesOfKey:error:",  v22,  &v30)),  objc_storeStrong(&location, v30),  v23))
    {
      v24 = self;
      objc_sync_enter(v24);
      objc_storeStrong((id *)&v24->_cachedKey, v22);
      objc_sync_exit(v24);

      v25 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectID]);
      v27 = -[TKBERTLVRecord initWithPropertyList:](v25, "initWithPropertyList:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TKBERTLVRecord data](v27, "data"));
      v18[2](v18, v28, v23, 0LL);
    }

    else
    {
      ((void (**)(id, void *, void *, id))v18)[2](v18, 0LL, 0LL, location);
    }
  }

  else
  {
    ((void (**)(id, void *, void *, id))v18)[2](v18, 0LL, 0LL, location);
  }
}

- (id)keyForObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TKBERTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 propertyList]);

  v13 = self;
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TKSEPKey objectID](v13->_cachedKey, "objectID"));
  if ([v14 isEqual:v12])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TKSEPKey authContext](v13->_cachedKey, "authContext"));
    unsigned __int8 v16 = [v15 isEqual:v10];

    p_cachedKey = (id *)&v13->_cachedKey;
    if ((v16 & 1) != 0) {
      goto LABEL_7;
    }
  }

  else
  {
  }

  p_cachedKey = (id *)&v13->_cachedSystemKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TKSEPKey objectID](v13->_cachedSystemKey, "objectID"));
  if ([v18 isEqual:v12])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([*p_cachedKey authContext]);
    unsigned int v20 = [v19 isEqual:v10];

    if (v20)
    {
LABEL_7:
      id v21 = *p_cachedKey;
LABEL_14:
      objc_sync_exit(v13);

      goto LABEL_15;
    }
  }

  else
  {
  }

  objc_sync_exit(v13);

  id v22 = objc_alloc(&OBJC_CLASS___TKSEPKey);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v21 = -[TKSEPKey initLocalWithObjectID:authContext:caller:forceSystemSession:error:]( v22,  "initLocalWithObjectID:authContext:caller:forceSystemSession:error:",  v12,  v10,  v23,  v6,  a6);

  if (v21)
  {
    objc_sync_enter(v13);
    else {
      p_cachedSystemKey = (id *)&v13->_cachedKey;
    }
    objc_storeStrong(p_cachedSystemKey, v21);
    goto LABEL_14;
  }

- (void)getAttributesOfKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v16 = 0LL;
  id v10 = (void (**)(id, void *, id))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a4,  v6,  &v16));
  id v12 = v16;
  id v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKSEPKeyServer serverAttributesOfKey:error:](self, "serverAttributesOfKey:error:", v11, &v15));
  id v14 = v15;

  v10[2](v10, v13, v14);
}

- (void)deleteKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (**)(id, id, void *))a6;
  id v17 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a4,  v6,  &v17));
  id v12 = v17;
  v13 = v12;
  if (v11)
  {
    id v16 = v12;
    id v14 = [v11 deleteWithError:&v16];
    id v15 = v16;

    v13 = v15;
  }

  else
  {
    id v14 = 0LL;
  }

  v10[2](v10, v14, v13);
}

- (void)signWithKey:(id)a3 digest:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a5,  v8,  &v20));
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 signDigest:v12 error:&v19]);
    id v18 = v19;

    id v16 = v18;
  }

  else
  {
    id v17 = 0LL;
  }

  v13[2](v13, v17, v16);
}

- (void)computeSharedSecretWithKey:(id)a3 publicKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a5,  v8,  &v20));
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 computeSharedSecret:v12 error:&v19]);
    id v18 = v19;

    id v16 = v18;
  }

  else
  {
    id v17 = 0LL;
  }

  v13[2](v13, v17, v16);
}

- (void)recryptWithKey:(id)a3 data:(id)a4 attributes:(id)a5 authContext:(id)a6 forceSystemSession:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, void *, void *))a8;
  id v23 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a6,  v9,  &v23));
  id v18 = v23;
  id v19 = v18;
  if (v17)
  {
    id v22 = v18;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 recryptData:v14 attributes:v15 error:&v22]);
    id v21 = v22;

    id v19 = v21;
  }

  else
  {
    id v20 = 0LL;
  }

  v16[2](v16, v20, v19);
}

- (void)decapsulateWithKey:(id)a3 encapsulatedKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a5,  v8,  &v20));
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 decapsulateKey:v12 error:&v19]);
    id v18 = v19;

    id v16 = v18;
  }

  else
  {
    id v17 = 0LL;
  }

  v13[2](v13, v17, v16);
}

- (void)attestWithKey:(id)a3 keyToAttest:(id)a4 nonce:(id)a5 authContext:(id)a6 forceSystemSessionAttestingKey:(BOOL)a7 forceSystemSessionKeyToAttest:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void *))a9;
  id v28 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  v17,  v10,  &v28));
  id v20 = v28;
  id v21 = v20;
  if (v19)
  {
    id v27 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  v15,  v17,  v9,  &v27));
    id v23 = v27;

    if (v22)
    {
      id v26 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v19 attestKey:v22 nonce:v16 error:&v26]);
      id v25 = v26;

      id v23 = v25;
    }

    else
    {
      v24 = 0LL;
    }

    id v21 = v23;
  }

  else
  {
    v24 = 0LL;
  }

  v18[2](v18, v24, v21);
}

- (void)lifetimeControlKey:(id)a3 type:(int64_t)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = (void (**)(id, id, void *))a7;
  id v19 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[TKSEPKeyServer keyForObjectID:authContext:forceSystemSession:error:]( self,  "keyForObjectID:authContext:forceSystemSession:error:",  a3,  a5,  v7,  &v19));
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    id v18 = v14;
    id v16 = [v13 lifetimeControlWithType:a4 error:&v18];
    id v17 = v18;

    id v15 = v17;
  }

  else
  {
    id v16 = 0LL;
  }

  v12[2](v12, v16, v15);
}

- (void).cxx_destruct
{
}

@end