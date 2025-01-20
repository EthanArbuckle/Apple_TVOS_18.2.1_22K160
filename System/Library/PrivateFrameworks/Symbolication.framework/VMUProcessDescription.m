@interface VMUProcessDescription
+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3;
+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3 withArchitecture:(_CSArchitecture)a4;
+ (id)parseBinaryImagesDescription:(id)a3;
- (BOOL)initFromCorpseOrCore;
- (BOOL)is64Bit;
- (BOOL)isAppleApplication;
- (BOOL)isTranslated;
- (VMUProcessDescription)initWithPid:(int)a3 orTask:(unsigned int)a4;
- (VMUProcessDescription)initWithTask:(unsigned int)a3 getBinariesList:(BOOL)a4;
- (VMUProcessDescription)initWithVMUTaskMemoryCache:(id)a3 getBinariesList:(BOOL)a4;
- (id)_binaryImagesDescriptionForRanges:(id)a3;
- (id)_buildInfoDescription;
- (id)_buildVersionDictionary;
- (id)_bundleLock;
- (id)_cpuTypeDescription;
- (id)_osVersionDictionary;
- (id)_rangesOfBinaryImages:(id)a3 forBacktraces:(id)a4;
- (id)_sanitizeVersion:(id)a3;
- (id)_systemVersionDescription;
- (id)binaryImageDictionaryForAddress:(unint64_t)a3;
- (id)binaryImages;
- (id)binaryImagesDescription;
- (id)binaryImagesDescriptionForBacktraces:(id)a3;
- (id)bundleIdentifier;
- (id)date;
- (id)dateAndVersionDescription;
- (id)description;
- (id)executablePath;
- (id)parentProcessName;
- (id)parentProcessPath;
- (id)processDescriptionHeader;
- (id)processIdentifier;
- (id)processName;
- (id)processStatisticsDescription;
- (id)processVersion;
- (id)processVersionDictionary;
- (id)valueForEnvVar:(id)a3;
- (int)cpuType;
- (int)parentPid;
- (int)pid;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unsigned)idleExitStatus;
- (unsigned)task;
- (void)_libraryLoaded:(_CSTypeRef)a3;
- (void)dealloc;
- (void)initFromLiveProcess;
- (void)setCrashReporterInfo;
@end

@implementation VMUProcessDescription

- (void)setCrashReporterInfo
{
  v3 = (void *)MEMORY[0x186E32E40](self, a2);
  processName = (__CFString *)self->_processName;
  if (!processName) {
    processName = @"<unknown>";
  }
  v5 = processName;
  executablePath = (__CFString *)self->_executablePath;
  if (!executablePath) {
    executablePath = @"<unknown>";
  }
  v7 = executablePath;
  parentProcessName = (__CFString *)self->_parentProcessName;
  if (!parentProcessName) {
    parentProcessName = @"<unknown>";
  }
  v9 = parentProcessName;
  parentExecutablePath = (__CFString *)self->_parentExecutablePath;
  if (!parentExecutablePath) {
    parentExecutablePath = @"<unknown>";
  }
  v11 = parentExecutablePath;
  [NSString stringWithFormat:@"VMUProcessDescription is examining:\n   process: %@  pid: %d  path: %@  _binaryImages count: %zu\n   parent process: %@  pid: %d  path: %@\n", v5, self->_pid, v7, -[NSMutableArray count](self->_binaryImages, "count"), v9, self->_ppid, v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  VMUSetCrashReporterInfo(v12);

  objc_autoreleasePoolPop(v3);
}

+ (id)parseBinaryImagesDescription:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189603FA8] array];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[objc_alloc(MEMORY[0x189607A08]) initWithString:v3];
  [MEMORY[0x189607810] newlineCharacterSet];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    [v5 scanUpToString:@"/" intoString:0];
    if ([v5 isAtEnd]) {
      break;
    }
    id v12 = 0LL;
    [v5 scanUpToCharactersFromSet:v6 intoString:&v12];
    id v7 = v12;
    v8 = v7;
    if (v7)
    {
      [v7 substringFromIndex:[v7 rangeOfString:@"/", 4] + 1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 length])
      {
        id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v10 setObject:v8 forKey:@"ExecutablePath"];
        [v10 setObject:v9 forKey:@"DisplayName"];
        [v4 addObject:v10];
      }
    }
  }

  return v4;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 symbolicatorFromBinaryImagesDescription:v4 withArchitecture:MEMORY[0x186E31ED4]()];
  unint64_t v7 = v6;

  unint64_t v8 = v5;
  unint64_t v9 = v7;
  result._opaque_2 = v9;
  result._opaque_1 = v8;
  return result;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3 withArchitecture:(_CSArchitecture)a4
{
  id v5 = a3;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x4812000000LL;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = &unk_1861837AD;
  v44 = 0LL;
  v45 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x4812000000LL;
  v32 = __Block_byref_object_copy__11;
  v33 = __Block_byref_object_dispose__12;
  v34 = &unk_1861837AD;
  __p = 0LL;
  v36 = 0LL;
  uint64_t v37 = 0LL;
  int v6 = [v5 containsString:@"("];
  if (v6) {
    unint64_t v7 = @"(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*\\(([0-9\\- \\.\\?]*)\\)\\s*<(\\S{36})>\\s*(.*)";
  }
  else {
    unint64_t v7 = @"(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*(\\S*)\\s*<(\\S{32})>\\s*(.*)";
  }
  [MEMORY[0x189607A00] regularExpressionWithPattern:v7 options:1 error:0];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v5 length];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke;
  v23[3] = &unk_189DFDC00;
  id v10 = v5;
  id v24 = v10;
  v25 = &v29;
  char v28 = v6;
  v26 = &v38;
  _CSArchitecture v27 = a4;
  [v8 enumerateMatchesInString:v10 options:0 range:0 usingBlock:v9, v23];
  uint64_t v11 = v39[6];
  if (v39[7] == v11) {
    goto LABEL_11;
  }
  uint64_t v12 = 0LL;
  unint64_t v13 = 0LL;
  uint64_t v14 = 48LL;
  do
  {
    *(void *)(v11 + v14) = v30[6] + v12;
    ++v13;
    uint64_t v11 = v39[6];
    uint64_t v15 = v39[7];
    v12 += 40LL;
    v14 += 64LL;
  }

  while (v13 < (v15 - v11) >> 6);
  if (v15 == v11)
  {
LABEL_11:
    uint64_t v16 = 0LL;
    unint64_t v18 = 0LL;
  }

  else
  {
    uint64_t v16 = CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification();
    unint64_t v18 = v17;
    uint64_t v19 = v39[6];
    uint64_t v20 = v39[7];
    while (v19 != v20)
    {
      free(*(void **)(v19 + 40));
      v19 += 64LL;
    }
  }

  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v38, 8);
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }

  unint64_t v21 = v16;
  unint64_t v22 = v18;
  result._opaque_2 = v22;
  result._opaque_1 = v21;
  return result;
}

