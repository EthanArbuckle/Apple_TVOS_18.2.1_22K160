@interface SASharedCache
+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4;
+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5;
+ (id)classDictionaryKey;
+ (id)currentSharedCache;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)sharedCacheWithCSSymbolicator:;
+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:(char)a5 findMappingsIfUnknown:;
+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(void *)a4 binaryLoadInfos:;
+ (void)_applyBaseAddress:(void *)a3 toSharedCaches:;
+ (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:(void *)a5 toSharedCaches:;
+ (void)_doDscSymDirsWork:(uint64_t)a1;
+ (void)_doSharedCachesWork:(uint64_t)a1;
+ (void)_findLoadInfosForSharedCaches:(uint64_t)a1;
+ (void)addDSCSymData:(id)a3;
+ (void)addDscSymDir:(id)a3;
+ (void)applyBinaryLoadInfos:(void *)a3 sharedCacheUUID:(uint64_t)a4 slide:(uint64_t)a5 slidBaseAddress:;
+ (void)clearCaches;
+ (void)sharedCacheWithDyldSharedCache:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4;
- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5;
- (NSArray)binaryLoadInfos;
- (NSString)debugDescription;
- (NSUUID)uuid;
- (unint64_t)endAddress;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)slidBaseAddress;
- (unint64_t)slide;
- (unint64_t)startAddress;
- (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)initWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setBinaryLoadInfos:(id)a3;
- (void)setSlidBaseAddress:(void *)a1;
- (void)setSlide:(void *)a1;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SASharedCache

- (void)initWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:
{
  id v8 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_CLASS___SASharedCache;
    id v9 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeStrong((id *)v9 + 5, a2);
      a1[1] = a3;
      a1[2] = a4;
    }
  }

  return a1;
}

+ (void)_doDscSymDirsWork:(uint64_t)a1
{
  v3 = a2;
  objc_opt_self();
  if (qword_18C4B1628 != -1) {
    dispatch_once(&qword_18C4B1628, &__block_literal_global_400);
  }
  id v2 = (id)qword_18C4B1620;
  objc_sync_enter(v2);
  v3[2](v3, qword_18C4B1620);
  objc_sync_exit(v2);
}

void __35__SASharedCache__doDscSymDirsWork___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
  v1 = (void *)qword_18C4B1620;
  qword_18C4B1620 = v0;
}

+ (void)_doSharedCachesWork:(uint64_t)a1
{
  v3 = a2;
  objc_opt_self();
  if (qword_18C4B1638 != -1) {
    dispatch_once(&qword_18C4B1638, &__block_literal_global_401);
  }
  id v2 = (id)qword_18C4B1630;
  objc_sync_enter(v2);
  v3[2](v3, qword_18C4B1630);
  objc_sync_exit(v2);
}

void __37__SASharedCache__doSharedCachesWork___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
  v1 = (void *)qword_18C4B1630;
  qword_18C4B1630 = v0;
}

+ (void)clearCaches
{
}

uint64_t __28__SASharedCache_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

+ (void)addDscSymDir:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __30__SASharedCache_addDscSymDir___block_invoke;
  v8[3] = &unk_189F62CE8;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  +[SASharedCache _doDscSymDirsWork:]((uint64_t)a1, v8);
  if (*((_BYTE *)v12 + 24))
  {
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __30__SASharedCache_addDscSymDir___block_invoke_2;
    v7[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
    v7[4] = a1;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)a1, v7);
  }

  _Block_object_dispose(&v11, 8);
}

void __30__SASharedCache_addDscSymDir___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [v3 addObject:*(void *)(a1 + 32)];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t __30__SASharedCache_addDscSymDir___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __30__SASharedCache_addDscSymDir___block_invoke_3;
  v3[3] = &__block_descriptor_40_e39_v32__0__NSUUID_8__NSMutableArray_16_B24l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __30__SASharedCache_addDscSymDir___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
}

+ (void)_findLoadInfosForSharedCaches:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  [v2 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 binaryLoadInfos];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    *(void *)uu = 0LL;
    uint64_t v36 = 0LL;
    [v4 uuid];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getUUIDBytes:uu];

    if (!uuid_is_null(uu))
    {
      uint64_t v8 = [v4 slide];
      if (v8 == -1) {
        uint64_t v9 = 0LL;
      }
      else {
        uint64_t v9 = v8;
      }
      v10 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2560];
      uint64_t v11 = MEMORY[0x1895F87A8];
      v30[0] = MEMORY[0x1895F87A8];
      v30[1] = 3221225472LL;
      v30[2] = __47__SASharedCache__findLoadInfosForSharedCaches___block_invoke;
      v30[3] = &unk_189F62EC8;
      uint64_t v32 = v9;
      id v12 = v10;
      id v31 = v12;
      uint64_t v13 = (void *)MEMORY[0x186E47C94](v30);
      uint64_t v29 = -1LL;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v14 = objc_opt_self();
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      *(void *)&buf[24] = __Block_byref_object_copy__2;
      v38 = __Block_byref_object_dispose__2;
      id v39 = 0LL;
      v33[0] = v11;
      v33[1] = 3221225472LL;
      v33[2] = __27__SASharedCache_dscSymDirs__block_invoke;
      v33[3] = &unk_189F62980;
      v33[4] = buf;
      +[SASharedCache _doDscSymDirsWork:](v14, v33);
      id v15 = *(id *)(*(void *)&buf[8] + 40LL);
      _Block_object_dispose(buf, 8);

      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v26;
        while (2)
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v15);
            }
            id v19 = *(id *)(*((void *)&v25 + 1) + 8 * v18);
            objc_msgSend(v19, "UTF8String", (void)v25);
            if (!dscsym_iterate())
            {

              goto LABEL_19;
            }

            [v12 removeAllObjects];
            ++v18;
          }

          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      if (dscsym_iterate())
      {
        int v20 = *__error();
        _sa_logt();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 16;
          *(_WORD *)&buf[8] = 2096;
          *(void *)&buf[10] = uu;
          _os_log_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_DEFAULT,  "WARNING: Unable to find shared cache mapping for %{uuid_t}.16P",  buf,  0x12u);
        }

        *__error() = v20;
      }

      else
      {
LABEL_19:
        +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)&OBJC_CLASS___SABinaryLoadInfo, v12);
        int v22 = *__error();
        _sa_logt();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = [v12 count];
          *(_DWORD *)buf = 134218498;
          *(void *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(void *)&buf[20] = uu;
          _os_log_debug_impl( &dword_186C92000,  v23,  OS_LOG_TYPE_DEBUG,  "%lu binaries in shared cache %{uuid_t}.16P",  buf,  0x1Cu);
        }

        *__error() = v22;
        +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:](v3, v12, v9, v29 + v9, v2);
      }
    }
  }
}

