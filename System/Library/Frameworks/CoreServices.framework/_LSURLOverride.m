@interface _LSURLOverride
+ (id)booksStoreAuthorizationURL:(State *)a3;
+ (id)fmfURL:(State *)a3;
+ (id)fmipURL:(State *)a3;
+ (id)iCloudEmailPrefsURL:(State *)a3;
+ (id)iCloudFamilyURL:(State *)a3;
+ (id)iCloudSchoolworkURL:(State *)a3;
+ (id)iTunesStoreURL:(State *)a3;
+ (id)keynoteLiveURL:(State *)a3;
+ (id)keynoteLiveURL_noFragment:(State *)a3;
+ (id)new;
+ (void)addOverrideBlock:(id)a3;
+ (void)removeAllOverrideBlocks;
+ (void)resetPlatformFlag;
+ (void)setUseMacOverrides:(BOOL)a3;
- (NSURL)originalURL;
- (NSURL)overrideURL;
- (_LSURLOverride)init;
- (_LSURLOverride)initWithOriginalURL:(id)a3;
- (_LSURLOverride)initWithOriginalURL:(id)a3 checkingForAvailableApplications:(BOOL)a4;
@end

@implementation _LSURLOverride

- (_LSURLOverride)init
{
}

+ (id)new
{
}

- (_LSURLOverride)initWithOriginalURL:(id)a3 checkingForAvailableApplications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS____LSURLOverride;
  v8 = -[_LSURLOverride init](&v53, sel_init);
  if (!v8) {
    goto LABEL_63;
  }
  v9 = (NSURLComponents *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v7 resolvingAgainstBaseURL:1];
  if (v9)
  {
    LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v48, v9, v4);
    v10 = (LaunchServices::URLOverrides *)_os_feature_enabled_impl();
    if ((_DWORD)v10)
    {
      LaunchServices::URLOverrides::getLog(v10);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.3();
      }
    }

    else
    {
      if (LaunchServices::URLOverrides::overrideBlocks)
      {
        v10 = (LaunchServices::URLOverrides *)[(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
        if ((_DWORD)v10)
        {
          BOOL v46 = v4;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          id v14 = (id)LaunchServices::URLOverrides::overrideBlocks;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0LL; i != v15; ++i)
              {
                if (*(void *)v55 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                (*(void (**)(uint64_t, id, void, void, void))(v18 + 16))(v18, v48, v49, v50, v52);
                v19 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
                v20 = (char *)v19;
                if (v19)
                {
                  LaunchServices::URLOverrides::getLog(v19);
                  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  BOOL v4 = v46;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    v42 = (void *)MEMORY[0x186E2A7B8](v18);
                    [v48 URL];
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v65 = 138478339;
                    *(void *)&v65[4] = v42;
                    *(_WORD *)&v65[12] = 2113;
                    *(void *)&v65[14] = v43;
                    *(_WORD *)&v65[22] = 2113;
                    v66 = v20;
                    _os_log_debug_impl( &dword_183E58000,  v31,  OS_LOG_TYPE_DEBUG,  "Block %{private}@ overrode URL %{private}@ to %{private}@",  v65,  0x20u);
                  }

                  goto LABEL_48;
                }
              }

              uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:buf count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          BOOL v4 = v46;
        }
      }

      if (v49 || v50 || v51)
      {
        v22 = (LaunchServices::URLOverrides *)objc_opt_class();
        *(void *)v65 = sel_fmfURL_;
        *(void *)&v65[8] = sel_fmipURL_;
        *(void *)&v65[16] = sel_iTunesStoreURL_;
        v66 = sel_iCloudEmailPrefsURL_;
        int v23 = v49 | v50;
        v67 = sel_keynoteLiveURL_;
        v68 = sel_iCloudFamilyURL_;
        v24 = &v64;
        if (!v51) {
          v24 = 0LL;
        }
        v69 = sel_iCloudSchoolworkURL_;
        if (v23) {
          uint64_t v25 = 7LL;
        }
        else {
          uint64_t v25 = v51;
        }
        if (v23) {
          v26 = (SEL *)v65;
        }
        else {
          v26 = (SEL *)v24;
        }
        v64 = sel_booksStoreAuthorizationURL_;
        if (v25)
        {
          v27 = v22;
          while (1)
          {
            v28 = *v26;
            objc_msgSend(v27, *v26, &v48);
            v22 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
            v20 = (char *)v22;
            if (v22) {
              break;
            }
            ++v26;
            if (!--v25) {
              goto LABEL_39;
            }
          }

          LaunchServices::URLOverrides::getLog(v22);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(v28);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            [v48 URL];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138478339;
            v59 = v44;
            __int16 v60 = 2113;
            v61 = v45;
            __int16 v62 = 2113;
            v63 = v20;
            _os_log_debug_impl( &dword_183E58000,  v29,  OS_LOG_TYPE_DEBUG,  "Selector %{private}@ overrode URL %{private}@ to %{private}@",  v58,  0x20u);
          }
        }

        else
        {
LABEL_39:
          LaunchServices::URLOverrides::getLog(v22);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            [v48 URL];
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.5(v30, (uint64_t)v58, v29);
          }

          v20 = 0LL;
        }

LABEL_48:
        LaunchServices::URLOverrides::getLog(v32);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v20)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v71 = v20;
            __int16 v72 = 2113;
            id v73 = v7;
            _os_log_impl( &dword_183E58000,  v34,  OS_LOG_TYPE_DEFAULT,  "URL %{private}@ overrides URL %{private}@",  buf,  0x16u);
          }

          objc_storeStrong((id *)&v8->_originalURL, a3);
          uint64_t v35 = [v20 copy];
          overrideURL = v8->_overrideURL;
          v8->_overrideURL = (NSURL *)v35;

          if (!v4) {
            goto LABEL_62;
          }
          v37 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
          id v47 = 0LL;
          char v38 = [v37 isApplicationAvailableToOpenURL:v20 error:&v47];
          v39 = (_LSURLOverride *)v47;

          if ((v38 & 1) != 0)
          {
LABEL_61:

LABEL_62:
LABEL_63:
            v8 = v8;
            v13 = v8;
            goto LABEL_64;
          }

          if (!v39)
          {
LABEL_60:
            v8 = 0LL;
            goto LABEL_61;
          }

          LaunchServices::URLOverrides::getLog(v40);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.2((uint64_t)v20);
          }
        }

        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.1();
          }
          v39 = v8;
        }

        goto LABEL_60;
      }

      LaunchServices::URLOverrides::getLog(v10);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        [v48 URL];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.4(v21, (uint64_t)v65, v11);
      }
    }

    v20 = 0LL;
    goto LABEL_48;
  }

  LaunchServices::URLOverrides::getLog(0LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v71 = (char *)v7;
    _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "URL %{private}@ could not be decomposed into its components. Cannot override.",  buf,  0xCu);
  }

  v13 = 0LL;
