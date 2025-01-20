@interface SATask
+ (double)taskWithoutReferencesFromPAStyleSerializedTask:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)taskWithPid:(uint64_t)a3 uniquePid:(uint64_t)a4 name:(void *)a5 mainBinaryPath:(uint64_t)a6 pidStartTime:(uint64_t)a7 loadInfos:(int)a8 numLoadInfos:(uint64_t)a9 textExecLoadInfos:(int)a10 numTextExecLoadInfos:(uint64_t)a11 architecture:(void *)a12 sharedCache:;
+ (id)taskWithPid:(uint64_t)a3 uniquePid:(void *)a4 name:(void *)a5 sharedCache:;
- (BOOL)addImageInfos:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)allowsIdleExit;
- (BOOL)isBeta;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTranslocated;
- (BOOL)isUnresponsive;
- (BOOL)usesSuddenTermination;
- (NSArray)binaryLoadInfos;
- (NSArray)taskStates;
- (NSDictionary)dispatchQueues;
- (NSDictionary)swiftTasks;
- (NSDictionary)threads;
- (NSString)appType;
- (NSString)bundleBuildVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleName;
- (NSString)bundleProductBuildVersion;
- (NSString)bundleProjectName;
- (NSString)bundleShortVersion;
- (NSString)bundleSourceVersion;
- (NSString)bundleVersion;
- (NSString)codesigningID;
- (NSString)cohortID;
- (NSString)commerceAppID;
- (NSString)commerceExternalID;
- (NSString)debugDescription;
- (NSString)distributorID;
- (NSString)installerVersionID;
- (NSString)mainBinaryPath;
- (NSString)name;
- (NSString)resourceCoalitionName;
- (NSString)teamID;
- (NSString)vendorID;
- (SABinary)mainBinary;
- (SABinaryLoadInfo)mainBinaryLoadInfo;
- (SAFrame)truncatedUserStackFrameSwiftAsync:(SAFrame *)a1;
- (SASharedCache)sharedCache;
- (SATask)initWithPid:(int)a3 uniquePid:(unint64_t)a4 name:(const char *)a5 mainBinaryPath:(id)a6 pidStartTime:(unint64_t)a7 loadInfos:(const dyld_uuid_info_64 *)a8 numLoadInfos:(unsigned int)a9 textExecLoadInfos:(const dyld_uuid_info_64 *)a10 numTextExecLoadInfos:(unsigned int)a11 architecture:(_CSArchitecture)a12 sharedCache:(id)a13;
- (SATask)initWithPid:(int)pid andUniquePid:(unint64_t)a4 andName:(id)a5 sharedCache:(id)a6;
- (SAThread)mainThread;
- (SATimestamp)execTimestamp;
- (SATimestamp)exitTimestamp;
- (char)developerType;
- (double)timeOfLastResponse;
- (id)architectureString;
- (id)endTimestamp;
- (id)firstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)firstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)lastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)lastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)leafFrameAfterAddingStack:(void *)a3 leafOfCRootFramesReplacedBySwiftAsync:;
- (id)removeStacksOutsideThisProcess;
- (id)startTimestamp;
- (int)pid;
- (int)ppid;
- (int)rpid;
- (uint64_t)_matchesNameStr:(uint64_t)a1;
- (uint64_t)correspondsToName:(void *)a3 loadInfos:(int)a4 numLoadInfos:(uint64_t)a5 architecture:(void *)a6 sharedCache:;
- (uint64_t)correspondsToName:(void *)a3 mainBinaryLoadInfo:(uint64_t)a4 architecture:(void *)a5 sharedCache:;
- (uint64_t)correspondsToPid:(void *)a3 name:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:;
- (uint64_t)correspondsToUniquePid:(void *)a3 name:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:;
- (uint64_t)gatherLoadInfoFromLiveProcessWithDataGatheringOptions:(int)a3 additionalCSSymbolicatorFlags:;
- (uint64_t)isFromCurrentBootCycle;
- (unint64_t)adamID;
- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)resourceCoalitionID;
- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)uniquePid;
- (unsigned)uid;
- (void)_gatherDataFromLiveProcessIsLate:(void *)a3 mainBinaryPath:;
- (void)_incorporateNewKernelLoadInfos:(unsigned int)a3 numLoadInfos:(os_log_s *)a4 textExecLoadInfos:(unsigned int)a5 numTextExecLoadInfos:;
- (void)addDispatchQueue:(uint64_t)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)addSwiftTask:(uint64_t)a1;
- (void)addThread:(uint64_t)a1;
- (void)cpuTimeNs:(unint64_t *)a3 cpuInstructions:(unint64_t *)a4 cpuCycles:(unint64_t *)a5 betweenStartTime:(id)a6 endTime:(id)a7;
- (void)cpuTimeNs:(void *)a3 cpuInstructions:(void *)a4 cpuCycles:(void *)a5 nonThreadCpuTimeNs:(void *)a6 nonThreadCpuInstructions:(void *)a7 nonThreadCpuCycles:(void *)a8 betweenStartTime:(void *)a9 endTime:;
- (void)dealloc;
- (void)enumerateFrames:(uint64_t)a1;
- (void)enumerateTaskStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7;
- (void)enumerateTaskStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8;
- (void)enumerateThreadStatesForThread:(void *)a3 dispatchQueue:(void *)a4 betweenStartTime:(unint64_t)a5 startSampleIndex:(void *)a6 endTime:(unint64_t)a7 endSampleIndex:(uint64_t)a8 reverseOrder:(void *)a9 block:;
- (void)fixupFrameInstructionsWithDataGatheringOptions:(int)a3 mightBeAlive:(_BYTE *)a4 foundNewBinaryInfo:(void *)a5 uuidsWithNewInstructions:(int)a6 additionalCSSymbolicatorFlags:;
- (void)fixupThreadSuspension;
- (void)guessArchitectureGivenMachineArchitecture:(uint64_t)a3 dataSource:;
- (void)isAliveAtTimestamp:(void *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedTask:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)postprocessWithDataGatheringOptions:(int)a3 mightBeAlive:(void *)a4 machineArchitecture:(uint64_t)a5 dataSource:(uint64_t)a6 spindumpArchitecture:(void *)a7 spindumpSharedCache:(int)a8 additionalCSSymbolicatorFlags:;
- (void)setMainBinaryPath:(id)a3;
- (void)setName:(uint64_t)a1;
@end

@implementation SATask

- (NSString)bundleVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundleVersion];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleShortVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundleShortVersion];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundleIdentifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)codesigningID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 codesigningID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)teamID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 teamID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addThread:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    v3 = (void *)MEMORY[0x189607968];
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadId"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }

- (void)addDispatchQueue:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    v3 = (void *)MEMORY[0x189607968];
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }

- (void)addSwiftTask:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)MEMORY[0x189607968];
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }

- (void)guessArchitectureGivenMachineArchitecture:(uint64_t)a3 dataSource:
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (*(void *)(a1 + 288))
  {
    int v37 = *__error();
    _sa_logt();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(id)a1 debugDescription];
      *(_DWORD *)buf = 136315906;
      uint64_t v75 = [v39 UTF8String];
      __int16 v76 = 2080;
      uint64_t FamilyName = CSArchitectureGetFamilyName();
      __int16 v78 = 2080;
      uint64_t v79 = CSArchitectureGetFamilyName();
      __int16 v80 = 2048;
      uint64_t v81 = a3;
      _os_log_error_impl( &dword_186C92000,  v38,  OS_LOG_TYPE_ERROR,  "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)",  buf,  0x2Au);
    }

    *__error() = v37;
    id v40 = [(id)a1 debugDescription];
    v32 = (void *)[v40 UTF8String];
    CSArchitectureGetFamilyName();
    CSArchitectureGetFamilyName();
    _SASetCrashLogMessage( 92,  "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)",  v41,  v42,  v43,  v44,  v45,  v46,  (char)v32);

    _os_crash();
    __break(1u);
    goto LABEL_68;
  }

  unint64_t Family = CSArchitectureGetFamily();
  unsigned int v7 = Family;
  unint64_t v8 = HIDWORD(Family);
  if ((a3 & 5) != 0)
  {
    [*(id *)(a1 + 8) lastObject];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v58 = v9;
      if ((a3 & 1) == 0 && !*(_DWORD *)(a1 + 76) || (char v11 = [v9 ssFlags], v10 = v58, (v11 & 1) == 0))
      {
        if ((a3 & 4) == 0 || *(_DWORD *)(a1 + 76) || (char v12 = [v10 ssFlags], v10 = v58, (v12 & 2) == 0)) {
          v7 &= ~0x1000000u;
        }
      }

      *(_DWORD *)(a1 + 288) = v7;
      *(_DWORD *)(a1 + 292) = v8;

      return;
    }
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v13 = *(id *)(a1 + 248);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v68;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v68 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if ([v18 loadAddress])
        {
          v7 &= ~0x1000000u;
LABEL_31:
          *(_DWORD *)(a1 + 288) = v7;
LABEL_32:
          *(_DWORD *)(a1 + 292) = v8;
LABEL_33:

          return;
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }

    while (v15);
  }

  v19 = *(void **)(a1 + 256);
  if (v19 && [v19 startAddress] != -1)
  {
    if ([*(id *)(a1 + 256) startAddress])
    {
      *(_DWORD *)(a1 + 288) = v7 & 0xFEFFFFFF;
      goto LABEL_5;
    }
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v13 = *(id *)(a1 + 280);
  uint64_t v20 = [v13 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (!v20) {
    goto LABEL_48;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v64;
  do
  {
    uint64_t v23 = 0LL;
    do
    {
      if (*(void *)v64 != v22) {
        objc_enumerationMutation(v13);
      }
      uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * v23);
      if (v24)
      {
        a2 = *(id *)(v24 + 40);
        if (!a2) {
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v25 = a2;
LABEL_58:
          v32 = v25;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            unint64_t v33 = [v32 address];
            unsigned int v34 = v7 & 0xFEFFFFFF;
            if (HIDWORD(v33)) {
              unsigned int v34 = v7;
            }
            *(_DWORD *)(a1 + 288) = v34;
            *(_DWORD *)(a1 + 292) = v8;

            goto LABEL_33;
          }

- (SABinaryLoadInfo)mainBinaryLoadInfo
{
  binaryLoadInfos = self->_binaryLoadInfos;
  if (!binaryLoadInfos || !-[NSArray count](binaryLoadInfos, "count")) {
    goto LABEL_10;
  }
  if ((CSArchitectureIs32Bit() & 1) != 0 || self->_pid)
  {
    -[NSArray firstObject](self->_binaryLoadInfos, "firstObject");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[NSArray lastObject](self->_binaryLoadInfos, "lastObject");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v5 = v4;
  if (self->_mainBinary)
  {
    [v4 binary];
    v6 = (SABinary *)objc_claimAutoreleasedReturnValue();
    mainBinary = self->_mainBinary;

    if (v6 != mainBinary)
    {

LABEL_10:
      id v5 = 0LL;
    }
  }

  return (SABinaryLoadInfo *)v5;
}

- (NSString)mainBinaryPath
{
  mainBinaryPath = self->_mainBinaryPath;
  if (mainBinaryPath)
  {
    v3 = mainBinaryPath;
  }

  else
  {
    -[SATask mainBinary](self, "mainBinary");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 path];
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setMainBinaryPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    mainBinaryPath = self->_mainBinaryPath;
    self->_mainBinaryPath = 0LL;

    goto LABEL_17;
  }

  -[SATask mainBinary](self, "mainBinary");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    char v19 = 0;
    [v5 path];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = SAFilepathMatches(v7, v4, &v19);

    if (v8)
    {
      if (v19) {
        objc_setProperty_atomic_copy(v6, v9, v4, 80LL);
      }
      v10 = self->_mainBinaryPath;
      self->_mainBinaryPath = 0LL;
      goto LABEL_12;
    }

    int v12 = *__error();
    _sa_logt();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = -[SATask debugDescription](self, "debugDescription");
      [v6 path];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v18;
      _os_log_debug_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_DEBUG,  "%@: Setting mainBinaryPath to %@ when its already %@",  buf,  0x20u);
    }

    *__error() = v12;
  }

  SACachedNSString(v4);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_mainBinaryPath;
  self->_mainBinaryPath = v14;
LABEL_12:

  if (self->_name)
  {
    Path = -[NSString copyLastPathComponent](v4);
    if ([Path hasPrefix:self->_name])
    {
      name = self->_name;
      self->_name = 0LL;
    }
  }

LABEL_17:
}

- (SABinary)mainBinary
{
  mainBinary = self->_mainBinary;
  if (mainBinary)
  {
    v3 = mainBinary;
  }

  else
  {
    -[SATask mainBinaryLoadInfo](self, "mainBinaryLoadInfo");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 binary];
    v3 = (SABinary *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSString)name
{
  name = self->_name;
  if (name)
  {
    Path = name;
  }

  else
  {
    -[SATask mainBinaryPath](self, "mainBinaryPath");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    Path = (NSString *)-[NSString copyLastPathComponent](v4);
  }

  return Path;
}

- (void)setName:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3 && ![v3 length])
    {
      int v7 = *__error();
      _sa_logt();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        [(id)a1 debugDescription];
        id v9 = v10 = v7;
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = [v9 UTF8String];
        _os_log_fault_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_FAULT,  "%s: applying emptry string for task name",  buf,  0xCu);

        int v7 = v10;
      }

      *__error() = v7;
      id v4 = 0LL;
    }

    if (!*(_DWORD *)(a1 + 76) || ([v4 isEqualToString:@"kernel_task"] & 1) == 0)
    {
      uint64_t v5 = [v4 copy];
      v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;
    }
  }
}

- (id)architectureString
{
  architecture = (void *)self->_architecture;
  if (architecture)
  {
    architecture = (void *)CSArchitectureGetFamilyName();
    if (architecture)
    {
      SANSStringForCString(architecture);
      architecture = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return architecture;
}

- (SATask)initWithPid:(int)pid andUniquePid:(unint64_t)a4 andName:(id)a5 sharedCache:(id)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SATask;
  uint64_t v12 = -[SATask init](&v32, sel_init);
  uint64_t v13 = (SATask *)v12;
  if (v12)
  {
    double v14 = NAN;
    else {
      int v15 = -1;
    }
    *(void *)(v12 + 84) = 0xFFFFFEC6FFFFFFFFLL;
    *((_DWORD *)v12 + 19) = pid;
    *((_DWORD *)v12 + 20) = v15;
    *((void *)v12 + 12) = a4;
    if (v10)
    {
      if (!objc_msgSend(v10, "length", NAN))
      {
        int v27 = *__error();
        _sa_logt();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          -[SATask debugDescription](v13, "debugDescription");
          id v29 = v31 = v27;
          uint64_t v30 = [v29 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v34 = v30;
          _os_log_fault_impl( &dword_186C92000,  v28,  OS_LOG_TYPE_FAULT,  "%s: applying empty string for task name",  buf,  0xCu);

          int v27 = v31;
        }

        *__error() = v27;
        id v10 = 0LL;
      }

      pid = v13->_pid;
    }

    if (!pid || (objc_msgSend(v10, "isEqualToString:", @"kernel_task", v14) & 1) == 0)
    {
      uint64_t v16 = objc_msgSend(v10, "copy", v14);
      name = v13->_name;
      v13->_name = (NSString *)v16;
    }

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    dispatchQueues = v13->_dispatchQueues;
    v13->_dispatchQueues = v18;

    uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    swiftTasks = v13->_swiftTasks;
    v13->_swiftTasks = v20;

    __int16 v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    threads = v13->_threads;
    v13->_threads = v22;

    __int16 v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    taskStates = v13->_taskStates;
    v13->_taskStates = v24;

    objc_storeStrong((id *)&v13->_sharedCache, a6);
  }

  return v13;
}

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(void *)a4 name:(void *)a5 sharedCache:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)objc_opt_self()) initWithPid:a2 andUniquePid:a3 andName:v9 sharedCache:v8];

  return v10;
}

