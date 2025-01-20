@interface TKClientTokenAdvertisedItem
- (NSData)objectID;
- (NSDictionary)keychainAttributes;
- (NSString)localizedName;
- (TKClientTokenAdvertisedItem)initWithSession:(id)a3 keychainAttributes:(id)a4 secRef:(id)a5;
- (TKClientTokenSession)session;
- (__SecCertificate)certificateRef;
- (__SecIdentity)identityRef;
- (__SecKey)keyRef;
- (id)keychainClass;
- (unint64_t)keyUsage;
- (void)certificateRef;
- (void)keyRef;
@end

@implementation TKClientTokenAdvertisedItem

- (TKClientTokenAdvertisedItem)initWithSession:(id)a3 keychainAttributes:(id)a4 secRef:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKClientTokenAdvertisedItem;
  v12 = -[TKClientTokenAdvertisedItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_keychainAttributes, a4);
    objc_storeStrong(&v13->_secRef, a5);
  }

  return v13;
}

- (NSData)objectID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x18960BAD8]];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)localizedName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x18960B9F8]];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keychainClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*MEMORY[0x18960BB38]];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)keyUsage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"keyUsage"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (__SecKey)keyRef
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:*MEMORY[0x18960BB60]];

  if (!v4) {
    return 0LL;
  }
  result = (__SecKey *)self->_secRef;
  if (!result)
  {
    v6 = -[TKClientTokenAdvertisedItem session](self, "session");
    [v6 token];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 tokenID];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CFErrorRef error = 0LL;
    -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = (void *)[v9 mutableCopy];

    -[TKClientTokenAdvertisedItem session](self, "session");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v11 forKeyedSubscript:@"u_TokenSession"];

    [MEMORY[0x189603F48] data];
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    SecKeyRef v13 = SecKeyCreateWithData(v12, (CFDictionaryRef)v10, &error);
    id secRef = self->_secRef;
    self->_id secRef = v13;

    if (!self->_secRef)
    {
      TK_LOG_client_0();
      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TKClientTokenAdvertisedItem keyRef].cold.1();
      }
    }

    return (__SecKey *)self->_secRef;
  }

  return result;
}

- (__SecCertificate)certificateRef
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:*MEMORY[0x18960BB40]];

  if (!v4) {
    return 0LL;
  }
  result = (__SecCertificate *)self->_secRef;
  if (!result)
  {
    v6 = -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
    [v6 objectForKeyedSubscript:*MEMORY[0x18960BE78]];
    v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    SecCertificateRef v8 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x189604DB0], v7);
    id secRef = self->_secRef;
    self->_id secRef = v8;

    if (!self->_secRef)
    {
      -[TKClientTokenAdvertisedItem session](self, "session");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 token];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 tokenID];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      TK_LOG_client_0();
      SecKeyRef v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[TKClientTokenAdvertisedItem certificateRef].cold.1((uint64_t)v12, (uint64_t)v7, v13);
      }
    }

    return (__SecCertificate *)self->_secRef;
  }

  return result;
}

- (__SecIdentity)identityRef
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:*MEMORY[0x18960BB50]];

  if (v4) {
    return (__SecIdentity *)self->_secRef;
  }
  else {
    return 0LL;
  }
}

- (TKClientTokenSession)session
{
  return self->_session;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
}

- (void)keyRef
{
}

- (void)certificateRef
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1( &dword_186E58000,  a2,  a3,  "Failed to create certificate from advertised item of token %{public}@, data: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_4();
}

@end