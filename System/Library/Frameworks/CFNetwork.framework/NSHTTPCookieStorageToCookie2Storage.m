@interface NSHTTPCookieStorageToCookie2Storage
- (NSHTTPCookie)_newCookieToNSCookie:(uint64_t)a1;
- (NSHTTPCookieStorageToCookie2Storage)init;
- (NSMutableHTTPCookie2)_nsToNewCookie:(NSMutableHTTPCookie2 *)a1;
- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4;
- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4;
- (id)cookies;
- (id)cookiesForURL:(id)a3;
- (unint64_t)cookieAcceptPolicy;
- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7;
- (void)_saveCookies;
- (void)_saveCookies:(id)a3;
- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6;
- (void)_setPrivateBrowsingEnabled:(BOOL)a3;
- (void)_testingOfStoringOfCookie:(id)a3;
- (void)dealloc;
- (void)deleteCookie:(id)a3;
- (void)getCookiesForTask:(id)a3 completionHandler:(id)a4;
- (void)initMemoryCookieStore;
- (void)initWithIdentifyingData:(void *)a1;
- (void)initWithPath:(void *)a1;
- (void)registerForPostingNotifications;
- (void)removeCookiesSinceDate:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookieAcceptPolicy:(unint64_t)a3;
- (void)setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5;
- (void)storeCookies:(id)a3 forTask:(id)a4;
@end

@implementation NSHTTPCookieStorageToCookie2Storage

- (NSHTTPCookieStorageToCookie2Storage)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
  v2 = -[NSHTTPCookieStorage init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = +[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage](&OBJC_CLASS___NSHTTPCookie2Storage, "sharedNSHTTPCookie2Storage");
    store = v2->_store;
    v2->_store = (NSHTTPCookie2Storage *)v3;

    v2->_acceptPolicy = 2LL;
    v2->_behavesLikeNS = 1;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v2);
  }

  return v2;
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
  v4 = -[NSHTTPCookieStorage init](&v8, sel_init, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_acceptPolicy = 2LL;
    +[NSHTTPCookieStorage sharedHTTPCookieStorage]( &OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage,  "sharedHTTPCookieStorage");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v6 = 0LL;
  }

  return v6;
}

- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_acceptPolicy = 2LL;
  v4 = +[NSHTTPCookieStorage sharedHTTPCookieStorage]( &OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage,  "sharedHTTPCookieStorage",  a3);
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18298D000, v3, OS_LOG_TYPE_DEFAULT, "Do nothing", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
  -[NSHTTPCookieStorage dealloc](&v4, sel_dealloc);
}

