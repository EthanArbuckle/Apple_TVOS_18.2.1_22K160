@interface TKTokenConfiguration
+ (BOOL)_hasSeparateKeysAndCertificatesObjectIDSpace;
+ (NSXPCInterface)interfaceForChangeProtocol;
+ (NSXPCInterface)interfaceForProtocol;
+ (void)set_hasSeparateKeysAndCertificatesObjectIDSpace:(BOOL)a3;
- (NSArray)keychainItems;
- (NSData)configurationData;
- (TKTokenConfiguration)initWithTokenID:(id)a3 configurationConnection:(id)a4;
- (TKTokenID)tokenID;
- (TKTokenInstanceID)instanceID;
- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error;
- (id)beginTransaction;
- (void)setConfigurationData:(NSData *)configurationData;
- (void)setKeychainItems:(NSArray *)keychainItems;
- (void)tokenConfigurationChanged:(id)a3;
@end

@implementation TKTokenConfiguration

+ (NSXPCInterface)interfaceForProtocol
{
  return (NSXPCInterface *)(id)interfaceForProtocol_interface;
}

void __44__TKTokenConfiguration_interfaceForProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B76C0];
  v1 = (void *)interfaceForProtocol_interface;
  interfaceForProtocol_interface = v0;

  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)interfaceForProtocol_interface setClasses:v4 forSelector:sel_getTokenIDsForClassID_reply_ argumentIndex:0 ofReply:1];
}

+ (NSXPCInterface)interfaceForChangeProtocol
{
  return (NSXPCInterface *)(id)interfaceForChangeProtocol_interface;
}

void __50__TKTokenConfiguration_interfaceForChangeProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B2518];
  v1 = (void *)interfaceForChangeProtocol_interface;
  interfaceForChangeProtocol_interface = v0;

  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)interfaceForChangeProtocol_interface setClasses:v4 forSelector:sel_tokenConfigurationChanged_ argumentIndex:0 ofReply:0];
}

- (TKTokenConfiguration)initWithTokenID:(id)a3 configurationConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKTokenConfiguration;
  v9 = -[TKTokenConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationConnection, a4);
    [v8 registerForConfigurationChange:v10];
    objc_storeStrong((id *)&v10->_tokenID, a3);
  }

  return v10;
}

- (TKTokenInstanceID)instanceID
{
  return -[TKTokenID instanceID](self->_tokenID, "instanceID");
}

- (void)tokenConfigurationChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[TKTokenID isEqual:](self->_tokenID, "isEqual:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          v9 = self;
          objc_sync_enter(v9);
          keychainItems = v9->_keychainItems;
          v9->_keychainItems = 0LL;

          objc_sync_exit(v9);
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)beginTransaction
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 beginTransactionWithReply:&__block_literal_global_117];

  return  -[TKTokenConfigurationTransaction initWithConfigurationConnection:]( objc_alloc(&OBJC_CLASS___TKTokenConfigurationTransaction),  "initWithConfigurationConnection:",  self->_configurationConnection);
}

- (NSData)configurationData
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  __int128 v11 = __Block_byref_object_copy__2;
  __int128 v12 = __Block_byref_object_dispose__2;
  id v13 = 0LL;
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenConfiguration tokenID](self, "tokenID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__TKTokenConfiguration_configurationData__block_invoke;
  v7[3] = &unk_189F8AA28;
  v7[4] = &v8;
  [v3 readDataForTokenID:v4 reply:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

void __41__TKTokenConfiguration_configurationData__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setConfigurationData:(NSData *)configurationData
{
  configurationConnection = self->_configurationConnection;
  id v5 = configurationData;
  -[TKTokenConfigurationConnection configurationProtocol](configurationConnection, "configurationProtocol");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TKTokenConfiguration tokenID](self, "tokenID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 updateTokenID:v6 data:v5 reply:&__block_literal_global_120];
}

- (NSArray)keychainItems
{
  v2 = self;
  objc_sync_enter(v2);
  keychainItems = v2->_keychainItems;
  if (!keychainItems)
  {
    id v4 = (void *)[MEMORY[0x189604A58] mutableCopy];
    -[TKTokenConfigurationConnection configurationProtocol](v2->_configurationConnection, "configurationProtocol");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenConfiguration tokenID](v2, "tokenID");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __37__TKTokenConfiguration_keychainItems__block_invoke;
    v12[3] = &unk_189F8AA70;
    id v7 = v4;
    id v13 = v7;
    [v5 getKeychainItemsForTokenID:v6 reply:v12];

    uint64_t v8 = [v7 copy];
    v9 = v2->_keychainItems;
    v2->_keychainItems = (NSArray *)v8;

    keychainItems = v2->_keychainItems;
  }

  uint64_t v10 = keychainItems;
  objc_sync_exit(v2);

  return v10;
}

void __37__TKTokenConfiguration_keychainItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        +[TKTokenKeychainItem keychainItemWithInfo:]( &OBJC_CLASS___TKTokenKeychainItem,  "keychainItemWithInfo:",  *(void *)(*((void *)&v9 + 1) + 8 * v7));
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8) {
          [*(id *)(a1 + 32) addObject:v8];
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

+ (BOOL)_hasSeparateKeysAndCertificatesObjectIDSpace
{
  if (_hasSeparateKeysAndCertificatesObjectIDSpaceIsSet == 1) {
    return _hasSeparateKeysAndCertificatesObjectIDSpace != 0;
  }
  BOOL result = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpace = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSet = 1;
  return result;
}

+ (void)set_hasSeparateKeysAndCertificatesObjectIDSpace:(BOOL)a3
{
  _hasSeparateKeysAndCertificatesObjectIDSpace = a3;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSet = 1;
  _hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally = 1;
}

- (void)setKeychainItems:(NSArray *)keychainItems
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v3 = keychainItems;
  TK_LOG_tokencfg();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TKTokenConfiguration setKeychainItems:].cold.1((uint64_t)v3, v4);
  }

  if (-[NSArray count](v3, "count"))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = *MEMORY[0x189603A58];
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v5);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v8 = ++v5;
      if (v5 < -[NSArray count](v3, "count")) {
        break;
      }
