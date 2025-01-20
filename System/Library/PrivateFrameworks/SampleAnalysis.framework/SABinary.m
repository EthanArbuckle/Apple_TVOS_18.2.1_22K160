@interface SABinary
+ (SABinary)binaryWithUUID:(id)a3;
+ (SABinary)binaryWithUUID:(id)a3 absolutePath:(id)a4;
+ (id)binaryWithPath:(uint64_t)a1 architecture:(void *)a2 additionalCSSymbolicatorFlags:(uint64_t)a3;
+ (id)binaryWithSymbolOwner:(uint64_t)a3 fromDisk:(char)a4;
+ (id)classDictionaryKey;
+ (id)dataFillingQueue;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
+ (uint64_t)haveMultipleBinariesWithUUID:(uint64_t)a1;
+ (void)_addDsymPath:(uint64_t)a1;
+ (void)_doCachedBinariesWork:(uint64_t)a1;
+ (void)_doDsymPathsWork:(uint64_t)a1;
+ (void)addDsymPaths:(id)a3;
+ (void)addPath:(id)a3 forBinaryWithUUID:(id)a4;
+ (void)addSymbolsFromTailspin:(id)a3;
+ (void)binaryForDyldImage:(int)a3 options:;
+ (void)clearCaches;
+ (void)clearCoreSymbolicationCaches;
+ (void)clearSymbolCaches;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4;
- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
- (BOOL)hasTextExecSegment;
- (NSArray)segments;
- (NSString)binaryVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)codesigningID;
- (NSString)debugDescription;
- (NSString)name;
- (NSString)path;
- (NSString)teamID;
- (NSUUID)uuid;
- (SABinary)initWithUUID:(id)a3 path:(id)a4;
- (id)addSymbolWithOffsetIntoBinary:(unint64_t)a3 length:(void *)a4 name:;
- (id)createFakeEntireBinarySegment;
- (id)instructionAtOffsetIntoBinary:(int64_t)a3;
- (id)instructionAtOffsetIntoTextSegment:(unint64_t)a3;
- (id)segmentAtOffsetIntoBinary:(int)a3 createFakeSegmentIfNeeded:;
- (id)segmentWithCleanName:(void *)a1;
- (id)segmentWithName:(id)a3;
- (id)symbolOwnerWrapperWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 additionalCSSymbolicatorFlags:;
- (unint64_t)length;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)textSegmentLength;
- (void)addInfoFromSymbolOwner:(uint64_t)a3 fromDisk:(char)a4 includeExpensiveInfo:(int)a5;
- (void)addPath:(id)a3;
- (void)addSegment:(void *)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)clearCoreSymbolicationCache;
- (void)clearSymbolCache;
- (void)findPathViaBinaryLocator;
- (void)gatherBundleInfo;
- (void)gatherInfoWithDataGatheringOptions:(unint64_t)a3 pid:(int)a4;
- (void)getCodeSignInfoWithBundleUrl:(void *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)saveInfoFromBundle:(void *)a1;
- (void)segmentAtOffsetIntoBinary:(void *)a1;
- (void)segmentWithCSSegment:(uint64_t)a3 symbolOwnerLayoutMatchesDisk:(int)a4 symbolOwnerBaseAddress:(uint64_t)a5;
- (void)setLength:(void *)a1;
- (void)setName:(void *)a1;
- (void)symbolicateAllInstructionsWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 onlyDsym:(int)a6 additionalCSSymbolicatorFlags:;
- (void)symbolicateAllInstructionsWithOptions:(unint64_t)a3 pid:(int)a4;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SABinary

- (NSArray)segments
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_segments, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

+ (void)_doCachedBinariesWork:(uint64_t)a1
{
  v4 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C4B15D8);
  if (!qword_18C4B15E8)
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
    v3 = (void *)qword_18C4B15E8;
    qword_18C4B15E8 = (uint64_t)v2;
  }

  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C4B15D8);
}

+ (void)clearCaches
{
  uint64_t v3 = 0LL;
  v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  v6 = __Block_byref_object_copy__2;
  v7 = __Block_byref_object_dispose__2;
  id v8 = 0LL;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __23__SABinary_clearCaches__block_invoke;
  v2[3] = &unk_189F62818;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3];
  _Block_object_dispose(&v3, 8);
}

void __23__SABinary_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ((id)qword_18C4B15E8 == v15)
  {
    qword_18C4B15E8 = 0LL;
  }

  else
  {
    int v6 = *__error();
    _sa_logt();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "global doesn't match local", buf, 2u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(1087, "global doesn't match local", v8, v9, v10, v11, v12, v13, v14);
    _os_crash();
    __break(1u);
  }

void __23__SABinary_clearCaches__block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearSymbolCache];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

+ (void)clearSymbolCaches
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  uint64_t v6 = __Block_byref_object_copy__2;
  uint64_t v7 = __Block_byref_object_dispose__2;
  id v8 = 0LL;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __29__SABinary_clearSymbolCaches__block_invoke;
  v2[3] = &unk_189F62818;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_95];
  _Block_object_dispose(&v3, 8);
}

void __29__SABinary_clearSymbolCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __29__SABinary_clearSymbolCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearSymbolCache];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

+ (void)clearCoreSymbolicationCaches
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  uint64_t v6 = __Block_byref_object_copy__2;
  uint64_t v7 = __Block_byref_object_dispose__2;
  id v8 = 0LL;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __40__SABinary_clearCoreSymbolicationCaches__block_invoke;
  v2[3] = &unk_189F62818;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_96];
  _Block_object_dispose(&v3, 8);
}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearCoreSymbolicationCache];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

+ (uint64_t)haveMultipleBinariesWithUUID:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  uint64_t v10 = 0LL;
  __int128 v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__SABinary_haveMultipleBinariesWithUUID___block_invoke;
  v7[3] = &unk_189F628C0;
  __int128 v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  +[SABinary _doCachedBinariesWork:](v3, v7);
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __41__SABinary_haveMultipleBinariesWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v3 count] > 1;
}

+ (SABinary)binaryWithUUID:(id)a3 absolutePath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (([v7 isAbsolutePath] & 1) == 0)
    {
      int v11 = *__error();
      _sa_logt();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = [v8 UTF8String];
        _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "path %s is not absolute", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v11;
      char v13 = [v8 UTF8String];
      _SASetCrashLogMessage(1141, "path %s is not absolute", v14, v15, v16, v17, v18, v19, v13);
      _os_crash();
      __break(1u);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000LL;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    id v29 = 0LL;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __40__SABinary_binaryWithUUID_absolutePath___block_invoke;
    v20[3] = &unk_189F628E8;
    id v21 = v6;
    id v22 = v8;
    p___int128 buf = &buf;
    id v24 = a1;
    +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v20);
    id v9 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    [a1 binaryWithUUID:v6];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (SABinary *)v9;
}

void __40__SABinary_binaryWithUUID_absolutePath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        char v34 = 0;
        [v9 path];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = SAFilepathMatches(v10, *(void **)(a1 + 40), &v34);

        if (v11)
        {
          [v9 path];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
          }

          else if ([v4 count] != 1)
          {
            int v22 = *__error();
            _sa_logt();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v24 = [*(id *)(a1 + 32) UUIDString];
              uint64_t v25 = [v24 UTF8String];
              *(_DWORD *)__int128 buf = 136315138;
              uint64_t v40 = v25;
              _os_log_error_impl( &dword_186C92000,  v23,  OS_LOG_TYPE_ERROR,  "Multiple binaries for %s, but no path",  buf,  0xCu);
            }

            *__error() = v22;
            id v26 = [*(id *)(a1 + 32) UUIDString];
            char v27 = [v26 UTF8String];
            _SASetCrashLogMessage(1150, "Multiple binaries for %s, but no path", v28, v29, v30, v31, v32, v33, v27);

            _os_crash();
            __break(1u);
          }

          if (v34)
          {
            SACachedNSString(*(void **)(a1 + 40));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9) {
              objc_setProperty_atomic_copy(v9, v13, v14, 80LL);
            }
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v9);
          goto LABEL_18;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (SABinary)binaryWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __27__SABinary_binaryWithUUID___block_invoke;
  v8[3] = &unk_189F62910;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v12;
  id v11 = a1;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v8);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (SABinary *)v6;
}