- (SATask)initWithPid:(int)a3 uniquePid:(unint64_t)a4 name:(const char *)a5 mainBinaryPath:(id)a6 pidStartTime:(unint64_t)a7 loadInfos:(const dyld_uuid_info_64 *)a8 numLoadInfos:(unsigned int)a9 textExecLoadInfos:(const dyld_uuid_info_64 *)a10 numTextExecLoadInfos:(unsigned int)a11 architecture:(_CSArchitecture)a12 sharedCache:(id)a13
{
  uint64_t v17 = *(void *)&a3;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v19 = a6;
  id v20 = a13;
  if (a5)
  {
    if (*a5)
    {
      SANSStringForCString((void *)a5);
      a5 = (const char *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      a5 = 0LL;
    }
  }

  uint64_t v21 = -[SATask initWithPid:andUniquePid:andName:sharedCache:]( self,  "initWithPid:andUniquePid:andName:sharedCache:",  v17,  a4,  a5,  v20);
  if (v21)
  {
    if (a7)
    {
      uint64_t v22 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  (double)a7 - *MEMORY[0x189604DA8]);
      pidStartTimestamp = v21->_pidStartTimestamp;
      v21->_pidStartTimestamp = (SATimestamp *)v22;
    }

    v21->_architecture = a12;
    if (!(_DWORD)v17)
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:]( (uint64_t)v21,  (os_log_s *)a8,  a9,  (os_log_s *)a10,  a11);
      goto LABEL_14;
    }

    if (a10 || a11)
    {
      int v27 = *__error();
      _sa_logt();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        id v38 = -[SATask debugDescription](v21, "debugDescription");
        uint64_t v36 = [v38 UTF8String];
        if (a10)
        {
          uint64_t imageLoadAddress = a10->imageLoadAddress;
          do
          {
            unsigned int v30 = __ldxr(&uuid_string_index);
            unsigned int v31 = v30 + 1;
          }

          while (__stxr(v31, &uuid_string_index));
          BOOL v32 = (-v31 & 0x80000000) != 0;
          int v33 = -v31 & 3;
          int v34 = v31 & 3;
          if (v32) {
            int v35 = v34;
          }
          else {
            int v35 = -v33;
          }
          id v29 = &uuid_string_string[37 * v35];
          uuid_unparse(a10->imageUUID, v29);
        }

        else
        {
          uint64_t imageLoadAddress = 0LL;
          id v29 = "null";
        }

        *(_DWORD *)buf = 136315906;
        uint64_t v40 = v36;
        __int16 v41 = 1024;
        unsigned int v42 = a11;
        __int16 v43 = 2048;
        uint64_t v44 = imageLoadAddress;
        __int16 v45 = 2080;
        uint64_t v46 = v29;
        _os_log_fault_impl( &dword_186C92000,  v28,  OS_LOG_TYPE_FAULT,  "%s has text-exec %u load infos (first is 0x%llx %s)",  buf,  0x26u);
      }

      *__error() = v27;
      if (a9) {
        goto LABEL_12;
      }
    }

    else if (a9)
    {
LABEL_12:
      uint64_t v24 = _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)a8, a9, v19, 0LL, 0, 0);
      binaryLoadInfos = v21->_binaryLoadInfos;
      v21->_binaryLoadInfos = (NSArray *)v24;

      v21->_assumeBinaryLoadInfosContainsMainBinary = 1;
    }
  }

- (void)_incorporateNewKernelLoadInfos:(unsigned int)a3 numLoadInfos:(os_log_s *)a4 textExecLoadInfos:(unsigned int)a5 numTextExecLoadInfos:
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  id v8 = a2;
  if (!a2 && a3)
  {
    int v21 = *__error();
    _sa_logt();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v43 = a3;
      _os_log_error_impl(&dword_186C92000, v22, OS_LOG_TYPE_ERROR, "%u load infos, but null", buf, 8u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1332, "%u load infos, but null", v23, v24, v25, v26, v27, v28, a3);
    _os_crash();
    __break(1u);
LABEL_28:
    int v29 = *__error();
    _sa_logt();
    unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v43 = a5;
      _os_log_error_impl(&dword_186C92000, v30, OS_LOG_TYPE_ERROR, "%u text exec load infos, but null", buf, 8u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(1333, "%u text exec load infos, but null", v31, v32, v33, v34, v35, v36, a5);
    _os_crash();
    __break(1u);
  }

  if (!a4 && a5) {
    goto LABEL_28;
  }
  if ([*(id *)(a1 + 248) count] < (unint64_t)(a5 + a3))
  {
    _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)v8, a3, 0LL, a4, a5, 1);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (!*(void *)(a1 + 48))
    {
      if (a3 || (id v8 = a4, a5)) {
        uint64_t v12 = *(void *)v8;
      }
      else {
        uint64_t v12 = 0LL;
      }
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ([v18 loadAddress] == v12)
            {
              uint64_t v19 = [v18 binary];
              id v20 = *(void **)(a1 + 48);
              *(void *)(a1 + 48) = v19;

              goto LABEL_21;
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(uint64_t)a4 name:(void *)a5 mainBinaryPath:(uint64_t)a6 pidStartTime:(uint64_t)a7 loadInfos:(int)a8 numLoadInfos:(uint64_t)a9 textExecLoadInfos:(int)a10 numTextExecLoadInfos:(uint64_t)a11 architecture:(void *)a12 sharedCache:
{
  id v17 = a12;
  id v18 = a5;
  LODWORD(v22) = a10;
  LODWORD(v21) = a8;
  uint64_t v19 = (void *)[objc_alloc((Class)objc_opt_self()) initWithPid:a2 uniquePid:a3 name:a4 mainBinaryPath:v18 pidStartTime:a6 loadInfos:a7 numLoadInfos:v21 textExecLoadInfos:a9 numTex tExecLoadInfos:v22 architecture:a11 sharedCache:v17];

  return v19;
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if (-[NSMutableArray count](self->_taskStates, "count"))
  {
    if (v6)
    {
      taskStates = self->_taskStates;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_189F64688;
      id v15 = v6;
      unint64_t v8 = SABinarySearchArray(taskStates, 1280, (uint64_t)v14);
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < -[NSMutableArray count](self->_taskStates, "count"))
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }

        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v8);
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v12 = [v11 endSampleIndex];

          if (v12 >= a4) {
            break;
          }
        }

        ++v8;
      }

      while (v8 < -[NSMutableArray count](self->_taskStates, "count"));
    }

    if (v8 >= -[NSMutableArray count](self->_taskStates, "count")) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
  }

  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 startTimestamp];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v5];

  if ((v4 & 1) != 0)
  {
    uint64_t v6 = -1LL;
  }

  else
  {
    int v7 = *(void **)(a1 + 32);
    [v3 endTimestamp];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if (!-[NSMutableArray count](self->_taskStates, "count")) {
    goto LABEL_4;
  }
  taskStates = self->_taskStates;
  if (v6)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_189F64688;
    id v15 = v6;
    uint64_t v8 = SABinarySearchArray(taskStates, 1536, (uint64_t)v14);

    if (!v8) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v8 = -[NSMutableArray count](self->_taskStates, "count");
  }

  unint64_t v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }

    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v9);
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v13 = [v12 startSampleIndex];

      if (v13 <= a4) {
        goto LABEL_7;
      }
    }

    if (!v9) {
      break;
    }
    --v9;
  }

uint64_t __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 startTimestamp];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v4 lt:v5];

  if ((v4 & 1) != 0)
  {
    uint64_t v6 = -1LL;
  }

  else
  {
    int v7 = *(void **)(a1 + 32);
    [v3 endTimestamp];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return -[SATask firstTaskStateOnOrAfterTime:sampleIndex:](self, "firstTaskStateOnOrAfterTime:sampleIndex:", a3, v4);
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:",  a3,  v4);
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5 = -[SATask indexOfLastTaskStateOnOrBeforeTime:withSampleIndex:]( self,  "indexOfLastTaskStateOnOrBeforeTime:withSampleIndex:",  a3,  a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_taskStates, "objectAtIndexedSubscript:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[NSMutableArray lastObject](self->_taskStates, "lastObject");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (v10 = 0x7FFFFFFFFFFFFFFFLL, uint64_t v9 = [v7 endSampleIndex], v9 != 0x7FFFFFFFFFFFFFFFLL)) {
      unint64_t v10 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:",  v6,  v9);
    }
  }

  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  unint64_t v16 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:",  a3,  a4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = v16;
    unint64_t v18 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:",  v14,  a6);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_189F632C0;
        v22[4] = self;
        id v23 = v15;
        id v20 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17) {
              break;
            }
            char v21 = v20[2](v20, v19--);
          }

          while ((v21 & 1) == 0);
        }

        else
        {
          do
          {
            if ((v20[2](v20, v17) & 1) != 0) {
              break;
            }
            ++v17;
          }

          while (v17 <= v19);
        }
      }
    }
  }
}

uint64_t __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke( uint64_t a1,  uint64_t a2)
{
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_189F646B0;
  BOOL v16 = a6;
  id v15 = v12;
  id v13 = v12;
  -[SATask enumerateTaskStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]( self,  "enumerateTaskStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:",  a3,  0x7FFFFFFFFFFFFFFFLL,  a4,  0x7FFFFFFFFFFFFFFFLL,  v8,  v14);
}

void __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (uint64_t v4 = [v3 startSampleIndex], v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    unint64_t v5 = v6;
  }
}

- (void)enumerateThreadStatesForThread:(void *)a3 dispatchQueue:(void *)a4 betweenStartTime:(unint64_t)a5 startSampleIndex:(void *)a6 endTime:(unint64_t)a7 endSampleIndex:(uint64_t)a8 reverseOrder:(void *)a9 block:
{
  unint64_t v16 = a2;
  uint64_t v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a9;
  char v21 = v20;
  if (!a1)
  {
LABEL_7:

    return;
  }

  if (v16 | v17)
  {
    if (v16)
    {
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
      v33[3] = &unk_189F646D8;
      uint64_t v22 = &v34;
      id v34 = (id)v17;
      id v36 = v21;
      id v35 = (id)v16;
      [v35 enumerateThreadStatesBetweenStartTime:v18 startSampleIndex:a5 endTime:v19 endSampleIndex:a7 reverseOrder:a8 block:v33];
    }

    else
    {
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2;
      v31[3] = &unk_189F64488;
      uint64_t v22 = &v32;
      id v32 = v20;
      -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]( v17,  v18,  a5,  v19,  a7,  a8,  v31);
    }

    goto LABEL_7;
  }

  int v23 = *__error();
  _sa_logt();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_186C92000, v24, OS_LOG_TYPE_ERROR, "No thread nor dispatch queue", buf, 2u);
  }

  *__error() = v23;
  _SASetCrashLogMessage(518, "No thread nor dispatch queue", v25, v26, v27, v28, v29, v30, v31[0]);
  _os_crash();
  __break(1u);
}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!*(void *)(a1 + 32)
    || ([v3 dispatchQueue],
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = *(void **)(a1 + 32),
        v4,
        id v6 = v7,
        v4 == v5))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v6 = v7;
  }
}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 thread];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 threadState];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 threadStateIndex];

  (*(void (**)(uint64_t, id, void *, uint64_t, uint64_t))(v4 + 16))(v4, v8, v6, v7, a3);
}

- (uint64_t)gatherLoadInfoFromLiveProcessWithDataGatheringOptions:(int)a3 additionalCSSymbolicatorFlags:
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  if ((a2 & 2) != 0 && !*(_BYTE *)(a1 + 64))
  {
    if ((a2 & 0x400) == 0 && *(_DWORD *)(a1 + 76)) {
      return 0LL;
    }
    uint64_t v7 = (id *)(id)a1;
    objc_sync_enter(v7);
    if (*(_BYTE *)(a1 + 64))
    {
      uint64_t v4 = 0LL;
LABEL_39:
      objc_sync_exit(v7);

      return v4;
    }

    *(_BYTE *)(a1 + 64) = 1;
    id v54 = 0LL;
    uint64_t v55 = 0LL;
    uint64_t v8 = *((unsigned int *)v7 + 19);
    id v52 = 0LL;
    id v53 = 0LL;
    id v51 = 0LL;
    CopyLoadInfosForLiveProcess(v8, a2, &v54, &v53, &v52, &v51, (uint64_t *)&v55, a3);
    id v9 = v54;
    id v10 = v54;
    id v50 = v53;
    id v11 = v52;
    id v12 = v52;
    id v13 = v51;
    id v14 = v51;
    id v15 = v14;
    if (!v10)
    {
      int v20 = *__error();
      _sa_logt();
      char v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        [v7 debugDescription];
        id v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v36;
        _os_log_debug_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_DEBUG,  "%@: Unable to inspect live processes for images infos",  buf,  0xCu);
      }

      uint64_t v4 = 0LL;
      *__error() = v20;
      goto LABEL_38;
    }

    if (*((_DWORD *)v7 + 19))
    {
      [v10 firstObject];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 binary];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 name];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      char v19 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:]( (uint64_t)v7,  v18,  v16,  (uint64_t)v55,  v12);

      if ((v19 & 1) == 0)
      {
        int v22 = *__error();
        _sa_logt();
        int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          [v7 debugDescription];
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 mainBinaryLoadInfo];
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 debugDescription];
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          uint64_t v57 = v39;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v41;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v16;
          _os_log_debug_impl( &dword_186C92000,  v23,  OS_LOG_TYPE_DEBUG,  "%@: live process has changed %@ -> %@",  buf,  0x20u);
        }

        *__error() = v22;
        uint64_t v4 = 0LL;
        goto LABEL_38;
      }
    }

    else if (v14)
    {
      objc_storeStrong(v7 + 6, v13);
    }

    else
    {
      int v24 = *__error();
      _sa_logt();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v43 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v43;
        _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "[%d] Unable to determine main binary", buf, 8u);
      }

      *__error() = v24;
    }

    if (v55)
    {
      v7[36] = v55;
    }

    else
    {
      int v26 = *__error();
      _sa_logt();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v42 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v42;
        _os_log_error_impl(&dword_186C92000, v27, OS_LOG_TYPE_ERROR, "[%d] Unable to determine architecture", buf, 8u);
      }

      *__error() = v26;
    }

    uint64_t v28 = v7 + 31;
    uint64_t v29 = [v7[31] count];
    objc_storeStrong(v7 + 31, v9);
    id v30 = v7[32];
    if (v30 && v12 != v30)
    {
      int v44 = *__error();
      _sa_logt();
      __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        [v7 debugDescription];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 debugDescription];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v46 = [v7[32] debugDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v57 = v49;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v48;
        __int16 v60 = 2112;
        uint64_t v47 = (void *)v46;
        uint64_t v61 = v46;
        _os_log_fault_impl( &dword_186C92000,  v45,  OS_LOG_TYPE_FAULT,  "%@: Got dyld shared cache %@ though have existing %@",  buf,  0x20u);
      }

      *__error() = v44;
    }

    objc_storeStrong(v7 + 32, v11);
    if (v29 == [v10 count])
    {
      int v31 = *__error();
      _sa_logt();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        [v7 debugDescription];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = [*v28 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = v33;
        __int16 v58 = 2048;
        uint64_t v59 = v34;
        _os_log_impl( &dword_186C92000,  v32,  OS_LOG_TYPE_INFO,  "%@: Inspected live processes for %lu images infos, nothing new",  buf,  0x16u);
      }
    }

    else
    {
      int v31 = *__error();
      _sa_logt();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        [v7 debugDescription];
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = [*v28 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v57 = v37;
        __int16 v58 = 2048;
        uint64_t v59 = v38;
        __int16 v60 = 2048;
        uint64_t v61 = v29;
        _os_log_debug_impl( &dword_186C92000,  v32,  OS_LOG_TYPE_DEBUG,  "%@: Inspected live processes for %lu images infos (%lu previously)",  buf,  0x20u);
      }
    }

    *__error() = v31;
    uint64_t v4 = 1LL;
    *((_BYTE *)v7 + 73) = 1;