void __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  context = (void *)MEMORY[0x186E32E40]();
  *((void *)&v86 + 1) = 1LL;
  strcpy((char *)&v88, "__TEXT");
  uint64_t v4 = [v3 rangeAtIndex:1];
  uint64_t v6 = v5;
  uint64_t v7 = [v3 rangeAtIndex:2];
  uint64_t v9 = v8;
  uint64_t v10 = [v3 rangeAtIndex:4];
  uint64_t v78 = v11;
  uint64_t v12 = v10;
  uint64_t v13 = [v3 rangeAtIndex:5];
  uint64_t v77 = v12;
  uint64_t v79 = v14;
  uint64_t v80 = v13;
  uint64_t v15 = [v3 rangeAtIndex:6];
  uint64_t v17 = v16;
  id v18 = objc_alloc(MEMORY[0x189607A08]);
  [*(id *)(a1 + 32) substringWithRange:v4, v6];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)[v18 initWithString:v19];

  [v20 scanHexLongLong:&v87];
  id v21 = objc_alloc(MEMORY[0x189607A08]);
  [*(id *)(a1 + 32) substringWithRange:v7, v9];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)[v21 initWithString:v22];

  [v23 scanHexLongLong:(char *)&v87 + 8];
  ++*((void *)&v87 + 1);
  id v24 = *(void **)(*(void *)(a1 + 40) + 8LL);
  unint64_t v25 = v24[7];
  unint64_t v26 = v24[8];
  if (v25 >= v26)
  {
    uint64_t v30 = v24[6];
    unint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v25 - v30) >> 3);
    unint64_t v32 = v31 + 1;
    if (v31 + 1 > 0x666666666666666LL) {
      std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v33 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v26 - v30) >> 3);
    if (2 * v33 > v32) {
      unint64_t v32 = 2 * v33;
    }
    if (v33 >= 0x333333333333333LL) {
      unint64_t v34 = 0x666666666666666LL;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v34) {
      v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>( (uint64_t)(v24 + 8),  v34);
    }
    else {
      v35 = 0LL;
    }
    v36 = &v35[40 * v31];
    uint64_t v37 = &v35[40 * v34];
    __int128 v38 = v87;
    __int128 v39 = v88;
    *((void *)v36 + 4) = v89;
    *(_OWORD *)v36 = v38;
    *((_OWORD *)v36 + 1) = v39;
    uint64_t v29 = v36 + 40;
    v41 = (char *)v24[6];
    uint64_t v40 = (char *)v24[7];
    if (v40 != v41)
    {
      do
      {
        __int128 v42 = *(_OWORD *)(v40 - 40);
        __int128 v43 = *(_OWORD *)(v40 - 24);
        *((void *)v36 - 1) = *((void *)v40 - 1);
        *(_OWORD *)(v36 - 24) = v43;
        *(_OWORD *)(v36 - 40) = v42;
        v36 -= 40;
        v40 -= 40;
      }

      while (v40 != v41);
      uint64_t v40 = (char *)v24[6];
    }

    v24[6] = v36;
    v24[7] = v29;
    v24[8] = v37;
    if (v40) {
      operator delete(v40);
    }
  }

  else
  {
    __int128 v27 = v87;
    __int128 v28 = v88;
    *(void *)(v25 + 32) = v89;
    *(_OWORD *)unint64_t v25 = v27;
    *(_OWORD *)(v25 + 16) = v28;
    uint64_t v29 = (char *)(v25 + 40);
  }

  v24[7] = v29;
  if (*(_BYTE *)(a1 + 64))
  {
    unint64_t v44 = *(void *)(a1 + 56);
  }

  else
  {
    uint64_t v82 = 0LL;
    id v45 = [*(id *)(a1 + 32) substringWithRange:v77, v78];
    uint64_t v46 = [v45 cStringUsingEncoding:4];

    if ((MEMORY[0x186E329CC](v46, (char *)&v82 + 4, &v82) & 1) == 0)
    {
      CFLog();
      goto LABEL_43;
    }

    unint64_t v44 = HIDWORD(v82) | ((unint64_t)v82 << 32);
  }

  *(void *)&__int128 v85 = v44;
  id v47 = [*(id *)(a1 + 32) substringWithRange:v15, v17];
  v48 = (const char *)[v47 cStringUsingEncoding:4];

  size_t v49 = strlen(v48);
  *((void *)&v85 + 1) = strndup(v48, v49);
  if (*((void *)&v85 + 1))
  {
    [*(id *)(a1 + 32) substringWithRange:v80, v79];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    char v51 = [v50 containsString:@"-"];
    id v52 = v50;
    v53 = v52;
    if ((v51 & 1) != 0) {
      MEMORY[0x186E32288]([v52 cStringUsingEncoding:1], &v84);
    }
    else {
      sscanf( (const char *)[v52 cStringUsingEncoding:1],  "%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx",  &v84,  (char *)&v84 + 1,  (char *)&v84 + 2,  (char *)&v84 + 3,  (char *)&v84 + 4,  (char *)&v84 + 5,  (char *)&v84 + 6,  (char *)&v84 + 7,  (char *)&v84 + 8,  (char *)&v84 + 9,  (char *)&v84 + 10,  (char *)&v84 + 11,  (char *)&v84 + 12,  (char *)&v84 + 13,  (char *)&v84 + 14,  (char *)&v84 + 15);
    }
    v54 = *(void **)(*(void *)(a1 + 48) + 8LL);
    v55 = (_OWORD *)v54[7];
    unint64_t v56 = v54[8];
    if ((unint64_t)v55 >= v56)
    {
      uint64_t v61 = v54[6];
      uint64_t v62 = ((uint64_t)v55 - v61) >> 6;
      unint64_t v63 = v62 + 1;
      uint64_t v64 = v56 - v61;
      if (v64 >> 5 > v63) {
        unint64_t v63 = v64 >> 5;
      }
      else {
        unint64_t v65 = v63;
      }
      if (v65) {
        v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>( (uint64_t)(v54 + 8),  v65);
      }
      else {
        v66 = 0LL;
      }
      v67 = &v66[64 * v62];
      v68 = &v66[64 * v65];
      __int128 v69 = v83;
      __int128 v70 = v84;
      __int128 v71 = v86;
      *((_OWORD *)v67 + 2) = v85;
      *((_OWORD *)v67 + 3) = v71;
      *(_OWORD *)v67 = v69;
      *((_OWORD *)v67 + 1) = v70;
      v60 = v67 + 64;
      v73 = (char *)v54[6];
      v72 = (char *)v54[7];
      if (v72 != v73)
      {
        do
        {
          __int128 v74 = *((_OWORD *)v72 - 4);
          __int128 v75 = *((_OWORD *)v72 - 3);
          __int128 v76 = *((_OWORD *)v72 - 1);
          *((_OWORD *)v67 - 2) = *((_OWORD *)v72 - 2);
          *((_OWORD *)v67 - 1) = v76;
          *((_OWORD *)v67 - 4) = v74;
          *((_OWORD *)v67 - 3) = v75;
          v67 -= 64;
          v72 -= 64;
        }

        while (v72 != v73);
        v72 = (char *)v54[6];
      }

      v54[6] = v67;
      v54[7] = v60;
      v54[8] = v68;
      if (v72) {
        operator delete(v72);
      }
    }

    else
    {
      __int128 v57 = v83;
      __int128 v58 = v84;
      __int128 v59 = v86;
      v55[2] = v85;
      v55[3] = v59;
      _OWORD *v55 = v57;
      v55[1] = v58;
      v60 = v55 + 4;
    }

    v54[7] = v60;
  }

- (VMUProcessDescription)initWithPid:(int)a3 orTask:(unsigned int)a4
{
  return -[VMUProcessDescription initWithTask:getBinariesList:]( self,  "initWithTask:getBinariesList:",  *(void *)&a4,  0LL);
}