void __27__SABinary_binaryWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      int v9 = *__error();
      _sa_logt();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) path];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl( &dword_186C92000,  v10,  OS_LOG_TYPE_DEFAULT,  "WARNING: Multiple binaries with UUID %@ exist, using %@",  buf,  0x16u);
      }

      *__error() = v9;
    }
  }

  else
  {
    uint64_t v13 = [objc_alloc(*(Class *)(a1 + 48)) initWithUUID:*(void *)(a1 + 32) path:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  0);
    [v3 setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

+ (id)binaryWithPath:(uint64_t)a1 architecture:(void *)a2 additionalCSSymbolicatorFlags:(uint64_t)a3
{
  id v4 = a2;
  uint64_t v5 = objc_opt_self();
  uint64_t SymbolOwnerForArchitectureAtPath = CreateSymbolOwnerForArchitectureAtPath(a3, v4);
  uint64_t v8 = v7;

  if ((CSIsNull() & 1) != 0)
  {
    int v9 = 0LL;
  }

  else
  {
    +[SABinary binaryWithSymbolOwner:fromDisk:](v5, SymbolOwnerForArchitectureAtPath, v8, 1);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    CSRelease();
  }

  return v9;
}

+ (id)binaryWithSymbolOwner:(uint64_t)a3 fromDisk:(char)a4
{
  uint64_t v7 = (void *)objc_opt_self();
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if ((CSSymbolOwnerIsDsym() & 1) != 0)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    Path = (_BYTE *)CSSymbolOwnerGetPath();
    uint64_t v9 = SAFilepathForCString(Path);
  }

  if (CFUUIDBytes | v9)
  {
    if (CFUUIDBytes) {
      uint64_t v11 = (void *)CFUUIDBytes;
    }
    else {
      uint64_t v11 = &UUID_NULL;
    }
    uuidForBytes((uint64_t)v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v13 = 0LL;
    }
    [v7 binaryWithUUID:v12 absolutePath:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 path];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || !v9)
    {
      if (v14) {
        goto LABEL_17;
      }
    }

    else if (v14)
    {
      objc_setProperty_atomic_copy(v14, v16, (id)v9, 80LL);
LABEL_17:
      -[SABinary addInfoFromSymbolOwner:fromDisk:includeExpensiveInfo:]((uint64_t)v14, a2, a3, a4, 0);
    }

    goto LABEL_19;
  }

  uint64_t v14 = 0LL;
LABEL_19:

  return v14;
}

+ (void)_doDsymPathsWork:(uint64_t)a1
{
  id v3 = a2;
  objc_opt_self();
  if (qword_18C4B15F8 != -1) {
    dispatch_once(&qword_18C4B15F8, &__block_literal_global_102);
  }
  id v2 = (id)qword_18C4B15F0;
  objc_sync_enter(v2);
  v3[2](v3, qword_18C4B15F0);
  objc_sync_exit(v2);
}

void __29__SABinary__doDsymPathsWork___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
  v1 = (void *)qword_18C4B15F0;
  qword_18C4B15F0 = v0;
}

+ (void)_addDsymPath:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __25__SABinary__addDsymPath___block_invoke;
  v5[3] = &unk_189F62958;
  id v6 = v2;
  id v4 = v2;
  +[SABinary _doDsymPathsWork:](v3, v5);
}

void __25__SABinary__addDsymPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0) {
    [v3 addObject:*(void *)(a1 + 32)];
  }
}

void __22__SABinary__dsymPaths__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)addDsymPaths:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&__int128 v5 = 138412546LL;
    __int128 v16 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "rangeOfString:", @".dSYM", v16);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[SABinary _addDsymPath:]((uint64_t)a1, v9);
        }

        else
        {
          objc_msgSend(v9, "substringWithRange:", 0, v10 + v11);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 stringByDeletingLastPathComponent];
          uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!-[__CFString length](v13, "length"))
          {

            uint64_t v13 = @"./";
          }

          int v14 = *__error();
          _sa_logt();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = v16;
            v23 = v9;
            __int16 v24 = 2112;
            uint64_t v25 = v13;
            _os_log_debug_impl(&dword_186C92000, v15, OS_LOG_TYPE_DEBUG, "Replaced %@ with %@", buf, 0x16u);
          }

          *__error() = v14;
          +[SABinary _addDsymPath:]((uint64_t)a1, v13);
        }
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v6);
  }
}

+ (void)addPath:(id)a3 forBinaryWithUUID:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 isAbsolutePath])
  {
    id v6 = +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v5, v8);
  }

  else
  {
    +[SABinary binaryWithUUID:](&OBJC_CLASS___SABinary, "binaryWithUUID:", v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addPath:v8];
  }
}

+ (void)addSymbolsFromTailspin:(id)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  DictGetString(v3, @"Name");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"Path");
  id newValue = (id)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v3, @"Size");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 unsignedLongLongValue];

  DictGetString(v3, @"UUID_String");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BundleID");
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BundleVersion");
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BundleShortVersion");
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BinaryVersion");
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v3, @"TEXT_EXEC");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 BOOLValue];

  if (v6)
  {
    uuidForString(v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      else {
        id v9 = 0LL;
      }
      +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v43, v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = @"__TEXT";
      if (v8) {
        uint64_t v11 = @"__TEXT_EXEC";
      }
      v41 = v11;
      -[SABinary segmentWithCleanName:](v10, v41);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[SASegment segmentWithBinary:name:length:]((uint64_t)&OBJC_CLASS___SASegment, v10, v41, v5);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SABinary addSegment:](v10, v12);
      }

      objc_msgSend(v10, "path", v41, v43);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
      }

      else if ([newValue length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v18, newValue, 80LL);
      }

      [v10 name];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
      }

      else if ([v48 length])
      {
        [v10 path];
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20
          || ([v10 path],
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(),
              Path = -[NSString copyLastPathComponent](v21),
              char v23 = [Path hasPrefix:v48],
              Path,
              v21,
              v20,
              (v23 & 1) == 0))
        {
          -[SABinary setName:](v10, v48);
        }
      }

      [v10 bundleIdentifier];
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
      }

      else if ([v47 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v25, v47, 88LL);
      }

      [v10 bundleVersion];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
      }

      else if ([v46 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v27, v46, 96LL);
      }

      [v10 bundleShortVersion];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
      }

      else if ([v45 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v29, v45, 104LL);
      }

      [v10 binaryVersion];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
      }

      else if ([v44 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v31, v44, 112LL);
      }

      DictGetDict(v3, @"Symbols");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = v32;
      if (v32)
      {
        id v34 = v32;
        if (v12)
        {
          __int128 v35 = v12;
          objc_sync_enter(v35);
          v54[0] = MEMORY[0x1895F87A8];
          v54[1] = 3221225472LL;
          v54[2] = __32__SASegment_addTailspinSymbols___block_invoke;
          v54[3] = &unk_189F62698;
          v54[4] = v35;
          [v34 enumerateKeysAndObjectsUsingBlock:v54];
          [v35[7] allValues];
          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_exit(v35);

          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          id v37 = v36;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:buf count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v51;
            do
            {
              for (uint64_t i = 0LL; i != v38; ++i)
              {
                if (*(void *)v51 != v39) {
                  objc_enumerationMutation(v37);
                }
                -[SAInstruction checkForNewSymbol](*(unint64_t **)(*((void *)&v50 + 1) + 8 * i));
              }

              uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:buf count:16];
            }

            while (v38);
          }
        }
      }
    }

    else
    {
      int v16 = *__error();
      _sa_logt();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        v56 = v6;
        _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "Unable to convert %@ into uuid", buf, 0xCu);
      }

      *__error() = v16;
    }
  }

  else
  {
    int v14 = *__error();
    _sa_logt();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v56 = v48;
      _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, "No uuid in tailspin symbol chunk for %@", buf, 0xCu);
    }

    *__error() = v14;
  }
}

- (id)segmentWithCleanName:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = (void *)v4[7];
    if (v5)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v6 = v5;
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
            objc_msgSend(v10, "name", (void)v15);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = [v11 isEqualToString:v3];

            if (v12)
            {
              id v7 = v10;
              int v13 = 1;
              goto LABEL_13;
            }
          }

          id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      int v13 = 0;