void __27__SASharedCache_dscSymDirs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)currentSharedCache
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SASharedCache_currentSharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_18C4B1658 != -1) {
    dispatch_once(&qword_18C4B1658, block);
  }
  if (qword_18C4B1640)
  {
    +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:]( &OBJC_CLASS___SASharedCache,  "sharedCacheWithUUID:slide:slidBaseAddress:",  qword_18C4B1640,  qword_18C4B1650,  qword_18C4B1648);
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

void __35__SASharedCache_currentSharedCache__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = getpid();
  if (CopyDyldSnapshotForPid(v2))
  {
    uint64_t shared_cache = dyld_process_snapshot_get_shared_cache();
    if (shared_cache)
    {
      +[SASharedCache sharedCacheWithDyldSharedCache:](*(void *)(a1 + 32), shared_cache);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        dyld_process_snapshot_dispose();
        uint64_t v4 = [v17 uuid];
        uint64_t v5 = (void *)qword_18C4B1640;
        qword_18C4B1640 = v4;

        qword_18C4B1650 = [v17 slide];
        qword_18C4B1648 = [v17 slidBaseAddress];

        return;
      }

      dyld_shared_cache_copy_uuid();
      int v8 = *__error();
      _sa_logt();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        do
        {
          unsigned int v10 = __ldxr(&uuid_string_index);
          unsigned int v11 = v10 + 1;
        }

        while (__stxr(v11, &uuid_string_index));
        BOOL v12 = (-v11 & 0x80000000) != 0;
        int v13 = -v11 & 3;
        int v14 = v11 & 3;
        if (v12) {
          int v15 = v14;
        }
        else {
          int v15 = -v13;
        }
        uint64_t v16 = &uuid_string_string[37 * v15];
        uuid_unparse(uu, v16);
        *(_DWORD *)buf = 136446466;
        id v19 = v16;
        __int16 v20 = 2082;
        uint64_t v21 = dyld_shared_cache_file_path();
        _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "Unable to find current processes' shared cache (%{public}s: %{public}s) (via dyld introspection)",  buf,  0x16u);
      }

      *__error() = v8;
    }

    else
    {
      int v6 = *__error();
      _sa_logt();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "No shared cache for current process", buf, 2u);
      }

      *__error() = v6;
    }

    dyld_process_snapshot_dispose();
  }

+ (void)sharedCacheWithDyldSharedCache:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  dyld_shared_cache_copy_uuid();
  if (uuid_is_null(uu)) {
    return 0LL;
  }
  uuidForBytes((uint64_t)uu);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x186E475F8](a2);
  +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]( (uint64_t)&OBJC_CLASS___SASharedCache,  v4,  -1LL,  v5,  0);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 slide] == -1)
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    uint64_t v19 = 0LL;
    __int16 v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v22 = 0LL;
    dyld_for_each_installed_shared_cache();
    if (*((_BYTE *)v24 + 24))
    {
      -[SASharedCache setSlide:](v6, v5 - v20[3]);
    }

    else
    {
      dscsym_iterate();
      int v7 = *__error();
      _sa_logt();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v6 debugDescription];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v15;
        _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "Unable to find shared cache %@ in live system nor via dscsym",  buf,  0xCu);
      }

      *__error() = v7;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  [v6 binaryLoadInfos];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = [v9 count] == 0;

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    uint64_t v16 = MEMORY[0x1895F87A8];
    id v12 = v11;
    id v17 = v12;
    int v13 = v6;
    uint64_t v18 = v13;
    dyld_shared_cache_for_each_image();
    if (!*((_BYTE *)v24 + 24))
    {
      if (objc_msgSend( v12,  "count",  v16,  3221225472,  __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_425,  &unk_189F62E50,  v12,  v13,  &v23))
      {
        +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)&OBJC_CLASS___SABinaryLoadInfo, v12);
        [v13 uuid];
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SASharedCache applyBinaryLoadInfos:sharedCacheUUID:slide:slidBaseAddress:]( (uint64_t)SASharedCache,  v12,  v14,  [v13 slide],  objc_msgSend(v13, "slidBaseAddress"));
      }
    }

    _Block_object_dispose(&v23, 8);
  }

  return v6;
}

+ (id)sharedCacheWithCSSymbolicator:
{
  uint64_t v0 = (void *)objc_opt_self();
  SharedCacheUUID = (const unsigned __int8 *)CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID) {
    return 0LL;
  }
  uint64_t v2 = (uint64_t)SharedCacheUUID;
  if (uuid_is_null(SharedCacheUUID)) {
    return 0LL;
  }
  uuidForBytes(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dscsym_iterate();
  if (*((_BYTE *)v11 + 24))
  {
    [v0 sharedCacheWithUUID:v4 slide:v7[3] slidBaseAddress:v7[3] - 1];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v8 = (void *)MEMORY[0x186E47ACC]();
  uint64_t SymbolOwnerWithCFUUIDBytesAtTime = CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
  uint64_t v11 = v10;
  if ((CSIsNull() & 1) != 0)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke_2;
    v14[3] = &unk_189F62D50;
    __int128 v15 = *(_OWORD *)(a1 + 32);
    uint64_t v16 = a4;
    uint64_t v17 = a5;
    SASymbolOwnerForeachSegment(SymbolOwnerWithCFUUIDBytesAtTime, v11, v14);
    uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  objc_autoreleasePoolPop(v8);
  return v12;
}

uint64_t __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    result = CSRegionGetName();
    if (result)
    {
      uint64_t v2 = (const char *)result;
      size_t v3 = strlen(*(const char **)(v1 + 48));
      result = strncmp(v2, *(const char **)(v1 + 48), v3);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL) = 1;
        result = CSRegionGetRange();
        *(void *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 24LL) = result - *(void *)(v1 + 56);
      }
    }
  }

  return result;
}