LABEL_38:

    goto LABEL_39;
  }

  return v4;
}

- (uint64_t)correspondsToName:(void *)a3 mainBinaryLoadInfo:(uint64_t)a4 architecture:(void *)a5 sharedCache:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v9 && ![v9 length])
  {

    id v9 = 0LL;
    if (!v11) {
      goto LABEL_8;
    }
  }

  else if (!v11)
  {
    goto LABEL_8;
  }

  id v12 = *(id *)(a1 + 256);
  if (v12 && v12 != v11) {
    goto LABEL_25;
  }
LABEL_8:
  if (v10)
  {
    if ([v10 loadAddress])
    {
      if (*(_BYTE *)(a1 + 73))
      {
        [(id)a1 mainBinaryLoadInfo];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = [v13 loadAddress];
          [v14 segment];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = v16;
          if (v16)
          {
            if ([v16 hasOffsetIntoBinary])
            {
              [v14 segment];
              id v18 = (void *)objc_claimAutoreleasedReturnValue();
              v15 -= [v18 offsetIntoBinary];
            }

            else
            {
              uint64_t v15 = [v10 loadAddress];
            }
          }

          if (v15 == [v10 loadAddress])
          {
            [v14 binary];
            int v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 uuid];
            char v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 binary];
            int v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 uuid];
            int v23 = (void *)objc_claimAutoreleasedReturnValue();
            int v24 = [v21 isEqual:v23];

            if (v24)
            {

              goto LABEL_19;
            }
          }

LABEL_25:
          uint64_t v19 = 0LL;
          goto LABEL_26;
        }
      }
    }
  }

  if ((-[SATask _matchesNameStr:](a1, v9) & 1) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v19 = 1LL;
LABEL_26:

  return v19;
}

- (void)postprocessWithDataGatheringOptions:(int)a3 mightBeAlive:(void *)a4 machineArchitecture:(uint64_t)a5 dataSource:(uint64_t)a6 spindumpArchitecture:(void *)a7 spindumpSharedCache:(int)a8 additionalCSSymbolicatorFlags:
{
  uint64_t v254 = *MEMORY[0x1895F89C0];
  id v160 = a7;
  id v165 = a7;
  if (a1)
  {
    uint64_t v199 = 0LL;
    v200 = &v199;
    uint64_t v201 = 0x2020000000LL;
    char v202 = 0;
    v198[0] = MEMORY[0x1895F87A8];
    v198[1] = 3221225472LL;
    v198[2] = __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke;
    v198[3] = &unk_189F61F88;
    v198[4] = &v199;
    uint64_t v184 = a1;
    -[SATask enumerateFrames:](a1, v198);
    if ((a2 & 2) != 0)
    {
      if (a3)
      {
        -[SATask _gatherDataFromLiveProcessIsLate:mainBinaryPath:](a1, 0LL, 0LL);
        if (*((_BYTE *)v200 + 24) || !objc_msgSend(*(id *)(a1 + 248), "count", v160) || !*(_DWORD *)(a1 + 76)) {
          -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:](a1, a2, a8);
        }
      }
    }

    objc_msgSend((id)a1, "mainBinary", v160);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0 && !v12)
    {
      if ([*(id *)(a1 + 40) isAbsolutePath]
        && (id v13 = *(void **)(a1 + 40),
            objc_copyStruct(dest, (const void *)(v184 + 288), 8LL, 1, 0),
            +[SABinary binaryWithPath:architecture:additionalCSSymbolicatorFlags:]( (uint64_t)&OBJC_CLASS___SABinary,  v13,  *(uint64_t *)dest),  id v14 = (void *)objc_claimAutoreleasedReturnValue(),  (v15 = v14) != 0LL))
      {
        objc_storeStrong((id *)(v184 + 48), v14);
        id v12 = v15;
      }

      else
      {
        id v12 = 0LL;
      }
    }

    v166 = v12;
    [v12 uuid];
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)v184 mainBinaryPath];
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      if (([v168 isAbsolutePath] & 1) == 0)
      {
        [v166 gatherInfoWithDataGatheringOptions:a2 pid:*(unsigned int *)(v184 + 76)];
        [v166 path];
        int v22 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = v22;
        if (v22)
        {
          if ([v22 isAbsolutePath])
          {
            uint64_t v17 = v17;

            [(id)v184 setMainBinaryPath:v17];
            v168 = v17;
          }

          else if (!v168)
          {
            uint64_t v17 = v17;
            Path = -[NSString copyLastPathComponent](v17);
            uint64_t v19 = Path;
            if (*(void *)(v184 + 56) && objc_msgSend(Path, "hasPrefix:"))
            {
              int v24 = *(void **)(v184 + 56);
              *(void *)(v184 + 56) = 0LL;
            }

            v168 = v17;
            goto LABEL_37;
          }
        }

        goto LABEL_38;
      }

      if ((~(_DWORD)a2 & 5LL) == 0)
      {
        unint64_t v16 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
        uint64_t v17 = v16;
        if (v16)
        {
          -[SABinaryLocator urlForUUID:](v16, v167);
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = v18;
          if (v18)
          {
            [v18 path];
            int v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              [v19 path];
              char v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v21 isEqualToString:v168])
              {

LABEL_36:
                [v17 done];
LABEL_37:

                goto LABEL_38;
              }

              [MEMORY[0x1896078A8] defaultManager];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v19 path];
              int v26 = (void *)objc_claimAutoreleasedReturnValue();
              char v27 = [v25 fileExistsAtPath:v26];

              if ((v27 & 1) != 0) {
                goto LABEL_36;
              }
            }

            int v28 = *__error();
            _sa_logt();
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              [v19 path];
              id v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)dest = 138543874;
              *(void *)&dest[4] = v167;
              __int16 v213 = 2112;
              id v214 = v30;
              __int16 v215 = 2112;
              uint64_t v216 = (uint64_t)v168;
              _os_log_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_INFO,  "%{public}@ moved: replacing %@ with %@",  dest,  0x20u);
            }

            *__error() = v28;
            -[SABinaryLocator removeURLForUUID:](v17, v167);
          }

          [MEMORY[0x189604030] fileURLWithPath:v168 isDirectory:0];
          int v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[SABinaryLocator addURL:ForUUID:](v17, v31, v167);
          uint64_t v19 = v31;
          goto LABEL_36;
        }

void __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = v6;
  id v11 = v6;
  if (v6 && (WeakRetained = objc_loadWeakRetained(v6 + 3), uint64_t v7 = v11, WeakRetained))
  {

    id v9 = v11;
  }

  else
  {
    char v10 = [v7 isFakeFrame];
    id v9 = v11;
    if ((v10 & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }
}

- (void)enumerateFrames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 280);
    if (v4)
    {
      id v5 = v3;
      +[SAFrame enumerateFrameTree:block:]((uint64_t)&OBJC_CLASS___SAFrame, v4, v3);
      id v3 = v5;
    }
  }
}

- (void)_gatherDataFromLiveProcessIsLate:(void *)a3 mainBinaryPath:
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (a1 && !*(_BYTE *)(a1 + 71))
  {
    pid_t v5 = *(_DWORD *)(a1 + 76);
    if (v5)
    {
      if ((v5 & 0x80000000) == 0)
      {
        *(_BYTE *)(a1 + 71) = 1;
        if (!kill(v5, 0))
        {
          int v6 = proc_pidinfo(*(_DWORD *)(a1 + 76), 13, 1uLL, buffer, 64);
          int v7 = v50;
          if (v6) {
            int v8 = v49;
          }
          else {
            int v8 = -1;
          }
          if (!v6) {
            int v7 = -314;
          }
          *(_DWORD *)(a1 + 80) = v8;
          *(_DWORD *)(a1 + 88) = v7;
          if (!v4)
          {
            SAExecutablePath(*(_DWORD *)(a1 + 76), (const char *)[*(id *)(a1 + 56) UTF8String]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue();
            id v4 = v18;
            if (!v18) {
              goto LABEL_3;
            }
          }

          [(id)a1 name];
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          int v10 = [v9 isEqualToString:@"java"];

          if (v10)
          {
            if (_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken != -1) {
              dispatch_once(&_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken, &__block_literal_global_13);
            }
            id v11 = (char *)calloc(1uLL, _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size);
            size_t v41 = _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size;
            *(void *)flags = 0x3100000001LL;
            int v47 = *(_DWORD *)(a1 + 76);
            if (sysctl((int *)flags, 3u, v11, &v41, 0LL, 0LL))
            {
              int v12 = *__error();
              _sa_logt();
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                int v28 = *(_DWORD *)(a1 + 76);
                int v29 = *__error();
                id v30 = __error();
                int v31 = strerror(*v30);
                *(_DWORD *)buf = 67109634;
                int v43 = v28;
                __int16 v44 = 1024;
                *(_DWORD *)__int16 v45 = v29;
                *(_WORD *)&v45[4] = 2080;
                *(void *)&v45[6] = v31;
                _os_log_debug_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_DEBUG,  "unable to get arguments for %d: %d %s",  buf,  0x18u);
              }
            }

            else
            {
              if ((uint64_t)v41 >= 5)
              {
                int v20 = &v11[v41];
                char v21 = v11 + 4;
                do
                {
                  size_t v22 = strlen(v21);
                  if (&v21[v22] >= v20) {
                    break;
                  }
                  size_t v23 = v22;
                  if (!strncmp("-jar", v21, 5uLL))
                  {
                    v21 += v23 + 1;
                    int v32 = rindex(v21, 47);
                    if (v32) {
                      char v21 = v32 + 1;
                    }
                    int64_t v33 = strlen(v21);
                    if (v33 >= 5 && (uint64_t v34 = &v21[v33 - 4], !strncmp(".jar", v34, 4uLL)))
                    {
                      *uint64_t v34 = 0;
                    }

                    else
                    {
LABEL_55:
                      if (!v21) {
                        break;
                      }
                    }

uint64_t __58__SATask__gatherDataFromLiveProcessIsLate_mainBinaryPath___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v3 = 0;
  *(void *)v2 = 0x800000001LL;
  size_t v1 = 4LL;
  return sysctl(v2, 2u, &_gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size, &v1, 0LL, 0LL);
}

- (id)leafFrameAfterAddingStack:(void *)a3 leafOfCRootFramesReplacedBySwiftAsync:
{
  id v5 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 280))
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:1];
      int v7 = *(void **)(a1 + 280);
      *(void *)(a1 + 280) = v6;
    }

    if (a3) {
      *a3 = 0LL;
    }
    int v8 = *(void **)(a1 + 280);
    if (*(_DWORD *)(a1 + 76))
    {
      +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)&OBJC_CLASS___SAFrame, v5, 1LL, v8);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 && [v5 hasSwiftAsyncStack])
      {
        +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]( (uint64_t)&OBJC_CLASS___SAFrame,  v5,  16LL,  *(void **)(a1 + 280));
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)&OBJC_CLASS___SAFrame, v5, 2LL, v8);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (SAFrame)truncatedUserStackFrameSwiftAsync:(SAFrame *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a1[5]._childFrameOrFrames)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
      id childFrameOrFrames = v2[5]._childFrameOrFrames;
      v2[5]._id childFrameOrFrames = v4;
    }

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___SAFrame);
    int v7 = v6;
    if (v6)
    {
      if (a2) {
        char v8 = 10;
      }
      else {
        char v8 = 8;
      }
      unsigned __int8 v9 = v8 | v6->_BOOLs.bits & 0xF5;
      v6->_BOOLs.bits = v9;
      v6->_BOOLs.bits = v9 & 0xFB | (4 * (HIDWORD(v2[1]._binaryLoadInfo) == 0));
    }

    [v2[5]._childFrameOrFrames member:v6];
    int v10 = (SAFrame *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (!v10)
    {
      [v2[5]._childFrameOrFrames addObject:v7];
      id v11 = v7;
    }

    v2 = v11;
  }

  return v2;
}

- (uint64_t)_matchesNameStr:(uint64_t)a1
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 73))
  {
    [(id)a1 name];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v6 = v4;
    goto LABEL_6;
  }

  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v4 = v5;
    goto LABEL_5;
  }

  Path = -[NSString copyLastPathComponent](*(void **)(a1 + 40));
  int v16 = Path;
  if (Path)
  {
    id v6 = Path;
  }

  else
  {
    [*(id *)(a1 + 48) path];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = -[NSString copyLastPathComponent](v17);
  }

LABEL_6:
  int v7 = 0;
  if (v3 && v6)
  {
    if ([v3 length])
    {
      if ([v6 hasPrefix:v3])
      {
        [v3 length];
        int v7 = 0;
        goto LABEL_16;
      }

      int v7 = [v3 hasPrefix:v6];
    }

    else
    {
      int v7 = 0;
    }

    uint64_t v8 = [v3 length];
    if ((v7 & 1) == 0 && v8)
    {
      uint64_t v9 = 0LL;
      goto LABEL_24;
    }
  }

- (uint64_t)correspondsToName:(void *)a3 loadInfos:(int)a4 numLoadInfos:(uint64_t)a5 architecture:(void *)a6 sharedCache:
{
  int v11 = a6;
  if (!a1)
  {
LABEL_13:
    uint64_t v16 = 0LL;
    goto LABEL_9;
  }

  if (!*(_DWORD *)(a1 + 76))
  {
    int v18 = *__error();
    _sa_logt();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, "correspondsToName called for kernel", v25, 2u);
    }

    *__error() = v18;
    _SASetCrashLogMessage(1321, "correspondsToName called for kernel", v19, v20, v21, v22, v23, v24, v25[0]);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  if (a2)
  {
    SANSStringForCString(a2);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = 0LL;
  if (a3 && a4)
  {
    id v13 = objc_alloc(&OBJC_CLASS___SABinaryLoadInfo);
    uuidForBytes((uint64_t)(a3 + 1));
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v14, 0LL);
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[SABinaryLoadInfo initWithBinary:segment:loadAddress:]( v13,  "initWithBinary:segment:loadAddress:",  v15,  0LL,  *a3);
  }

  uint64_t v16 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:](a1, a2, v12, a5, v11);

