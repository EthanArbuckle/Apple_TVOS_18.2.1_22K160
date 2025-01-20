@interface APSKeychainTopicSaltStore
- (APSEnvironment)environment;
- (APSKeychainTopicSaltStore)initWithEnvironment:(id)a3 multiUserMode:(id)a4;
- (APSMultiUserMode)multiUser;
- (BOOL)_saveIdentifiersToSalts:(id)a3 toKeychainForUser:(id)a4;
- (BOOL)_saveKeychainData:(id)a3 forUser:(id)a4;
- (BOOL)_useSystemSaltStoreForUser:(id)a3;
- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5;
- (NSMutableDictionary)identifiersToSaltsSystem;
- (NSMutableDictionary)identifiersToSaltsUser;
- (id)_deserializeKeychainData:(id)a3;
- (id)_keychainService;
- (id)_loadIdentifiersToSaltsFromKeychainForUser:(id)a3;
- (id)_loadKeychainDataForUser:(id)a3;
- (id)_saltStoreForUser:(id)a3;
- (id)_serializeKeychainDict:(id)a3;
- (id)loadIdentifiersToSaltsForUser:(id)a3;
- (id)loadSaltForIdentifier:(id)a3 user:(id)a4;
- (void)_setSaltStore:(id)a3 forUser:(id)a4;
- (void)setEnvironment:(id)a3;
- (void)setIdentifiersToSaltsSystem:(id)a3;
- (void)setIdentifiersToSaltsUser:(id)a3;
- (void)setMultiUser:(id)a3;
@end

@implementation APSKeychainTopicSaltStore

- (APSKeychainTopicSaltStore)initWithEnvironment:(id)a3 multiUserMode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___APSKeychainTopicSaltStore;
  v9 = -[APSKeychainTopicSaltStore init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong((id *)&v10->_multiUser, a4);
  }

  return v10;
}

- (id)loadSaltForIdentifier:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _saltStoreForUser:](self, "_saltStoreForUser:", v7));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[APSKeychainTopicSaltStore _loadIdentifiersToSaltsFromKeychainForUser:]( self,  "_loadIdentifiersToSaltsFromKeychainForUser:",  v7));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  if (v9)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ loadSaltForIdentifier found salt %@ %@",  (uint8_t *)&v12,  0x20u);
    }
  }

  return v9;
}

- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _saltStoreForUser:](self, "_saltStoreForUser:", v10));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSKeychainTopicSaltStore _loadIdentifiersToSaltsFromKeychainForUser:]( self,  "_loadIdentifiersToSaltsFromKeychainForUser:",  v10));
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
  id v13 = (void *)v12;
  if (v8 || !v12) && ([v8 isEqualToData:v12])
  {
    BOOL v14 = 1;
  }

  else
  {
    [v11 setObject:v8 forKeyedSubscript:v9];
    BOOL v14 = -[APSKeychainTopicSaltStore _saveIdentifiersToSalts:toKeychainForUser:]( self,  "_saveIdentifiersToSalts:toKeychainForUser:",  v11,  v10);
    if (v14)
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ saveSalt success %@ %@",  (uint8_t *)&v17,  0x20u);
      }
    }

    else
    {
      [v11 setObject:v13 forKeyedSubscript:v9];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412802;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ saveSalt failed %@ %@",  (uint8_t *)&v17,  0x20u);
      }
    }
  }

  return v14;
}

- (id)loadIdentifiersToSaltsForUser:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _saltStoreForUser:](self, "_saltStoreForUser:", v4));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[APSKeychainTopicSaltStore _loadIdentifiersToSaltsFromKeychainForUser:]( self,  "_loadIdentifiersToSaltsFromKeychainForUser:",  v4));
  }

  return v5;
}

- (BOOL)_useSystemSaltStoreForUser:(id)a3
{
  unsigned int v4 = [a3 isDefaultUser];
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore multiUser](self, "multiUser"));
    unsigned __int8 v6 = [v5 isMultiUser];

    LOBYTE(v4) = v6;
  }

  return v4;
}

- (id)_saltStoreForUser:(id)a3
{
  if (-[APSKeychainTopicSaltStore _useSystemSaltStoreForUser:](self, "_useSystemSaltStoreForUser:", a3)) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore identifiersToSaltsSystem](self, "identifiersToSaltsSystem"));
  }
  else {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore identifiersToSaltsUser](self, "identifiersToSaltsUser"));
  }
  return v4;
}

