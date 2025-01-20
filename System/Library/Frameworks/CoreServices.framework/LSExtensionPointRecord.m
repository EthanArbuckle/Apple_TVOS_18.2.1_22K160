@interface LSExtensionPointRecord
+ (BOOL)isCurrentProcessAnApplicationExtension;
+ (BOOL)supportsSecureCoding;
+ (LSExtensionPointRecord)extensionPointRecordForCurrentProcess;
+ (NSString)identifierForCurrentProcess;
+ (id)_propertyClasses;
+ (id)enumerator;
+ (id)enumeratorForExtensionPointIdentifier:(id)a3;
+ (id)enumeratorWithParentApplicationRecord:(id)a3;
+ (void)identifierForCurrentProcess;
+ (void)setExtensionPointRecordForCurrentProcess:(id)a3;
- (LSApplicationRecord)parentAppRecord;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 error:(id *)a4;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 parentAppRecord:(id)a4 error:(id *)a5;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 parentAppRecord:(id)a5 error:(id *)a6;
- (LSPropertyList)SDKDictionary;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (id)SDKDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)nameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)parentAppRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)TCCPolicy;
- (unsigned)TCCPolicyWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)extensionPointType;
- (unsigned)extensionPointTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)platform;
- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (void)_LSRecord_resolve_SDKDictionary;
- (void)_LSRecord_resolve_identifier;
- (void)_LSRecord_resolve_name;
- (void)_LSRecord_resolve_parentAppRecord;
- (void)_LSRecord_resolve_version;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSExtensionPointRecord

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 error:(id *)a4
{
  return -[LSExtensionPointRecord initWithIdentifier:parentAppRecord:error:]( self,  "initWithIdentifier:parentAppRecord:error:",  a3,  0LL,  a4);
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 parentAppRecord:(id)a4 error:(id *)a5
{
  return -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]( self,  "initWithIdentifier:platform:parentAppRecord:error:",  a3,  dyld_get_active_platform(),  a4,  a5);
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  return -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]( self,  "initWithIdentifier:platform:parentAppRecord:error:",  a3,  *(void *)&a4,  0LL,  a5);
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 parentAppRecord:(id)a5 error:(id *)a6
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 handleFailureInMethod:a2, self, @"LSExtensionPointRecord.mm", 76, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier != nil" object file lineNumber description];
  }

  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    p_CurrentContext = 0LL;
    LOBYTE(v44) = 0;
    v45 = 0LL;
    +[_LSDServiceDomain defaultServiceDomain]();
    v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v12 = (void **)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v11,  0LL);

    if (v12)
    {
      LODWORD(v34[0]) = 0;
      uint64_t v36 = 0LL;
      if (a5) {
        uint64_t v13 = [a5 unitID];
      }
      else {
        uint64_t v13 = 0LL;
      }
      int v22 = _LSExtensionPointFindWithIdentifier(*v12, (const __CFString *)a3, a4, v13, v34, &v36);
      if (_LSGetNSErrorFromOSStatusImpl( v22,  a6,  (uint64_t)"-[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]",  85LL))
      {
        uint64_t v23 = *((unsigned int *)*v12 + 402);
        v33.receiver = self;
        v33.super_class = (Class)&OBJC_CLASS___LSExtensionPointRecord;
        v24 = -[LSRecord _initWithContext:tableID:unitID:]( &v33,  sel__initWithContext_tableID_unitID_,  v12,  v23,  LODWORD(v34[0]));
        goto LABEL_29;
      }
    }

    else if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v19, 0LL);

      if (v20) {
        v21 = 0LL;
      }
      else {
        v21 = v45;
      }
      *a6 = v21;
    }

    v24 = 0LL;
