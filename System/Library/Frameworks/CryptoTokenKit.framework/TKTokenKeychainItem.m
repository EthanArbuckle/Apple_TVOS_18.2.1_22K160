@interface TKTokenKeychainItem
+ (NSDictionary)operationMap;
+ (TKTokenKeychainItem)keychainItemWithInfo:(id)a3;
+ (id)accessControlForConstraints:(id)a3 tokenID:(id)a4 error:(id *)a5;
- (NSData)accessControl;
- (NSDictionary)constraints;
- (NSMutableDictionary)keychainAttributes;
- (NSString)label;
- (TKTokenID)tokenID;
- (TKTokenKeychainItem)initWithItemInfo:(id)a3;
- (TKTokenKeychainItem)initWithObjectID:(TKTokenObjectID)objectID;
- (TKTokenObjectID)objectID;
- (id)description;
- (void)setAccessControl:(id)a3;
- (void)setConstraints:(NSDictionary *)constraints;
- (void)setLabel:(NSString *)label;
- (void)setTokenID:(id)a3;
@end

@implementation TKTokenKeychainItem

- (TKTokenKeychainItem)initWithObjectID:(TKTokenObjectID)objectID
{
  TKTokenObjectID v5 = objectID;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKTokenKeychainItem;
  v6 = -[TKTokenKeychainItem init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_objectID, objectID);
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v4 length] >= 0x21)
  {
    [v4 substringToIndex:32];
    TKTokenObjectID v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 stringByAppendingString:@"..."];

    v4 = (void *)v6;
  }
  v7 = -[TKTokenKeychainItem label](self, "label");
  v8 = (void *)NSString;
  objc_super v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v11 = (void *)v10;
  if (v7)
  {
    v12 = -[TKTokenKeychainItem label](self, "label");
    [v8 stringWithFormat:@"<%@: %@ '%@'>", v11, v4, v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v8 stringWithFormat:@"<%@: %@>", v10, v4];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (NSDictionary)operationMap
{
  v4[4] = *MEMORY[0x1895F89C0];
  v3[0] = @"ord";
  v3[1] = @"osgn";
  v4[0] = &unk_189F98600;
  v4[1] = &unk_189F98618;
  v3[2] = @"od";
  v3[3] = @"ock";
  v4[2] = &unk_189F98630;
  v4[3] = &unk_189F98648;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)accessControlForConstraints:(id)a3 tokenID:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = (void *)SecAccessControlCreate();
  if (v9)
  {
    v20 = @"tkid";
    [v8 stringRepresentation];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (SecAccessControlSetProtection())
    {
      [MEMORY[0x189603FC8] dictionary];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 operationMap];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke;
      v17[3] = &unk_189F8B2E0;
      id v18 = v7;
      id v19 = v12;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v17];

      SecAccessControlSetConstraints();
      v15 = (void *)SecAccessControlCopyData();
    }

    else
    {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

void __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v7 = a2;
  [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  TKTokenObjectID v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 && ([v5 isEqual:MEMORY[0x189604A80]] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

- (void)setAccessControl:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_accessControl, a3);
  if (v5)
  {
    v33 = 0LL;
    uint64_t v6 = (void *)SecAccessControlCreateFromData();
    if (v6)
    {
      SecAccessControlGetProtection();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v7 objectForKeyedSubscript:@"tkid"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem tokenID](self, "tokenID");
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 stringRepresentation];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v8 isEqual:v10];

        if (v11)
        {
          SecAccessControlGetConstraints();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v7;
            v28 = v6;
            v13 = (void *)[MEMORY[0x189604A60] mutableCopy];
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            v26 = v12;
            id v14 = v12;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v30;
              do
              {
                for (uint64_t i = 0LL; i != v16; ++i)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                  [(id)objc_opt_class() operationMap];
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  [v20 objectForKeyedSubscript:v19];
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                  {
                    [v14 objectForKeyedSubscript:v19];
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    [v13 setObject:v22 forKeyedSubscript:v21];
                  }
                }

                uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
              }

              while (v16);
            }

            v23 = (NSDictionary *)[v13 copy];
            constraints = self->_constraints;
            self->_constraints = v23;

            id v7 = v27;
            uint64_t v6 = v28;
            v12 = v26;
          }
        }
      }
    }

    else
    {
      TK_LOG_token_2();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        -[TKTokenKeychainItem setAccessControl:].cold.1((uint64_t *)&v33, (uint64_t)v5, (os_log_t)v7);
      }
    }

    v25 = v33;
  }

  else
  {
    v25 = self->_constraints;
    self->_constraints = (NSDictionary *)MEMORY[0x189604A60];
  }
}

