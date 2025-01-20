@interface NEKeychainItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isModernSystem;
- (NEKeychainItem)initWithCoder:(id)a3;
- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPersistentReference:(id)a3 keyReference:(id)a4 isModernSystem:(BOOL)a5 domain:(int64_t)a6 accessGroup:(id)a7;
- (NSData)data;
- (NSData)keyPersistentReference;
- (NSData)persistentReference;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)password;
- (id)copyData;
- (id)copyPassword;
- (id)copyQueryWithReturnTypes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)domain;
- (uint64_t)copyDataFromKeychainItem:(void *)a1 outData:(const __CFData *)a2 outIdentifier:(void *)a3 outPersistentReference:(void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)migrateFromPreferences:(__SCPreferences *)a3;
- (void)remove;
- (void)setAccessGroup:(id)a3;
- (void)setData:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyPersistentReference:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersistentReference:(id)a3;
- (void)syncUsingConfiguration:(id)a3 accountName:(id)a4 passwordType:(int64_t)a5 identifierSuffix:(id)a6;
@end

@implementation NEKeychainItem

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithPassword:domain:accessGroup:]( self,  "initWithPassword:domain:accessGroup:",  a3,  a4,  0LL);
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithData:domain:accessGroup:](self, "initWithData:domain:accessGroup:", a3, a4, 0LL);
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( self,  "initWithIdentifier:domain:accessGroup:",  a3,  a4,  0LL);
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( self,  "initWithPersistentReference:domain:accessGroup:",  a3,  a4,  0LL);
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4
{
  return -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( self,  "initWithLegacyIdentifier:domain:accessGroup:",  a3,  a4,  0LL);
}

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [v9 dataUsingEncoding:4];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NEKeychainItem initWithData:domain:accessGroup:](self, "initWithData:domain:accessGroup:", v11, a4, v10);

  if (v12) {
    objc_storeStrong((id *)&v12->_password, a3);
  }

  return v12;
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEKeychainItem;
  id v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    CFDataRef v11 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v8);
    data = v10->_data;
    v10->_data = (NSData *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }

  return v10;
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEKeychainItem;
  id v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }

  return v10;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEKeychainItem;
  id v10 = -[NEKeychainItem init](&v16, sel_init);
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    persistentReference = v10->_persistentReference;
    v10->_persistentReference = (NSData *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }

  return v10;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 keyReference:(id)a4 isModernSystem:(BOOL)a5 domain:(int64_t)a6 accessGroup:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEKeychainItem;
  v15 = -[NEKeychainItem init](&v23, sel_init);
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    persistentReference = v15->_persistentReference;
    v15->_persistentReference = (NSData *)v16;

    uint64_t v18 = [v13 copy];
    keyPersistentReference = v15->_keyPersistentReference;
    v15->_keyPersistentReference = (NSData *)v18;

    v15->_isModernSystem = a5;
    v15->_domain = a6;
    uint64_t v20 = [v14 copy];
    accessGroup = v15->_accessGroup;
    v15->_accessGroup = (NSString *)v20;
  }

  return v15;
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  result = -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( self,  "initWithIdentifier:domain:accessGroup:",  a3,  a4,  a5);
  if (result) {
    result->_legacy = 1;
  }
  return result;
}

