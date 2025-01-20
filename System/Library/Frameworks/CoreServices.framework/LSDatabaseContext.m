@interface LSDatabaseContext
+ (LSDatabaseContext)new;
+ (LSDatabaseContext)sharedDatabaseContext;
- (BOOL)canAccess;
- (BOOL)isAccessing;
- (BOOL)startAccessingCurrentUserSessionReturningError:(id *)a3;
- (BOOL)startAccessingReturningError:(id *)a3;
- (BOOL)startAccessingSystemScopeReturningError:(id *)a3;
- (BOOL)startAccessingWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)startAccessingWithUserID:(unsigned int)a3 error:(id *)a4;
- (BOOL)startAccessingWithUserID:(unsigned int)a3 options:(unint64_t)a4 error:(id *)a5;
- (LSDatabaseContext)init;
- (NSData)currentPersistentIdentifier;
- (id)_init;
- (id)addDatabaseChangeObserver4WebKit:(id)a3;
- (void)accessCurrentUserSessionUsingBlock:(id)a3;
- (void)accessSystemScopeUsingBlock:(id)a3;
- (void)accessUsingBlock:(id)a3;
- (void)accessWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)accessWithUserID:(unsigned int)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)accessWithUserID:(unsigned int)a3 usingBlock:(id)a4;
- (void)getSystemContentDatabaseObject4WebKit:(id)a3;
- (void)observeDatabaseChange4WebKit:(id)a3;
- (void)releaseObservedDatabase4WebKit;
- (void)removeDatabaseChangeObserver4WebKit:(id)a3;
@end

@implementation LSDatabaseContext

+ (LSDatabaseContext)new
{
}

- (LSDatabaseContext)init
{
}

+ (LSDatabaseContext)sharedDatabaseContext
{
  if (+[LSDatabaseContext sharedDatabaseContext]::once != -1) {
    dispatch_once(&+[LSDatabaseContext sharedDatabaseContext]::once, &__block_literal_global_20);
  }
  return (LSDatabaseContext *)(id)+[LSDatabaseContext sharedDatabaseContext]::result;
}

void __42__LSDatabaseContext_sharedDatabaseContext__block_invoke()
{
  id v0 = -[LSDatabaseContext _init](objc_alloc(&OBJC_CLASS___LSDatabaseContext), "_init");
  v1 = (void *)+[LSDatabaseContext sharedDatabaseContext]::result;
  +[LSDatabaseContext sharedDatabaseContext]::result = (uint64_t)v0;
}

- (BOOL)canAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

- (BOOL)startAccessingReturningError:(id *)a3
{
  return _LSDatabaseContextStartAccessing(0LL, 0LL, a3);
}