LABEL_13:
    }

    else
    {
      id v7 = 0LL;
      int v13 = 1;
    }

    objc_sync_exit(v4);

    if (v13) {
      a1 = v7;
    }
    else {
      a1 = 0LL;
    }
  }

  return a1;
}

- (void)addSegment:(void *)a1
{
  id v9 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = v3[7];
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
      id v6 = v3[7];
      v3[7] = (void *)v5;

      uint64_t v4 = v3[7];
    }

    [v4 addObject:v9];
    [v3[7] sortUsingComparator:&__block_literal_global_114];
    id v7 = v3[6];
    if (v7)
    {
      -[SASegment grabInstructionsFromOtherSegment:](v9, v7);
      if (-[SASegment isEmpty](v3[6]))
      {
        uint64_t v8 = v3[6];
        v3[6] = 0LL;
      }
    }

    objc_sync_exit(v3);
  }
}

- (void)setName:(void *)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = [v6 copy];
    uint64_t v5 = (void *)v3[3];
    v3[3] = v4;

    objc_sync_exit(v3);
  }
}

- (SABinary)initWithUUID:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SABinary;
  id v9 = -[SABinary init](&v12, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_path, a4);
  }

  return v10;
}

- (NSString)name
{
  id v2 = self;
  objc_sync_enter(v2);
  name = v2->_name;
  if (name) {
    Path = name;
  }
  else {
    Path = (NSString *)-[NSString copyLastPathComponent](v2->_path);
  }
  uint64_t v5 = Path;
  objc_sync_exit(v2);

  return v5;
}

- (void)addPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v12 = 0;
  if (!SAFilepathMatches(v5->_path, v4, &v12))
  {
    int v8 = *__error();
    _sa_logt();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SABinary debugDescription](v5, "debugDescription");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      __int128 v16 = v10;
      _os_log_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_DEFAULT,  "WARNING: Tried to set mismatched path %@ on binary %@",  buf,  0x16u);
    }

    goto LABEL_9;
  }

  if (v12)
  {
    uint64_t v6 = SACachedNSString(v4);
    path = v5->_path;
    v5->_path = (NSString *)v6;

    if (([v4 isAbsolutePath] & 1) == 0)
    {
      int v8 = *__error();
      _sa_logt();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[SABinary debugDescription](v5, "debugDescription");
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412290;
        id v14 = v11;
        _os_log_debug_impl(&dword_186C92000, v9, OS_LOG_TYPE_DEBUG, "%@ set relative path", buf, 0xCu);
      }

- (void)segmentAtOffsetIntoBinary:(void *)a1
{
  if (a1)
  {
    a1 = -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](a1, a2, 0);
  }

  return a1;
}

- (id)segmentAtOffsetIntoBinary:(int)a3 createFakeSegmentIfNeeded:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a1;
  objc_sync_enter(v6);
  id v7 = (void *)v6[7];
  if (v7)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = 0LL;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasOffsetIntoBinary", (void)v17)
            && [v13 offsetIntoBinary] <= a2)
          {
            if ([v13 length])
            {
              uint64_t v14 = [v13 offsetIntoBinary];
              if ([v13 length] + v14 > a2)
              {
                id v16 = v13;

                goto LABEL_23;
              }

              id v15 = 0LL;
            }

            else
            {
              id v15 = v13;
            }

            id v10 = v15;
          }
        }

        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      if (v10)
      {
        id v10 = v10;
        id v16 = v10;
LABEL_23:

        goto LABEL_28;
      }
    }

    else
    {
    }
  }

  id v16 = 0LL;
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    if (a3)
    {
      -[SABinary createFakeEntireBinarySegment](v6);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (id)createFakeEntireBinarySegment
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)v1[6];
    if (!v2)
    {
      uint64_t v3 = +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]( (uint64_t)&OBJC_CLASS___SASegment,  v1,  @"ENTIRE_BINARY",  v1[5],  0LL);
      id v4 = (void *)v1[6];
      v1[6] = v3;

      id v2 = (void *)v1[6];
    }

    id v5 = v2;
    objc_sync_exit(v1);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)segmentWithName:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SABinary segmentWithCleanName:](self, v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4
{
  return -[SABinary cacheSymbolOwnerWithOptions:pid:additionalCSSymbolicatorFlags:]( self,  "cacheSymbolOwnerWithOptions:pid:additionalCSSymbolicatorFlags:",  a3,  *(void *)&a4,  0LL);
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (id)symbolOwnerWrapperWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 additionalCSSymbolicatorFlags:
{
  uint64_t v144 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
LABEL_143:
    id v85 = 0LL;
    return v85;
  }

  id v8 = a1;
  objc_sync_enter(v8);
  uint64_t v9 = (a2 >> 10) & 1;
  if (!a3) {
    LODWORD(v9) = 1;
  }
  if (a3 < 0) {
    LODWORD(v9) = 0;
  }
  if ((~(_BYTE)a2 & 0x22) != 0) {
    int v10 = 0;
  }
  else {
    int v10 = v9;
  }
  unsigned int v122 = a3;
  int v123 = v10;
  uint64_t v11 = v8 + 10;
  char v12 = [v8[10] isAbsolutePath];
  if ((a2 & 4) != 0) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0 && ((_BYTE)v8[2] & 4) == 0) {
    -[SABinary findPathViaBinaryLocator](v8);
  }
  uint64_t v14 = (char *)v8[1];
  if (v14)
  {
    objc_copyStruct(dest, v14 + 16, 16LL, 1, 0);
    if ((CSSymbolOwnerIsDsym() & 1) != 0) {
      goto LABEL_32;
    }
  }

  if ((a2 & 0x40) == 0 || (unint64_t v15 = (unint64_t)v8[2], (v15 & 0x40) != 0))
  {
    if ((a2 & 8) != 0)
    {
      unint64_t v15 = (unint64_t)v8[2];
      if ((v15 & 8) == 0)
      {
        uint64_t v17 = 0LL;
        uint64_t v16 = 1LL;
        goto LABEL_24;
      }
    }

uint64_t __23__SABinary_addSegment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 offsetIntoBinary];
  uint64_t v6 = [v4 offsetIntoBinary];

  if (v5 < v6) {
    return -1LL;
  }
  else {
    return v5 > v6;
  }
}

- (id)instructionAtOffsetIntoBinary:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = self;
  objc_sync_enter(v4);
  -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v4, a3, 1);
  uint64_t v5 = (SASegment *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  if (!-[SASegment hasOffsetIntoBinary](v5, "hasOffsetIntoBinary"))
  {
    int v11 = *__error();
    _sa_logt();
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SASegment debugDescription](v6, "debugDescription");
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v23 = [v13 UTF8String];
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: no offset into binary", buf, 0xCu);
    }

    *__error() = v11;
    id v14 = -[SASegment debugDescription](v6, "debugDescription");
    char v15 = [v14 UTF8String];
    _SASetCrashLogMessage(1708, "%s: no offset into binary", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }

  uint64_t v7 = -[SASegment offsetIntoBinary](v6, "offsetIntoBinary");
  if (-[SASegment length](v6, "length") - 1 >= a3 - v7)
  {
    uint64_t v10 = -[SASegment instructionAtOffsetIntoSegment:](v6, "instructionAtOffsetIntoSegment:");
    id v8 = (void *)v10;
    if (v6 == v4->_fakeEntireBinarySegment && v10) {
      objc_storeWeak((id *)(v10 + 32), 0LL);
    }
  }

  else
  {
LABEL_4:
    id v8 = 0LL;
  }

  objc_sync_exit(v4);
  return v8;
}

- (void)segmentWithCSSegment:(uint64_t)a3 symbolOwnerLayoutMatchesDisk:(int)a4 symbolOwnerBaseAddress:(uint64_t)a5
{
  if (!a1) {
    goto LABEL_11;
  }
  uint64_t Range = CSRegionGetRange();
  unint64_t v10 = v9;
  Name = (void *)CSRegionGetName();
  if (!Name) {
    goto LABEL_11;
  }
  SANSStringForCString(Name);
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = a1;
    objc_sync_enter(v14);
    -[SABinary segmentWithCleanName:](v14, v13);
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v15;
    if (v15)
    {
      if (a4 && ([v15 hasOffsetIntoBinary] & 1) == 0) {
        v16[5] = Range - a5;
      }
      if (![v16 length] && v10) {
        -[SASegment setLength:](v16, v10);
      }
    }

    else
    {
      if (a4) {
        +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]( (uint64_t)&OBJC_CLASS___SASegment,  v14,  v13,  v10,  Range - a5);
      }
      else {
        +[SASegment segmentWithBinary:name:length:]((uint64_t)&OBJC_CLASS___SASegment, v14, v13, v10);
      }
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v14, v16);
    }

    objc_sync_exit(v14);
  }

  else
  {
LABEL_11:
    uint64_t v16 = 0LL;
  }

  return v16;
}