+ (void)_applyBaseAddress:(void *)a3 toSharedCaches:
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_self();
  uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v39 = v4;
  uint64_t v6 = (void *)[v4 copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(_BYTE **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v12 = [v11 slide];
        uint64_t v13 = [v11 slidBaseAddress];
        if (v12 == -1)
        {
          uint64_t v15 = v13 - a2;
          uint64_t v16 = 8LL;
LABEL_12:
          *(void *)&v11[v16] = v15;
          goto LABEL_13;
        }

        if (v13 == -1)
        {
          uint64_t v15 = [v11 slide] + a2;
          uint64_t v16 = 16LL;
          goto LABEL_12;
        }

        uint64_t v14 = [v11 slidBaseAddress];
        if (v14 - [v11 slide] != a2)
        {
          int v20 = *__error();
          _sa_logt();
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [v11 slide];
            uint64_t v24 = [v11 slidBaseAddress];
            uint64_t v25 = [v11 slidBaseAddress];
            uint64_t v26 = v25 - [v11 slide];
            [v11 uuid];
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
            id v28 = [v27 UUIDString];
            uint64_t v29 = [v28 UTF8String];
            *(_DWORD *)buf = 134219010;
            uint64_t v45 = v23;
            __int16 v46 = 2048;
            uint64_t v47 = v24;
            __int16 v48 = 2048;
            uint64_t v49 = v26;
            __int16 v50 = 2048;
            uint64_t v51 = a2;
            __int16 v52 = 2080;
            uint64_t v53 = v29;
            _os_log_error_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_ERROR,  "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs applied base address 0x%llx for %s",  buf,  0x34u);
          }

          *__error() = v20;
          char v30 = [v11 slide];
          [v11 slidBaseAddress];
          [v11 slidBaseAddress];
          [v11 slide];
          [v11 uuid];
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          id v32 = [v31 UUIDString];
          [v32 UTF8String];
          _SASetCrashLogMessage( 3541,  "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs applied b ase address 0x%llx for %s",  v33,  v34,  v35,  v36,  v37,  v38,  v30);

          _os_crash();
          __break(1u);
        }

- (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  unint64_t v8 = a2;
  if (a1)
  {
    if ((a4 & a3) == 0xFFFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = *__error();
      a4 = _sa_logt();
      if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_186C92000,  (os_log_t)a4,  OS_LOG_TYPE_ERROR,  "applying load infos with unknown slide and unknown slidBaseAddress",  buf,  2u);
      }

      *__error() = v8;
      _SASetCrashLogMessage( 3555,  "applying load infos with unknown slide and unknown slidBaseAddress",  v60,  v61,  v62,  v63,  v64,  v65,  v66);
      _os_crash();
      __break(1u);
    }

    else
    {
      if ([*(id *)(a1 + 48) count])
      {
        [*(id *)(a1 + 48) count];
        [(id)v8 count];
        goto LABEL_63;
      }

      if (qword_18C4B1660 == -1)
      {
LABEL_6:
        uint64_t v69 = a1;
        v70 = (void *)v8;
        if (a3 == -1 || !_MergedGlobals_5)
        {
LABEL_39:
          if (a3 == -1 || (uint64_t v33 = *(void *)(a1 + 8), v33 == -1))
          {
            if (a4 == -1 || (uint64_t v35 = *(void *)(a1 + 16), v35 == -1))
            {
              uint64_t v52 = a4;
              uint64_t v53 = (void *)a1;
              int v54 = *__error();
              _sa_logt();
              uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                [v53 debugDescription];
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v57 = [v70 count];
                *(_DWORD *)buf = 138413058;
                v82 = v56;
                __int16 v83 = 2048;
                uint64_t v84 = v57;
                __int16 v85 = 2048;
                uint64_t v86 = a3;
                __int16 v87 = 2048;
                uint64_t v88 = v52;
                _os_log_impl( &dword_186C92000,  v55,  OS_LOG_TYPE_DEFAULT,  "WARNING: Unable to calculate appropriate load addresses for shared cache %@ when applying %lu load inf os with slide #%llx and slidbaseAddress 0x%llx",  buf,  0x2Au);
              }

              *__error() = v54;
              goto LABEL_62;
            }

            uint64_t v34 = v35 - a4;
          }

          else
          {
            uint64_t v34 = v33 - a3;
          }

          id v68 = (id)a1;
          objc_sync_enter(v68);
          if (v34)
          {
            uint64_t v36 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend((id)v8, "count"));
            __int128 v74 = 0u;
            __int128 v75 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            obuint64_t j = (id)v8;
            uint64_t v37 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
            if (v37)
            {
              uint64_t v38 = *(void *)v73;
              do
              {
                for (uint64_t i = 0LL; i != v37; ++i)
                {
                  if (*(void *)v73 != v38) {
                    objc_enumerationMutation(obj);
                  }
                  __int128 v40 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                  uint64_t v41 = [v40 loadAddress];
                  [v40 segment];
                  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();

                  uint64_t v43 = v41 + v34;
                  if (v42)
                  {
                    [v40 segment];
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    int v45 = [v40 isInKernelAddressSpace];
                    [v40 exclave];
                    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v44,  v43,  v45,  v46);
                  }

                  else
                  {
                    [v40 binary];
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    int v47 = [v40 isInKernelAddressSpace];
                    [v40 exclave];
                    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  v44,  v43,  v47,  v46);
                  }

                  __int16 v48 = (void *)objc_claimAutoreleasedReturnValue();

                  [v36 addObject:v48];
                }

                uint64_t v37 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
              }

              while (v37);
            }

            uint64_t v49 = [v36 copy];
            __int16 v50 = *(void **)(v69 + 48);
            *(void *)(v69 + 48) = v49;
          }

          else
          {
            uint64_t v51 = [(id)v8 copy];
            uint64_t v36 = *(void **)(a1 + 48);
            *(void *)(a1 + 48) = v51;
          }

          objc_sync_exit(v68);
LABEL_62:
          unint64_t v8 = (unint64_t)v70;
          goto LABEL_63;
        }

        id v67 = (id)a4;
        [(id)v8 firstObject];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v10 = [v9 loadAddress];
        if (v10 >= 0x300000001LL)
        {
          [(id)v8 firstObject];
          id v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!((unint64_t)[v4 loadAddress] >> 34))
          {

LABEL_11:
            int v11 = *__error();
            _sa_logt();
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              [v70 firstObject];
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              [v58 debugDescription];
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v82 = v59;
              _os_log_error_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_ERROR,  "Detected bad shared cache load infos (%@) see rdar://93325284",  buf,  0xCu);
            }

            *__error() = v11;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v76 = 0u;
            __int128 v77 = 0u;
            id v13 = v70;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v89 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v77;
              do
              {
                for (uint64_t j = 0LL; j != v14; ++j)
                {
                  if (*(void *)v77 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                  uint64_t v18 = [v17 loadAddress];
                  int v19 = *__error();
                  _sa_logt();
                  int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  uint64_t v21 = (void *)(a3 + ((unint64_t)(v18 - a3) >> 1));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    [v17 debugDescription];
                    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218242;
                    v82 = v21;
                    __int16 v83 = 2112;
                    uint64_t v84 = (uint64_t)v22;
                    _os_log_debug_impl(&dword_186C92000, v20, OS_LOG_TYPE_DEBUG, "0x%llx <- %@", buf, 0x16u);
                  }

                  *__error() = v19;
                  if (v17) {
                    v17[3] = v21;
                  }
                }

                uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v89 count:16];
              }

              while (v14);
            }