- (VMUProcessDescription)initWithTask:(unsigned int)a3 getBinariesList:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = -[VMUTaskMemoryCache initWithTask:]( objc_alloc(&OBJC_CLASS___VMUTaskMemoryCache),  "initWithTask:",  *(void *)&a3);
  uint64_t v7 = -[VMUProcessDescription initWithVMUTaskMemoryCache:getBinariesList:]( self,  "initWithVMUTaskMemoryCache:getBinariesList:",  v6,  v4);

  return v7;
}

- (VMUProcessDescription)initWithVMUTaskMemoryCache:(id)a3 getBinariesList:(BOOL)a4
{
  int v4 = a4;
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v50 = a3;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___VMUProcessDescription;
  uint64_t v7 = -[VMUProcessDescription init](&v65, sel_init);
  if (!v7) {
    goto LABEL_60;
  }
  uint64_t v8 = [MEMORY[0x189603F50] date];
  date = v7->_date;
  v7->_date = (NSDate *)v8;

  if (v50)
  {
    p_memoryCache = (BOOL *)&v7->_memoryCache;
    objc_storeStrong((id *)&v7->_memoryCache, a3);
    BOOL v10 = -[VMUTaskMemoryCache representsCore]((BOOL)v7->_memoryCache);
    memoryCache = v7->_memoryCache;
    if (v10)
    {
      if (-[VMUTaskMemoryCache isKernel](memoryCache, "isKernel"))
      {
        v7->_uint64_t pid = -1;
LABEL_11:
        if (-[VMUTaskMemoryCache getPlatform:](v7->_memoryCache, "getPlatform:", &v7->_platform))
        {

          uint64_t v7 = 0LL;
          goto LABEL_13;
        }

        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          v7->_BOOL taskIsCorpseOrCore = 1;
          -[VMUProcessDescription initFromCorpseOrCore](v7, "initFromCorpseOrCore");
        }

        else if (-[VMUProcessDescription initFromCorpseOrCore](v7, "initFromCorpseOrCore"))
        {
          v7->_BOOL taskIsCorpseOrCore = 1;
        }

        else
        {
          v7->_BOOL taskIsCorpseOrCore = 0;
          -[VMUProcessDescription initFromLiveProcess](v7, "initFromLiveProcess");
        }

        *(void *)v67 = 0x100000006LL;
        if (!sysctl(v67, 2u, 0LL, &v64, 0LL, 0LL))
        {
          uint64_t v14 = malloc(v64);
          if (!sysctl(v67, 2u, v14, &v64, 0LL, 0LL))
          {
            uint64_t v15 = [objc_alloc(NSString) initWithUTF8String:v14];
            hardwareModel = v7->_hardwareModel;
            v7->_hardwareModel = (NSString *)v15;
          }

          free(v14);
        }

        if (!v7->_hardwareModel)
        {
          v7->_hardwareModel = (NSString *)&stru_189E010C8;
        }

        if (!-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          int ppid = v7->_ppid;
          if (ppid)
          {
            CFStringRef v18 = _CRCopyProcessNameForPID(ppid);
            parentProcessName = v7->_parentProcessName;
            v7->_parentProcessName = &v18->isa;

            CFStringRef v20 = _CRCopyExecutablePathForPID(v7->_ppid);
            parentExecutablePath = v7->_parentExecutablePath;
            v7->_parentExecutablePath = &v20->isa;
          }
        }

        if (!v7->_taskIsCorpseOrCore)
        {
          [(id)*p_memoryCache taskPort];
          v4 &= CSTaskHasStarted();
        }

        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache)
          || [(id)*p_memoryCache taskPort]
          && [(id)*p_memoryCache taskPort] != -1)
        {
          unint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
          binaryImages = v7->_binaryImages;
          v7->_binaryImages = v22;

          if (v4)
          {
            BOOL taskIsCorpseOrCore = v7->_taskIsCorpseOrCore;
            int FlagsForNoSymbolOrSourceInfoData = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
            objc_initWeak(location, v7);
            BOOL v26 = -[VMUTaskMemoryCache representsCore]((BOOL)v7->_memoryCache);
            uint64_t v27 = FlagsForNoSymbolOrSourceInfoData | !taskIsCorpseOrCore;
            uint64_t v28 = *p_memoryCache;
            if (v26)
            {
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]( *p_memoryCache,  v27,  0LL);
              v7->_symbolicator._opaque_2 = v29;
              v62[1] = (id)MEMORY[0x1895F87A8];
              v62[2] = (id)3221225472LL;
              v62[3] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke;
              v62[4] = &unk_189DFD8D8;
              unint64_t v63 = v7;
              CSSymbolicatorForeachSymbolOwnerAtTime();
            }

            else
            {
              v61[0] = MEMORY[0x1895F87A8];
              v61[1] = 3221225472LL;
              v61[2] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2;
              v61[3] = &unk_189DFDC50;
              objc_copyWeak(v62, location);
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]( v28,  v27,  v61);
              v7->_symbolicator._opaque_2 = v31;
              objc_destroyWeak(v62);
            }

            if (CSIsNull())
            {
              uint64_t pid = v7->_pid;
              -[VMUProcessDescription processName](v7, "processName");
              uint64_t v45 = pid;
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
              CFLog();
            }

            objc_destroyWeak(location);
          }
        }

        else
        {
          uint64_t v30 = v7->_pid;
          -[VMUProcessDescription processName](v7, "processName");
          uint64_t v45 = v30;
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
          CFLog();
        }

        if (v7->_executablePathNeedsCorrection || !-[NSString length](v7->_executablePath, "length"))
        {
          id v47 = v7->_binaryImages;
          objc_sync_enter(v47);
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          obj = v7->_binaryImages;
          uint64_t v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
          if (v33)
          {
            uint64_t v34 = *(void *)v58;
            while (2)
            {
              for (uint64_t i = 0LL; i != v33; ++i)
              {
                if (*(void *)v58 != v34) {
                  objc_enumerationMutation(obj);
                }
                v36 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                -[VMUProcessDescription processIdentifier](v7, "processIdentifier", v45, v46);
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
                [v36 objectForKey:@"Identifier"];
                __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
                int v39 = [v37 isEqualToString:v38];

                if (v39)
                {
                  [v36 objectForKey:@"ExecutablePath"];
                  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v40;
                  if (v40)
                  {
                    uint64_t v42 = [v40 copy];
                    executablePath = v7->_executablePath;
                    v7->_executablePath = (NSString *)v42;

                    v7->_executablePathNeedsCorrection = 0;
                    goto LABEL_53;
                  }
                }
              }

              uint64_t v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
              if (v33) {
                continue;
              }
              break;
            }
          }

uint64_t __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) _libraryLoaded:a2, a3];
}

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2( uint64_t a1,  int a2,  uint64_t a3)
{
  if (a2 == 256)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _libraryLoaded:*(void *)(a3 + 16), *(void *)(a3 + 24)];
  }

  else if (a2 == 16)
  {
    objc_copyWeak(&v5, (id *)(a1 + 32));
    CSSymbolicatorForeachSymbolOwnerAtTime();
    objc_destroyWeak(&v5);
  }

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _libraryLoaded:a2, a3];
}