LABEL_29:
    if (CurrentContext && (_BYTE)v44) {
      _LSContextDestroy(CurrentContext);
    }
    v26 = p_CurrentContext;
    CurrentContext = 0LL;
    p_CurrentContext = 0LL;

    LOBYTE(v44) = 0;
    v27 = v45;
    v45 = 0LL;

    return v24;
  }

  v31 = a6;
  CurrentContext = 0LL;
  p_CurrentContext = (void **)&CurrentContext;
  uint64_t v44 = 0x3032000000LL;
  v45 = __Block_byref_object_copy__21;
  v46 = __Block_byref_object_dispose__21;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = __Block_byref_object_copy__21;
  v40 = __Block_byref_object_dispose__21;
  int v14 = 11;
  id v41 = 0LL;
  v15 = (void (*)(void, void))MEMORY[0x1895F87A8];
  while (1)
  {
    v35[0] = v15;
    v35[1] = (void (*)(void, void))3221225472LL;
    v35[2] = (void (*)(void, void))___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke;
    v35[3] = (void (*)(void, void))&unk_189D72338;
    v35[4] = (void (*)(void, void))&CurrentContext;
    v16 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v35);
    v34[0] = v15;
    v34[1] = 3221225472LL;
    v34[2] = ___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke_2;
    v34[3] = &unk_189D76F90;
    v34[4] = &v36;
    v34[5] = &CurrentContext;
    [v16 getExtensionPointRecordWithIdentifier:a3 platform:a4 completionHandler:v34];
    if (v37[5] || !_LSNSErrorIsXPCConnectionInterrupted(p_CurrentContext[5])) {
      break;
    }
  }

LABEL_13:
  v17 = (void *)v37[5];
  if (v17)
  {
    id v18 = 0LL;
  }

  else
  {
    id v18 = p_CurrentContext[5];
    v17 = (void *)v37[5];
  }

  v24 = v17;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&CurrentContext, 8);
  id v25 = v18;

  if (v31 && !v24) {
    id *v31 = v25;
  }

  return v24;
}

+ (LSExtensionPointRecord)extensionPointRecordForCurrentProcess
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  v11 = (id *)&v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy__21;
  int v14 = __Block_byref_object_dispose__21;
  id v15 = 0LL;
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_storeStrong(v11 + 5, (id)currentExtensionPointRecord);
  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
  id v2 = v11[5];
  if (!v2)
  {
    if (_LSCurrentProcessMayMapDatabase())
    {
      v3 = +[LSBundleRecord bundleRecordForCurrentProcess](&OBJC_CLASS___LSBundleRecord, "bundleRecordForCurrentProcess");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v4 = [v3 extensionPointRecord];
        v5 = (os_log_s *)v11[5];
        v11[5] = (id)v4;
      }

      else
      {
        _LSExtensionsLog();
        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          pid_t v6 = getpid();
          *(_DWORD *)buf = 67109120;
          pid_t v17 = v6;
          _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_INFO,  "Bundle record not found for current process %d",  buf,  8u);
        }
      }
    }

    else
    {
      v3 = +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_35);
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2;
      v9[3] = &unk_189D76F68;
      v9[4] = &v10;
      [v3 getExtensionPointRecordForCurrentProcessWithCompletionHandler:v9];
    }

    id v2 = v11[5];
    if (v2)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
      objc_storeStrong((id *)&currentExtensionPointRecord, v11[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
      id v2 = v11[5];
    }
  }

  id v7 = v2;
  _Block_object_dispose(&v10, 8);

  return (LSExtensionPointRecord *)v7;
}

void __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2( uint64_t a1,  void *a2)
{
}

+ (void)setExtensionPointRecordForCurrentProcess:(id)a3
{
}

+ (BOOL)isCurrentProcessAnApplicationExtension
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