LABEL_38:
            a1 = v69;
            unint64_t v8 = (unint64_t)v70;
            a4 = (uint64_t)v67;
            goto LABEL_39;
          }
        }

        [(id)v8 firstObject];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)[v23 loadAddress] >> 32 || *(void *)(v69 + 16) == -1)
        {

          if (v10 < 0x300000001LL) {
            goto LABEL_34;
          }
        }

        else
        {
          [(id)v8 firstObject];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v24 loadAddress] > (unint64_t)(*(void *)(v69 + 16) + 436207616))
          {
            BOOL v25 = v10 > 0x300000000LL;
            [(id)v8 firstObject];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v27 = [v26 loadAddress];
            unint64_t v28 = *(void *)(v69 + 16) + 2315255808LL;

            if (v25) {
            if (v27 < v28)
            }
              goto LABEL_11;
LABEL_35:
            int v29 = *__error();
            _sa_logt();
            char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              [v70 firstObject];
              id v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 debugDescription];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v82 = v32;
              _os_log_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_INFO,  "Detected ok shared cache load infos (%@) see rdar://93325284",  buf,  0xCu);
            }

            *__error() = v29;
            goto LABEL_38;
          }

          if (v10 <= 0x300000000LL)
          {
LABEL_34:

            goto LABEL_35;
          }
        }

        goto LABEL_34;
      }
    }

    dispatch_once(&qword_18C4B1660, &__block_literal_global_413);
    goto LABEL_6;
  }

const char *__62__SASharedCache__applyLoadInfos_withSlide_andSlidBaseAddress___block_invoke()
{
  result = getenv("SA_WORKAROUND_93250769");
  if (result)
  {
    result = (const char *)strcmp(result, "0");
    _MergedGlobals_5 = (_DWORD)result != 0;
  }

  return result;
}

+ (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:(void *)a5 toSharedCaches:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = objc_opt_self();
  if (a3 != -1 && a4 != -1) {
    +[SASharedCache _applyBaseAddress:toSharedCaches:](v10, a4 - a3, v9);
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:]( *(void *)(*((void *)&v16 + 1) + 8 * v15++),  v8,  a3,  a4);
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:(char)a5 findMappingsIfUnknown:
{
  id v8 = a2;
  uint64_t v9 = objc_opt_self();
  if ((a4 & a3) == 0xFFFFFFFFFFFFFFFFLL)
  {
    int v14 = *__error();
    _sa_logt();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "Trying to find shared cache with unknown slide and unknown slidBaseAddress",  buf,  2u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 3641,  "Trying to find shared cache with unknown slide and unknown slidBaseAddress",  v16,  v17,  v18,  v19,  v20,  v21,  v22[0]);
    id result = (id)_os_crash();
    __break(1u);
  }

  else
  {
    uint64_t v10 = v9;
    *(void *)buf = 0LL;
    char v30 = buf;
    uint64_t v31 = 0x3032000000LL;
    id v32 = __Block_byref_object_copy__2;
    uint64_t v33 = __Block_byref_object_dispose__2;
    id v34 = 0LL;
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __81__SASharedCache_sharedCacheWithUUID_slide_slidBaseAddress_findMappingsIfUnknown___block_invoke;
    v22[3] = &unk_189F62DC0;
    id v11 = v8;
    uint64_t v25 = a3;
    uint64_t v26 = a4;
    id v23 = v11;
    uint64_t v24 = buf;
    uint64_t v27 = v10;
    char v28 = a5;
    +[SASharedCache _doSharedCachesWork:](v10, v22);
    id v12 = *((id *)v30 + 5);

    _Block_object_dispose(buf, 8);
    return v12;
  }

  return result;
}