- (void)setCookie:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  store = self->_store;
  v7 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke;
  v10[3] = &unk_189C1A270;
  id v8 = v4;
  id v11 = v8;
  v9 = v5;
  v12 = v9;
  -[NSHTTPCookie2Storage setCookie:withFilter:completionHandler:]( store,  "setCookie:withFilter:completionHandler:",  v7,  0LL,  v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5
{
}

- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v27 = a4;
  id v11 = a5;
  id v12 = a6;
  v26 = v11;
  v13 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2StorageFilter);
  -[NSHTTPCookie2StorageFilter setMainDocumentURL:](v13, "setMainDocumentURL:", v11);
  -[NSHTTPCookie2StorageFilter setUrl:](v13, "setUrl:", v27);
  -[NSHTTPCookie2StorageFilter setAcceptPolicy:]( v13,  "setAcceptPolicy:",  -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  if (v12)
  {
    [v12 objectForKeyedSubscript:@"HTTPCookiePolicyPropertyCookieAcceptPolicy"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      [v12 objectForKeyedSubscript:@"HTTPCookiePolicyPropertyCookieAcceptPolicy"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v13, "setAcceptPolicy:", (int)[v16 intValue]);
    }
  }

  id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]( (NSMutableHTTPCookie2 *)self,  *(void **)(*((void *)&v31 + 1) + 8 * v21));
        [v17 addObject:v22];

        ++v21;
      }

      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v19);
  }

  store = self->_store;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke;
  v28[3] = &unk_189C1A270;
  id v24 = v17;
  id v29 = v24;
  v25 = v14;
  v30 = v25;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:]( store,  "setCookies:withFilter:completionHandler:",  v24,  v13,  v28);
  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_testingOfStoringOfCookie:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_semaphore_t v5 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2StorageFilter);
  objc_super v6 = (void *)MEMORY[0x189604030];
  v7 = (void *)NSString;
  [v4 domain];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"http://%@%@", v8, v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLWithString:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setUrl:](v5, "setUrl:", v11);

  -[NSHTTPCookie2StorageFilter setOverwriteHTTPOnlyCookies:](v5, "setOverwriteHTTPOnlyCookies:", 1LL);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  v13 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v21[0] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
  dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  store = self->_store;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke;
  v18[3] = &unk_189C1A270;
  id v19 = v14;
  v16 = v12;
  uint64_t v20 = v16;
  id v17 = v14;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:]( store,  "setCookies:withFilter:completionHandler:",  v17,  v5,  v18);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)storeCookies:(id)a3 forTask:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2StorageFilter);
  [v7 currentRequest];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 mainDocumentURL];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setMainDocumentURL:](v8, "setMainDocumentURL:", v10);

  [v7 currentRequest];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 URL];
  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2StorageFilter setUrl:](v8, "setUrl:", v12);

  if (self->_behavesLikeNS) {
    unint64_t acceptPolicy = (int)[v7 _cookieAcceptPolicy];
  }
  else {
    unint64_t acceptPolicy = self->_acceptPolicy;
  }
  -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v8, "setAcceptPolicy:", acceptPolicy);
  [v7 currentRequest];
  dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 cookiePartitionIdentifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    [v7 _storagePartitionIdentifier];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSHTTPCookie2StorageFilter setPartition:](v8, "setPartition:", v16);
  if (!v15) {

  }
  -[NSHTTPCookie2StorageFilter setOverwriteHTTPOnlyCookies:](v8, "setOverwriteHTTPOnlyCookies:", 1LL);
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
  id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]( (NSMutableHTTPCookie2 *)self,  *(void **)(*((void *)&v30 + 1) + 8 * i));
        [v18 addObject:v23];
      }

      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v20);
  }

  store = self->_store;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke;
  v27[3] = &unk_189C1A270;
  id v25 = v19;
  id v28 = v25;
  v26 = v17;
  id v29 = v26;
  -[NSHTTPCookie2Storage setCookies:withFilter:completionHandler:]( store,  "setCookies:withFilter:completionHandler:",  v18,  v8,  v27);
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_saveCookies:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  getCookieLogHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_semaphore_t v5 = 0;
    _os_log_impl(&dword_18298D000, v4, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v5, 2u);
  }

  v3[2](v3);
}

- (void)_saveCookies
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_18298D000, v2, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v3, 2u);
  }
}

- (id)cookies
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  store = self->_store;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke;
  v11[3] = &unk_189C02930;
  id v6 = v3;
  id v12 = v6;
  v13 = self;
  dispatch_semaphore_t v14 = v4;
  id v7 = v4;
  -[NSHTTPCookie2Storage getAllCookiesWithCompletionHandler:](store, "getAllCookiesWithCompletionHandler:", v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v8 = v14;
  id v9 = v6;

  return v9;
}

- (id)cookiesForURL:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2LookupFilter);
  [v5 host];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v6, "setDomain:", v7);

  [v5 scheme];
  dispatch_semaphore_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 caseInsensitiveCompare:@"https"];
  if (v9)
  {
    [v5 scheme];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = [v3 caseInsensitiveCompare:@"wss"] == 0;
  }

  else
  {
    BOOL v10 = 1LL;
  }

  -[NSHTTPCookie2LookupFilter setSecure:](v6, "setSecure:", v10);
  if (v9) {

  }
  [v5 path];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v6, "setPath:", v11);

  -[NSHTTPCookie2LookupFilter setAcceptPolicy:]( v6,  "setAcceptPolicy:",  -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
  store = self->_store;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke;
  v20[3] = &unk_189C02930;
  id v15 = v13;
  id v21 = v15;
  v22 = self;
  v16 = v12;
  v23 = v16;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:]( store,  "getCookiesWithFilter:completionHandler:",  v6,  v20);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v17 = v23;
  id v18 = v15;

  return v18;
}

