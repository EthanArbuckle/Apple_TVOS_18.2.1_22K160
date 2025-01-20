@interface NENetworkPropertiesCache
+ (NENetworkPropertiesCache)sharedCache;
- (NENetworkPropertiesCache)init;
- (NSString)keychainIdentifier;
- (NSURL)cacheFileURL;
- (id)copyPropertiesForNetworkPath:(id)a3;
- (id)createCacheKeyFromSignature:(void *)a1;
- (id)encryptData:(void *)a1 withKey:(void *)a2;
- (uint64_t)copyNetworkSignatureForPath:(uint64_t)a1;
- (uint64_t)fetchKey:(void *)a1;
- (uint64_t)loadCache;
- (void)clear;
- (void)rotateEncryptionKey;
- (void)saveCacheToDisk:(void *)a1;
- (void)setCacheFileURL:(id)a3;
- (void)setKeychainIdentifier:(id)a3;
- (void)setProperties:(id)a3 forNetworkPath:(id)a4;
- (void)updateKeyWithCurrentKey:(void *)a3 currentCache:;
@end

@implementation NENetworkPropertiesCache

- (NENetworkPropertiesCache)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NENetworkPropertiesCache;
  v2 = -[NENetworkPropertiesCache init](&v13, sel_init);
  v3 = v2;
  if (!v2) {
    goto LABEL_7;
  }
  v2->lock._os_unfair_lock_opaque = 0;
  int out_token = -1;
  uint32_t v4 = notify_register_check("com.apple.networkextension.net-properties-changed", &out_token);
  if (!v4)
  {
    v3->_notifyToken = out_token;
    uint64_t v8 = [objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:"/Library/Preferences/com.apple.networkextension.netprops.plist" isDirectory:0 relativeToURL:0];
    cacheFileURL = v3->_cacheFileURL;
    v3->_cacheFileURL = (NSURL *)v8;

    keychainIdentifier = v3->_keychainIdentifier;
    v3->_keychainIdentifier = (NSString *)@"com.apple.networkextension.netpropskey";

LABEL_7:
    v7 = v3;
    goto LABEL_8;
  }

  uint32_t v5 = v4;
  ne_log_obj();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "com.apple.networkextension.net-properties-changed";
    __int16 v16 = 1024;
    uint32_t v17 = v5;
    _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "Failed to register for %s notifications: %u",  buf,  0x12u);
  }

  v7 = 0LL;
LABEL_8:

  return v7;
}

- (id)copyPropertiesForNetworkPath:(id)a3
{
  uint32_t v4 = (void *)-[NENetworkPropertiesCache copyNetworkSignatureForPath:]((uint64_t)self, a3);
  if (v4)
  {
    p_lock = &self->lock;
    os_unfair_lock_lock(&self->lock);
    v6 = 0LL;
    if (-[NENetworkPropertiesCache loadCache]((uint64_t)self) && self)
    {
      v7 = self->_cache;
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = -[NENetworkPropertiesCache createCacheKeyFromSignature:](self, v4);
        if (v9)
        {
          v10 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
          v6 = (void *)[v10 copy];
        }

        else
        {
          ne_log_obj();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create a cacheKey for the network signature",  v14,  2u);
          }

          v6 = 0LL;
        }
      }

      else
      {
        v6 = 0LL;
      }
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, "No network signature is available", buf, 2u);
    }

    v6 = 0LL;
  }

  return v6;
}

- (void)setProperties:(id)a3 forNetworkPath:(id)a4
{
  id v6 = a3;
  v7 = (void *)-[NENetworkPropertiesCache copyNetworkSignatureForPath:]((uint64_t)self, a4);
  if (v7)
  {
    os_unfair_lock_lock(&self->lock);
    if (-[NENetworkPropertiesCache loadCache]((uint64_t)self))
    {
      if (self && (uint64_t v8 = self->_cache) != 0LL)
      {
        v9 = v8;
        id v10 = (id)-[NSDictionary mutableCopy](v8, "mutableCopy");
      }

      else
      {
        id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
      v12 = -[NENetworkPropertiesCache createCacheKeyFromSignature:](self, v7);
      if (v12)
      {
        [v10 setObject:v6 forKeyedSubscript:v12];
        -[NENetworkPropertiesCache saveCacheToDisk:](self, (uint64_t)v10);
      }
    }

    os_unfair_lock_unlock(&self->lock);
  }

  else
  {
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Network characteristics has no signature, cannot set characteristics",  v13,  2u);
    }
  }
}

