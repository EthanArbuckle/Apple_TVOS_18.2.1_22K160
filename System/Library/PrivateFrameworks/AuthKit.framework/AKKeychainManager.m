@interface AKKeychainManager
+ (id)sharedManager;
- (AKKeychainManager)init;
- (BOOL)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5;
- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5;
- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4;
- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4;
- (void)addKeychainItem:(id)a3 completion:(id)a4;
- (void)addOrUpdateKeychainItem:(id)a3 completion:(id)a4;
- (void)deleteKeychainItemWithDescriptor:(id)a3 completion:(id)a4;
- (void)fetchKeychainItemWithDescriptor:(id)a3 completion:(id)a4;
- (void)fetchKeychainItemsWithDescriptor:(id)a3 completion:(id)a4;
- (void)updateKeychainItem:(id)a3 completion:(id)a4;
@end

@implementation AKKeychainManager

- (AKKeychainManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKKeychainManager;
  v2 = -[AKKeychainManager init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.authkit.keychain", 0LL);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_10020F598 != -1) {
    dispatch_once(&qword_10020F598, &stru_1001CA4F0);
  }
  return (id)qword_10020F590;
}

- (void)addKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099A88;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)addOrUpdateKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099B9C;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)updateKeychainItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099CB0;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)fetchKeychainItemWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099DD8;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)fetchKeychainItemsWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099EF0;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (void)deleteKeychainItemWithDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A008;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(keychainQueue, block);
}

- (BOOL)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v8 itemAttributes]);
  OSStatus v10 = SecItemAdd(v9, 0LL);
  if (v10 != -25299 || !v6)
  {
    unsigned __int8 v13 = v10 == 0;
    if (a5 && v10)
    {
      unsigned __int8 v13 = 0;
      *a5 = (id)SecCopyLastError();
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptor]);
    unsigned __int8 v13 = -[AKKeychainManager _unsafe_updateKeychainItemWithDescriptor:newItem:error:]( self,  "_unsafe_updateKeychainItemWithDescriptor:newItem:error:",  v12,  v8,  a5);
  }

  return v13;
}

- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 attributes]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 itemAttributes]);

  id v10 = [v9 mutableCopy];
  [v10 removeObjectForKey:kSecClass];
  id v13 = 0LL;
  char v11 = SecItemUpdateWithError(v8, v10, &v13);
  if (a5) {
    *a5 = v13;
  }

  return v11;
}

- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
  id v7 = [v6 mutableCopy];

  [v7 setObject:&__kCFBooleanTrue forKey:kSecReturnAttributes];
  [v7 setObject:&__kCFBooleanTrue forKey:kSecReturnData];
  [v7 setObject:kSecMatchLimitOne forKey:kSecMatchLimit];
  CFTypeRef result = 0LL;
  uint64_t v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (a4) {
    *a4 = (id)SecCopyLastError(v8);
  }
  if (result && (CFTypeID v9 = CFGetTypeID(result), v9 == CFDictionaryGetTypeID()))
  {
    id v10 = (void *)result;
    char v11 = -[AKKeychainItem initWithAttributes:](objc_alloc(&OBJC_CLASS___AKKeychainItem), "initWithAttributes:", result);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKKeychainItem descriptor](v11, "descriptor"));
    id v13 = [v12 itemClass];

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKKeychainItem descriptor](v11, "descriptor"));
      objc_msgSend(v14, "setItemClass:", objc_msgSend(v5, "itemClass"));
    }
  }

  else
  {
    char v11 = 0LL;
  }

  return v11;
}

- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4
{
  id v26 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v26 attributes]);
  id v6 = [v5 mutableCopy];

  [v6 setObject:&__kCFBooleanTrue forKey:kSecReturnAttributes];
  [v6 setObject:&__kCFBooleanTrue forKey:kSecReturnData];
  [v6 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
  CFTypeRef result = 0LL;
  uint64_t v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (a4) {
    *a4 = (id)SecCopyLastError(v7);
  }
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (result)
  {
    CFTypeID v9 = CFGetTypeID(result);
    if (v9 == CFArrayGetTypeID())
    {
      id v25 = v6;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v10 = (id)result;
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v11)
      {
        id v13 = v11;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            {
              id v18 = v16;
              v19 = -[AKKeychainItem initWithAttributes:]( objc_alloc(&OBJC_CLASS___AKKeychainItem),  "initWithAttributes:",  v18);

              v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKKeychainItem descriptor](v19, "descriptor"));
              id v21 = [v20 itemClass];

              if (!v21)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKKeychainItem descriptor](v19, "descriptor"));
                objc_msgSend(v22, "setItemClass:", objc_msgSend(v26, "itemClass"));
              }

              -[NSMutableArray addObject:](v8, "addObject:", v19, v25);
            }
          }

          id v13 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v13);
      }

      id v6 = v25;
    }
  }

  id v23 = -[NSMutableArray copy](v8, "copy", v25);

  return v23;
}

- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([a3 attributes]);
  uint64_t v6 = SecItemDelete(v5);
  int v7 = v6;
  if (a4) {
    *a4 = (id)SecCopyLastError(v6);
  }

  return v7 == 0;
}

- (void).cxx_destruct
{
}

@end