LABEL_9:
  return v16;
}

- (BOOL)addImageInfos:(uint64_t)a1
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_91;
  }
  if (!v3)
  {
    BOOL v52 = 0LL;
    id v5 = 0LL;
    goto LABEL_98;
  }

  if (![v3 count])
  {
LABEL_91:
    BOOL v52 = 0LL;
    id v5 = v4;
    goto LABEL_98;
  }

  [v4 sortedArrayUsingComparator:&__block_literal_global_60];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = *(void **)(a1 + 248);
  int v7 = (id *)(a1 + 248);
  id v6 = v8;
  if (!v8 || ![v6 count])
  {
    objc_storeStrong(v7, v5);
    BOOL v52 = 1LL;
    goto LABEL_98;
  }

  uint64_t v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  obuint64_t j = v5;
  uint64_t v92 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
  if (!v92)
  {
    uint64_t v10 = 0LL;
    goto LABEL_93;
  }

  unint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v91 = *(void *)v108;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v108 != v91) {
        objc_enumerationMutation(obj);
      }
      uint64_t v93 = v11;
      uint64_t v12 = *(void **)(*((void *)&v107 + 1) + 8 * v11);
      [v12 binary];
      unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 segment];
      uint64_t v96 = [v12 length];
      unsigned int v97 = (void *)v13;
      if (v96) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v13 == 0;
      }
      unint64_t v95 = v12;
      if (v14)
      {
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        [v98 segments];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 reverseObjectEnumerator];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v17 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v104;
          while (1)
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v104 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v103 + 1) + 8 * i);
              if ([v21 hasOffsetIntoBinary])
              {
                if (![v21 length]) {
                  goto LABEL_28;
                }
                uint64_t v22 = [v21 offsetIntoBinary];
                uint64_t v96 = [v21 length] + v22;
LABEL_29:
                uint64_t v12 = v95;
LABEL_30:

                goto LABEL_31;
              }
            }

            uint64_t v18 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
            if (!v18)
            {
LABEL_28:
              uint64_t v96 = 0LL;
              goto LABEL_29;
            }
          }
        }

        uint64_t v96 = 0LL;
        goto LABEL_30;
      }

      while (1)
      {
LABEL_31:
        if (v9 >= [*v7 count]) {
          goto LABEL_74;
        }
        [*v7 objectAtIndexedSubscript:v9];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 binary];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 segment];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v23 length];
        if (v26) {
          BOOL v27 = 0;
        }
        else {
          BOOL v27 = v25 == 0LL;
        }
        if (v27)
        {
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          [v24 segments];
          int v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 reverseObjectEnumerator];
          int v29 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v26 = [v29 countByEnumeratingWithState:&v99 objects:v115 count:16];
          if (v26)
          {
            unint64_t v94 = v10;
            id v30 = v7;
            uint64_t v31 = *(void *)v100;
            while (2)
            {
              for (uint64_t j = 0LL; j != v26; ++j)
              {
                if (*(void *)v100 != v31) {
                  objc_enumerationMutation(v29);
                }
                int64_t v33 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                if ([v33 hasOffsetIntoBinary])
                {
                  if ([v33 length])
                  {
                    uint64_t v34 = [v33 offsetIntoBinary];
                    uint64_t v26 = [v33 length] + v34;
                  }

                  else
                  {
                    uint64_t v26 = 0LL;
                  }

                  goto LABEL_49;
                }
              }

              uint64_t v26 = [v29 countByEnumeratingWithState:&v99 objects:v115 count:16];
              if (v26) {
                continue;
              }
              break;
            }

- (uint64_t)correspondsToUniquePid:(void *)a3 name:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17 = a9;
  if (a1 && *(void *)(a1 + 96) == a2)
  {
    if (a2)
    {
      uint64_t v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }

    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(void *)(a1 + 288)) {
        *(void *)(a1 + 288) = a8;
      }
      uint64_t v18 = 1LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return v18;
}

- (uint64_t)correspondsToPid:(void *)a3 name:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17 = a9;
  if (a1 && *(_DWORD *)(a1 + 76) == a2)
  {
    if (a2)
    {
      uint64_t v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }

    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(void *)(a1 + 288)) {
        *(void *)(a1 + 288) = a8;
      }
      uint64_t v18 = 1LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return v18;
}

uint64_t __24__SATask_addImageInfos___block_invoke(uint64_t a1, void *a2, void *a3)
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
  -[SATask name](self, "name");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v3 initWithFormat:@"%@ [%d]", v4, self->_pid];

  return (NSString *)v5;
}

- (void)fixupThreadSuspension
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [*(id *)(a1 + 16) allValues];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = calloc([v2 count], 8uLL);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v4 = *(id *)(a1 + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v9 isSuspended])
          {
            [v9 startTimestamp];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 endTimestamp];
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v12 = [v9 startSampleIndex];
            uint64_t v13 = [v9 endSampleIndex];
            v16[0] = MEMORY[0x1895F87A8];
            v16[1] = 3221225472LL;
            v16[2] = __31__SATask_fixupThreadSuspension__block_invoke;
            v16[3] = &unk_189F64740;
            id v17 = v10;
            id v18 = v11;
            uint64_t v19 = v3;
            uint64_t v20 = v12;
            uint64_t v21 = v13;
            id v14 = v11;
            id v15 = v10;
            [v2 enumerateObjectsUsingBlock:v16];
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v6);
    }

    free(v3);
  }

void __31__SATask_fixupThreadSuspension__block_invoke(id a1, void *a2, uint64_t a3)
{
  uint64_t v237 = *MEMORY[0x1895F89C0];
  id v212 = a2;
  unint64_t v5 = *(void *)(*((void *)a1 + 6) + 8 * a3);
  [v212 threadStates];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 count];

  if (v5 >= v7) {
    goto LABEL_74;
  }
  unint64_t v8 = v212;
  while (1)
  {
    [v8 threadStates];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectAtIndexedSubscript:v5];
    uint64_t v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    [v10 startTimestamp];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 endTimestamp];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 le:*((void *)a1 + 4)]) {
      goto LABEL_71;
    }
    if ([*((id *)a1 + 5) le:v11]) {
      break;
    }
    if ([v10 isSuspended]) {
      goto LABEL_71;
    }
    int v13 = [*((id *)a1 + 4) gt:v11];
    int v14 = [*((id *)a1 + 5) lt:v12];
    if (v13 && (*((void *)a1 + 7) || *((void *)a1 + 8) == 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v210 = [v10 startSampleIndex];
      id v15 = (void *)[v10 endSampleIndex];
      uint64_t v16 = [v10 copy];
      id v3 = v10;
      if (v16) {
        objc_setProperty_atomic((id)v16, v17, *((id *)a1 + 4), 56LL);
      }
      if (v3) {
        objc_setProperty_atomic(v3, v17, *((id *)a1 + 4), 48LL);
      }
      uint64_t v18 = *((void *)a1 + 8);
      uint64_t v19 = (id *)v212;
      if (v15 == (void *)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_88;
        }
LABEL_38:
        -[SAThread insertState:atIndex:](v19, (void *)v16, v5++);

        goto LABEL_39;
      }

      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_91;
      }
      unint64_t v209 = (unint64_t)v15;
      unint64_t v20 = v210;
      if (v210 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v21 = *((void *)a1 + 7);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v22 = *((void *)a1 + 8);
        }
        else {
          unint64_t v22 = v21 - 1;
        }
        -[SAThreadState setEndSampleIndex:](v16, v22);
        if (v22 < v210)
        {
          uint64_t v23 = v16;
          goto LABEL_26;
        }

        if (v209 <= v22)
        {
          uint64_t v23 = (uint64_t)v3;
LABEL_26:
          unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }

        else
        {
          unint64_t v24 = v22 + 1;
          uint64_t v23 = (uint64_t)v3;
        }

        -[SAThreadState setStartSampleIndex:](v23, v24);
        unint64_t v20 = v210;
      }

      if (([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
         || [v3 startSampleIndex] != v20)
        && ([(id)v16 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL
         || [(id)v16 startSampleIndex] != v20))
      {
        goto LABEL_100;
      }

      if ([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v25 = [(id)v16 endSampleIndex];
        if (v25 < [(id)v16 startSampleIndex]) {
          goto LABEL_109;
        }
      }

      if ([v3 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v26 = [v3 endSampleIndex];
        if (v26 < [v3 startSampleIndex]) {
          goto LABEL_112;
        }
      }

      unint64_t v27 = [v3 endSampleIndex];
      BOOL v28 = v27 >= [(id)v16 endSampleIndex];
      uint64_t v19 = (id *)v212;
      if (!v28) {
        goto LABEL_94;
      }
      goto LABEL_38;
    }

void __48__SATask_forwardFillMonotonicallyIncreasingData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)isAliveAtTimestamp:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 startTimestamp];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = v4;
    if (v4 && ([v4 gt:v3] & 1) == 0)
    {
      [a1 endTimestamp];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = [v6 lt:v3];

      a1 = (void *)(v7 ^ 1u);
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

- (id)startTimestamp
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v3 = self->_execTimestamp;
  uint64_t v16 = v3;
  if (!v3)
  {
    -[NSMutableArray firstObject](self->_taskStates, "firstObject");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 startTimestamp];
    uint64_t v6 = (void *)v12[5];
    v12[5] = v5;

    id v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __24__SATask_startTimestamp__block_invoke;
      v10[3] = &unk_189F61FB0;
      v10[4] = &v11;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v10);
      id v3 = (SATimestamp *)v12[5];
    }
  }

  unint64_t v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __24__SATask_startTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  [v9 creationTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_3;
  }
  [v9 threadStates];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 firstObject];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 startTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v8 = *(void **)(v7 + 40);
    if (!v8)
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), v4);
      goto LABEL_7;
    }

    if ([v8 gt:v4])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      goto LABEL_6;
    }
  }

- (id)endTimestamp
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v3 = self->_exitTimestamp;
  uint64_t v16 = v3;
  if (!v3)
  {
    -[NSMutableArray lastObject](self->_taskStates, "lastObject");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 endTimestamp];
    uint64_t v6 = (void *)v12[5];
    v12[5] = v5;

    id v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __22__SATask_endTimestamp__block_invoke;
      v10[3] = &unk_189F61FB0;
      v10[4] = &v11;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v10);
      id v3 = (SATimestamp *)v12[5];
    }
  }

  unint64_t v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __22__SATask_endTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  [v9 exitTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_3;
  }
  [v9 threadStates];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 lastObject];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 endTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v8 = *(void **)(v7 + 40);
    if (!v8)
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), v4);
      goto LABEL_7;
    }

    if ([v8 lt:v4])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      goto LABEL_6;
    }
  }

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (v6 && v7 && ([v6 le:v7] & 1) == 0)
  {
    int v16 = *__error();
    _sa_logt();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v6 debugDescription];
      uint64_t v19 = [v18 UTF8String];
      id v20 = [v8 debugDescription];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v20 UTF8String];
      _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "startTime %s > endTime %s", buf, 0x16u);
    }

    *__error() = v16;
    id v21 = [v6 debugDescription];
    char v22 = [v21 UTF8String];
    id v23 = [v8 debugDescription];
    [v23 UTF8String];
    _SASetCrashLogMessage(1940, "startTime %s > endTime %s", v24, v25, v26, v27, v28, v29, v22);

    _os_crash();
    __break(1u);
  }

  if (-[NSMutableArray count](self->_taskStates, "count"))
  {
    unint64_t v9 = -[SATask indexOfFirstTaskStateOnOrAfterTime:sampleIndex:]( self,  "indexOfFirstTaskStateOnOrAfterTime:sampleIndex:",  v6,  0x7FFFFFFFFFFFFFFFLL);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = 0LL;
    }

    else
    {
      unint64_t v12 = v9;
      unint64_t v13 = -[SATask indexOfLastTaskStateOnOrBeforeTime:sampleIndex:]( self,  "indexOfLastTaskStateOnOrBeforeTime:sampleIndex:",  v8,  0x7FFFFFFFFFFFFFFFLL);
      if (v13 >= v12) {
        uint64_t v14 = v13 - v12 + 1;
      }
      else {
        uint64_t v14 = 0LL;
      }
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v10 = 0LL;
      }
      else {
        unint64_t v10 = v14;
      }
    }
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v35 = 0LL;
    threads = self->_threads;
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke;
    v30[3] = &unk_189F647A8;
    unint64_t v33 = buf;
    id v31 = v6;
    id v32 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v30);
    unint64_t v10 = *(void *)(*(void *)&buf[8] + 24LL);

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

uint64_t __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 sampleCountInTimestampRangeStart:a1[4] end:a1[5]];
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) += result;
  return result;
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    int v21 = *__error();
    _sa_logt();
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)p_isa, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v41 = a3;
      __int16 v42 = 2048;
      unint64_t v43 = a4;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)p_isa,  OS_LOG_TYPE_ERROR,  "startSampleIndexCap %lu > endSampleIndexCap %lu",  buf,  0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1976, "startSampleIndexCap %lu > endSampleIndexCap %lu", v22, v23, v24, v25, v26, v27, a3);
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }

  p_isa = (id *)&self->super.isa;
  -[NSMutableArray firstObject](self->_taskStates, "firstObject");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = v9;
  if (!v9)
  {
    unint64_t v16 = 0LL;
    goto LABEL_29;
  }

  if ([v9 endSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    int v28 = *__error();
    _sa_logt();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = [p_isa debugDescription];
      uint64_t v31 = [v30 UTF8String];
      *(_DWORD *)buf = 136315138;
      unint64_t v41 = v31;
      _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "Asking for sample count based on sample indexes when there are no sample indexes: %s",  buf,  0xCu);
    }

    *__error() = v28;
    id v32 = [p_isa debugDescription];
    char v33 = [v32 UTF8String];
    _SASetCrashLogMessage( 1983,  "Asking for sample count based on sample indexes when there are no sample indexes: %s",  v34,  v35,  v36,  v37,  v38,  v39,  v33);

    _os_crash();
    __break(1u);
  }

  [p_isa[1] lastObject];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = [v11 endSampleIndex];
  if (v12 >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = v13;
  }
  if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = [v10 endSampleIndex];
  }
  else {
    unint64_t v15 = [v10 startSampleIndex];
  }
  if (v15 <= a3) {
    unint64_t v17 = a3;
  }
  else {
    unint64_t v17 = v15;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = v15;
  }
  BOOL v18 = v14 >= v17;
  unint64_t v19 = v14 - v17;
  if (v18) {
    unint64_t v16 = v19 + 1;
  }
  else {
    unint64_t v16 = 0LL;
  }

LABEL_29:
  return v16;
}