- (void)clear
{
  v25[3] = *MEMORY[0x1895F89C0];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  uint64_t v4 = *MEMORY[0x18960BB48];
  uint64_t v5 = *MEMORY[0x18960BE70];
  v24[0] = *MEMORY[0x18960BB38];
  v24[1] = v5;
  uint64_t v6 = *MEMORY[0x189604DE8];
  v25[0] = v4;
  v25[1] = v6;
  v24[2] = *MEMORY[0x18960BA88];
  v7 = -[NENetworkPropertiesCache keychainIdentifier](self, "keychainIdentifier");
  v25[2] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:3];
  uint64_t v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  OSStatus v9 = SecItemDelete(v8);
  if (v9 != -25300 && v9)
  {
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19 = -[NENetworkPropertiesCache keychainIdentifier](self, "keychainIdentifier");
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "Failed to remove the %@ keychain item", buf, 0xCu);
    }
  }

  [MEMORY[0x1896078A8] defaultManager];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
  [v12 path];
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v11 fileExistsAtPath:v13];

  if (v14)
  {
    [MEMORY[0x1896078A8] defaultManager];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = 0LL;
    [v15 removeItemAtURL:v16 error:&v21];
    id v17 = v21;

    if (v17)
    {
      ne_log_obj();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, "Failed to remove %@", buf, 0xCu);
      }
    }

    else
    {
      notify_post("com.apple.networkextension.net-properties-changed");
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)rotateEncryptionKey
{
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  if (-[NENetworkPropertiesCache loadCache]((uint64_t)self))
  {
    if (self)
    {
      uint64_t v4 = self->_cache;
      if (v4)
      {
        uint64_t v5 = v4;
        id v9 = 0LL;
        int v6 = -[NENetworkPropertiesCache fetchKey:](self, &v9);
        id v7 = v9;
        uint64_t v8 = v7;
        if (!v6 && v7) {
          -[NENetworkPropertiesCache updateKeyWithCurrentKey:currentCache:](self, v7, v5);
        }
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSURL)cacheFileURL
{
  return self->_cacheFileURL;
}

- (void)setCacheFileURL:(id)a3
{
}

- (NSString)keychainIdentifier
{
  return self->_keychainIdentifier;
}

- (void)setKeychainIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)loadCache
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int check = 0;
  uint32_t v2 = notify_check(*(_DWORD *)(a1 + 12), &check);
  if (v2)
  {
    uint32_t v3 = v2;
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v3;
      _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, "notify_check failed: %u", buf, 8u);
    }

    uint64_t v5 = 1LL;
    goto LABEL_29;
  }

  if (check || !*(void *)(a1 + 32))
  {
    int v6 = (void *)MEMORY[0x189603F48];
    [(id)a1 cacheFileURL];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = 0LL;
    [v6 dataWithContentsOfURL:v7 options:0 error:&v20];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (os_log_s *)v20;

    if (!v8)
    {
      ne_log_obj();
      objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEFAULT,  "Got an error while reading the cache from disk: %@",  buf,  0xCu);
      }

      if (v4)
      {
        -[os_log_s domain](v4, "domain");
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          BOOL v15 = 0;
        }
      }

      else
      {
        BOOL v15 = 0;
      }

      uint64_t v5 = !v15;
      id v17 = *(id *)(a1 + 32);
      *(void *)(a1 + 32) = 0LL;
      goto LABEL_28;
    }

    id v19 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v8 options:0 format:0 error:&v19];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = (os_log_s *)v19;
    if (v10)
    {
      ne_log_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v10;
        v12 = "Failed to de-serialize the network properties cache: %@";
LABEL_21:
        _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
      }
    }

    else
    {
      if ((isa_nsdictionary(v9) & 1) != 0)
      {
LABEL_23:
        __int16 v16 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v9;
        id v17 = v9;

        uint64_t v5 = 1LL;
LABEL_28:

LABEL_29:
        return v5;
      }

      ne_log_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (os_log_s *)v9;
        v12 = "De-serialized cache is not a dictionary: %@";
        goto LABEL_21;
      }
    }

    id v9 = 0LL;
    goto LABEL_23;
  }

  return 1LL;
}