- (void)initFromLiveProcess
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  size_t __size = 0LL;
  *(void *)uint64_t v19 = 0xE00000001LL;
  int pid = self->_pid;
  int v20 = 1;
  int v21 = pid;
  if ((sysctl(v19, 4u, 0LL, &__size, 0LL, 0LL) & 0x80000000) == 0)
  {
    int v4 = malloc(__size);
    if (v4)
    {
      id v5 = v4;
      if ((sysctl(v19, 4u, v4, &__size, 0LL, 0LL) & 0x80000000) == 0)
      {
        self->_is64Bit = (*((_BYTE *)v5 + 32) & 4) != 0;
        self->_proc_starttime = *(timeval *)v5;
        self->_int ppid = *((_DWORD *)v5 + 140);
      }

      free(v5);
    }
  }

  __int16 v17 = 0;
  size_t __size = 0LL;
  *(void *)uint64_t v19 = 0LL;
  _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies( self->_pid,  (CFStringRef *)v19,  &v17,  (CFStringRef *)&__size,  (_BYTE *)&v17 + 1);
  executablePath = self->_executablePath;
  self->_executablePath = *(NSString **)v19;

  processName = self->_processName;
  self->_processName = (NSString *)__size;

  memoryCache = self->_memoryCache;
  self->_executablePathNeedsCorrection = (_BYTE)v17 != 0;
  self->_processNameNeedsCorrection = HIBYTE(v17) != 0;
  -[VMUTaskMemoryCache taskPort](memoryCache, "taskPort");
  self->_taskIsTranslated = CSTaskIsTranslated();
  uint32_t flags = 0;
  proc_get_dirty(self->_pid, &flags);
  if ((flags & 4) != 0) {
    int v9 = 3;
  }
  else {
    int v9 = 2;
  }
  if ((~flags & 3) != 0) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = v9;
  }
  self->_idleExitStatus = v10;
  uint64_t v11 = -[VMUProcInfo initWithTask:]( objc_alloc(&OBJC_CLASS___VMUProcInfo),  "initWithTask:",  -[VMUTaskMemoryCache taskPort](self->_memoryCache, "taskPort"));
  mach_error_t v12 = v11;
  if (!v11)
  {
    CFLog();
    goto LABEL_25;
  }

  int v13 = -[VMUProcInfo cpuType](v11, "cpuType");
  self->_cpuType = v13;
  if (self->_is64Bit)
  {
    int v14 = 16777223;
    if (v13 == 18)
    {
      int v14 = 16777234;
    }

    else if (v13 != 7)
    {
      goto LABEL_20;
    }

    self->_cpuType = v14;
  }

