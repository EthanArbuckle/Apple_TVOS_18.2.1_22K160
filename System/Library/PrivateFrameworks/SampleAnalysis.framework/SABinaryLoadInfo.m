@interface SABinaryLoadInfo
+ (id)addBinaryLoadInfoForDyldImage:(void *)a3 toLoadInfos:(int)a4 isKernel:(int)a5 dataGatheringOptions:;
+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4;
+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4 libraryCache:(id)a5;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
+ (id)binaryLoadInfoForSymbolicator:(uint64_t)a1 isKernel:(uint64_t)a2 dataGatheringOptions:(uint64_t)a3 excludeRange:(uint64_t)a4 ignoreSharedCache:(char)a5;
+ (id)binaryLoadInfoWithBinary:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)binaryLoadInfoWithSegment:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)classDictionaryKey;
+ (id)loadInfosForSegmentsInBinary:(uint64_t)a3 binaryBaseAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:(uint64_t)a1;
+ (void)sortBinaryLoadInfos:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isInKernelAddressSpace;
- (NSString)debugDescription;
- (SABinary)binary;
- (SABinaryLoadInfo)initWithBinary:(id)a3 segment:(id)a4 loadAddress:(unint64_t)a5;
- (SAExclave)exclave;
- (SASegment)segment;
- (id)instructionAtOffsetIntoLoadInfo:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)loadAddress;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)textSegmentLoadAddress;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedImageInfo:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SABinaryLoadInfo

- (SABinaryLoadInfo)initWithBinary:(id)a3 segment:(id)a4 loadAddress:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SABinaryLoadInfo;
  v11 = -[SABinaryLoadInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_binary, a3);
    objc_storeStrong((id *)&v12->_segment, a4);
    v12->_loadAddress = a5;
  }

  return v12;
}

+ (id)binaryLoadInfoWithSegment:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a5;
  objc_opt_self();
  uint64_t v11 = [v9 binary];
  if (!v11)
  {
    int v16 = *__error();
    _sa_logt();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      a1 = [v9 debugDescription];
      *(_DWORD *)buf = 136315138;
      uint64_t v43 = [a1 UTF8String];
      _os_log_error_impl( &dword_186C92000,  v10,  OS_LOG_TYPE_ERROR,  "Getting a load info for segment %s when the binary has already been deallcoated",  buf,  0xCu);
    }

    *__error() = v16;
    id v9 = [v9 debugDescription];
    char v17 = [v9 UTF8String];
    _SASetCrashLogMessage( 2803,  "Getting a load info for segment %s when the binary has already been deallcoated",  v18,  v19,  v20,  v21,  v22,  v23,  v17);

    _os_crash();
    __break(1u);
LABEL_14:
    int v24 = *__error();
    _sa_logt();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [a1 debugDescription];
      uint64_t v27 = [v26 UTF8String];
      id v28 = [v9 debugDescription];
      uint64_t v29 = [v28 UTF8String];
      id v30 = -[os_log_s debugDescription](v10, "debugDescription");
      uint64_t v31 = [v30 UTF8String];
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = v27;
      __int16 v44 = 2080;
      uint64_t v45 = v29;
      __int16 v46 = 2080;
      uint64_t v47 = v31;
      _os_log_error_impl( &dword_186C92000,  v25,  OS_LOG_TYPE_ERROR,  "%s segment %s has exclave %s in user space",  buf,  0x20u);
    }

    *__error() = v24;
    id v32 = [a1 debugDescription];
    char v33 = [v32 UTF8String];
    id v34 = [v9 debugDescription];
    [v34 UTF8String];
    id v35 = -[os_log_s debugDescription](v10, "debugDescription");
    [v35 UTF8String];
    _SASetCrashLogMessage(2804, "%s segment %s has exclave %s in user space", v36, v37, v38, v39, v40, v41, v33);

    _os_crash();
    __break(1u);
  }

  a1 = (id)v11;
  if (v10 && (a4 & 1) == 0) {
    goto LABEL_14;
  }
  if (!a4)
  {
    v13 = &OBJC_CLASS___SAUserBinaryLoadInfo;
LABEL_9:
    v12 = (id *)[[v13 alloc] initWithBinary:a1 segment:v9 loadAddress:a3];
    goto LABEL_10;
  }

  if (!v10)
  {
    v13 = &OBJC_CLASS___SAKernelBinaryLoadInfo;
    goto LABEL_9;
  }

  v12 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]( objc_alloc(&OBJC_CLASS___SAExclaveBinaryLoadInfo),  v11,  (uint64_t)v9,  a3,  v10);
