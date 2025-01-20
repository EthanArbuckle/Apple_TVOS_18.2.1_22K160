@interface NEIdentityKeychainItem
+ (id)copyIdentities:(id)a3 fromDomain:(int64_t)a4;
+ (id)importPKCS12Data:(id)a3 passphrase:(id)a4;
+ (uint64_t)copyPropertiesForIdentity:(void *)a3 persistentReference:;
- (NEIdentityKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEIdentityKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (id)copyData;
- (id)copyPassword;
- (id)copyQueryWithReturnTypes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)sync;
@end

@implementation NEIdentityKeychainItem

- (NEIdentityKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  return 0LL;
}

- (NEIdentityKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[NEKeychainItem persistentReference](self, "persistentReference");
  int64_t v6 = -[NEKeychainItem domain](self, "domain");
  v7 = -[NEKeychainItem accessGroup](self, "accessGroup");
  v8 = (void *)[v4 initWithPersistentReference:v5 domain:v6 accessGroup:v7];

  return v8;
}

- (id)copyPassword
{
  return 0LL;
}

- (id)copyData
{
  return 0LL;
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEKeychainItem persistentReference](self, "persistentReference");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4) {
      [v5 setObject:*MEMORY[0x18960BB50] forKeyedSubscript:*MEMORY[0x18960BB38]];
    }
    v7 = -[NEKeychainItem persistentReference](self, "persistentReference");
    v8 = (void *)MEMORY[0x18960BE80];
  }

  else
  {
    v9 = -[NEKeychainItem identifier](self, "identifier");
    if (!v9) {
      goto LABEL_8;
    }
    [v5 setObject:*MEMORY[0x18960BB50] forKeyedSubscript:*MEMORY[0x18960BB38]];
    v7 = -[NEKeychainItem identifier](self, "identifier");
    v8 = (void *)MEMORY[0x18960B9F8];
  }

  [v5 setObject:v7 forKeyedSubscript:*v8];

LABEL_8:
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

