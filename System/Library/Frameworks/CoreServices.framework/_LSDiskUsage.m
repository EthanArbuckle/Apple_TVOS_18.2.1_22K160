@interface _LSDiskUsage
+ (BOOL)supportsSecureCoding;
+ (id)ODRConnection;
+ (id)ODRUsageForBundleIdentifier:(id)a3 error:(id *)a4;
+ (id)_serverQueue;
+ (id)mobileInstallationQueue;
+ (id)propertyQueue;
+ (id)usageFromMobileInstallationForBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_fetchWithXPCConnection:(id)a3 error:(id *)a4;
- (BOOL)fetchClientSideWithError:(id *)a3;
- (BOOL)fetchServerSideWithConnection:(id)a3 error:(id *)a4;
- (NSNumber)dynamicUsage;
- (NSNumber)onDemandResourcesUsage;
- (NSNumber)sharedUsage;
- (NSNumber)staticUsage;
- (_LSDiskUsage)init;
- (_LSDiskUsage)initWithCoder:(id)a3;
- (id)_initWithBundleIdentifier:(id)a3 alreadyKnownUsage:(id)a4 validationToken:(id)a5;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllCachedUsageValues;
@end

@implementation _LSDiskUsage

- (id)_initWithBundleIdentifier:(id)a3 alreadyKnownUsage:(id)a4 validationToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____LSDiskUsage;
  v11 = -[_LSDiskUsage init](&v17, sel_init);
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    if (v9 && [v9 count]) {
      uint64_t v14 = [v9 mutableCopy];
    }
    else {
      uint64_t v14 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4];
    }
    usage = v11->_usage;
    v11->_usage = (NSMutableDictionary *)v14;

    objc_storeStrong(&v11->_validationToken, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (_LSDiskUsage)init
{
}

- (NSNumber)staticUsage
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  id v12 = 0LL;
  [(id)objc_opt_class() propertyQueue];
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __27___LSDiskUsage_staticUsage__block_invoke;
  v6[3] = &unk_189D748F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)dynamicUsage
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  id v12 = 0LL;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0LL, 0LL))
  {
    [(id)objc_opt_class() propertyQueue];
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __28___LSDiskUsage_dynamicUsage__block_invoke;
    v6[3] = &unk_189D748F0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)onDemandResourcesUsage
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  id v12 = 0LL;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0LL, 0LL))
  {
    [(id)objc_opt_class() propertyQueue];
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __38___LSDiskUsage_onDemandResourcesUsage__block_invoke;
    v6[3] = &unk_189D748F0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)sharedUsage
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  id v12 = 0LL;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0LL, 0LL))
  {
    [(id)objc_opt_class() propertyQueue];
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __27___LSDiskUsage_sharedUsage__block_invoke;
    v6[3] = &unk_189D748F0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)removeAllCachedUsageValues
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke;
  block[3] = &unk_189D741C8;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

- (id)debugDescription
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  id v12 = 0LL;
  [(id)objc_opt_class() propertyQueue];
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32___LSDiskUsage_debugDescription__block_invoke;
  v6[3] = &unk_189D748F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [(id)objc_opt_class() propertyQueue];
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32___LSDiskUsage_encodeWithCoder___block_invoke;
  block[3] = &unk_189D74BF8;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  dispatch_sync(v5, block);

  [v6 encodeObject:self->_validationToken forKey:@"validationToken"];
}

- (_LSDiskUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  objc_msgSend( v4,  "ls_decodeDictionaryWithKeysOfClass:valuesOfClass:forKey:",  v6,  objc_opt_class(),  @"knownUsage");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"validationToken");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[_LSDiskUsage _initWithBundleIdentifier:alreadyKnownUsage:validationToken:]( self,  "_initWithBundleIdentifier:alreadyKnownUsage:validationToken:",  v5,  v7,  v8);

  return v9;
}

+ (id)_serverQueue
{
  if (+[_LSDiskUsage(Internal) _serverQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Internal) _serverQueue]::once, &__block_literal_global_24);
  }
  return (id)+[_LSDiskUsage(Internal) _serverQueue]::result;
}

- (BOOL)_fetchWithXPCConnection:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = self->_bundleIdentifier;
  if (!v7)
  {
    uint64_t v22 = *MEMORY[0x189607490];
    v23[0] = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDiskUsage(Internal) _fetchWithXPCConnection:error:]",  249LL,  v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  [(id)objc_opt_class() propertyQueue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke;
  block[3] = &unk_189D748F0;
  void block[4] = self;
  void block[5] = &v18;
  dispatch_sync(v8, block);

  if (*((_BYTE *)v19 + 24))
  {
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      uint64_t v16 = 0LL;
      uint64_t v9 = (id *)&v16;
      BOOL v10 = -[_LSDiskUsage fetchServerSideWithConnection:error:](self, "fetchServerSideWithConnection:error:", v6, &v16);
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v9 = (id *)&v15;
      BOOL v10 = -[_LSDiskUsage fetchClientSideWithError:](self, "fetchClientSideWithError:", &v15);
    }

    BOOL v13 = v10;
    id v12 = *v9;
  }

  else
  {
    id v12 = 0LL;
    BOOL v13 = 1;
  }

  _Block_object_dispose(&v18, 8);
  if (a4)
  {
LABEL_11:
    if (!v13) {
      *a4 = v12;
    }
  }

+ (id)propertyQueue
{
  if (+[_LSDiskUsage(Private) propertyQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) propertyQueue]::once, &__block_literal_global_63);
  }
  return (id)+[_LSDiskUsage(Private) propertyQueue]::result;
}

