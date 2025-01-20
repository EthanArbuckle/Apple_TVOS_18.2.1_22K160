@interface KeychainWrapper
- (KeychainWrapper)init;
- (NSMutableDictionary)genericPasswordQuery;
- (NSMutableDictionary)keychainData;
- (NSString)personId;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)myObjectForKey:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (void)mySetObject:(id)a3 forKey:(id)a4;
- (void)resetKeychainItem;
- (void)setGenericPasswordQuery:(id)a3;
- (void)setKeychainData:(id)a3;
- (void)setPersonId:(id)a3;
- (void)writeToKeychain;
@end

@implementation KeychainWrapper

- (KeychainWrapper)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___KeychainWrapper;
  v2 = -[KeychainWrapper init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    genericPasswordQuery = v2->genericPasswordQuery;
    v2->genericPasswordQuery = v3;

    -[NSMutableDictionary setObject:forKey:]( v2->genericPasswordQuery,  "setObject:forKey:",  kSecClassGenericPassword,  kSecClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  "com.apple.podcasts.accountId",  28LL));
    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", v5, kSecAttrGeneric);
    -[NSMutableDictionary setObject:forKey:]( v2->genericPasswordQuery,  "setObject:forKey:",  kSecMatchLimitOne,  kSecMatchLimit);
    -[NSMutableDictionary setObject:forKey:]( v2->genericPasswordQuery,  "setObject:forKey:",  kCFBooleanTrue,  kSecAttrSynchronizable);
    -[NSMutableDictionary setObject:forKey:]( v2->genericPasswordQuery,  "setObject:forKey:",  kCFBooleanTrue,  kSecReturnAttributes);
    CFTypeRef result = 0LL;
    OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v2->genericPasswordQuery, &result);
    if (v6 == -25300)
    {
      -[KeychainWrapper resetKeychainItem](v2, "resetKeychainItem");
    }

    else if (!v6)
    {
      v7 = (void *)result;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper secItemFormatToDictionary:](v2, "secItemFormatToDictionary:", result));
      -[KeychainWrapper setKeychainData:](v2, "setKeychainData:", v8);

LABEL_8:
      return v2;
    }

    if (result) {
      CFRelease(result);
    }
    goto LABEL_8;
  }

  return v2;
}

- (void)mySetObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->keychainData, "objectForKey:", v6));
    if (([v7 isEqual:v8] & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", v8, v6);
      -[KeychainWrapper writeToKeychain](self, "writeToKeychain");
    }
  }
}

- (id)myObjectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->keychainData, "objectForKey:", a3);
}

- (void)setPersonId:(id)a3
{
  if (a3)
  {
    -[KeychainWrapper mySetObject:forKey:](self, "mySetObject:forKey:");
  }

  else
  {
    -[KeychainWrapper resetKeychainItem](self, "resetKeychainItem");
    -[KeychainWrapper writeToKeychain](self, "writeToKeychain");
  }

- (NSString)personId
{
  return (NSString *)-[KeychainWrapper myObjectForKey:](self, "myObjectForKey:", kSecValueData);
}

- (void)resetKeychainItem
{
  if (self->keychainData)
  {
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:"));
    uint64_t v4 = SecItemDelete(v3);
    int v5 = v4;
    uint64_t v6 = _MTLogCategoryCloudSync(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "problem deleting current keychain item (%li).",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[KeychainWrapper setKeychainData:](self, "setKeychainData:", v3);
  }

  -[NSMutableDictionary setObject:forKey:]( self->keychainData,  "setObject:forKey:",  @"Podcasts Account Identity",  kSecAttrLabel);
  -[NSMutableDictionary setObject:forKey:]( self->keychainData,  "setObject:forKey:",  @"Podcasts Account Identity",  kSecAttrDescription);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", @"accountId", kSecAttrAccount);
  -[NSMutableDictionary setObject:forKey:]( self->keychainData,  "setObject:forKey:",  @"com.apple.podcasts",  kSecAttrService);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", &stru_100248948, kSecValueData);
  -[NSMutableDictionary setObject:forKey:]( self->keychainData,  "setObject:forKey:",  kCFBooleanTrue,  kSecAttrSynchronizable);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", kCFBooleanTrue, kSecAttrIsInvisible);
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  "com.apple.podcasts.accountId",  28LL));
  [v4 setObject:v5 forKey:kSecAttrGeneric];
  [v4 setObject:kSecClassGenericPassword forKey:kSecClass];
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);

  v7 = &stru_100248948;
  if (v6) {
    v7 = v6;
  }
  int v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v8, "dataUsingEncoding:", 4LL));
  [v4 setObject:v9 forKey:kSecValueData];

  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [v3 setObject:kSecClassGenericPassword forKey:kSecClass];
  CFTypeRef result = 0LL;
  if (SecItemCopyMatching((CFDictionaryRef)v3, &result))
  {
    if (result) {
      CFRelease(result);
    }
  }

  else
  {
    [v3 removeObjectForKey:kSecReturnData];
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
    int v5 = (id) result;
    id v6 = [v5 bytes];
    v7 = -[NSString initWithBytes:length:encoding:]( v4,  "initWithBytes:length:encoding:",  v6,  [(id)result length],  4);

    [v3 setObject:v7 forKey:kSecValueData];
  }

  return v3;
}

- (void)writeToKeychain
{
  CFTypeRef result = 0LL;
  NSLog(@"genericPasswordQuery: %@", a2, self->genericPasswordQuery);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainData));
  NSLog(@"secItemFormat: %@", v3);

  if (SecItemCopyMatching((CFDictionaryRef)self->genericPasswordQuery, &result))
  {
    uint64_t v4 = SecItemAdd( (CFDictionaryRef)-[KeychainWrapper dictionaryToSecItemFormat:]( self,  "dictionaryToSecItemFormat:",  self->keychainData),  0LL);
    if ((_DWORD)v4)
    {
      uint64_t v5 = _MTLogCategoryDefault(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Couldn't add the Keychain Item.", buf, 2u);
      }
    }

    if (result) {
      CFRelease(result);
    }
  }

  else
  {
    v7 = (void *)result;
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  result));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->genericPasswordQuery, "objectForKey:", kSecClass));
    [v8 setObject:v9 forKey:kSecClass];

    v10 = (void *)objc_claimAutoreleasedReturnValue( -[KeychainWrapper dictionaryToSecItemFormat:]( self,  "dictionaryToSecItemFormat:",  self->keychainData));
    [v10 removeObjectForKey:kSecClass];
    uint64_t v11 = SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)v10);
    if ((_DWORD)v11)
    {
      uint64_t v12 = _MTLogCategoryDefault(v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't update the Keychain Item.", v15, 2u);
      }
    }
  }

- (NSMutableDictionary)keychainData
{
  return self->keychainData;
}

- (void)setKeychainData:(id)a3
{
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end