- (BOOL)initFromCorpseOrCore
{
  kern_return_t v10;
  task_t v11;
  vm_map_t *v12;
  mach_vm_size_t v13;
  int *v14;
  mach_vm_size_t v15;
  mach_vm_address_t v16;
  vm_map_t *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *environment;
  const char *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int i;
  const char *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  char v55;
  char v56;
  int v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  id obj[2];
  id v70[2];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _OWORD v74[2];
  mach_vm_size_t kcd_size;
  mach_vm_address_t kcd_addr_begin;
  __int128 v77;
  char v78;
  uint64_t v79;
  uint64_t v79 = *MEMORY[0x1895F89C0];
  v73 = 0u;
  memset(v74, 0, 24);
  __int128 v71 = 0u;
  v72 = 0u;
  *(_OWORD *)obj = 0u;
  *(_OWORD *)__int128 v70 = 0u;
  BOOL v3 = -[VMUTaskMemoryCache representsCore]((BOOL)self->_memoryCache);
  memoryCache = self->_memoryCache;
  if (v3)
  {
    id v5 = memoryCache;
    -[VMUTaskMemoryCache coreFileProcName](v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    obj[0] = (id)[v6 copy];

    -[VMUTaskMemoryCache coreFileProcPath](v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    obj[1] = (id)[v7 copy];

    -[VMUTaskMemoryCache coreFileParentProcName](v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = (id)[v8 copy];

    -[VMUTaskMemoryCache coreFileParentProcPath](v5);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = (id)[v9 copy];

    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcFlags:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcArgc:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePid:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileCPUType:](v5, "getCoreFileCPUType:", (char *)&v71 + 4))
    {
      unsigned int v10 = 5;
    }

    else if (-[VMUTaskMemoryCache getCoreFileDirtyFlags:]((uint64_t)v5))
    {
      unsigned int v10 = 5;
    }

    else
    {
      unsigned int v10 = 0;
    }
  }

  else
  {
    uint64_t v11 = -[VMUTaskMemoryCache taskPort](memoryCache, "taskPort");
    kcd_size = 0LL;
    kcd_addr_begin = 0LL;
    mach_error_t v12 = (vm_map_t *)MEMORY[0x1895FBBE0];
    unsigned int v10 = task_map_corpse_info_64(*MEMORY[0x1895FBBE0], v11, &kcd_addr_begin, &kcd_size);
    if (!v10)
    {
      int v13 = kcd_size;
      int v14 = (int *)kcd_addr_begin;
      uint64_t v15 = kcd_size + kcd_addr_begin;
      uint64_t v16 = kcd_addr_begin + 16;
      if (v14 + 4 <= (int *)((char *)v14 + kcd_size) && v16 + *(unsigned int *)(kcd_addr_begin + 4) <= v15)
      {
        CFStringRef v18 = 0;
        if (*(_DWORD *)kcd_addr_begin == -559025833)
        {
          objc_super v65 = 0;
          unint64_t v63 = 0LL;
          size_t v64 = 0LL;
          uint64_t v62 = 0;
          uint64_t v55 = 0;
          unint64_t v56 = 0;
          uint64_t v68 = 0LL;
          do
          {
            __int128 v57 = *v14;
            if (*v14 == -242132755) {
              break;
            }
            if ((v57 & 0xFFFFFFF0) == 0x20) {
              __int128 v57 = 17;
            }
            switch(v57)
            {
              case 2053:
                DWORD2(v71) = v14[4];
                objc_super v65 = 1;
                break;
              case 2054:
                HIDWORD(v71) = v14[4];
                BYTE4(v64) = 1;
                break;
              case 2055:
              case 2056:
              case 2058:
              case 2062:
              case 2064:
              case 2065:
              case 2066:
              case 2067:
                break;
              case 2057:
                uint64_t v77 = *((_OWORD *)v14 + 1);
                uint64_t v78 = 0;
                __int128 v58 = [NSString stringWithUTF8String:&v77];
                __int128 v59 = obj[0];
                obj[0] = (id)v58;

                break;
              case 2059:
                *(void *)&v72 = *((void *)v14 + 2);
                *((void *)&v72 + 1) = v14[6];
                LOBYTE(v64) = 1;
                break;
              case 2060:
                *(void *)&v73 = *((void *)v14 + 2);
                BYTE4(v63) = 1;
                break;
              case 2061:
                HIDWORD(v73) = v14[4];
                uint64_t v62 = 1;
                break;
              case 2063:
                __int128 v60 = [NSString stringWithUTF8String:v14 + 4];
                uint64_t v61 = obj[1];
                obj[1] = (id)v60;

                break;
              case 2068:
                LODWORD(v74[0]) = v14[4];
                uint64_t v55 = 1;
                break;
              case 2069:
                DWORD2(v73) = v14[4];
                LOBYTE(v63) = 1;
                break;
              case 2070:
                DWORD1(v71) = v14[4];
                unint64_t v56 = 1;
                break;
              default:
                if (v57 == 2086)
                {
                  *((void *)&v74[0] + 1) = *((void *)v14 + 2);
                  BYTE4(v68) = 1;
                }

                else if (v57 == 2087)
                {
                  *(void *)&v74[1] = *((void *)v14 + 2);
                  LOBYTE(v68) = 1;
                }

                break;
            }

            int v14 = (int *)(v16 + v14[1]);
            uint64_t v16 = (mach_vm_address_t)(v14 + 4);
          }

          while ((unint64_t)(v14 + 4) <= v15);
          __int16 v17 = v12;
          int v13 = kcd_size;
          int v14 = (int *)kcd_addr_begin;
          CFStringRef v18 = v68 & 1;
          LODWORD(v67) = v56 & 1;
          HIDWORD(v67) = BYTE4(v68) & 1;
          v66 = v55 & 1;
          uint64_t v19 = v62 & 1;
          int v20 = v63 & 1;
          int v21 = BYTE4(v63) & 1;
          uint64_t v22 = v64 & 1;
          v23 = BYTE4(v64) & 1;
          id v24 = v65 & 1;
        }

        else
        {
          __int16 v17 = v12;
          v67 = 0LL;
          v66 = 0;
          uint64_t v19 = 0;
          int v20 = 0;
          int v21 = 0;
          uint64_t v22 = 0;
          v23 = 0;
          id v24 = 0;
        }
      }

      else
      {
        __int16 v17 = v12;
        CFStringRef v18 = 0;
        v67 = 0LL;
        v66 = 0;
        uint64_t v19 = 0;
        int v20 = 0;
        int v21 = 0;
        uint64_t v22 = 0;
        v23 = 0;
        id v24 = 0;
      }

      mach_vm_deallocate(*v17, (mach_vm_address_t)v14, v13);
      unsigned int v10 = 5;
      if (obj[0])
      {
        if (obj[1]) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = 0;
        }
        else {
          unsigned int v10 = 5;
        }
      }
    }
  }

  if (-[VMUTaskMemoryCache isKernel](self->_memoryCache, "isKernel"))
  {
    BOOL v26 = obj[0];
    obj[0] = @"kernel";

    LODWORD(v71) = 4;
    DWORD2(v73) = 4;
  }

  else if (v10)
  {
    uint64_t v27 = 0;
    goto LABEL_76;
  }

  objc_storeStrong((id *)&self->_processName, obj[0]);
  self->_proc_starttime.tv_sec = v72;
  uint64_t v28 = v73;
  self->_proc_starttime.tv_usec = DWORD2(v72);
  unint64_t v29 = HIDWORD(v73);
  objc_storeStrong((id *)&self->_executablePath, obj[1]);
  -[NSString lastPathComponent](self->_executablePath, "lastPathComponent");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v30 length]) {
    objc_storeStrong((id *)&self->_processName, v30);
  }
  objc_storeStrong((id *)&self->_parentExecutablePath, v70[1]);
  objc_storeStrong((id *)&self->_parentProcessName, v70[0]);
  -[NSString lastPathComponent](self->_parentExecutablePath, "lastPathComponent");
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v31 length]) {
    objc_storeStrong((id *)&self->_parentProcessName, v31);
  }
  unint64_t v32 = DWORD1(v71);
  if ((v71 & 4) != 0) {
    uint64_t v33 = 3;
  }
  else {
    uint64_t v33 = 2;
  }
  if ((~(_DWORD)v71 & 3) != 0) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = v33;
  }
  self->_idleExitStatus = v34;
  v35 = v74[0];
  v36 = DWORD2(v73);
  self->_is64Bit = (BYTE8(v73) & 4) != 0;
  self->_cpuType = v32;
  uint64_t v37 = HIDWORD(v71);
  self->_int pid = DWORD2(v71);
  *(_OWORD *)&self->_physicalFootprint = *(_OWORD *)((char *)v74 + 8);
  self->_int ppid = v37;
  self->_taskIsTranslated = (v36 & 0x20000) != 0;
  if (v28)
  {
    if ((int)v29 >= 1)
    {
      __int128 v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      environment = self->_environment;
      self->_environment = v38;

      *(void *)&uint64_t v77 = 0LL;
      if (!-[VMUTaskMemoryCache mapAddress:size:returnedAddress:returnedSize:]( self->_memoryCache,  "mapAddress:size:returnedAddress:returnedSize:",  v28 - v29,  v29,  &v77,  0LL)
        && v29 >= 5)
      {
        uint64_t v40 = (const char *)(v77 + 4);
        v41 = 4;
        while (*v40)
        {
          ++v41;
          ++v40;
          if ((_DWORD)v29 == v41) {
            goto LABEL_75;
          }
        }

        if (v41 < (int)v29)
        {
          uint64_t v42 = v41 + 1;
          while ((_DWORD)v29 != v42)
          {
            __int128 v43 = *(unsigned __int8 *)++v40;
            ++v42;
            if (v43)
            {
              unint64_t v44 = v42 - 1;
              if (v35 >= 1)
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  uint64_t v46 = v40 + 1;
                  while (*v40)
                  {
                    ++v44;
                    ++v40;
                    ++v46;
                    if ((_DWORD)v29 == v44) {
                      goto LABEL_75;
                    }
                  }

                  if (v44 < (int)v29)
                  {
                    while (1)
                    {
                      uint64_t v40 = v46;
                      ++v46;
                      if (*v40) {
                        goto LABEL_64;
                      }
                    }

                    unint64_t v44 = v29;
                  }

- (void)_libraryLoaded:(_CSTypeRef)a3
{
  int v4 = (void *)MEMORY[0x186E32E40](self, a2);
  [MEMORY[0x189603FC8] dictionary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t Name = CSSymbolOwnerGetName();
  if (Name)
  {
    [NSString stringWithUTF8String:Name];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      uint64_t v8 = [NSString stringWithCString:Name encoding:30];
      if (v8) {
        uint64_t v7 = (__CFString *)v8;
      }
      else {
        uint64_t v7 = @"nonUTF8-binary-name";
      }
    }

    [v5 setObject:v7 forKey:@"Identifier"];
  }

  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    [NSString stringWithUTF8String:Path];
    unsigned int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      uint64_t v11 = [NSString stringWithCString:Path encoding:30];
      if (v11) {
        unsigned int v10 = (__CFString *)v11;
      }
      else {
        unsigned int v10 = @"nonUTF8-binary-path";
      }
    }

    -[__CFString stringByStandardizingPath](v10, "stringByStandardizingPath");
    mach_error_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 setObject:v12 forKey:@"ExecutablePath"];
  }

  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    [MEMORY[0x189603F48] dataWithBytes:CFUUIDBytes length:16];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v14 forKey:@"BinaryInfoDwarfUUIDKey"];
  }

  uint64_t Architecture = CSSymbolOwnerGetArchitecture();
  uint64_t v16 = macho_arch_name_for_cpu_type(Architecture, SHIDWORD(Architecture));
  if (v16)
  {
    [NSString stringWithUTF8String:v16];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v17 forKey:@"BinaryInfoArchitectureKey"];
  }

  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  uint64_t v21 = MEMORY[0x1895F87A8];
  CSSymbolOwnerForeachSection();
  if (v27[3] || v23[3])
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v21, 3221225472, __40__VMUProcessDescription__libraryLoaded___block_invoke, &unk_189DFDC78, &v26, &v22];
    CFStringRef v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v18 forKey:@"StartAddress"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v23[3] - v27[3] + 1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v19 forKey:@"Size"];
  }

  int v20 = self->_binaryImages;
  objc_sync_enter(v20);
  -[NSMutableArray addObject:](self->_binaryImages, "addObject:", v5);
  self->_binaryImagePostProcessingComplete = 0;
  objc_sync_exit(v20);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  objc_autoreleasePoolPop(v4);
}