- (void)sync
{
  v61[1] = *MEMORY[0x1895F89C0];
  v3 = -[NEKeychainItem persistentReference](self, "persistentReference");
  if (v3)
  {
  }

  else
  {
    -[NEKeychainItem identifier](self, "identifier");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      id v46 = 0LL;
      int v5 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:]( self,  0LL,  0LL,  &v46);
      id v6 = v46;
      if (v5) {
        -[NEKeychainItem setPersistentReference:](self, "setPersistentReference:", v6);
      }
    }
  }
  v7 = -[NEKeychainItem persistentReference](self, "persistentReference");
  if (v7)
  {
    CFTypeRef result = 0LL;
    v61[0] = *MEMORY[0x18960BE30];
    [MEMORY[0x189603F18] arrayWithObjects:v61 count:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NEIdentityKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", v8);

    if (!SecItemCopyMatching(v9, &result))
    {
      CFTypeRef v17 = result;
      CFTypeID TypeID = SecIdentityGetTypeID();
      if (v17)
      {
        if (CFGetTypeID(v17) == TypeID)
        {
          *(void *)buf = 0LL;
          if (!SecIdentityCopyCertificate((SecIdentityRef)result, (SecCertificateRef *)buf))
          {
            __int128 v19 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
            __int128 v20 = v19;
            if (self)
            {
              v21 = self;
              objc_sync_enter(v21);
              objc_storeStrong((id *)&v21->super._identifier, v19);
              objc_sync_exit(v21);
            }

            CFRelease(*(CFTypeRef *)buf);
          }
        }
      }
    }

    if (result) {
      CFRelease(result);
    }
    -[NEKeychainItem accessGroup](self, "accessGroup");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10) {
      goto LABEL_40;
    }
    CFTypeRef result = 0LL;
    uint64_t v60 = *MEMORY[0x18960BE18];
    [MEMORY[0x189603F18] arrayWithObjects:&v60 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[NEIdentityKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", v11);

    OSStatus v13 = SecItemCopyMatching(v12, &result);
    if (v13)
    {
      OSStatus v14 = v13;
      ne_log_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = -[NEKeychainItem persistentReference](self, "persistentReference");
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v16;
        __int16 v48 = 1024;
        LODWORD(v49) = v14;
        _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Cannot update access group, failed to find item with persistent reference %@: %d",  buf,  0x12u);
      }

      goto LABEL_37;
    }

    uint64_t v15 = (id)result;
    if (isa_nsdictionary(v15))
    {
      uint64_t v22 = *MEMORY[0x18960BA68];
      v23 = -[os_log_s objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x18960BA68]);
      if (isa_nsdata(v23))
      {
        uint64_t v25 = *MEMORY[0x18960BB40];
        v56[0] = *MEMORY[0x18960BB38];
        uint64_t v24 = v56[0];
        v56[1] = v22;
        v58[0] = v25;
        v58[1] = v23;
        uint64_t v57 = *MEMORY[0x18960BE70];
        uint64_t v26 = v57;
        uint64_t v59 = *MEMORY[0x189604DE8];
        uint64_t v27 = v59;
        [MEMORY[0x189603F68] dictionaryWithObjects:v58 forKeys:v56 count:3];
        v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = *MEMORY[0x18960BB60];
        uint64_t v30 = *MEMORY[0x18960B878];
        v54[0] = v24;
        v54[1] = v30;
        v55[0] = v29;
        v55[1] = v23;
        v54[2] = v26;
        v55[2] = v27;
        [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:3];
        v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = *MEMORY[0x18960B820];
        v32 = -[NEKeychainItem accessGroup](self, "accessGroup");
        v53 = v32;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        OSStatus v34 = SecItemUpdate(v28, v33);
        if (v34)
        {
          OSStatus v35 = v34;
          ne_log_obj();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v44 = -[NEKeychainItem accessGroup](self, "accessGroup");
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v44;
            __int16 v48 = 2112;
            v49 = v23;
            __int16 v50 = 1024;
            OSStatus v51 = v35;
            v37 = "Failed to update the access group to %@ for certificate %@: %d";
LABEL_45:
            _os_log_error_impl(&dword_1876B1000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x1Cu);
          }
        }

        else
        {
          OSStatus v41 = SecItemUpdate(v31, v33);
          if (!v41)
          {
LABEL_34:

            goto LABEL_35;
          }

          OSStatus v42 = v41;
          ne_log_obj();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v44 = -[NEKeychainItem accessGroup](self, "accessGroup");
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v44;
            __int16 v48 = 2112;
            v49 = v23;
            __int16 v50 = 1024;
            OSStatus v51 = v42;
            v37 = "Failed to update the access group to %@ for key %@: %d";
            goto LABEL_45;
          }
        }

        goto LABEL_34;
      }

      ne_log_obj();
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }

      *(_WORD *)buf = 0;
      v38 = "Cannot update access group, identity has no public key hash attribute";
      v39 = v28;
      uint32_t v40 = 2;
    }

    else
    {
      ne_log_obj();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

LABEL_37:
        -[NEKeychainItem setAccessGroup:](self, "setAccessGroup:", 0LL);
        if (result) {
          CFRelease(result);
        }

LABEL_40:
        goto LABEL_41;
      }

      -[NEKeychainItem persistentReference](self, "persistentReference");
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v28;
      v38 = "Cannot update access group, failed to fetch attributes for persistent reference %@";
      v39 = (os_log_s *)v23;
      uint32_t v40 = 12;
    }

    _os_log_error_impl(&dword_1876B1000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_35;
  }