void __81__SASharedCache_sharedCacheWithUUID_slide_slidBaseAddress_findMappingsIfUnknown___block_invoke( id a1,  void *a2)
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 objectForKeyedSubscript:*((void *)a1 + 4)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    [v3 setObject:v4 forKeyedSubscript:*((void *)a1 + 4)];
  }

  uint64_t v5 = buf;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v102 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v84;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v84 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v83 + 1) + 8 * v10);
      if (*((void *)a1 + 6) != -1LL
        && [*(id *)(*((void *)&v83 + 1) + 8 * v10) slide] == *((void *)a1 + 6))
      {
        break;
      }

      uint64_t v12 = *((void *)a1 + 7);
      if (v12 != -1 && v11[2] == v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v102 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
  }

  else
  {
LABEL_14:

    uint64_t v13 = -[SASharedCache initWithUUID:slide:slidBaseAddress:]( objc_alloc(&OBJC_CLASS___SASharedCache),  *((void **)a1 + 4),  *((void *)a1 + 6),  *((void *)a1 + 7));
    uint64_t v14 = *(void *)(*((void *)a1 + 5) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [v6 firstObject];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [v6 addObject:*(void *)(*(void *)(*((void *)a1 + 5) + 8) + 40)];
    if (!v16)
    {
LABEL_32:
      if (*((_BYTE *)a1 + 72)) {
        +[SASharedCache _findLoadInfosForSharedCaches:](*((void *)a1 + 8), v6);
      }
      id v16 = 0LL;
      goto LABEL_58;
    }

    if ([v16 slide] == -1 || objc_msgSend(v16, "slidBaseAddress") == -1) {
      goto LABEL_55;
    }
    uint64_t v17 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
    uint64_t v18 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
    id v11 = (void *)v18;
    if (v17 == -1) {
      goto LABEL_52;
    }
    if (v18 == -1)
    {
      uint64_t v72 = [v16 slidBaseAddress];
      uint64_t v73 = v72 - [v16 slide];
      uint64_t v70 = v73 + [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
      uint64_t v71 = 16LL;
      goto LABEL_54;
    }

    uint64_t v19 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
    uint64_t v20 = v19 - [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
    uint64_t v21 = [v16 slidBaseAddress];
    if (v20 == v21 - [v16 slide])
    {
LABEL_55:
      [v16 binaryLoadInfos];
      __int128 v74 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v74 count]) {
        -[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:]( *(void *)(*(void *)(*((void *)a1 + 5) + 8) + 40),  v74,  [v16 slide],  objc_msgSend(v16, "slidBaseAddress"));
      }

      goto LABEL_58;
    }

    int v78 = *__error();
    _sa_logt();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) uuid];
      __int128 v77 = (void *)objc_claimAutoreleasedReturnValue();
      id v76 = [v77 UUIDString];
      uint64_t v75 = [v76 UTF8String];
      uint64_t v23 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
      uint64_t v24 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
      uint64_t v25 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
      uint64_t v26 = v25 - [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
      uint64_t v27 = [v16 slide];
      uint64_t v28 = [v16 slidBaseAddress];
      uint64_t v29 = [v16 slidBaseAddress];
      uint64_t v30 = [v16 slide];
      *(_DWORD *)buf = 136316674;
      uint64_t v88 = v75;
      __int16 v89 = 2048;
      uint64_t v90 = v23;
      __int16 v91 = 2048;
      uint64_t v92 = v24;
      __int16 v93 = 2048;
      uint64_t v94 = v26;
      __int16 v95 = 2048;
      uint64_t v96 = v27;
      __int16 v97 = 2048;
      uint64_t v98 = v28;
      __int16 v99 = 2048;
      uint64_t v100 = v29 - v30;
      _os_log_error_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_ERROR,  "Mismatch shared cache %s info: requested slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs existing shared cache with slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx)",  buf,  0x48u);
    }

    *__error() = v78;
    [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) uuid];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v3 UUIDString];
    id v11 = (void *)[v6 UTF8String];
    [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
    uint64_t v5 = (uint8_t *)[*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
    [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
    [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
    a1 = (id)[v16 slide];
    [v16 slidBaseAddress];
    [v16 slidBaseAddress];
    [v16 slide];
    _SASetCrashLogMessage( 3692,  "Mismatch shared cache %s info: requested slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs existing sh ared cache with slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx)",  v31,  v32,  v33,  v34,  v35,  v36,  (char)v11);

    _os_crash();
    __break(1u);
  }

  objc_storeStrong((id *)(*(void *)(*((void *)a1 + 5) + 8LL) + 40LL), v11);
  id v16 = v6;
  if (*((void *)a1 + 6) == -1LL) {
    goto LABEL_58;
  }
  id v16 = v6;
  if (*((void *)a1 + 7) == -1LL) {
    goto LABEL_58;
  }
  if ([*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide] != -1
    && [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress] != -1)
  {
    if ([*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide] == *((void *)a1 + 6))
    {
      id v16 = v6;
      if ([*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress] == *((void *)a1 + 7)) {
        goto LABEL_58;
      }
    }

    int v37 = *__error();
    _sa_logt();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
      uint64_t v40 = [*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
      uint64_t v41 = *((void *)a1 + 6);
      uint64_t v42 = *((void *)a1 + 7);
      id v43 = [*((id *)a1 + 4) UUIDString];
      uint64_t v44 = [v43 UTF8String];
      *(_DWORD *)buf = 134219010;
      *(void *)(v5 + 4) = v39;
      __int16 v89 = 2048;
      *(void *)(v5 + 14) = v40;
      __int16 v91 = 2048;
      uint64_t v92 = v41;
      __int16 v93 = 2048;
      *(void *)(v5 + 34) = v42;
      __int16 v95 = 2080;
      *(void *)(v5 + 44) = v44;
      _os_log_error_impl( &dword_186C92000,  v38,  OS_LOG_TYPE_ERROR,  "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx vs requested slide 0x%llx, slidBaseAdd ress 0x%llx for %s",  buf,  0x34u);
    }

    *__error() = v37;
    id v3 = (id)[*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slide];
    id v6 = (id)[*(id *)(*(void *)(*((void *)a1 + 5) + 8) + 40) slidBaseAddress];
    a1 = [*((id *)a1 + 4) UUIDString];
    [a1 UTF8String];
    _SASetCrashLogMessage( 3669,  "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx vs requested slide 0x%llx, slidBaseAddre ss 0x%llx for %s",  v45,  v46,  v47,  v48,  v49,  v50,  (char)v3);

    _os_crash();
    __break(1u);
    goto LABEL_32;
  }

  +[SASharedCache _applyBaseAddress:toSharedCaches:](*((void *)a1 + 8), *((void *)a1 + 7) - *((void *)a1 + 6), v6);
  uint64_t v51 = *(void *)(*(void *)(*((void *)a1 + 5) + 8LL) + 40LL);
  id v16 = v6;
  if (v51)
  {
    id v16 = v6;
    if ((*(_BYTE *)(v51 + 24) & 1) != 0)
    {
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      id v16 = v6;
      uint64_t v52 = [v16 countByEnumeratingWithState:&v79 objects:v101 count:16];
      if (v52)
      {
        id v11 = (void *)v52;
        uint64_t v53 = *(void *)v80;
        while (2)
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (void *)((char *)i + 1))
          {
            if (*(void *)v80 != v53) {
              objc_enumerationMutation(v16);
            }
            uint64_t v55 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
            if ([v55 slide] == *((void *)a1 + 6))
            {
              objc_storeStrong((id *)(*(void *)(*((void *)a1 + 5) + 8LL) + 40LL), v55);
              goto LABEL_47;
            }
          }

          id v11 = (void *)[v16 countByEnumeratingWithState:&v79 objects:v101 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4
{
  return (SASharedCache *)+[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]( (uint64_t)a1,  a3,  a4,  -1LL,  1);
}

+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5
{
  return (SASharedCache *)+[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]( (uint64_t)a1,  a3,  a4,  a5,  1);
}

uint64_t __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL))
  {
    uint64_t v3 = result;
    dyld_shared_cache_copy_uuid();
    id result = uuid_compare((const unsigned __int8 *)(v3 + 48), uu2);
    if (!(_DWORD)result)
    {
      id result = MEMORY[0x186E475F8](a2);
      *(void *)(*(void *)(*(void *)(v3 + 40) + 8LL) + 24LL) = result;
      *(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

- (void)setSlide:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2 == -1 || ((uint64_t v4 = a1[1], v4 != a2) ? (v5 = v4 == -1) : (v5 = 1), !v5 || (v6 = a1[2], v6 == -1)))
    {
      int v7 = *__error();
      _sa_logt();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [a1 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = [v9 UTF8String];
        __int16 v21 = 2048;
        uint64_t v22 = a2;
        _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "Changing %s slide to 0x%llx", buf, 0x16u);
      }

      *__error() = v7;
      id v10 = [a1 debugDescription];
      char v11 = [v10 UTF8String];
      _SASetCrashLogMessage(3836, "Changing %s slide to 0x%llx", v12, v13, v14, v15, v16, v17, v11);

      _os_crash();
      __break(1u);
    }

    if (v4 != a2)
    {
      a1[1] = a2;
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __26__SASharedCache_setSlide___block_invoke;
      v18[3] = &unk_189F62EA0;
      v18[4] = a1;
      v18[5] = v6 - a2;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v18);
    }
  }

uint64_t __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_2()
{
  return 1LL;
}

void __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_425(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    +[SABinaryLoadInfo addBinaryLoadInfoForDyldImage:toLoadInfos:isKernel:dataGatheringOptions:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  a2,  *(void **)(a1 + 32),  0,  0);
  }

+ (void)applyBinaryLoadInfos:(void *)a3 sharedCacheUUID:(uint64_t)a4 slide:(uint64_t)a5 slidBaseAddress:
{
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = objc_opt_self();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __76__SASharedCache_applyBinaryLoadInfos_sharedCacheUUID_slide_slidBaseAddress___block_invoke;
  v13[3] = &unk_189F62F68;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  id v14 = v9;
  id v15 = v8;
  uint64_t v18 = v10;
  id v11 = v8;
  id v12 = v9;
  +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v13);
}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if ((a5 & a4) == 0xFFFFFFFFFFFFFFFFLL)
  {
    int v17 = *__error();
    _sa_logt();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uu1 = 0;
      _os_log_error_impl( &dword_186C92000,  v18,  OS_LOG_TYPE_ERROR,  "matching shared cache with both slide and slidBaseAddress unknown",  uu1,  2u);
    }

    *__error() = v17;
    _SASetCrashLogMessage( 3788,  "matching shared cache with both slide and slidBaseAddress unknown",  v19,  v20,  v21,  v22,  v23,  v24,  v25);
    _os_crash();
    __break(1u);
  }

  if (a4 == -1LL || (unint64_t slide = self->_slide, slide == -1LL))
  {
    BOOL v10 = 0;
    if (a5 == -1LL) {
      return v10;
    }
    unint64_t slidBaseAddress = self->_slidBaseAddress;
    if (slidBaseAddress == -1LL || slidBaseAddress != a5) {
      return v10;
    }
  }

  else if (slide != a4)
  {
    return 0;
  }

  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", uu1);
  int v13 = uuid_compare(uu1, a3);
  BOOL v10 = v13 == 0;
  if (a4 != -1LL && a5 != -1LL && !v13 && (self->_slide == -1LL || self->_slidBaseAddress == -1LL))
  {
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __51__SASharedCache_matchesUUID_slide_slidBaseAddress___block_invoke;
    v26[3] = &unk_189F62E78;
    v26[4] = self;
    v26[5] = a5;
    v26[6] = a4;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v26);
    unint64_t v14 = self->_slide;
    unint64_t v15 = self->_slidBaseAddress;
    if (v14 == -1LL)
    {
      self->_unint64_t slide = a4 - a5 + v15;
    }

    else if (v15 == -1LL)
    {
      self->_unint64_t slidBaseAddress = a5 - a4 + v14;
    }
  }

  return v10;
}

