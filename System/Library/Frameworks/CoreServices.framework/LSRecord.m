@interface LSRecord
+ (BOOL)hasDatabaseAccess;
+ (BOOL)supportsSecureCoding;
+ (NSArray)_propertyClasses;
+ (id)new;
+ (void)initialize;
+ (void)resolveAllPropertiesOfRecords:(const void *)a3 count:(unint64_t)a4 andDetachOnQueue:(id)a5;
+ (void)resolveAllPropertiesOfRecords:(id)a3 andDetachOnQueue:(id)a4;
- (BOOL)_isShared;
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (LSRecord)init;
- (LSRecord)initWithCoder:(id)a3;
- (LSRecord)initWithPersistentIdentifier:(id)a3;
- (NSData)persistentIdentifier;
- (NSURL)visualizerURL;
- (NSUUID)databaseUUID;
- (const)_resolvingMethods;
- (id).cxx_construct;
- (id)_attributedDescription;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_initInvalid;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifier:(id)a4;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_propertyClassesForCoding;
- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5;
- (id)_resolvedPropertyValueForGetter:(SEL)a3;
- (id)_resolvedPropertyValueForGetter:(SEL)a3 nullPlaceholder:(id)a4;
- (id)compatibilityObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unsigned)tableID;
- (unsigned)unitID;
- (void)_ifAttached:(id)a3 else:(id)a4;
- (void)_performBlockWithContext:(id)a3;
- (void)_removeResolvedPropertyValueForGetter:(SEL)a3;
- (void)_resolveAllProperties;
- (void)_setResolvedPropertyValue:(id)a3 forGetter:(SEL)a4;
- (void)_setShared:(BOOL)a3;
- (void)dealloc;
- (void)detach;
- (void)discardContentIfPossible;
- (void)encodeWithCoder:(id)a3;
- (void)endContentAccess;
- (void)resolveAllPropertiesAndDetachOnQueue:(id)a3;
@end

@implementation LSRecord

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  return self;
}

- (id)_initWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5
{
  __int16 v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSRecord;
  v8 = -[LSRecord init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3) {
      db = a3->db;
    }
    else {
      db = 0LL;
    }
    objc_storeStrong((id *)&v8->_context.db, db);
    *((_WORD *)v9 + 14) = v6;
    v9->_unitID = a5;
    *((_BYTE *)v9 + 31) &= 0x3Fu;
    *((_WORD *)v9 + 15) = *((_WORD *)v9 + 15) & 0xC000 | 1;
  }

  return v9;
}

- (void)_performBlockWithContext:(id)a3
{
  v4 = self;
  os_unfair_recursive_lock_lock_with_options();
  v5 = v4;
  p_context = &v5->_context;
  db = v5->_context.db;
  v10 = v5;
  if ((*((_BYTE *)v5 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, 0LL);
  }
  if (db)
  {
    v8 = v5;
    uint64_t Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, void, void, uint64_t))a3 + 2))( a3,  p_context,  *((unsigned __int16 *)v8 + 14),  v8->_unitID,  Unit);
  }

  os_unfair_recursive_lock_unlock();
}

- (void)_resolveAllProperties
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_context.db)
  {
    v3 = -[LSRecord _resolvingMethods](self, "_resolvingMethods");
    uint64_t v4 = v3[1];
    uint64_t v5 = v4 - *v3;
    if (v4 != *v3)
    {
      resolvedProperties = (float *)self->_resolvedProperties;
      if (resolvedProperties)
      {
        float v7 = resolvedProperties[8];
      }

      else
      {
        resolvedProperties = (float *)operator new(0x28uLL);
        *(_OWORD *)resolvedProperties = 0u;
        *((_OWORD *)resolvedProperties + 1) = 0u;
        resolvedProperties[8] = 1.0;
        self->_resolvedProperties = resolvedProperties;
        float v7 = 1.0;
      }

      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( (uint64_t)resolvedProperties,  vcvtps_u32_f32((float)(unint64_t)((v5 >> 4) + 1) / v7));
    }

    v9 = (void *)MEMORY[0x186E2A59C]();
    v10 = (char *)malloc(0x100uLL);
    strlcpy(v10, "LSRecord: resolving ", 0x100uLL);
    size_t v11 = strlen(v10);
    qword_18C49A7B0 = (uint64_t)v10;
    uint64_t v12 = *v3;
    uint64_t v13 = v3[1];
    if (*v3 != v13)
    {
      v14 = &v10[v11];
      size_t v15 = 256 - v11;
      do
      {
        SEL v16 = *(SEL *)v12;
        v17 = *(void (**)(LSRecord *, SEL))(v12 + 8);
        Name = sel_getName(*(SEL *)v12);
        strlcpy(v14, Name, v15);
        v17(self, v16);
        v12 += 16LL;
      }

      while (v12 != v13);
    }

    qword_18C49A7B0 = 0LL;
    free(v10);
    objc_autoreleasePoolPop(v9);
    -[LSRecord persistentIdentifier](self, "persistentIdentifier");
  }

  else if ((*((_BYTE *)self + 31) & 0x40) == 0)
  {
    _LSRecordLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138477827;
      v20 = self;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEBUG,  "Record %{private}@ may be incomplete during encoding.",  (uint8_t *)&v19,  0xCu);
    }
  }

  os_unfair_recursive_lock_unlock();
}