- (uint64_t)fetchKey:(void *)a1
{
  v22[4] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *MEMORY[0x18960BB38];
  v22[0] = *MEMORY[0x18960BB48];
  uint64_t v5 = *MEMORY[0x18960BA88];
  v21[0] = v4;
  v21[1] = v5;
  [a1 keychainIdentifier];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x18960BDA0];
  uint64_t v8 = *MEMORY[0x18960BDB0];
  v22[1] = v6;
  v22[2] = v8;
  uint64_t v9 = *MEMORY[0x18960BE20];
  v21[2] = v7;
  v21[3] = v9;
  v22[3] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:4];
  id v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  *a2 = 0LL;
  uint64_t v11 = SecItemCopyMatching(v10, &result);
  uint64_t v12 = v11;
  if ((_DWORD)v11 == -25300)
  {
    ne_log_obj();
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      goto LABEL_11;
    }

    [a1 keychainIdentifier];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    CFTypeRef v20 = v15;
    _os_log_impl(&dword_1876B1000, (os_log_t)v14, OS_LOG_TYPE_INFO, "No %@ item was found", buf, 0xCu);
LABEL_8:

    goto LABEL_10;
  }

  if ((_DWORD)v11)
  {
    ne_log_obj();
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    BOOL v15 = (void *)SecCopyErrorMessageString(v12, 0LL);
    *(_DWORD *)buf = 138412290;
    CFTypeRef v20 = v15;
    _os_log_error_impl(&dword_1876B1000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed: %@", buf, 0xCu);
    goto LABEL_8;
  }

  if (result && (uint64_t v13 = CFDATA_TYPE, CFGetTypeID(result) == v13))
  {
    *a2 = (id)result;
  }

  else
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v20 = result;
      _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "Result from keychain is not a data blob: %@",  buf,  0xCu);
    }

    if (result) {
      CFRelease(result);
    }
  }

