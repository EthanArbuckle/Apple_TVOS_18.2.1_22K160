@interface LSPlugInQuery
+ (BOOL)supportsSecureCoding;
+ (id)pluginQuery;
+ (id)pluginQueryWithIdentifier:(id)a3;
+ (id)pluginQueryWithQueryDictionary:(id)a3 applyFilter:(id)a4;
+ (id)pluginQueryWithURL:(id)a3;
+ (id)pluginQueryWithUUID:(id)a3;
- (BOOL)_remoteResolutionIsExpensive;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6;
@end

@implementation LSPlugInQuery

+ (id)pluginQuery
{
  return -[LSPlugInQuery _init](objc_alloc(&OBJC_CLASS___LSPlugInQueryAll), "_init");
}

+ (id)pluginQueryWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[LSPlugInQueryWithQueryDictionary _initWithQueryDictionary:applyFilter:]( objc_alloc(&OBJC_CLASS___LSPlugInQueryWithQueryDictionary),  "_initWithQueryDictionary:applyFilter:",  v6,  v5);

  return v7;
}

+ (id)pluginQueryWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:]( objc_alloc(&OBJC_CLASS___LSPlugInQueryWithIdentifier),  "_initWithIdentifier:inMap:",  v3,  9LL);

  return v4;
}

+ (id)pluginQueryWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___LSPlugInQueryWithIdentifier);
  [v3 UUIDString];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:](v4, "_initWithIdentifier:inMap:", v5, 11LL);
  return v6;
}

+ (id)pluginQueryWithURL:(id)a3
{
  id v3 = a3;
  id v4 = -[LSPlugInQueryWithURL _initWithURL:](objc_alloc(&OBJC_CLASS___LSPlugInQueryWithURL), "_initWithURL:", v3);

  return v4;
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  v12 = (uint64_t (**)(void, void, void))v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_22:
    [MEMORY[0x1896077D8] currentHandler];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 96, @"Invalid parameter not satisfying: %@", @"yield != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 95, @"Invalid parameter not satisfying: %@", @"pluginIDs != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_22;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_23:
  [MEMORY[0x1896077D8] currentHandler];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 handleFailureInMethod:a2, self, @"LSPlugInQuery.m", 97, @"Invalid parameter not satisfying: %@", @"context != NULL" object file lineNumber description];

LABEL_4:
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    v16 = &off_189D70000;
    v30 = a6;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x186E2A59C]();
        uint64_t v20 = [v18 unsignedLongLongValue];
        [v16[241] plugInKitProxyForPlugin:v20 withContext:a6];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if ((((uint64_t (**)(void, void *, void))v12)[2](v12, v21, 0LL) & 1) == 0)
          {

            objc_autoreleasePoolPop(v19);
            goto LABEL_20;
          }
        }

        else
        {
          v22 = (uint64_t *)a6;
          v23 = v12;
          v24 = v16;
          if (_LSGetPlugin(*v22, v20)) {
            v25 = (__CFString *)_CSStringCopyCFString();
          }
          else {
            v25 = @"<unknown>";
          }
          _LSDefaultLog();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            __int16 v38 = 2048;
            uint64_t v39 = v20;
            _os_log_error_impl( &dword_183E58000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to create LSPlugInKitProxy object (after sorting) for %@ (%llu)",  buf,  0x16u);
          }

          v16 = v24;
          v12 = v23;
          a6 = v30;
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }

      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v14);
  }

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v12 = 0LL;
  uint64_t v13 = (void **)&v12;
  uint64_t v14 = 0x3812000000LL;
  uint64_t v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  uint64_t v17 = 256LL;
  id v18 = 0LL;
  if (v6)
  {
    _LSDefaultLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQuery _enumerateWithXPCConnection:block:].cold.1(v8);
    }

    v9 = v13 + 6;
  }

  else
  {
    v9 = &v18;
  }

  int v10 = _LSContextInit(v9);
  if (v10)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v10,  (uint64_t)"-[LSPlugInQuery _enumerateWithXPCConnection:block:]",  171LL,  0LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v11);
  }

  else
  {
    [MEMORY[0x189603FE0] set];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    _CSStoreEnumerateUnits();
    -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 0LL, v11, v7, v13 + 6);
    _LSContextDestroy(v13 + 6);
  }

  _Block_object_dispose(&v12, 8);
}

void __51__LSPlugInQuery__enumerateWithXPCConnection_block___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (_LSPluginIsValid(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL), a2, a3, 0LL, 0, 0LL))
  {
    if (_LSPluginCheckExtensionPoint(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL), a2, a3, 0LL))
    {
      id v6 = *(void **)(a1 + 32);
      [MEMORY[0x189607968] numberWithUnsignedInt:a2];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v7];
    }
  }

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSPlugInQuery;
  id v3 = -[_LSQuery _init](&v6, sel__init);
  if (v3 && [v3 isMemberOfClass:objc_opt_class()])
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:v3 file:@"LSPlugInQuery.m" lineNumber:186 description:@"cannot directly instantiate LSPlugInQuery"];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LSPlugInQuery;
  if (-[_LSQuery isEqual:](&v7, sel_isEqual_, v4))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSPlugInQuery;
  return -[_LSQuery hash](&v3, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
  }

- (void)_enumerateWithXPCConnection:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "LSPlugInQuery for enumerating all plugins called from a processs that cannot map the database",  v1,  2u);
}

@end