- (const)_resolvingMethods
{
  Superclass = (objc_class *)objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = (_OWORD *)-[LSRecord(Private) _resolvingMethods]::resultsByClass;
  if (!-[LSRecord(Private) _resolvingMethods]::resultsByClass)
  {
    uint64_t v5 = operator new(0x28uLL);
    _OWORD *v5 = 0u;
    v5[1] = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    -[LSRecord(Private) _resolvingMethods]::resultsByClass = (uint64_t)v5;
  }

  __p = Superclass;
  __int16 v6 = (char *)std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>( v5,  &__p);
  if (!v6)
  {
    sel = a2;
    __p = 0LL;
    v33 = 0LL;
    v34 = 0LL;
    v30 = Superclass;
    while (Superclass && Superclass != (objc_class *)LaunchServices::Record::recordClass)
    {
      outCount[0] = 0;
      float v7 = class_copyMethodList(Superclass, outCount);
      if (v7)
      {
        if (outCount[0])
        {
          unint64_t v8 = 0LL;
          do
          {
            v9 = v7[v8];
            Name = method_getName(v9);
            size_t v11 = sel_getName(Name);
            if (!strncmp("_LSRecord_resolve_", v11, 0x12uLL))
            {
              IMP Implementation = method_getImplementation(v9);
              IMP v13 = Implementation;
              v14 = v33;
              if (v33 >= v34)
              {
                uint64_t v16 = (v33 - (_BYTE *)__p) >> 4;
                unint64_t v17 = v16 + 1;
                uint64_t v18 = v34 - (_BYTE *)__p;
                if ((v34 - (_BYTE *)__p) >> 3 > v17) {
                  unint64_t v17 = v18 >> 3;
                }
                else {
                  unint64_t v19 = v17;
                }
                v20 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( (uint64_t)&v34,  v19);
                v22 = (const char **)&v20[16 * v16];
                *v22 = Name;
                v22[1] = (const char *)v13;
                v24 = (char *)__p;
                v23 = v33;
                v25 = v22;
                if (v33 != __p)
                {
                  do
                  {
                    *((_OWORD *)v25 - 1) = *((_OWORD *)v23 - 1);
                    v25 -= 2;
                    v23 -= 16;
                  }

                  while (v23 != v24);
                  v23 = (char *)__p;
                }

                size_t v15 = (char *)(v22 + 2);
                __p = v25;
                v33 = (char *)(v22 + 2);
                v34 = &v20[16 * v21];
                if (v23) {
                  operator delete(v23);
                }
              }

              else
              {
                *(void *)v33 = Name;
                *((void *)v14 + 1) = Implementation;
                size_t v15 = v14 + 16;
              }

              v33 = v15;
            }

            ++v8;
          }

          while (v8 < outCount[0]);
        }

        free(v7);
      }

      Superclass = class_getSuperclass(Superclass);
    }

    std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>::shrink_to_fit((uint64_t)&__p);
    *(void *)outCount = v30;
    __int16 v6 = std::__hash_table<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>>>::__emplace_unique_key_args<void const*,void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>( -[LSRecord(Private) _resolvingMethods]::resultsByClass,  outCount,  outCount,  (uint64_t)&__p);
    if (!v26)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 handleFailureInMethod:sel, self, @"LSRecord.mm", 1463, @"did not insert when filling cache for %@ in %s?", v30, sel_getName(sel) object file lineNumber description];
    }

    if (__p)
    {
      v33 = (char *)__p;
      operator delete(__p);
    }
  }

  os_unfair_recursive_lock_unlock();
  return v6 + 24;
}