- (BOOL)startAccessingWithOptions:(unint64_t)a3 error:(id *)a4
{
  return _LSDatabaseContextStartAccessing(0LL, a3, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 error:(id *)a4
{
  unsigned int v5 = a3;
  return _LSDatabaseContextStartAccessing(&v5, 0LL, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v6 = a3;
  return _LSDatabaseContextStartAccessing(&v6, a4, a5);
}

- (BOOL)isAccessing
{
  return LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self)[4] > 0LL;
}

- (NSData)currentPersistentIdentifier
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = (uint64_t *)*LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  if (!v2
    || (int CatalogTable = _CSStoreGetCatalogTable(),
        _LSPersistentIdentifierDataMake(v2, CatalogTable, 0, (uint64_t)v8),
        uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber(),
        *(_OWORD *)v7 = *(_OWORD *)v8,
        *(_OWORD *)&v7[12] = *(_OWORD *)&v8[12],
        *(void *)&v7[28] = SequenceNumber,
        (unsigned int v5 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:36]) == 0))
  {
    objc_msgSend(MEMORY[0x189603F48], "data", *(_OWORD *)v7, *(void *)&v7[16], *(_OWORD *)&v7[24]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSData *)v5;
}

- (id)addDatabaseChangeObserver4WebKit:(id)a3
{
  v14 = (void **)*LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  id v15 = 0LL;
  char v16 = 0;
  id v17 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v14, v4, 0LL);

  if (v5)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke;
    v13[3] = &unk_189D756C8;
    v13[4] = a3;
    unsigned int v6 = (void (**)(void, void))MEMORY[0x186E2A7B8](v13);
    v7 = +[_LSDServiceDomain defaultServiceDomain]();
    _LSContextAddChangeObserver(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8) {
      v6[2](v6, v5);
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;
  if (v14 && v16) {
    _LSContextDestroy(v14);
  }
  id v10 = v15;
  v14 = 0LL;
  id v15 = 0LL;

  char v16 = 0;
  id v11 = v17;
  id v17 = 0LL;

  return v9;
}

void __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke( uint64_t a1,  uint64_t *a2)
{
  unsigned int v6 = (FSNode *)objc_claimAutoreleasedReturnValue();
  getXPCObjectForNodeAndStore(v6, *(const __CSStore **)(*a2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)MEMORY[0x186E2A59C]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v5);
}

- (void)removeDatabaseChangeObserver4WebKit:(id)a3
{
}

- (void)getSystemContentDatabaseObject4WebKit:(id)a3
{
  uint64_t v4 = MEMORY[0x1895F87A8];
  v7[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v7[1] = (void (*)(void, void))3221225472LL;
  v7[2] = (void (*)(void, void))__81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke;
  v7[3] = (void (*)(void, void))&unk_189D72590;
  v7[4] = (void (*)(void, void))a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v7);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472LL;
  v6[2] = __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2;
  v6[3] = &unk_189D756F0;
  v6[4] = a3;
  [v5 getSystemContentStoreWithCompletionHandler:v6];
}

uint64_t __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2( uint64_t a1,  const __CSStore *a2,  FSNode *a3,  uint64_t a4)
{
  if (a4)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = getXPCObjectForNodeAndStore(a3, a2);
  }

  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)releaseObservedDatabase4WebKit
{
  id v9 = 0LL;
  id v6 = 0LL;
  id v7 = 0LL;
  char v8 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (LSSessionKey **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v6, v2, 0LL);

  if (v3) {
    _LSContextReleaseObservedChange(v3);
  }
  if (v6 && v8) {
    _LSContextDestroy(v6);
  }
  id v4 = v7;
  id v6 = 0LL;
  id v7 = 0LL;

  char v8 = 0;
  id v5 = v9;
  id v9 = 0LL;
}

- (void)observeDatabaseChange4WebKit:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a3 && object_getClass(a3) == (Class)MEMORY[0x1895F9250])
  {
    string = (FSNode *)xpc_dictionary_get_string(a3, "path");
    if (string) {
      string = -[FSNode initWithFileSystemRepresentation:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithFileSystemRepresentation:flags:error:",  string,  0LL,  0LL);
    }
    xpc_dictionary_get_value(a3, "store");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      id v6 = (const void *)_CSStoreCreateWithXPCRepresentation();
    }
    else {
      id v6 = 0LL;
    }

    xpc_dictionary_get_value(a3, "insecureProcessID");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = v7;
    if (v7 && object_getClass(v7) == (Class)MEMORY[0x1895F92F0])
    {
      int value = xpc_uint64_get_value(v8);

      BOOL v10 = v6 == 0LL;
      if (string && v6)
      {
        LaunchServices::DatabaseContext::getLog(v9);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = value;
          v12 = "Replacing local LS database with a copy pushed by process %llu.";
          v13 = v11;
          uint32_t v14 = 12;
          goto LABEL_18;
        }

- (void)accessUsingBlock:(id)a3
{
}

- (void)accessWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)accessWithUserID:(unsigned int)a3 usingBlock:(id)a4
{
  unsigned int v4 = a3;
  _LSDatabaseContextAccessUsingBlock(&v4, 0LL, (uint64_t)a4);
}

- (void)accessWithUserID:(unsigned int)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  unsigned int v5 = a3;
  _LSDatabaseContextAccessUsingBlock(&v5, a4, (uint64_t)a5);
}

- (BOOL)startAccessingSystemScopeReturningError:(id *)a3
{
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0LL, a3);

  return (char)a3;
}

- (void)accessSystemScopeUsingBlock:(id)a3
{
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0LL, (uint64_t)a3);
}

- (BOOL)startAccessingCurrentUserSessionReturningError:(id *)a3
{
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0LL, a3);

  return (char)a3;
}

- (void)accessCurrentUserSessionUsingBlock:(id)a3
{
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0LL, (uint64_t)a3);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSDatabaseContext;
  return -[LSDatabaseContext init](&v3, sel_init);
}

@end