- (NEKeychainItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEKeychainItem;
  v5 = -[NEKeychainItem init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersistentReference"];
    persistentReference = v5->_persistentReference;
    v5->_persistentReference = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeyPersistentReference"];
    keyPersistentReference = v5->_keyPersistentReference;
    v5->_keyPersistentReference = (NSData *)v10;

    v5->_isModernSystem = [v4 decodeBoolForKey:@"IsModernSystem"];
    v5->_domain = (int)[v4 decodeInt32ForKey:@"Domain"];
    if ([v4 containsValueForKey:@"Password"])
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 dataUsingEncoding:4];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFDataRef v14 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v13);
      data = v5->_data;
      v5->_data = (NSData *)v14;

      password = (NSData *)v5->_password;
      v5->_password = (NSString *)v12;
    }

    else
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFDataRef v17 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v13);
      password = v5->_data;
      v5->_data = (NSData *)v17;
    }

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OldItem"];
    oldItem = v5->_oldItem;
    v5->_oldItem = (NEKeychainItem *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  -[NEKeychainItem identifier](self, "identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"Identifier"];
  v5 = -[NEKeychainItem persistentReference](self, "persistentReference");
  [v8 encodeObject:v5 forKey:@"PersistentReference"];

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v6 forKey:@"KeyPersistentReference"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[NEKeychainItem isModernSystem](self, "isModernSystem"),  @"IsModernSystem");
  objc_msgSend(v8, "encodeInt32:forKey:", -[NEKeychainItem domain](self, "domain"), @"Domain");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v8 encodeObject:self->_data forKey:@"Data"];
  }
  [v8 encodeObject:self->_oldItem forKey:@"OldItem"];
  v7 = -[NEKeychainItem accessGroup](self, "accessGroup");
  [v8 encodeObject:v7 forKey:@"AccessGroup"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NEKeychainItem identifier](self, "identifier");
  int64_t v6 = -[NEKeychainItem domain](self, "domain");
  v7 = -[NEKeychainItem accessGroup](self, "accessGroup");
  uint64_t v8 = [v4 initWithIdentifier:v5 domain:v6 accessGroup:v7];

  -[NEKeychainItem persistentReference](self, "persistentReference");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v10;

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 copy];
  CFDataRef v14 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v13;

  *(_BYTE *)(v8 + 48) = -[NEKeychainItem isModernSystem](self, "isModernSystem");
  CFDataRef v15 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], self->_data);
  uint64_t v16 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v15;

  *(_BYTE *)(v8 + 49) = self->_legacy;
  return (id)v8;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  -[NEKeychainItem identifier](self, "identifier");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"identifier" andIndent:v5 options:isKindOfClass & 1 | a4];

  -[NEKeychainItem persistentReference](self, "persistentReference");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"persistentReference" andIndent:v5 options:a4];

  -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEKeychainItem keyPersistentReference](self, "keyPersistentReference");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendPrettyObject:v12 withName:@"keyPersistentReference" andIndent:v5 options:a4];
  }

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEKeychainItem isModernSystem](self, "isModernSystem"),  @"isModernSystem",  v5,  a4);
  if (-[NEKeychainItem domain](self, "domain")) {
    uint64_t v13 = @"user";
  }
  else {
    uint64_t v13 = @"system";
  }
  [v7 appendPrettyObject:v13 withName:@"domain" andIndent:v5 options:a4];
  -[NEKeychainItem accessGroup](self, "accessGroup");
  CFDataRef v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"accessGroup" andIndent:v5 options:a4];

  return v7;
}

- (NSString)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identifier;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  identifier = v5->_identifier;
  if (v4 && !identifier || identifier && !-[NSString isEqualToString:](identifier, "isEqualToString:", v4))
  {
    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      CFDataRef v15 = v5->_identifier;
      int v16 = 138412546;
      CFDataRef v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_debug_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEBUG,  "setIdentifier: old %@, new %@",  (uint8_t *)&v16,  0x16u);
    }

    if (v5->_identifier)
    {
      uint64_t v8 = -[NEKeychainItem copy](v5, "copy");
      oldItem = v5->_oldItem;
      v5->_oldItem = (NEKeychainItem *)v8;
    }

    if (v4) {
      uint64_t v10 = [objc_alloc(NSString) initWithString:v4];
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    persistentReference = v5->_persistentReference;
    v5->_persistentReference = 0LL;

    data = v5->_data;
    v5->_data = 0LL;

    password = v5->_password;
    v5->_password = 0LL;
  }

  objc_sync_exit(v5);
}

- (NSData)persistentReference
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_persistentReference;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPersistentReference:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  persistentReference = v4->_persistentReference;
  if (v13 && !persistentReference)
  {
LABEL_3:
    uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithData:v13];