- (NSData)persistentIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)sel_persistentIdentifier,  sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  _LSPersistentIdentifierDataMake((uint64_t *)a3, a4, a5, (uint64_t)v7);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:28];
}

- (void)detach
{
  if (*((char *)self + 31) < 0)
  {
    _LSRecordLog();
    IMP v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_ERROR,  "Attempting to detach a shared record. Please file a bug report.",  v14,  2u);
    }
  }

  else
  {
    os_unfair_recursive_lock_lock_with_options();
    p_context = &self->_context;
    if (self->_context.db)
    {
      uint64_t v5 = self;
      __int16 v6 = v5;
      db = self->_context.db;
      if ((*((_BYTE *)self + 31) & 0x40) == 0 && !db) {
        __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, a2);
      }
      if (db)
      {
        uint64_t v8 = v5;
        uint64_t Unit = CSStoreGetUnit();
        uint64_t v10 = *((unsigned __int16 *)v8 + 14);
        uint64_t unitID = v8->_unitID;
        -[LSRecord persistentIdentifier](v8, "persistentIdentifier");

        -[LSRecord _detachFromContext:tableID:unitID:unitBytes:]( v8,  "_detachFromContext:tableID:unitID:unitBytes:",  p_context,  v10,  unitID,  Unit);
      }

      uint64_t v12 = p_context->db;
      p_context->db = 0LL;
    }

    os_unfair_recursive_lock_unlock();
  }

- (id)_resolvedPropertyValueForGetter:(SEL)a3
{
  return -[LSRecord _resolvedPropertyValueForGetter:nullPlaceholder:]( self,  "_resolvedPropertyValueForGetter:nullPlaceholder:",  a3,  0LL);
}

- (id)_resolvedPropertyValueForGetter:(SEL)a3 nullPlaceholder:(id)a4
{
  CachedPropertyValue = LaunchServices::Record::getCachedPropertyValue( (LaunchServices::Record *)self,  (LSRecord *)a3,  v7);
  if (v9)
  {
    uint64_t v10 = CachedPropertyValue;
    size_t v11 = CachedPropertyValue;
    if (!v10) {
      size_t v11 = a4;
    }
    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (void)_ifAttached:(id)a3 else:(id)a4
{
  if (self->_context.db)
  {
    float v7 = self;
    uint64_t Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, void, void, uint64_t))a3 + 2))( a3,  &self->_context,  *((unsigned __int16 *)v7 + 14),  v7->_unitID,  Unit);

    os_unfair_recursive_lock_unlock();
  }

  else
  {
    os_unfair_recursive_lock_unlock();
    if (a4) {
      (*((void (**)(id))a4 + 2))(a4);
    }
  }

- (void)dealloc
{
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties)
  {
    uint64_t v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    operator delete(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSRecord;
  -[LSRecord dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id)compatibilityObject
{
  id v14 = 0LL;
  size_t v15 = self;
  v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = v3;
  objc_super v5 = v4;
  p_context = &v4->_context;
  db = v4->_context.db;
  if ((*((_BYTE *)v4 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  }
  if (db)
  {
    uint64_t v8 = v4;
    uint64_t Unit = CSStoreGetUnit();
    int v10 = *((unsigned __int16 *)v8 + 14);
    unsigned int unitID = v8->_unitID;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = ___ZZ31__LSRecord_compatibilityObject_ENK3__0clEP9LSContextjjPKv_block_invoke;
    v16[3] = &__block_descriptor_72_e5_v8__0ls32l8s40l8;
    v16[4] = &v14;
    v16[5] = &v15;
    int v17 = v10;
    unsigned int v18 = unitID;
    v16[6] = p_context;
    v16[7] = Unit;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)v16);
  }

  os_unfair_recursive_lock_unlock();
  id v12 = v14;

  return v12;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    LaunchServices::Record::recordClass = (uint64_t)a1;
    _LSBundleDisplayNameContextEnumerate(__LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__, v3, v4, v5, v6);
    _LSBundleDisplayNameContextEnumerate(__LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__, v7, v8, v9, v10);
  }

+ (id)new
{
}

- (LSRecord)init
{
}

+ (BOOL)hasDatabaseAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v16 = 0LL;
  uint64_t v7 = _LSCheckRecordPISizeAndVersionReturningPIInnerBytes(a4, &v16);
  id v8 = v16;
  if (!v7)
  {
    _LSRecordLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uu1 = 138412546;
      id v18 = a4;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEBUG,  "failed to initialize record with persistent identifier %@: %@",  uu1,  0x16u);
    }

    goto LABEL_8;
  }

  _LSDatabaseGetCacheGUIDBytes((uint64_t)a3->db, uu1);
  if (uuid_compare(uu1, v7 + 12))
  {
    _LSRecordLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = a4;
      _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEBUG,  "Failed to initialize record with persistent identifier %@ because it came from a different database.",  buf,  0xCu);
    }