void __33__SABinary_addInfoFromDyldImage___block_invoke( uint64_t a1,  void *a2,  unint64_t a3,  unint64_t a4)
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v8);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v14);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = [v9 length];
    if (a4 && !v11) {
      -[SASegment setLength:](v10, a4);
    }
  }

  else
  {
    +[SASegment segmentWithBinary:name:length:]((uint64_t)&OBJC_CLASS___SASegment, *(void **)(a1 + 32), v14, a4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:](*(void **)(a1 + 32), v10);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(void *)(v12 + 24) < a4 + a3) {
    *(void *)(v12 + 24) = a4 + a3;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(void *)(v13 + 24) > a3) {
    *(void *)(v13 + 24) = a3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += a4;
}

- (void)setLength:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  id v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
    int v6 = *__error();
    _sa_logt();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 debugDescription];
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v34 = [v8 UTF8String];
      _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);
    }

    *__error() = v6;
    [v3 debugDescription];
    a2 = (unint64_t) objc_claimAutoreleasedReturnValue();
    char v9 = [(id)a2 UTF8String];
    _SASetCrashLogMessage(2597, "%s: setting length 0", v10, v11, v12, v13, v14, v15, v9);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  if (*((void *)v3 + 5))
  {
LABEL_13:
    int v16 = *__error();
    _sa_logt();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v3 debugDescription];
      uint64_t v19 = [v18 UTF8String];
      uint64_t v20 = *((void *)v3 + 5);
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v34 = v19;
      __int16 v35 = 2048;
      unint64_t v36 = a2;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "%s: setting length to %llu when it was already %llu",  buf,  0x20u);
    }

    *__error() = v16;
    id v21 = [v3 debugDescription];
    char v22 = [v21 UTF8String];
    _SASetCrashLogMessage( 2598,  "%s: setting length to %llu when it was already %llu",  v23,  v24,  v25,  v26,  v27,  v28,  v22);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }

  *((void *)v3 + 5) = a2;
  if (a2 >> 28)
  {
LABEL_16:
    int v29 = *__error();
    _sa_logt();
    char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      id v31 = [v3 debugDescription];
      uint64_t v32 = [v31 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v34 = v32;
      __int16 v35 = 2048;
      unint64_t v36 = a2;
      _os_log_fault_impl(&dword_186C92000, v30, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);
    }

    *__error() = v29;
  }

  id v4 = (void *)*((void *)v3 + 6);
  if (v4)
  {
    -[SASegment setLength:](v4, *((void *)v3 + 5));
    if (-[SASegment isEmpty](*((void **)v3 + 6)))
    {
      uint64_t v5 = (void *)*((void *)v3 + 6);
      *((void *)v3 + 6) = 0LL;
    }
  }

  objc_sync_exit(v3);
}

void __33__SABinary_addInfoFromDyldImage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v8);
  if (([(id)v6 hasOffsetIntoBinary] & 1) == 0)
  {
    if (v6) {
      *(void *)(v6 + 40) = a3 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48LL);
    if (v7) {
      -[SASegment grabInstructionsFromOtherSegment:]((id *)v6, v7);
    }
  }
}

+ (void)binaryForDyldImage:(int)a3 options:
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_opt_self();
  uint64_t v6 = (void *)MEMORY[0x186E47ACC](v5);
  *(void *)uu = 0LL;
  uint64_t v58 = 0LL;
  if (!dyld_image_copy_uuid() || uuid_is_null(uu))
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v21 = DyldImagePath(a2);
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "No UUID for dyld_image %s", buf, 0xCu);
    }

    char v9 = 0LL;
    *__error() = v7;
    goto LABEL_6;
  }

  uuidForBytes((uint64_t)uu);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (char *)DyldImagePath(a2);
  if (v12 && *v12)
  {
    SANSStringForCString(v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  int v14 = [v13 isAbsolutePath] ^ 1;
  if ((~a3 & 5LL) != 0) {
    LOBYTE(v14) = 1;
  }
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
    int v16 = v15;
    if (!v15)
    {
LABEL_27:

      goto LABEL_28;
    }

    -[SABinaryLocator urlForUUID:](v15, v11);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v17;
    if (v17)
    {
      [v17 path];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        [v18 path];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v20 isEqualToString:v13])
        {

LABEL_26:
          [v16 done];

          goto LABEL_27;
        }

        [MEMORY[0x1896078A8] defaultManager];
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 path];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v39 fileExistsAtPath:v38])
        {

          goto LABEL_26;
        }

        [MEMORY[0x1896078A8] defaultManager];
        char v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v37 = [v22 fileExistsAtPath:v13];

        if (!v37) {
          goto LABEL_26;
        }
      }

      int v23 = *__error();
      _sa_logt();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        [v18 path];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v60 = v13;
        _os_log_impl(&dword_186C92000, v24, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", buf, 0x20u);
      }

      *__error() = v23;
      -[SABinaryLocator removeURLForUUID:](v16, v11);
    }

    [MEMORY[0x189604030] fileURLWithPath:v13 isDirectory:0];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[SABinaryLocator addURL:ForUUID:](v16, v26, v11);
    id v18 = v26;
    goto LABEL_26;
  }

- (void)addInfoFromSymbolOwner:(uint64_t)a3 fromDisk:(char)a4 includeExpensiveInfo:(int)a5
{
  if (a1 && ((a5 & 1) != 0 || ![*(id *)(a1 + 80) isAbsolutePath] || !*(void *)(a1 + 40)))
  {
    uint64_t v10 = (void **)(id)a1;
    objc_sync_enter(v10);
    uint64_t v11 = v10 + 10;
    if (([v10[10] isAbsolutePath] & 1) == 0 && (CSSymbolOwnerIsDsym() & 1) == 0)
    {
      Path = (_BYTE *)CSSymbolOwnerGetPath();
      SAFilepathForCString(Path);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30[0]) = 0;
      if (v13)
      {
        int v14 = SAFilepathMatches(*v11, v13, v30);
        int v15 = LOBYTE(v30[0]) ? v14 : 0;
        if (v15 == 1) {
          objc_storeStrong(v10 + 10, v13);
        }
      }
    }

    if (!v10[3] && !*v11)
    {
      Name = (_BYTE *)CSSymbolOwnerGetName();
      uint64_t v17 = SAFilepathForCString(Name);
      id v18 = v10[3];
      v10[3] = (void *)v17;
    }

    unint64_t v29 = 0LL;
    BOOL IsContiguous = SASymbolOwnerIsContiguous(a2, a3, v30, &v29);
    unint64_t v20 = v29;
    if (v20 > [v10[7] count])
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke;
      v26[3] = &unk_189F62A38;
      char v27 = IsContiguous | a4;
      v26[4] = v10;
      v26[5] = a2;
      v26[6] = a3;
      char v28 = a5;
      SASymbolOwnerForeachSegment(a2, a3, v26);
    }

    if (-[SASegment isEmpty](v10[6]))
    {
      id v21 = v10[6];
      v10[6] = 0LL;
    }

    if (v10[5]) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = IsContiguous;
    }
    if (v22) {
      -[SABinary setLength:](v10, v30[1]);
    }
    if (a5 && !v10[14])
    {
      Version = (void *)CSSymbolOwnerGetVersion();
      if (Version)
      {
        uint64_t v24 = SANSStringForCString(Version);
        uint64_t v25 = v10[14];
        v10[14] = (void *)v24;
      }
    }

    objc_sync_exit(v10);
  }