- (void)cpuTimeNs:(void *)a3 cpuInstructions:(void *)a4 cpuCycles:(void *)a5 nonThreadCpuTimeNs:(void *)a6 nonThreadCpuInstructions:(void *)a7 nonThreadCpuCycles:(void *)a8 betweenStartTime:(void *)a9 endTime:
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v16 = a8;
  id v17 = a9;
  if (!a1) {
    goto LABEL_46;
  }
  if (a2) {
    *a2 = 0LL;
  }
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  uint64_t v102 = 0LL;
  uint64_t v103 = &v102;
  uint64_t v104 = 0x2020000000LL;
  uint64_t v105 = 0LL;
  uint64_t v98 = 0LL;
  uint64_t v99 = &v98;
  uint64_t v100 = 0x2020000000LL;
  uint64_t v101 = 0LL;
  uint64_t v94 = 0LL;
  uint64_t v95 = &v94;
  uint64_t v96 = 0x2020000000LL;
  uint64_t v97 = 0LL;
  uint64_t v71 = a1;
  [a1 lastTaskStateOnOrBeforeTime:v17 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v68 = [v18 terminatedThreadsCpuTimeNs];
  uint64_t v66 = a4;
  uint64_t v67 = a5;
  int v64 = a2;
  uint64_t v65 = a3;
  if (v18
    && (!v16
     || ([v18 endTimestamp],
         unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(),
         int v20 = [v19 gt:v16],
         v19,
         v20)))
  {
    uint64_t v21 = [v18 terminatedThreadsCpuTimeNs];
    v103[3] += v21;
    uint64_t v22 = [v18 terminatedThreadsInstructions];
    v99[3] += v22;
    uint64_t v23 = [v18 terminatedThreadsCycles];
    v95[3] += v23;
    [v18 endTimestamp];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (uint64_t v25 = (void *)v71[28]) != 0 && ![v25 lt:v16])
    {
      uint64_t v70 = 0LL;
    }

    else
    {
      [v71 firstTaskStateOnOrAfterTime:v16 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v26;
      uint64_t v70 = v26;
      if (!v26
        || v17
        && ([v26 startTimestamp],
            int v28 = (void *)objc_claimAutoreleasedReturnValue(),
            char v29 = [v28 le:v17],
            v28,
            uint64_t v27 = v70,
            (v29 & 1) == 0))
      {
        int v47 = *__error();
        _sa_logt();
        uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          [v27 startTimestamp];
          id v49 = (void *)objc_claimAutoreleasedReturnValue();
          id v50 = [v49 debugDescription];
          uint64_t v51 = [v50 UTF8String];
          id v52 = [v17 debugDescription];
          uint64_t v53 = [v52 UTF8String];
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v51;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v53;
          _os_log_error_impl( &dword_186C92000,  v48,  OS_LOG_TYPE_ERROR,  "firstTaskState.startTimestamp %s > endTimestamp %s",  buf,  0x16u);
        }

        *__error() = v47;
        [v70 startTimestamp];
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        id v55 = [v54 debugDescription];
        char v56 = [v55 UTF8String];
        id v57 = [v17 debugDescription];
        [v57 UTF8String];
        _SASetCrashLogMessage( 2060,  "firstTaskState.startTimestamp %s > endTimestamp %s",  v58,  v59,  v60,  v61,  v62,  v63,  v56);

        _os_crash();
        __break(1u);
      }

      uint64_t v30 = [v27 terminatedThreadsCpuTimeNs];
      v103[3] -= v30;
      uint64_t v31 = [v27 terminatedThreadsInstructions];
      v99[3] -= v31;
      uint64_t v32 = [v27 terminatedThreadsCycles];
      v95[3] -= v32;
    }
  }

  else
  {
    uint64_t v70 = 0LL;
    uint64_t v24 = 0LL;
  }

  BOOL v33 = v68 != 0;
  if (v17) {
    uint64_t v34 = v17;
  }
  else {
    uint64_t v34 = v24;
  }
  id v35 = v34;

  uint64_t v69 = a7;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  uint64_t v107 = 0LL;
  uint64_t v90 = 0LL;
  uint64_t v91 = &v90;
  uint64_t v92 = 0x2020000000LL;
  uint64_t v93 = 0LL;
  uint64_t v86 = 0LL;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x2020000000LL;
  uint64_t v89 = 0LL;
  uint64_t v36 = (void *)v71[2];
  v72[0] = MEMORY[0x1895F87A8];
  v72[1] = 3221225472LL;
  v72[2] = __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke;
  v72[3] = &unk_189F647D0;
  id v17 = v35;
  id v73 = v17;
  BOOL v85 = v33;
  id v37 = v24;
  id v74 = v37;
  id v38 = v18;
  id v75 = v38;
  uint64_t v79 = &v102;
  uint64_t v80 = &v98;
  uint64_t v81 = &v94;
  uint64_t v82 = buf;
  uint64_t v83 = &v90;
  int v84 = &v86;
  id v76 = v16;
  uint64_t v77 = v71;
  id v39 = v70;
  id v78 = v39;
  [v36 enumerateKeysAndObjectsUsingBlock:v72];
  uint64_t v40 = *(void *)&buf[8];
  unint64_t v41 = *(void *)(*(void *)&buf[8] + 24LL);
  __int16 v42 = v103;
  unint64_t v43 = v91;
  uint64_t v44 = v99;
  if (v41 <= v103[3])
  {
    id v45 = v87;
    id v46 = v95;
  }

  else
  {
    id v45 = v87;
    id v46 = v95;
  }

  v103[3] = v41;
  v44[3] = v43[3];
  v46[3] = v45[3];
LABEL_33:
  if (v64) {
    *int v64 = v42[3];
  }
  if (v65) {
    *uint64_t v65 = v44[3];
  }
  if (v66) {
    *uint64_t v66 = v46[3];
  }
  if (v67) {
    *uint64_t v67 = v42[3] - *(void *)(v40 + 24);
  }
  if (a6) {
    *a6 = v44[3] - v43[3];
  }
  if (v69) {
    *uint64_t v69 = v46[3] - v45[3];
  }

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
LABEL_46:
}

void __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (([v5 isGlobalForcedIdle] & 1) == 0 && (objc_msgSend(v5, "isProcessorIdleThread") & 1) == 0)
  {
    [v5 lastThreadStateOnOrBeforeTime:*(void *)(a1 + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    if (!v6)
    {
      int v12 = 1;
      goto LABEL_29;
    }

    if (!*(_BYTE *)(a1 + 128)) {
      goto LABEL_20;
    }
    uint64_t v8 = [v6 endTimestamp];
    if (!v8) {
      goto LABEL_20;
    }
    unint64_t v9 = (void *)v8;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      [v7 endTimestamp];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v3 lt:*(void *)(a1 + 32)] & 1) == 0
        || (uint64_t v11 = (void *)(a1 + 40), !*(void *)(a1 + 40)))
      {
LABEL_18:

        goto LABEL_19;
      }
    }

    else
    {
      uint64_t v11 = (void *)(a1 + 40);
      if (!*(void *)(a1 + 40)) {
        goto LABEL_19;
      }
    }

    [v7 endTimestamp];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 lt:*v11])
    {
      uint64_t v14 = [v5 exitTimestamp];
      if (v14)
      {
        unint64_t v15 = (void *)v14;
        [v5 exitTimestamp];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v16 le:*v11];

        if (v10)
        {

          if ((v17 & 1) == 0)
          {
LABEL_20:
            int v17 = 0;
LABEL_21:
            BOOL v18 = 1;
            goto LABEL_22;
          }
        }

        else
        {

          if (!v17) {
            goto LABEL_21;
          }
        }

        BOOL v18 = [*(id *)(a1 + 48) terminatedThreadsCycles] == 0;
        int v17 = 1;
LABEL_22:
        if (*(void *)(a1 + 56))
        {
          [v7 endTimestamp];
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          int v20 = [v19 ge:*(void *)(a1 + 56)];

          if (!v20) {
            goto LABEL_44;
          }
        }

        int v12 = v17 ^ 1;
        if ((v17 & 1) == 0) {
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v7 cpuTimeNs];
        }
        if (v18)
        {
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += [v7 instructions];
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += [v7 cycles];
        }

        *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += [v7 cpuTimeNs];
        *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) += [v7 instructions];
        *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += [v7 cycles];
LABEL_29:
        [v5 creationTimestamp];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = v21;
        if (v21 && *(void *)(a1 + 56))
        {
          [v5 creationTimestamp];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          int v24 = [v23 lt:*(void *)(a1 + 56)];

          if (!v24)
          {
LABEL_44:

            goto LABEL_45;
          }
        }

        else
        {
        }

        [v5 firstThreadStateOnOrAfterTime:*(void *)(a1 + 56) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = v25;
        if (v25)
        {
          if (!*(void *)(a1 + 32)
            || ([v25 startTimestamp],
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(),
                int v28 = [v27 le:*(void *)(a1 + 32)],
                v27,
                v28))
          {
            unint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
            if (v29 >= [v26 cpuTimeNs])
            {
              *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) -= [v26 cpuTimeNs];
              *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) -= [v26 instructions];
              *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) -= [v26 cycles];
            }

            else
            {
              int v30 = *__error();
              _sa_logt();
              uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                [*(id *)(a1 + 64) debugDescription];
                int v47 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v44 = [v5 threadId];
                uint64_t v32 = [v26 cpuTimeNs];
                uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
                uint64_t v43 = v32;
                uint64_t v41 = [v7 cpuTimeNs];
                uint64_t v40 = [*(id *)(a1 + 72) terminatedThreadsCpuTimeNs];
                uint64_t v39 = [*(id *)(a1 + 48) terminatedThreadsCpuTimeNs];
                [v26 debugDescription];
                id v46 = (void *)objc_claimAutoreleasedReturnValue();
                [v7 debugDescription];
                id v38 = (void *)objc_claimAutoreleasedReturnValue();
                [v5 exitTimestamp];
                id v45 = (void *)objc_claimAutoreleasedReturnValue();
                [v45 debugDescription];
                BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
                [*(id *)(a1 + 48) debugDescription];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                int v37 = *(unsigned __int8 *)(a1 + 128);
                [*(id *)(a1 + 56) debugDescription];
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                [*(id *)(a1 + 32) debugDescription];
                *(_DWORD *)buf = 138415874;
                id v49 = v47;
                __int16 v50 = 2048;
                uint64_t v51 = v44;
                __int16 v52 = 2048;
                uint64_t v53 = v43;
                __int16 v54 = 2048;
                uint64_t v55 = v42;
                __int16 v56 = 2048;
                uint64_t v57 = v41;
                __int16 v58 = 2048;
                uint64_t v59 = v40;
                __int16 v60 = 2048;
                uint64_t v61 = v39;
                __int16 v62 = 2112;
                uint64_t v63 = v46;
                __int16 v64 = 2112;
                uint64_t v65 = v38;
                __int16 v66 = 2112;
                uint64_t v67 = v33;
                __int16 v68 = 2112;
                uint64_t v69 = v34;
                __int16 v70 = 1024;
                int v71 = v37;
                __int16 v72 = 1024;
                int v73 = v12;
                __int16 v74 = 2112;
                id v75 = v36;
                v77 = __int16 v76 = 2112;
                id v35 = (void *)v77;
                _os_log_error_impl( &dword_186C92000,  v31,  OS_LOG_TYPE_ERROR,  "%@ thread 0x%llx starting cpu time %llu < taskCpuTimeNs %llu\n lastThreadState.cpuTimeNs: %llu\n firstTaskState.terminatedThreadsCpuTimeNs: %llu\n lastTaskState.terminatedThreadsCpuTimeNs: %llu\n firstThreadState: %@\n lastThreadState: %@\n thread.exitTimestamp: %@\n lastTaskState: %@\n taskHasTimeInTerminatedThreads: %d\n addEndCPU: %d\n startTimestamp: %@\n endTimestamp: %@",  buf,  0x90u);
              }

              *__error() = v30;
            }

            *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) -= [v26 cpuTimeNs];
            *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) -= [v26 instructions];
            *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) -= [v26 cycles];
          }
        }

        goto LABEL_44;
      }
    }

    if (v10) {
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }

- (void)cpuTimeNs:(unint64_t *)a3 cpuInstructions:(unint64_t *)a4 cpuCycles:(unint64_t *)a5 betweenStartTime:(id)a6 endTime:(id)a7
{
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)fixupFrameInstructionsWithDataGatheringOptions:(int)a3 mightBeAlive:(_BYTE *)a4 foundNewBinaryInfo:(void *)a5 uuidsWithNewInstructions:(int)a6 additionalCSSymbolicatorFlags:
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  if (!a1) {
    goto LABEL_52;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a1[35]) {
    goto LABEL_52;
  }
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  obuint64_t j = a1[31];
  uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v12)
  {
    unint64_t v13 = 0LL;
    id v37 = obj;
LABEL_40:

    goto LABEL_42;
  }

  int v43 = a3;
  uint64_t v44 = a2;
  int v45 = a6;
  id v46 = a4;
  id v47 = v11;
  uint64_t v48 = a1;
  unint64_t v13 = 0LL;
  uint64_t v14 = *(void *)v58;
  unint64_t v15 = obj;
  uint64_t v49 = *(void *)v58;
  uint64_t v16 = v12;
  do
  {
    uint64_t v17 = 0LL;
    uint64_t v52 = v16;
    do
    {
      if (*(void *)v58 != v14) {
        objc_enumerationMutation(v15);
      }
      BOOL v18 = *(void **)(*((void *)&v57 + 1) + 8 * v17);
      [v18 segment];
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        [v18 binary];
        int v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 segments];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v21 count]) {
          goto LABEL_34;
        }
        [v21 firstObject];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v22 hasOffsetIntoBinary] && objc_msgSend(v22, "offsetIntoBinary") < 0)
        {
LABEL_27:
          if (!v13) {
            unint64_t v13 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:v48[31]];
          }
          [v13 removeObject:v18];
          uint64_t v33 = [v18 loadAddress];
          int v34 = [v18 isInKernelAddressSpace];
          [v18 exclave];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[SABinaryLoadInfo loadInfosForSegmentsInBinary:binaryBaseAddress:isInKernelAddressSpace:exclave:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  v20,  v33,  v34,  v23);
          id v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObjectsFromArray:v35];