LABEL_64:

  return v13;
}

- (_LSURLOverride)initWithOriginalURL:(id)a3
{
  return -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:]( self,  "initWithOriginalURL:checkingForAvailableApplications:",  a3,  1LL);
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void).cxx_destruct
{
}

+ (void)addOverrideBlock:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"+[_LSURLOverride(Tests) addOverrideBlock:]"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInFunction:v8, @"LSURLOverride.mm", 154, @"Invalid parameter not satisfying: %@", @"block != nil" file lineNumber description];
  }

  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    if (!LaunchServices::URLOverrides::overrideBlocks)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      v5 = (void *)LaunchServices::URLOverrides::overrideBlocks;
      LaunchServices::URLOverrides::overrideBlocks = (uint64_t)v4;

      v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    }

    v6 = (void *)MEMORY[0x186E2A7B8](v9);
    [v3 addObject:v6];
  }
}

+ (void)removeAllOverrideBlocks
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    LaunchServices::URLOverrides::overrideBlocks = 0LL;
  }

+ (void)setUseMacOverrides:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    uint64_t v4 = [MEMORY[0x189607968] numberWithBool:v3];
    v5 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = v4;
  }

+ (void)resetPlatformFlag
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = 0LL;
  }

+ (id)fmfURL:(State *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lowercaseString];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 isEqualToString:@"fmfmail.icloud.com"])
  {
    [a3->var0 path];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [a3->var0 query];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      id v9 = (void *)[v6 mutableCopy];
      [v9 appendString:@"?"];
      [v9 appendString:v8];
      uint64_t v10 = [v9 copy];

      v6 = (void *)v10;
    }

    if ([v6 hasPrefix:@"/"])
    {
      v11 = (void *)[a3->var0 copy];
      [v11 setScheme:@"fmf1"];
      [v11 URL];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

+ (id)fmipURL:(State *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lowercaseString];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 isEqualToString:@"fmipmail.icloud.com"])
  {
    v6 = (void *)[a3->var0 copy];
    [v6 setScheme:@"fmip1"];
    [v6 URL];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)iTunesStoreURL:(State *)a3
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iTunesStoreURL:].cold.1();
    }
    uint64_t v4 = 0LL;
    goto LABEL_65;
  }

  uint64_t v59 = [a3->var0 scheme];
  [a3->var0 host];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 lowercaseString];

  v58 = (void *)v7;
  [a3->var0 path];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [a3->var0 query];
  uint64_t v10 = (void *)v9;
  uint64_t v4 = 0LL;
  if (!v59 || !v7 || !v8) {
    goto LABEL_64;
  }
  unsigned __int8 v52 = (void *)v9;
  if (v9)
  {
    v11 = (void *)[v8 mutableCopy];
    [v11 appendString:@"?"];
    [v11 appendString:v10];
    uint64_t v12 = [v11 copy];

    v8 = (void *)v12;
  }

  v13 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"];
  if (v13)
  {
    id v14 = @"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist";
  }

  else
  {
    [MEMORY[0x1896077F8] bundleWithIdentifier:@"com.apple.MobileCoreServices"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 pathForResource:@"iTunesStoreURLPatterns" ofType:@"plist"];
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v14 || (v13 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v14]) == 0)
    {
      uint64_t v4 = 0LL;
      goto LABEL_63;
    }
  }

  id v48 = v14;
  [v13 objectForKey:@"p2-url-resolution"];
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  id v47 = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v15)
  {
    uint64_t v4 = 0LL;
    goto LABEL_62;
  }

  uint64_t v50 = *(void *)v69;
  *(void *)&__int128 v16 = 138477827LL;
  __int128 v44 = v16;
  do
  {
    uint64_t v17 = 0LL;
    uint64_t v46 = v15;
    do
    {
      if (*(void *)v69 != v50) {
        objc_enumerationMutation(obj);
      }
      __int128 v55 = *(void **)(*((void *)&v68 + 1) + 8 * v17);
      objc_msgSend(v55, "objectForKey:", @"scheme-mapping", v44);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = v17;
      [v18 objectForKey:v59];
      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3->var1)
      {
        id v19 = objc_alloc_init(MEMORY[0x189607A50]);
        [v19 setScheme:v57];
        v20 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
        [v19 URL];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        int v22 = [v20 isApplicationAvailableToOpenURL:v21 error:0];

        if (!v22)
        {
          LaunchServices::URLOverrides::getLog(v23);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v44;
            v75 = v57;
            _os_log_debug_impl( &dword_183E58000,  v40,  OS_LOG_TYPE_DEBUG,  "Skipping iTunes Store scheme %{private}@ because no app is installed to handle it",  buf,  0xCu);
          }

          v24 = v19;
          goto LABEL_53;
        }
      }

      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      [v55 objectForKey:@"host-patterns"];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v54 = v24;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v25)
      {
        int v26 = 0;
        uint64_t v53 = *(void *)v65;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v65 != v53) {
              objc_enumerationMutation(v24);
            }
            [MEMORY[0x189607A00] regularExpressionWithPattern:*(void *)(*((void *)&v64 + 1) + 8 * i) options:1 error:0];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v31 = objc_msgSend( v28,  "rangeOfFirstMatchInString:options:range:",  v58,  0,  0,  objc_msgSend(v58, "length")) != 0x7FFFFFFFFFFFFFFFLL || v29 != 0;
            v26 |= v31;
            if ((v26 & 1) != 0)
            {
              __int128 v62 = 0u;
              __int128 v63 = 0u;
              __int128 v60 = 0u;
              __int128 v61 = 0u;
              unsigned __int8 v49 = v28;
              [v55 objectForKey:@"path-patterns"];
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              int v45 = v26;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v72 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v61;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v33; ++j)
                  {
                    if (*(void *)v61 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    [MEMORY[0x189607A00] regularExpressionWithPattern:*(void *)(*((void *)&v60 + 1) + 8 * j) options:1 error:0];
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v39 = objc_msgSend( v36,  "rangeOfFirstMatchInString:options:range:",  v8,  0,  0,  objc_msgSend(v8, "length")) == 0x7FFFFFFFFFFFFFFFLL && v37 == 0;

                    if (!v39)
                    {

                      v41 = (void *)[a3->var0 copy];
                      [v41 setScheme:v57];
                      [v41 URL];
                      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

                      goto LABEL_62;
                    }
                  }

                  uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v72 count:16];
                  if (v33) {
                    continue;
                  }
                  break;
                }
              }

              int v26 = v45;
              v28 = v49;
            }

            v24 = v54;
          }

          uint64_t v25 = [v54 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }

        while (v25);
      }