LABEL_10:
  objc_super v14 = v12;

  return v14;
}

+ (id)binaryLoadInfoWithBinary:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a5;
  objc_opt_self();
  if (v9 && (a4 & 1) == 0)
  {
    int v14 = *__error();
    _sa_logt();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 debugDescription];
      uint64_t v17 = [v16 UTF8String];
      id v18 = [v9 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = v17;
      __int16 v30 = 2080;
      uint64_t v31 = [v18 UTF8String];
      _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, "%s has exclave %s in user space", buf, 0x16u);
    }

    *__error() = v14;
    id v19 = [v8 debugDescription];
    char v20 = [v19 UTF8String];
    id v21 = [v9 debugDescription];
    [v21 UTF8String];
    _SASetCrashLogMessage(2819, "%s has exclave %s in user space", v22, v23, v24, v25, v26, v27, v20);

    _os_crash();
    __break(1u);
  }

  if (!a4)
  {
    uint64_t v11 = &OBJC_CLASS___SAUserBinaryLoadInfo;
LABEL_8:
    id v10 = (id *)[[v11 alloc] initWithBinary:v8 segment:0 loadAddress:a3];
    goto LABEL_9;
  }

  if (!v9)
  {
    uint64_t v11 = &OBJC_CLASS___SAKernelBinaryLoadInfo;
    goto LABEL_8;
  }

  id v10 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]( objc_alloc(&OBJC_CLASS___SAExclaveBinaryLoadInfo),  (uint64_t)v8,  0LL,  a3,  v9);
LABEL_9:
  v12 = v10;

  return v12;
}

- (unint64_t)length
{
  segment = self->_segment;
  if (!segment) {
    segment = self->_binary;
  }
  return [segment length];
}

- (BOOL)isInKernelAddressSpace
{
  return 0;
}