LABEL_31:
          uint64_t v14 = v49;
          unint64_t v15 = obj;
        }

        else
        {
          if (![v20 length]) {
            goto LABEL_33;
          }
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          [v21 reverseObjectEnumerator];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v51 = v13;
            uint64_t v26 = *(void *)v54;
LABEL_17:
            uint64_t v27 = 0LL;
            while (1)
            {
              if (*(void *)v54 != v26) {
                objc_enumerationMutation(v23);
              }
              int v28 = *(void **)(*((void *)&v53 + 1) + 8 * v27);
              if (v25 == ++v27)
              {
                uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
                if (v25) {
                  goto LABEL_17;
                }
                goto LABEL_30;
              }
            }

            if ([v28 offsetIntoBinary] <= 0)
            {
LABEL_30:
              unint64_t v13 = v51;
              goto LABEL_31;
            }

            uint64_t v29 = [v28 offsetIntoBinary];
            unint64_t v30 = [v28 length] + v29;
            unint64_t v31 = [v20 length];

            BOOL v32 = v30 > v31;
            unint64_t v15 = obj;
            unint64_t v13 = v51;
            uint64_t v14 = v49;
            uint64_t v16 = v52;
            if (v32) {
              goto LABEL_27;
            }
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
        }

        uint64_t v16 = v52;
        goto LABEL_33;
      }

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = self->_rootFrames;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        +[SAFrame releaseFrameTree:]((uint64_t)&OBJC_CLASS___SAFrame, *(void **)(*((void *)&v9 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATask;
  -[SATask dealloc](&v8, sel_dealloc);
}

- (uint64_t)isFromCurrentBootCycle
{
  unint64_t v2 = (unint64_t)self;
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 272LL, 1);
    uint64_t v4 = v3;
    if (!v3 || ([v3 wallTime], v5 == 0.0))
    {
      [(id)v2 startTimestamp];
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v9 = v8;
      double v7 = 0.0;
      if (v8)
      {
        [v8 wallTime];
        if (v10 != 0.0)
        {
          [v9 wallTime];
          double v7 = v11;
        }
      }
    }

    else
    {
      [v4 wallTime];
      double v7 = v6;
    }

    if (v7 == 0.0)
    {
      [(id)v2 sharedCache];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        [(id)v2 sharedCache];
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SASharedCache currentSharedCache](&OBJC_CLASS___SASharedCache, "currentSharedCache");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v2 = v13 == v14;

        return v2;
      }
    }

    else if (v7 > SATimeOfBootForLiveMachine())
    {
      return 1LL;
    }

    return 0LL;
  }

  return v2;
}

- (NSArray)taskStates
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSDictionary)threads
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDictionary)dispatchQueues
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDictionary)swiftTasks
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  return self->_ppid;
}

- (int)rpid
{
  return self->_rpid;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)uniquePid
{
  return self->_uniquePid;
}

- (NSString)bundleName
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)bundleBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)bundleProjectName
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)bundleSourceVersion
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)bundleProductBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (unint64_t)resourceCoalitionID
{
  return self->_resourceCoalitionID;
}

- (NSString)resourceCoalitionName
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (NSString)installerVersionID
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (NSString)vendorID
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (NSString)distributorID
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (char)developerType
{
  return self->_developerType;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (NSString)cohortID
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (NSString)appType
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (NSString)commerceAppID
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (NSString)commerceExternalID
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (SATimestamp)execTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 224LL, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 232LL, 1);
}

- (BOOL)isUnresponsive
{
  return self->_isUnresponsive;
}

- (double)timeOfLastResponse
{
  return self->_timeOfLastResponse;
}

- (BOOL)usesSuddenTermination
{
  return self->_usesSuddenTermination;
}

- (BOOL)allowsIdleExit
{
  return self->_allowsIdleExit;
}

- (BOOL)isTranslocated
{
  return self->_isTranslocated;
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 248LL, 1);
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 256LL, 1);
}