LABEL_4:
    v7 = v4->_persistentReference;
    v4->_persistentReference = (NSData *)v6;

    identifier = v4->_identifier;
    v4->_identifier = 0LL;

    data = v4->_data;
    v4->_data = 0LL;

    password = v4->_password;
    v4->_password = 0LL;

    goto LABEL_7;
  }

  if (persistentReference && (-[NSData isEqual:](persistentReference, "isEqual:", v13) & 1) == 0)
  {
    if (v4->_persistentReference)
    {
      uint64_t v11 = -[NEKeychainItem copy](v4, "copy");
      oldItem = v4->_oldItem;
      v4->_oldItem = (NEKeychainItem *)v11;
    }

    uint64_t v6 = (uint64_t)v13;
    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

- (void)setPassword:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([v11 length])
  {
    [v11 dataUsingEncoding:4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataRef v6 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v5);
    data = v4->_data;
    v4->_data = (NSData *)v6;

    uint64_t v8 = [objc_alloc(NSString) initWithString:v11];
    password = v4->_password;
    v4->_password = (NSString *)v8;
  }

  else
  {
    uint64_t v10 = v4->_data;
    v4->_data = 0LL;

    uint64_t v5 = v4->_password;
    v4->_password = 0LL;
  }

  objc_sync_exit(v4);
}

- (NSString)password
{
  v2 = self;
  objc_sync_enter(v2);
  password = (NSData *)v2->_password;
  if (!password)
  {
    password = v2->_data;
    if (password)
    {
      uint64_t v4 = [objc_alloc(NSString) initWithData:v2->_data encoding:4];
      uint64_t v5 = v2->_password;
      v2->_password = (NSString *)v4;

      password = (NSData *)v2->_password;
    }
  }

  CFDataRef v6 = password;
  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setData:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  CFDataRef v5 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v8);
  data = v4->_data;
  v4->_data = (NSData *)v5;

  password = v4->_password;
  v4->_password = 0LL;

  objc_sync_exit(v4);
}

- (NSData)data
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_data;
  objc_sync_exit(v2);

  return v3;
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v5 setObject:*MEMORY[0x18960BB48] forKeyedSubscript:*MEMORY[0x18960BB38]];
  -[NEKeychainItem identifier](self, "identifier");
  CFDataRef v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NEKeychainItem identifier](self, "identifier");
    id v8 = (void *)MEMORY[0x18960BA88];
  }

  else
  {
    -[NEKeychainItem persistentReference](self, "persistentReference");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_6;
    }
    v7 = -[NEKeychainItem persistentReference](self, "persistentReference");
    id v8 = (void *)MEMORY[0x18960BE80];
  }

  [v5 setObject:v7 forKeyedSubscript:*v8];

LABEL_6:
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    uint64_t v14 = MEMORY[0x189604A88];
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( v5,  "setObject:forKeyedSubscript:",  v14,  *(void *)(*((void *)&v17 + 1) + 8 * v15++),  (void)v17);
      }

      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE70]];
  return v5;
}

- (id)copyPassword
{
  id v2 = -[NEKeychainItem copyData](self, "copyData");
  if (v2) {
    v3 = (void *)[objc_alloc(NSString) initWithData:v2 encoding:4];
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (id)copyData
{
  id v3 = 0LL;
  -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:]( self,  (const __CFData **)&v3,  0LL,  0LL);
  return v3;
}

- (void)remove
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NEKeychainItem identifier](self, "identifier");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
  }

  else
  {
    -[NEKeychainItem persistentReference](self, "persistentReference");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      return;
    }
  }

  id v5 = -[NEKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", 0LL);
  OSStatus v6 = SecItemDelete(v5);
  if (v6)
  {
    OSStatus v7 = v6;
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NEKeychainItem identifier](self, "identifier");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 1024;
      OSStatus v13 = v7;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@: SecItemDelete failed: %d",  (uint8_t *)&v10,  0x12u);
    }
  }

  -[NEKeychainItem setIdentifier:](self, "setIdentifier:", 0LL);
  -[NEKeychainItem setPersistentReference:](self, "setPersistentReference:", 0LL);
}