unint64_t __40__VMUProcessDescription__libraryLoaded___block_invoke(uint64_t a1)
{
  uint64_t Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (unint64_t result = strcmp(Name, "MACH_HEADER"), !(_DWORD)result))
  {
    unint64_t result = CSRegionGetRange();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(void *)(v5 + 24) - 1LL >= result) {
      *(void *)(v5 + 24) = result;
    }
    unint64_t v6 = v4 + result - 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v6 > *(void *)(v7 + 24)) {
      *(void *)(v7 + 24) = v6;
    }
  }

  return result;
}

- (id)date
{
  return self->_date;
}

- (unsigned)task
{
  return -[VMUTaskMemoryCache taskPort](self->_memoryCache, "taskPort");
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)is64Bit
{
  return self->_is64Bit;
}

- (BOOL)isTranslated
{
  return self->_taskIsTranslated;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (id)processName
{
  return self->_processName;
}

- (id)processIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[VMUProcessDescription processName](self, "processName");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)parentPid
{
  return self->_ppid;
}

- (id)parentProcessName
{
  return self->_parentProcessName;
}

- (id)parentProcessPath
{
  return self->_parentExecutablePath;
}

- (id)processVersionDictionary
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  p_lsApplicationInformation = &self->_lsApplicationInformation;
  -[NSDictionary objectForKey:](self->_lsApplicationInformation, "objectForKey:", @"CFBundleShortVersionString");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](*p_lsApplicationInformation, "objectForKey:", *MEMORY[0x189604E18]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v19 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    -[VMUProcessDescription binaryImages](self, "binaryImages");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      __int16 v17 = @"ShortVersionString";
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          -[VMUProcessDescription processIdentifier](self, "processIdentifier", v17);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 objectForKey:@"Identifier"];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            if (!v4)
            {
              [v9 objectForKey:@"Version"];
              uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
            }

            if (!v19)
            {
              [v9 objectForKey:v17];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }

        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v6);
    }
  }

  [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    [v19 description];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v14 forKey:@"shortVersion"];
  }

  if (v4)
  {
    [v4 description];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v15 forKey:@"version"];
  }

  return v13;
}

- (id)_sanitizeVersion:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:]( v3,  "stringByReplacingOccurrencesOfString:withString:",  @"("),  @"[";
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 stringByReplacingOccurrencesOfString:@"" withString:@"]"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v3 = v5;
    uint64_t v6 = v3;
  }

  else
  {
    uint64_t v6 = @"???";
  }

  return v6;
}

- (id)processVersion
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"version"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"shortVersion"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)NSString;
  if (v5)
  {
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%@ (%@)", v7, v8];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[VMUProcessDescription _sanitizeVersion:](self, "_sanitizeVersion:", v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%@", v7];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)executablePath
{
  return self->_executablePath;
}

- (id)bundleIdentifier
{
  return -[NSDictionary objectForKey:](self->_lsApplicationInformation, "objectForKey:", *MEMORY[0x189604E00]);
}

- (BOOL)isAppleApplication
{
  v2 = self;
  -[VMUProcessDescription bundleIdentifier](self, "bundleIdentifier");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 hasPrefix:@"com.apple."];

  -[VMUProcessDescription executablePath](v2, "executablePath");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = [v5 hasPrefix:@"/System/"];

  return v2 | v4;
}

- (id)_bundleLock
{
  if (-[VMUProcessDescription _bundleLock]::onceToken != -1) {
    dispatch_once(&-[VMUProcessDescription _bundleLock]::onceToken, &__block_literal_global_4);
  }
  return (id)-[VMUProcessDescription _bundleLock]::_bundleLock;
}

void __36__VMUProcessDescription__bundleLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1896079F8]);
  v1 = (void *)-[VMUProcessDescription _bundleLock]::_bundleLock;
  -[VMUProcessDescription _bundleLock]::_bundleLock = (uint64_t)v0;
}

- (id)binaryImages
{
  v2 = self;
  -[VMUProcessDescription setCrashReporterInfo](self, "setCrashReporterInfo");
  if (!v2->_binaryImagePostProcessingComplete)
  {
    -[VMUProcessDescription _bundleLock](v2, "_bundleLock");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 lock];

    char v4 = v2->_binaryImages;
    objc_sync_enter(v4);
    BOOL v5 = (void *)-[NSMutableArray mutableCopy](v2->_binaryImages, "mutableCopy");
    objc_sync_exit(v4);

    [v5 objectEnumerator];
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0LL;
    allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
    unint64_t v31 = v5;
    while (1)
    {
      [v32 nextObject:allocator];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        [v5 sortUsingFunction:_compareBinaryImageDicts context:0];
        v2->_binaryImagePostProcessingComplete = 1;
        objc_storeStrong((id *)&v2->_sortedBinaryImages, v5);
        -[VMUProcessDescription _bundleLock](v2, "_bundleLock");
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 unlock];

        goto LABEL_40;
      }

      [v7 objectForKey:@"ExecutablePath"];
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v9 = v2;
      -[NSDictionary objectForKey:](v2->_binaryImageHints, "objectForKey:", v8);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKey:@"ShortVersionString"];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11) {
        goto LABEL_5;
      }
      CFURLRef v14 = CFURLCreateWithFileSystemPath(allocator, v8, kCFURLPOSIXPathStyle, 1u);
      if (!v14) {
        break;
      }
      uint64_t v15 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
      uint64_t v16 = v15;
      if (v15)
      {
        [CFBundleGetValueForInfoDictionaryKey(v15, @"CFBundleShortVersionString") description];
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = (void *)[v17 copy];

        [CFBundleGetValueForInfoDictionaryKey(v16, @"CFBundleVersion") description];
        CFStringRef v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v12 = (id)[v18 copy];

        -[__CFString description]((id)CFBundleGetIdentifier(v16), "description");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = (void *)[v19 copy];

        CFRelease(v16);
      }

      else
      {
        uint64_t v11 = 0LL;
        id v12 = 0LL;
        int v13 = 0LL;
      }

      CFRelease(v14);
LABEL_12:
      [v7 objectForKey:@"SourceVersion"];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v21 = v20;
      if (!v12 && v20) {
        id v12 = v20;
      }
      if (v13
        || (-[__CFString lastPathComponent](v8, "lastPathComponent"),
            (int v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
      {
        [v7 setObject:v13 forKey:@"Identifier"];
      }

      if (v12) {
        [v7 setObject:v12 forKey:@"Version"];
      }
      if (v11) {
        [v7 setObject:v11 forKey:@"ShortVersionString"];
      }
      [v10 objectForKey:@"IsAppleCode"];
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        [v10 objectForKey:@"IsAppleCode"];
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v23 BOOLValue];
      }

      else
      {
        uint64_t v24 = ([v13 hasPrefix:@"com.apple."] & 1) != 0
           || ([v13 hasPrefix:@"commpage"] & 1) != 0
           || ([v13 isEqualToString:@"Ozone"] & 1) != 0
           || [v13 isEqualToString:@"Motion"];
        if ((-[__CFString hasPrefix:](v8, "hasPrefix:", @"/System") & 1) != 0
          || -[__CFString hasPrefix:](v8, "hasPrefix:", @"/usr/lib"))
        {
          uint64_t v24 = 1LL;
        }
      }

      [MEMORY[0x189607968] numberWithBool:v24];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v25 forKey:@"IsAppleCode"];

      [v10 objectForKey:@"DisplayName"];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26) {
        [v10 objectForKey:@"DisplayName"];
      }
      else {
        -[__CFString lastPathComponent](v8, "lastPathComponent");
      }
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27) {
        [v7 setObject:v27 forKey:@"DisplayName"];
      }

      uint64_t v6 = v7;
      BOOL v5 = v31;
      v2 = v9;
    }

    uint64_t v11 = 0LL;