- (void)getCookiesForTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2LookupFilter);
  [v6 currentRequest];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URL];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 host];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v8, "setDomain:", v11);

  [v6 currentRequest];
  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 URL];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 scheme];
  dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setSecure:]( v8,  "setSecure:",  [v14 caseInsensitiveCompare:@"https"] == 0);

  [v6 currentRequest];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 URL];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 path];
  dispatch_semaphore_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v8, "setPath:", v17);

  [v6 currentRequest];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 cookiePartitionIdentifier];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v19;
  if (!v19)
  {
    [v6 _storagePartitionIdentifier];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSHTTPCookie2LookupFilter setPartition:](v8, "setPartition:", v20);
  if (!v19) {

  }
  [v6 currentRequest];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 URL];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setInURL:](v8, "setInURL:", v22);

  [v6 currentRequest];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 mainDocumentURL];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setMainDocumentURL:](v8, "setMainDocumentURL:", v24);

  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v8, "setAcceptPolicy:", (int)[v6 _cookieAcceptPolicy]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[NSHTTPCookieStorage _overrideSessionCookieAcceptPolicy](self, "_overrideSessionCookieAcceptPolicy"))
  {
    -[NSHTTPCookie2LookupFilter setAcceptPolicy:]( v8,  "setAcceptPolicy:",  -[NSHTTPCookieStorageToCookie2Storage cookieAcceptPolicy](self, "cookieAcceptPolicy"));
  }

  [v6 _siteForCookies];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    [v6 _siteForCookies];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHTTPCookie2LookupFilter setSiteForCookies:](v8, "setSiteForCookies:", v26);

    [v6 currentRequest];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHTTPCookie2LookupFilter setIsSafe:](v8, "setIsSafe:", [v27 _isIdempotent]);

    -[NSHTTPCookie2LookupFilter setIsTopLevelNavigation:]( v8,  "setIsTopLevelNavigation:",  [v6 _isTopLevelNavigation]);
  }

  id v28 = objc_alloc_init(MEMORY[0x189603FA8]);
  store = self->_store;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke;
  v32[3] = &unk_189C02958;
  id v33 = v28;
  __int128 v34 = self;
  id v30 = v7;
  id v35 = v30;
  id v31 = v28;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:]( store,  "getCookiesWithFilter:completionHandler:",  v8,  v32);
}

- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__853;
  id v19 = __Block_byref_object_dispose__854;
  id v20 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke;
  v12[3] = &unk_189C11358;
  dispatch_semaphore_t v13 = v8;
  dispatch_semaphore_t v14 = &v15;
  uint64_t v9 = v8;
  -[NSHTTPCookieStorageToCookie2Storage _getCookiesForURL:mainDocumentURL:partition:completionHandler:]( self,  "_getCookiesForURL:mainDocumentURL:partition:completionHandler:",  v7,  v6,  0LL,  v12);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSHTTPCookie2LookupFilter);
  [v11 host];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v15, "setDomain:", v16);

  -[NSHTTPCookie2LookupFilter setInURL:](v15, "setInURL:", v11);
  -[NSHTTPCookie2LookupFilter setMainDocumentURL:](v15, "setMainDocumentURL:", v12);
  [v11 scheme];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    [v11 scheme];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = [v6 caseInsensitiveCompare:@"https"] == 0;
  }

  else
  {
    BOOL v18 = 0LL;
  }

  -[NSHTTPCookie2LookupFilter setSecure:](v15, "setSecure:", v18);
  if (v17) {

  }
  [v11 path];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v15, "setPath:", v19);

  -[NSHTTPCookie2LookupFilter setPartition:](v15, "setPartition:", v13);
  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v15, "setAcceptPolicy:", self->_acceptPolicy);
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
  store = self->_store;
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke;
  v24[3] = &unk_189C02958;
  v24[4] = self;
  id v22 = v14;
  dispatch_semaphore_t v25 = v20;
  id v26 = v22;
  v23 = v20;
  -[NSHTTPCookie2Storage getCookiesWithFilter:completionHandler:]( store,  "getCookiesWithFilter:completionHandler:",  v15,  v24);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7
{
}

- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke;
  v11[3] = &unk_189C13590;
  dispatch_semaphore_t v12 = v8;
  id v13 = v6;
  uint64_t v9 = v8;
  id v10 = v6;
  -[NSHTTPCookieStorageToCookie2Storage _getCookiesForURL:mainDocumentURL:partition:completionHandler:]( self,  "_getCookiesForURL:mainDocumentURL:partition:completionHandler:",  0LL,  0LL,  v7,  v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)deleteCookie:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  store = self->_store;
  -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke;
  v9[3] = &unk_189C1A548;
  dispatch_semaphore_t v8 = v5;
  id v10 = v8;
  -[NSHTTPCookie2Storage deleteCookie:withCompletionHandler:](store, "deleteCookie:withCompletionHandler:", v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)removeCookiesSinceDate:(id)a3
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  store = self->_store;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke;
  v7[3] = &unk_189C1A548;
  dispatch_semaphore_t v8 = v4;
  id v6 = v4;
  -[NSHTTPCookie2Storage deleteAllCookiesWithCompletionHandler:](store, "deleteAllCookiesWithCompletionHandler:", v7);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setCookieAcceptPolicy:(unint64_t)a3
{
  self->_unint64_t acceptPolicy = a3;
  cookieNotificationQueue();
  dispatch_semaphore_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async(v4, block);
}

- (unint64_t)cookieAcceptPolicy
{
  return self->_acceptPolicy;
}

- (void)_setPrivateBrowsingEnabled:(BOOL)a3
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_semaphore_t v4 = 0;
    _os_log_impl(&dword_18298D000, v3, OS_LOG_TYPE_INFO, "_setPrivateBrowsingEnabled is not implemented", v4, 2u);
  }
}

- (void).cxx_destruct
{
}

void __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 postNotificationName:@"NSHTTPCookieManagerCookiesChangedNotification" object:*(void *)(a1 + 32)];
}

uint64_t __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSMutableHTTPCookie2)_nsToNewCookie:(NSMutableHTTPCookie2 *)a1
{
  id v3 = a2;
  dispatch_semaphore_t v4 = v3;
  if (a1)
  {
    [v3 name];
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      [v4 value];
      a1 = (NSMutableHTTPCookie2 *)objc_claimAutoreleasedReturnValue();
      if (!a1)
      {
LABEL_16:

        goto LABEL_17;
      }

      [v4 domain];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        id v7 = objc_alloc(&OBJC_CLASS___NSMutableHTTPCookie2);
        [v4 name];
        dispatch_semaphore_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 value];
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        [v4 domain];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = -[NSMutableHTTPCookie2 initWithName:value:domain:](v7, "initWithName:value:domain:", v8, v9, v10);

        [v4 path];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setPath:](a1, "setPath:", v11);

        [v4 expiresDate];
        dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setExpirationDate:](a1, "setExpirationDate:", v12);

        [MEMORY[0x189603F50] date];
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = v13;
        if (a1)
        {
          [v13 timeIntervalSince1970];
          a1->super._sCreationDate = vcvtad_u64_f64(v15);
        }

        [v4 domain];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setHostOnly:]( a1,  "setHostOnly:",  [v16 hasPrefix:@"."] ^ 1);

        -[NSMutableHTTPCookie2 setHttpOnly:](a1, "setHttpOnly:", [v4 isHTTPOnly]);
        -[NSMutableHTTPCookie2 setSecure:](a1, "setSecure:", [v4 isSecure]);
        [v4 expiresDate];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setExpirationDate:](a1, "setExpirationDate:", v17);

        [v4 _storagePartition];
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setPartition:](a1, "setPartition:", v18);

        [v4 sameSitePolicy];
        dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          [v4 sameSitePolicy];
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          if ([v9 caseInsensitiveCompare:0x18C5AEB00]) {
            uint64_t v19 = 2 * ([v9 caseInsensitiveCompare:0x18C5AEB70] == 0);
          }
          else {
            uint64_t v19 = 1LL;
          }
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        -[NSMutableHTTPCookie2 setSameSite:](a1, "setSameSite:", v19);
        if (v5) {

        }
        goto LABEL_16;
      }
    }

    a1 = 0LL;
  }