+ (id)mobileInstallationQueue
{
  if (+[_LSDiskUsage(Private) mobileInstallationQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) mobileInstallationQueue]::once, &__block_literal_global_65);
  }
  return (id)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;
}

+ (id)usageFromMobileInstallationForBundleIdentifier:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    [a1 mobileInstallationQueue];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke;
    objc_super v17 = &unk_189D75CC0;
    id v18 = v6;
    _LSDispatchWithTimeout(v7, &v14, 5.0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "result", v14, v15, v16, v17);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v9 == 0LL;

    if (v10)
    {
      [v8 error];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0LL;
    }

    else
    {
      [v8 result];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = *MEMORY[0x189607490];
    v20[0] = @"invalid bundleIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]",  331LL,  v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0LL;
  }

  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

+ (id)ODRConnection
{
  if (+[_LSDiskUsage(Private) ODRConnection]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) ODRConnection]::once, &__block_literal_global_74_0);
  }
  return (id)+[_LSDiskUsage(Private) ODRConnection]::result;
}

+ (id)ODRUsageForBundleIdentifier:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v21 = *MEMORY[0x189607490];
    v22[0] = @"invalid bundleIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[_LSDiskUsage(Private) ODRUsageForBundleIdentifier:error:]",  400LL,  v13);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }

  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke;
  v18[3] = &unk_189D75D50;
  id v20 = a1;
  id v19 = v6;
  _LSDispatchWithTimeout(0LL, v18, 5.0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 result];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v9 == 0LL;

  if (v10)
  {
    [v8 error];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = v19;
    goto LABEL_7;
  }

  [v8 result];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  id v12 = 0LL;
  if (v11) {
    goto LABEL_16;
  }
LABEL_8:
  [v12 domain];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v14 isEqual:*MEMORY[0x189607688]])
  {
    BOOL v15 = [v12 code] == 60;

    if (!v15) {
      goto LABEL_13;
    }
    _LSDefaultLog();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl( &dword_183E58000,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "timeout waiting for ODR daemon bytesUsedForApplicationWithBundleID to return",  v17,  2u);
    }
  }

LABEL_13:
  if (a4)
  {
    id v12 = v12;
    v11 = 0LL;
    *a4 = v12;
  }

  else
  {
    v11 = 0LL;
  }

- (BOOL)fetchServerSideWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]");
  if ([(id)__LSDefaultsGetSharedInstance() isInSyncBubble])
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "cannot calculate disk usage per bundle in the sync bubble",  buf,  2u);
    }

    uint64_t v8 = 424LL;
    uint64_t v9 = (void **)&LSApplicationWorkspaceErrorDomain;
    uint64_t v10 = 110LL;
    goto LABEL_11;
  }

  if (!+[_LSBundleIDValidationToken isToken:correctForBundleIdentifier:connection:]( (uint64_t)&OBJC_CLASS____LSBundleIDValidationToken,  self->_validationToken,  self->_bundleIdentifier,  v6))
  {
    uint64_t v8 = 428LL;
    uint64_t v10 = -54LL;
    uint64_t v9 = (void **)MEMORY[0x189607670];
LABEL_11:
    _LSMakeNSErrorImpl(*v9, v10, (uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]", v8, 0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  id v11 = (id)-[NSMutableDictionary mutableCopy](self->_usage, "mutableCopy");
  if (!v11)
  {
    id v15 = 0LL;
LABEL_12:
    BOOL v21 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  id v12 = (void *)objc_opt_class();
  bundleIdentifier = self->_bundleIdentifier;
  id v26 = 0LL;
  [v12 usageFromMobileInstallationForBundleIdentifier:bundleIdentifier error:&v26];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v26;
  if (v14)
  {
    [v11 addEntriesFromDictionary:v14];

    uint64_t v16 = (void *)objc_opt_class();
    objc_super v17 = self->_bundleIdentifier;
    id v25 = v15;
    [v16 ODRUsageForBundleIdentifier:v17 error:&v25];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = v25;

    if (v18)
    {
      [v11 setObject:v18 forKeyedSubscript:@"ODR"];

      [(id)objc_opt_class() propertyQueue];
      id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      void v23[2] = __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke;
      v23[3] = &unk_189D74BF8;
      v23[4] = self;
      id v24 = v11;
      id v11 = v11;
      dispatch_barrier_async(v20, v23);

      BOOL v21 = 1;
    }

    else
    {
      BOOL v21 = 0;
    }

    id v15 = v19;
  }

  else
  {
    BOOL v21 = 0;
  }

  if (a4)
  {
LABEL_13:
    if (!v21) {
      *a4 = v15;
    }
  }

- (BOOL)fetchClientSideWithError:(id *)a3
{
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__14;
  uint64_t v16 = __Block_byref_object_dispose__14;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v11[1] = (void (*)(void, void))3221225472LL;
  v11[2] = (void (*)(void, void))__50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke;
  v11[3] = (void (*)(void, void))&unk_189D75D78;
  v11[4] = (void (*)(void, void))self;
  v11[5] = (void (*)(void, void))&v12;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v11);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_127;
  v10[3] = &unk_189D75DA0;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  [v6 getDiskUsage:self completionHandler:v10];
  int v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((_BYTE *)v19 + 24))
  {
    *a3 = (id) v13[5];
    int v7 = *((unsigned __int8 *)v19 + 24);
  }

  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

@end