- (void)updateKeyWithCurrentKey:(void *)a3 currentCache:
{
  v66[2] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  arc4random_buf(__buf, 0x20uLL);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:__buf length:32];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_28;
  }
  id v9 = v7;
  uint64_t v10 = *MEMORY[0x18960BB38];
  uint64_t v11 = *MEMORY[0x18960BB48];
  if (v5)
  {
    v66[0] = *MEMORY[0x18960BB48];
    uint64_t v12 = *MEMORY[0x18960BA88];
    v65[0] = v10;
    v65[1] = v12;
    [a1 keychainIdentifier];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:2];
    int v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    uint64_t v63 = *MEMORY[0x18960BE78];
    id v64 = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    BOOL v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    OSStatus v16 = SecItemUpdate(v14, v15);
  }

  else
  {
    uint64_t v17 = *MEMORY[0x18960BE70];
    *(void *)buf = *MEMORY[0x18960BB38];
    *(void *)&buf[8] = v17;
    uint64_t v18 = *MEMORY[0x189604DE8];
    __buf[0] = v11;
    __buf[1] = v18;
    *(void *)&uint8_t buf[16] = *MEMORY[0x18960BA88];
    [a1 keychainIdentifier];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = *MEMORY[0x18960BE78];
    __buf[2] = v19;
    __buf[3] = v9;
    uint64_t v21 = *MEMORY[0x18960B828];
    uint64_t v60 = v20;
    uint64_t v61 = v21;
    __uint8_t buf[4] = *MEMORY[0x18960B830];
    [MEMORY[0x189603F68] dictionaryWithObjects:__buf forKeys:buf count:5];
    int v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    OSStatus v16 = SecItemAdd(v14, 0LL);
  }

  if (!v16)
  {

    if (!v5 || !v6) {
      goto LABEL_28;
    }
    v46 = a1;
    v47 = v8;
    v50 = v9;
    id v49 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v48 = v6;
    id v23 = v6;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (!v24) {
      goto LABEL_27;
    }
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v52;
LABEL_12:
    uint64_t v27 = 0LL;
    while (1)
    {
      if (*(void *)v52 != v26) {
        objc_enumerationMutation(v23);
      }
      uint64_t v28 = *(void *)(*((void *)&v51 + 1) + 8 * v27);
      *(void *)dataOutMoved = 0LL;
      [v23 objectForKeyedSubscript:v28];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v28 options:0];
      id v31 = v5;
      v32 = (const void *)[v31 bytes];
      size_t v33 = [v31 length];
      id v34 = v30;
      CCCryptorStatus v35 = CCCrypt( 1u,  0,  0,  v32,  v33,  0,  (const void *)[v34 bytes],  objc_msgSend(v34, "length"),  __buf,  0x20uLL,  (size_t *)dataOutMoved);
      if (v35)
      {
        CCCryptorStatus v36 = v35;
        ne_log_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v36;
          v38 = v37;
          v39 = "CCCrypt failed: %d";
          uint32_t v40 = 8;
LABEL_24:
          _os_log_error_impl(&dword_1876B1000, v38, OS_LOG_TYPE_ERROR, v39, buf, v40);
        }
      }

      else
      {
        if (*(void *)dataOutMoved == 32LL)
        {
          v37 = (os_log_s *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:__buf length:32 freeWhenDone:0];
          v41 = -[NENetworkPropertiesCache encryptData:withKey:](v37, v50);
          v42 = v41;
          if (v41)
          {
            [v41 base64EncodedStringWithOptions:0];
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            [v49 setObject:v29 forKeyedSubscript:v43];
          }

          goto LABEL_25;
        }

        ne_log_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = *(void *)dataOutMoved;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 32LL;
          v38 = v37;
          v39 = "Decrypted data size (%lu) does not match expected size (%lu)";
          uint32_t v40 = 22;
          goto LABEL_24;
        }
      }

- (id)encryptData:(void *)a1 withKey:(void *)a2
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  size_t __size = 0LL;
  id v4 = a2;
  id v5 = (const void *)[v4 bytes];
  size_t v6 = [v4 length];
  id v7 = v3;
  CCCryptorStatus v8 = CCCrypt( 0,  0,  0,  v5,  v6,  0,  (const void *)[v7 bytes],  objc_msgSend(v7, "length"),  0,  0,  &__size);
  if (v8 != -4301)
  {
    CCCryptorStatus v20 = v8;
    ne_log_obj();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      CCCryptorStatus v34 = v20;
      _os_log_error_impl(&dword_1876B1000, v21, OS_LOG_TYPE_ERROR, "CCCrypt failed without buffer: %d", buf, 8u);
    }

    goto LABEL_13;
  }

  id v9 = malloc(__size);
  if (!v9)
  {
    int v22 = *__error();
    ne_log_obj();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v27 = 134218498;
      size_t v28 = __size;
      __int16 v29 = 1024;
      int v30 = v22;
      __int16 v31 = 2080;
      v32 = buf;
      _os_log_fault_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_FAULT,  "Failed to allocate %lu bytes of data: [%d] %s",  v27,  0x1Cu);
    }