void __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  int v6 = *(unsigned __int8 *)(a1 + 56);
  int v7 = *(void **)(a1 + 32);
  uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  -[SABinary segmentWithCSSegment:symbolOwnerLayoutMatchesDisk:symbolOwnerBaseAddress:](v7, a2, a3, v6, BaseAddress);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 && *(_BYTE *)(a1 + 57))
  {
    char v9 = (id *)v17;
    objc_sync_enter(v9);
    uint64_t Range = CSRegionGetRange();
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __34__SASegment_addInfoFromCSSegment___block_invoke;
    v27[3] = &unk_189F62728;
    v27[5] = Range;
    v27[6] = v11;
    v27[4] = v9;
    uint64_t v22 = MEMORY[0x1895F87A8];
    uint64_t v23 = 3221225472LL;
    uint64_t v24 = __34__SASegment_addInfoFromCSSegment___block_invoke_2;
    uint64_t v25 = &unk_189F62778;
    id v26 = (id)MEMORY[0x186E47C94](v27);
    CSRegionForeachSymbol();
    [v9[7] allValues];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          -[SAInstruction checkForNewSymbol](*(unint64_t **)(*((void *)&v18 + 1) + 8 * v16++));
        }

        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }

      while (v14);
    }
  }
}

- (void)findPathViaBinaryLocator
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (([v1[10] isAbsolutePath] & 1) == 0)
    {
      unint64_t v2 = (unint64_t)v1[2];
      if ((v2 & 4) == 0)
      {
        v1[2] = (void *)(v2 | 4);
        id v3 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
        -[SABinaryLocator urlForUUID:](v3, v1[9]);
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v5 = v4;
        if (v4)
        {
          [v4 path];
          int v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            char v13 = 0;
            if (SAFilepathMatches(v1[10], v6, &v13))
            {
              if (v13)
              {
                uint64_t v7 = SACachedNSString(v6);
                id v8 = v1[10];
                v1[10] = (void *)v7;

                *((_BYTE *)v1 + 66) = 1;
              }
            }

            else
            {
              int v9 = *__error();
              _sa_logt();
              uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                [v1[9] UUIDString];
                uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v12 = v1[10];
                *(_DWORD *)__int128 buf = 138543874;
                uint64_t v15 = v11;
                __int16 v16 = 2112;
                id v17 = v6;
                __int16 v18 = 2112;
                __int128 v19 = v12;
                _os_log_debug_impl( &dword_186C92000,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@: found path %@ via binary locator, but doesn't match existing partial path %@",  buf,  0x20u);
              }

              *__error() = v9;
            }
          }
        }

        [v3 done];
      }
    }

    objc_sync_exit(v1);
  }

- (void)gatherBundleInfo
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    if (!obj[11]
      && !obj[12]
      && !obj[13]
      && ((_BYTE)obj[8] & 1) == 0
      && ([obj[10] isAbsolutePath] & 1) != 0)
    {
      *((_BYTE *)obj + 64) |= 1u;
      v1 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:obj[10] isDirectory:0];
      if (v1)
      {
        unint64_t v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();

        if (v2)
        {
          -[SABinary saveInfoFromBundle:](obj, v2);
          CFRelease(v2);
        }

        else
        {
          -[SABinary getCodeSignInfoWithBundleUrl:](obj, 0LL);
        }
      }
    }

    objc_sync_exit(obj);
  }

void __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1 + 32) + 80LL))
  {
    dyld_image_copy_uuid();
    [*(id *)(*(void *)(a1 + 32) + 72) getUUIDBytes:uu1];
    if (!uuid_compare(uu1, uu2))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      id v4 = (char *)DyldImagePath(a2);
      if (v4)
      {
        uint64_t v5 = SANSStringForCString(v4);
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void **)(v6 + 80);
        *(void *)(v6 + 80) = v5;
      }

      else
      {
        int v8 = *__error();
        _sa_logt();
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = *(_DWORD *)(a1 + 48);
          [*(id *)(a1 + 32) debugDescription];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = 67109378;
          v12[1] = v10;
          __int16 v13 = 2112;
          uint64_t v14 = v11;
          _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "dyld image has no installname in [%d] for %@",  (uint8_t *)v12,  0x12u);
        }

        *__error() = v8;
      }
    }
  }

+ (id)dataFillingQueue
{
  if (qword_18C4B1608 != -1) {
    dispatch_once(&qword_18C4B1608, &__block_literal_global_135);
  }
  return (id)qword_18C4B1600;
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_126( uint64_t a1)
{
  return dyld_process_snapshot_dispose();
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_128()
{
  return CSRelease();
}

id __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return +[SABinary binaryWithSymbolOwner:fromDisk:]((uint64_t)&OBJC_CLASS___SABinary, a2, a3, 0);
}

- (void)getCodeSignInfoWithBundleUrl:(void *)a1
{
  id v3 = a2;
  if (a1 && !a1[15] && !a1[16] && (v3 || a1[10]))
  {
    id v5 = v3;
    id v4 = a1;
    objc_sync_enter(v4);
    if ((v4[64] & 2) == 0) {
      v4[64] |= 2u;
    }
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

- (void)saveInfoFromBundle:(void *)a1
{
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    if (!v3[11] && !v3[12] && !v3[13])
    {
      *((_BYTE *)v3 + 64) |= 1u;
      uint64_t v4 = CFBundleGetIdentifier(a2);
      id v5 = v3[11];
      v3[11] = (void *)v4;

      CFTypeRef v6 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x189604AC8]);
      uint64_t v7 = v3[13];
      v3[13] = (void *)v6;

      CFTypeRef v8 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x189604E18]);
      int v9 = v3[12];
      v3[12] = (void *)v8;

      if (!v3[10])
      {
        CFURLRef v10 = CFBundleCopyExecutableURL(a2);
        CFURLRef v11 = v10;
        if (v10)
        {
          -[__CFURL path](v10, "path");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            char v18 = 0;
            int v13 = SAFilepathMatches(v3[10], v12, &v18);
            if (v18) {
              int v14 = v13;
            }
            else {
              int v14 = 0;
            }
            if (v14 == 1)
            {
              uint64_t v15 = SACachedNSString(v12);
              __int16 v16 = v3[10];
              v3[10] = (void *)v15;
            }
          }
        }
      }

      CFURLRef v17 = CFBundleCopyBundleURL(a2);
      -[SABinary getCodeSignInfoWithBundleUrl:](v3, v17);
    }

    objc_sync_exit(v3);
  }

- (void)gatherInfoWithDataGatheringOptions:(unint64_t)a3 pid:(int)a4
{
  char v4 = a3;
  id obj = self;
  objc_sync_enter(obj);
  char v5 = -[NSString isAbsolutePath](obj->_path, "isAbsolutePath");
  if ((v4 & 4) != 0) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0 && (obj->_alreadyAttempted & 4) == 0) {
    -[SABinary findPathViaBinaryLocator](obj);
  }
  int v7 = !-[NSString isAbsolutePath](obj->_path, "isAbsolutePath");
  if ((v4 & 1) == 0) {
    LOBYTE(v7) = 1;
  }
  if ((v7 & 1) == 0)
  {
    unint64_t alreadyAttempted = obj->_alreadyAttempted;
    if ((alreadyAttempted & 1) == 0)
    {
      obj->_unint64_t alreadyAttempted = alreadyAttempted | 1;
      -[SABinary gatherBundleInfo](obj);
    }
  }

  objc_sync_exit(obj);
}

- (id)addSymbolWithOffsetIntoBinary:(unint64_t)a3 length:(void *)a4 name:
{
  id v7 = a4;
  if (a1)
  {
    CFTypeRef v8 = a1;
    objc_sync_enter(v8);
    -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v8, a2, 1);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = a2 - [v9 offsetIntoBinary];
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v9, v10);
    CFURLRef v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v11)
    {
      if ([v11 offsetIntoSegment] == v10)
      {
        if (v7)
        {
          [v12 name];
          int v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13) {
            objc_setProperty_atomic_copy(v12, v14, v7, 24LL);
          }
        }
      }

      else
      {
        uint64_t v15 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);

        uint64_t v12 = (void *)v15;
      }
    }

    else
    {
      -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_sync_exit(v8);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)symbolicateAllInstructionsWithOptions:(unint64_t)a3 pid:(int)a4
{
}

- (void)symbolicateAllInstructionsWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 onlyDsym:(int)a6 additionalCSSymbolicatorFlags:
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v8 = a1;
    objc_sync_enter(v8);
    if ((a2 & 0x48) == 0 && (a5 & 1) != 0) {
      goto LABEL_76;
    }
    unint64_t v73 = a2 & 0x66F;
    uint64_t v9 = (unsigned __int16)v73 & ~*((void *)v8 + 4);
    if (*((_BYTE *)v8 + 65)) {
      goto LABEL_5;
    }
    if ((*((_BYTE *)v8 + 64) & 8) != 0 || !v9) {
      goto LABEL_76;
    }
    if ((*((_BYTE *)v8 + 64) & 4) == 0)
    {
LABEL_5:
      unint64_t v69 = a2 & 0x66F & ~*((void *)v8 + 4);
      unint64_t v71 = a2;
      int v70 = a5;
      int v72 = 0;
    }

    else
    {
      if ((v9 & 0x48) == 0)
      {
LABEL_76:
        objc_sync_exit(v8);

        return;
      }

      unint64_t v69 = a2 & 0x66F & ~*((void *)v8 + 4);
      unint64_t v71 = a2;
      int v70 = a5;
      int v72 = 1;
    }

    uint64_t v92 = 0LL;
    uint64_t v93 = &v92;
    uint64_t v94 = 0x2020000000LL;
    char v95 = 1;
    uint64_t v88 = 0LL;
    uint64_t v89 = &v88;
    uint64_t v90 = 0x2020000000LL;
    char v91 = 1;
    v83[0] = MEMORY[0x1895F87A8];
    v83[1] = 3221225472LL;
    unint64_t v84 = __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke;
    id v85 = &unk_189F62B08;
    v86 = &v92;
    int v87 = &v88;
    unint64_t v10 = v83;
    id v11 = objc_alloc(MEMORY[0x189603FA8]);
    uint64_t v12 = (id *)v8;
    objc_sync_enter(v12);
    id obj = v12;
    id Property = v12[6];
    if (Property) {
      id Property = objc_getProperty(Property, v13, 56LL, 1);
    }
    id v15 = Property;
    uint64_t v16 = [v15 count];

    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id v17 = v12[7];
    uint64_t v19 = [v17 countByEnumeratingWithState:&v106 objects:&dest count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v107;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v107 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(id *)(*((void *)&v106 + 1) + 8 * i);
          if (v22) {
            id v22 = objc_getProperty(v22, v18, 56LL, 1);
          }
          id v23 = v22;
          uint64_t v24 = [v23 count];

          v16 += v24;
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v106 objects:&dest count:16];
      }

      while (v19);
    }

    objc_sync_exit(obj);
    uint64_t v25 = (void *)[v11 initWithCapacity:v16];
    id v26 = obj;
    v77 = obj;
    objc_sync_enter(v77);
    char v27 = obj[6];
    if (v27)
    {
      id v28 = v27;
      objc_sync_enter(v28);
      id v30 = obj[6];
      if (v30) {
        id v30 = objc_getProperty(v30, v29, 56LL, 1);
      }
      id v31 = v30;
      [v31 allValues];
      unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v28);
      if (v32) {
        [v25 addObjectsFromArray:v32];
      }

      id v26 = obj;
    }

    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id v33 = v26[7];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v101 objects:&dest count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v102;
      do
      {
        uint64_t v36 = 0LL;
        do
        {
          if (*(void *)v102 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = *(id *)(*((void *)&v101 + 1) + 8 * v36);
          objc_sync_enter(v37);
          if (v37) {
            id v39 = objc_getProperty(v37, v38, 56LL, 1);
          }
          else {
            id v39 = 0LL;
          }
          id v40 = v39;
          [v40 allValues];
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_sync_exit(v37);
          if (v41) {
            [v25 addObjectsFromArray:v41];
          }

          ++v36;
        }

        while (v34 != v36);
        uint64_t v42 = [v33 countByEnumeratingWithState:&v101 objects:&dest count:16];
        uint64_t v34 = v42;
      }

      while (v42);
    }

    objc_sync_exit(v77);
    char v100 = 0;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id v43 = v25;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v96 objects:&v106 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v97;
LABEL_38:
      uint64_t v46 = 0LL;
      while (1)
      {
        if (*(void *)v97 != v45) {
          objc_enumerationMutation(v43);
        }
        v84((uint64_t)v10, *(void *)(*((void *)&v96 + 1) + 8 * v46), &v100);
        if (v100) {
          break;
        }
        if (v44 == ++v46)
        {
          uint64_t v44 = [v43 countByEnumeratingWithState:&v96 objects:&v106 count:16];
          if (v44) {
            goto LABEL_38;
          }
          break;
        }
      }
    }

    if (*((_BYTE *)v89 + 24))
    {
      if (*((_BYTE *)v93 + 24) || (int v72 = 1, ((_BYTE)v77[8] & 8) == 0) && (v69 & 0x48) == 0)
      {
        *((_BYTE *)v8 + 65) = 0;
LABEL_75:
        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(&v92, 8);
        goto LABEL_76;
      }
    }

    *((void *)v8 + 4) = v73;
    uint64_t v47 = -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](v77, v71, a3, a4, a6);
    uint64_t v48 = (void *)v47;
    if (v47)
    {
      objc_copyStruct(&dest, (const void *)(v47 + 16), 16LL, 1, 0);
      if (CSIsNull())
      {
        int v57 = *__error();
        _sa_logt();
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          id v59 = [v77 debugDescription];
          uint64_t v60 = [v59 UTF8String];
          int dest = 136315138;
          uint64_t dest_4 = v60;
          _os_log_error_impl( &dword_186C92000,  v58,  OS_LOG_TYPE_ERROR,  "%s: null symbol owner in symbol owner wrapper",  (uint8_t *)&dest,  0xCu);
        }

        *__error() = v57;
        id v61 = [v77 debugDescription];
        char v62 = [v61 UTF8String];
        _SASetCrashLogMessage(2558, "%s: null symbol owner in symbol owner wrapper", v63, v64, v65, v66, v67, v68, v62);

        _os_crash();
        __break(1u);
      }

      *((_BYTE *)v77 + 64) |= 4u;
      else {
        char v49 = 0;
      }
      *((_BYTE *)v77 + 64) = (_BYTE)v77[8] & 0xF7 | v49;
      if ((v72 | v70) != 1 || (CSSymbolOwnerIsDsym() & 1) != 0)
      {
        *((_BYTE *)v8 + 65) = 0;
        if (!v77[14])
        {
          Version = (void *)CSSymbolOwnerGetVersion();
          if (Version)
          {
            uint64_t v51 = SANSStringForCString(Version);
            uint64_t v52 = v77[14];
            v77[14] = (void *)v51;
          }
        }

        -[SASegment symbolicateWithSymbolOwnerWrapper:](obj[6], v48);
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id v53 = obj[7];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v79 objects:v105 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v80;
          do
          {
            for (uint64_t j = 0LL; j != v54; ++j)
            {
              if (*(void *)v80 != v55) {
                objc_enumerationMutation(v53);
              }
              -[SASegment symbolicateWithSymbolOwnerWrapper:](*(void **)(*((void *)&v79 + 1) + 8 * j), v48);
            }

            uint64_t v54 = [v53 countByEnumeratingWithState:&v79 objects:v105 count:16];
          }

          while (v54);
        }

        goto LABEL_74;
      }

      if ((v72 | v70 ^ 1) != 1)
      {
LABEL_74:

        goto LABEL_75;
      }
    }

    else
    {
      *((_BYTE *)v77 + 64) &= 0xF3u;
    }

    *((_BYTE *)v8 + 65) = 0;
    goto LABEL_74;
  }

uint64_t __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke( uint64_t result,  uint64_t a2,  _BYTE *a3)
{
  if (!a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
LABEL_7:
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = 0;
    *a3 = 1;
    return result;
  }

  if (!*(void *)(a2 + 16)) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
  }
  if (!*(void *)(a2 + 8)) {
    goto LABEL_7;
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)clearCoreSymbolicationCache
{
  id obj = self;
  objc_sync_enter(obj);
  symbolOwnerWrapper = obj->_symbolOwnerWrapper;
  unint64_t v3 = obj->_alreadyAttempted & 0xFFFFFFFFFFFFFF9FLL;
  obj->_symbolOwnerWrapper = 0LL;
  obj->_unint64_t alreadyAttempted = v3;

  objc_sync_exit(obj);
}