- (LSRecord)initWithPersistentIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v17 = 0LL;
  char v18 = 0;
  id v19 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0LL);

  if (v6)
  {
    id v7 = -[LSRecord _initWithContext:persistentIdentifier:](self, "_initWithContext:persistentIdentifier:", v6, a3);
  }

  else
  {
    _LSRecordLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0LL);

      if (v10) {
        id v11 = 0LL;
      }
      else {
        id v11 = v19;
      }
      *(_DWORD *)buf = 138412546;
      id v21 = a3;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEBUG,  "Failed to initialize record with persistent identifier %@ because the current database was not reachable. Error %@",  buf,  0x16u);
    }

    id v7 = 0LL;
  }

  id v12 = (LSRecord *)v7;
  if (CurrentContext && v18) {
    _LSContextDestroy(CurrentContext);
  }
  id v13 = v17;
  CurrentContext = 0LL;
  id v17 = 0LL;

  char v18 = 0;
  id v14 = v19;
  id v19 = 0LL;

  return v12;
}

- (id)_initInvalid
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSRecord;
  id result = -[LSRecord init](&v3, sel_init);
  if (result)
  {
    *((_BYTE *)result + 31) = *((_BYTE *)result + 31) & 0x3F | 0x40;
    *((_WORD *)result + 15) = *((_WORD *)result + 15) & 0xC000 | 1;
  }

  return result;
}

- (void)_setResolvedPropertyValue:(id)a3 forGetter:(SEL)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  _LSRecordLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136446466;
    Name = sel_getName(a4);
    __int16 v11 = 2112;
    id v12 = a3;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEBUG,  "Setting value of property %{public}s to %@",  (uint8_t *)&v9,  0x16u);
  }

  os_unfair_recursive_lock_lock_with_options();
  LaunchServices::Record::setCachedPropertyValue( (LaunchServices::Record *)self,  (LSRecord *)a4,  (objc_selector *)a3,  v8);
  os_unfair_recursive_lock_unlock();
}

- (void)_removeResolvedPropertyValueForGetter:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  _LSRecordLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v7 = 136446210;
    *(void *)&v7[4] = sel_getName(a3);
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEBUG, "Removing value of property %{public}s", v7, 0xCu);
  }

  os_unfair_recursive_lock_lock_with_options();
  *(void *)id v7 = a3;
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties) {
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__erase_unique<objc_selector *>( resolvedProperties,  v7);
  }
  os_unfair_recursive_lock_unlock();
}

