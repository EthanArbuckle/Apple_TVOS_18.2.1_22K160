@interface MSDKeychainManager
+ (id)sharedInstance;
- (BOOL)deleteItemForKey:(id)a3;
- (BOOL)saveItem:(id)a3 forKey:(id)a4;
- (BOOL)saveItem:(id)a3 forKey:(id)a4 withAttributes:(id)a5;
- (MSDKeychainManager)init;
- (NSMutableDictionary)cache;
- (id)createSearchDictionaryForKey:(id)a3;
- (id)getAllItemsForKey:(id)a3 withAttributes:(BOOL)a4;
- (id)getItemForKey:(id)a3;
- (int)updateItemForAttributes:(id)a3 withData:(id)a4;
- (void)setCache:(id)a3;
@end

@implementation MSDKeychainManager

+ (id)sharedInstance
{
  if (qword_100125268 != -1) {
    dispatch_once(&qword_100125268, &stru_1000F9498);
  }
  return (id)qword_100125260;
}

- (MSDKeychainManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDKeychainManager;
  v2 = -[MSDKeychainManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDKeychainManager setCache:](v2, "setCache:", v3);

    v4 = v2;
  }

  return v2;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v8, "createSearchDictionaryForKey:", v7));
  if (![v9 count])
  {
    id v14 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100091724((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_13;
  }

  [v9 setObject:v6 forKey:kSecValueData];
  OSStatus v10 = SecItemAdd((CFDictionaryRef)v9, 0LL);
  if (v10 == -25299)
  {
    [v9 removeObjectForKey:kSecValueData];
    OSStatus v10 = -[MSDKeychainManager updateItemForAttributes:withData:](v8, "updateItemForAttributes:withData:", v9, v6);
  }

  if (v10)
  {
    id v22 = sub_10003A95C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100091788();
    }

LABEL_13:
    BOOL v12 = 0;
    goto LABEL_6;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v8, "cache"));
  [v11 setValue:v6 forKey:v7];

  BOOL v12 = 1;
LABEL_6:

  objc_sync_exit(v8);
  return v12;
}

- (id)getItemForKey:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);

    int v10 = 1;
    goto LABEL_7;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v6, "createSearchDictionaryForKey:", v5));
  if (![v11 count])
  {
    id v15 = sub_10003A95C();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000917E8(v12, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_15;
  }

  [v11 setObject:kCFBooleanTrue forKey:kSecReturnData];
  uint64_t v3 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if ((_DWORD)v3)
  {
    id v23 = sub_10003A95C();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100091818();
    }
LABEL_15:
    int v10 = 4;
    goto LABEL_6;
  }

  uint64_t v3 = (uint64_t)result;
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
  -[os_log_s setValue:forKey:](v12, "setValue:forKey:", v3, v5);
  int v10 = 1;
LABEL_6:

LABEL_7:
  objc_sync_exit(v6);

  if (v10 == 4) {
    v13 = 0LL;
  }
  else {
    v13 = (void *)v3;
  }

  return v13;
}

- (BOOL)deleteItemForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v5, "createSearchDictionaryForKey:", v4));
  if (![v6 count])
  {
    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000917E8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v5, "cache"));
  [v7 removeObjectForKey:v4];

  if (SecItemDelete((CFDictionaryRef)v6))
  {
    id v19 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100091878();
    }
LABEL_9:

    BOOL v8 = 0;
    goto LABEL_4;
  }

  BOOL v8 = 1;
LABEL_4:

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v31 = v9;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v11, "createSearchDictionaryForKey:", v9));
  if (![v12 count])
  {
    id v22 = sub_10003A95C();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100091724((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_18;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v17]);
        [v12 setObject:v18 forKey:v17];
      }

      id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v14);
  }

  [v12 setObject:v8 forKey:kSecValueData];
  OSStatus v19 = SecItemAdd((CFDictionaryRef)v12, 0LL);
  if (v19 == -25299)
  {
    [v12 removeObjectForKey:kSecValueData];
    OSStatus v19 = -[MSDKeychainManager updateItemForAttributes:withData:](v11, "updateItemForAttributes:withData:", v12, v8);
  }

  if (v19)
  {
    id v30 = sub_10003A95C();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100091788();
    }
LABEL_18:

    BOOL v20 = 0;
    goto LABEL_13;
  }

  BOOL v20 = 1;
LABEL_13:

  objc_sync_exit(v11);
  return v20;
}

- (id)getAllItemsForKey:(id)a3 withAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v7, "createSearchDictionaryForKey:", v6));
  if (![v8 count])
  {
    id v11 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000917E8(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_13;
  }

  if (v4) {
    [v8 setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
  }
  [v8 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
  [v8 setObject:kCFBooleanTrue forKey:kSecReturnData];
  if (SecItemCopyMatching((CFDictionaryRef)v8, &result))
  {
    id v20 = sub_10003A95C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000918D8();
    }

LABEL_13:
    id v9 = 0LL;
    goto LABEL_6;
  }

  id v9 = (void *)result;
LABEL_6:

  objc_sync_exit(v7);
  return v9;
}

- (int)updateItemForAttributes:(id)a3 withData:(id)a4
{
  id v5 = (const __CFDictionary *)a3;
  id v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a4,  kSecValueData));
  OSStatus v7 = SecItemUpdate(v5, v6);

  return v7;
}

- (id)createSearchDictionaryForKey:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"com.apple.mobilestoredemo.wifi.key"))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassKey, kSecClass);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecAttrKeyClassSymmetric, kSecAttrKeyClass);
    id v5 = &kSecAttrApplicationLabel;
LABEL_9:
    CFStringRef v6 = *v5;
    id v8 = v4;
    CFStringRef v7 = v3;
    goto LABEL_10;
  }

  if (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"com.apple.mobilestoredemo.keychainItemID"))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v3, kSecAttrService);
    CFStringRef v6 = kSecAttrAccount;
    CFStringRef v7 = @"UDID";
LABEL_5:
    id v8 = v4;
LABEL_10:
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v6);
    goto LABEL_11;
  }

  if ((-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"com.apple.mobilestoredemo.keychainUserCredID") & 1) != 0 || -[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"com.apple.mobilestoredemo.keychainAdminCredID"))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    id v5 = &kSecAttrService;
    goto LABEL_9;
  }

  if (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"com.appl.mobilestoredemo.bluetooth."))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", @"com.apple.bluetooth", kSecAttrAccessGroup);
    CFStringRef v7 = kSecClassGenericPassword;
    id v10 = &kSecClass;
LABEL_16:
    CFStringRef v6 = *v10;
    goto LABEL_5;
  }

  if (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens"))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens",  kSecAttrService);
    CFStringRef v7 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
    id v10 = &kSecAttrAccessible;
    goto LABEL_16;
  }

  id v11 = sub_10003A95C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100091938((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
  }

LABEL_11:
  return v4;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end