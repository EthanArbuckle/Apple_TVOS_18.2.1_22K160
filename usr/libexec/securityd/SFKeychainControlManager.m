@interface SFKeychainControlManager
+ (id)sharedManager;
- (BOOL)deleteCorruptedItemsWithError:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (id)findCorruptedItemsWithError:(id *)a3;
- (id)xpcControlEndpoint;
- (void)rpcDeleteCorruptedItemsWithReply:(id)a3;
- (void)rpcFindCorruptedItemsWithReply:(id)a3;
@end

@implementation SFKeychainControlManager

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SFKeychainControlManager;
  v2 = -[SFKeychainControlManager init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (id)xpcControlEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](self->_listener, "endpoint"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _endpoint]);

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.keychain.keychaincontrol"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if (objc_opt_isKindOfClass(v6, v8) & 1) != 0 && ([v6 BOOLValue])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorClasses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFKeychainControl));
    BOOL v11 = 1;
    [v10 setClasses:v9 forSelector:"rpcFindCorruptedItemsWithReply:" argumentIndex:1 ofReply:1];
    [v10 setClasses:v9 forSelector:"rpcDeleteCorruptedItemsWithReply:" argumentIndex:1 ofReply:1];
    [v5 setExportedInterface:v10];
    [v5 setExportedObject:self];
    [v5 resume];
  }

  else
  {
    v12 = sub_10001267C("SecError");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109378;
      v15[1] = [v5 processIdentifier];
      __int16 v16 = 2112;
      v17 = @"com.apple.private.keychain.keychaincontrol";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SFKeychainControl: Client pid (%d) doesn't have entitlement: %@",  (uint8_t *)v15,  0x12u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (id)findCorruptedItemsWithError:(id *)a3
{
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  CFTypeRef result = 0LL;
  v44[0] = kSecClass;
  v44[1] = kSecReturnPersistentRef;
  v45[0] = kSecClassGenericPassword;
  v45[1] = &__kCFBooleanTrue;
  v44[2] = kSecUseDataProtectionKeychain;
  v44[3] = kSecMatchLimit;
  v45[2] = &__kCFBooleanTrue;
  v45[3] = kSecMatchLimitAll;
  v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  4LL));
  OSStatus v4 = SecItemCopyMatching(v24, &result);
  v34 = 0LL;
  if (v4 != -25300)
  {
    sub_1000194E0(v4, &v34, @"generic password query failed");
    id v5 = v34;
    if (v34)
    {
      -[NSMutableArray addObject:](v3, "addObject:", v34);
    }
  }

  CFTypeRef v33 = 0LL;
  v42[0] = kSecClass;
  v42[1] = kSecReturnPersistentRef;
  v43[0] = kSecClassInternetPassword;
  v43[1] = &__kCFBooleanTrue;
  v42[2] = kSecUseDataProtectionKeychain;
  v42[3] = kSecMatchLimit;
  v43[2] = &__kCFBooleanTrue;
  v43[3] = kSecMatchLimitAll;
  v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  4LL));
  OSStatus v6 = SecItemCopyMatching(v23, &v33);
  v32 = 0LL;
  if (v6 != -25300)
  {
    sub_1000194E0(v6, &v32, @"internet password query failed");
    uint64_t v7 = v32;
    if (v32)
    {
      -[NSMutableArray addObject:](v3, "addObject:", v32);
    }
  }

  CFTypeRef v31 = 0LL;
  v40[0] = kSecClass;
  v40[1] = kSecReturnPersistentRef;
  v41[0] = kSecClassKey;
  v41[1] = &__kCFBooleanTrue;
  v40[2] = kSecUseDataProtectionKeychain;
  v40[3] = kSecMatchLimit;
  v41[2] = &__kCFBooleanTrue;
  v41[3] = kSecMatchLimitAll;
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  4LL));
  SecItemCopyMatching(v21, &v31);
  CFTypeRef v30 = 0LL;
  v38[0] = kSecClass;
  v38[1] = kSecReturnPersistentRef;
  v39[0] = kSecClassCertificate;
  v39[1] = &__kCFBooleanTrue;
  v38[2] = kSecUseDataProtectionKeychain;
  v38[3] = kSecMatchLimit;
  v39[2] = &__kCFBooleanTrue;
  v39[3] = kSecMatchLimitAll;
  uint64_t v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL));
  OSStatus v9 = SecItemCopyMatching(v8, &v30);
  OSStatus v10 = v9;
  v29 = 0LL;
  if (v9 != -25300)
  {
    sub_1000194E0(v9, &v29, @"certificate query failed");
    BOOL v11 = v29;
    if (v29)
    {
      -[NSMutableArray addObject:](v3, "addObject:", v29);
    }
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10005EABC;
  v26[3] = &unk_100284238;
  OSStatus v28 = v10;
  v12 = v22;
  v27 = v12;
  v13 = objc_retainBlock(v26);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, result, kSecClassGenericPassword);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v33, kSecClassInternetPassword);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v31, kSecClassKey);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v30, kSecClassCertificate);
  id v14 = -[NSMutableArray count](v3, "count");
  if (a3 && v14)
  {
    v36[0] = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"encountered %d errors searching for corrupted items",  -[NSMutableArray count](v3, "count")));
    v37[0] = v15;
    v36[1] = NSUnderlyingErrorKey;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v3, "firstObject"));
    v37[1] = v16;
    v36[2] = @"searchingErrorCount";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v3, "count")));
    v37[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.keychainhealth",  1LL,  v18));
  }

  v19 = v12;

  return v19;
}

- (BOOL)deleteCorruptedItemsWithError:(id *)a3
{
  id v25 = 0LL;
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFKeychainControlManager findCorruptedItemsWithError:](self, "findCorruptedItemsWithError:", &v25));
  id v5 = v25;
  BOOL v6 = v5 == 0LL;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        OSStatus v13 = SecItemDelete(*(CFDictionaryRef *)(*((void *)&v21 + 1) + 8LL * (void)i));
        if (v13)
        {
          v20 = 0LL;
          sub_1000194E0(v13, &v20, @"failed to delete corrupted item");
          id v14 = v20;
          -[NSMutableArray addObject:](v7, "addObject:", v20);

          BOOL v6 = 0;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }

    while (v10);
  }

  if (a3 && (v5 || -[NSMutableArray count](v7, "count")))
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"searchingErrorCount"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"encountered %@ errors searching for corrupted items and %d errors attempting to delete corrupted items",  v16,  -[NSMutableArray count](v7, "count")));
    v27 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.keychainhealth",  2LL,  v18));
  }

  return v6;
}

- (void)rpcFindCorruptedItemsWithReply:(id)a3
{
  id v7 = 0LL;
  OSStatus v4 = (void (**)(id, void *, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFKeychainControlManager findCorruptedItemsWithError:](self, "findCorruptedItemsWithError:", &v7));
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)rpcDeleteCorruptedItemsWithReply:(id)a3
{
  id v7 = 0LL;
  OSStatus v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = -[SFKeychainControlManager deleteCorruptedItemsWithError:](self, "deleteCorruptedItemsWithError:", &v7);
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_1002DE8C0 != -1) {
    dispatch_once(&qword_1002DE8C0, &stru_100284210);
  }
  return (id)qword_1002DE8B8;
}

@end