LABEL_5:
    id v12 = 0LL;
    int v13 = 0LL;
    goto LABEL_12;
  }

- (id)binaryImageDictionaryForAddress:(unint64_t)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectEnumerator];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = 0LL;
  while (1)
  {
    [v5 nextObject];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7) {
      break;
    }
    [v7 objectForKey:@"StartAddress"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 unsignedLongLongValue];

    [v7 objectForKey:@"Size"];
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 unsignedLongLongValue];

    uint64_t v6 = v7;
    if (v9 <= a3)
    {
      uint64_t v6 = v7;
      if (v11 + v9 >= a3)
      {
        id v12 = v7;
        break;
      }
    }
  }

  return v7;
}

- (id)valueForEnvVar:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_taskIsCorpseOrCore && !self->_environment)
  {
    id v20 = v4;
    uint64_t v19 = (void *)MEMORY[0x186E32E40]();
    __int128 v21 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", self->_pid);
    -[VMUProcInfo envVars](v21, "envVars");
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v22 count])
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      environment = self->_environment;
      self->_environment = v6;

      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v8 = v22;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v13 = [v12 rangeOfString:@"="];
            if ([v12 length]) {
              BOOL v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              BOOL v14 = 1;
            }
            if (!v14)
            {
              [v12 substringToIndex:v13];
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v12 substringFromIndex:v13 + 1];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_environment,  "setObject:forKeyedSubscript:",  v16,  v15);
            }
          }

          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v9);
      }
    }

    BOOL v5 = v20;
    objc_autoreleasePoolPop(v19);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_environment, "objectForKeyedSubscript:", v5, v19);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_cpuTypeDescription
{
  uint64_t cpuType = self->_cpuType;
  if ((int)cpuType <= 16777222)
  {
    switch((_DWORD)cpuType)
    {
      case 7:
        return @"X86";
      case 0xC:
        return @"ARM";
      case 0x12:
        return @"PPC";
    }

    goto LABEL_18;
  }

  if ((int)cpuType > 16777233)
  {
    if ((_DWORD)cpuType == 33554444) {
      return @"ARM64_32";
    }
    if ((_DWORD)cpuType == 16777234) {
      return @"PPC-64";
    }
    goto LABEL_18;
  }

  if ((_DWORD)cpuType == 16777223) {
    return @"X86-64";
  }
  if ((_DWORD)cpuType != 16777228)
  {
LABEL_18:
    uint64_t v6 = [NSString stringWithFormat:@"%08X" cpuType];
    goto LABEL_24;
  }

  id v4 = @"ARM64";
  if ((CSIsNull() & 1) != 0) {
    return v4;
  }
  if (CSSymbolicatorGetArchitecture() == 0x20100000CLL)
  {
    id v4 = @"ARM64E";
  }

  else if (CSArchitectureIsX86_64())
  {
    id v4 = @"X86-64";
  }

  if (!self->_taskIsTranslated) {
    return v4;
  }
  uint64_t v6 = [objc_alloc(NSString) initWithFormat:@"%@ (translated)", v4];
LABEL_24:
  id v4 = (__CFString *)v6;
  return v4;
}

- (id)_binaryImagesDescriptionForRanges:(id)a3
{
  id v4 = a3;
  uint64_t v34 = self;
  self = (VMUProcessDescription *)((char *)self + 56);
  CSRelease();
  self->super.isa = 0LL;
  self->_memoryCache = 0LL;
  [MEMORY[0x189607940] string];
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](v34->_unreadableBinaryImagePaths, "count"))
  {
    [v33 appendString:@"Unreadable Binary Images:\n"];
    -[NSArray componentsJoinedByString:](v34->_unreadableBinaryImagePaths, "componentsJoinedByString:", @"\n");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 appendString:v5];
  }

  -[VMUProcessDescription binaryImages](v34, "binaryImages");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v33 appendString:@"Binary Images:\n"];
    -[VMUProcessDescription binaryImages](v34, "binaryImages");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectEnumerator];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = 0LL;
    id v31 = v4;
    unint64_t v32 = v9;
    while (1)
    {
      uint64_t v11 = v10;
      [v9 nextObject];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10) {
        break;
      }
      id v12 = (void *)MEMORY[0x186E32E40]();
      [v10 objectForKey:@"Identifier"];
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKey:@"ExecutablePath"];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKey:@"BinaryInfoDwarfUUIDKey"];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKey:@"Size"];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 unsignedLongLongValue];

      [v10 objectForKey:@"IsAppleCode"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 BOOLValue];

      [v10 objectForKey:@"StartAddress"];
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringRef v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 unsignedLongLongValue];
        if (!v4 || [v4 indexForLocation:v19] != 0x7FFFFFFFFFFFFFFFLL)
        {
          [MEMORY[0x189607940] string];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v37 length])
          {
            [v20 appendString:@"<"];
            id v21 = v37;
            uint64_t v22 = [v21 bytes];
            id v4 = v31;
            [v20 appendString:@"> "];
          }

          [v10 objectForKey:@"BinaryInfoArchitectureKey"];
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [NSString stringWithFormat:@"%@ ", v24];
          __int128 v26 = (void *)v25;
          uint64_t v27 = @"+";
          if (v16) {
            uint64_t v27 = @" ";
          }
          uint64_t v28 = v36;
          if (!v36) {
            uint64_t v28 = @"???";
          }
          if (v34->_is64Bit) {
            uint64_t v29 = @"%#18qx - %#18qx %@%@ %@%@ %@%@\n";
          }
          else {
            uint64_t v29 = @"%#10lx - %#10lx %@%@ %@%@ %@%@\n";
          }
          [v33 appendFormat:v29, v19, v14 + v19 - 1, v27, v28, v25, &stru_189E010C8, v20, v35];

          uint64_t v9 = v32;
        }
      }

      objc_autoreleasePoolPop(v12);
    }
  }

  else
  {
    [v33 appendString:@"Binary images description not available\n\n"];
  }

  return v33;
}

- (id)_rangesOfBinaryImages:(id)a3 forBacktraces:(id)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v33 = a3;
  id v5 = a4;
  if (!v5) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v32 = v5;
      goto LABEL_6;
    }

