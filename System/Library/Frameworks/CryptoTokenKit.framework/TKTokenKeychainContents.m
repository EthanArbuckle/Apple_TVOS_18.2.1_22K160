@interface TKTokenKeychainContents
- (NSArray)items;
- (NSDictionary)certificates;
- (NSDictionary)keys;
- (NSString)tokenID;
- (TKTokenConfiguration)configuration;
- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (TKTokenKeychainContents)initWithConfiguration:(id)a3;
- (TKTokenKeychainContents)initWithTokenID:(id)a3;
- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (id)certificateForKey:(id)a3;
- (void)fillWithItems:(NSArray *)items;
@end

@implementation TKTokenKeychainContents

- (TKTokenKeychainContents)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKTokenKeychainContents;
  v6 = -[TKTokenKeychainContents init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (TKTokenKeychainContents)initWithTokenID:(id)a3
{
  id v5 = a3;
  v6 = -[TKTokenID initWithTokenID:](objc_alloc(&OBJC_CLASS___TKTokenID), "initWithTokenID:", v5);
  v7 = +[TKTokenDriverConfiguration driverConfigurations](&OBJC_CLASS___TKTokenDriverConfiguration, "driverConfigurations");
  v8 = -[TKTokenID classID](v6, "classID");
  [v7 objectForKeyedSubscript:v8];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"TKTokenKeychainItem.m", 522, @"Failed to get driver configuration for %@", v6 object file lineNumber description];
  }

  [v9 tokenConfigurations];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TKTokenID instanceID](v6, "instanceID");
  [v10 objectForKeyedSubscript:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = -[TKTokenID instanceID](v6, "instanceID");
    [v9 addTokenConfigurationForTokenInstanceID:v13];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = -[TKTokenKeychainContents initWithConfiguration:](self, "initWithConfiguration:", v12);

  return v14;
}

- (void)fillWithItems:(NSArray *)items
{
  v4 = items;
  -[TKTokenKeychainContents configuration](self, "configuration");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setKeychainItems:v4];

  v6 = self->_items;
  self->_items = v4;
}

- (NSArray)items
{
  items = self->_items;
  if (!items)
  {
    v4 = -[TKTokenKeychainContents configuration](self, "configuration");
    [v4 keychainItems];
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_items;
    self->_items = v5;

    items = self->_items;
  }

  return items;
}

- (NSDictionary)certificates
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = (void *)[MEMORY[0x189604A60] mutableCopy];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = -[TKTokenKeychainContents items](self, "items", 0LL);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v9 objectID];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 setObject:v9 forKeyedSubscript:v10];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  v11 = (void *)[v3 copy];
  return (NSDictionary *)v11;
}

- (NSDictionary)keys
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = (void *)[MEMORY[0x189604A60] mutableCopy];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = -[TKTokenKeychainContents items](self, "items", 0LL);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v9 objectID];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 setObject:v9 forKeyedSubscript:v10];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  v11 = (void *)[v3 copy];
  return (NSDictionary *)v11;
}

- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6 = objectID;
  -[TKTokenKeychainContents certificates](self, "certificates");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    TK_LOG_token_2();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenConfiguration keyForObjectID:error:].cold.1((uint64_t)v6, self);
    }

    if (error)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x189604A60]];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (TKTokenKeychainCertificate *)v8;
}

- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  TKTokenObjectID v6 = objectID;
  -[TKTokenKeychainContents keys](self, "keys");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    TK_LOG_token_2();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenConfiguration certificateForObjectID:error:].cold.1((uint64_t)v6, self);
    }

    if (error)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x189604A60]];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (TKTokenKeychainKey *)v8;
}

- (id)certificateForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[TKTokenKeychainContents items](self, "items", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v4 publicKeyHash];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 publicKeyHash];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          char v12 = [v10 isEqualToData:v11];

          if ((v12 & 1) != 0)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (TKTokenConfiguration)configuration
{
  return (TKTokenConfiguration *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)tokenID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end