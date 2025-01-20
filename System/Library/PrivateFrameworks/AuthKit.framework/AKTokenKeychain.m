@interface AKTokenKeychain
- (AAFKeychainManager)keychainManager;
- (AKTokenKeychain)init;
- (BOOL)clearAllTokensForAltDSID:(id)a3 error:(id *)a4;
- (BOOL)deleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)updateWithContext:(id)a3 error:(id *)a4;
- (id)_tokenKeychainDescriptorForContext:(id)a3;
- (id)_tokenKeychainDescriptorWithIdentifier:(id)a3 altDSID:(id)a4;
- (id)fetchWithContext:(id)a3 error:(id *)a4;
- (void)setKeychainManager:(id)a3;
@end

@implementation AKTokenKeychain

- (AKTokenKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKTokenKeychain;
  v2 = -[AKTokenKeychain init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___AAFKeychainManager);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;
  }

  return v2;
}

- (id)fetchWithContext:(id)a3 error:(id *)a4
{
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKTokenKeychain _tokenKeychainDescriptorForContext:](self, "_tokenKeychainDescriptorForContext:", a3));
  keychainManager = self->_keychainManager;
  id v23 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[AAFKeychainManager keychainItemForDescriptor:error:]( keychainManager,  "keychainItemForDescriptor:error:",  v6,  &v23));
  id v9 = v23;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
  if ([v9 code] == (id)-25300
    && (v12 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]),
        unsigned __int8 v13 = [v12 isEqualToString:NSOSStatusErrorDomain],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = 0LL;
  }

  else
  {
    id v22 = 0LL;
    id v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___AKToken, v11),  v10,  &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = v22;
    v18 = v17;
    if (v10)
    {
      id v14 = v16;
    }

    else
    {
      uint64_t v19 = _AKLogSystem(v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10013006C();
      }

      id v14 = 0LL;
      if (a4) {
        *a4 = v18;
      }
    }
  }

  return v14;
}

- (BOOL)updateWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
  id v23 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v23));
  id v9 = v23;

  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenKeychain _tokenKeychainDescriptorForContext:]( self,  "_tokenKeychainDescriptorForContext:",  v6));
    id v12 = [[AAFKeychainItem alloc] initWithDescriptor:v11 value:v8];
    keychainManager = self->_keychainManager;
    id v22 = 0LL;
    -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v12, &v22);
    id v14 = v22;
    id v15 = v14;
    BOOL v16 = v14 == 0LL;
    if (v14)
    {
      uint64_t v17 = _AKLogSystem(v14);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10013012C();
      }

      if (a4) {
        *a4 = v15;
      }
    }
  }

  else
  {
    uint64_t v19 = _AKLogSystem(v10);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1001300CC();
    }

    BOOL v16 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v16;
}

- (BOOL)deleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKTokenKeychain _tokenKeychainDescriptorForContext:](self, "_tokenKeychainDescriptorForContext:", a3));
  id v7 = -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( self->_keychainManager,  "deleteKeychainItemsForDescriptor:error:",  v6,  a4);
  if (a4)
  {
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10013018C((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return a4 == 0LL;
}

- (BOOL)clearAllTokensForAltDSID:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenKeychain _tokenKeychainDescriptorWithIdentifier:altDSID:]( self,  "_tokenKeychainDescriptorWithIdentifier:altDSID:",  0LL,  a3));
  id v7 = -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( self->_keychainManager,  "deleteKeychainItemsForDescriptor:error:",  v6,  a4);
  if (a4)
  {
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1001301F4((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return a4 == 0LL;
}

- (id)_tokenKeychainDescriptorForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tokenIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenKeychain _tokenKeychainDescriptorWithIdentifier:altDSID:]( self,  "_tokenKeychainDescriptorWithIdentifier:altDSID:",  v5,  v6));
  return v7;
}

- (id)_tokenKeychainDescriptorWithIdentifier:(id)a3 altDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AAFKeychainItemDescriptor);
  [v7 setItemClass:1];
  [v7 setItemAccessible:2];
  [v7 setInvisible:2];
  [v7 setSynchronizable:1];
  [v7 setUseDataProtection:2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.authkit.tokenManager",  v5));
  [v7 setService:v8];
  [v7 setAccount:v6];

  [v7 setLabel:v5];
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10013025C();
  }

  return v7;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end