- (SAExclave)exclave
{
  return 0LL;
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4
{
  id v5 = a4;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke;
  v14[3] = &__block_descriptor_40_e26_q16__0__SABinaryLoadInfo_8l;
  v14[4] = a3;
  uint64_t v6 = SABinarySearchArray(v5, 1536, (uint64_t)v14);
  if (v6)
  {
    [v5 objectAtIndexedSubscript:v6 - 1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 segment];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 length];
    if (!v9)
    {
      [v7 binary];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 length];
      if (v11) {
        uint64_t v9 = v11;
      }
      else {
        uint64_t v9 = 0x10000000LL;
      }
    }

    if ([v7 loadAddress] + v9 <= a3) {
      id v12 = 0LL;
    }
    else {
      id v12 = v7;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

uint64_t __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke( uint64_t a1,  void *a2)
{
  unint64_t v3 = [a2 loadAddress];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = v4 >= v3;
  BOOL v6 = v4 > v3;
  if (v5) {
    return v6;
  }
  else {
    return -1LL;
  }
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4 libraryCache:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 binaryLoadInfos];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      unint64_t v11 = [v9 startAddress];
      id v12 = 0LL;
      if (v11 == -1LL || v11 > a3)
      {
LABEL_10:

        if (!v7) {
          goto LABEL_18;
        }
        goto LABEL_11;
      }

      if ([v9 endAddress] > a3)
      {
        +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:]( &OBJC_CLASS___SABinaryLoadInfo,  "binaryLoadInfoForAddress:inBinaryLoadInfos:",  a3,  v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }

    id v12 = 0LL;
    goto LABEL_10;
  }

  id v12 = 0LL;
  if (!v7) {
    goto LABEL_18;
  }
LABEL_11:
  if (!v12)
  {
    uint64_t v13 = +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:]( &OBJC_CLASS___SABinaryLoadInfo,  "binaryLoadInfoForAddress:inBinaryLoadInfos:",  a3,  v7);
    id v12 = (void *)v13;
    if (v9)
    {
      if (v13)
      {
        if ([v9 startAddress] != -1)
        {
          unint64_t v14 = [v12 loadAddress];
          if (v14 < [v9 startAddress] && objc_msgSend(v9, "startAddress") <= a3)
          {

            id v12 = 0LL;
          }
        }
      }
    }
  }

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3
{
  return (id)[a1 binaryLoadInfoForLiveProcessWithPid:*(void *)&a3 dataGatheringOptions:1026 additionalCSSymbolicatorFlags:0];
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4
{
  return (id)[a1 binaryLoadInfoForLiveProcessWithPid:*(void *)&a3 dataGatheringOptions:a4 additionalCSSymbolicatorFlags:0];
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  if ((a4 & 2) != 0 && (!a3 || (a4 & 0x400) != 0))
  {
    v9[1] = v5;
    v9[2] = v6;
    v9[0] = 0LL;
    CopyLoadInfosForLiveProcess(*(BOOL *)&a3, a4, v9, 0LL, 0LL, 0LL, 0LL, a5);
    id v7 = v9[0];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)binaryLoadInfoForSymbolicator:(uint64_t)a1 isKernel:(uint64_t)a2 dataGatheringOptions:(uint64_t)a3 excludeRange:(uint64_t)a4 ignoreSharedCache:(char)a5
{
  char v5 = ~a5;
  uint64_t v6 = objc_opt_self();
  id v7 = (void *)MEMORY[0x186E47ACC](v6);
  if ((v5 & 5) != 0) {
    id v8 = 0LL;
  }
  else {
    id v8 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2];
  id v10 = v8;
  id v11 = v9;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  [v10 done];
  +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)&OBJC_CLASS___SABinaryLoadInfo, v11);
  id v12 = (void *)[v11 copy];

  objc_autoreleasePoolPop(v7);
  return v12;
}

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 64) || (CSSymbolOwnerIsDyldSharedCache() & 1) == 0)
  {
    BOOL IsContiguous = SASymbolOwnerIsContiguous(a2, a3, &v18, 0LL);
    if ((CSRangeContainsRange() & 1) == 0)
    {
      +[SABinary binaryWithSymbolOwner:fromDisk:]((uint64_t)&OBJC_CLASS___SABinary, a2, a3, IsContiguous);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v7;
      if (v7)
      {
        if (IsContiguous)
        {
          uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
          +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  v8,  BaseAddress,  *(unsigned __int8 *)(a1 + 65),  0LL);
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 32) addObject:v10];
        }

        else
        {
          v11[0] = MEMORY[0x1895F87A8];
          v11[1] = 3221225472LL;
          v11[2] = __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2;
          v11[3] = &unk_189F62B70;
          __int128 v14 = *(_OWORD *)(a1 + 48);
          id v12 = v7;
          uint64_t v15 = a2;
          uint64_t v16 = a3;
          char v17 = *(_BYTE *)(a1 + 65);
          id v13 = *(id *)(a1 + 32);
          SASymbolOwnerForeachSegment(a2, a3, v11);

          id v10 = v12;
        }

        if (*(void *)(a1 + 40))
        {
          if ((CSSymbolOwnerIsDsym() & 1) == 0) {
            -[SABinaryLocator addURLForSymbolOwner:](*(_BYTE **)(a1 + 40));
          }
        }
      }
    }
  }

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if ((CSRangeIntersectsRange() & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
    -[SABinary segmentWithCSSegment:symbolOwnerLayoutMatchesDisk:symbolOwnerBaseAddress:](v6, a2, a3, 0, BaseAddress);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t Range = CSRegionGetRange();
    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v10,  Range,  *(unsigned __int8 *)(a1 + 80),  0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) addObject:v9];
  }

+ (void)sortBinaryLoadInfos:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  [v2 sortUsingComparator:&__block_literal_global_318];
}