- (void)_setSaltStore:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  if (-[APSKeychainTopicSaltStore _useSystemSaltStoreForUser:](self, "_useSystemSaltStoreForUser:", a4)) {
    -[APSKeychainTopicSaltStore setIdentifiersToSaltsSystem:](self, "setIdentifiersToSaltsSystem:", v6);
  }
  else {
    -[APSKeychainTopicSaltStore setIdentifiersToSaltsUser:](self, "setIdentifiersToSaltsUser:", v6);
  }
}

- (id)_loadIdentifiersToSaltsFromKeychainForUser:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _loadKeychainDataForUser:](self, "_loadKeychainDataForUser:", v4));
  if (v5
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _loadKeychainDataForUser:](self, "_loadKeychainDataForUser:", v4))) != 0LL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _deserializeKeychainData:](self, "_deserializeKeychainData:", v5));
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v9 = v8;
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ Loaded salt store from keychain %@",  (uint8_t *)&v12,  0x16u);
  }

  -[APSKeychainTopicSaltStore _setSaltStore:forUser:](self, "_setSaltStore:forUser:", v9, v4);
  return v9;
}

- (BOOL)_saveIdentifiersToSalts:(id)a3 toKeychainForUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[APSKeychainTopicSaltStore _setSaltStore:forUser:](self, "_setSaltStore:forUser:", v6, v7);
  if ([v6 count]) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _serializeKeychainDict:](self, "_serializeKeychainDict:", v6));
  }
  else {
    id v8 = 0LL;
  }
  BOOL v9 = -[APSKeychainTopicSaltStore _saveKeychainData:forUser:](self, "_saveKeychainData:forUser:", v8, v7);

  return v9;
}

- (id)_deserializeKeychainData:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_deserializeKeychainData %@", buf, 0xCu);
  }

  id v32 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  &v32));
  id v7 = v32;
  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000BCC64();
    }
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000BCC04();
    }
LABEL_25:

    id v22 = 0LL;
    goto LABEL_26;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v5;
  id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v28,  v37,  16LL);
  if (!v11) {
    goto LABEL_17;
  }
  id v13 = v11;
  uint64_t v14 = *(void *)v29;
  id v26 = v7;
  id v27 = v3;
  while (2)
  {
    id v15 = 0LL;
    do
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v15);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v12);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_FAULT))
        {
          id v3 = v27;
          sub_1000BCBA4();
LABEL_24:
          id v7 = v26;

          goto LABEL_25;
        }

- (id)_serializeKeychainDict:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_serializeKeychainDict %@", buf, 0xCu);
  }

  id v9 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  &v9));
  id v6 = v9;
  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000BCCC4();
    }
  }

  return v5;
}

- (id)_keychainService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore environment](self, "environment"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 domain]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  @",TopicSalt.v1"));

  return v4;
}

- (id)_loadKeychainDataForUser:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v12 = 138412290;
    *(void *)&v12[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ _loadSaltStoreKeychainData", v12, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _keychainService](self, "_keychainService"));
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if (-[APSKeychainTopicSaltStore _useSystemSaltStoreForUser:](self, "_useSystemSaltStoreForUser:", v4)) {
    CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
  }
  CFDictionaryAddValue(Mutable, kSecAttrService, v6);
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  *(void *)uint64_t v12 = 0LL;
  OSStatus v8 = SecItemCopyMatching(Mutable, (CFTypeRef *)v12);
  if (v8 != -25300 && v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000BCD24();
    }
  }

  CFRelease(Mutable);
  id v10 = *(void **)v12;

  return v10;
}

- (BOOL)_saveKeychainData:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ _saveSaltStoreKeychainData %@",  (uint8_t *)&v17,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSKeychainTopicSaltStore _keychainService](self, "_keychainService"));
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if (-[APSKeychainTopicSaltStore _useSystemSaltStoreForUser:](self, "_useSystemSaltStoreForUser:", v7)) {
    CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
  }
  CFDictionaryAddValue(Mutable, kSecAttrService, v9);
  if (!v6)
  {
    if (SecItemDelete(Mutable))
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000BCD84();
      }
      goto LABEL_16;
    }

- (APSMultiUserMode)multiUser
{
  return self->_multiUser;
}

- (void)setMultiUser:(id)a3
{
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)identifiersToSaltsUser
{
  return self->_identifiersToSaltsUser;
}

- (void)setIdentifiersToSaltsUser:(id)a3
{
}

- (NSMutableDictionary)identifiersToSaltsSystem
{
  return self->_identifiersToSaltsSystem;
}

- (void)setIdentifiersToSaltsSystem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end