- (void)syncUsingConfiguration:(id)a3 accountName:(id)a4 passwordType:(int64_t)a5 identifierSuffix:(id)a6
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  id v86 = a3;
  id v84 = a4;
  id v85 = a6;
  int v10 = self;
  objc_sync_enter(v10);
  if (!v10 || !v10->_legacy)
  {
    -[NEKeychainItem identifier](v10, "identifier");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NEKeychainItem identifier](v10, "identifier");
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 identifier];
      OSStatus v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 UUIDString];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = [v12 hasPrefix:v14];

      if ((v15 & 1) == 0)
      {
        if (!v10->_data)
        {
          uint64_t v16 = -[NEKeychainItem copyData](v10, "copyData");
          data = v10->_data;
          v10->_data = (NSData *)v16;
        }

        identifier = v10->_identifier;
        v10->_identifier = 0LL;

        persistentReference = v10->_persistentReference;
        v10->_persistentReference = 0LL;
      }
    }
  }

  if (!v10->_data)
  {
    -[NEKeychainItem identifier](v10, "identifier");
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
    }

    else
    {
      v21 = -[NEKeychainItem persistentReference](v10, "persistentReference");
      if (!v21) {
        goto LABEL_63;
      }
    }
  }

  ne_log_obj();
  objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = -[NEKeychainItem identifier](v10, "identifier");
    v25 = -[NEKeychainItem persistentReference](v10, "persistentReference");
    v26 = v10->_data;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2048;
    v90 = v26;
    _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEFAULT,  "Adding/Updating keychain item with identifier %@, persistentReference %@, data %p",  buf,  0x20u);
  }

  id v83 = v86;
  id v27 = v84;
  id v82 = v85;
  v28 = v10;
  objc_sync_enter(v28);
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  id v87 = 0LL;
  id v88 = 0LL;
  int v29 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](v28, 0LL, &v88, &v87);
  id v30 = v88;
  id v31 = v88;
  v32 = (NSData *)v87;
  if (!v29)
  {
    ne_log_obj();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = -[NEKeychainItem identifier](v28, "identifier");
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v43;
      _os_log_error_impl( &dword_1876B1000,  v42,  OS_LOG_TYPE_ERROR,  "%@: Failed to retrieve keychain item from the keychain",  buf,  0xCu);
    }

    goto LABEL_61;
  }

  if (v10->_data)
  {
    id v33 = objc_alloc_init(MEMORY[0x189603FC8]);
    v34 = @"VPN Password";
    if (a5 == 1) {
      v34 = @"IPSec XAuth Password";
    }
    if (a5 == 2) {
      v34 = @"IPSec Shared Secret";
    }
    CFDictionaryRef query = (CFDictionaryRef)v34;
    v35 = -[NEKeychainItem identifier](v28, "identifier");
    BOOL v36 = v35 == 0LL;

    if (v36)
    {
      if ([v82 length])
      {
        id v37 = objc_alloc(NSString);
        [v83 identifier];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 UUIDString];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v40 = [v37 initWithFormat:@"%@.%@", v39, v82];
        v41 = v28->_identifier;
        v28->_identifier = (NSString *)v40;
      }

      else
      {
        [v83 identifier];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v53 = [v38 UUIDString];
        v39 = v28->_identifier;
        v28->_identifier = (NSString *)v53;
      }
    }
    v54 = -[NEKeychainItem identifier](v28, "identifier");
    v55 = (void *)*MEMORY[0x18960BA88];
    [v33 setObject:v54 forKeyedSubscript:*MEMORY[0x18960BA88]];

    [v83 name];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 setObject:v56 forKeyedSubscript:*MEMORY[0x18960B9F8]];

    [v33 setObject:query forKeyedSubscript:*MEMORY[0x18960B918]];
    if (v27) {
      [v33 setObject:v27 forKeyedSubscript:*MEMORY[0x18960B870]];
    }
    [v33 setObject:v10->_data forKeyedSubscript:*MEMORY[0x18960BE78]];
    [v33 setObject:*MEMORY[0x18960B830] forKeyedSubscript:*MEMORY[0x18960B828]];
    v57 = -[NEKeychainItem accessGroup](v28, "accessGroup");
    BOOL v58 = v57 == 0LL;

    if (!v58)
    {
      v59 = -[NEKeychainItem accessGroup](v28, "accessGroup");
      [v33 setObject:v59 forKeyedSubscript:*MEMORY[0x18960B820]];
    }

    if (v31)
    {
      uint64_t v60 = *MEMORY[0x18960BB48];
      CFTypeRef result = (CFTypeRef)*MEMORY[0x18960BB38];
      id v95 = v55;
      *(void *)buf = v60;
      *(void *)&buf[8] = v31;
      uint64_t v96 = *MEMORY[0x18960BE70];
      *(void *)&buf[16] = *MEMORY[0x189604DE8];
      [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&result count:3];
      v61 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      OSStatus v62 = SecItemUpdate(v61, (CFDictionaryRef)v33);
      if (v62)
      {
        ne_log_obj();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          uint64_t v74 = -[NEKeychainItem identifier](v28, "identifier");
          *(_DWORD *)v93 = 138412546;
          *(void *)&v93[4] = v74;
          *(_WORD *)&v93[12] = 1024;
          *(_DWORD *)&v93[14] = v62;
          v75 = (void *)v74;
          _os_log_error_impl(&dword_1876B1000, v63, OS_LOG_TYPE_ERROR, "%@: SecItemUpdate failed: %d", v93, 0x12u);
        }
      }

      else
      {
        -[NEKeychainItem setData:](v28, "setData:", 0LL);
      }
    }

    else
    {
      CFTypeRef result = 0LL;

      [v33 setObject:*MEMORY[0x18960BB48] forKeyedSubscript:*MEMORY[0x18960BB38]];
      [v33 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE28]];
      [v33 setObject:*MEMORY[0x189604DE8] forKeyedSubscript:*MEMORY[0x18960BE70]];
      OSStatus v64 = SecItemAdd((CFDictionaryRef)v33, &result);
      if (v64)
      {
        ne_log_obj();
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v76 = -[NEKeychainItem identifier](v28, "identifier");
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v64;
          _os_log_error_impl(&dword_1876B1000, v65, OS_LOG_TYPE_ERROR, "%@: SecItemAdd failed: %d", buf, 0x12u);
        }

        v32 = 0LL;
      }

      else
      {
        if (result && (uint64_t v73 = CFDATA_TYPE, CFGetTypeID(result) == v73))
        {
          if (CFDataGetLength((CFDataRef)result) <= 0) {
            v32 = 0LL;
          }
          else {
            v32 = (NSData *)result;
          }
        }

        else
        {
          v32 = 0LL;
        }

        -[NEKeychainItem setData:](v28, "setData:", 0LL);
      }
    }

