@interface _LSCanOpenURLManager
+ (BindingEvaluator)bindingEvaluatorForScheme:(SEL)a3;
+ (_LSCanOpenURLManager)sharedManager;
+ (id)queryForApplicationsAvailableForOpeningURL:(id)a3;
- (BOOL)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7;
- (BOOL)findApplicationBundleID:(unsigned int *)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 forXPCConnection:(id)a6;
- (BOOL)internalCanOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7;
- (BOOL)isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7;
- (BOOL)isXPCConnection:(id)a3 allowedToCheckScheme:(id)a4 error:(id *)a5;
- (BOOL)legacy_isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7;
- (_LSCanOpenURLManager)init;
- (id)copySchemesMap;
- (int64_t)schemeTypeOfScheme:(id)a3;
- (unint64_t)schemeQueryLimit;
- (void)getIsURL:(id)a3 alwaysCheckable:(BOOL *)a4 hasHandler:(BOOL *)a5;
- (void)resetSchemeQueryLimitForApplicationWithIdentifier:(id)a3;
- (void)writeSchemesMap;
@end

@implementation _LSCanOpenURLManager

+ (_LSCanOpenURLManager)sharedManager
{
  if (+[_LSCanOpenURLManager sharedManager]::once != -1) {
    dispatch_once(&+[_LSCanOpenURLManager sharedManager]::once, &__block_literal_global_17);
  }
  return (_LSCanOpenURLManager *)(id)+[_LSCanOpenURLManager sharedManager]::result;
}

- (_LSCanOpenURLManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSCanOpenURLManager;
  v2 = -[_LSCanOpenURLManager init](&v9, sel_init);
  if (v2)
  {
    else {
      v3 = -[_LSCanOpenURLManager copySchemesMap](v2, "copySchemesMap");
    }
    canOpenURLsMap = v2->_canOpenURLsMap;
    v2->_canOpenURLsMap = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.launchservices.canopenurl", v5);
    canOpenURLsMapQueue = v2->_canOpenURLsMapQueue;
    v2->_canOpenURLsMapQueue = (OS_dispatch_queue *)v6;
  }

  return v2;
}

- (BOOL)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager canOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]");
  LOBYTE(a7) = -[_LSCanOpenURLManager internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]( self,  "internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:",  v12,  v10,  v9,  v13,  a7);

  return (char)a7;
}

- (int64_t)schemeTypeOfScheme:(id)a3
{
  v5 = (NSString *)a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager schemeTypeOfScheme:]");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 116, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];
  }

  int64_t v6 = _LSGetSchemeType(v5);

  return v6;
}

- (unint64_t)schemeQueryLimit
{
  return 50LL;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:]");
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    _LSDefaultLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:].cold.1();
    }
  }

  else if (v4)
  {
    MEMORY[0x186E2AFD4]();
    canOpenURLsMapQueue = (dispatch_queue_s *)self->_canOpenURLsMapQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __74___LSCanOpenURLManager_resetSchemeQueryLimitForApplicationWithIdentifier___block_invoke;
    v7[3] = &unk_189D74BF8;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(canOpenURLsMapQueue, v7);
  }
}

+ (id)queryForApplicationsAvailableForOpeningURL:(id)a3
{
  id v3 = a3;
  id v4 = -[_LSAvailableApplicationsForURLQuery initWithURL:]( objc_alloc(&OBJC_CLASS____LSAvailableApplicationsForURLQuery),  "initWithURL:",  v3);

  return v4;
}

- (void).cxx_destruct
{
}

- (void)writeSchemesMap
{
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    _LSDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[_LSCanOpenURLManager(PrivateSchemeChecking) writeSchemesMap].cold.1();
    }
  }

  else
  {
    canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke;
    v6[3] = &unk_189D72268;
    v6[4] = self;
    v6[5] = a2;
    _LSDispatchCoalescedAfterDelay((unsigned __int8 *)&self->_saveFlag, canOpenURLsMapQueue, v6, 1.0);
  }