+ (id)addBinaryLoadInfoForDyldImage:(void *)a3 toLoadInfos:(int)a4 isKernel:(int)a5 dataGatheringOptions:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v9 = objc_opt_self();
  id v10 = (void *)MEMORY[0x186E47ACC](v9);
  +[SABinary binaryForDyldImage:options:]((uint64_t)&OBJC_CLASS___SABinary, a2, a5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v11)
  {
    int v26 = a4;
    uint64_t v49 = 0LL;
    v50 = &v49;
    uint64_t v51 = 0x2020000000LL;
    uint64_t v52 = -1LL;
    uint64_t v45 = 0LL;
    __int16 v46 = &v45;
    uint64_t v47 = 0x2020000000LL;
    uint64_t v48 = 0LL;
    uint64_t v41 = 0LL;
    v42 = &v41;
    uint64_t v43 = 0x2020000000LL;
    uint64_t v44 = 0LL;
    uint64_t v37 = 0LL;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    uint64_t v40 = -1LL;
    uint64_t v13 = MEMORY[0x1895F87A8];
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke;
    v31[3] = &unk_189F629E8;
    id v14 = v11;
    id v32 = v14;
    char v33 = &v45;
    id v34 = &v49;
    id v35 = &v41;
    uint64_t v36 = &v37;
    int v15 = DyldImageEnumerateSegments(a2, v31);
    if (v15 < 0 || (uint64_t v16 = v38[3], v16 == -1) || !v16 || (v17 = v50[3], (unint64_t)(v17 + 1) <= 1))
    {
      int v18 = *__error();
      _sa_logt();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [v14 debugDescription];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = v38[3];
        uint64_t v25 = v50[3];
        *(_DWORD *)buf = 138413058;
        v54 = v23;
        __int16 v55 = 2048;
        uint64_t v56 = v24;
        __int16 v57 = 2048;
        uint64_t v58 = v25;
        __int16 v59 = 1024;
        int v60 = v15;
        _os_log_error_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_ERROR,  "Bad segments in dyld image for %@: imageTextStartAddress:%llu, imageStartAddress:%llu, ret %d",  buf,  0x26u);
      }

      id v20 = 0LL;
      *__error() = v18;
    }

    else
    {
      if (v16 == v17 && v46[3] - v16 == v42[3])
      {
        +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  v14,  v16,  v26,  0LL);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v22];
      }

      else
      {
        v27[0] = v13;
        v27[1] = 3221225472LL;
        v27[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_316;
        v27[3] = &unk_189F62BC0;
        id v28 = v14;
        char v30 = v26;
        id v29 = v8;
        DyldImageEnumerateSegments(a2, v27);

        uint64_t v22 = v28;
      }

      id v20 = v14;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }

  else
  {
    id v20 = 0LL;
  }

  objc_autoreleasePoolPop(v10);
  return v20;
}

uint64_t __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke( uint64_t a1,  char *__s1,  unint64_t a3,  uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    int v8 = *__error();
    _sa_logt();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) debugDescription];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315650;
      int v15 = __s1;
      __int16 v16 = 2048;
      uint64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "Segment %s load address is 0 (length 0x%llx) for %@",  (uint8_t *)&v14,  0x20u);
    }

    *__error() = v8;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(void *)(v10 + 24) < a4 + a3) {
    *(void *)(v10 + 24) = a4 + a3;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(void *)(v11 + 24) > a3) {
    *(void *)(v11 + 24) = a3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += a4;
  uint64_t result = strcmp(__s1, "__TEXT");
  if (!(_DWORD)result) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a3;
  }
  return result;
}

void __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_316( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void **)(a1 + 32);
  SANSStringForCString(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v7);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SABinary segmentWithCleanName:](v6, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v9,  a3,  *(unsigned __int8 *)(a1 + 48),  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) addObject:v10];
  }

  else
  {
    int v11 = *__error();
    _sa_logt();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      [*(id *)(a1 + 32) debugDescription];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = 138412546;
      int v15 = v13;
      __int16 v16 = 2082;
      uint64_t v17 = a2;
      _os_log_fault_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_FAULT,  "%@: No segment for %{public}s",  (uint8_t *)&v14,  0x16u);
    }

    *__error() = v11;
  }
}

+ (id)loadInfosForSegmentsInBinary:(uint64_t)a3 binaryBaseAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a5;
  objc_opt_self();
  uint64_t v20 = v8;
  [v8 segments];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 hasOffsetIntoBinary])
        {
          +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( SABinaryLoadInfo,  v17,  [v17 offsetIntoBinary] + a3,  a4,  v9);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 addObject:v18];
        }
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v14);
  }

  return v11;
}

