@interface AKPushTokenKeychainWrapper
- (AKPushTokenKeychainWrapper)init;
- (id)_descriptor;
- (id)fetchToken;
- (void)updateToken:(id)a3;
@end

@implementation AKPushTokenKeychainWrapper

- (AKPushTokenKeychainWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKPushTokenKeychainWrapper;
  v2 = -[AKPushTokenKeychainWrapper init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___AAFKeychainManager);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;
  }

  return v2;
}

- (id)fetchToken
{
  keychainManager = self->_keychainManager;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushTokenKeychainWrapper _descriptor](self, "_descriptor"));
  id v19 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[AAFKeychainManager keychainItemForDescriptor:error:]( keychainManager,  "keychainItemForDescriptor:error:",  v3,  &v19));
  id v5 = v19;

  uint64_t v7 = _AKLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v9) {
      sub_10012D1E8((uint64_t)v5, v8, v11, v12, v13, v14, v15, v16);
    }
  }

  else if (v9)
  {
    sub_10012D1B4(v8, v10, v11, v12, v13, v14, v15, v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  return v17;
}

- (void)updateToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AAFKeychainItem);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushTokenKeychainWrapper _descriptor](self, "_descriptor"));
  id v7 = [v5 initWithDescriptor:v6 value:v4];

  keychainManager = self->_keychainManager;
  id v20 = 0LL;
  -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v7, &v20);
  id v9 = v20;
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      sub_10012D284((uint64_t)v9, v11, v14, v15, v16, v17, v18, v19);
    }
  }

  else if (v12)
  {
    sub_10012D250(v11, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (id)_descriptor
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AAFKeychainItemDescriptor);
  [v2 setItemClass:1];
  [v2 setItemAccessible:0];
  [v2 setInvisible:2];
  [v2 setSynchronizable:1];
  [v2 setUseDataProtection:2];
  [v2 setService:@"com.apple.authkit.pushToken.svc"];
  [v2 setLabel:@"com.apple.authkit.lastKnownPushToken"];
  return v2;
}

- (void).cxx_destruct
{
}

@end