- (id)_attributedDescription
{
  objc_super v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = v3;
  uint64_t v5 = v4;
  p_db = (id *)&v4->_context.db;
  db = v4->_context.db;
  if ((*((_BYTE *)v4 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  }
  if (db)
  {
    uint64_t v8 = v4;
    CSStoreGetUnit();
    uint64_t v9 = *((unsigned __int16 *)v8 + 14);
    uint64_t unitID = v8->_unitID;
    Visualizer = _LSContextCreateVisualizer(p_db);
    [Visualizer descriptionOfUnit:unitID inTable:v9];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (BOOL)_isShared
{
  return *((unsigned __int8 *)self + 31) >> 7;
}

- (void)_setShared:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 31) = v3 & 0x80 | *((_BYTE *)self + 31) & 0x7F;
}

- (unsigned)unitID
{
  return self->_unitID;
}

- (unsigned)tableID
{
  return *((unsigned __int16 *)self + 14);
}

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  if (self->_context.db) {
    uint64_t v5 = @"yes";
  }
  else {
    uint64_t v5 = @"no";
  }
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p> { table: %llx, unit: %llx, attached: %@ }", v4, self, *((unsigned __int16 *)self + 14), self->_unitID, v5];
  os_unfair_recursive_lock_unlock();
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_resolvedProperties)
  {
    uint64_t v5 = (LaunchServices::Record *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*((void *)self->_resolvedProperties + 3)];
    LaunchServices::Record::getNullPlaceholder(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (uint64_t **)*((void *)self->_resolvedProperties + 2); i; i = (uint64_t **)*i)
    {
      uint64_t v8 = (const char *)i[2];
      uint64_t v9 = i[3];
      -[LSRecord _replacementObjectForResolvedPropertyValue:forGetter:encoder:]( self,  "_replacementObjectForResolvedPropertyValue:forGetter:encoder:",  v9,  v8,  a3);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(v8);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10) {
        -[LaunchServices::Record setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v11);
      }
      else {
        -[LaunchServices::Record setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, v11);
      }
    }

    [a3 encodeObject:v5 forKey:@"resolvedProperties"];
  }

  os_unfair_recursive_lock_unlock();
  [a3 encodeInt64:*((unsigned __int16 *)self + 14) forKey:@"tableID"];
  [a3 encodeInt64:self->_unitID forKey:@"unitID"];
  [a3 encodeBool:(*((unsigned __int8 *)self + 31) >> 6) & 1 forKey:@"intentionallyInvalid"];
}

- (LSRecord)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___LSRecord;
  uint64_t v4 = -[LSRecord init](&v21, sel_init);
  uint64_t v5 = v4;
  if (v4)
  {
    -[LSRecord _propertyClassesForCoding](v4, "_propertyClassesForCoding");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( a3,  "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:",  objc_opt_class(),  v6,  @"resolvedProperties");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = (LaunchServices::Record *)[v7 count];
      unint64_t v10 = (unint64_t)v9;
      if (v9)
      {
        LaunchServices::Record::getNullPlaceholder(v9);
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
        id v12 = operator new(0x28uLL);
        *id v12 = 0u;
        v12[1] = 0u;
        *((_DWORD *)v12 + 8) = 1065353216;
        v5->_resolvedProperties = v12;
        std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( (uint64_t)v12,  (unint64_t)(float)v10);
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = __26__LSRecord_initWithCoder___block_invoke;
        v18[3] = &unk_189D78258;
        id v13 = v11;
        id v19 = v13;
        id v20 = v5;
        [v8 enumerateKeysAndObjectsUsingBlock:v18];
      }

      *((_WORD *)v5 + 14) = [a3 decodeInt64ForKey:@"tableID"];
      v5->_uint64_t unitID = [a3 decodeInt64ForKey:@"unitID"];
      else {
        char v14 = 0;
      }
      *((_BYTE *)v5 + 31) = v14 & 0xC0 | *((_BYTE *)v5 + 31) & 0x3F;
      *((_WORD *)v5 + 15) = *((_WORD *)v5 + 15) & 0xC000 | 1;
    }

    else
    {
      uint64_t v22 = *MEMORY[0x189607490];
      v23[0] = @"Could not decode the set of resolved property values for this record.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      size_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607460], 4865LL, (uint64_t)"-[LSRecord initWithCoder:]", 580LL, v15);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [a3 failWithError:v16];

      uint64_t v5 = 0LL;
    }
  }

  return v5;
}

void *__26__LSRecord_initWithCoder___block_invoke(uint64_t a1, NSString *aSelectorName, void *a3)
{
  id v6 = a3;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(void **)(a1 + 32) == a3)
  {
    SEL v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *,decltype(nullptr)>( v3,  &v5,  &v5);
  }

  else
  {
    SEL v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>( v3,  &v5,  &v5,  &v6);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  unint64_t v10 = self->_context.db;
  SEL v5 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "_initWithContext:tableID:unitID:",  &v10,  *((unsigned __int16 *)self + 14),  self->_unitID);
  if (v5)
  {
    if (self->_context.db)
    {
      _LSRecordLog();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = self;
        _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEBUG,  "Copied attached record %@; not copying its properties.",
          buf,
          0xCu);
      }
    }

    else if (self->_resolvedProperties)
    {
      _LSRecordLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = self;
        _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEBUG,  "Copied detached record %@; copying its properties.",
          buf,
          0xCu);
      }

      uint64_t v8 = operator new(0x28uLL);
      std::unordered_map<objc_selector *,objc_object * {__strong}>::unordered_map( (uint64_t)v8,  (uint64_t)self->_resolvedProperties);
      v5[1] = v8;
    }
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (BOOL)beginContentAccess
{
  int v4 = *((unsigned __int16 *)self + 15);
  if ((~v4 & 0x3FFF) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"LSRecord.mm" lineNumber:632 description:@"-[LSRecord beginContentAccess] counter saturated."];

    LOWORD(v4) = *((_WORD *)self + 15);
  }

  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 + 1) & 0x3FFF;
  os_unfair_recursive_lock_unlock();
  return 1;
}