uint64_t __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke( uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:]( *(void *)(a1 + 32),  *(void **)(*((void *)&v10 + 1) + 8 * v8));
        objc_msgSend(v4, "addObject:", v9, (void)v10);

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSHTTPCookie)_newCookieToNSCookie:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
    id v21 = 0LL;
    goto LABEL_22;
  }

  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"Name"];

  [v3 value];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"Value"];

  [v3 expirationDate];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"Expires"];

  [v3 path];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"Path"];

  uint64_t v9 = [v3 sameSite];
  if (v9 == 1)
  {
    __int128 v10 = &_kCFHTTPCookieSameSiteLax;
  }

  else
  {
    if (v9 != 2)
    {
      id v11 = 0LL;
      goto LABEL_8;
    }

    __int128 v10 = &_kCFHTTPCookieSameSiteStrict;
  }

  id v11 = (id)*v10;
LABEL_8:
  [v4 setObject:v11 forKeyedSubscript:@"SameSite"];

  [v3 partition];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 isEqualToString:@"none"];

  if (v13)
  {
    [v4 setObject:0 forKeyedSubscript:0x18C5AE9E8];
  }

  else
  {
    [v3 partition];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKeyedSubscript:0x18C5AE9E8];
  }

  [v3 expirationDate];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v3 expirationDate];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKeyedSubscript:@"Expires"];
  }

  if ([v3 hostOnly]
    && ([v3 domain],
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 hasPrefix:@"."],
        v17,
        v18))
  {
    [v3 domain];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 substringFromIndex:1];
    dispatch_semaphore_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKeyedSubscript:@"Domain"];
  }

  else
  {
    [v3 domain];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:@"Domain"];
  }

  id v21 = -[NSHTTPCookie initWithProperties:](objc_alloc(&OBJC_CLASS___NSHTTPCookie), "initWithProperties:", v4);
LABEL_22:

  return v21;
}

void __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke( void *a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = (void *)a1[4];
        uint64_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:]( a1[5],  *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:]( *(void *)(a1 + 40),  *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:]( *(void *)(a1 + 40),  *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  getCookieLogHandle();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_18298D000, v2, OS_LOG_TYPE_DEBUG, "Cookies stored for task. %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  getCookieLogHandle();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_DEBUG,  "Set cookie completion. Cookies = %@",  (uint8_t *)&v5,  0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke( uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  getCookieLogHandle();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_DEBUG,  "Set cookie completion. Cookies = %@",  (uint8_t *)&v5,  0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  getCookieLogHandle();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_DEBUG,  "Set cookie completion called. Cookie = %@",  (uint8_t *)&v5,  0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)registerForPostingNotifications
{
  uint64_t v2 = *((void *)val + 5);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke;
  v7[3] = &unk_189C1A3C0;
  objc_copyWeak(&v8, &location);
  uint64_t v4 = v7;
  int v5 = v4;
  if (v2)
  {
    uint64_t v6 = *(dispatch_queue_s **)(v2 + 24);
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __68__NSHTTPCookie2Storage__setDefaultCookieChangedNotificationHandler___block_invoke;
    block[3] = &unk_189C1A2E8;
    block[4] = v2;
    __int128 v11 = v4;
    dispatch_async(v6, block);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    cookieNotificationQueue();
    uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2;
    block[3] = &unk_189C1A548;
    id v4 = WeakRetained;
    dispatch_async(v2, block);
  }
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 postNotificationName:@"com.apple.Foundation.NSHTTPCookieManagerAcceptPolicyChanged" object:*(void *)(a1 + 32)];
}

- (void)initMemoryCookieStore
{
  if (!a1) {
    return 0LL;
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    id v2 = -[NSHTTPCookie2Storage initInNSMemoryHTTPCookie2Storage]( objc_alloc(&OBJC_CLASS___NSHTTPCookie2Storage),  "initInNSMemoryHTTPCookie2Storage");
    uint64_t v3 = (void *)v1[5];
    v1[5] = v2;

    v1[3] = 2LL;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v1);
  }

  return v1;
}

- (void)initWithPath:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      id v4 = -[NSHTTPCookie2Storage initWithPath:](objc_alloc(&OBJC_CLASS___NSHTTPCookie2Storage), "initWithPath:", v3);
      objc_super v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2LL;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

- (void)initWithIdentifyingData:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      id v4 = -[NSHTTPCookie2Storage initWithIdentifyingData:]( objc_alloc(&OBJC_CLASS___NSHTTPCookie2Storage),  "initWithIdentifyingData:",  v3);
      objc_super v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2LL;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

@end