- (id)copySchemesMap
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2 object:self file:@"LSCanOpenURLManager.mm" lineNumber:203 description:@"Failed to get URL for lsd-schemes file"];
  }

  id v5 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfURL:v4];
  if (!v5)
  {
    [MEMORY[0x1896078A8] defaultManager];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 path];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v6 fileExistsAtPath:v7];

    if ((v8 & 1) != 0)
    {
      _LSDefaultLog();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_LSCanOpenURLManager(PrivateSchemeChecking) copySchemesMap].cold.1();
      }
    }

    else
    {
      _LSDefaultLog();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "Scheme mapping file does not exist, creating file.",  v12,  2u);
      }
    }

    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v5;
}

- (BOOL)internalCanOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  v28[1] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  [v12 scheme];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 lowercaseString];
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    __int16 v26 = 0;
    -[_LSCanOpenURLManager getIsURL:alwaysCheckable:hasHandler:]( self,  "getIsURL:alwaysCheckable:hasHandler:",  v12,  &v26,  (char *)&v26 + 1);
    if ((_BYTE)v26
      || (BOOL v16 = -[_LSCanOpenURLManager isXPCConnection:allowedToCheckScheme:error:]( self,  "isXPCConnection:allowedToCheckScheme:error:",  v13,  v15,  a7),  LOBYTE(v26) = v16,  v16))
    {
      if (!HIBYTE(v26)) {
        goto LABEL_17;
      }
      if (v10 && v9) {
        goto LABEL_14;
      }
      uint64_t v17 = _LSGetSchemeType(v15);
      char v18 = v17 != 1 || v9;
      BOOL v19 = !v10;
      if (v17) {
        BOOL v19 = 0;
      }
      if (!v19 && (v18 & 1) != 0)
      {
LABEL_14:
        BOOL v20 = 1;
      }

      else
      {
LABEL_17:
        v22 = -[_LSURLOverride initWithOriginalURL:]( objc_alloc(&OBJC_CLASS____LSURLOverride),  "initWithOriginalURL:",  v12);
        v23 = v22;
        if (v22)
        {
          v24 = -[_LSURLOverride overrideURL](v22, "overrideURL");
          BOOL v20 = -[_LSCanOpenURLManager internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]( self,  "internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:",  v24,  v10,  v9,  v13,  a7);
        }

        else if (a7)
        {
          _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCCo nnection:error:]",  276LL,  0LL);
          BOOL v20 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          BOOL v20 = 0;
        }
      }
    }

    else
    {
      BOOL v20 = 0;
    }

    LOBYTE(a7) = v20;
  }

  else if (a7)
  {
    uint64_t v27 = *MEMORY[0x189607490];
    v28[0] = @"url";
    [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]",  282LL,  v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (void)getIsURL:(id)a3 alwaysCheckable:(BOOL *)a4 hasHandler:(BOOL *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 293, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }

  [v9 scheme];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ([v10 caseInsensitiveCompare:@"com-apple-audiounit"])
    {
      id v12 = (void *)objc_opt_class();
      if (v12)
      {
        [v12 bindingEvaluatorForScheme:v11];
      }

      else
      {
        uint64_t v29 = 0LL;
        memset(v28, 0, sizeof(v28));
      }

      id v27 = 0LL;
      v24 = 0LL;
      id v25 = 0LL;
      char v26 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v14 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v24, v15, 0LL);

      if (v14)
      {
        LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)v28, v14, 0LL, &v19);
        BOOL v13 = v23 != 0;
        if (v23)
        {
          if (v20) {
            LOBYTE(v14) = *(_BYTE *)(v20 + 156) & 1;
          }
          else {
            LOBYTE(v14) = 0;
          }
        }

        else
        {
          LOBYTE(v14) = 0;
        }
      }

      else
      {
        BOOL v13 = 0;
      }

      if (v24 && v26) {
        _LSContextDestroy(v24);
      }
      id v16 = v25;
      v24 = 0LL;
      id v25 = 0LL;

      char v26 = 0;
      id v17 = v27;
      id v27 = 0LL;

      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v28);
    }

    else
    {
      BOOL v13 = 1;
      LOBYTE(v14) = 1;
    }
  }

  else
  {
    BOOL v13 = 0;
    LOBYTE(v14) = 0;
  }

  if (a4) {
    *a4 = (char)v14;
  }
  if (a5) {
    *a5 = v13;
  }
}