void __51__SASharedCache_matchesUUID_slide_slidBaseAddress___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  [v3 uuid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)&OBJC_CLASS___SASharedCache, a1[5] - a1[6], v6);
}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4
{
  return -[SASharedCache matchesUUID:slide:slidBaseAddress:](self, "matchesUUID:slide:slidBaseAddress:", a3, a4, -1LL);
}

- (unint64_t)slide
{
  return self->_slide;
}

void __26__SASharedCache_setSlide___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 uuid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)&OBJC_CLASS___SASharedCache, *(void *)(a1 + 40), v6);
}

- (unint64_t)slidBaseAddress
{
  return self->_slidBaseAddress;
}

- (void)setSlidBaseAddress:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2 == -1 || ((uint64_t v4 = a1[2], v4 != a2) ? (v5 = v4 == -1) : (v5 = 1), !v5 || (v6 = a1[1], v6 == -1)))
    {
      int v7 = *__error();
      _sa_logt();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [a1 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v20 = [v9 UTF8String];
        __int16 v21 = 2048;
        uint64_t v22 = a2;
        _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "Changing %s slidBaseAddress to 0x%llx", buf, 0x16u);
      }

      *__error() = v7;
      id v10 = [a1 debugDescription];
      char v11 = [v10 UTF8String];
      _SASetCrashLogMessage(3853, "Changing %s slidBaseAddress to 0x%llx", v12, v13, v14, v15, v16, v17, v11);

      _os_crash();
      __break(1u);
    }

    if (v4 != a2)
    {
      a1[2] = a2;
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __36__SASharedCache_setSlidBaseAddress___block_invoke;
      v18[3] = &unk_189F62EA0;
      v18[4] = a1;
      v18[5] = a2 - v6;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v18);
    }
  }

void __36__SASharedCache_setSlidBaseAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 uuid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)&OBJC_CLASS___SASharedCache, *(void *)(a1 + 40), v6);
}

uint64_t __47__SASharedCache__findLoadInfosForSharedCaches___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (void *)MEMORY[0x186E47ACC]();
  if (!SAShouldIgnoreSegmentWithCName((const char *)a4))
  {
    uuidForBytes(a2);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    SAFilepathForCString(a3);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v15 = 0LL;
    }
    +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v13, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    SANSStringForCString(a4);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      int v22 = *__error();
      _sa_logt();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v31 = a4;
        _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, "No nsstring for %s", buf, 0xCu);
      }

      *__error() = v22;
      _SASetCrashLogMessage(3907, "No nsstring for %s", v24, v25, v26, v27, v28, v29, (char)a4);
      _os_crash();
      __break(1u);
    }

    uint64_t v18 = v17;
    -[SABinary segmentWithCleanName:](v16, v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SASegment segmentWithBinary:name:length:]((uint64_t)&OBJC_CLASS___SASegment, v16, v18, a6);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v16, v19);
    }

    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v19,  *(void *)(a1 + 40) + a5,  0,  0LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) addObject:v20];
  }

  objc_autoreleasePoolPop(v12);
  return 0LL;
}

+ (void)addDSCSymData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  *(void *)uu = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v27 = -1LL;
  id v4 = a3;
  [v4 bytes];
  [v4 length];
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v26[3] = 0LL;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __31__SASharedCache_addDSCSymData___block_invoke;
  v25[3] = &unk_189F62818;
  v25[4] = v26;
  +[SASharedCache _doSharedCachesWork:]((uint64_t)a1, v25);
  uint64_t v19 = v5;
  uint64_t v20 = 3221225472LL;
  __int16 v21 = __31__SASharedCache_addDSCSymData___block_invoke_3;
  int v22 = &unk_189F62F18;
  uint64_t v24 = v26;
  id v6 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2560];
  id v23 = v6;
  int v7 = dscsym_iterate_buffer();
  if (v7)
  {
    int v8 = *__error();
    _sa_logt();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v29 = v7;
      _os_log_impl(&dword_186C92000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Error parsing dsc buffer: %d", buf, 8u);
    }

    *__error() = v8;
  }

  else if (uuid_is_null(uu))
  {
    int v10 = *__error();
    _sa_logt();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186C92000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: NULL UUID for dscsym", buf, 2u);
    }

    *__error() = v10;
  }

  else
  {
    +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)&OBJC_CLASS___SABinaryLoadInfo, v6);
    uuidForBytes((uint64_t)uu);
    v13[0] = v5;
    v13[1] = 3221225472LL;
    v13[2] = __31__SASharedCache_addDSCSymData___block_invoke_434;
    v13[3] = &unk_189F62F40;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v12;
    uint64_t v16 = v26;
    uint64_t v17 = v27;
    id v15 = v6;
    id v18 = a1;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v13);
  }

  _Block_object_dispose(v26, 8);
}

