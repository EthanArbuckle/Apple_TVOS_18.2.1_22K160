@interface SecCTKKey
+ (id)fromKeyRef:(__SecKey *)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)keychainAttributes;
- (NSDictionary)sessionParameters;
- (SecCTKKey)initWithAttributes:(id)a3 error:(id *)a4;
- (TKClientTokenObject)tokenObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromKey:(id)a3;
- (id)performOperation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (int64_t)algorithmID;
- (void)setSessionParameters:(id)a3;
- (void)setTokenObject:(id)a3;
@end

@implementation SecCTKKey

- (SecCTKKey)initWithAttributes:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___SecCTKKey;
  v7 = -[SecCTKKey init](&v60, sel_init);
  v8 = v7;
  if (!v7) {
    goto LABEL_31;
  }
  if (!v7->_tokenObject)
  {
    [v6 objectForKeyedSubscript:@"u_TokenSession"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      goto LABEL_4;
    }
    if (!CryptoTokenKitLibraryCore())
    {
      if (a4)
      {
        v51 = (void *)MEMORY[0x189607870];
        uint64_t v52 = *MEMORY[0x189607670];
        uint64_t v63 = *MEMORY[0x189607490];
        v64[0] = @"CryptoTokenKit is not available";
        [MEMORY[0x189603F68] dictionaryWithObjects:v64 forKeys:&v63 count:1];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 errorWithDomain:v52 code:-4 userInfo:v53];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v9 = 0LL;
      goto LABEL_37;
    }

    id v13 = objc_alloc((Class)getTKClientTokenClass());
    [v6 objectForKeyedSubscript:@"tkid"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)[v13 initWithTokenID:v14];

    id v16 = objc_alloc((Class)getTKClientTokenSessionClass());
    [v6 objectForKeyedSubscript:@"u_AuthCtx"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)[v16 initWithToken:v15 LAContext:v17 parameters:MEMORY[0x189604A60] error:a4];

    if (v9)
    {
LABEL_4:
      [v6 objectForKeyedSubscript:@"toid"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        uint64_t v11 = [v9 objectForObjectID:v10 error:a4];
        tokenObject = v8->_tokenObject;
        v8->_tokenObject = (TKClientTokenObject *)v11;
      }

      else
      {
        tokenObject = (TKClientTokenObject *)[v6 mutableCopy];
        [v6 objectForKeyedSubscript:@"u_AuthCtx"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18) {
          -[TKClientTokenObject removeObjectForKey:](tokenObject, "removeObjectForKey:", @"u_AuthCtx");
        }
        [v6 objectForKeyedSubscript:@"accc"];
        v19 = (__CFData *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          CFTypeID v21 = CFGetTypeID(v19);
          if (v21 == SecAccessControlGetTypeID())
          {
            v29 = SecAccessControlCopyData((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);

            -[TKClientTokenObject setObject:forKeyedSubscript:]( tokenObject,  "setObject:forKeyedSubscript:",  v29,  @"accc");
            v20 = v29;
          }
        }

        uint64_t v30 = -[TKClientTokenObject copy](tokenObject, "copy");

        uint64_t v31 = [v9 createObjectWithAttributes:v30 error:a4];
        v32 = v8->_tokenObject;
        v8->_tokenObject = (TKClientTokenObject *)v31;

        id v6 = (id)v30;
      }

      v33 = v8->_tokenObject;
      if (v33)
      {

        goto LABEL_17;
      }
    }

- (id)initFromKey:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SecCTKKey;
  v5 = -[SecCTKKey init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 sessionParameters];
    sessionParameters = v5->_sessionParameters;
    v5->_sessionParameters = (NSDictionary *)v6;

    uint64_t v8 = [v4 keychainAttributes];
    keychainAttributes = v5->_keychainAttributes;
    v5->_keychainAttributes = (NSDictionary *)v8;

    uint64_t v10 = [v4 tokenObject];
    tokenObject = v5->_tokenObject;
    v5->_tokenObject = (TKClientTokenObject *)v10;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SecCTKKey initFromKey:](objc_alloc(&OBJC_CLASS___SecCTKKey), "initFromKey:", self);
}

- (id)performOperation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = -[SecCTKKey tokenObject](self, "tokenObject");
  [v15 operation:a3 data:0 algorithms:v13 parameters:v14 error:a7];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [MEMORY[0x189603FE8] null];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {

LABEL_6:
      v19 = -[SecCTKKey tokenObject](self, "tokenObject");
      [v19 operation:a3 data:v12 algorithms:v13 parameters:v14 error:a7];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = -[SecCTKKey tokenObject](self, "tokenObject");
  [v5 session];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 token];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 tokenID];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 tokenObject];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 session];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 token];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 tokenID];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:v12])
  {
    -[SecCTKKey tokenObject](self, "tokenObject");
    uint64_t v22 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectID];
    CFTypeID v21 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 tokenObject];
    id v23 = v4;
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectID];
    v15 = v8;
    id v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v13 isEqualToData:v17];

    v7 = v16;
    uint64_t v8 = v15;

    id v4 = v23;
    uint64_t v6 = v21;

    v5 = v22;
  }

  else
  {
    char v18 = 0;
  }

  return v18;
}

- (int64_t)algorithmID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 keychainAttributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"type"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v4 isEqualToString:@"73"] & 1) != 0
    || ([v4 isEqualToString:@"2147483678"] & 1) != 0
    || ([v4 isEqualToString:@"2147483679"] & 1) != 0
    || ([v4 isEqualToString:@"2147483680"] & 1) != 0)
  {
    int64_t v5 = 3LL;
  }

  else if ([v4 isEqualToString:@"105"])
  {
    int64_t v5 = 4LL;
  }

  else if ([v4 isEqualToString:@"106"])
  {
    int64_t v5 = 5LL;
  }

  else
  {
    int64_t v5 = 1LL;
  }

  return v5;
}

- (TKClientTokenObject)tokenObject
{
  return self->_tokenObject;
}

- (void)setTokenObject:(id)a3
{
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (NSDictionary)sessionParameters
{
  return self->_sessionParameters;
}

- (void)setSessionParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)fromKeyRef:(__SecKey *)a3
{
  return *((id *)a3 + 3);
}

@end