+ (id)copyIdentities:(id)a3 fromDomain:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  CFTypeRef result = 0LL;
  [v5 setObject:*MEMORY[0x18960BB50] forKeyedSubscript:*MEMORY[0x18960BB38]];
  [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE30]];
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x18960BE80];
    v7 = v5;
    id v8 = v4;
  }

  else
  {
    id v8 = (id)*MEMORY[0x18960BDA8];
    uint64_t v6 = *MEMORY[0x18960BDA0];
    v7 = v5;
  }

  [v7 setObject:v8 forKeyedSubscript:v6];
  [v5 setObject:*MEMORY[0x189604DE8] forKeyedSubscript:*MEMORY[0x18960BE70]];
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v9)
  {
    OSStatus v10 = v9;
    ne_log_obj();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v10;
    v31 = "SecItemCopyMatching failed: %d";
    v32 = v11;
    uint32_t v33 = 8;
    goto LABEL_35;
  }

  CFTypeRef v14 = result;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v14 && CFGetTypeID(v14) == TypeID)
  {
    id v34 = v4;
    uint64_t v11 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FC8]);
    CFIndex v16 = 0LL;
    id v12 = 0LL;
    CFTypeRef v17 = (const __CFArray *)result;
    __int128 v18 = &off_18A087000;
    while (v16 < CFArrayGetCount(v17))
    {
      ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(v17, v16);
      CFTypeID v20 = SecIdentityGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v20)
      {
        v21 = (void *)+[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]( (uint64_t)v18[420],  ValueAtIndex,  0LL);
        uint64_t v22 = v21;
        if (v21)
        {
          [v21 objectForKeyedSubscript:@"persistent-reference"];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[os_log_s objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v23);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            [v22 objectForKeyedSubscript:@"persistent-reference"];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v22, v25);

            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
            }
            objc_msgSend(v12, "addObject:", v22, v34);
            __int128 v18 = &off_18A087000;
          }
        }
      }

      ++v16;
    }

    id v4 = v34;
  }

  else
  {
    CFTypeRef v26 = result;
    CFTypeID v27 = SecIdentityGetTypeID();
    if (!v26 || CFGetTypeID(v26) != v27)
    {
      CFTypeRef v28 = result;
      ne_log_obj();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v29;
      if (!v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_INFO,  "SecItemCopyMatching returned NULL while searching for identities",  buf,  2u);
        }

        goto LABEL_6;
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        id v12 = 0LL;
        goto LABEL_7;
      }

      CFTypeID v30 = CFGetTypeID(result);
      *(_DWORD *)buf = 134217984;
      CFTypeID v37 = v30;
      v31 = "SecItemCopyMatching returned an unsupported type (%lu) when searching for identities";
      v32 = v11;
      uint32_t v33 = 12;
LABEL_35:
      _os_log_error_impl(&dword_1876B1000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      goto LABEL_6;
    }

    uint64_t v11 = (os_log_s *)+[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]( (uint64_t)&OBJC_CLASS___NEIdentityKeychainItem,  (__SecIdentity *)result,  v4);
    if (!v11) {
      goto LABEL_6;
    }
    [MEMORY[0x189603FA8] arrayWithObject:v11];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