- (void)saveCacheToDisk:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v11 = 0LL;
    [MEMORY[0x1896079E8] dataWithPropertyList:a2 format:200 options:0 error:&v11];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v11;
    if (v4)
    {
      ne_log_obj();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        size_t v6 = "Failed to serialize the network properties: %@";
LABEL_12:
        _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      }
    }

    else
    {
      if ((isa_nsdata(v3) & 1) != 0)
      {
        [a1 cacheFileURL];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = 0LL;
        [v3 writeToURL:v7 options:1073741825 error:&v10];
        id v5 = (os_log_s *)v10;

        if (v5)
        {
          ne_log_obj();
          CCCryptorStatus v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            [a1 cacheFileURL];
            id v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            id v13 = v9;
            __int16 v14 = 2112;
            BOOL v15 = v5;
            _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to write the serialized plist to %@: %@",  buf,  0x16u);
          }
        }

        else
        {
          notify_post("com.apple.networkextension.net-properties-changed");
        }

        goto LABEL_14;
      }

      ne_log_obj();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v3;
        size_t v6 = "Serialized plist is not a valid data object: %@";
        goto LABEL_12;
      }
    }

- (uint64_t)copyNetworkSignatureForPath:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0LL;
  if (a1 && v3)
  {
    size_t v6 = (nw_interface *)nw_path_copy_interface();
    id v7 = v6;
    if (!v6)
    {
      ne_log_obj();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Path does not have an interface, cannot get network signature",  buf,  2u);
      }

      uint64_t v5 = 0LL;
      goto LABEL_17;
    }

    nw_interface_type_t type = nw_interface_get_type(v6);
    id v9 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FB8]);
    int ipv4_network_signature = nw_path_get_ipv4_network_signature();
    char v11 = ipv4_network_signature;
    if (ipv4_network_signature) {
      -[os_log_s appendBytes:length:](v9, "appendBytes:length:", buf, 20LL);
    }
    *(void *)buf = 0LL;
    uint64_t v17 = 0LL;
    int v18 = 0;
    if (nw_path_get_ipv6_network_signature())
    {
      if (type == nw_interface_type_cellular)
      {
        uint64_t v12 = (uint8_t *)&dummyIPv6NetworkSignature;
        id v13 = v9;
        uint64_t v14 = 20LL;
      }

      else
      {
        uint64_t v14 = 20LL;
        uint64_t v12 = buf;
        id v13 = v9;
      }
    }

    else
    {
      if ((v11 & 1) != 0)
      {
LABEL_16:
        uint64_t v5 = [objc_alloc(MEMORY[0x189603F48]) initWithData:v9];
LABEL_17:

        goto LABEL_18;
      }

      uint64_t v12 = (uint8_t *)"default_signature";
      id v13 = v9;
      uint64_t v14 = 18LL;
    }

    -[os_log_s appendBytes:length:](v13, "appendBytes:length:", v12, v14);
    goto LABEL_16;
  }

- (id)createCacheKeyFromSignature:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    id v13 = 0LL;
    int v4 = -[NENetworkPropertiesCache fetchKey:](a1, &v13);
    id v5 = v13;
    if (v4 == -25300)
    {
      -[NENetworkPropertiesCache updateKeyWithCurrentKey:currentCache:](a1, 0LL, 0LL);
      id v12 = v5;
      int v4 = -[NENetworkPropertiesCache fetchKey:](a1, &v12);
      id v6 = v12;

      id v5 = v6;
    }

    if (v4)
    {
      a1 = 0LL;
    }

    else
    {
      id v7 = v3;
      CC_SHA256((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
      CCCryptorStatus v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:md length:32 freeWhenDone:0];
      -[NENetworkPropertiesCache encryptData:withKey:](v8, v5);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v9;
      if (v9)
      {
        [v9 base64EncodedStringWithOptions:0];
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        a1 = 0LL;
      }
    }
  }

  return a1;
}

+ (NENetworkPropertiesCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_21254);
  }
  return (NENetworkPropertiesCache *)(id)sharedCache_g_cache;
}

void __39__NENetworkPropertiesCache_sharedCache__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  v0 = objc_alloc_init(&OBJC_CLASS___NENetworkPropertiesCache);
  v1 = (void *)sharedCache_g_cache;
  sharedCache_g_cache = (uint64_t)v0;
}

@end