+ (id)iCloudEmailPrefsURL:(State *)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!a3->var3) {
    return 0LL;
  }
  [a3->var0 host];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lowercaseString];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 isEqualToString:@"setup.icloud.com"])
  {
    [a3->var0 query];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37
      && (BOOL HasCaseInsensitivePrefix = LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix( &a3->var0,  @"/email/prefs")))
    {
      BOOL var6 = a3->var6;
      LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)HasCaseInsensitivePrefix);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      if (var6)
      {
        if (v9) {
          +[_LSURLOverride(Functions) iCloudEmailPrefsURL:].cold.2();
        }

        [a3->var0 path];
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString hasPrefix:](v10, "hasPrefix:", @"/"))
        {
          uint64_t v11 = -[__CFString substringWithRange:](v10, "substringWithRange:", 1LL, -[__CFString length](v10, "length") - 1);

          uint64_t v10 = (__CFString *)v11;
        }

        uint64_t v35 = v10;
        if (v10 && -[__CFString length](v10, "length"))
        {
          id v12 = objc_alloc_init(MEMORY[0x189607A50]);
          [v12 setScheme:@"x-apple.systempreferences"];
          if (LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix( &a3->var0,  @"/email/prefs/family"))
          {
            v13 = @"com.apple.preferences.FamilySharingPrefPane";
          }

          else
          {
            v13 = @"com.apple.preferences.AppleIDPrefPane";
          }

          [v12 setPath:v13];
          id v14 = (void *)-[__CFString mutableCopy](v10, "mutableCopy");
          [v14 appendString:@"?"];
          [v14 appendString:v37];
          [v12 setQuery:v14];
          [v12 URL];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
        }

        else
        {
          uint64_t v15 = 0LL;
        }
      }

      else
      {
        if (v9) {
          +[_LSURLOverride(Functions) iCloudEmailPrefsURL:].cold.1();
        }

        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        [a3->var0 queryItems];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v43 != v19) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v42 + 1) + 8 * i) name];
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              char v22 = [v21 isEqualToString:@"path"];

              if ((v22 & 1) != 0)
              {

                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v38 = 0u;
                __int128 v39 = 0u;
                [a3->var0 queryItems];
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
                if (v25)
                {
                  uint64_t v26 = *(void *)v39;
                  uint64_t v35 = &stru_189D7B4C8;
                  while (2)
                  {
                    for (uint64_t j = 0LL; j != v25; ++j)
                    {
                      if (*(void *)v39 != v26) {
                        objc_enumerationMutation(v24);
                      }
                      v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                      [v28 name];
                      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                      [v29 lowercaseString];
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      int v31 = [v30 isEqual:@"path"];

                      if (v31)
                      {
                        v32 = (void *)NSString;
                        [v28 value];
                        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
                        [v32 stringWithFormat:@"ICLOUD_SERVICE/%@", v33];
                        uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

                        goto LABEL_42;
                      }
                    }

                    uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
                    if (v25) {
                      continue;
                    }
                    break;
                  }
                }

                else
                {
                  uint64_t v35 = &stru_189D7B4C8;
                }

+ (id)keynoteLiveURL:(State *)a3
{
  if ((LaunchServices::URLOverrides::State::isNooverride(&a3->var0) & 1) != 0)
  {
    v5 = 0LL;
  }

  else
  {
    objc_msgSend(a1, "keynoteLiveURL_noFragment:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)keynoteLiveURL_noFragment:(State *)a3
{
  BOOL v3 = !a3->var3 || !a3->var5;
  if (v3 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, @"/keynote-live"))
  {
    BOOL v9 = 0LL;
  }

  else
  {
    v5 = (void *)[a3->var0 copy];
    [v5 setScheme:@"com.apple.iwork.keynote-live"];
    v6 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    [v5 URL];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v6 isApplicationAvailableToOpenURL:v7 error:0];

    if (v8)
    {
      [v5 URL];
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [a3->var0 host];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 caseInsensitiveCompare:@"www.icloud.com"];

      if (v11)
      {
        BOOL v9 = 0LL;
      }

      else
      {
        [a3->var0 path];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 lastPathComponent];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        id v14 = objc_alloc_init(MEMORY[0x189607A50]);
        [v14 setScheme:@"x-keynote-live"];
        [v14 setHost:v13];
        [v14 URL];
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v9;
}

+ (id)iCloudFamilyURL:(State *)a3
{
  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudFamilyURL:].cold.1();
    }

    uint64_t v4 = 0LL;
  }

  else
  {
    [a3->var0 host];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 lowercaseString];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v7 isEqual:@"setup.icloud.com"])
    {
      [a3->var0 path];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 isEqual:@"/family/messages"])
      {
        BOOL v9 = (void *)[a3->var0 copy];
        [v9 setScheme:@"family"];
        [v9 setHost:@"messages"];
        [v9 setPath:0];
        [v9 URL];
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v4 = 0LL;
      }
    }

    else
    {
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

+ (id)iCloudSchoolworkURL:(State *)a3
{
  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.4();
    }
  }

  else if (a3->var5)
  {
    [a3->var0 fragment];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 pathComponents];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = (os_log_s *)[v6 mutableCopy];

    if (v3 && (uint64_t v7 = (LaunchServices::URLOverrides *)-[os_log_s count](v3, "count"), (unint64_t)v7 > 1))
    {
      -[os_log_s objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0LL);
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v23 caseInsensitiveCompare:@"schoolwork"];

      if (!v24)
      {
        uint64_t v35 = (void *)[a3->var0 copy];
        [v35 setScheme:@"schoolwork"];
        [v35 setHost:@"schoolwork"];
        -[os_log_s replaceObjectAtIndex:withObject:](v3, "replaceObjectAtIndex:withObject:", 0LL, &stru_189D7B4C8);
        v36 = -[os_log_s componentsJoinedByString:](v3, "componentsJoinedByString:", @"/");
        [v35 setPath:v36];

        [v35 setFragment:0];
        [v35 URL];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }

      LaunchServices::URLOverrides::getLog(v25);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.3(v8, v26, v27, v28, v29, v30, v31, v32);
      }
    }

    else
    {
      LaunchServices::URLOverrides::getLog(v7);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  else
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.1(v3, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  uint64_t v33 = 0LL;
LABEL_16:

  return v33;
}

+ (id)booksStoreAuthorizationURL:(State *)a3
{
  if (!a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) booksStoreAuthorizationURL:].cold.1();
    }

    goto LABEL_8;
  }

  if (!a3->var4
    || ([a3->var0 host],
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqual:@"www.audible.com"],
        v4,
        !v5))
  {
LABEL_8:
    uint64_t v7 = 0LL;
    return v7;
  }

  v6 = (void *)[a3->var0 copy];
  [v6 setScheme:@"ibooks"];
  [v6 URL];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.1()
{
}

- (void)initWithOriginalURL:(uint64_t)a1 checkingForAvailableApplications:.cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138478083;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_DEBUG,  "Error determining if app is available to open URL %{private}@: %{public}@",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.3()
{
}

- (void)initWithOriginalURL:(os_log_s *)a3 checkingForAvailableApplications:.cold.4( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a3,  (uint64_t)a3,  "URL %{private}@ was not an HTTP(S) or ITMS URL. Skipping URL overrides.",  (uint8_t *)a2);
}

- (void)initWithOriginalURL:(os_log_s *)a3 checkingForAvailableApplications:.cold.5( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a3, (uint64_t)a3, "Nothing overrode URL %{private}@", (uint8_t *)a2);
}

@end