uint64_t __31__SASharedCache_addDSCSymData___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__SASharedCache_addDSCSymData___block_invoke_2;
  v3[3] = &unk_189F62EF0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __31__SASharedCache_addDSCSymData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "slide", (void)v12) != -1)
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v11 slide];
          *a4 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

uint64_t __31__SASharedCache_addDSCSymData___block_invoke_3( uint64_t a1,  uint64_t a2,  _BYTE *a3,  char *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v12 = (void *)MEMORY[0x186E47ACC]();
  if (SAShouldIgnoreSegmentWithCName(a4)) {
    goto LABEL_15;
  }
  uuidForBytes(a2);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  SAFilepathForCString(a3);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    __int128 v15 = 0LL;
  }
  +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v13, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 path];
  id v18 = (void *)v17;
  if (!a3 || v17) {
    goto LABEL_10;
  }
  if (*a3)
  {
    SANSStringForCString(a3);
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16) {
      objc_setProperty_atomic_copy(v16, v19, v18, 80LL);
    }
LABEL_10:
  }

  SANSStringForCString(a4);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    int v25 = *__error();
    _sa_logt();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = a4;
      _os_log_error_impl(&dword_186C92000, v26, OS_LOG_TYPE_ERROR, "No nsstring for %s", buf, 0xCu);
    }

    *__error() = v25;
    _SASetCrashLogMessage(3990, "No nsstring for %s", v27, v28, v29, v30, v31, v32, (char)a4);
    _os_crash();
    __break(1u);
  }

  __int16 v21 = v20;
  -[SABinary segmentWithCleanName:](v16, v20);
  int v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[SASegment segmentWithBinary:name:length:]((uint64_t)&OBJC_CLASS___SASegment, v16, v21, a6);
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:](v16, v22);
  }

  +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v22,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + a5,  0,  0LL);
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v23];

LABEL_15:
  objc_autoreleasePoolPop(v12);
  return 0LL;
}

void __31__SASharedCache_addDSCSymData___block_invoke_434(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = v3;
    [v3 firstObject];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 binaryLoadInfos];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:]( *(void *)(a1 + 64),  *(void **)(a1 + 40),  v8,  *(void *)(a1 + 56) + v8,  v4);
    }
  }

  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    [v13 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v9 = objc_alloc(&OBJC_CLASS___SASharedCache);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    char v11 = -[SASharedCache initWithUUID:slide:slidBaseAddress:](v9, *(void **)(a1 + 32), v10, *(void *)(a1 + 56) + v10);
    [v4 addObject:v11];
    __int128 v12 = (void *)[*(id *)(a1 + 40) copy];
    [v11 setBinaryLoadInfos:v12];
  }
}

+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(void *)a4 binaryLoadInfos:
{
  id v6 = a4;
  id v7 = a2;
  uint64_t v8 = objc_opt_self();
  +[SASharedCache applyBinaryLoadInfos:sharedCacheUUID:slide:slidBaseAddress:](v8, v6, v7, a3, -1LL);

  +[SASharedCache sharedCacheWithUUID:slide:](&OBJC_CLASS___SASharedCache, "sharedCacheWithUUID:slide:", v7, a3);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __76__SASharedCache_applyBinaryLoadInfos_sharedCacheUUID_slide_slidBaseAddress___block_invoke( uint64_t a1,  void *a2)
{
  id v7 = a2;
  [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = v3;
    +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:]( *(void *)(a1 + 64),  *(void **)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  v3);
  }

  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    [v7 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v5 = -[SASharedCache initWithUUID:slide:slidBaseAddress:]( objc_alloc(&OBJC_CLASS___SASharedCache),  *(void **)(a1 + 32),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
    [v4 addObject:v5];
    id v6 = (void *)[*(id *)(a1 + 40) copy];
    [v5 setBinaryLoadInfos:v6];
  }
}

- (unint64_t)startAddress
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 loadAddress];
  }
  else {
    unint64_t v4 = -1LL;
  }

  return v4;
}

- (unint64_t)endAddress
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 length];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0x10000000LL;
    }
    unint64_t v6 = v5 + [v3 loadAddress];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)(id)[objc_alloc(NSString) initWithFormat:@"0x%llx (slide 0x%llx slidBaseAddress 0x%llx) Shared cache <%@> (%lu binaries)", -[SASharedCache startAddress](self, "startAddress"), self->_slide, self->_slidBaseAddress, self->_uuid, -[NSArray count](self->_binaryLoadInfos, "count")];
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBinaryLoadInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  -[NSUUID UUIDString](uuid, "UUIDString");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v5, (uint64_t)@"uuid", v6);

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_slide];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, @"slide", v7);

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_slidBaseAddress];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, @"slidBaseAddress", v8);
}