- (void)clearSymbolCache
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v2 = self;
  objc_sync_enter(v2);
  fakeEntireBinarySegment = v2->_fakeEntireBinarySegment;
  v2->_fakeEntireBinarySegment = 0LL;

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  char v4 = v2->_segments;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          uint64_t v9 = v8;
          objc_sync_enter(v9);
          unint64_t v10 = (void *)v9[1];
          v9[1] = 0LL;

          id v11 = (void *)v9[2];
          v9[2] = 0LL;

          uint64_t v12 = (void *)v9[7];
          v9[7] = 0LL;

          objc_sync_exit(v9);
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  v2->_haveMoreInstructionsToSymbolicate = 0;
  v2->_optionsWhenLastSymbolicated = 0LL;
  *((_BYTE *)v2 + 64) &= 0xF3u;
  -[SABinary clearCoreSymbolicationCache](v2, "clearCoreSymbolicationCache", (void)v13);
  objc_sync_exit(v2);
}

void __28__SABinary_dataFillingQueue__block_invoke()
{
  unint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  uint64_t v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.SampleAnalysis.binaryDataFilling", v0);
  unint64_t v2 = (void *)qword_18C4B1600;
  qword_18C4B1600 = (uint64_t)v1;
}

- (NSString)debugDescription
{
  id v16 = objc_alloc(NSString);
  path = self->_path;
  if (!path) {
    path = self->_name;
  }
  uuid = self->_uuid;
  unint64_t length = self->_length;
  bundleIdentifier = self->_bundleIdentifier;
  bundleVersion = self->_bundleVersion;
  bundleShortVersion = self->_bundleShortVersion;
  binaryVersion = self->_binaryVersion;
  codesigningID = self->_codesigningID;
  teamID = self->_teamID;
  uint64_t v12 = -[NSMutableArray count](self->_segments, "count");
  __int128 v13 = "has";
  if (!self->_fakeEntireBinarySegment) {
    __int128 v13 = "no";
  }
  if (self->_symbolOwnerWrapper) {
    __int128 v14 = @"has";
  }
  else {
    __int128 v14 = @"no";
  }
  return (NSString *)(id)[v16 initWithFormat:@"%@ <%@> length 0x%llx %@ %@ %@ %@ %@ %@: %lu segments (%s fake segment), (%@ symbol owner)", path, uuid, length, bundleIdentifier, bundleVersion, bundleShortVersion, binaryVersion, codesigningID, teamID, v12, v13, v14];
}

- (unint64_t)textSegmentLength
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SABinary segmentWithCleanName:](self, @"__TEXT");
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3) {
      return -[SABinary length](self, "length");
    }
  }

  unint64_t v4 = [v3 length];

  return v4;
}

- (BOOL)hasTextExecSegment
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)instructionAtOffsetIntoTextSegment:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[SABinary segmentWithCleanName:](self, @"__TEXT"),
        (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [v5 instructionAtOffsetIntoSegment:a3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[SABinary instructionAtOffsetIntoBinary:](self, "instructionAtOffsetIntoBinary:", a3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)binaryVersion
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)codesigningID
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v16 = v4;
  if (name) {
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)@"name", name);
  }
  if (-[SABinary length](self, "length"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SABinary length](self, "length"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v16, @"length", v6);
  }

  path = self->_path;
  if (path) {
    SAJSONWriteDictionaryEntry(v16, @"path", path);
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    SAJSONWriteDictionaryEntry(v16, @"bundleID", bundleIdentifier);
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    SAJSONWriteDictionaryEntry(v16, @"bundleVersion", bundleVersion);
  }
  bundleShortVersion = self->_bundleShortVersion;
  if (bundleShortVersion) {
    SAJSONWriteDictionaryEntry(v16, @"bundleShortVersion", bundleShortVersion);
  }
  binaryVersion = self->_binaryVersion;
  if (binaryVersion) {
    SAJSONWriteDictionaryEntry(v16, @"binaryVersion", binaryVersion);
  }
  codesigningID = self->_codesigningID;
  if (codesigningID) {
    SAJSONWriteDictionaryEntry(v16, @"codesigningID", codesigningID);
  }
  teamID = self->_teamID;
  if (teamID) {
    SAJSONWriteDictionaryEntry(v16, @"teamID", teamID);
  }
  uint64_t v14 = -[NSMutableArray count](self->_segments, "count");
  __int128 v15 = v16;
  if (v14)
  {
    [v16 appendString:@",segments:"];
    SAJSONWriteArray(v16, self->_segments);
    __int128 v15 = v16;
  }
}