- (SAThread)mainThread
{
  return (SAThread *)objc_getProperty(self, a2, 264LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SATask";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3 = -[NSMutableSet count](self->_rootFrames, "count");
  NSUInteger v4 = -[NSArray count](self->_binaryLoadInfos, "count") + v3;
  uint64_t v5 = -[NSMutableArray count](self->_taskStates, "count");
  NSUInteger v6 = v4 + v5 + -[NSMutableDictionary count](self->_threads, "count");
  uint64_t v7 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
  return 8 * (v6 + v7 + -[NSMutableDictionary count](self->_swiftTasks, "count")) + 245;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v150 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v32 = *__error();
    _sa_logt();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = -[SATask debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v139 = [v34 UTF8String];
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v141[8] = 2048;
      unint64_t v142 = a4;
      _os_log_error_impl(&dword_186C92000, v33, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v32;
    id v35 = -[SATask debugDescription](self, "debugDescription");
    char v36 = [v35 UTF8String];
    -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(2864, "%s: size %lu != buffer length %lu", v37, v38, v39, v40, v41, v42, v36);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  *(_WORD *)&a3->var0 = 2305;
  *(_DWORD *)(&a3->var1 + 1) = self->_pid;
  *(int *)((char *)&a3->var2 + 2) = self->_ppid;
  *(int *)((char *)&a3->var3 + 2) = self->_rpid;
  *(int *)((char *)&a3->var4 + 2) = self->_uid;
  *(void *)((char *)&a3->var5 + 2) = self->_uniquePid;
  *(unint64_t *)((char *)&a3->var10 + 2) = *(void *)&self->_timeOfLastResponse;
  *(unint64_t *)((char *)&a3->var18 + 6) = (unint64_t)self->_architecture;
  char v10 = BYTE6(a3->var19) & 0xFE | self->_isUnresponsive;
  BYTE6(a3->var19) = v10;
  char v11 = v10 & 0xFD | (2 * self->_usesSuddenTermination);
  BYTE6(a3->var19) = v11;
  char v12 = v11 & 0xF3 | (4 * self->_allowsIdleExit);
  BYTE6(a3->var19) = v12;
  BYTE6(a3->var19) = v12 & 0xE7 | (16 * self->_isTranslocated);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_name,  v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_bundleName,  v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_execTimestamp,  v9);
  *(unint64_t *)((char *)&a3->var9 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_exitTimestamp,  v9);
  *(void *)((char *)&a3->var15 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainThread, v9);
  *(void *)((char *)&a3->var16 + 6) = SASerializableIndexForPointerFromSerializationDictionary( self->_mainBinaryPath,  v9);
  *(unint64_t *)((char *)&a3->var17 + 6) = SASerializableIndexForPointerFromSerializationDictionary( self->_sharedCache,  v9);
  if ((unint64_t)-[NSMutableSet count](self->_rootFrames, "count") >= 0xFFFFFFFF)
  {
LABEL_13:
    int v43 = *__error();
    _sa_logt();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v46 = [v45 UTF8String];
      uint64_t v47 = -[NSMutableSet count](self->_rootFrames, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v46;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v47;
      _os_log_error_impl(&dword_186C92000, v44, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);
    }

    *__error() = v43;
    id v48 = -[SATask debugDescription](self, "debugDescription");
    char v49 = [v48 UTF8String];
    -[NSMutableSet count](self->_rootFrames, "count");
    _SASetCrashLogMessage(2891, "%s: %lu rootFrames", v50, v51, v52, v53, v54, v55, v49);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }

  unsigned int v13 = -[NSMutableSet count](self->_rootFrames, "count");
  *(_DWORD *)((char *)&a3->var11 + 2) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var20, v13, self->_rootFrames, v9);
  if (-[NSArray count](self->_binaryLoadInfos, "count") >= 0xFFFFFFFF)
  {
LABEL_16:
    int v56 = *__error();
    _sa_logt();
    __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      id v58 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v59 = [v58 UTF8String];
      NSUInteger v60 = -[NSArray count](self->_binaryLoadInfos, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v59;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v60;
      _os_log_error_impl(&dword_186C92000, v57, OS_LOG_TYPE_ERROR, "%s: %lu binaryLoadInfos", buf, 0x16u);
    }

    *__error() = v56;
    id v61 = -[SATask debugDescription](self, "debugDescription");
    char v62 = [v61 UTF8String];
    -[NSArray count](self->_binaryLoadInfos, "count");
    _SASetCrashLogMessage(2896, "%s: %lu binaryLoadInfos", v63, v64, v65, v66, v67, v68, v62);

    _os_crash();
    __break(1u);
    goto LABEL_19;
  }

  unsigned int v14 = -[NSArray count](self->_binaryLoadInfos, "count");
  *(_DWORD *)((char *)&a3->var11 + 6) = v14;
  unint64_t v15 = &a3->var20 + *(unsigned int *)((char *)&a3->var11 + 2);
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v15, v14, self->_binaryLoadInfos, v9);
  if ((unint64_t)-[NSMutableArray count](self->_taskStates, "count") >= 0xFFFFFFFF)
  {
LABEL_19:
    int v69 = *__error();
    _sa_logt();
    __int16 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      id v71 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v72 = [v71 UTF8String];
      uint64_t v73 = -[NSMutableArray count](self->_taskStates, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v72;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v73;
      _os_log_error_impl(&dword_186C92000, v70, OS_LOG_TYPE_ERROR, "%s: %lu taskStates", buf, 0x16u);
    }

    *__error() = v69;
    id v74 = -[SATask debugDescription](self, "debugDescription");
    char v75 = [v74 UTF8String];
    -[NSMutableArray count](self->_taskStates, "count");
    _SASetCrashLogMessage(2901, "%s: %lu taskStates", v76, v77, v78, v79, v80, v81, v75);

    _os_crash();
    __break(1u);
    goto LABEL_22;
  }

  unsigned int v16 = -[NSMutableArray count](self->_taskStates, "count");
  *(unsigned int *)((char *)&a3->var12 + 2) = v16;
  uint64_t v17 = &v15[*(unsigned int *)((char *)&a3->var11 + 6)];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v17, v16, self->_taskStates, v9);
  if ((unint64_t)-[NSMutableDictionary count](self->_threads, "count") >= 0xFFFFFFFF)
  {
LABEL_22:
    int v82 = *__error();
    _sa_logt();
    uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      id v84 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v85 = [v84 UTF8String];
      uint64_t v86 = -[NSMutableDictionary count](self->_threads, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v85;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v86;
      _os_log_error_impl(&dword_186C92000, v83, OS_LOG_TYPE_ERROR, "%s: %lu threads", buf, 0x16u);
    }

    *__error() = v82;
    id v87 = -[SATask debugDescription](self, "debugDescription");
    char v88 = [v87 UTF8String];
    -[NSMutableDictionary count](self->_threads, "count");
    _SASetCrashLogMessage(2906, "%s: %lu threads", v89, v90, v91, v92, v93, v94, v88);

    _os_crash();
    __break(1u);
    goto LABEL_25;
  }

  unsigned int v18 = -[NSMutableDictionary count](self->_threads, "count");
  *(unsigned int *)((char *)&a3->var13 + 2) = v18;
  unint64_t v19 = &v17[*(unsigned int *)((char *)&a3->var12 + 2)];
  unint64_t v20 = v18;
  -[NSMutableDictionary allValues](self->_threads, "allValues");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v19, v20, v21, v9);

  if ((unint64_t)-[NSMutableDictionary count](self->_dispatchQueues, "count") >= 0xFFFFFFFF)
  {
LABEL_25:
    int v95 = *__error();
    _sa_logt();
    uint64_t v96 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      id v97 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v98 = [v97 UTF8String];
      uint64_t v99 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v98;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v99;
      _os_log_error_impl(&dword_186C92000, v96, OS_LOG_TYPE_ERROR, "%s: %lu dispatchQueues", buf, 0x16u);
    }

    *__error() = v95;
    -[SATask debugDescription](self, "debugDescription");
    a3 = ($AC4E7194CE91BC1B493361775673353E *) objc_claimAutoreleasedReturnValue();
    char v100 = -[$AC4E7194CE91BC1B493361775673353E UTF8String](a3, "UTF8String");
    -[NSMutableDictionary count](self->_dispatchQueues, "count");
    _SASetCrashLogMessage(2911, "%s: %lu dispatchQueues", v101, v102, v103, v104, v105, v106, v100);

    _os_crash();
    __break(1u);
    goto LABEL_28;
  }

  unsigned int v22 = -[NSMutableDictionary count](self->_dispatchQueues, "count");
  *(unsigned int *)((char *)&a3->var14 + 2) = v22;
  uint64_t v23 = (char *)&v19[*(unsigned int *)((char *)&a3->var13 + 2)];
  unint64_t v24 = v22;
  -[NSMutableDictionary allValues](self->_dispatchQueues, "allValues");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v23, v24, v25, v9);

  uint64_t v26 = &v23[8 * *(unsigned int *)((char *)&a3->var14 + 2)];
  uint64_t v5 = v26 + 109 - (char *)a3;
  if (v5 > (int64_t)-[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
  {
LABEL_28:
    int v137 = *__error();
    _sa_logt();
    uint64_t v107 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      id v136 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v108 = [v136 UTF8String];
      int v109 = *(_DWORD *)((char *)&a3->var11 + 2);
      int v110 = *(_DWORD *)((char *)&a3->var11 + 6);
      int v111 = *(unsigned int *)((char *)&a3->var12 + 2);
      int v112 = *(unsigned int *)((char *)&a3->var13 + 2);
      int v113 = *(unsigned int *)((char *)&a3->var14 + 2);
      unint64_t v114 = -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136316930;
      uint64_t v139 = v108;
      __int16 v140 = 1024;
      *(_DWORD *)uint64_t v141 = v109;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v110;
      LOWORD(v142) = 1024;
      *(_DWORD *)((char *)&v142 + 2) = v111;
      HIWORD(v142) = 1024;
      int v143 = v112;
      __int16 v144 = 1024;
      int v145 = v113;
      __int16 v146 = 2048;
      uint64_t v147 = v5;
      __int16 v148 = 2048;
      unint64_t v149 = v114;
      _os_log_error_impl( &dword_186C92000,  v107,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended with length %ld, should be %lu",  buf,  0x3Eu);
    }

    *__error() = v137;
    id v115 = -[SATask debugDescription](self, "debugDescription");
    char v116 = [v115 UTF8String];
    -[SATask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage( 2918,  "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended wi th length %ld, should be %lu",  v117,  v118,  v119,  v120,  v121,  v122,  v116);

    _os_crash();
    __break(1u);
LABEL_31:
    int v123 = *__error();
    _sa_logt();
    uint64_t v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      id v125 = -[SATask debugDescription](self, "debugDescription");
      uint64_t v126 = [v125 UTF8String];
      uint64_t v127 = -[NSMutableDictionary count](self->_swiftTasks, "count");
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v126;
      __int16 v140 = 2048;
      *(void *)uint64_t v141 = v127;
      _os_log_error_impl(&dword_186C92000, v124, OS_LOG_TYPE_ERROR, "%s: %lu swiftTasks", buf, 0x16u);
    }

    *__error() = v123;
    id v128 = -[SATask debugDescription](self, "debugDescription");
    char v129 = [v128 UTF8String];
    -[NSMutableDictionary count](self->_swiftTasks, "count");
    _SASetCrashLogMessage(2941, "%s: %lu swiftTasks", v130, v131, v132, v133, v134, v135, v129);

    _os_crash();
    __break(1u);
  }

  *(void *)uint64_t v26 = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleBuildVersion, v9);
  *((void *)v26 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProjectName, v9);
  *((void *)v26 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleSourceVersion, v9);
  *((void *)v26 + 3) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProductBuildVersion, v9);
  *((void *)v26 + 7) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainBinary, v9);
  *((void *)v26 + 4) = -1LL;
  *((void *)v26 + 5) = SASerializableIndexForPointerFromSerializationDictionary(self->_installerVersionID, v9);
  *((void *)v26 + 8) = self->_adamID;
  *((void *)v26 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_vendorID, v9);
  *((void *)v26 + 9) = SASerializableIndexForPointerFromSerializationDictionary(self->_appType, v9);
  *((void *)v26 + 10) = SASerializableIndexForPointerFromSerializationDictionary(self->_cohortID, v9);
  BYTE6(a3->var19) = BYTE6(a3->var19) & 0xDF | (32 * self->_isBeta);
  *((void *)v26 + 11) = SASerializableIndexForPointerFromSerializationDictionary(self->_pidStartTimestamp, v9);
  v26[96] = self->_developerType;
  *(void *)(v26 + 97) = self->_resourceCoalitionID;
  unsigned int v27 = -[NSMutableDictionary count](self->_swiftTasks, "count");
  *(_DWORD *)(v26 + 105) = v27;
  unint64_t v28 = v27;
  -[NSMutableDictionary allValues](self->_swiftTasks, "allValues");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v26 + 109, v28, v29, v9);

  unint64_t v30 = (uint64_t *)&v26[8 * *(unsigned int *)(v26 + 105) + 109];
  *unint64_t v30 = SASerializableIndexForPointerFromSerializationDictionary(self->_distributorID, v9);
  v30[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_resourceCoalitionName, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleName, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleBuildVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleProjectName, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleSourceVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:]( self->_bundleProductBuildVersion,  "addSelfToSerializationDictionary:",  v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_execTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_exitTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SAThread addSelfToSerializationDictionary:](self->_mainThread, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_mainBinaryPath, "addSelfToSerializationDictionary:", v4);
    -[SABinary addSelfToSerializationDictionary:](self->_mainBinary, "addSelfToSerializationDictionary:", v4);
    -[SASharedCache addSelfToSerializationDictionary:](self->_sharedCache, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_installerVersionID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_vendorID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_distributorID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_appType, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_cohortID, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_pidStartTimestamp, "addSelfToSerializationDictionary:", v4);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v7 = self->_rootFrames;
    uint64_t v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * v11++) addSelfToSerializationDictionary:v4];
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
      }

      while (v9);
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    char v12 = self->_binaryLoadInfos;
    uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v16++) addSelfToSerializationDictionary:v4];
        }

        while (v14 != v16);
        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
      }

      while (v14);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    uint64_t v17 = self->_taskStates;
    uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v35,  v47,  16LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        uint64_t v21 = 0LL;
        do
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v21++) addSelfToSerializationDictionary:v4];
        }

        while (v19 != v21);
        uint64_t v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v35,  v47,  16LL);
      }

      while (v19);
    }

    threads = self->_threads;
    uint64_t v23 = MEMORY[0x1895F87A8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke;
    v33[3] = &unk_189F61FD8;
    id v24 = v4;
    id v34 = v24;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](threads, "enumerateKeysAndObjectsUsingBlock:", v33);
    dispatchQueues = self->_dispatchQueues;
    v31[0] = v23;
    v31[1] = 3221225472LL;
    v31[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2;
    v31[3] = &unk_189F647F8;
    id v26 = v24;
    id v32 = v26;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dispatchQueues, "enumerateKeysAndObjectsUsingBlock:", v31);
    swiftTasks = self->_swiftTasks;
    v29[0] = v23;
    v29[1] = 3221225472LL;
    v29[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3;
    v29[3] = &unk_189F64820;
    id v28 = v26;
    id v30 = v28;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](swiftTasks, "enumerateKeysAndObjectsUsingBlock:", v29);
    -[NSString addSelfToSerializationDictionary:]( self->_resourceCoalitionName,  "addSelfToSerializationDictionary:",  v28);
  }
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x77)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v29 = a4;
      __int16 v30 = 2048;
      *(void *)unint64_t v31 = 120LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(3013, "bufferLength %lu < serialized SATask struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)(vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82))
     + 120 > a4)
  {
LABEL_8:
    int v14 = *__error();
    _sa_logt();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 66);
      int v17 = *(_DWORD *)(v5 + 70);
      int v18 = *(_DWORD *)(v5 + 74);
      int v19 = *(_DWORD *)(v5 + 78);
      int v20 = *(_DWORD *)(v5 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v29 = a4;
      __int16 v30 = 1024;
      *(_DWORD *)unint64_t v31 = v16;
      *(_WORD *)&void v31[4] = 1024;
      *(_DWORD *)&v31[6] = v17;
      __int16 v32 = 1024;
      int v33 = v18;
      __int16 v34 = 1024;
      int v35 = v19;
      __int16 v36 = 1024;
      int v37 = v20;
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 3014,  "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v21,  v22,  v23,  v24,  v25,  v26,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SATask version",  0LL);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }

  +[SATask taskWithPid:uniquePid:name:sharedCache:]( (uint64_t)&OBJC_CLASS___SATask,  *(unsigned int *)((char *)a3 + 2),  *(void *)((char *)a3 + 18),  0LL,  0LL);
  id result = (id)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)result + 19) = *(_DWORD *)(v5 + 2);
  *((_DWORD *)result + 20) = *(_DWORD *)(v5 + 6);
  *((_DWORD *)result + 21) = *(_DWORD *)(v5 + 10);
  *((_DWORD *)result + 22) = *(_DWORD *)(v5 + 14);
  *((void *)result + 12) = *(void *)(v5 + 18);
  *((void *)result + 30) = *(void *)(v5 + 58);
  *((void *)result + 36) = *(void *)(v5 + 110);
  *((_BYTE *)result + 67) = *(_BYTE *)(v5 + 118) & 1;
  *((_BYTE *)result + 68) = (*(_BYTE *)(v5 + 118) & 2) != 0;
  *((_BYTE *)result + 69) = (*(_BYTE *)(v5 + 118) & 4) != 0;
  *((_BYTE *)result + 70) = (*(_BYTE *)(v5 + 118) & 0x10) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v313 = *MEMORY[0x1895F89C0];
  id v12 = a5;
  id v13 = a6;
  if (a4 <= 0x77)
  {
    int v149 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v302 = a4;
      __int16 v303 = 2048;
      *(void *)v304 = 120LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct %lu",  buf,  0x16u);
    }

    *__error() = v149;
    _SASetCrashLogMessage( 3037,  "bufferLength %lu < serialized SATask struct %lu",  v150,  v151,  v152,  v153,  v154,  v155,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }

  uint64_t v296 = 8LL * (vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82));
  if (v296 + 120 > a4)
  {
LABEL_52:
    int v156 = *__error();
    _sa_logt();
    uint64_t v157 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      int v158 = *(_DWORD *)((char *)a3 + 66);
      int v159 = *(_DWORD *)((char *)a3 + 70);
      int v160 = *(_DWORD *)((char *)a3 + 74);
      int v161 = *(_DWORD *)((char *)a3 + 78);
      int v162 = *(_DWORD *)((char *)a3 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = a4;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v158;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v159;
      __int16 v305 = 1024;
      int v306 = v160;
      __int16 v307 = 1024;
      int v308 = v161;
      __int16 v309 = 1024;
      int v310 = v162;
      _os_log_error_impl( &dword_186C92000,  v157,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v156;
    _SASetCrashLogMessage( 3039,  "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v163,  v164,  v165,  v166,  v167,  v168,  a4);
    _os_crash();
    __break(1u);
LABEL_55:
    int v169 = *__error();
    _sa_logt();
    uint64_t v170 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      int v171 = *(_DWORD *)(v6 + 66);
      int v172 = *(_DWORD *)(v6 + 70);
      int v173 = *(_DWORD *)(v6 + 74);
      int v174 = *(_DWORD *)(v6 + 78);
      int v175 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v171;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v172;
      __int16 v305 = 1024;
      int v306 = v173;
      __int16 v307 = 1024;
      int v308 = v174;
      __int16 v309 = 1024;
      int v310 = v175;
      _os_log_error_impl( &dword_186C92000,  v170,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v169;
    _SASetCrashLogMessage( 3086,  "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v176,  v177,  v178,  v179,  v180,  v181,  (char)a3);
    _os_crash();
    __break(1u);
LABEL_58:
    int v182 = *__error();
    _sa_logt();
    uint64_t v183 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      int v184 = *(_DWORD *)(v6 + 66);
      int v185 = *(_DWORD *)(v6 + 70);
      int v186 = *(_DWORD *)(v6 + 74);
      int v187 = *(_DWORD *)(v6 + 78);
      int v188 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v184;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v185;
      __int16 v305 = 1024;
      int v306 = v186;
      __int16 v307 = 1024;
      int v308 = v187;
      __int16 v309 = 1024;
      int v310 = v188;
      _os_log_error_impl( &dword_186C92000,  v183,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v182;
    _SASetCrashLogMessage( 3113,  "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v189,  v190,  v191,  v192,  v193,  v194,  (char)a3);
    _os_crash();
    __break(1u);
LABEL_61:
    int v195 = *__error();
    _sa_logt();
    id v196 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      int v197 = *(_DWORD *)(v6 + 66);
      int v198 = *(_DWORD *)(v6 + 70);
      int v199 = *(_DWORD *)(v6 + 74);
      int v200 = *(_DWORD *)(v6 + 78);
      int v201 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v197;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v198;
      __int16 v305 = 1024;
      int v306 = v199;
      __int16 v307 = 1024;
      int v308 = v200;
      __int16 v309 = 1024;
      int v310 = v201;
      _os_log_error_impl( &dword_186C92000,  v196,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v195;
    _SASetCrashLogMessage( 3125,  "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v202,  v203,  v204,  v205,  v206,  v207,  (char)a3);
    _os_crash();
    __break(1u);
LABEL_64:
    int v208 = *__error();
    _sa_logt();
    unint64_t v209 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
    {
      int v210 = *(_DWORD *)(v6 + 66);
      int v211 = *(_DWORD *)(v6 + 70);
      int v212 = *(_DWORD *)(v6 + 74);
      int v213 = *(_DWORD *)(v6 + 78);
      int v214 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v210;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v211;
      __int16 v305 = 1024;
      int v306 = v212;
      __int16 v307 = 1024;
      int v308 = v213;
      __int16 v309 = 1024;
      int v310 = v214;
      _os_log_error_impl( &dword_186C92000,  v209,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v208;
    _SASetCrashLogMessage( 3141,  "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v215,  v216,  v217,  v218,  v219,  v220,  (char)a3);
    _os_crash();
    __break(1u);
LABEL_67:
    int v221 = *__error();
    _sa_logt();
    unint64_t v222 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      int v223 = *(_DWORD *)(v300 + 66);
      int v224 = *(_DWORD *)(v300 + 70);
      int v225 = *(_DWORD *)(v300 + 74);
      int v226 = *(_DWORD *)(v300 + 78);
      int v227 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v223;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v224;
      __int16 v305 = 1024;
      int v306 = v225;
      __int16 v307 = 1024;
      int v308 = v226;
      __int16 v309 = 1024;
      int v310 = v227;
      _os_log_error_impl( &dword_186C92000,  v222,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v221;
    _SASetCrashLogMessage( 3153,  "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v228,  v229,  v230,  v231,  v232,  v233,  (char)v298);
    _os_crash();
    __break(1u);
LABEL_70:
    int v234 = *__error();
    _sa_logt();
    __int16 v235 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
    {
      int v236 = *(_DWORD *)(v300 + 66);
      int v237 = *(_DWORD *)(v300 + 70);
      int v238 = *(_DWORD *)(v300 + 74);
      int v239 = *(_DWORD *)(v300 + 78);
      int v240 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v236;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v237;
      __int16 v305 = 1024;
      int v306 = v238;
      __int16 v307 = 1024;
      int v308 = v239;
      __int16 v309 = 1024;
      int v310 = v240;
      _os_log_error_impl( &dword_186C92000,  v235,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  buf,  0x2Au);
    }

    *__error() = v234;
    _SASetCrashLogMessage( 3164,  "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues",  v241,  v242,  v243,  v244,  v245,  v246,  (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_73;
  }

  int v14 = v13;
  v298 = (const void *)a4;
  unint64_t v15 = *(void *)((char *)a3 + 26);
  int v16 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  int v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v17;

  unint64_t v19 = *(void *)((char *)a3 + 34);
  int v20 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v12, v14, v20, 0);
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleName = self->_bundleName;
  self->_bundleName = v21;

  unint64_t v23 = *(void *)((char *)a3 + 42);
  uint64_t v24 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v23, v12, v14, v24, 0);
  uint64_t v25 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  execTimestamp = self->_execTimestamp;
  self->_execTimestamp = v25;

  unint64_t v27 = *(void *)((char *)a3 + 50);
  id v28 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v12, v14, v28, 0);
  unint64_t v29 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v29;

  unint64_t v31 = *(void *)((char *)a3 + 86);
  __int16 v32 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v12, v14, v32, 0);
  int v33 = (SAThread *)objc_claimAutoreleasedReturnValue();
  mainThread = self->_mainThread;
  self->_mainThread = v33;

  unint64_t v35 = *(void *)((char *)a3 + 94);
  __int16 v36 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v35, v12, v14, v36, 0);
  int v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  mainBinaryPath = self->_mainBinaryPath;
  self->_mainBinaryPath = v37;

  unint64_t v39 = *(void *)((char *)a3 + 102);
  __int128 v40 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v39, v12, v14, v40, 0);
  __int128 v41 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
  sharedCache = self->_sharedCache;
  self->_sharedCache = v41;

  if (!self->_sharedCache) {
    self->_hasNoSharedCache = 1;
  }
  uint64_t v43 = *(unsigned int *)((char *)a3 + 66);
  __int128 v44 = (char *)a3 + 8 * v43 + 120;
  v300 = (char *)a3;
  uint64_t v45 = *(unsigned int *)((char *)a3 + 70);
  __int128 v46 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v44, v45, v12, v14, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  id v48 = (NSArray *)[v47 copy];
  binaryLoadInfos = self->_binaryLoadInfos;
  self->_binaryLoadInfos = v48;

  uint64_t v50 = *(unsigned int *)((char *)a3 + 66);
  uint64_t v51 = (void *)objc_opt_class();
  uint64_t v52 = v50;
  BOOL v6 = (char *)a3;
  SASerializableNewMutableSetFromIndexList((uint64_t)a3 + 120, v52, v12, v14, v51);
  uint64_t v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v53;

  uint64_t v55 = *(unsigned int *)((char *)a3 + 70);
  uint64_t v56 = *(unsigned int *)(v6 + 74);
  __int128 v57 = (void *)objc_opt_class();
  uint64_t v292 = (uint64_t)&v44[8 * v55];
  SASerializableNewMutableArrayFromIndexList(v292, v56, v12, v14, v57);
  id v58 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  taskStates = self->_taskStates;
  self->_taskStates = v58;

  uint64_t v60 = *(unsigned int *)(v6 + 74);
  id v61 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(unsigned int *)(v6 + 78)];
  threads = self->_threads;
  self->_threads = v61;

  uint64_t v63 = 8 * v43;
  uint64_t v294 = 8 * v43;
  uint64_t v295 = v55;
  uint64_t v299 = v60;
  if (*(_DWORD *)(v6 + 78))
  {
    unint64_t v64 = 0LL;
    uint64_t v65 = (uint64_t)&v6[8 * v60 + 120 + 8 * v55 + v63];
    do
    {
      unint64_t v66 = *(void *)(v65 + 8 * v64);
      uint64_t v67 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v66,  v12,  v14,  v67,  0);
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      int v69 = self->_threads;
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v68, "threadId"));
      int v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      __int16 v70 = v69;
      BOOL v6 = v300;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", v68, v7);

      ++v64;
      unint64_t v71 = *(unsigned int *)(v300 + 78);
    }

    while (v64 < v71);
    uint64_t v55 = v295;
    uint64_t v60 = v299;
  }

  else
  {
    LODWORD(v71) = 0;
  }

  uint64_t v72 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(unsigned int *)(v6 + 82)];
  dispatchQueues = self->_dispatchQueues;
  self->_dispatchQueues = v72;

  uint64_t v291 = v71;
  if (*(_DWORD *)(v6 + 82))
  {
    unint64_t v74 = 0LL;
    uint64_t v75 = (uint64_t)&v6[8 * v71 + 120 + 8 * v60 + 8 * v55 + v294];
    do
    {
      unint64_t v76 = *(void *)(v75 + 8 * v74);
      uint64_t v77 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v76,  v12,  v14,  v77,  0);
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v79 = self->_dispatchQueues;
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v78, "identifier"));
      int v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      uint64_t v80 = v79;
      BOOL v6 = v300;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v80, "setObject:forKeyedSubscript:", v78, v7);

      ++v74;
      unint64_t v81 = *(unsigned int *)(v300 + 82);
    }

    while (v74 < v81);
  }

  else
  {
    LODWORD(v81) = 0;
  }

  a3 = v298;
  int v7 = (unint64_t *)(v292 + 8 * v299 + 8LL * v71 + 8LL * v81);
  unint64_t v82 = *v7;
  uint64_t v83 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v82, v12, v14, v83, 0);
  id v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleBuildVersion = self->_bundleBuildVersion;
  self->_bundleBuildVersion = v84;

  unint64_t v86 = v7[1];
  id v87 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v86, v12, v14, v87, 0);
  char v88 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProjectName = self->_bundleProjectName;
  self->_bundleProjectName = v88;

  unint64_t v90 = v7[2];
  uint64_t v91 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v90, v12, v14, v91, 0);
  uint64_t v92 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleSourceVersion = self->_bundleSourceVersion;
  self->_bundleSourceVersion = v92;

  unint64_t v94 = v7[3];
  int v95 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v94, v12, v14, v95, 0);
  uint64_t v96 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProductBuildVersion = self->_bundleProductBuildVersion;
  self->_bundleProductBuildVersion = v96;

  if (!self->_adamID)
  {
    unint64_t v98 = v7[4];
    uint64_t v99 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v98, v12, v14, v99, 0);
    char v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      id v101 = objc_alloc_init(MEMORY[0x189607978]);
      [v101 numberFromString:v100];
      uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v103 = v102;
      if (v102)
      {
        self->_adamID = [v102 unsignedLongLongValue];
      }

      else
      {
        id v293 = v101;
        int v290 = *__error();
        _sa_logt();
        uint64_t v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v302 = (unint64_t)v100;
          _os_log_fault_impl(&dword_186C92000, v104, OS_LOG_TYPE_FAULT, "Unable to parse commerceAppID %@", buf, 0xCu);
        }

        *__error() = v290;
        id v101 = v293;
      }

      BOOL v6 = v300;
    }
  }

  unint64_t v105 = v7[5];
  uint64_t v106 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v105, v12, v14, v106, 0);
  uint64_t v107 = (NSString *)objc_claimAutoreleasedReturnValue();
  installerVersionID = self->_installerVersionID;
  self->_installerVersionID = v107;

  unint64_t v109 = v7[6];
  int v110 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v109, v12, v14, v110, 0);
  int v111 = (NSString *)objc_claimAutoreleasedReturnValue();
  vendorID = self->_vendorID;
  self->_vendorID = v111;

  unint64_t v113 = v7[7];
  unint64_t v114 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v113, v12, v14, v114, 0);
  id v115 = (SABinary *)objc_claimAutoreleasedReturnValue();
  mainBinary = self->_mainBinary;
  self->_mainBinary = v115;

  self->_adamID = v7[8];
  unint64_t v117 = v7[9];
  uint64_t v118 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v117, v12, v14, v118, 0);
  uint64_t v119 = (NSString *)objc_claimAutoreleasedReturnValue();
  appType = self->_appType;
  self->_appType = v119;

  unint64_t v121 = v7[10];
  uint64_t v122 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v121, v12, v14, v122, 0);
  int v123 = (NSString *)objc_claimAutoreleasedReturnValue();
  cohortID = self->_cohortID;
  self->_cohortID = v123;

  self->_isBeta = (v6[118] & 0x20) != 0;
  unint64_t v125 = v7[11];
  uint64_t v126 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v125, v12, v14, v126, 0);
  uint64_t v127 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  pidStartTimestamp = self->_pidStartTimestamp;
  self->_pidStartTimestamp = v127;

  self->_developerType = *((_BYTE *)v7 + 96);
  unsigned int v129 = v6[1];
  if (v129 < 6) {
    goto LABEL_48;
  }
  self->_resourceCoalitionID = *(unint64_t *)((char *)v7 + 97);
  if (v129 < 7) {
    goto LABEL_48;
  }
  unint64_t v297 = v296 + 229 + 8LL * *(unsigned int *)((char *)v7 + 105);
  if (v297 > (unint64_t)v298)
  {
LABEL_73:
    int v247 = *__error();
    _sa_logt();
    int v248 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
    {
      int v249 = *(_DWORD *)(v300 + 66);
      int v250 = *(_DWORD *)(v300 + 70);
      int v251 = *(_DWORD *)(v300 + 74);
      int v252 = *(_DWORD *)(v300 + 78);
      int v253 = *(_DWORD *)(v300 + 82);
      int v254 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v249;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v250;
      __int16 v305 = 1024;
      int v306 = v251;
      __int16 v307 = 1024;
      int v308 = v252;
      __int16 v309 = 1024;
      int v310 = v253;
      __int16 v311 = 1024;
      int v312 = v254;
      _os_log_error_impl( &dword_186C92000,  v248,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  buf,  0x30u);
    }

    *__error() = v247;
    _SASetCrashLogMessage( 3167,  "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  v255,  v256,  v257,  v258,  v259,  v260,  (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_76;
  }

  uint64_t v130 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(unsigned int *)((char *)v7 + 105)];
  swiftTasks = self->_swiftTasks;
  self->_swiftTasks = v130;

  if (*(_DWORD *)((char *)v7 + 105))
  {
    unint64_t v132 = 0LL;
    uint64_t v133 = (uint64_t)&v6[8 * v81 + 229 + 8 * v291 + 8 * v299 + 8 * v295 + v294];
    do
    {
      unint64_t v134 = *(void *)(v133 + 8 * v132);
      uint64_t v135 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v134,  v12,  v14,  v135,  0);
      id v136 = (void *)objc_claimAutoreleasedReturnValue();
      int v137 = self->_swiftTasks;
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v136, "identifier"));
      uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v137, "setObject:forKeyedSubscript:", v136, v138);

      ++v132;
      unint64_t v139 = *(unsigned int *)((char *)v7 + 105);
    }

    while (v132 < v139);
  }

  else
  {
    unint64_t v139 = 0LL;
  }

  if (v297 + 8 > (unint64_t)v298)
  {
LABEL_76:
    int v261 = *__error();
    _sa_logt();
    v262 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
    {
      int v263 = *(_DWORD *)(v300 + 66);
      int v264 = *(_DWORD *)(v300 + 70);
      int v265 = *(_DWORD *)(v300 + 74);
      int v266 = *(_DWORD *)(v300 + 78);
      int v267 = *(_DWORD *)(v300 + 82);
      int v268 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v263;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v264;
      __int16 v305 = 1024;
      int v306 = v265;
      __int16 v307 = 1024;
      int v308 = v266;
      __int16 v309 = 1024;
      int v310 = v267;
      __int16 v311 = 1024;
      int v312 = v268;
      _os_log_error_impl( &dword_186C92000,  v262,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  buf,  0x30u);
    }

    *__error() = v261;
    _SASetCrashLogMessage( 3182,  "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  v269,  v270,  v271,  v272,  v273,  v274,  (char)v298);
    _os_crash();
    __break(1u);
LABEL_79:
    int v275 = *__error();
    _sa_logt();
    v276 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
    {
      int v277 = *(_DWORD *)(v300 + 66);
      int v278 = *(_DWORD *)(v300 + 70);
      int v279 = *(_DWORD *)(v300 + 74);
      int v280 = *(_DWORD *)(v300 + 78);
      int v281 = *(_DWORD *)(v300 + 82);
      int v282 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v277;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v278;
      __int16 v305 = 1024;
      int v306 = v279;
      __int16 v307 = 1024;
      int v308 = v280;
      __int16 v309 = 1024;
      int v310 = v281;
      __int16 v311 = 1024;
      int v312 = v282;
      _os_log_error_impl( &dword_186C92000,  v276,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  buf,  0x30u);
    }

    *__error() = v275;
    _SASetCrashLogMessage( 3193,  "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks",  v283,  v284,  v285,  v286,  v287,  v288,  (char)v298);
    _os_crash();
    __break(1u);
LABEL_82:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SATask version",  0LL);
    id v289 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v289);
  }

  __int16 v140 = (unint64_t *)((char *)&v7[v139 + 13] + 5);
  unint64_t v141 = *v140;
  unint64_t v142 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v141, v12, v14, v142, 0);
  int v143 = (NSString *)objc_claimAutoreleasedReturnValue();
  distributorID = self->_distributorID;
  self->_distributorID = v143;

  if (v300[1] >= 9u)
  {
    if (v297 + 16 <= (unint64_t)v298)
    {
      unint64_t v145 = v140[1];
      __int16 v146 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v145,  v12,  v14,  v146,  0);
      uint64_t v147 = (NSString *)objc_claimAutoreleasedReturnValue();
      resourceCoalitionName = self->_resourceCoalitionName;
      self->_resourceCoalitionName = v147;

      goto LABEL_48;
    }

    goto LABEL_79;
  }