- (void)endContentAccess
{
  __int16 v4 = *((_WORD *)self + 15);
  if ((v4 & 0x3FFF) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2 object:self file:@"LSRecord.mm" lineNumber:643 description:@"-[LSRecord endContentAccess] counter saturated."];

    __int16 v4 = *((_WORD *)self + 15);
  }

  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 - 1) & 0x3FFF;
  -[LSRecord discardContentIfPossible](self, "discardContentIfPossible");
  os_unfair_recursive_lock_unlock();
}

- (void)discardContentIfPossible
{
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties && (*((_WORD *)self + 15) & 0x3FFF) == 0 && self->_context.db)
  {
    __int16 v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    operator delete(v4);
    self->_resolvedProperties = 0LL;
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isContentDiscarded
{
  resolvedProperties = self->_resolvedProperties;
  os_unfair_recursive_lock_unlock();
  return resolvedProperties == 0LL;
}

- (NSURL)visualizerURL
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = __Block_byref_object_copy__37;
  uint64_t v9 = __Block_byref_object_dispose__37;
  id v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke;
  v4[3] = &unk_189D77490;
  v4[4] = &v5;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v4, 0LL);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v5 = [MEMORY[0x18960DD78] URLForUnit:a4 inTable:a3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSUUID)databaseUUID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPersistentIdentifierGetKnowledgeUUIDInternal(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)resolveAllPropertiesAndDetachOnQueue:(id)a3
{
  uint64_t v3 = self;
  +[LSRecord resolveAllPropertiesOfRecords:count:andDetachOnQueue:]( &OBJC_CLASS___LSRecord,  "resolveAllPropertiesOfRecords:count:andDetachOnQueue:",  &v3,  1LL,  a3);
}

+ (void)resolveAllPropertiesOfRecords:(const void *)a3 count:(unint64_t)a4 andDetachOnQueue:(id)a5
{
  uint64_t v7 = (void **)a3;
  if (!a3 && a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, a1, @"LSRecord.mm", 723, @"Invalid parameter not satisfying: %@", @"records != NULL || count == 0" object file lineNumber description];

    if (a5) {
      goto LABEL_5;
    }
  }

  else
  {
    if (!a4) {
      return;
    }
    if (a5)
    {
LABEL_5:
      id v23 = 0LL;
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>( &v23,  v7,  &v7[a4],  a4);
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3321888768LL;
      v21[2] = __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke;
      v21[3] = &__block_descriptor_56_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE_e5_v8__0l;
      memset(v22, 0, sizeof(v22));
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>( v22,  v23,  v24,  v24 - v23);
      [a5 addOperationWithBlock:v21];
      char v26 = (id **)v22;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v26);
      char v26 = &v23;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v26);
      return;
    }
  }

  if (pthread_main_np() && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    id v16 = (void *)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    if (LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool)
    {
      id v17 = *(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    }

    else
    {
      id v16 = operator new(0x18uLL);
      id v17 = 0LL;
      v16[1] = 0LL;
      v16[2] = 0LL;
      *id v16 = 0LL;
      LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool = (uint64_t)v16;
    }

    char v18 = (id *)v16[1];
    if (v17 == v18)
    {
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>( (uint64_t)v16,  v17,  v7,  &v7[a4],  a4);
      dispatch_async(MEMORY[0x1895F8AE0], &__block_literal_global_209);
    }

    else
    {
      id v23 = 0LL;
      id v19 = std::remove[abi:nn180100]<std::__wrap_iter<LSRecord * {__weak}*>,decltype(nullptr)>( &v17[LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex],  v18);
      std::vector<LSRecord * {__weak}>::erase( (uint64_t)v16,  v19,  *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8));
      id v20 = *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8);
      LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex = ((uint64_t)v20 - *(void *)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool) >> 3;
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>( LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool,  v20,  v7,  &v7[a4],  a4);
    }
  }

  else
  {
    unint64_t v11 = 8 * a4;
    unint64_t v12 = 8 * a4;
    uint64_t v13 = v7;
    do
    {
      id v14 = *v13;
      [v14 _resolveAllProperties];

      ++v13;
      v12 -= 8LL;
    }

    while (v12);
    do
    {
      id v15 = *v7;
      [v15 detach];

      ++v7;
      v11 -= 8LL;
    }

    while (v11);
  }