+ (id)classDictionaryKey
{
  return @"SABinary";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_segments, "count") + 93;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") > a4)
  {
    int v14 = *__error();
    _sa_logt();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = -[SABinary debugDescription](self, "debugDescription");
      uint64_t v17 = [v16 UTF8String];
      uint64_t v5 = -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      uint64_t v18 = -[NSMutableArray count](self->_segments, "count");
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v52 = v17;
      __int16 v53 = 2048;
      *(void *)uint64_t v54 = v5;
      *(_WORD *)&v54[8] = 2048;
      *(void *)&v54[10] = v18;
      *(_WORD *)&v54[18] = 2048;
      *(void *)&v54[20] = a4;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "%s: size %lu (%lu segments) > buffer length %lu",  buf,  0x2Au);
    }

    *__error() = v14;
    id v19 = -[SABinary debugDescription](self, "debugDescription");
    char v20 = [v19 UTF8String];
    -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    -[NSMutableArray count](self->_segments, "count");
    _SASetCrashLogMessage(4708, "%s: size %lu (%lu segments) > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  *(_WORD *)&a3->var0 = 769;
  *(void *)&a3->var2[16] = -[SABinary length](self, "length");
  if (-[NSMutableArray count](self->_segments, "count") == 1)
  {
    -[SABinary segmentWithCleanName:](self, @"__TEXT_EXEC");
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      BYTE2(a3->var9) |= 1u;
    }
  }

  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", a3->var2);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_name,  v9);
  *(unint64_t *)((char *)&a3->var4 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_path,  v9);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_bundleIdentifier,  v9);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_bundleVersion,  v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_bundleShortVersion,  v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_binaryVersion,  v9);
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") >= 0xFFFF)
  {
LABEL_11:
    int v27 = *__error();
    _sa_logt();
    a3 = ($3055317E65D449AEE9A0FBCF89FE0D2B *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      id v28 = -[SABinary debugDescription](self, "debugDescription");
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v52 = v29;
      __int16 v53 = 1024;
      *(_DWORD *)uint64_t v54 = 0xFFFF;
      _os_log_error_impl(&dword_186C92000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "%s: more than %d segments", buf, 0x12u);
    }

    *__error() = v27;
    -[SABinary debugDescription](self, "debugDescription");
    self = (SABinary *) objc_claimAutoreleasedReturnValue();
    char v30 = -[SABinary UTF8String](self, "UTF8String");
    _SASetCrashLogMessage(4728, "%s: more than %d segments", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
LABEL_14:
    int v37 = *__error();
    _sa_logt();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = -[SABinary debugDescription](self, "debugDescription");
      uint64_t v40 = [v39 UTF8String];
      int v41 = *(unsigned __int16 *)((char *)&a3->var9 + 3);
      unint64_t v42 = -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v52 = v40;
      __int16 v53 = 1024;
      *(_DWORD *)uint64_t v54 = v41;
      *(_WORD *)&v54[4] = 2048;
      *(void *)&v54[6] = v5;
      *(_WORD *)&v54[14] = 2048;
      *(void *)&v54[16] = v42;
      _os_log_error_impl( &dword_186C92000,  v38,  OS_LOG_TYPE_ERROR,  "%s: after serializing with %u segments, ended with length %ld, should be %lu",  buf,  0x26u);
    }

    *__error() = v37;
    id v43 = -[SABinary debugDescription](self, "debugDescription");
    char v44 = [v43 UTF8String];
    -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage( 4735,  "%s: after serializing with %u segments, ended with length %ld, should be %lu",  v45,  v46,  v47,  v48,  v49,  v50,  v44);

    _os_crash();
    __break(1u);
  }

  unsigned __int16 v11 = -[NSMutableArray count](self->_segments, "count");
  *(_WORD *)((char *)&a3->var9 + 3) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( (char *)&a3->var9 + 5,  v11,  self->_segments,  v9);
  uint64_t v12 = (uint64_t *)((char *)&a3->var9 + 8 * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 5);
  uint64_t v5 = 8LL * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 93;
  if (v5 != -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion")) {
    goto LABEL_14;
  }
  *uint64_t v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_codesigningID, v9);
  v12[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_teamID, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_path, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleIdentifier, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleShortVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_binaryVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_codesigningID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_teamID, "addSelfToSerializationDictionary:", v4);
    -[SASegment addSelfToSerializationDictionary:]( self->_fakeEntireBinarySegment,  "addSelfToSerializationDictionary:",  v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v7 = self->_segments;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
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
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  int v4 = *__error();
  _sa_logt();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 v13 = 0;
    _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "Called without dict/buff though it's defined", v13, 2u);
  }

  *__error() = v4;
  _SASetCrashLogMessage(4763, "Called without dict/buff though it's defined", v6, v7, v8, v9, v10, v11, v13[0]);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if (a4 <= 0x4A)
  {
    int v27 = *__error();
    _sa_logt();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v37 = a4;
      __int16 v38 = 2048;
      uint64_t v39 = 75LL;
      _os_log_error_impl( &dword_186C92000,  v28,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinary struct %lu",  buf,  0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(4771, "bufferLength %lu < serialized SABinary struct %lu", v29, v30, v31, v32, v33, v34, a4);
    _os_crash();
    __break(1u);
LABEL_28:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SABinary version",  0LL);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }

  uint64_t v11 = v10;
  uuidForBytes((uint64_t)a3 + 2);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = *(void *)((char *)a3 + 34);
  __int128 v14 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v11, v14, 1);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(uint64_t *)gSASerializationEncodedVersionBeingDecoded() < 31)
  {
    +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v12, 0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v18;
    if (v15)
    {
      [v18 path];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19) {
        [v17 addPath:v15];
      }
    }
  }

  else
  {
    else {
      id v16 = 0LL;
    }
    +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v12, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    if ((*((_BYTE *)a3 + 74) & 1) != 0) {
      uint64_t v21 = @"__TEXT_EXEC";
    }
    else {
      uint64_t v21 = @"__TEXT";
    }
    uint64_t v22 = v21;
    -[SABinary segmentWithCleanName:](v17, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      uint64_t v24 = v23;
      if (![v23 length])
      {
        unint64_t v25 = *(void *)((char *)a3 + 18);
        if (v25) {
          -[SASegment setLength:](v24, v25);
        }
      }
    }

    else
    {
      +[SASegment segmentWithBinary:name:length:]( (uint64_t)&OBJC_CLASS___SASegment,  v17,  v22,  *(void *)((char *)a3 + 18));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v17, v24);
    }
  }

  else if (![v17 length])
  {
    unint64_t v20 = *(void *)((char *)a3 + 18);
    if (v20) {
      -[SABinary setLength:](v17, v20);
    }
  }

  return v17;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  id v12 = a5;
  id v13 = a6;
  if (a4 <= 0x4A)
  {
    int v55 = *__error();
    _sa_logt();
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v107 = a4;
      __int16 v108 = 2048;
      *(void *)__int128 v109 = 75LL;
      _os_log_error_impl( &dword_186C92000,  v56,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinary struct %lu",  buf,  0x16u);
    }

    *__error() = v55;
    _SASetCrashLogMessage(4817, "bufferLength %lu < serialized SABinary struct %lu", v57, v58, v59, v60, v61, v62, a4);
    _os_crash();
    __break(1u);
    goto LABEL_46;
  }

  __int128 v14 = v13;
  unint64_t v15 = *(void *)((char *)a3 + 34);
  id v16 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t p_path = (unint64_t)&self->_path;
  path = self->_path;
  if (path)
  {
    if (v17 && !-[NSString isEqualToString:](path, "isEqualToString:", v17))
    {
      uint64_t v19 = *(void *)gSASerializationEncodedVersionBeingDecoded();
      int v20 = *__error();
      _sa_logt();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = v21;
      if (v19 < 31)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[SABinary debugDescription](self, "debugDescription");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__int128 buf = 138412546;
          unint64_t v107 = (unint64_t)v17;
          __int16 v108 = 2112;
          *(void *)__int128 v109 = v23;
          _os_log_error_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_ERROR,  "Decoded SABinary path %@ doesn't match %@, not filling in bundle/codesign info",  buf,  0x16u);
          goto LABEL_42;
        }
      }

      else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        -[SABinary debugDescription](self, "debugDescription");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138412546;
        unint64_t v107 = (unint64_t)v17;
        __int16 v108 = 2112;
        *(void *)__int128 v109 = v23;
        _os_log_fault_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_FAULT,  "Decoded SABinary path %@ doesn't match %@",  buf,  0x16u);
LABEL_42:
      }

      *__error() = v20;
      goto LABEL_40;
    }
  }

  else
  {
    objc_storeStrong((id *)&self->_path, v17);
  }

  if (!self->_name && !*(void *)p_path)
  {
    unint64_t v24 = *(void *)((char *)a3 + 26);
    unint64_t v25 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v12, v14, v25, 0);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t p_path = (unint64_t)v26;
    if (v26)
    {
      int v27 = (NSString *)[v26 copy];
      name = self->_name;
      self->_name = v27;
    }
  }

  if (!self->_bundleIdentifier)
  {
    unint64_t p_path = *(void *)((char *)a3 + 42);
    uint64_t v29 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( p_path,  v12,  v14,  v29,  0);
    uint64_t v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v30;
  }

  if (!self->_bundleVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 50);
    uint64_t v32 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( p_path,  v12,  v14,  v32,  0);
    uint64_t v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleVersion = self->_bundleVersion;
    self->_bundleVersion = v33;
  }

  if (!self->_bundleShortVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 58);
    id v35 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( p_path,  v12,  v14,  v35,  0);
    uint64_t v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleShortVersion = self->_bundleShortVersion;
    self->_bundleShortVersion = v36;
  }

  if (!self->_binaryVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 66);
    __int16 v38 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( p_path,  v12,  v14,  v38,  0);
    uint64_t v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    binaryVersion = self->_binaryVersion;
    self->_binaryVersion = v39;
  }

  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 > 0x4C)
    {
      unint64_t p_path = *(unsigned __int16 *)((char *)a3 + 75);
      uint64_t v41 = 8 * p_path;
      unint64_t v7 = 8 * p_path + 77;
      if (v7 <= a4)
      {
        unint64_t v105 = a4;
        unint64_t v42 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
        if (*v42 <= 30) {
          *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = self;
        }
        id v43 = (void *)objc_opt_class();
        unint64_t p_path = SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 77, p_path, v12, v14, v43);
        if (*v42 <= 30) {
          *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0LL;
        }
        unint64_t v44 = -[NSMutableArray count](self->_segments, "count");
        if (v44 >= [(id)p_path count])
        {
          if (*((unsigned __int8 *)a3 + 1) < 3u)
          {
LABEL_37:

            goto LABEL_40;
          }

          unint64_t v45 = v105;
          if (v41 + 93 <= v105)
          {
            uint64_t v46 = (unint64_t *)((char *)a3 + 8 * *(unsigned __int16 *)((char *)a3 + 75) + 77);
            if (!self->_codesigningID)
            {
              unint64_t v47 = *v46;
              uint64_t v48 = (void *)objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v47,  v12,  v14,  v48,  0);
              uint64_t v49 = (NSString *)objc_claimAutoreleasedReturnValue();
              codesigningID = self->_codesigningID;
              self->_codesigningID = v49;
            }

            if (!self->_teamID)
            {
              unint64_t v51 = v46[1];
              uint64_t v52 = (void *)objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v51,  v12,  v14,  v52,  0);
              __int16 v53 = (NSString *)objc_claimAutoreleasedReturnValue();
              teamID = self->_teamID;
              self->_teamID = v53;
            }

            goto LABEL_37;
          }

          goto LABEL_55;
        }

@end