LABEL_57:
    if (!v31) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  v44 = -[NEKeychainItem accessGroup](v28, "accessGroup");
  if (v44) {
    BOOL v45 = v31 == 0LL;
  }
  else {
    BOOL v45 = 1;
  }
  int v46 = !v45;

  if (!v46) {
    goto LABEL_57;
  }
  v47 = (const void *)*MEMORY[0x18960BB48];
  uint64_t v48 = *MEMORY[0x18960BA88];
  *(void *)v93 = *MEMORY[0x18960BB38];
  *(void *)&v93[8] = v48;
  CFTypeRef result = v47;
  id v95 = v31;
  *(void *)&v93[16] = *MEMORY[0x18960BE70];
  uint64_t v96 = *MEMORY[0x189604DE8];
  [MEMORY[0x189603F68] dictionaryWithObjects:&result forKeys:v93 count:3];
  querya = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v91 = *MEMORY[0x18960B820];
  v49 = -[NEKeychainItem accessGroup](v28, "accessGroup");
  v92 = v49;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
  v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  OSStatus v51 = SecItemUpdate(querya, v50);
  if (v51)
  {
    ne_log_obj();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v79 = -[NEKeychainItem identifier](v28, "identifier");
      uint64_t v77 = -[NEKeychainItem accessGroup](v28, "accessGroup");
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v77;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v90) = v51;
      v78 = (void *)v77;
      _os_log_error_impl( &dword_1876B1000,  v52,  OS_LOG_TYPE_ERROR,  "%@: SecItemUpdate failed while updating the keychain access group to %@: %d",  buf,  0x1Cu);
    }
  }

  -[NEKeychainItem setAccessGroup:](v28, "setAccessGroup:", 0LL);

LABEL_58:
  objc_storeStrong((id *)&v28->_identifier, v30);
LABEL_59:
  if (v32)
  {
    v42 = (os_log_s *)v28->_persistentReference;
    v28->_persistentReference = v32;
    v32 = v32;
LABEL_61:
  }

  objc_sync_exit(v28);
LABEL_63:
  if (objc_getProperty(v10, v22, 72LL, 1))
  {
    ne_log_obj();
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = objc_getProperty(v10, v67, 72LL, 1);
      [v68 identifier];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v69;
      _os_log_impl(&dword_1876B1000, v66, OS_LOG_TYPE_DEFAULT, "%@: Removing keychain item", buf, 0xCu);
    }

    id v71 = objc_getProperty(v10, v70, 72LL, 1);
    [v71 remove];
  }

  -[NEKeychainItem setData:](v10, "setData:", 0LL);
  objc_setProperty_atomic_copy(v10, v72, 0LL, 72LL);
  objc_sync_exit(v10);
}

