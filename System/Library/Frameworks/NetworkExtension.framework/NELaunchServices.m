@interface NELaunchServices
+ (id)bundleProxyForIdentifier:(id)a3 uid:(unsigned int)a4 plugins:(id *)a5;
+ (id)lookupIdentifier:(id)a3 plugins:(id *)a4;
+ (id)pluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 uid:(unsigned int)a7;
+ (id)pluginClassToExtensionPoint:(int64_t)a3;
+ (id)pluginProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6;
@end

@implementation NELaunchServices

+ (id)pluginClassToExtensionPoint:(int64_t)a3
{
  else {
    return off_18A08E540[a3 - 2];
  }
}

+ (id)pluginProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    [MEMORY[0x189605778] pluginKitProxyForIdentifier:v9];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }

  [MEMORY[0x189605730] applicationProxyForIdentifier:v10];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    ne_log_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      id v12 = 0LL;
      goto LABEL_24;
    }

    *(_DWORD *)buf = 138412290;
    int64_t v38 = (int64_t)v10;
    v27 = "Failed to find application with bundle identifier %@";
LABEL_29:
    _os_log_error_impl(&dword_1876B1000, (os_log_t)v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    goto LABEL_22;
  }

  uint64_t v15 = [v13 appState];
  if (!v15) {
    goto LABEL_21;
  }
  v16 = (void *)v15;
  [v14 appState];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v17 isInstalled] & 1) == 0)
  {

    goto LABEL_21;
  }

  [v14 appState];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v19 = [v18 isValid];

  if ((v19 & 1) == 0)
  {
LABEL_21:
    ne_log_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    int64_t v38 = (int64_t)v10;
    v27 = "App %@ is not installed or is not valid";
    goto LABEL_29;
  }

  id v20 = v11;
  if (!v20)
  {
    +[NELaunchServices pluginClassToExtensionPoint:](&OBJC_CLASS___NELaunchServices, "pluginClassToExtensionPoint:", a5);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      ne_log_obj();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v38 = a5;
        _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "Failed to map plugin class %ld to an extension point",  buf,  0xCu);
      }

      goto LABEL_23;
    }
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  [v14 plugInKitPlugins];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v12 = (id)[obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    v30 = v14;
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        objc_msgSend(v23, "protocol", v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = [v24 isEqualToString:v20];

        if (v25)
        {
          id v12 = v23;
          goto LABEL_26;
        }
      }

      id v12 = (id)[obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }

+ (id)bundleProxyForIdentifier:(id)a3 uid:(unsigned int)a4 plugins:(id *)a5
{
  return +[NELaunchServices lookupIdentifier:plugins:]( &OBJC_CLASS___NELaunchServices,  "lookupIdentifier:plugins:",  a3,  a5);
}

+ (id)pluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 uid:(unsigned int)a7
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(&OBJC_CLASS___NEBundleProxy);
    [v7 bundleIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 bundleURL];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 machOUUIDs];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:]( v8,  "initWithIdentifier:url:machOUUIDs:name:appGroups:",  v9,  v10,  v11,  0LL,  0LL);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)lookupIdentifier:(id)a3 plugins:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x189605758] bundleProxyForIdentifier:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4) {
    *a4 = 0LL;
  }
  if (v6)
  {
    v42 = a4;
    [v6 objectForInfoDictionaryKey:*MEMORY[0x189604AA0] ofClass:objc_opt_class()];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      [v7 objectForInfoDictionaryKey:*MEMORY[0x189604E10] ofClass:objc_opt_class()];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    [v7 entitlementValueForKey:@"com.apple.security.application-groups" ofClass:objc_opt_class()];
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
    id v11 = v9;
    if (v10)
    {
      uint64_t v12 = v10;
      v13 = v8;
      uint64_t v14 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v11 = 0LL;
            goto LABEL_16;
          }
        }

        uint64_t v12 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v12) {
          continue;
        }
        break;
      }

      id v11 = v9;
LABEL_16:
      v8 = v13;
    }

    v16 = objc_alloc(&OBJC_CLASS___NEBundleProxy);
    [v7 bundleIdentifier];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 bundleURL];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 machOUUIDs];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:]( v16,  "initWithIdentifier:url:machOUUIDs:name:appGroups:",  v17,  v18,  v19,  v8,  v11);

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v42)
    {
      if ((isKindOfClass & 1) != 0)
      {
        [v7 plugInKitPlugins];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v22 count];

        if (v23)
        {
          v37 = v20;
          int64_t v38 = v11;
          uint64_t v39 = v8;
          id v41 = v5;
          id v24 = objc_alloc_init(MEMORY[0x189603FA8]);
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          v40 = v7;
          [v7 plugInKitPlugins];
          int v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v44;
            do
            {
              for (uint64_t j = 0LL; j != v27; ++j)
              {
                if (*(void *)v44 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                v31 = objc_alloc(&OBJC_CLASS___NEBundleProxy);
                [v30 bundleIdentifier];
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
                [v30 bundleURL];
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
                [v30 machOUUIDs];
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
                __int128 v35 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:]( v31,  "initWithIdentifier:url:machOUUIDs:name:appGroups:",  v32,  v33,  v34,  0LL,  0LL);

                [v24 addObject:v35];
              }

              uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }

            while (v27);
          }

          id *v42 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:v24];
          v7 = v40;
          id v5 = v41;
          id v11 = v38;
          v8 = v39;
          id v20 = v37;
        }
      }
    }
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v5;
      _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find %@ in LaunchServices", buf, 0xCu);
    }

    id v20 = 0LL;
  }

  return v20;
}

@end