- (NSData)accessControl
{
  accessControl = self->_accessControl;
  if (!accessControl)
  {
    v4 = -[TKTokenKeychainItem constraints](self, "constraints");
    if (v4)
    {
      -[TKTokenKeychainItem tokenID](self, "tokenID");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        uint64_t v6 = (void *)objc_opt_class();
        -[TKTokenKeychainItem tokenID](self, "tokenID");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 accessControlForConstraints:v4 tokenID:v7 error:0];
        id v8 = (NSData *)objc_claimAutoreleasedReturnValue();
        objc_super v9 = self->_accessControl;
        self->_accessControl = v8;
      }
    }

    accessControl = self->_accessControl;
  }

  return accessControl;
}

- (NSMutableDictionary)keychainAttributes
{
  v15[3] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189603FC8];
  v14[0] = *MEMORY[0x18960BAB8];
  v4 = -[TKTokenKeychainItem tokenID](self, "tokenID");
  [v4 stringRepresentation];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = *MEMORY[0x18960BAD8];
  -[TKTokenKeychainItem encodedObjectID](self, "encodedObjectID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = *MEMORY[0x18960B828];
  uint64_t v7 = *MEMORY[0x18960B840];
  v15[1] = v6;
  v15[2] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dictionaryWithDictionary:v8];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKTokenKeychainItem label](self, "label");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TKTokenKeychainItem label](self, "label");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x18960B9F8]];
  }
  v12 = -[TKTokenKeychainItem accessControl](self, "accessControl");
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x18960B818]];
  }

  return (NSMutableDictionary *)v9;
}

- (TKTokenKeychainItem)initWithItemInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___TKTokenID);
  uint64_t v6 = *MEMORY[0x18960BAB8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960BAB8]];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[TKTokenID initWithTokenID:](v5, "initWithTokenID:", v7);

  if (v8)
  {
    uint64_t v9 = *MEMORY[0x18960BAD8];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960BAD8]];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = 0LL;
    -[TKTokenID decodedObjectID:isCertificate:error:](v8, "decodedObjectID:isCertificate:error:", v10, &v23, &v22);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (os_log_s *)v22;

    if (v11)
    {
      v21.receiver = self;
      v21.super_class = (Class)&OBJC_CLASS___TKTokenKeychainItem;
      v13 = -[TKTokenKeychainItem init](&v21, sel_init);
      id v14 = v13;
      if (v13)
      {
        objc_storeStrong(&v13->_objectID, v11);
        -[TKTokenKeychainItem setTokenID:](v14, "setTokenID:", v8);
        [v4 objectForKeyedSubscript:*MEMORY[0x18960B9F8]];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem setLabel:](v14, "setLabel:", v15);

        [v4 objectForKeyedSubscript:*MEMORY[0x18960B818]];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem setAccessControl:](v14, "setAccessControl:", v16);
      }

      self = v14;
      uint64_t v17 = self;
    }

    else
    {
      TK_LOG_token_2();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [v4 objectForKeyedSubscript:v9];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_error_impl( &dword_186E58000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenOID: %{public}@, error:%{public}@",  buf,  0x16u);
      }

      uint64_t v17 = 0LL;
    }
  }

  else
  {
    TK_LOG_token_2();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TKTokenKeychainItem initWithItemInfo:].cold.1(v4, v6, v12);
    }
    uint64_t v17 = 0LL;
  }

  return v17;
}

+ (TKTokenKeychainItem)keychainItemWithInfo:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:*MEMORY[0x18960BB38]];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqual:*MEMORY[0x18960BB40]])
  {
    id v5 = off_189F89850;
  }

  else
  {
    if (![v4 isEqual:*MEMORY[0x18960BB60]])
    {
      uint64_t v6 = 0LL;
      goto LABEL_7;
    }

    id v5 = off_189F89868;
  }

  uint64_t v6 = (void *)[objc_alloc(*v5) initWithItemInfo:v3];
LABEL_7:

  return (TKTokenKeychainItem *)v6;
}

- (TKTokenObjectID)objectID
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLabel:(NSString *)label
{
}

- (NSDictionary)constraints
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConstraints:(NSDictionary *)constraints
{
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTokenID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setAccessControl:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_186E58000,  log,  OS_LOG_TYPE_ERROR,  "TKTokenKeychainItem got invalid accessControl, error:%{public}@ data:%{public}@",  (uint8_t *)&v4,  0x16u);
}

- (void)initWithItemInfo:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 objectForKeyedSubscript:a2];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenID: %{public}@",  (uint8_t *)&v5,  0xCu);
}

@end