- (void)migrateFromPreferences:(__SCPreferences *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = -[NEKeychainItem copyData](self, "copyData");
  if (!v4)
  {
    -[NEKeychainItem identifier](self, "identifier");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = (id)_SCPreferencesSystemKeychainPasswordItemCopy();

    if (v4)
    {
      -[NEKeychainItem identifier](self, "identifier");
      OSStatus v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = _SCPreferencesSystemKeychainPasswordItemRemove();

      if (v7)
      {
        -[NEKeychainItem setData:](self, "setData:", v4);
      }

      else
      {
        ne_log_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          -[NEKeychainItem identifier](self, "identifier");
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          int v10 = SCError();
          int v11 = 138412546;
          __int16 v12 = v9;
          __int16 v13 = 2080;
          uint64_t v14 = SCErrorString(v10);
          _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@: _SCPreferencesSystemKeychainPasswordItemRemove failed: %s",  (uint8_t *)&v11,  0x16u);
        }
      }
    }
  }
}

- (NSData)keyPersistentReference
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setKeyPersistentReference:(id)a3
{
}

- (BOOL)isModernSystem
{
  return self->_isModernSystem;
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)copyDataFromKeychainItem:(void *)a1 outData:(const __CFData *)a2 outIdentifier:(void *)a3 outPersistentReference:(void *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  CFTypeRef result = 0LL;
  [a1 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    goto LABEL_5;
  }

  [a1 persistentReference];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_5:
    if (a2) {
      [v8 addObject:*MEMORY[0x18960BE20]];
    }
    if (a3) {
      [v8 addObject:*MEMORY[0x18960BE18]];
    }
    if (a4) {
      [v8 addObject:*MEMORY[0x18960BE28]];
    }
    int v11 = (void *)[a1 copyQueryWithReturnTypes:v8];
    [v11 setObject:*MEMORY[0x18960BDB0] forKeyedSubscript:*MEMORY[0x18960BDA0]];
    OSStatus v12 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
    OSStatus v13 = v12;
    if (v12)
    {
      if (v12 == -25300)
      {
LABEL_56:
        if (result) {
          CFRelease(result);
        }
        if (v13) {
          BOOL v25 = v13 == -25300;
        }
        else {
          BOOL v25 = 1;
        }
        uint64_t v20 = v25;

        goto LABEL_65;
      }

      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [a1 identifier];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        int v29 = v15;
        __int16 v30 = 1024;
        OSStatus v31 = v13;
        _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, "%@: SecItemCopyMatching failed: %d", buf, 0x12u);
      }
    }

    else if ([v8 count] == 1)
    {
      if (a2)
      {
        uint64_t v16 = (id)result;
        if (isa_nsdata(v16))
        {
          if (+[NSData isSensitiveDataInstance:](MEMORY[0x189603F48], v16)) {
            __int128 v17 = v16;
          }
          else {
            __int128 v17 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v16);
          }
          *a2 = v17;
        }
      }

      if (a3)
      {
        v21 = (id)result;
        if (isa_nsdictionary(v21))
        {
          [v21 objectForKeyedSubscript:*MEMORY[0x18960BA88]];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      if (!a4) {
        goto LABEL_56;
      }
      uint64_t v14 = (id)result;
    }

    else
    {
      uint64_t v14 = (id)result;
      if (isa_nsdictionary(v14))
      {
        if (a2)
        {
          -[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x18960BE78]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsdata(v18) && [v18 length] && isa_nsdata(v18))
          {
            if (+[NSData isSensitiveDataInstance:](MEMORY[0x189603F48], v18)) {
              __int128 v19 = v18;
            }
            else {
              __int128 v19 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v18);
            }
            *a2 = v19;
          }
        }

        if (a3)
        {
          -[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x18960BA88]);
          objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (a4)
        {
          v24 = -[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x18960BE80]);
        }
      }
    }

    goto LABEL_56;
  }

  uint64_t v20 = 1LL;
LABEL_65:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end