- (id)instructionAtOffsetIntoLoadInfo:(unint64_t)a3
{
  segment = self->_segment;
  if (segment) {
    -[SASegment instructionAtOffsetIntoSegment:](segment, "instructionAtOffsetIntoSegment:", a3);
  }
  else {
    -[SABinary instructionAtOffsetIntoBinary:](self->_binary, "instructionAtOffsetIntoBinary:", a3);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __40__SABinaryLoadInfo_sortBinaryLoadInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 loadAddress];
  if (v6 >= [v5 loadAddress])
  {
    unint64_t v8 = [v4 loadAddress];
    uint64_t v7 = v8 > [v5 loadAddress];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  BOOL v4 = -[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace");
  segment = self->_segment;
  unint64_t loadAddress = self->_loadAddress;
  if (!segment) {
    segment = self->_binary;
  }
  uint64_t v7 = [segment debugDescription];
  unint64_t v8 = (void *)v7;
  id v9 = @" ";
  if (v4) {
    id v9 = @"*";
  }
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@0x%llx: %@", v9, loadAddress, v7];

  return (NSString *)v10;
}

- (unint64_t)textSegmentLoadAddress
{
  if (self->_segment) {
    return self->_loadAddress;
  }
  -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT_EXEC");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    && (-[SABinary segmentWithCleanName:](self->_binary, @"__TEXT"),
        (id v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL)
    || ([v3 hasOffsetIntoBinary] & 1) == 0)
  {

    return self->_loadAddress;
  }

  unint64_t loadAddress = self->_loadAddress;
  unint64_t v5 = [v3 offsetIntoBinary] + loadAddress;

  return v5;
}

- (SABinary)binary
{
  return (SABinary *)objc_getProperty(self, a2, 8LL, 1);
}

- (SASegment)segment
{
  return (SASegment *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)loadAddress
{
  return self->_loadAddress;
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v20 = a3;
  -[SABinary uuid](self->_binary, "uuid");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 UUIDString];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v20, (uint64_t)@"binary", v5);

  segment = self->_segment;
  if (segment)
  {
    -[SASegment name](segment, "name");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v20, @"segment", v7);
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_loadAddress];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v20, @"loadAddress", v8);

  if (-[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace"))
  {
    SAJSONWriteDictionaryEntry(v20, @"isInKernelAddressSpace", MEMORY[0x189604A88]);
    -[SABinaryLoadInfo exclave](self, "exclave");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SABinaryLoadInfo exclave](self, "exclave");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 name];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        SAJSONWriteDictionaryEntry(v20, @"exclave", v11);
      }

      else
      {
        id v12 = (void *)MEMORY[0x189607968];
        -[SABinaryLoadInfo exclave](self, "exclave");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "identifier"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        SAJSONWriteDictionaryEntry(v20, @"exclave", v14);
      }
    }
  }

  uint64_t v15 = -[SABinary path](self->_binary, "path");
  if (v15)
  {
    __int16 v16 = (void *)v15;
    -[SABinary uuid](self->_binary, "uuid");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)&OBJC_CLASS___SABinary, v17);

    if (v18)
    {
      -[SABinary path](self->_binary, "path");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v20, @"binaryPath", v19);
    }
  }
}