LABEL_23:

      if (v5 >= -[NSArray count](v3, "count")) {
        goto LABEL_24;
      }
    }

    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v8);
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectID];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectID];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v10 isEqual:v11];

      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v13 = @"Detected duplicate objectID for objects %@ and %@";
          if ((_hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally & 1) == 0)
          {
            TK_LOG_tokencfg();
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v7;
              __int16 v38 = 2114;
              v39 = v9;
              v15 = v14;
              uint64_t v16 = "Detected duplicate objectID for objects %{public}@ and %{public}@";
              goto LABEL_22;
            }

            goto LABEL_17;
          }

          goto LABEL_18;
        }

        if (([(id)objc_opt_class() _hasSeparateKeysAndCertificatesObjectIDSpace] & 1) == 0)
        {
          id v13 = @"Detected duplicate objectID for key %@ and certificate %@. This is allowed only for token extensions built for macOS 10.16 or newer. Either change build options to target newer OS version or avoid sharing same objectID for key and certificate.";
          if ((_hasSeparateKeysAndCertificatesObjectIDSpaceIsSetExternally & 1) == 0)
          {
            TK_LOG_tokencfg();
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v7;
              __int16 v38 = 2114;
              v39 = v9;
              v15 = v14;
              uint64_t v16 = "Detected duplicate objectID for key %{public}@ and certificate %{public}@. This is allowed only for "
                    "token extensions built for macOS 10.16 or newer. Either change build options to target newer OS vers"
                    "ion or avoid sharing same objectID for key and certificate.";
LABEL_22:
              _os_log_fault_impl(&dword_186E58000, v15, OS_LOG_TYPE_FAULT, v16, buf, 0x16u);
            }

- (TKTokenKeychainKey)keyForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  TKTokenObjectID v5 = objectID;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[TKTokenConfiguration keychainItems](self, "keychainItems");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v11 objectID];
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 isEqual:v5];

          if ((v13 & 1) != 0)
          {
            id v15 = v11;

            goto LABEL_16;
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  TK_LOG_tokencfg();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[TKTokenConfiguration keyForObjectID:error:].cold.1((uint64_t)v5, self);
  }

  if (error)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x189604A60]];
    id v15 = 0LL;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v15 = 0LL;
  }

- (TKTokenKeychainCertificate)certificateForObjectID:(TKTokenObjectID)objectID error:(NSError *)error
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  TKTokenObjectID v5 = objectID;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[TKTokenConfiguration keychainItems](self, "keychainItems");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v11 objectID];
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 isEqual:v5];

          if ((v13 & 1) != 0)
          {
            id v15 = v11;

            goto LABEL_16;
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  TK_LOG_tokencfg();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[TKTokenConfiguration certificateForObjectID:error:].cold.1((uint64_t)v5, self);
  }

  if (error)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:MEMORY[0x189604A60]];
    id v15 = 0LL;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v15 = 0LL;
  }

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (void).cxx_destruct
{
}

- (void)setKeychainItems:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Configuration got items: %{public}@",  (uint8_t *)&v2,  0xCu);
}

- (void)keyForObjectID:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0( &dword_186E58000,  v3,  v4,  "Cannot find requested key %{public}@ on token %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_2();
}

- (void)certificateForObjectID:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0( &dword_186E58000,  v3,  v4,  "Cannot find requested certificate %{public}@ on token %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_2();
}

@end