+ (id)importPKCS12Data:(id)a3 passphrase:(id)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = v6;
  if (!v6)
  {
    OSStatus v10 = 0LL;
    goto LABEL_7;
  }

  uint64_t v8 = *MEMORY[0x18960BBF0];
  CFArrayRef items = 0LL;
  uint64_t v32 = v8;
  v33[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  OSStatus v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v9 && !SecPKCS12Import(v5, v9, &items))
  {
    id v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFMutableArrayRef v14 = CFArrayCreateMutable(v12, 0LL, MEMORY[0x189605228]);
    OSStatus v10 = 0LL;
    theArray = v14;
    if (Mutable) {
      BOOL v15 = v14 == 0LL;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      goto LABEL_5;
    }
    if (CFArrayGetCount(items))
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0LL);
      Value = (__SecCertificate *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x18960BBF8]);
      trust = (__SecTrust *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x18960BC00]);
      CFIndex CertificateCount = SecTrustGetCertificateCount(trust);
      if (CertificateCount >= 1)
      {
        CFIndex v17 = 0LL;
        key = (void *)*MEMORY[0x18960BE88];
        __int128 v18 = (const void *)*MEMORY[0x18960BE28];
        __int128 v19 = (const void *)*MEMORY[0x189604DE8];
        CFTypeID v20 = (const void *)*MEMORY[0x18960B828];
        v21 = (const void *)*MEMORY[0x18960B830];
        uint64_t v22 = (const void *)*MEMORY[0x18960BE70];
        do
        {
          CFTypeRef result = 0LL;
          SecCertificateRef CertificateAtIndex = Value;
          if (v17) {
            SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, v17);
          }
          CFDictionarySetValue(Mutable, key, CertificateAtIndex);
          CFDictionarySetValue(Mutable, v18, v19);
          CFDictionarySetValue(Mutable, v20, v21);
          CFDictionarySetValue(Mutable, v22, v19);
          OSStatus v24 = SecItemAdd(Mutable, &result);
          if (v24 == -25299)
          {
            CFDictionaryRemoveValue(Mutable, v20);
            OSStatus v24 = SecItemCopyMatching(Mutable, &result);
          }

          if (!v24 && result)
          {
            CFArrayAppendValue(theArray, result);
            CFRelease(result);
          }

          ++v17;
        }

        while (CertificateCount != v17);
      }

      CFRelease(Mutable);
      CFRelease(items);
      OSStatus v10 = theArray;
      goto LABEL_5;
    }
  }

  OSStatus v10 = 0LL;
LABEL_5:

LABEL_7:
  return v10;
}

+ (uint64_t)copyPropertiesForIdentity:(void *)a3 persistentReference:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = objc_opt_self();
  if (v4) {
    goto LABEL_2;
  }
  objc_opt_self();
  CFTypeRef result = 0LL;
  OSStatus v10 = (__SecCertificate *)*MEMORY[0x18960BE88];
  certificateRef[0] = *(SecCertificateRef *)MEMORY[0x18960BE28];
  certificateRef[1] = v10;
  *(void *)buf = MEMORY[0x189604A88];
  *(void *)&buf[8] = a2;
  certificateRef[2] = *(SecCertificateRef *)MEMORY[0x18960BE70];
  *(void *)&buf[16] = *MEMORY[0x189604DE8];
  [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:certificateRef count:3];
  uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemCopyMatching(v11, &result)) {
    goto LABEL_19;
  }
  CFTypeRef v12 = result;
  CFTypeID TypeID = CFDataGetTypeID();
  if (!v12)
  {
    id v4 = (id)result;
LABEL_14:
    ne_log_obj();
    CFIndex v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v17)
      {
        CFTypeID v18 = CFGetTypeID(result);
        *(_DWORD *)CFTypeRef v26 = 134217984;
        CFTypeID v27 = v18;
        __int128 v19 = "SecItemCopyMatching returned an object with an unexpected type (%lu) when getting an identity's persistent reference";
        CFTypeID v20 = v16;
        uint32_t v21 = 12;
LABEL_25:
        _os_log_error_impl(&dword_1876B1000, v20, OS_LOG_TYPE_ERROR, v19, v26, v21);
      }
    }

    else if (v17)
    {
      *(_WORD *)CFTypeRef v26 = 0;
      __int128 v19 = "SecItemCopyMatching returned NULL when getting an identity's persistent reference";
      CFTypeID v20 = v16;
      uint32_t v21 = 2;
      goto LABEL_25;
    }

LABEL_19:
    if (result) {
      CFRelease(result);
    }

    id v4 = 0LL;
    goto LABEL_22;
  }

  CFTypeID v14 = TypeID;
  CFTypeID v15 = CFGetTypeID(v12);
  id v4 = (id)result;
  if (v15 != v14) {
    goto LABEL_14;
  }

  if (!v4)
  {
LABEL_22:
    uint64_t v9 = 0LL;
    goto LABEL_23;
  }

@end