void __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke( uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = *(id **)(a1 + 40);
  if (v1 != v2)
  {
    uint64_t v3 = *(id **)(a1 + 32);
    do
    {
      id WeakRetained = objc_loadWeakRetained(v3);
      [WeakRetained _resolveAllProperties];

      ++v3;
    }

    while (v3 != v2);
    do
    {
      id v5 = objc_loadWeakRetained(v1);
      [v5 detach];

      ++v1;
    }

    while (v1 != v2);
  }

+ (void)resolveAllPropertiesOfRecords:(id)a3 andDetachOnQueue:(id)a4
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"LSRecord.mm", 759, @"Invalid parameter not satisfying: %@", @"records != nil" object file lineNumber description];
  }

  unint64_t v7 = [a3 count];
  if (v7 > 0x80)
  {
    __p = 0LL;
    unint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v10 = 0LL;
    std::vector<LSRecord *>::resize((uint64_t)&__p, v7, &v10);
    objc_msgSend(a3, "getObjects:range:", __p, 0, v7);
    [a1 resolveAllPropertiesOfRecords:__p count:v7 andDetachOnQueue:a4];
    if (__p)
    {
      unint64_t v12 = __p;
      operator delete(__p);
    }
  }

  else
  {
    objc_msgSend(a3, "getObjects:range:", &__p, 0, v7);
    [a1 resolveAllPropertiesOfRecords:&__p count:v7 andDetachOnQueue:a4];
  }

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return 0LL;
}

+ (NSArray)_propertyClasses
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  if (CSStoreGetUnit()) {
    return -[LSRecord _initWithContext:tableID:unitID:]( self,  "_initWithContext:tableID:unitID:",  a3,  a4->var3,  a4->var2);
  }

  return 0LL;
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once == -1)
  {
    if (!v5) {
      return v6;
    }
  }

  else
  {
    dispatch_once( &-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once,  &__block_literal_global_58);
    if (!v6) {
      return v6;
    }
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    uint64_t v6 = 0LL;
  }

  return v6;
}

uint64_t __99__LSRecord_SubclassResponsibilities___replacementObjectForResolvedPropertyValue_forGetter_encoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  -[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::applicationRecordClass = result;
  return result;
}

- (id)_propertyClassesForCoding
{
  id v14 = 0LL;
  uint64_t v2 = objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = (_OWORD *)-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass;
  if (!-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass)
  {
    uint64_t v3 = operator new(0x28uLL);
    _OWORD *v3 = 0u;
    v3[1] = 0u;
    *((_DWORD *)v3 + 8) = 1065353216;
    -[LSRecord(Private) _propertyClassesForCoding]::resultsByClass = (uint64_t)v3;
  }

  uint64_t v13 = v2;
  __int16 v4 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>( v3,  &v13);
  if (v4)
  {
    id v14 = (id)v4[3];
  }

  else
  {
    id v5 = (void *)MEMORY[0x186E2A59C]();
    id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
    XNSGetPropertyListClasses();
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 unionSet:v7];

    [v6 addObject:objc_opt_class()];
    for (i = (objc_class *)v2; i && i != (objc_class *)LaunchServices::Record::recordClass; i = class_getSuperclass(i))
    {
      -[objc_class _propertyClasses](i, "_propertyClasses");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObjectsFromArray:v9];
    }

    uint64_t v10 = (void *)[v6 copy];
    uint64_t v13 = v2;
    id v14 = v10;
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>( -[LSRecord(Private) _propertyClassesForCoding]::resultsByClass,  &v13,  &v13,  &v14);

    objc_autoreleasePoolPop(v5);
  }

  os_unfair_recursive_lock_unlock();
  id v11 = v14;

  return v11;
}

@end