- (id)binaryImagesDescriptionForBacktraces:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x186E32E40]();
  -[VMUProcessDescription binaryImages](self, "binaryImages");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessDescription _rangesOfBinaryImages:forBacktraces:](self, "_rangesOfBinaryImages:forBacktraces:", v6, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMUProcessDescription _binaryImagesDescriptionForRanges:](self, "_binaryImagesDescriptionForRanges:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)binaryImagesDescription
{
  BOOL v3 = (void *)MEMORY[0x186E32E40](self, a2);
  -[VMUProcessDescription _binaryImagesDescriptionForRanges:](self, "_binaryImagesDescriptionForRanges:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)_buildVersionDictionary
{
  return self->_buildVersionDictionary;
}

- (id)_buildInfoDescription
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"ProjectName"];
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:@"SourceVersion"];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[VMUProcessDescription _buildVersionDictionary](self, "_buildVersionDictionary");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKey:@"BuildVersion"];
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = @"Unknown";
    if (v5) {
      uint64_t v11 = v5;
    }
    else {
      uint64_t v11 = @"Unknown";
    }
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = @"Unknown";
    }
    if (v9) {
      uint64_t v10 = v9;
    }
    [NSString stringWithFormat:@"%@-%@~%@", v11, v12, v10];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)_osVersionDictionary
{
  osVersionDictionary = self->_osVersionDictionary;
  if (!osVersionDictionary)
  {
    -[VMUProcessDescription _bundleLock](self, "_bundleLock");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 lock];

    _CRGetOSVersionDictionary();
    id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_osVersionDictionary;
    self->_osVersionDictionary = v5;

    -[VMUProcessDescription _bundleLock](self, "_bundleLock");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 unlock];

    osVersionDictionary = self->_osVersionDictionary;
  }

  return osVersionDictionary;
}

- (id)_systemVersionDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:*MEMORY[0x189604B78]];
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:*MEMORY[0x189604B68]];
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:*MEMORY[0x189604B60]];
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = @"???";
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = @"???";
  }
  if (v3) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = @"???";
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  [NSString stringWithFormat:@"%@ %@ (%@)", v7, v8, v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)processDescriptionHeader
{
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 appendFormat:@"Hardware Model:  %@\n", self->_hardwareModel];
  -[VMUProcessDescription _buildInfoDescription](self, "_buildInfoDescription");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = v3;
  -[VMUProcessDescription processName](self, "processName");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v27 length];
  if (v4)
  {
    -[VMUProcessDescription processName](self, "processName");
    id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v33 = @"???";
  }

  uint64_t pid = self->_pid;
  uint64_t v26 = v4;
  if ((_DWORD)pid)
  {
    [NSString stringWithFormat:@"%d", pid];
    unint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v32 = @"Unknown";
  }

  int v25 = pid;
  -[VMUProcessDescription executablePath](self, "executablePath");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v24 length];
  if (v6)
  {
    -[VMUProcessDescription executablePath](self, "executablePath");
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v31 = @"???";
  }

  unint64_t executableLoadAddress = self->_executableLoadAddress;
  uint64_t v23 = v6;
  -[VMUProcessDescription processIdentifier](self, "processIdentifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v22 length];
  if (v7)
  {
    -[VMUProcessDescription processIdentifier](self, "processIdentifier");
    uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v30 = @"???";
  }

  uint64_t v21 = v7;
  -[VMUProcessDescription processVersion](self, "processVersion");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v3 length];
  if (v8)
  {
    [NSString stringWithFormat:@"Build Info:      %@\n", v3];
    uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v29 = &stru_189E010C8;
  }

  -[VMUProcessDescription _cpuTypeDescription](self, "_cpuTypeDescription");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int platform = self->_platform;
  if (platform)
  {
    uint64_t v11 = (void *)NSString;
    VMUPlatformNameForPlatform(self->_platform);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringWithFormat:@"Platform:        %@\n", v19];
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = &stru_189E010C8;
  }

  -[VMUProcessDescription parentProcessName](self, "parentProcessName");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 length];
  if (v14)
  {
    -[VMUProcessDescription parentProcessName](self, "parentProcessName");
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v15 = @"???";
  }

  int ppid = self->_ppid;
  if (ppid)
  {
    [NSString stringWithFormat:@"%d", self->_ppid];
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v17 = @"Unknown";
  }

  [v35 appendFormat:@"Process:         %@ [%@]\nPath:            %@\nLoad Address:    %#qx\nIdentifier:      %@\nVersion:         %@\n%@Code Type:       %@\n%@Parent Process:  %@ [%@]\n", v33, v32, v31, executableLoadAddress, v30, v34, v29, v9, v12, v15, v17];
  if (ppid) {

  }
  if (v14) {
  if (platform)
  }
  {
  }

  if (v8) {
  if (v21)
  }

  if (v23) {
  if (v25)
  }

  if (v26) {
  return v35;
  }
}

- (id)dateAndVersionDescription
{
  BOOL v3 = (void *)objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS ZZZ"];
  [v3 stringFromDate:self->_date];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)self->_proc_starttime.tv_usec / 1000000.0 + (double)self->_proc_starttime.tv_sec];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = (void *)NSString;
  -[VMUProcessDescription _systemVersionDescription](self, "_systemVersionDescription");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"Date/Time:       %@\nLaunch Time:     %@\nOS Version:      %@\nReport Version:  %d\n", v4, v6, v8, 104];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)processStatisticsDescription
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (self->_taskIsCorpseOrCore)
  {
    physicalFootprint = (void *)self->_physicalFootprint;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    *(_OWORD *)buffer = 0u;
    if (proc_pid_rusage(self->_pid, 6, buffer)) {
      goto LABEL_13;
    }
    physicalFootprint = (void *)*((void *)&v16 + 1);
    unint64_t v11 = v27;
    self->_physicalFootprint = *((void *)&v16 + 1);
    self->_physicalFootprintPeak = v11;
  }

  if (!self->_physicalFootprintPeak)
  {
LABEL_13:
    physicalFootprint = 0LL;
    return physicalFootprint;
  }

  unsigned int idleExitStatus = self->_idleExitStatus;
  id v5 = "untracked";
  uint64_t v6 = "clean";
  if (idleExitStatus == 3) {
    uint64_t v6 = "dirty";
  }
  if (idleExitStatus != 1) {
    id v5 = v6;
  }
  if (idleExitStatus) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = "unknown";
  }
  uint64_t v8 = (void *)NSString;
  uint64_t v9 = VMUMemorySizeString(physicalFootprint);
  [v8 stringWithFormat:@"Physical footprint:         %s\nPhysical footprint (peak):  %s\nIdle exit:                  %s\n",  v9,  VMUMemorySizeString(self->_physicalFootprintPeak),  v7];
  physicalFootprint = (void *)objc_claimAutoreleasedReturnValue();
  return physicalFootprint;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)MEMORY[0x186E32E40]();
  -[VMUProcessDescription processDescriptionHeader](self, "processDescriptionHeader");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v5];

  [v3 appendString:@"\n"];
  -[VMUProcessDescription dateAndVersionDescription](self, "dateAndVersionDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v6];

  -[VMUProcessDescription processStatisticsDescription](self, "processStatisticsDescription");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 length])
  {
    [v3 appendString:@"\n"];
    [v3 appendString:v7];
  }

  [v3 appendString:@"----\n"];
  [v3 appendString:@"\n"];

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)dealloc
{
  self->_symbolicator._opaque_1 = 0LL;
  self->_symbolicator._opaque_2 = 0LL;
  BOOL v3 = self->_binaryImages;
  objc_sync_enter(v3);
  binaryImages = self->_binaryImages;
  self->_binaryImages = 0LL;

  objc_sync_exit(v3);
  -[VMUProcessDescription clearCrashReporterInfo](self, "clearCrashReporterInfo");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VMUProcessDescription;
  -[VMUProcessDescription dealloc](&v5, sel_dealloc);
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (void).cxx_destruct
{
}

@end