+ (double)taskWithoutReferencesFromPAStyleSerializedTask:(uint64_t)a1
{
  uint64_t v3 = (int *)+[SATask taskWithPid:uniquePid:name:sharedCache:]( (uint64_t)&OBJC_CLASS___SATask,  *(unsigned int *)(a2 + 8),  *(void *)(a2 + 40),  0LL,  0LL);
  if (*((void *)v3 + 12) == -1LL) {
    *((void *)v3 + 12) = v3[19];
  }
  v3[20] = *(_DWORD *)(a2 + 12);
  v3[21] = *(_DWORD *)(a2 + 16);
  v3[22] = *(_DWORD *)(a2 + 20);
  if (*(void *)a2 <= 0xF33DFAC5uLL)
  {
    *((_BYTE *)v3 + 67) = *(_BYTE *)(a2 + 56);
    *((_BYTE *)v3 + 68) = *(_BYTE *)(a2 + 57);
    *((_BYTE *)v3 + 69) = *(_BYTE *)(a2 + 58);
    double result = *(double *)(a2 + 62);
    *((double *)v3 + 30) = result;
    *((void *)v3 + 36) = *(void *)(a2 + 87);
  }

  else
  {
    *((_BYTE *)v3 + 67) = *(_BYTE *)(a2 + 56);
    *((_BYTE *)v3 + 68) = *(_BYTE *)(a2 + 57);
    *((_BYTE *)v3 + 69) = *(_BYTE *)(a2 + 58);
    double result = *(double *)(a2 + 60);
    *((double *)v3 + 30) = result;
    *((void *)v3 + 36) = *(void *)(a2 + 84);
    if (*(void *)a2 > 0xF33DFAC6uLL) {
      *((_BYTE *)v3 + 70) = *(_BYTE *)(a2 + 100);
    }
  }

  return result;
}

- (void)populateReferencesUsingPAStyleSerializedTask:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v52 = a3;
  id v7 = a4;
  if (a1)
  {
    unint64_t v8 = a2[3];
    uint64_t v9 = (void *)objc_opt_class();
    uint64_t v10 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v8, v52, v7, v9, 0);
    uint64_t v11 = (void *)a1[7];
    a1[7] = v10;

    unint64_t v12 = a2[4];
    id v13 = (void *)objc_opt_class();
    uint64_t v14 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v52, v7, v13, 0);
    unint64_t v15 = (void *)a1[13];
    a1[13] = v14;

    uint64_t v16 = *a2;
    if (*a2 == 4080925383LL)
    {
      int v17 = (void *)((char *)a2 + 68);
      int v18 = (void *)((char *)a2 + 76);
      uint64_t v19 = 101LL;
    }

    else if (v16 == 4080925382LL)
    {
      int v17 = (void *)((char *)a2 + 68);
      int v18 = (void *)((char *)a2 + 76);
      uint64_t v19 = 100LL;
    }

    else
    {
      if (v16 != 4080925381LL) {
        goto LABEL_22;
      }
      int v17 = (void *)((char *)a2 + 70);
      int v18 = (void *)((char *)a2 + 78);
      uint64_t v19 = 103LL;
    }

    uint64_t v20 = *v17;
    uint64_t v21 = *v18;
    uint64_t v22 = (void *)((char *)a2 + v19);
    if (*v17)
    {
      uint64_t v51 = a2;
      unint64_t v23 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v20];
      uint64_t v50 = v22;
      uint64_t v24 = v22;
      uint64_t v25 = v20;
      while (1)
      {
        unint64_t v26 = *v24++;
        unint64_t v27 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v26,  v52,  v7,  v27,  0);
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28) {
          break;
        }
        __int16 v30 = v28;
        id v31 = objc_getProperty(v28, v29, 8LL, 1);
        [v23 addObject:v31];

        if (!--v25)
        {
          uint64_t v32 = [v23 copy];
          int v33 = (void *)a1[31];
          a1[31] = v32;

          uint64_t v22 = v50;
          a2 = v51;
          goto LABEL_13;
        }
      }

      for (uint64_t i = @"Failed to deserialize paImageInfo"; ; uint64_t i = @"Bad SAPAStyleTimeInsensitiveTaskData magic")
      {
LABEL_21:
        +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  i,  0LL);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v49);
LABEL_22:
        ;
      }
    }

- (id)removeStacksOutsideThisProcess
{
  if (!a1) {
    return 0LL;
  }
  [*(id *)(a1 + 280) objectsPassingTest:&__block_literal_global_495];
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 anyObject];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SAStackIterator);
    [*(id *)(a1 + 280) removeObject:v3];
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SAFrame);
    BOOL v6 = v5;
    if (v5) {
      v5->_BOOLs.bits |= 8u;
    }
    [*(id *)(a1 + 280) addObject:v5];
    id v7 = *(void **)(a1 + 16);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2;
    v12[3] = &unk_189F644D8;
    id v8 = v3;
    id v13 = v8;
    uint64_t v14 = v4;
    uint64_t v15 = a1;
    uint64_t v9 = v4;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    id v10 = v8;
  }

  return v3;
}

uint64_t __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t result = [a2 isTruncatedBacktraceFrame];
  if ((_DWORD)result) {
    *a3 = 1;
  }
  return result;
}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3;
  v7[3] = &unk_189F644B0;
  id v8 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  [a3 enumerateThreadStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:0 block:v7];
}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3(void *a1, void *a2)
{
  self = a2;
  [self stack];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)a1[4];

  if (v4 == v5)
  {
    id v7 = (void *)a1[5];
    if (v7)
    {
      objc_setProperty_atomic(v7, v6, v3, 8LL);
      id v8 = (void *)a1[5];
    }

    else
    {
      id v8 = 0LL;
    }

    -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:](a1[6], v8, 0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self) {
      objc_setProperty_atomic(self, v9, v10, 64LL);
    }
  }
}

@end