+ (NSString)identifierForCurrentProcess
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2;
  if (v2)
  {
    [v2 infoDictionary];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [v4 objectForKey:@"NSExtension"];
    id v7 = (void *)v6;
    if (v5 && v6)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v7 = 0LL;
        goto LABEL_22;
      }
    }

    else
    {

      if (!v7)
      {
LABEL_22:
        v8 = 0LL;
        goto LABEL_23;
      }
    }

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v7 objectForKey:@"NSExtensionPointIdentifier"];
    v8 = (void *)v10;
    if (v9 && v10)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_22;
      }
    }

    else if (!v10)
    {
LABEL_23:

      goto LABEL_24;
    }

    _LSDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[LSExtensionPointRecord identifierForCurrentProcess].cold.2((uint64_t)v8, v11);
    }

    [v3 bundlePath];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 pathExtension];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 || [v13 caseInsensitiveCompare:@"appex"])
    {
      _LSDefaultLog();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        +[LSExtensionPointRecord identifierForCurrentProcess].cold.1((uint64_t)v8, (uint64_t)v13, v14);
      }

      v8 = 0LL;
    }

    goto LABEL_23;
  }

  v8 = 0LL;
LABEL_24:

  return (NSString *)v8;
}

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (NSString)identifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_identifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_identifier
{
  id v2 = -[LSExtensionPointRecord identifier](self, "identifier");
}

- (id)nameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (NSString)name
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_nameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_name
{
  id v2 = -[LSExtensionPointRecord name](self, "name");
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int128 v6 = *(_OWORD *)&a6->var2._opaque[16];
  v8[0] = *(_OWORD *)a6->var2._opaque;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)version
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_version
{
  id v2 = -[LSExtensionPointRecord version](self, "version");
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var4;
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

- (id)parentAppRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  if (!a6->var7) {
    return 0LL;
  }
  v8 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  uint64_t var7 = a6->var7;
  id v12 = 0LL;
  id v10 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( v8,  "_initWithContext:bundleID:bundleData:error:",  a3,  var7,  0LL,  &v12);

  return v10;
}

- (LSApplicationRecord)parentAppRecord
{
  return (LSApplicationRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_parentAppRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_parentAppRecord
{
  id v2 = -[LSExtensionPointRecord parentAppRecord](self, "parentAppRecord");
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return  -[LSExtensionPoint _initWithRecord:resolveAndDetach:]( objc_alloc(&OBJC_CLASS___LSExtensionPoint),  "_initWithRecord:resolveAndDetach:",  self,  0LL);
}

- (unsigned)extensionPointTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var8;
}

- (unsigned)extensionPointType
{
  return __LSRECORD_GETTER__<unsigned int>( self,  (LSRecord *)a2,  sel_extensionPointTypeWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)TCCPolicyWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var9;
}

- (unsigned)TCCPolicy
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_TCCPolicyWithContext_tableID_unitID_unitBytes_);
}

+ (id)_propertyClasses
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v6 detach];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)SDKDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a6->var5,  *(void *)&a5);
}

- (LSPropertyList)SDKDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_SDKDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_SDKDictionary
{
  id v2 = -[LSExtensionPointRecord SDKDictionary](self, "SDKDictionary");
}

+ (id)enumerator
{
  return  -[_LSDBEnumerator _initWithContext:]( objc_alloc(&OBJC_CLASS____LSExtensionPointRecordEnumerator),  "_initWithContext:",  0LL);
}

+ (id)enumeratorWithParentApplicationRecord:(id)a3
{
  id v4 = -[_LSDBEnumerator _initWithContext:]( objc_alloc(&OBJC_CLASS____LSExtensionPointRecordEnumerator),  "_initWithContext:",  0LL);
  [v4 setParentApplicationRecord:a3];
  return v4;
}

+ (id)enumeratorForExtensionPointIdentifier:(id)a3
{
  return  -[_LSExtensionPointRecordEnumerator initWithExtensionPointIdentifier:]( objc_alloc(&OBJC_CLASS____LSExtensionPointRecordEnumerator),  "initWithExtensionPointIdentifier:",  a3);
}

+ (void)identifierForCurrentProcess
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Found extension point identifier %{public}@ for the current process",  (uint8_t *)&v2,  0xCu);
}

@end