+ (id)classDictionaryKey
{
  return @"SASharedCache";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_binaryLoadInfos, "count") + 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  *(_WORD *)&a3->var0 = 769;
  *(void *)(&a3->var3 + 1) = self->_slide;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", a3->var2);
  if (-[SASharedCache sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") == a4)
  {
    if (-[NSArray count](self->_binaryLoadInfos, "count") < 0xFFFF)
    {
      unsigned __int16 v11 = -[NSArray count](self->_binaryLoadInfos, "count");
      a3->uint64_t var3 = v11;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( (char *)&a3->var4 + 4,  v11,  self->_binaryLoadInfos,  v10);
      uint64_t var3 = a3->var3;
      goto LABEL_8;
    }

    int v19 = *__error();
    _sa_logt();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = -[SASharedCache debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315394;
      unint64_t v37 = [v21 UTF8String];
      __int16 v38 = 1024;
      LODWORD(v39) = 0xFFFF;
      _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "%s: more than %d binaries", buf, 0x12u);
    }

    *__error() = v19;
    id v22 = -[SASharedCache debugDescription](self, "debugDescription");
    char v23 = [v22 UTF8String];
    _SASetCrashLogMessage(5238, "%s: more than %d binaries", v24, v25, v26, v27, v28, v29, v23);

    id v13 = (os_log_s *)_os_crash();
    __break(1u);
LABEL_12:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v37 = a4;
      __int16 v38 = 2048;
      uint64_t v39 = 28LL;
      _os_log_error_impl( &dword_186C92000,  v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu != serialized SASharedCache struct %lu",  buf,  0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage( 5243,  "bufferLength %lu != serialized SASharedCache struct %lu",  v30,  v31,  v32,  v33,  v34,  v35,  a4);
    _os_crash();
    __break(1u);
  }

  int v6 = *__error();
  _sa_logt();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  if (a4 <= 0x2B) {
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SASharedCache debugDescription](self, "debugDescription");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSUInteger v15 = -[NSArray count](self->_binaryLoadInfos, "count");
    *(_DWORD *)buf = 138412546;
    unint64_t v37 = (unint64_t)v14;
    __int16 v38 = 2048;
    uint64_t v39 = v15;
    _os_log_impl( &dword_186C92000,  v5,  OS_LOG_TYPE_DEFAULT,  "WARNING: SASharedCache %@ got its %lu binaries after starting serialization!",  buf,  0x16u);
  }

  uint64_t v16 = __error();
  uint64_t var3 = 0LL;
  *uint64_t v16 = v6;
  a3->uint64_t var3 = 0;
LABEL_8:
  uint64_t v17 = (unint64_t *)((char *)&a3->var4 + 8 * var3 + 4);
  *uint64_t v17 = self->_slidBaseAddress;
  v17[1] = self->_flags;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = self->_binaryLoadInfos;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }

        while (v9 != v11);
        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v56[13] = *MEMORY[0x1895F89C0];
  if (a4 <= 0x1B)
  {
    int v18 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v54 = a4;
      __int16 v55 = 2048;
      *(void *)uint64_t v56 = 28LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct %lu",  buf,  0x16u);
    }

    *__error() = v18;
    _SASetCrashLogMessage( 5270,  "bufferLength %lu < serialized SASharedCache struct %lu",  v19,  v20,  v21,  v22,  v23,  v24,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_18:
    int v25 = *__error();
    _sa_logt();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      unint64_t v54 = a4;
      __int16 v55 = 1024;
      *(_DWORD *)uint64_t v56 = v27;
      v56[2] = 2048;
      *(void *)&v56[3] = 8 * v27 + 28;
      _os_log_error_impl( &dword_186C92000,  v26,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  buf,  0x1Cu);
    }

    *__error() = v25;
    _SASetCrashLogMessage( 5271,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  v28,  v29,  v30,  v31,  v32,  v33,  a4);
    _os_crash();
    __break(1u);
LABEL_21:
    int v34 = *__error();
    _sa_logt();
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      unint64_t v54 = a4;
      __int16 v55 = 1024;
      *(_DWORD *)uint64_t v56 = v36;
      v56[2] = 2048;
      *(void *)&v56[3] = 9 * v36 + 28;
      _os_log_error_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  buf,  0x1Cu);
    }

    *__error() = v34;
    _SASetCrashLogMessage( 5278,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  v37,  v38,  v39,  v40,  v41,  v42,  a4);
    _os_crash();
    __break(1u);
LABEL_24:
    int v43 = *__error();
    _sa_logt();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      unint64_t v54 = a4;
      __int16 v55 = 1024;
      *(_DWORD *)uint64_t v56 = v45;
      v56[2] = 2048;
      *(void *)&v56[3] = 9 * v45 + 28;
      _os_log_error_impl( &dword_186C92000,  v44,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  buf,  0x1Cu);
    }

    *__error() = v43;
    _SASetCrashLogMessage( 5285,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  v46,  v47,  v48,  v49,  v50,  v51,  a4);
    _os_crash();
    __break(1u);
LABEL_27:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SASharedCache version",  0LL);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }

  uuidForBytes((uint64_t)a3 + 2);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = *(unsigned __int8 *)(v5 + 1);
  if (v7 < 2)
  {
    uint64_t v14 = 0LL;
    uint64_t v11 = -1LL;
    goto LABEL_11;
  }

  uint64_t v8 = *(unsigned __int16 *)(v5 + 18);
  uint64_t v9 = 8 * v8;
  if (8 * v8 + 36 > a4) {
    goto LABEL_21;
  }
  uint64_t v10 = v5 + 8 * v8;
  uint64_t v13 = *(void *)(v10 + 28);
  uint64_t v12 = v10 + 28;
  uint64_t v11 = v13;
  if (v7 < 3)
  {
    uint64_t v14 = 0LL;
    goto LABEL_11;
  }

  if (v9 + 44 > a4) {
    goto LABEL_24;
  }
  uint64_t v14 = *(void *)(v12 + 8);
LABEL_11:
  uint64_t v15 = +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]( (uint64_t)&OBJC_CLASS___SASharedCache,  v6,  *(void *)(v5 + 20),  v11,  0);
  uint64_t v16 = (void *)v15;
  if (v14 && v15) {
    *(_DWORD *)(v15 + 28) = v14;
  }

  return v16;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v39[13] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  if (a4 <= 0x1B)
  {
    int v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v37 = a4;
      __int16 v38 = 2048;
      *(void *)uint64_t v39 = 28LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct %lu",  buf,  0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage( 5306,  "bufferLength %lu < serialized SASharedCache struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_11:
    int v24 = *__error();
    _sa_logt();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *((unsigned __int16 *)a3 + 9);
      *(_DWORD *)buf = 134218496;
      unint64_t v37 = a4;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v26;
      v39[2] = 2048;
      *(void *)&v39[3] = 8 * v26 + 28;
      _os_log_error_impl( &dword_186C92000,  v25,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  buf,  0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage( 5307,  "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu",  v27,  v28,  v29,  v30,  v31,  v32,  a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAInstruction version",  0LL);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }

  uint64_t v12 = v11;
  if (!-[NSArray count](self->_binaryLoadInfos, "count"))
  {
    uint64_t v13 = *((unsigned __int16 *)a3 + 9);
    if (*((_WORD *)a3 + 9))
    {
      uint64_t v14 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 28, v13, v10, v12, v14);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __128__SASharedCache_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke;
      v34[3] = &unk_189F63020;
      v34[4] = self;
      id v35 = v15;
      id v16 = v15;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)&OBJC_CLASS___SASharedCache, v34);
    }
  }
}

void __128__SASharedCache_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v16 = a2;
  [*(id *)(a1 + 32) uuid];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v4 count])
  {
    int v5 = *__error();
    _sa_logt();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) debugDescription];
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = [v7 UTF8String];
      _os_log_error_impl( &dword_186C92000,  v6,  OS_LOG_TYPE_ERROR,  "In deserialization, no shared caches in cache for shared cache %s",  buf,  0xCu);
    }

    *__error() = v5;
    id v8 = [*(id *)(a1 + 32) debugDescription];
    char v9 = [v8 UTF8String];
    _SASetCrashLogMessage( 5316,  "In deserialization, no shared caches in cache for shared cache %s",  v10,  v11,  v12,  v13,  v14,  v15,  v9);

    _os_crash();
    __break(1u);
  }

  +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:]( (uint64_t)SASharedCache,  *(void **)(a1 + 40),  [*(id *)(a1 + 32) slide],  objc_msgSend(*(id *)(a1 + 32), "slidBaseAddress"),  v4);
}

@end