+ (id)classDictionaryKey
{
  return @"SABinaryLoadInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 35LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v11 = *__error();
    _sa_logt();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SABinaryLoadInfo debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v13 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = -[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v11;
    id v14 = -[SABinaryLoadInfo debugDescription](self, "debugDescription");
    char v15 = [v14 UTF8String];
    -[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5093, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 769;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_loadAddress;
  BYTE2(a3->var3) = BYTE2(a3->var3) & 0xFE | -[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace");
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_binary, v8);
  *(unint64_t *)((char *)&a3->var3 + 3) = SASerializableIndexForPointerFromSerializationDictionary( self->_segment,  v8);
  -[SABinaryLoadInfo exclave](self, "exclave");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)((char *)&a3->var4.var1 + 3) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    -[SABinary addSelfToSerializationDictionary:](self->_binary, "addSelfToSerializationDictionary:", v7);
    -[SASegment addSelfToSerializationDictionary:](self->_segment, "addSelfToSerializationDictionary:", v7);
    -[SABinaryLoadInfo exclave](self, "exclave");
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x12)
  {
    int v8 = *__error();
    _sa_logt();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v18 = a4;
      __int16 v19 = 2048;
      uint64_t v20 = 19LL;
      _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinaryLoadInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage( 5123,  "bufferLength %lu < serialized SABinaryLoadInfo struct %lu",  v10,  v11,  v12,  v13,  v14,  v15,  a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SABinaryLoadInfo version",  0LL);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }

  if ((*((_BYTE *)a3 + 18) & 1) != 0)
  {
    else {
      unint64_t v6 = off_189F60480;
    }
  }

  else
  {
    unint64_t v6 = off_189F605B0;
  }

  id result = objc_alloc_init(*v6);
  *((void *)result + 3) = *(void *)((char *)a3 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v55 = a5;
  id v10 = a6;
  if (a4 <= 0x12)
  {
    int v30 = *__error();
    _sa_logt();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 19LL;
      _os_log_error_impl( &dword_186C92000,  v31,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinaryLoadInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v30;
    _SASetCrashLogMessage( 5144,  "bufferLength %lu < serialized SABinaryLoadInfo struct %lu",  v32,  v33,  v34,  v35,  v36,  v37,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v55, v11, v13);
  uint64_t v14 = (SABinary *)objc_claimAutoreleasedReturnValue();
  binary = self->_binary;
  self->_binary = v14;

  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT_EXEC");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v24 = v23;
    if (v23)
    {
      unint64_t v25 = v23;
    }

    else
    {
      -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT");
      unint64_t v25 = (SASegment *)objc_claimAutoreleasedReturnValue();
    }

    segment = self->_segment;
    self->_segment = v25;

    goto LABEL_13;
  }

  if (a4 <= 0x1A)
  {
LABEL_21:
    int v38 = *__error();
    _sa_logt();
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 27LL;
      _os_log_error_impl( &dword_186C92000,  v39,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu",  buf,  0x16u);
    }

    *__error() = v38;
    _SASetCrashLogMessage( 5150,  "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu",  v40,  v41,  v42,  v43,  v44,  v45,  a4);
    _os_crash();
    __break(1u);
LABEL_24:
    int v46 = *__error();
    _sa_logt();
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 35LL;
      _os_log_error_impl( &dword_186C92000,  v47,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu",  buf,  0x16u);
    }

    *__error() = v46;
    _SASetCrashLogMessage( 5162,  "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu",  v48,  v49,  v50,  v51,  v52,  v53,  a4);
    _os_crash();
    __break(1u);
LABEL_27:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SABinaryLoadInfo version",  0LL);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v54);
  }

  id v16 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
  if (*v16 <= 30)
  {
    uint64_t v17 = (void *)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    *uint64_t v17 = v18;
  }

  unint64_t v19 = *(void *)((char *)a3 + 19);
  uint64_t v20 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v55, v11, v20, 0);
  uint64_t v21 = (SASegment *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = self->_segment;
  self->_segment = v21;

  if (*v16 <= 30) {
    *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0LL;
  }
LABEL_13:
  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4 > 0x22)
      {
        unint64_t v27 = *(void *)((char *)a3 + 27);
        uint64_t v28 = (void *)objc_opt_class();
        SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v27,  v55,  v11,  v28);
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self[1].super.isa, v29);

        goto LABEL_17;
      }

      goto LABEL_24;
    }
  }

+ (void)binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:(uint64_t)a1
{
  if (*(void *)(a2 + 16) <= 0x8000000000000000LL) {
    id v3 = off_189F605B0;
  }
  else {
    id v3 = off_189F604D0;
  }
  BOOL v4 = objc_alloc_init(*v3);
  v4[3] = *(void *)(a2 + 16);
  return v4;
}

- (void)populateReferencesUsingPAStyleSerializedImageInfo:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  if (a1)
  {
    unint64_t v6 = *(void *)(a2 + 8);
    id v7 = a4;
    id v8 = a3;
    id v9 = (void *)objc_opt_class();
    SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v8, v7, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v16, 0LL);
    uint64_t v11 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v10;

    -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), @"__TEXT_EXEC");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }

    else
    {
      -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), @"__TEXT");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v15 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v14;
  }

@end