- (BOOL)isXPCConnection:(id)a3 allowedToCheckScheme:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      [MEMORY[0x1896077D8] currentHandler];
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 335, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];
    }

    id v29 = 0LL;
    char v26 = 0LL;
    id v27 = 0LL;
    char v28 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    id v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v12, 0LL);

    if (v13)
    {
      unsigned int v25 = 0;
      uint64_t v24 = 0LL;
      if (!-[_LSCanOpenURLManager findApplicationBundleID:bundleData:context:forXPCConnection:]( self,  "findApplicationBundleID:bundleData:context:forXPCConnection:",  &v25,  &v24,  v13,  v9)
        || v24 && (*(_BYTE *)(v24 + 156) & 1) != 0)
      {
        BOOL v16 = 1;
      }

      else
      {
        __int128 v14 = *(_OWORD *)(v24 + 76);
        __int128 v31 = *(_OWORD *)(v24 + 60);
        __int128 v32 = v14;
        _LSMakeVersionNumber(9LL, 0LL, 0LL, v30);
        v34[0] = v31;
        v34[1] = v32;
        v33[0] = v30[0];
        v33[1] = v30[1];
        if ((unint64_t)_LSVersionNumberCompare(v34, v33) > 1) {
          BOOL v15 = -[_LSCanOpenURLManager legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]( self,  "legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:",  v25,  v24,  v13,  v11,  a5);
        }
        else {
          BOOL v15 = -[_LSCanOpenURLManager isBundleID:bundleData:context:allowedToCheckScheme:error:]( self,  "isBundleID:bundleData:context:allowedToCheckScheme:error:",  v25,  v24,  v13,  v11,  a5);
        }
        BOOL v16 = v15;
      }
    }

    else if (a5)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v17, 0LL);

      if (v18) {
        id v19 = 0LL;
      }
      else {
        id v19 = v29;
      }
      BOOL v16 = 0;
      *a5 = v19;
    }

    else
    {
      BOOL v16 = 0;
    }

    if (v26 && v28) {
      _LSContextDestroy(v26);
    }
    id v20 = v27;
    char v26 = 0LL;
    id v27 = 0LL;

    char v28 = 0;
    id v21 = v29;
    id v29 = 0LL;
  }

  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)findApplicationBundleID:(unsigned int *)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 forXPCConnection:(id)a6
{
  id v11 = a6;
  id v12 = v11;
  if (a5 && a5->db)
  {
    if (v11) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 391, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 392, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

LABEL_4:
  [v12 _xpcConnection];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = (void *)_LSCopyBundleURLForXPCConnection(v13, 0);

  if (v14)
  {
    BOOL v15 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v14,  0LL,  0LL);
    if (v15)
    {
      if (_LSBundleFindWithNode(a5, v15, a3, a4))
      {

        [v14 path];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v16 rangeOfString:@".app/" options:4];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v19 = 0;
        }

        else
        {
          [v16 substringToIndex:v17 + v18];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          id v21 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v20 isDirectory:1];
          id v22 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v21,  0LL,  0LL);
          if (v22) {
            BOOL v19 = _LSBundleFindWithNode(a5, v22, a3, a4) == 0;
          }
          else {
            BOOL v19 = 0;
          }
        }

        BOOL v15 = 0LL;
      }

      else
      {
        BOOL v19 = 1;
      }
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v13 = a6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 426, @"Invalid parameter not satisfying: %@", @"bundleID != kCSStoreNullID" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_4;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 427, @"Invalid parameter not satisfying: %@", @"bundleData != NULL" object file lineNumber description];

  if (!a5)
  {
LABEL_17:
    [MEMORY[0x1896077D8] currentHandler];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 428, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }

- (BOOL)legacy_isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v13 = a6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 461, @"Invalid parameter not satisfying: %@", @"bundleID != kCSStoreNullID" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_35;
      }
      goto LABEL_4;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 462, @"Invalid parameter not satisfying: %@", @"bundleData != NULL" object file lineNumber description];

  if (!a5)
  {
LABEL_35:
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 463, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }

+ (BindingEvaluator)bindingEvaluatorForScheme:(SEL)a3
{
  id v5 = operator new(8uLL);
  __p = v5;
  void *v5 = 0xE00000002LL;
  char v8 = v5 + 1;
  id v9 = v5 + 1;
  LaunchServices::BindingEvaluator::setAllowedBundleClasses((uint64_t)retstr, (uint64_t)&__p);
  result = (BindingEvaluator *)__p;
  if (__p)
  {
    char v8 = __p;
    operator delete(__p);
  }

  return result;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:.cold.1()
{
}

@end