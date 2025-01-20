@interface LSAltIconManager
+ (id)sharedInstance;
- (BOOL)_setAlternateIconName:(id)a3 forIdentifier:(id)a4 withIconsDictionary:(id)a5 error:(id *)a6;
- (BOOL)isValidAlternateIcon:(id)a3 forIconsDict:(id)a4;
- (LSAltIconManager)init;
- (id)_getPreferredIconNameForIdentifier:(id)a3;
- (id)alternateIconNameForIdentifier:(id)a3 error:(id *)a4;
- (void)_setPreferredIconName:(id)a3 forIdentifier:(id)a4;
- (void)clearAlternateNameForBundleIdentifier:(id)a3 validationDictionary:(id)a4;
- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6;
@end

@implementation LSAltIconManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  return (id)sharedInstance_sharedInstance;
}

void __34__LSAltIconManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LSAltIconManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (LSAltIconManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSAltIconManager;
  return -[LSAltIconManager init](&v3, sel_init);
}

- (void)clearAlternateNameForBundleIdentifier:(id)a3 validationDictionary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = -[LSAltIconManager _getPreferredIconNameForIdentifier:](self, "_getPreferredIconNameForIdentifier:", v6);
    if (v8) {
      int v9 = !-[LSAltIconManager isValidAlternateIcon:forIconsDict:](self, "isValidAlternateIcon:forIconsDict:", v8, v7);
    }
    else {
      int v9 = 0;
    }
  }

  else
  {
    int v9 = 1;
  }

  if (_LSIconsLog_onceToken != -1) {
    dispatch_once(&_LSIconsLog_onceToken, &__block_literal_global_33);
  }
  v10 = (os_log_s *)_LSIconsLog_log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog_log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"won't";
    if (v9) {
      v11 = @"will";
    }
    int v12 = 138412546;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_DEFAULT,  "clearAlternateNameForBundleIdentifier: %@ clear for %@",  (uint8_t *)&v12,  0x16u);
  }

  if (v9) {
    -[LSAltIconManager _setPreferredIconName:forIdentifier:](self, "_setPreferredIconName:forIdentifier:", 0LL, v6);
  }
}

- (id)alternateIconNameForIdentifier:(id)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1895F89C0];
  v5 = -[LSAltIconManager _getPreferredIconNameForIdentifier:](self, "_getPreferredIconNameForIdentifier:", a3);
  if (!v5)
  {
    uint64_t v9 = *MEMORY[0x1896075E0];
    v10[0] = @"no AlternateName found for app";
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  109LL,  (uint64_t)"-[LSAltIconManager alternateIconNameForIdentifier:error:]",  90LL,  v8);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v6 = 0LL;
  if (a4) {
LABEL_3:
  }
    *a4 = v6;
LABEL_4:

  return v5;
}

- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6
{
  v40[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[LSAltIconManager setAlternateIconName:forIdentifier:iconsDictionary:reply:]");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v14 = v12;
    id v15 = 0LL;
  }

  else
  {
    uint64_t v39 = *MEMORY[0x1896075E0];
    v40[0] = @"CFBundleIcons dictionary is missing or incorrect type";
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  -105LL,  (uint64_t)"-[LSAltIconManager setAlternateIconName:forIdentifier:iconsDictionary:reply:]",  109LL,  v16);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0LL, v15);
    id v14 = 0LL;
  }

  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0LL;
  _LSServer_DatabaseExecutionContext();
  v17 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __77__LSAltIconManager_setAlternateIconName_forIdentifier_iconsDictionary_reply___block_invoke;
  v25[3] = &unk_189D722F0;
  v27 = &v28;
  id v18 = v11;
  id v26 = v18;
  -[LSDBExecutionContext syncRead:](v17, v25);

  if (v10 && !v14)
  {
    if ([v10 isEqualToString:@"CFBundlePrimaryIcon"])
    {
      id v14 = 0LL;
    }

    else
    {
      if (_LSIconsLog_onceToken != -1) {
        dispatch_once(&_LSIconsLog_onceToken, &__block_literal_global_33);
      }
      v19 = (os_log_s *)_LSIconsLog_log;
      if (os_log_type_enabled((os_log_t)_LSIconsLog_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v10;
        __int16 v37 = 2112;
        id v38 = v18;
        _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_DEFAULT,  "Setting alternate icon name %@ for app %@",  buf,  0x16u);
      }

      [(id)v29[5] iconsDictionary];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  id v24 = v15;
  BOOL v20 = -[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:]( self,  "_setAlternateIconName:forIdentifier:withIconsDictionary:error:",  v10,  v18,  v14,  &v24);
  id v21 = v24;

  if (v20)
  {
    v22 = +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    uint64_t v34 = v29[5];
    [MEMORY[0x189603F18] arrayWithObjects:&v34 count:1];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 sendNotification:13 forAppProxies:v23 Plugins:0 completion:0];
  }

  v13[2](v13, v20, v21);

  _Block_object_dispose(&v28, 8);
}

void __77__LSAltIconManager_setAlternateIconName_forIdentifier_iconsDictionary_reply___block_invoke( uint64_t a1)
{
  uint64_t v2 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  *(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_getPreferredIconNameForIdentifier:(id)a3
{
  CFPropertyListRef v3 = CFPreferencesCopyValue( (CFStringRef)a3,  @"com.apple.lsd.iconNames",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  v4 = (void *)v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      v4 = 0LL;
    }
  }

  return v4;
}

- (void)_setPreferredIconName:(id)a3 forIdentifier:(id)a4
{
}

- (BOOL)isValidAlternateIcon:(id)a3 forIconsDict:(id)a4
{
  id v5 = a3;
  [a4 objectForKey:@"CFBundleAlternateIcons"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray() && ([v6 containsObject:v5] & 1) != 0)
  {
    BOOL v7 = 1;
  }

  else if (_NSIsNSDictionary())
  {
    [v6 objectForKey:v5];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v8 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_setAlternateIconName:(id)a3 forIdentifier:(id)a4 withIconsDictionary:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 || ([v10 isEqualToString:@"CFBundlePrimaryIcon"] & 1) != 0)
  {
    id v13 = 0LL;
LABEL_4:
    -[LSAltIconManager _setPreferredIconName:forIdentifier:](self, "_setPreferredIconName:forIdentifier:", v13, v11);
    BOOL v14 = 1;
    goto LABEL_13;
  }

  if (v12)
  {
    if (-[LSAltIconManager isValidAlternateIcon:forIconsDict:](self, "isValidAlternateIcon:forIconsDict:", v10, v12))
    {
      id v13 = v10;
      goto LABEL_4;
    }

    uint64_t v25 = *MEMORY[0x1896075E0];
    v26[0] = @"iconName not found in CFBundleAlternateIcons entry";
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 189LL;
  }

  else
  {
    uint64_t v23 = *MEMORY[0x1896075E0];
    id v24 = @"CFBundleIcons dictionary is missing or incorrect type";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 193LL;
  }

  _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  -105LL,  (uint64_t)"-[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:]",  v16,  v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v17 = (void *)*MEMORY[0x189607460];
  uint64_t v21 = *MEMORY[0x189607798];
  id v22 = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl( v17,  4LL,  (uint64_t)"-[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:]",  201LL,  v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6) {
    *a6 = v19;
  }

  BOOL v14 = 0;
LABEL_13:

  return v14;
}

@end