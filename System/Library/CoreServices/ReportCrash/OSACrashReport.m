@interface OSACrashReport
+ (BOOL)isInLDM;
+ (id)loadBuildInfo:(id)a3;
+ (id)loadStoreInfo:(id)a3 atURL:(id)a4 forPlatform:(unsigned int)a5;
+ (id)parentBundleURLForAppExtensionBundleURL:(id)a3 error:(id)a4;
- (BOOL)_isMTECrash;
- (BOOL)_isMemoryImmutableAtAddress:(unint64_t)a3;
- (BOOL)_isPGMCrashType;
- (BOOL)isActionable;
- (BOOL)isExceptionNonFatal;
- (BOOL)is_beta;
- (BOOL)is_simulated;
- (BOOL)needsUrgentSubmission;
- (BOOL)saveWithOptions:(id)a3;
- (BOOL)shouldEnableUrgentSubmission;
- (BOOL)validKcdataItem:(kcdata_iter)a3 min_size:(unint64_t)a4;
- (NSMutableString)logWritingSignatureFrames;
- (NSString)bundle_id;
- (NSString)coalitionName;
- (NSString)logWritingSignature;
- (NSString)procName;
- (NSString)responsibleProc;
- (NSString)short_vers;
- (OSACrashReport)initWithTask:(unsigned int)a3 exceptionType:(int)a4 thread:(unsigned int)a5 threadId:(unint64_t)a6 threadStateFlavor:(int)a7 threadState:(unsigned int)a8[1296] threadStateCount:(unsigned int)a9;
- (OSAExclaveContainer)exclaveContainer;
- (_CSRange)_getObjCReadOnlyRange:(_CSTypeRef)a3;
- (_CSTypeRef)_getSymbolicator:(BOOL)a3;
- (_VMURange)_regionAtAddress:(unint64_t)a3 immutableCheck:(BOOL *)a4;
- (char)_copyStringFromTask:(unsigned int)a3 atAddress:(unint64_t)a4 maxLength:(unint64_t)a5 immutableCheck:(BOOL *)a6;
- (id)_descriptionForException:(id)a3;
- (id)_extractMallocTraceInfo:(id *)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5;
- (id)_findContainingRegion:(id)a3 address:(unint64_t)a4;
- (id)_findContainingTextSegmentRegion:(id)a3 address:(unint64_t)a4;
- (id)_objcSelectorNameForMessenger:(id)a3;
- (id)_readDataAtAddress:(unint64_t)a3 size:(unint64_t)a4;
- (id)_readIndirectImmutableStringFromSymbol:(const char *)a3 symbolOwner:(_CSTypeRef)a4;
- (id)_readMallocZoneArray:(_CSTypeRef)a3;
- (id)_readMallocZoneArrayFromMemory:(mapped_memory_t *)a3 usingSymbolicator:(_CSTypeRef)a4;
- (id)_readStringAtTaskAddress:(unint64_t)a3 maxLength:(unint64_t)a4 immutableCheck:(BOOL *)a5;
- (id)_symbolicateRegister:(unint64_t)a3 inRange:(_CSRange)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)composeFrame:(id)a3 info:(id)a4;
- (id)create_os_fault_section;
- (id)decode_cpuType;
- (id)decode_crashingThreadStateWithSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (id)decode_esr:(unsigned int *)a3 exceptionStateCount:(unsigned int)a4;
- (id)decode_exceptionCodes;
- (id)decode_exceptionType;
- (id)decode_reason;
- (id)decode_reasonBTC;
- (id)decode_reasonBacklightServices;
- (id)decode_reasonCarousel;
- (id)decode_reasonCodeSigning;
- (id)decode_reasonCoreAnimation;
- (id)decode_reasonExec;
- (id)decode_reasonLibSystem;
- (id)decode_reasonLibxpc;
- (id)decode_reasonMetal;
- (id)decode_reasonNamespace;
- (id)decode_reasonPortSpace;
- (id)decode_reasonSandbox;
- (id)decode_reasonTcc;
- (id)decode_reasonWatchKit;
- (id)decode_reasonWatchdog;
- (id)decode_signal;
- (id)decode_threadState:(unsigned int *)a3 threadStateCount:(unsigned int)a4 threadStateFlavor:(int)a5 threadPort:(unsigned int)a6 exceptionState:(unsigned int)a7[1296] exceptionStateCount:(unsigned int)a8 withSymbolicator:(_CSTypeRef)a9 usingCatalog:(id)a10;
- (id)decode_threadState:(unsigned int)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5;
- (id)decode_ubsanCode:(unsigned __int8)a3;
- (id)decode_versionCodes:(unsigned __int16)a3[4];
- (id)getNotificationInfo;
- (id)getObserverInfo;
- (id)getTrialCache;
- (id)nameFromPid:(int)a3;
- (id)pathFromPid:(int)a3;
- (id)problemType;
- (id)reportNamePrefix;
- (id)safe_encoder:(unsigned int)a3;
- (id)slice_uuid;
- (id)terminationReasonExceptionCode;
- (int)_regionInfoAtAddress:(unint64_t)a3 regionInfo:(vm_region_submap_short_info_64 *)a4 regionAddress:(unint64_t *)a5 regionSize:(unint64_t *)a6;
- (int)exceptionType;
- (int)proc_id;
- (int64_t)codeZeroForGuardException;
- (unint64_t)_findMallocZone:(id)a3 usingSymbolicator:(_CSTypeRef)a4;
- (unint64_t)_objcSelectorAddressForMessenger:(id)a3 memory:(mapped_memory_t *)a4;
- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atAddress:(unint64_t)a4;
- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atSymbol:(_CSTypeRef)a4;
- (unint64_t)crashingAddress;
- (unint64_t)sRouteID;
- (unint64_t)sharedCacheAddress;
- (unsigned)_extractBacktraceInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (unsigned)consecutiveCrashCount;
- (unsigned)throttleTimeout;
- (void)_addASILine:(id)a3 fromOwner:(id)a4 isSafe:(BOOL)a5;
- (void)_extractBinaryImageInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractCrashReporterAnnotationsFromSymbolOwner:(_CSTypeRef)a3 withMemory:(mapped_memory_t *)a4;
- (void)_extractExceptionReasonUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractInfoPlistFromSymbolOwner:(_CSTypeRef)a3;
- (void)_extractLastExceptionBacktraceUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractMemoryErrorReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractPGMLibpasReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractPGMReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractSanitizerReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractVMMap:(_CSTypeRef)a3;
- (void)_extractWorkQueueLimitsFromData:(proc_workqueueinfo *)a3;
- (void)autopsyCorpse;
- (void)autopsyLightweightCorpse:(unint64_t)a3 size:(unint64_t)a4;
- (void)captureDiagInfo:(id)a3;
- (void)checkIfNeedsUrgentSubmission;
- (void)dealloc;
- (void)decode_os_log_fault_payload;
- (void)decode_reasonDyldWithInfo:(id)a3;
- (void)donateToBiome;
- (void)dumpProgramCounterBytes;
- (void)extractThreadStateInfo:(unsigned int)a3;
- (void)finishExtractionUsingCorpse;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)loadBundleInfo;
- (void)parseCorpse:(unint64_t)a3 size:(unint64_t)a4;
- (void)sendToCoreAnalytics;
- (void)sendToMetricKit;
- (void)setApplicationSpecificInformation:(const char *)a3;
- (void)setExclaveContainer:(id)a3;
- (void)setLogWritingSignatureFrames:(id)a3;
- (void)stashStatus:(id)a3 note:(id)a4;
- (void)symbolicateFrame:(unint64_t)a3 adjusted:(unint64_t)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6 andBlock:(id)a7;
- (void)unpackExceptionCodes;
- (void)updateLogWritingSignatureWithSymbol:(id)a3 address:(unint64_t)a4;
- (void)validateProcName;
@end

@implementation OSACrashReport

- (void)stashStatus:(id)a3 note:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  pthread_mutex_lock(&stru_10003EC00);
  v9 = (void *)qword_10003EE58;
  if (!qword_10003EE58)
  {
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
    v11 = (void *)qword_10003EE58;
    qword_10003EE58 = v10;

    v9 = (void *)qword_10003EE58;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proc_id));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);

  if (!v13)
  {
    v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v14);
    v15 = (void *)qword_10003EE58;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proc_id));
    [v15 setObject:v13 forKeyedSubscript:v16];
  }

  if (v6 | v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"process"]);
    if (!v17)
    {
      procName = (const __CFString *)self->_procName;
      if (!procName) {
        procName = @"<unknown>";
      }
      if (self->_is_full_corpse)
      {
        v19 = @"CORPSE";
      }

      else if (self->_is_lightweight_corpse)
      {
        v19 = @"LWCORPSE";
      }

      else
      {
        v19 = @"OTHER?";
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pid %d '%@' %@",  self->_proc_id,  procName,  v19));
      [v13 setObject:v17 forKeyedSubscript:@"process"];
    }

    if (v6)
    {
      [v13 setObject:v6 forKeyedSubscript:@"status"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v60 = v17;
        __int16 v61 = 2114;
        unint64_t v62 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "osa_update: %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    if (v7)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"notes"]);
      if (!v25)
      {
        v25 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v24);
        [v13 setObject:v25 forKeyedSubscript:@"notes"];
      }

      [v25 addObject:v7];
    }
  }

  else
  {
    ++dword_10003EE68;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"process"]);
    if (v20) {
      objc_storeStrong((id *)&qword_10003EE60, v20);
    }
    v21 = (void *)qword_10003EE58;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proc_id));
    [v21 removeObjectForKey:v22];
  }

  if (qword_10003EE70
    || (qword_10003EE78 = 2 * vm_page_size, (qword_10003EE70 = (uint64_t)malloc(2 * vm_page_size)) != 0))
  {
    v50 = v13;
    unint64_t v51 = v7;
    unint64_t v52 = v6;
    v26 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v23);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id obj = (id)qword_10003EE58;
    id v27 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(obj);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_10003EE58 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * (void)i)]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"process"]);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"status"]);
          v34 = &stru_100031928;
          if (v33) {
            v34 = v33;
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  v32,  v34));
          [v26 addObject:v35];

          v36 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"notes"]);
          if (v36) {
            [v26 addObjectsFromArray:v36];
          }
        }

        id v28 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }

      while (v28);
    }

    if (qword_10003EE60)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Completed %u, Recent: %@",  dword_10003EE68,  qword_10003EE60));
      [v26 addObject:v37];
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsJoinedByString:@"\n"]);
    v39 = (char *)qword_10003EE70;
    id v40 = v38;
    v41 = (const char *)[v40 UTF8String];
    strlcpy(v39, v41, qword_10003EE78);
    BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    unint64_t v7 = v51;
    unint64_t v6 = v52;
    v13 = v50;
    if (v42) {
      sub_1000212DC(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    qword_10003EE20 = qword_10003EE70;
  }

  pthread_mutex_unlock(&stru_10003EC00);
}

- (OSACrashReport)initWithTask:(unsigned int)a3 exceptionType:(int)a4 thread:(unsigned int)a5 threadId:(unint64_t)a6 threadStateFlavor:(int)a7 threadState:(unsigned int)a8[1296] threadStateCount:(unsigned int)a9
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v14 = *(void *)&a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___OSACrashReport;
  v15 = -[OSACrashReport init](&v36, "init");
  if (v15)
  {
    *(CFAbsoluteTime *)&v15->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time] = CFAbsoluteTimeGetCurrent();
    if (!mach_timebase_info(&info) && info.denom)
    {
      LODWORD(v16) = info.numer;
      double v17 = (double)v16 * 0.000000001 / (double)info.denom;
      v15->_awakeSystemUptime = (unint64_t)(v17 * (double)mach_absolute_time());
    }

    v15->_device_lock_state = MKBGetDeviceLockState(0LL);
    v15->_device_unlocked_since_boot = MKBDeviceUnlockedSinceBoot();
    v15->_is_full_corpse = 0;
    v15->_is_lightweight_corpse = 0;
    v15->_task = v14;
    v15->_is_driverkit = CSTaskIsDriverKit(v14);
    v18 = objc_alloc_init(&OBJC_CLASS___OSAExclaveContainer);
    exclaveContainer = v15->_exclaveContainer;
    v15->_exclaveContainer = v18;

    v15->_threadPortOriginal = v12;
    v15->_threadId = a6;
    v15->_crashedThreadNumber = -1;
    v15->_threadStateFlavor = a7;
    v15->_threadStateCount = a9;
    if (a8 && a9) {
      memcpy(v15->_threadState, a8, 4LL * a9);
    }
    uint64_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v20);
    threadPortPedigree = v15->_threadPortPedigree;
    v15->_threadPortPedigree = (NSMutableArray *)v21;

    uint64_t v23 = v15->_threadPortPedigree;
    if ((_DWORD)v12 && a6 == -1LL)
    {
      uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"init mach STANDARD 0x%x ID(0x%llX)",  v12,  -1LL);
    }

    else if (a6 == -1LL)
    {
      uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"init mach UNEXPECTED 0x%x ID(0x%llX)",  v12,  -1LL);
    }

    else
    {
      uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"init mach PROTECTED 0x%x ID(0x%llX)",  v12,  a6);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSMutableArray addObject:](v23, "addObject:", v25);

    v15->_exceptionType = a4;
    uint64_t v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v26);
    applicationSpecificInfo = v15->_applicationSpecificInfo;
    v15->_applicationSpecificInfo = (NSMutableDictionary *)v27;

    uint64_t v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v29);
    applicationSpecificInfoFullSensitive = v15->_applicationSpecificInfoFullSensitive;
    v15->_applicationSpecificInfoFullSensitive = (NSMutableDictionary *)v30;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005C5C;
    block[3] = &unk_100030D28;
    v34 = v15;
    if (qword_10003EE80 != -1) {
      dispatch_once(&qword_10003EE80, block);
    }
  }

  return v15;
}

- (void)dealloc
{
  exceptionCode = self->_exceptionCode;
  if (exceptionCode) {
    free(exceptionCode);
  }
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot) {
    free(exit_snapshot);
  }
  exit_payload = self->_exit_payload;
  if (exit_payload) {
    free(exit_payload);
  }
  -[OSACrashReport stashStatus:note:](self, "stashStatus:note:", 0LL, 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSACrashReport;
  -[OSACrashReport dealloc](&v6, "dealloc");
}

- (void)unpackExceptionCodes
{
  exceptionCode = self->_exceptionCode;
  int64_t v3 = *exceptionCode;
  unsigned int v4 = (*exceptionCode >> 20) & 0xF;
  if (v4) {
    self->_exceptionType = v4;
  }
  self->_signal = BYTE3(v3);
  int64_t *exceptionCode = v3 & 0xFFFFF;
}

- (void)_extractWorkQueueLimitsFromData:(proc_workqueueinfo *)a3
{
  if ((a3->pwq_state & 3) != 0)
  {
    v5 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    uint32_t pwq_state = a3->pwq_state;
    if ((pwq_state & 1) != 0)
    {
      size_t v9 = 4LL;
      sysctlbyname("kern.wq_max_constrained_threads", &v10, &v9, 0LL, 0LL);
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"Dispatch Thread Soft Limit");

      uint32_t pwq_state = a3->pwq_state;
    }

    if ((pwq_state & 2) != 0)
    {
      size_t v9 = 4LL;
      sysctlbyname("kern.wq_max_threads", &v10, &v9, 0LL, 0LL);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  @"Dispatch Thread Hard Limit");
    }

    if (-[NSMutableDictionary count](v5, "count")) {
      objc_storeStrong((id *)&self->_workQueueLimits, v5);
    }
  }

- (void)extractThreadStateInfo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_pageinStateCount = &self->_pageinStateCount;
  self->_pageinStateCount = 1;
  uint64_t state = thread_get_state(a3, 27, self->_pageinState, &self->_pageinStateCount);
  if ((_DWORD)state)
  {
    unint64_t v7 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread_get_state(PAGEIN) returned 0x%x: %s",  state,  mach_error_string(state));
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 addObject:v9];

    unsigned int *p_pageinStateCount = 0;
  }

  self->_exceptionStateCount = 4;
  uint64_t v10 = thread_get_state(v3, 7, self->_exceptionState, &self->_exceptionStateCount);
  if ((_DWORD)v10)
  {
    v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread_get_state(EXCEPTION) returned 0x%x: %s",  v10,  mach_error_string(v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 addObject:v13];

    self->_exceptionStateCount = 0;
  }

  p_uint64_t threadStateCount = &self->_threadStateCount;
  uint64_t threadStateCount = self->_threadStateCount;
  if (self->_threadPortOriginal != (_DWORD)v3 || !(_DWORD)threadStateCount)
  {
    threadPortPedigree = self->_threadPortPedigree;
    double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"getState(0x%x, flavor %d) count %d",  v3,  self->_threadStateFlavor,  threadStateCount));
    -[NSMutableArray addObject:](threadPortPedigree, "addObject:", v17);

    unsigned int *p_threadStateCount = 1296;
    uint64_t v18 = thread_get_state(v3, self->_threadStateFlavor, self->_threadState, &self->_threadStateCount);
    if ((_DWORD)v18)
    {
      uint64_t v19 = OBJC_IVAR___OSAReport__notes;
      uint64_t v20 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread_get_state(FLAVOR) returned 0x%x: %s",  v18,  mach_error_string(v18));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      [v20 addObject:v22];

      *(void *)object_addr = 0LL;
      uint64_t v23 = mach_port_kernel_object(mach_task_self_, v3, &object_addr[1], object_addr);
      uint64_t v24 = self->_threadPortPedigree;
      v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"object check returned 0x%x (%s) type %u (expected 1)",  v23,  mach_error_string(v23),  object_addr[1]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      -[NSMutableArray addObject:](v24, "addObject:", v26);

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
      LODWORD(v24) = [v27 appleInternal];

      if ((_DWORD)v24) {
        [*(id *)&self->OSAReport_opaque[v19] addObjectsFromArray:self->_threadPortPedigree];
      }
      self->_threadStateFlavor = 5;
      unsigned int *p_threadStateCount = 0;
    }
  }

- (id)pathFromPid:(int)a3
{
  int v4 = proc_pidpath(a3, buffer, 0x400u);
  if (v4 < 1)
  {
    if (!v4) {
      return 0LL;
    }
  }

  else
  {
    buffer[v4] = 0;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  buffer));
}

- (id)nameFromPid:(int)a3
{
  int v4 = proc_name(a3, buffer, 0x400u);
  int v5 = v4;
  if (v4 >= 1) {
    buffer[v4] = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = "<error>";
    v9[0] = 67109634;
    v9[1] = a3;
    if (v5 > 0) {
      objc_super v6 = buffer;
    }
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 2080;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "proc_name(%d) = [%d] %s",  (uint8_t *)v9,  0x18u);
  }

  if (v5 < 1) {
    unint64_t v7 = 0LL;
  }
  else {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }
  return v7;
}

- (_CSTypeRef)_getSymbolicator:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData(self, a2) | 0x100002;
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = CSSymbolicatorCreateWithTaskFlagsAndNotification(self->_task, v4, 0LL);
  unint64_t v7 = v6;
  if (CSIsNull())
  {
    unsigned int v13 = 5;
    if (_dyld_process_info_create(self->_task, 0LL, &v13)) {
      _dyld_process_info_release();
    }
    uint64_t v8 = OBJC_IVAR___OSAReport__notes;
    size_t v9 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    if (v13)
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Corpse is incomplete (_dyld_process_info_create failed with %d)",  v13));
      [v9 addObject:v10];
    }

    else
    {
      objc_msgSend(v9, "addObject:", @"Corpse appears to be complete, but CSSymbolicator creation failed");
    }

    objc_msgSend( *(id *)&self->OSAReport_opaque[v8],  "addObject:",  @"Backtraces may be be unvailable or truncated to only leaf frames, and the binary image list may not be available");
  }

  unint64_t v11 = v5;
  unint64_t v12 = v7;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)validateProcName
{
  procName = self->_procName;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithRange:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithRange:",  0LL,  1LL));
  id v5 = -[NSString rangeOfCharacterFromSet:](procName, "rangeOfCharacterFromSet:", v4);

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self->_procName, "substringToIndex:", v5));
    unint64_t v7 = self->_procName;
    self->_procName = v6;
  }

  NSUInteger v8 = -[NSString length](self->_procName, "length");
  size_t v9 = self->_procName;
  if (v8)
  {
    if (-[NSString length](v9, "length") < 0x41) {
      return;
    }
    __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self->_procName, "substringToIndex:", 64LL));
    size_t v9 = self->_procName;
  }

  else
  {
    __int16 v10 = @"Unknown";
  }

  self->_procName = &v10->isa;
}

- (void)dumpProgramCounterBytes
{
  kern_return_t v27;
  kern_return_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint32_t v36;
  const char *v37;
  NSData *v38;
  NSData *pc_bytes_before;
  NSData *v40;
  NSData *pc_bytes;
  unint64_t v42;
  mach_vm_address_t v43;
  mach_msg_type_number_t dataCnt;
  vm_offset_t data;
  uint8_t buf[4];
  _BYTE v47[24];
  int v48;
  char *v49;
  int v50;
  data = 0LL;
  dataCnt = 0;
  BOOL v42 = 0LL;
  uint64_t v43 = 0LL;
  threadStateDecoded = self->_threadStateDecoded;
  if (!threadStateDecoded
    || (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( threadStateDecoded,  "objectForKeyedSubscript:",  @"pc")),  v4,  !v4))
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_100021350(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_threadStateDecoded,  "objectForKeyedSubscript:",  @"pc"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"value"]);
  unint64_t v7 = (char *)[v6 unsignedLongValue];

  if ((unint64_t)v7 <= 0xFC0000000LL && (unint64_t)v7 >= vm_page_size)
  {
    if (-[OSACrashReport _regionInfoAtAddress:regionInfo:regionAddress:regionSize:]( self,  "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:",  v7,  &v48,  &v43,  &v42))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000214D0();
      }
      return;
    }

    mach_vm_address_t v19 = v43;
    uint64_t v20 = &v7[-v43];
    if ((unint64_t)v7 < v43)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v47 = v7;
      size_t v9 = "Crashing program counter 0x%llx was unmapped";
      goto LABEL_21;
    }

    if ((v48 & 4) == 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v47 = v7;
      size_t v9 = "Crashing pc 0x%llx was not executable";
LABEL_21:
      __int16 v10 = buf;
      goto LABEL_22;
    }

    unint64_t v22 = v42;
    if (v48 == 7 || v50 == 64)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)uint64_t v47 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Crashing pc 0x%llx was JIT",  buf,  0xCu);
      }

      mach_vm_size_t v23 = 800LL;
    }

    else
    {
      mach_vm_size_t v23 = 80LL;
    }

    unint64_t v24 = v23 >> 1;
    mach_vm_address_t v25 = (mach_vm_address_t)&v7[-(v23 >> 1)];
    unint64_t v26 = v23 + v25 - 1;
    if (v25 - v19 >= v22)
    {
      if (-[OSACrashReport _regionInfoAtAddress:regionInfo:regionAddress:regionSize:]( self,  "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:",  v25,  &v48,  &v43,  &v42))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100021468();
        }
        goto LABEL_34;
      }

      if (v43 > v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v47 = v43;
          *(_WORD *)&v47[8] = 2048;
          *(void *)&v47[10] = v25;
          v35 = "VM region 0x%llx before crashing pc 0x%llx was unmapped";
          objc_super v36 = 22;
LABEL_57:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
          goto LABEL_34;
        }

        goto LABEL_34;
      }

      if ((v48 & 4) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)uint64_t v47 = v25;
          v35 = "region before crashing pc 0x%llx was not executable";
          objc_super v36 = 12;
          goto LABEL_57;
        }

- (void)finishExtractionUsingCorpse
{
  id v3 = [[VMUProcInfo alloc] initWithPid:self->_ppid];
  v90 = v3;
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    id v5 = (NSString *)[v4 copy];
    parentProcessName = self->_parentProcessName;
    self->_parentProcessName = v5;
  }

  else
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to create NSProcInfo for parent process"];
  }

  if (!self->_parentProcessName)
  {
    unint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[OSACrashReport nameFromPid:](self, "nameFromPid:", self->_ppid));
    NSUInteger v8 = self->_parentProcessName;
    self->_parentProcessName = v7;
  }

  uint64_t task = self->_task;
  if ((task + 1) >= 2)
  {
    uint64_t v12 = _dyld_process_info_create(task, 0LL, v122);
    uint64_t v13 = v12;
    if (v12)
    {
      self->_platform = _dyld_process_info_get_platform(v12);
      _dyld_process_info_release(v13);
    }

    else
    {
      uint64_t v14 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_dyld_process_info_create failed with %d",  v122[0]));
      [v14 addObject:v15];
    }

    uint64_t v16 = dyld_process_create_for_task(self->_task, v122);
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = dyld_process_snapshot_create_for_process(v16, v122);
      uint64_t v19 = v18;
      if (v18)
      {
        uint64_t shared_cache = dyld_process_snapshot_get_shared_cache(v18);
        uint64_t v21 = shared_cache;
        if (shared_cache)
        {
          p_sharedCacheBase = &self->_sharedCacheBase;
          self->_sharedCacheBase = dyld_shared_cache_get_base_address(shared_cache);
          unint64_t mapped_size = dyld_shared_cache_get_mapped_size(v21);
          self->_sharedCacheSize = mapped_size;
          if (*p_sharedCacheBase + mapped_size <= *p_sharedCacheBase)
          {
            id v28 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"shared cache base 0x%llX + size 0x%llX overflow",  *p_sharedCacheBase,  mapped_size));
            [v28 addObject:v29];

            self->_sharedCacheBase = 0LL;
            self->_sharedCacheSize = 0LL;
          }

          else
          {
            dyld_shared_cache_copy_uuid(v21, self->_sharedCacheUuid);
          }
        }

        else
        {
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"dyld_process_snapshot_get_shared_cache failed"];
        }

        dyld_process_snapshot_dispose(v19);
      }

      else
      {
        unint64_t v26 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dyld_process_snapshot_create_for_process failed with %d",  v122[0]));
        [v26 addObject:v27];
      }

      dyld_process_dispose(v17);
    }

    else
    {
      unint64_t v24 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      mach_vm_address_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dyld_process_create_for_task failed with %d",  v122[0]));
      [v24 addObject:v25];
    }

    get_default[0] = 0;
    mach_msg_type_number_t policy_infoCnt = 1;
    if (!task_policy_get(self->_task, 1u, &policy_info, &policy_infoCnt, get_default)) {
      self->_task_role = policy_info;
    }
    CSSymbolicatorSetForceGlobalSafeMachVMReads(1LL);
    context = objc_autoreleasePoolPush();
    id v95 = objc_alloc_init(&OBJC_CLASS___OSABinaryImageCatalog);
    id v30 = -[OSACrashReport _getSymbolicator:](self, "_getSymbolicator:", 1LL);
    uint64_t v91 = v31;
    id v92 = v30;
    if ((CSIsNull(v30, v31) & 1) != 0)
    {
      unsigned int name = 0;
    }

    else
    {
      -[OSACrashReport _extractBinaryImageInfoUsingSymbolicator:usingCatalog:]( self,  "_extractBinaryImageInfoUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      -[OSACrashReport _extractVMMap:](self, "_extractVMMap:", v92, v91);
      CSRelease(v92, v91);
      id v32 = -[OSACrashReport _getSymbolicator:](self, "_getSymbolicator:", 0LL);
      uint64_t v91 = v33;
      id v92 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      -[OSACrashReport setLogWritingSignatureFrames:](self, "setLogWritingSignatureFrames:", v34);

      unsigned int name = -[OSACrashReport _extractBacktraceInfoUsingSymbolicator:usingCatalog:]( self,  "_extractBacktraceInfoUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      if (-[OSACrashReport _isPGMCrashType](self, "_isPGMCrashType"))
      {
        -[OSACrashReport _extractPGMReportUsingSymbolicator:usingCatalog:]( self,  "_extractPGMReportUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
        -[OSACrashReport _extractPGMLibpasReportUsingSymbolicator:usingCatalog:]( self,  "_extractPGMLibpasReportUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      }

      -[OSACrashReport _extractSanitizerReportUsingSymbolicator:usingCatalog:]( self,  "_extractSanitizerReportUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      -[OSACrashReport _extractMemoryErrorReportUsingSymbolicator:usingCatalog:]( self,  "_extractMemoryErrorReportUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      -[OSACrashReport _extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:]( self,  "_extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
      -[OSACrashReport _extractExceptionReasonUsingSymbolicator:usingCatalog:]( self,  "_extractExceptionReasonUsingSymbolicator:usingCatalog:",  v92,  v91,  v95);
    }

    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id obj = self->_exclaveThreadNumbers;
    id v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v111,  v126,  16LL);
    if (v96)
    {
      uint64_t v94 = *(void *)v112;
      do
      {
        uint64_t v35 = 0LL;
        do
        {
          if (*(void *)v112 != v94)
          {
            uint64_t v36 = v35;
            objc_enumerationMutation(obj);
            uint64_t v35 = v36;
          }

          uint64_t v97 = v35;
          v99 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_threadInfos,  "objectAtIndexedSubscript:",  (int)[*(id *)(*((void *)&v111 + 1) + 8 * v35) intValue]));
          v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:@"frames"]);
          v98 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:@"id"]);
          if (!v37)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_1000215AC(v124, v98, &v125);
            }
            v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue( -[OSAExclaveContainer getFramesForThread:usingCatalog:]( self->_exclaveContainer,  "getFramesForThread:usingCatalog:",  v98,  v95));
          __int128 v109 = 0u;
          __int128 v110 = 0u;
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          id v39 = [v38 countByEnumeratingWithState:&v107 objects:v123 count:16];
          if (v39)
          {
            uint64_t v40 = 0LL;
            uint64_t v41 = *(void *)v108;
            do
            {
              for (i = 0LL; i != v39; i = (char *)i + 1)
              {
                if (*(void *)v108 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport composeFrame:info:]( self,  "composeFrame:info:",  *(void *)(*((void *)&v107 + 1) + 8LL * (void)i),  &off_100037F30));
                -[NSMutableArray insertObject:atIndex:](v37, "insertObject:atIndex:", v43, (char *)i + v40);
              }

              id v39 = [v38 countByEnumeratingWithState:&v107 objects:v123 count:16];
              v40 += (uint64_t)i;
            }

            while (v39);
          }

          [v99 setObject:v37 forKeyedSubscript:@"frames"];
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[OSAExclaveContainer threadIdToScId](self->_exclaveContainer, "threadIdToScId"));
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v98]);

          if (v45) {
            [v99 setObject:v45 forKeyedSubscript:@"exclaveScid"];
          }

          uint64_t v35 = v97 + 1;
        }

        while ((id)(v97 + 1) != v96);
        id v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v111,  v126,  16LL);
      }

      while (v96);
    }

    if (self->_exceptionType == 1)
    {
      self->_unint64_t crashingAddress = self->_exceptionCode[1];
      id v46 = [[VMUVMRegionIdentifier alloc] initWithTask:self->_task pid:self->_proc_id options:4352];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 descriptionOfRegionsAroundAddress:self->_crashingAddress options:4096]);
      uint64_t v48 = v47;
      if (v47)
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v47 componentsSeparatedByString:@"\n"]);
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
        unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v49 filteredArrayUsingPredicate:v50]);

        unint64_t v52 = (NSString *)objc_claimAutoreleasedReturnValue([v51 componentsJoinedByString:@"\n"]);
        vmregion_mach_timebase_info info = self->_vmregion_info;
        self->_vmregion_mach_timebase_info info = v52;
      }
    }

    else if ((self->_cs_status & 0x1000000) != 0 && self->_exceptionStateCount)
    {
      self->_unint64_t crashingAddress = *(void *)self->_exceptionState;
    }

    unint64_t crashingAddress = self->_crashingAddress;
    if (crashingAddress)
    {
      taskImages = self->_taskImages;
      uint64_t v106 = 0LL;
      id v56 = [v95 searchFrame:crashingAddress in:taskImages regions:0 result:&v106];
    }

    __int128 v57 = (NSArray *)objc_claimAutoreleasedReturnValue([v95 reportUsedImagesFullInfoUsingBlock:&stru_100030D68]);
    usedImages = self->_usedImages;
    self->_usedImages = v57;

    v59 = &self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    [v95 appendNotesTo:*(void *)v59];

    -[OSAExclaveContainer appendNotesTo:](self->_exclaveContainer, "appendNotesTo:", *(void *)v59);
    uint64_t threadPortOriginal = name;
    if (!name) {
      uint64_t threadPortOriginal = self->_threadPortOriginal;
    }
    -[OSACrashReport extractThreadStateInfo:](self, "extractThreadStateInfo:", threadPortOriginal);
    __int16 v61 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[OSACrashReport decode_crashingThreadStateWithSymbolicator:usingCatalog:]( self,  "decode_crashingThreadStateWithSymbolicator:usingCatalog:",  v92,  v91,  0LL));
    threadStateDecoded = self->_threadStateDecoded;
    self->_threadStateDecoded = v61;

    self->_sroute_id = -[OSACrashReport sRouteID](self, "sRouteID");
    -[OSACrashReport checkIfNeedsUrgentSubmission](self, "checkIfNeedsUrgentSubmission");
    if (name) {
      mach_port_deallocate(mach_task_self_, name);
    }
    if ((CSIsNull(v92, v91) & 1) == 0) {
      CSRelease(v92, v91);
    }
    objc_autoreleasePoolPop(context);
    -[OSACrashReport dumpProgramCounterBytes](self, "dumpProgramCounterBytes");
  }

  else
  {
    __int16 v10 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to determine task_t for %@[%d], so no last exception, backtraces, binary images, or dyld info",  self->_procName,  self->_proc_id));
    [v10 addObject:v11];
  }

  if (!sandbox_container_path_for_pid(self->_proc_id, v122, 1024LL))
  {
    v63 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v122));
    sandboxContainer = self->_sandboxContainer;
    self->_sandboxContainer = v63;
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport logWritingSignatureFrames](self, "logWritingSignatureFrames"));
  id v66 = [v65 length];

  if (v66)
  {
    procName = self->_procName;
    uint64_t exceptionType = self->_exceptionType;
    int64_t v69 = *self->_exceptionCode;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport logWritingSignatureFrames](self, "logWritingSignatureFrames"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 productNameVersionBuildString]);
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %s 0x%X 0x%qx %@ %@",  procName,  self->_slice_uuid,  exceptionType,  v69,  v70,  v72));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100021544();
    }
    *(void *)get_default = 0LL;
    v117 = 0LL;
    LODWORD(v118) = 0;
    id v74 = v73;
    CC_SHA1([v74 UTF8String], (CC_LONG)objc_msgSend(v74, "length"), (unsigned __int8 *)get_default);
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  LOBYTE(get_default[0]),  BYTE1(get_default[0]),  BYTE2(get_default[0]),  HIBYTE(get_default[0]),  LOBYTE(get_default[1]),  BYTE1(get_default[1]),  BYTE2(get_default[1]),  HIBYTE(get_default[1]),  v117,  BYTE1(v117),  BYTE2(v117),  BYTE3(v117),  BYTE4(v117),  BYTE5(v117),  BYTE6(v117),  HIBYTE(v117),  v118,  BYTE1(v118),  BYTE2(v118),  BYTE3(v118)));
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:v75 forKeyedSubscript:kOSALogOptionSignature];
    objc_storeStrong((id *)&self->_logWritingSignature, v75);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      mach_msg_type_number_t policy_infoCnt = 138412290;
      v121 = v75;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "crash signature: %@",  (uint8_t *)&policy_infoCnt,  0xCu);
    }
  }

  int64_t v76 = *self->_exceptionCode;
  if (self->_exceptionType == 11 && (v76 & 0xE000000000000000LL) == 0x6000000000000000LL && self->_proc_id)
  {
    *(void *)get_default = 0LL;
    v117 = get_default;
    uint64_t v118 = 0x2020000000LL;
    char v119 = 0;
    id v77 = (id)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    if (([v77 isComputeController] & 1) == 0)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
      unsigned __int8 v79 = [v78 isComputeNode];

      if ((v79 & 1) != 0)
      {
LABEL_82:
        if (*((_BYTE *)v117 + 24)) {
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:&off_1000380C0 forKeyedSubscript:kOSALogOptionPriority];
        }
        else {
          -[OSACrashReport captureDiagInfo:](self, "captureDiagInfo:", &off_100038510);
        }
        uint64_t v86 = self->_task;
        v87 = self->_procPath;
        if (byte_10003EE92)
        {
          if (qword_10003EF48 != -1) {
            dispatch_once(&qword_10003EF48, &stru_100031120);
          }
          if (off_10003EF40) {
            ((void (*)(uint64_t, void, const char *, void, void))off_10003EF40)( v86, 0LL, -[NSString UTF8String](v87, "UTF8String"), 0LL, 0LL);
          }
        }

        _Block_object_dispose(get_default, 8);
        goto LABEL_99;
      }

      if (qword_10003EE98 != -1) {
        dispatch_once(&qword_10003EE98, &stru_100030DA8);
      }
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ExcResourceDiagInfo_%@",  self->_procName));
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v83 = (dispatch_queue_s *)qword_10003EEA0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007E38;
      block[3] = &unk_100030DD0;
      id v101 = v81;
      id v102 = v80;
      v104 = self;
      v105 = get_default;
      id v103 = v82;
      id v84 = v82;
      id v85 = v80;
      id v77 = v81;
      dispatch_sync(v83, block);
    }

    goto LABEL_82;
  }

  if (v76 == 3238382097LL)
  {
    -[OSACrashReport captureDiagInfo:](self, "captureDiagInfo:", &off_100038540);
  }

  else if (v76 == 3134085662LL)
  {
    -[OSACrashReport captureDiagInfo:](self, "captureDiagInfo:", &off_100038528);
  }

  else if (self->_abort_cause == 1414810708 || v76 == 1414810708 && self->_is_simulated)
  {
    -[OSACrashReport captureDiagInfo:](self, "captureDiagInfo:", &off_100038558);
  }

- (void)autopsyCorpse
{
  self->_is_full_corpse = 1;
  mach_vm_address_t kcd_addr_begin = 0LL;
  mach_vm_size_t v5 = 0LL;
  if (task_map_corpse_info_64(mach_task_self_, self->_task, &kcd_addr_begin, &v5)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = kcd_addr_begin == 0;
  }
  if (v3 || v5 == 0)
  {
    objc_msgSend( *(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes],  "addObject:",  @"Couldn't map kcdata from kernel",  v5);
  }

  else
  {
    -[OSACrashReport parseCorpse:size:](self, "parseCorpse:size:");
    mach_vm_deallocate(mach_task_self_, kcd_addr_begin, v5);
    -[OSACrashReport finishExtractionUsingCorpse](self, "finishExtractionUsingCorpse");
  }

- (void)autopsyLightweightCorpse:(unint64_t)a3 size:(unint64_t)a4
{
  self->_is_lightweight_corpse = 1;
  self->_is_simulated = 1;
  unint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  taskImages = self->_taskImages;
  self->_taskImages = v7;

  -[OSACrashReport parseCorpse:size:](self, "parseCorpse:size:", a3, a4);
  -[OSACrashReport finishExtractionUsingLightweightCorpse](self, "finishExtractionUsingLightweightCorpse");
}

- (BOOL)validKcdataItem:(kcdata_iter)a3 min_size:(unint64_t)a4
{
  kcdata_item_t item = a3.item;
  signed int type = a3.item->type;
  if ((a3.item->type & 0xFFFFFFF0) == 0x20) {
    signed int type = 17;
  }
  if (type > 2309)
  {
    if (type == 2310)
    {
      uint32_t size = a3.item->size;
      if (size == 112)
      {
        if ((a3.item->flags & 0x8F) == 0)
        {
          uint32_t v8 = 104;
          goto LABEL_21;
        }

        uint32_t size = 112;
      }

      goto LABEL_19;
    }

    if (type == 2312)
    {
      uint32_t size = a3.item->size;
      if (size == 32)
      {
        if ((a3.item->flags & 0x8F) == 0)
        {
          uint32_t v8 = 24;
          goto LABEL_21;
        }

        uint32_t size = 32;
      }

      goto LABEL_19;
    }
  }

  else if (type == 17 || type == 19)
  {
    uint32_t v8 = a3.item->size;
    goto LABEL_21;
  }

  uint32_t size = a3.item->size;
LABEL_19:
  BOOL v10 = size >= (a3.item->flags & 0xF);
  uint32_t v8 = size - (a3.item->flags & 0xF);
  if (!v10) {
    uint32_t v8 = 0;
  }
LABEL_21:
  unint64_t v11 = v8;
  if (v8 < a4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002160C((int *)item, v11, a4);
  }
  return v11 >= a4;
}

- (void)parseCorpse:(unint64_t)a3 size:(unint64_t)a4
{
  unint64_t v5 = a4 + a3;
  unint64_t v6 = a3 + 16;
  if (a3 + 16 > a4 + a3) {
    goto LABEL_341;
  }
  unint64_t v7 = (unsigned int *)a3;
  int v8 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 & 0xFFFFFFF0) == 0x20) {
    int v8 = 17;
  }
  if (v8 != 1178684999 && v8 != -559025833)
  {
LABEL_341:
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"invalid corpse info provided for EXC_CORPSE_NOTIFY"];
    unint64_t v11 = 0LL;
    goto LABEL_342;
  }

  unsigned int v161 = 0;
  BOOL v10 = 0LL;
  unint64_t v11 = 0LL;
  key = (char *)XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER;
  v157 = (char *)XPC_COALITION_INFO_KEY_NAME;
  do
  {
    uint64_t v12 = v7[1];
    if (v6 + v12 > v5) {
      break;
    }
    int v13 = *v7;
    if (*v7 == -242132755) {
      break;
    }
    if ((v13 & 0xFFFFFFF0) == 0x20) {
      int v13 = 17;
    }
    if (v13 > 2388)
    {
      if (v13 > 2814)
      {
        if (v13 == 2815)
        {
          if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
            goto LABEL_299;
          }
          v64 = v11;
          unsigned int v100 = v7[4];
          if ((v100 & 1) != 0)
          {
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"The backtrace is truncated"];
            if ((v100 & 2) != 0) {
              goto LABEL_309;
            }
LABEL_198:
            if ((v100 & 8) == 0) {
              goto LABEL_199;
            }
LABEL_310:
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"This crash report is incomplete"];
            if ((v100 & 4) != 0) {
LABEL_311:
            }
              [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"This crash report may be incomplete because the faulting thread was terminated."];
          }

          else
          {
            if ((v100 & 2) == 0) {
              goto LABEL_198;
            }
LABEL_309:
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"The async backtrace is truncated"];
            if ((v100 & 8) != 0) {
              goto LABEL_310;
            }
LABEL_199:
            if ((v100 & 4) != 0) {
              goto LABEL_311;
            }
          }

- (id)problemType
{
  if (self->_is_lightweight_corpse) {
    v2 = @"308";
  }
  else {
    v2 = @"309";
  }
  if (self->_exceptionType == 11)
  {
    v2 = @"385";
  }

  return v2;
}

- (id)appleCareDetails
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_exceptionCodes](self, "decode_exceptionCodes"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@" "]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"," withString:@"-"]);

  procName = self->_procName;
  uint64_t v12 = &off_1000380C0;
  int v13 = procName;
  bundle_id = (const __CFString *)self->_bundle_id;
  if (!bundle_id) {
    bundle_id = &stru_100031928;
  }
  size_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_is_simulated,  v12,  v13,  bundle_id,  v6));
  uint64_t v14 = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 5LL));

  return v10;
}

- (id)reportNamePrefix
{
  int exceptionType = self->_exceptionType;
  if (exceptionType == 12)
  {
    else {
      uint64_t v4 = &stru_100031928;
    }
  }

  else
  {
    BOOL v3 = exceptionType == 11;
    uint64_t v4 = @"ExcResource_";
    if (!v3) {
      uint64_t v4 = &stru_100031928;
    }
  }

  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v4, self->_procName);
}

- (BOOL)isActionable
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport problemType](self, "problemType"));
  if (([v3 isEqualToString:@"385"] & 1) != 0
    || ([v3 isEqualToString:@"309"] & 1) != 0
    || [v3 isEqualToString:@"308"])
  {
    if (self->_is_simulated) {
      uint64_t v4 = @"_sim";
    }
    else {
      uint64_t v4 = &stru_100031928;
    }
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@%@",  v3,  self->_procName,  v4));
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:v5 forKeyedSubscript:kOSALogOptionCountKey];
  }

  exit_snapshot = self->_exit_snapshot;
  BOOL v7 = !exit_snapshot || exit_snapshot->ers_namespace != 7 || exit_snapshot->ers_code != 3;
  if (self->_exceptionType == 11 && (unint64_t)*self->_exceptionCode >> 61 == 3)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    if ([v8 appleInternal])
    {
      if (byte_10003EE93) {
        BOOL v7 = 1;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else if (byte_10003EE93)
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)additionalIPSMetadata
{
  procName = self->_procName;
  v30[0] = kOSALogMetadataAppName;
  v30[1] = @"app_name";
  v31[0] = procName;
  v31[1] = procName;
  v30[2] = @"slice_uuid";
  int v29 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport slice_uuid](self, "slice_uuid"));
  v31[2] = v29;
  v30[3] = @"build_version";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  kCFBundleVersionKey));
  if (v4) {
    unint64_t v5 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  kCFBundleVersionKey));
  }
  else {
    unint64_t v5 = &stru_100031928;
  }
  int v28 = (__CFString *)v5;
  v31[3] = v5;
  v30[4] = @"app_version";
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[OSACrashReport short_vers](self, "short_vers"));
  BOOL v7 = (void *)v6;
  if (v6) {
    int v8 = (const __CFString *)v6;
  }
  else {
    int v8 = &stru_100031928;
  }
  v31[4] = v8;
  v30[5] = @"is_first_party";
  size_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_is_first_party));
  v31[5] = v9;
  v30[6] = @"share_with_app_devs";
  BOOL is_simulated = self->_is_simulated;
  if (self->_is_simulated)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    id v11 = [v27 optIn3rdParty];
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  v31[6] = v12;
  v30[7] = kOSALogMetadataIncidentID;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport incidentID](self, "incidentID"));
  v31[7] = v13;
  v30[8] = @"platform";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_platform));
  v31[8] = v14;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  9LL));
  id v16 = [v15 mutableCopy];

  if (!is_simulated) {
  if (v4)
  }

  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport etlKey](self, "etlKey"));
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport etlKey](self, "etlKey"));
    [v16 setObject:v18 forKeyedSubscript:@"etl_key"];
  }

  bundle_id = self->_bundle_id;
  if (bundle_id) {
    [v16 setObject:bundle_id forKeyedSubscript:kOSALogMetadataBundleID];
  }
  if (self->_is_simulated) {
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is_simulated"];
  }
  if (self->_is_beta)
  {
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is_beta"];
    int v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_store_info,  "objectForKeyedSubscript:",  @"storeCohortMetadata"));

    if (v20)
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_store_info,  "objectForKeyedSubscript:",  @"storeCohortMetadata"));
      [v16 setObject:v21 forKeyedSubscript:@"app_cohort"];
    }
  }

  adam_id = self->_adam_id;
  if (adam_id) {
    [v16 setObject:adam_id forKeyedSubscript:@"adam_id"];
  }
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_namespace == 20 && self->_exit_payload && self->_exit_payload_length == 37)
  {
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    [v16 setObject:v24 forKeyedSubscript:@"correlationID"];
  }

  if (self->_sroute_id)
  {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    [v16 setObject:v25 forKeyedSubscript:@"sroute_id"];
  }

  return v16;
}

- (id)slice_uuid
{
  if (self->_slice_uuid[0]) {
    slice_uuid = self->_slice_uuid;
  }
  else {
    slice_uuid = "";
  }
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", slice_uuid);
}

- (void)_extractLastExceptionBacktraceUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime( var0,  var1,  "CoreFoundation",  0x8000000000000000LL);
  uint64_t v10 = v9;
  if ((CSIsNull(SymbolOwnerWithNameAtTime, v9) & 1) == 0)
  {
    uint64_t SymbolWithName = CSSymbolOwnerGetSymbolWithName(SymbolOwnerWithNameAtTime, v10, "__last_exception_backtrace__");
    uint64_t v13 = v12;
    if ((CSIsNull(SymbolWithName, v12) & 1) == 0)
    {
      uint64_t v14 = -[OSACrashReport _copyStringFromTask:atAddress:maxLength:immutableCheck:]( self,  "_copyStringFromTask:atAddress:maxLength:immutableCheck:",  self->_task,  CSSymbolGetRange(SymbolWithName, v13),  0LL,  0LL);
      if (v14)
      {
        unsigned int v15 = v14;
        size_t v16 = strlen(v14);
        if (v16 && *v15 == 40 && v15[v16 - 1] == 41)
        {
          uint64_t v18 = (NSArray *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
          uint64_t v19 = v15 + 1;
          while (1)
          {
            int v20 = *(unsigned __int8 *)v19;
            if (v20 == 32) {
              goto LABEL_13;
            }
            if (!*v19 || v20 == 41)
            {
              lastExceptionBacktrace = self->_lastExceptionBacktrace;
              self->_lastExceptionBacktrace = v18;

              break;
            }

            if (!sscanf(v19, "0x%llx%n", &v28, &v27))
            {
LABEL_13:
              ++v19;
            }

            else
            {
              v19 += v27;
              uint64_t v21 = v28;
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472LL;
              v23[2] = sub_10000A624;
              v23[3] = &unk_100030DF8;
              unint64_t v24 = v18;
              unsigned int v25 = self;
              uint64_t v26 = v28;
              -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:]( self,  "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:",  v21,  v21,  var0,  var1,  v7,  v23);
            }
          }
        }

        free(v15);
      }
    }
  }
}

- (void)_extractExceptionReasonUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime( a3.var0,  a3.var1,  "CoreFoundation",  0x8000000000000000LL);
  uint64_t v7 = v6;
  if ((CSIsNull(SymbolOwnerWithNameAtTime, v6) & 1) == 0)
  {
    uint64_t SymbolWithName = CSSymbolOwnerGetSymbolWithName(SymbolOwnerWithNameAtTime, v7, "__last_exception_os_log_pack__");
    uint64_t v10 = v9;
    if ((CSIsNull(SymbolWithName, v9) & 1) == 0)
    {
      vm_map_t task = self->_task;
      vm_address_t Range = CSSymbolGetRange(SymbolWithName, v10);
      uint64_t v13 = sub_10000AB34(task, Range, 0x400uLL);
      if (v13)
      {
        uint64_t v14 = v13;
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v13, 1024LL));
        free(v14);
        bzero(v46, 0x400uLL);
        size_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v46, 1024LL));
        unsigned __int8 v17 = [v15 isEqualToData:v16];

        if ((v17 & 1) == 0)
        {
          id v18 = [[VMUVMRegionIdentifier alloc] initWithTask:self->_task pid:self->_proc_id options:1];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 regions]);
          id v20 = objc_alloc_init(&OBJC_CLASS___OSAOsLogPackParser);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_10000AC64;
          v43[3] = &unk_100030E20;
          v43[4] = self;
          [v20 setPointerPointsToImmutableMemory:v43];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_10000AC70;
          v41[3] = &unk_100030E48;
          v41[4] = self;
          id v21 = v19;
          id v42 = v21;
          [v20 setModulePathForImmutableMemoryPointer:v41];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472LL;
          v40[2] = sub_10000ACB4;
          v40[3] = &unk_100030E70;
          v40[4] = self;
          [v20 setReadCStringFromTarget:v40];
          size_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 parse:v15]);
          if ([v22 count])
          {
            mach_vm_size_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 formatString]);

            if (v23)
            {
              unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100038570));
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v20 formatStringOriginatingModulePath]);

              if (v25)
              {
                uint64_t v39 = v24;
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v20 formatStringOriginatingModulePath]);
                unsigned int v27 = [v26 hasPrefix:@"/System/"];

                if (v27)
                {
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v20 formatStringOriginatingModulePath]);
                  int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastPathComponent]);

                  unint64_t v24 = v39;
                  if ([v39 containsObject:v29])
                  {
                    uint64_t v30 = objc_claimAutoreleasedReturnValue([v20 filterOutSensitiveStrings:v22]);

                    v44[0] = @"composed_message";
                    uint64_t v37 = (void *)v30;
                    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v20 compose:v30]);
                    v45[0] = v38;
                    v44[1] = @"format_string";
                    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v20 formatString]);
                    v45[1] = v36;
                    v44[2] = @"arguments";
                    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v20 extractArguments:v30]);
                    v45[2] = v31;
                    v45[3] = @"objc-exception";
                    v44[3] = @"type";
                    v44[4] = @"class";
                    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readIndirectImmutableStringFromSymbol:symbolOwner:]( self,  "_readIndirectImmutableStringFromSymbol:symbolOwner:",  "__last_exception_class_name__",  SymbolOwnerWithNameAtTime,  v7));
                    v45[4] = v32;
                    v44[5] = @"name";
                    size_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readIndirectImmutableStringFromSymbol:symbolOwner:]( self,  "_readIndirectImmutableStringFromSymbol:symbolOwner:",  "__last_exception_name__",  SymbolOwnerWithNameAtTime,  v7));
                    v45[5] = v33;
                    v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  6LL));
                    exceptionReasonDetails = self->_exceptionReasonDetails;
                    self->_exceptionReasonDetails = v34;

                    unint64_t v24 = v39;
                    size_t v22 = v37;
                  }
                }

                else
                {
                  unint64_t v24 = v39;
                }
              }
            }
          }
        }
      }
    }
  }

- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atSymbol:(_CSTypeRef)a4
{
  unint64_t v7 = 0LL;
  uint64_t Range = CSSymbolGetRange(a4.var0, a4.var1);
  mapped_memory_read_pointer(a3, Range, &v7);
  return v7;
}

- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atAddress:(unint64_t)a4
{
  unint64_t v5 = 0LL;
  mapped_memory_read_pointer(a3, a4, &v5);
  return v5;
}

- (id)_readStringAtTaskAddress:(unint64_t)a3 maxLength:(unint64_t)a4 immutableCheck:(BOOL *)a5
{
  unint64_t v5 = -[OSACrashReport _copyStringFromTask:atAddress:maxLength:immutableCheck:]( self,  "_copyStringFromTask:atAddress:maxLength:immutableCheck:",  self->_task,  a3,  a4,  a5);
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    free(v6);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (id)_readIndirectImmutableStringFromSymbol:(const char *)a3 symbolOwner:(_CSTypeRef)a4
{
  uint64_t SymbolWithName = CSSymbolOwnerGetSymbolWithName(a4.var0, a4.var1, a3);
  uint64_t v7 = v6;
  if ((CSIsNull(SymbolWithName, v6) & 1) != 0
    || (vm_map_t task = self->_task, Range = CSSymbolGetRange(SymbolWithName, v7),
                            (uint64_t v10 = sub_10000AB34(task, Range, 8uLL)) == 0LL))
  {
    uint64_t v13 = @"<not available>";
  }

  else
  {
    id v11 = v10;
    char v15 = 0;
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readStringAtTaskAddress:maxLength:immutableCheck:]( self,  "_readStringAtTaskAddress:maxLength:immutableCheck:",  *v10,  0LL,  &v15));
    uint64_t v13 = v12;
    if (!v15)
    {

      uint64_t v13 = @"<redacted>";
    }

    free(v11);
  }

  return v13;
}

- (char)_copyStringFromTask:(unsigned int)a3 atAddress:(unint64_t)a4 maxLength:(unint64_t)a5 immutableCheck:(BOOL *)a6
{
  id v9 = -[OSACrashReport _regionAtAddress:immutableCheck:](self, "_regionAtAddress:immutableCheck:", a4, a6);
  unint64_t v11 = 2 * vm_page_size;
  if (a5) {
    unint64_t v11 = a5;
  }
  else {
    vm_size_t v12 = (vm_size_t)v9 + v10 - a4;
  }
  return (char *)sub_10000AB34(a3, a4, v12);
}

- (int)_regionInfoAtAddress:(unint64_t)a3 regionInfo:(vm_region_submap_short_info_64 *)a4 regionAddress:(unint64_t *)a5 regionSize:(unint64_t *)a6
{
  natural_t nesting_depth = 999999;
  mach_vm_address_t v24 = a3;
  if (a5)
  {
    if (a6)
    {
      mach_msg_type_number_t infoCnt = 12;
      int result = mach_vm_region_recurse(self->_task, &v24, a6, &nesting_depth, &a4->protection, &infoCnt);
      *a5 = v24;
      return result;
    }

    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_1000216E4(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_1000216B0(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 1;
}

- (_VMURange)_regionAtAddress:(unint64_t)a3 immutableCheck:(BOOL *)a4
{
  unint64_t v10 = 0LL;
  unint64_t v11 = a3;
  if (-[OSACrashReport _regionInfoAtAddress:regionInfo:regionAddress:regionSize:]( self,  "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:",  a3,  v12,  &v11,  &v10)
    || (v12[0] & 1) == 0)
  {
    unint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
  }

  if (a4)
  {
    BOOL v7 = 0;
    if ((BYTE4(v12[0]) & 2) == 0)
    {
      unint64_t sharedCacheBase = self->_sharedCacheBase;
      if (v11 >= sharedCacheBase && v10 + v11 <= self->_sharedCacheSize + sharedCacheBase) {
        BOOL v7 = 1;
      }
    }

    *a4 = v7;
  }

  unint64_t v9 = v10;
  unint64_t v8 = v11;
  result.unint64_t var1 = v9;
  result.unint64_t var0 = v8;
  return result;
}

- (BOOL)_isMemoryImmutableAtAddress:(unint64_t)a3
{
  BOOL v4 = 0;
  -[OSACrashReport _regionAtAddress:immutableCheck:](self, "_regionAtAddress:immutableCheck:", a3, &v4);
  return v4;
}

- (id)_readDataAtAddress:(unint64_t)a3 size:(unint64_t)a4
{
  BOOL is64Bit = self->_is64Bit;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", a4));
  if (v8)
  {
    if (!is64Bit) {
      a3 = a3;
    }
    for (unint64_t i = a3 + a4; a3 < i; a3 += v13)
    {
      unint64_t v10 = (char *)-[OSACrashReport _regionAtAddress:immutableCheck:]( self,  "_regionAtAddress:immutableCheck:",  a3,  0LL);
      if (!v10) {
        break;
      }
      uint64_t v12 = &v10[v11];
      unint64_t v13 = (unint64_t)&v12[-a3] >= a4 ? a4 : (unint64_t)&v12[-a3];
      data[0] = 0LL;
      mach_msg_type_number_t dataCnt = 0;
      if (vm_read(self->_task, a3, (vm_size_t)&v12[-a3], data, &dataCnt)) {
        break;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data[0], dataCnt));
      vm_deallocate(mach_task_self_, data[0], dataCnt);
      if (!v14) {
        break;
      }
      [v8 appendData:v14];
    }
  }

  if ([v8 length]) {
    uint64_t v15 = v8;
  }
  else {
    uint64_t v15 = 0LL;
  }
  id v16 = v15;

  return v16;
}

- (void)_addASILine:(id)a3 fromOwner:(id)a4 isSafe:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    -[NSMutableDictionary addLines:fromOwner:]( self->_applicationSpecificInfoFullSensitive,  "addLines:fromOwner:",  v8,  v9);
    if (v5
      || (unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration sharedInstance]( OSASystemConfiguration,  "sharedInstance")),  v11 = [v10 appleInternal],  v10,  v11))
    {
      -[NSMutableDictionary addLines:fromOwner:](self->_applicationSpecificInfo, "addLines:fromOwner:", v8, v9);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"sensitive";
      int v13 = 138543874;
      id v14 = v9;
      if (v5) {
        uint64_t v12 = @"safe";
      }
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ASI found [%{public}@] (%@) '%{public}@'",  (uint8_t *)&v13,  0x20u);
    }
  }
}

- (void)_extractInfoPlistFromSymbolOwner:(_CSTypeRef)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t Name = CSSymbolOwnerGetName(a3.var0, a3.var1);
  if (Name)
  {
    uint64_t v7 = Name;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport procName](self, "procName"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    unsigned int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      SectionWithuint64_t Name = CSSymbolOwnerGetSectionWithName(var0, var1, "__TEXT __info_plist");
      uint64_t Range = CSRegionGetRange(SectionWithName, v12);
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport _readDataAtAddress:size:](self, "_readDataAtAddress:size:", Range, v14));
      if (v15)
      {
        id v27 = 0LL;
        id v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v15,  0LL,  0LL,  &v27));
        id v17 = v27;
        if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10002174C();
        }
      }

      else
      {
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v18) {
          sub_100021718(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        id v16 = 0LL;
      }

      info_plist = self->_info_plist;
      self->_info_plist = v16;
    }
  }

- (void)_extractCrashReporterAnnotationsFromSymbolOwner:(_CSTypeRef)a3 withMemory:(mapped_memory_t *)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if (qword_10003EEB0 != -1) {
    dispatch_once(&qword_10003EEB0, &stru_100030E90);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B650;
  v7[3] = &unk_100030EB8;
  v7[4] = self;
  v7[5] = var0;
  v7[6] = var1;
  CSSymbolOwnerForeachSection(var0, var1, v7);
}

- (void)_extractBinaryImageInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  self->_sharedCacheAddress = CSSymbolicatorGetSharedCacheBaseAddress(var0, var1);
  id v8 = objc_autoreleasePoolPush();
  id v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  taskImages = self->_taskImages;
  self->_taskImages = v9;

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  mapped_memory_cache_for_vm_map_t task = create_mapped_memory_cache_for_task(self->_task, 1LL);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000BB78;
  v24[3] = &unk_100030F08;
  v24[4] = self;
  id v13 = v11;
  id v25 = v13;
  uint64_t v26 = mapped_memory_cache_for_task;
  CSSymbolicatorForeachSymbolOwnerAtTime(var0, var1, 0x8000000000000001LL, v24);
  -[NSMutableArray sortByAddressAndSetInferredSizes](self->_taskImages, "sortByAddressAndSetInferredSizes");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      BOOL v18 = 0LL;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 =  objc_msgSend( v7,  "searchFrame:in:result:",  objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v18), "unsignedLongLongValue", (void)v20),  self->_taskImages,  0);
        BOOL v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }

    while (v16);
  }

  if (mapped_memory_cache_for_task) {
    destroy_mapped_memory_cache(mapped_memory_cache_for_task);
  }

  objc_autoreleasePoolPop(v8);
}

- (unint64_t)_objcSelectorAddressForMessenger:(id)a3 memory:(mapped_memory_t *)a4
{
  if (self->_threadStateFlavor == 1 && self->_threadState[0] == 6) {
    return *(void *)&self->_threadState[4];
  }
  else {
    return 0LL;
  }
}

- (id)_objcSelectorNameForMessenger:(id)a3
{
  id v4 = a3;
  mapped_memory_cache_for_vm_map_t task = create_mapped_memory_cache_for_task(self->_task, 1LL);
  unint64_t v6 = -[OSACrashReport _objcSelectorAddressForMessenger:memory:]( self,  "_objcSelectorAddressForMessenger:memory:",  v4,  mapped_memory_cache_for_task);
  if (v6)
  {
    if (self->_is64Bit) {
      uint64_t v7 = -86000LL;
    }
    else {
      uint64_t v7 = 4294881296LL;
    }
    if (v6 == v7) {
      id v8 = @"_ignoredSelector";
    }
    else {
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readStringAtTaskAddress:maxLength:immutableCheck:]( self,  "_readStringAtTaskAddress:maxLength:immutableCheck:",  v6,  0LL,  0LL));
    }
  }

  else
  {
    id v8 = 0LL;
  }

  destroy_mapped_memory_cache(mapped_memory_cache_for_task);

  return v8;
}

- (void)symbolicateFrame:(unint64_t)a3 adjusted:(unint64_t)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6 andBlock:(id)a7
{
  unint64_t var1 = a5.var1;
  unint64_t var0 = a5.var0;
  id v12 = a6;
  id v13 = (void (**)(id, void *, void *, id))a7;
  id v15 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v14);
  if (dword_10003EE88)
  {
    uint64_t SymbolOwnerWithAddressAtTime = CSSymbolicatorGetSymbolOwnerWithAddressAtTime(var0, var1, a4, 0x8000000000000000LL);
    uint64_t v18 = v17;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10000C264;
    v43[3] = &unk_100030F30;
    unint64_t v45 = a3;
    id v44 = v15;
    CSSymbolOwnerForEachStackFrameAtAddress(SymbolOwnerWithAddressAtTime, v18, a4, v43);
  }

  if ([v15 count])
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 reverseObjectEnumerator]);
    id v20 = [v19 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v35 = v15;
      __int128 v22 = v12;
      id v23 = 0LL;
      uint64_t v24 = *(void *)v40;
      do
      {
        id v25 = 0LL;
        uint64_t v26 = v23;
        do
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v19);
          }
          id v27 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v25);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0, v35));
          id v29 = [v28 unsignedLongLongValue];

          taskImages = self->_taskImages;
          id v38 = v26;
          BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v22 searchFrame:v29 in:taskImages regions:0 result:&v38]);
          id v23 = v38;

          unsigned int v32 = 0LL;
          v13[2](v13, v31, v32, v23);

          id v25 = (char *)v25 + 1;
          uint64_t v26 = v23;
        }

        while (v21 != v25);
        id v21 = [v19 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }

      while (v21);
      id v12 = v22;
      id v15 = v35;
    }

    else
    {
      id v23 = 0LL;
    }
  }

  else
  {
    size_t v33 = self->_taskImages;
    rosettaRegions = self->_rosettaRegions;
    id v37 = 0LL;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 searchFrame:a3 in:v33 regions:rosettaRegions result:&v37]);
    id v23 = v37;
    v13[2](v13, v19, 0LL, v23);
  }
}

- (id)composeFrame:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  [v8 setObject:v9 forKeyedSubscript:@"imageIndex"];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
  [v8 setObject:v10 forKeyedSubscript:@"imageOffset"];

  if ([v5 count]) {
    [v8 addEntriesFromDictionary:v5];
  }

  return v8;
}

- (unsigned)_extractBacktraceInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  id v59 = a4;
  uint64_t v70 = 0LL;
  __int128 v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  int v73 = 0;
  context = objc_autoreleasePoolPush();
  id v5 = [[VMUSampler alloc] initWithPID:self->_proc_id task:self->_task processName:self->_procName is64Bit:self->_is64Bit options:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sampleAllThreadsOnce]);
  if (![v6 count]) {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"[VMUSampler sampleAllThreadsOfTask:withSymbolicator] returned no stacks"];
  }
  uint64_t v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  threadInfos = self->_threadInfos;
  self->_threadInfos = v7;

  unint64_t v9 = 0LL;
  unsigned int v52 = 0;
  unint64_t v50 = -1LL;
  id v51 = 0LL;
  v53 = v6;
  id v54 = v5;
  while ((unint64_t)[v6 count] > v9)
  {
    __int128 v57 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v9]);
    id v12 = [v11 thread];
    mach_msg_type_number_t thread_info_outCnt = 6;
    if (thread_info((thread_inspect_t)v12, 4u, thread_info_out, &thread_info_outCnt)) {
      uint64_t v13 = -1LL;
    }
    else {
      uint64_t v13 = *(void *)thread_info_out;
    }
    if (v13 != -1)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      [v57 setObject:v14 forKeyedSubscript:@"id"];

      exclaveContainer = self->_exclaveContainer;
      if (exclaveContainer)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OSAExclaveContainer threadIdToScId](exclaveContainer, "threadIdToScId"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

        if (v18)
        {
          exclaveThreadNumbers = self->_exclaveThreadNumbers;
          if (!exclaveThreadNumbers)
          {
            id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            id v21 = self->_exclaveThreadNumbers;
            self->_exclaveThreadNumbers = v20;

            exclaveThreadNumbers = self->_exclaveThreadNumbers;
          }

          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
          -[NSMutableArray addObject:](exclaveThreadNumbers, "addObject:", v22);
        }
      }
    }

    if (self->_crashedThreadNumber < 0)
    {
      if ([v11 backtraceLength] > v52)
      {
        unsigned int v52 = [v11 backtraceLength];
        self->_highlightedThreadNumber = v9;
        unint64_t v50 = v13;
        id v51 = v12;
      }

      unint64_t threadId = self->_threadId;
      if (threadId != -1LL && v13 == threadId || threadId == -1LL && (_DWORD)v12 == self->_threadPortOriginal)
      {
        threadPortPedigree = self->_threadPortPedigree;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread match 0x%x ID(0x%llX)",  v12,  threadId));
        -[NSMutableArray addObject:](threadPortPedigree, "addObject:", v25);

        self->_crashedThreadNumber = v9;
        *((_DWORD *)v71 + 6) = (_DWORD)v12;
        self->_highlightedThreadNumber = -1;
      }
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 threadNameForThread:v12]);
    if ([v26 length])
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 stringByReplacingOccurrencesOfString:@"\n" withString:@" "]);

      uint64_t v28 = OSASanitizePath(v27, 0LL);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      [v57 setObject:v29 forKeyedSubscript:@"name"];
    }

    else
    {
      uint64_t v27 = (uint64_t)v26;
    }

    unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "dispatchQueueNameForSerialNumber:",  objc_msgSend(v11, "dispatchQueueSerialNumber")));
    if ([v56 length])
    {
      uint64_t v30 = OSASanitizePath(v56, 0LL);
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      [v57 setObject:v31 forKeyedSubscript:@"queue"];
    }

    unsigned int v32 = [v11 backtrace];
    __int128 v55 = (void *)v27;
    size_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 backtraceLength]));
    for (unint64_t i = 0; i < [v11 backtraceLength]; ++i)
    {
      uint64_t v35 = v32[i];
      if (i) {
        BOOL v36 = v35 == 0;
      }
      else {
        BOOL v36 = 1;
      }
      v60[0] = _NSConcreteStackBlock;
      uint64_t v37 = !v36;
      uint64_t v38 = v35 - v37;
      v60[1] = 3221225472LL;
      v60[2] = sub_10000CC88;
      v60[3] = &unk_100030F58;
      int v65 = i;
      int v66 = v9;
      int v67 = (int)v12;
      v60[4] = self;
      int v62 = &v70;
      uint64_t v63 = v13;
      uint64_t v64 = v35;
      id v61 = v33;
      -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:]( self,  "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:",  v35,  v38,  a3.var0,  a3.var1,  v59,  v60);
    }

    [v57 setObject:v33 forKeyedSubscript:@"frames"];
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport decode_threadState:withSymbolicator:usingCatalog:]( self,  "decode_threadState:withSymbolicator:usingCatalog:",  v12,  a3.var0,  a3.var1,  v59));
    [v57 setObject:v39 forKeyedSubscript:@"threadState"];

    -[NSMutableArray addObject:](self->_threadInfos, "addObject:", v57);
    ++v9;
    id v6 = v53;
    id v5 = v54;
  }

  mach_port_name_t v40 = *((_DWORD *)v71 + 6);
  if (v40
    || (__int128 v41 = self->_threadPortPedigree,
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"override via deepest 0x%x ID(0x%llX)",  v51,  v50)),  -[NSMutableArray addObject:](v41, "addObject:", v42),  v42,  self->_threadId = v50,  *((_DWORD *)v71 + 6) = (_DWORD)v51,  (mach_port_name_t v40 = v51) != 0))
  {
    uint64_t v43 = mach_port_mod_refs(mach_task_self_, v40, 0, 1);
    id v44 = self->_threadPortPedigree;
    unint64_t v45 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"port retain 0x%x result 0x%x (%s)",  *((unsigned int *)v71 + 6),  v43,  mach_error_string(v43));
    unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    -[NSMutableArray addObject:](v44, "addObject:", v46);
  }

  objc_autoreleasePoolPop(context);
  unsigned int v47 = *((_DWORD *)v71 + 6);
  _Block_object_dispose(&v70, 8);

  return v47;
}

- (id)_findContainingRegion:(id)a3 address:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_10000D024;
  v9[3] = &unk_100030F78;
  v9[4] = a4;
  id v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v6]);
  }

  return v7;
}

- (id)_findContainingTextSegmentRegion:(id)a3 address:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_10000D0F0;
  v9[3] = &unk_100030F78;
  v9[4] = a4;
  id v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v6]);
  }

  return v7;
}

- (id)_readMallocZoneArrayFromMemory:(mapped_memory_t *)a3 usingSymbolicator:(_CSTypeRef)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime( a4.var0,  a4.var1,  "malloc_zones",  "libsystem_malloc.dylib",  0x8000000000000000LL);
  uint64_t v10 = v9;
  uint64_t SymbolWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime( var0,  var1,  "malloc_num_zones",  "libsystem_malloc.dylib",  0x8000000000000000LL);
  uint64_t v13 = v12;
  if (((CSIsNull(SymbolWithNameFromSymbolOwnerWithNameAtTime, v10) & 1) != 0
     || CSIsNull(SymbolWithNameAtTime, v13))
    && ((SymbolWithNameFromSymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime( var0,  var1,  "malloc_zones",  0x8000000000000000LL),  uint64_t v10 = v14,  SymbolWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime( var0,  var1,  "malloc_num_zones",  0x8000000000000000LL),  v13 = v15,  (CSIsNull(SymbolWithNameFromSymbolOwnerWithNameAtTime, v10) & 1) != 0)
     || CSIsNull(SymbolWithNameAtTime, v13)))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }

  else
  {
    id v17 = -[OSACrashReport _readDataAtAddress:size:]( self,  "_readDataAtAddress:size:",  CSSymbolGetRange(SymbolWithNameAtTime, v13),  4LL);
    id v18 = objc_claimAutoreleasedReturnValue(v17);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readDataAtAddress:size:]( self,  "_readDataAtAddress:size:",  -[OSACrashReport _readAddressFromMemory:atSymbol:]( self,  "_readAddressFromMemory:atSymbol:",  a3,  SymbolWithNameFromSymbolOwnerWithNameAtTime,  v10),  8 * *(int *)[v18 bytes]));
  }

  return v16;
}

- (id)_readMallocZoneArray:(_CSTypeRef)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  mapped_memory_cache_for_vm_map_t task = create_mapped_memory_cache_for_task(self->_task, 1LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readMallocZoneArrayFromMemory:usingSymbolicator:]( self,  "_readMallocZoneArrayFromMemory:usingSymbolicator:",  mapped_memory_cache_for_task,  var0,  var1));
  destroy_mapped_memory_cache(mapped_memory_cache_for_task);
  return v7;
}

- (unint64_t)_findMallocZone:(id)a3 usingSymbolicator:(_CSTypeRef)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v7 = a3;
  mapped_memory_cache_for_vm_map_t task = create_mapped_memory_cache_for_task(self->_task, 1LL);
  id v9 = objc_claimAutoreleasedReturnValue( -[OSACrashReport _readMallocZoneArrayFromMemory:usingSymbolicator:]( self, "_readMallocZoneArrayFromMemory:usingSymbolicator:", mapped_memory_cache_for_task, var0, var1));
  uint64_t v10 = (unint64_t *)[v9 bytes];
  unint64_t v11 = (unint64_t)[v9 length];
  if (v11 < 8)
  {
LABEL_5:
    unint64_t v13 = 0LL;
  }

  else
  {
    unint64_t v12 = v11 >> 3;
    while (1)
    {
      unint64_t v13 = *v10;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readStringAtTaskAddress:maxLength:immutableCheck:]( self,  "_readStringAtTaskAddress:maxLength:immutableCheck:",  -[OSACrashReport _readAddressFromMemory:atAddress:]( self,  "_readAddressFromMemory:atAddress:",  mapped_memory_cache_for_task,  *v10 + 72),  1024LL,  0LL));
      unsigned int v15 = [v14 isEqualToString:v7];

      if (v15) {
        break;
      }
      ++v10;
      if (!--v12) {
        goto LABEL_5;
      }
    }
  }

  destroy_mapped_memory_cache(mapped_memory_cache_for_task);

  return v13;
}

- (id)_extractMallocTraceInfo:(id *)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a3->var2));
  if (a3->var2)
  {
    unint64_t v11 = 0LL;
    do
    {
      unint64_t v12 = a3->var3[v11];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000D630;
      v17[3] = &unk_100030FA0;
      id v18 = v10;
      id v19 = self;
      -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:]( self,  "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:",  v12,  v12,  var0,  var1,  v9,  v17);

      ++v11;
    }

    while (v11 < a3->var2);
  }

  v20[0] = @"id";
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var0));
  v21[0] = v13;
  v20[1] = @"time";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var1));
  v20[2] = @"frames";
  v21[1] = v14;
  v21[2] = v10;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));

  return v15;
}

- (BOOL)_isPGMCrashType
{
  return self->_exceptionType == 1 && self->_signal == 10;
}

- (void)_extractPGMReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  id v8 = [[VMUVMRegionIdentifier alloc] initWithTask:self->_task pid:self->_proc_id options:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 regions]);
  int64_t v10 = self->_exceptionCode[1];
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[OSACrashReport _findContainingRegion:address:](self, "_findContainingRegion:address:", v9, v10));
  unint64_t v12 = (void *)v11;
  if (v11 && *(_DWORD *)(v11 + OBJC_IVAR___VMUVMRegion_user_tag) == 13)
  {
    id v24 = objc_claimAutoreleasedReturnValue( -[OSACrashReport _readMallocZoneArray:]( self, "_readMallocZoneArray:", var0, var1));
    if (pgm_extract_report_from_corpse( v10,  v25,  self->_task,  [v24 bytes],  (unint64_t)objc_msgSend(v24, "length") >> 3,  sub_10000AB34))
    {
      probGuardReport = self->_probGuardReport;
      self->_probGuardReport = (NSDictionary *)&off_100037F58;
    }

    else
    {
      if (v26)
      {
        probGuardReport = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v27,  var0,  var1,  v7));
        if (v26 < 2) {
          uint64_t v14 = @"<unavailable>";
        }
        else {
          uint64_t v14 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v28,  var0,  var1,  v7));
        }
      }

      else
      {
        probGuardReport = (NSDictionary *)@"<unavailable>";
        uint64_t v14 = @"<unavailable>";
      }

      id v23 = (__CFString *)v14;
      v29[0] = @"allocationTrace";
      v29[1] = @"deallocationTrace";
      v30[0] = probGuardReport;
      v30[1] = v14;
      v29[2] = @"errorType";
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25[0]));
      v30[2] = v22;
      v29[3] = @"confidence";
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25[1]));
      v30[3] = v21;
      v29[4] = @"faultAddress";
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[2]));
      v30[4] = v20;
      v29[5] = @"nearestAllocation";
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[3]));
      v30[5] = v15;
      v29[6] = @"allocationSize";
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[4]));
      v30[6] = v16;
      v29[7] = @"allocationState";
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25[5]));
      v30[7] = v17;
      id v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  8LL));
      id v19 = self->_probGuardReport;
      self->_probGuardReport = v18;
    }
  }
}

- (void)_extractPGMLibpasReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  mapped_memory_cache_for_vm_map_t task = create_mapped_memory_cache_for_task(self->_task, 1LL);
  SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime( var0,  var1,  "pas_root_for_libmalloc_enumeration",  "JavaScriptCore",  0x8000000000000000LL);
  unint64_t v10 = -[OSACrashReport _readAddressFromMemory:atSymbol:]( self,  "_readAddressFromMemory:atSymbol:",  mapped_memory_cache_for_task,  SymbolWithNameFromSymbolOwnerWithNameAtTime,  v9);
  if (!v10) {
    goto LABEL_4;
  }
  if (!&_PASReportCrashExtractResults)
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Could not locate PASReportCrashExtractResults in JavaScriptCore."];
LABEL_4:
    destroy_mapped_memory_cache(mapped_memory_cache_for_task);
    return;
  }

  if (PASReportCrashExtractResults(self->_exceptionCode[1], v10, 2LL, self->_task, v17, sub_10000AB34))
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Extracting libpas PGM metadata failed."];
  }

  else
  {
    v18[0] = @"allocationTrace";
    v18[1] = @"deallocationTrace";
    v19[0] = @"<unknown>";
    v19[1] = @"<unknown>";
    v18[2] = @"errorType";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17[0]));
    v19[2] = v11;
    v18[3] = @"confidence";
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17[1]));
    v19[3] = v12;
    v18[4] = @"faultAddress";
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v17[3]));
    v19[4] = v13;
    v19[5] = &off_1000380C0;
    v18[5] = @"nearestAllocation";
    v18[6] = @"allocationSize";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v17[4]));
    v18[7] = @"allocationState";
    v19[6] = v14;
    v19[7] = @"unknown";
    unsigned int v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  8LL));
    probGuardReport = self->_probGuardReport;
    self->_probGuardReport = v15;
  }

  destroy_mapped_memory_cache(mapped_memory_cache_for_task);
}

- (BOOL)_isMTECrash
{
  return (self->_exceptionType & 1) != 0 && (unint64_t)(*self->_exceptionCode - 262) < 3;
}

- (void)_extractMemoryErrorReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if (-[OSACrashReport _isMTECrash](self, "_isMTECrash"))
  {
    int64_t v8 = self->_exceptionCode[1];
    SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime( var0,  var1,  "sanitizers_report_globals",  "libsystem_sanitizers.dylib",  0x8000000000000000LL);
    uint64_t v11 = v10;
    if ((CSIsNull(SymbolWithNameFromSymbolOwnerWithNameAtTime, v10) & 1) == 0)
    {
      uint64_t Range = CSSymbolGetRange(SymbolWithNameFromSymbolOwnerWithNameAtTime, v11);
      uint64_t v13 = sanitizers_diagnose_memory_error(self->_task, sub_10000DFE4, sub_10000DFE8, Range, v8, v25);
      if (v13)
      {
        size_t v33 = @"error";
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
        v34 = v14;
        unsigned int v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
        memoryErrorReport = self->_memoryErrorReport;
        self->_memoryErrorReport = v15;
      }

      else
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v27,  var0,  var1,  v7));
        if (v26) {
          memoryErrorReport = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v28,  var0,  var1,  v7));
        }
        else {
          memoryErrorReport = (NSDictionary *)@"<unavailable>";
        }
        v31[0] = @"errorType";
        id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25[0]));
        v32[0] = v24;
        v31[1] = @"faultAddress";
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[1]));
        v32[1] = v17;
        v31[2] = @"blamedAllocation";
        v29[0] = @"address";
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[2]));
        v30[0] = v18;
        v29[1] = @"size";
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v25[3]));
        v30[1] = v19;
        v29[2] = @"isFreed";
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26));
        v30[2] = v20;
        v30[3] = v14;
        v29[3] = @"allocationTrace";
        v29[4] = @"deallocationTrace";
        v30[4] = memoryErrorReport;
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  5LL));
        v32[2] = v21;
        __int128 v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
        id v23 = self->_memoryErrorReport;
        self->_memoryErrorReport = v22;
      }
    }
  }
}

- (void)_extractSanitizerReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if (*self->_exceptionCode == 63470)
  {
    unint64_t v8 = -[OSACrashReport _findMallocZone:usingSymbolicator:]( self,  "_findMallocZone:usingSymbolicator:",  @"SanitizerMallocZone",  var0,  var1);
    if (v8)
    {
      if (sanitizer_diagnose_fault_from_crash_reporter( self->_exceptionCode[1],  v16,  self->_task,  v8,  sub_10000AB34))
      {
        [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"sanitizer_diagnose_fault_from_crash_reporter() failed.  This should never happen!"];
      }

      else
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v17,  var0,  var1,  v7));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:]( self,  "_extractMallocTraceInfo:withSymbolicator:usingCatalog:",  &v18,  var0,  var1,  v7));
        v19[0] = @"allocationTrace";
        v19[1] = @"deallocationTrace";
        v20[0] = v9;
        v20[1] = v10;
        v19[2] = @"faultAddress";
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16[0]));
        v20[2] = v11;
        v19[3] = @"nearestAllocation";
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16[1]));
        void v20[3] = v12;
        v19[4] = @"allocationSize";
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16[2]));
        v20[4] = v13;
        uint64_t v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  5LL));
        sanitizerReport = self->_sanitizerReport;
        self->_sanitizerReport = v14;
      }
    }
  }
}

- (void)setApplicationSpecificInformation:(const char *)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    -[OSACrashReport _addASILine:fromOwner:isSafe:](self, "_addASILine:fromOwner:isSafe:", v4, @"internal", 1LL);
  }

+ (id)parentBundleURLForAppExtensionBundleURL:(id)a3 error:(id)a4
{
  id v10 = a4;
  id v4 = a3;
  id v5 = [[LSApplicationExtensionRecord alloc] initWithURL:v4 error:&v10];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containingBundleRecord]);
  id v7 = v6;
  if (v6) {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
  }
  else {
    unint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)loadStoreInfo:(id)a3 atURL:(id)a4 forPlatform:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 pathExtension]);
  unsigned int v13 = [v12 isEqualToString:@"appex"];

  if (v13)
  {
    id v14 = [(id)objc_opt_class(a1) parentBundleURLForAppExtensionBundleURL:v9 error:0];
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;

      id v9 = v17;
    }

    else
    {
      BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v18) {
        sub_1000217B4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }

  id v56 = 0LL;
  id v26 = [[LSApplicationRecord alloc] initWithURL:v9 allowPlaceholder:1 error:&v56];
  id v27 = v56;
  BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v58 = a5;
      *(_WORD *)&v58[4] = 2114;
      *(void *)&v58[6] = v8;
      *(_WORD *)&v58[14] = 2114;
      *(void *)&v58[16] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "loadStoreInfo [platform %d] %{public}@ from %{public}@",  buf,  0x1Cu);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
    id v30 = [v29 storeItemIdentifier];

    if (v30)
    {
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v30));
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringValue]);
      [v11 setObject:v32 forKeyedSubscript:@"itemID"];
    }

    size_t v33 = (void *)objc_claimAutoreleasedReturnValue([v26 deviceIdentifierForVendor]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);

    if (v34) {
      [v11 setObject:v34 forKeyedSubscript:@"deviceIdentifierForVendor"];
    }
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
    id v55 = v27;
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v35 storeCohortWithError:&v55]);
    id v37 = v55;

    if (v36)
    {
      [v11 setObject:v36 forKeyedSubscript:@"storeCohortMetadata"];
    }

    else if (v37 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v54 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      *(void *)v58 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unable to retrieve storeCohort: %@",  buf,  0xCu);
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 variantID]);

    if (v39) {
      [v11 setObject:v39 forKeyedSubscript:@"applicationVariant"];
    }
    if ([v26 isBeta])
    {
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"entitledBeta"];
      mach_port_name_t v40 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
      id v41 = [v40 betaVersionIdentifier];
    }

    else
    {
      mach_port_name_t v40 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
      id v41 = [v40 versionIdentifier];
    }

    id v42 = v41;

    if (v42)
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v42));
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 stringValue]);
      [v11 setObject:v44 forKeyedSubscript:@"softwareVersionExternalIdentifier"];
    }

    unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v26 iTunesMetadata]);
    unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 distributorInfo]);
    unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 distributorID]);

    if (v47)
    {
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 getTaskingKey:@"disableDistributorID"]);
      unsigned __int8 v50 = [v49 BOOLValue];

      if ((v50 & 1) == 0) {
        [v11 setObject:v47 forKeyedSubscript:@"distributorID"];
      }
    }
  }

  else
  {
    if (v28)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v58 = v9;
      *(_WORD *)&v58[8] = 2114;
      *(void *)&v58[10] = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to find store record for '%{public}@': %{public}@",  buf,  0x16u);
    }

    id v37 = v27;
  }

  if ([v11 count]) {
    id v51 = v11;
  }
  else {
    id v51 = 0LL;
  }
  id v52 = v51;

  return v52;
}

+ (id)loadBuildInfo:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000218D8();
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"Contents"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"version.plist"]);

  if (v5)
  {
    id v6 = -[NSDictionary initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfURL:", v5);
    id v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v9 = [&off_100038588 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (unint64_t i = 0LL; i != v10; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(&off_100038588);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));
          if (v14) {
            [v8 setObject:v14 forKeyedSubscript:v13];
          }
        }

        id v10 = [&off_100038588 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v10);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10002185C(v8);
    }
  }

  else
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v15) {
      sub_100021828(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    id v8 = 0LL;
  }

  if ([v8 count]) {
    uint64_t v23 = v8;
  }
  else {
    uint64_t v23 = 0LL;
  }
  id v24 = v23;

  return v24;
}

- (void)loadBundleInfo
{
  self->_is_first_party = 1;
  procPath = self->_procPath;
  if (procPath)
  {
    v54[0] = @"CFBundleIdentifier";
    v54[1] = kCFBundleVersionKey;
    v54[2] = @"CFBundleShortVersionString";
    v54[3] = @"DTAppStoreToolsBuild";
    v54[4] = @"LSUIElement";
    v54[5] = @"LSBackgroundOnly";
    v54[6] = @"CFBundlePackageType";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 7LL));
    id v51 = 0LL;
    id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[OSACrashReport findBundleAtPath:withKeys:bundleURL:]( &OBJC_CLASS___OSACrashReport,  "findBundleAtPath:withKeys:bundleURL:",  procPath,  v4,  &v51));
    id v6 = v51;
    id v7 = v51;
    bundle_mach_timebase_info info = self->_bundle_info;
    self->_bundle_mach_timebase_info info = v5;

    id v10 = self->_bundle_info;
    if (v10)
    {
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  @"CFBundleIdentifier"));
      bundle_id = self->_bundle_id;
      self->_bundle_id = v11;

      if (self->_bundle_id)
      {
        objc_storeStrong((id *)&self->_bundle_url, v6);
        uint64_t v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[OSACrashReport loadStoreInfo:atURL:forPlatform:]( &OBJC_CLASS___OSACrashReport,  "loadStoreInfo:atURL:forPlatform:",  self->_bundle_id,  v7,  self->_platform));
        store_mach_timebase_info info = self->_store_info;
        self->_store_mach_timebase_info info = v13;

        BOOL v15 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_store_info,  "objectForKeyedSubscript:",  @"itemID"));
        adam_id = self->_adam_id;
        self->_adam_id = v15;

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_store_info,  "objectForKeyedSubscript:",  @"thirdParty"));
        self->_is_first_party = [v17 BOOLValue] ^ 1;

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_store_info,  "objectForKeyedSubscript:",  @"entitledBeta"));
        if (v18)
        {
          self->_is_beta = 1;
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:@"beta" forKeyedSubscript:kOSALogOptionRouting];
        }
      }

      uint64_t v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  @"LSUIElement"));
      uint64_t v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  @"LSBackgroundOnly"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  @"CFBundlePackageType"));
      BOOL v22 = (!v19
          || (objc_opt_respondsToSelector(v19, "BOOLValue") & 1) == 0
          || (-[NSDictionary BOOLValue](v19, "BOOLValue") & 1) == 0)
         && (!v20
          || (objc_opt_respondsToSelector(v20, "BOOLValue") & 1) == 0
          || (-[NSDictionary BOOLValue](v20, "BOOLValue") & 1) == 0)
         && (!v21
          || (objc_opt_respondsToSelector(v21, "isEqualToString:") & 1) == 0
          || ([v21 isEqualToString:@"XPC!"] & 1) == 0);
      self->_bundleVisibility = v22;
      BOOL v31 = self->_bundle_info;
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0) {
        -[NSDictionary removeObjectsForKeys:](self->_bundle_info, "removeObjectsForKeys:", &off_1000385A0);
      }
    }

    else
    {
      if (!self->_info_plist) {
        goto LABEL_24;
      }
      id v46 = v7;
      uint64_t v19 = (NSDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v9);
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      v52[0] = kCFBundleVersionKey;
      v52[1] = @"CFBundleShortVersionString";
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL));
      id v40 = [v39 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v48;
        do
        {
          for (unint64_t i = 0LL; i != v41; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v48 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
            unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_info_plist,  "objectForKeyedSubscript:",  v44,  v46));
            -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v45, v44);
          }

          id v41 = [v39 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }

        while (v41);
      }

      if (!-[NSDictionary count](v19, "count"))
      {
        id v7 = v46;
        goto LABEL_23;
      }

      uint64_t v19 = v19;
      uint64_t v20 = self->_bundle_info;
      self->_bundle_mach_timebase_info info = v19;
      id v7 = v46;
    }

LABEL_23:
LABEL_24:
    size_t v33 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  @"CFBundleShortVersionString",  v46));
    short_vers = self->_short_vers;
    self->_short_vers = v33;

    uint64_t v35 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_bundle_info,  "objectForKeyedSubscript:",  kCFBundleVersionKey));
    bundleVersion = self->_bundleVersion;
    self->_bundleVersion = v35;

    id v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[OSACrashReport loadBuildInfo:](&OBJC_CLASS___OSACrashReport, "loadBuildInfo:", v7));
    build_mach_timebase_info info = self->_build_info;
    self->_build_mach_timebase_info info = v37;

    goto LABEL_25;
  }

  BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v23) {
    sub_100021940(v23, v24, v25, v26, v27, v28, v29, v30);
  }
LABEL_25:
  -[OSACrashReport captureLSInfo](self, "captureLSInfo");
}

- (void)_extractVMMap:(_CSTypeRef)a3
{
  id v6 = [[VMUVMRegionIdentifier alloc] initWithTask:self->_task pid:self->_proc_id options:1];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue([v6 descriptionForRegionTotalsWithOptions:1]);
  vmSummary = self->_vmSummary;
  self->_vmSummary = v4;
}

- (id)_descriptionForException:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  [v4 appendString:v5];

  [v4 appendString:@"\n"];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 callStackReturnAddresses]);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( v4,  "appendFormat:",  @"0x%08x\n",  objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "intValue"));
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v4;
}

- (id)decode_cpuType
{
  uint64_t cpuType = self->_cpuType;
  if (self->_is64Bit && (_DWORD)cpuType == 12)
  {
    uint64_t cpuType = 16777228LL;
    self->_uint64_t cpuType = 16777228;
  }

  return (id)OSACPUTypeToString(cpuType, a2);
}

- (id)decode_signal
{
  uint64_t signal = self->_signal;
  id v4 = &stru_100031928;
  switch((int)signal)
  {
    case 0:
      return v4;
    case 1:
      return @"SIGHUP";
    case 2:
      return @"SIGINT";
    case 3:
      return @"SIGQUIT";
    case 4:
      return @"SIGILL";
    case 5:
      return @"SIGTRAP";
    case 6:
      return @"SIGABRT";
    case 7:
      return @"SIGEMT";
    case 8:
      return @"SIGFPE";
    case 9:
      if ((self->_cs_status & 0x1000000) != 0) {
        id v6 = @"SIGKILL - CODESIGNING";
      }
      else {
        id v6 = @"SIGKILL";
      }
      return v6;
    case 10:
      return @"SIGBUS";
    case 11:
      return @"SIGSEGV";
    case 12:
      return @"SIGSYS";
    case 13:
      return @"SIGPIPE";
    case 14:
      return @"SIGALRM";
    case 15:
      return @"SIGTRM";
    case 16:
      return @"SIGURG";
    case 17:
      return @"SIGSTOP";
    case 18:
      return @"SIGTSTP";
    case 19:
      return @"SIGCONT";
    case 20:
      return @"SIGCHLD";
    case 21:
      return @"SIGTTIN";
    case 22:
      return @"SIGTTOU";
    case 23:
      return @"SIGIO";
    case 24:
      return @"SIGXCPU";
    case 25:
      return @"SIGXFSZ";
    case 26:
      return @"SIGVTALRM";
    case 27:
      return @"SIGPROF";
    case 28:
      return @"SIGWINCH";
    case 29:
      return @"SIGINFO";
    case 30:
      return @"SIGUSR1";
    case 31:
      id v4 = @"SIGUSR2";
      return v4;
    default:
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Signal %d",  signal));
      return v4;
  }

- (id)decode_exceptionType
{
  uint64_t exceptionType = self->_exceptionType;
  if ((exceptionType - 1) >= 0xD) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%08X",  exceptionType));
  }
  else {
    return *(&off_1000311E0 + (int)exceptionType - 1);
  }
}

- (void)captureDiagInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v6 = [v5 appleInternal];
  int v7 = byte_10003EE90;

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
    spewage_diag = self->_spewage_diag;
    self->_spewage_diag = v10;

    mach_msg_type_number_t init_port_setCnt = 0;
    if (qword_10003EEC0 != -1) {
      dispatch_once(&qword_10003EEC0, &stru_100030FC0);
    }
    __int128 v12 = &selRef_formatString;
    if (dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003EEB8, 0LL))
    {
      __int128 v13 = self->_spewage_diag;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"concurrent diagnostic collection underway",  v14);
    }

    else
    {
      if (mach_ports_lookup(mach_task_self_, &init_port_set, &init_port_setCnt))
      {
        __int128 v15 = self->_spewage_diag;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"mach_ports_lookup failed",  v16);
      }

      else
      {
        mach_port_t task = self->_task;
        if (mach_ports_register(mach_task_self_, &task, 1u))
        {
          uint64_t v17 = self->_spewage_diag;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  @"mach_ports_register failed",  v18);
        }

        else
        {
          if (byte_10003EE91)
          {
            if (*self->_exceptionCode == 3134085662LL) {
              uint64_t v19 = "sysmemreset";
            }
            else {
              uint64_t v19 = "resource";
            }
            procuint64_t Name = self->_procName;
            uint64_t v21 = OSADateFormat(3LL, *(double *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]);
            BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"/var/mobile/Library/Logs/CrashReporter/MemoryGraph_%@_%@-%s",  procName,  v22,  v19));

            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport incidentID](self, "incidentID"));
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"--outputGraph %@ --nonIPSMemgraphCount %lu --ipsIncidentID %@ --rateLimit --getCorpseFromParent %d",  v23,  0LL,  v24,  self->_proc_id));

            uint64_t v26 = sub_10000F9EC((uint64_t)"/usr/bin/leaks", v25, dword_10003EE8C, 0LL);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            self->_spewage_diag_total_length += (unint64_t)[v27 length];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spewage_diag,  "setObject:forKeyedSubscript:",  v27,  @"/usr/bin/leaks");
            uint64_t v28 = (char *)[v27 rangeOfString:@"'.*MemoryGraph_.+\\..+'" options:1024];
            if (v28 == (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"memgraph unable to parse filename from results"];
            }

            else
            {
              uint64_t v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "substringWithRange:", v28 + 1, v29 - 2));
              p_memgraph_fileunsigned int name = &self->_memgraph_filename;
              unint64_t v45 = *p_memgraph_filename;
              *p_memgraph_fileunsigned int name = (NSString *)v43;

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_100021974((uint64_t)p_memgraph_filename, v46, v47, v48, v49, v50, v51, v52);
              }
            }
          }

          else
          {
            id v30 = [v4 count];
            if (-[NSArray count](self->_diagToolExtras, "count"))
            {
              uint64_t v31 = objc_claimAutoreleasedReturnValue([v4 arrayByAddingObjectsFromArray:self->_diagToolExtras]);

              id v4 = (id)v31;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "diag tools include: %@",  buf,  0xCu);
            }

            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            id v23 = v4;
            id v32 = [v23 countByEnumeratingWithState:&v57 objects:v64 count:16];
            if (v32)
            {
              id v33 = v32;
              id obj = v23;
              unint64_t v34 = 0LL;
              uint64_t v35 = *(void *)v58;
              do
              {
                for (unint64_t i = 0LL; i != v33; unint64_t i = (char *)i + 1)
                {
                  if (*(void *)v58 != v35) {
                    objc_enumerationMutation(obj);
                  }
                  if (v34 >= (unint64_t)v30)
                  {
                    id v37 = &stru_100031928;
                  }

                  else
                  {
                    if (self->_exceptionType == 11) {
                      id v37 = @"--excResource";
                    }
                    else {
                      id v37 = @"--shortenedOutput";
                    }
                    ++v34;
                  }

                  id v38 = *(id *)(*((void *)&v57 + 1) + 8LL * (void)i);
                  id v39 = [v38 UTF8String];
                  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ --getCorpseFromParent %d",  v37,  self->_proc_id));
                  id v41 = sub_10000F9EC((uint64_t)v39, v40, dword_10003EE8C, self->_spewage_diag_total_length);
                  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

                  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spewage_diag,  "setObject:forKeyedSubscript:",  v42,  v38);
                  self->_spewage_diag_total_length += (unint64_t)[v42 length];
                }

                id v33 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
              }

              while (v33);
              id v23 = obj;
              id v4 = obj;
              __int128 v12 = &selRef_formatString;
            }

            else
            {
              id v4 = v23;
            }
          }

          mach_ports_register(mach_task_self_, init_port_set, init_port_setCnt);
        }

        unint64_t v53 = init_port_setCnt;
        if (init_port_setCnt)
        {
          unint64_t v54 = 0LL;
          do
          {
            mach_port_name_t v55 = init_port_set[v54];
            if (v55)
            {
              mach_port_deallocate(mach_task_self_, v55);
              unint64_t v53 = init_port_setCnt;
            }

            ++v54;
          }

          while (v54 < v53);
        }

        else
        {
          unint64_t v53 = 0LL;
        }

        mig_deallocate((vm_address_t)init_port_set, 4 * v53);
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)v12[471]);
    }
  }
}

- (int64_t)codeZeroForGuardException
{
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_namespace == 23) {
    p_ers_code = (int64_t *)&exit_snapshot->ers_code;
  }
  else {
    p_ers_code = self->_exceptionCode;
  }
  return *p_ers_code;
}

- (id)decode_exceptionCodes
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_exceptionType](self, "decode_exceptionType"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  if (self->_signal)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_signal](self, "decode_signal"));
    [v3 setObject:v5 forKeyedSubscript:@"signal"];
  }

  int exceptionType = self->_exceptionType;
  switch(exceptionType)
  {
    case 12:
      unint64_t v14 = -[OSACrashReport codeZeroForGuardException](self, "codeZeroForGuardException");
      if (*self->_exceptionCode != v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v15 = *self->_exceptionCode;
        *(_DWORD *)buf = 134218240;
        *(void *)__int128 v71 = v15;
        *(_WORD *)&v71[8] = 2048;
        *(void *)&v71[10] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "EXC_GUARD code zero: 0x%llX -> 0x%llX",  buf,  0x16u);
      }

      switch(v14 >> 61)
      {
        case 1uLL:
          [v3 setObject:@"GUARD_TYPE_MACH_PORT" forKeyedSubscript:@"subtype"];
          uint64_t v16 = HIDWORD(v14) & 0x1FFFFFFF;
          if ((HIDWORD(v14) & 0x1FFFFFFFu) > 0x7FF)
          {
            if ((HIDWORD(v14) & 0x1FFFFFFFu) < 0x20000)
            {
              if ((HIDWORD(v14) & 0x1FFFFFFFu) >= 0x4000)
              {
                switch((_DWORD)v16)
                {
                  case 0x4000:
                    uint64_t v17 = @"KERN_FAILURE";
                    goto LABEL_138;
                  case 0x8000:
                    uint64_t v17 = @"KERN_RESOURCE";
                    goto LABEL_138;
                  case 0x10000:
                    uint64_t v17 = @"SEND_INVALID_REPLY";
                    goto LABEL_138;
                }
              }

              else
              {
                switch((_DWORD)v16)
                {
                  case 0x800:
                    uint64_t v17 = @"INVALID_ARGUMENT";
                    goto LABEL_138;
                  case 0x1000:
                    uint64_t v17 = @"RIGHT_EXISTS";
                    goto LABEL_138;
                  case 0x2000:
                    uint64_t v17 = @"KERN_NO_SPACE";
                    goto LABEL_138;
                }
              }
            }

            else if ((HIDWORD(v14) & 0x1FFFFFFFu) < 0x100000)
            {
              switch((_DWORD)v16)
              {
                case 0x20000:
                  uint64_t v17 = @"SEND_INVALID_VOUCHER";
                  goto LABEL_138;
                case 0x40000:
                  uint64_t v17 = @"SEND_INVALID_RIGHT";
                  goto LABEL_138;
                case 0x80000:
                  uint64_t v17 = @"RCV_INVALID_NAME";
                  goto LABEL_138;
              }
            }

            else if ((HIDWORD(v14) & 0x1FFFFFFFu) >= 0x400000)
            {
              if ((_DWORD)v16 == 0x400000)
              {
                uint64_t v17 = @"ILLEGALMOVE_SOFT";
                goto LABEL_138;
              }

              if ((_DWORD)v16 == 0x800000)
              {
                uint64_t v17 = @"REQUIRE_REPLY_PORT_SEMANTICS";
                goto LABEL_138;
              }
            }

            else
            {
              if ((_DWORD)v16 == 0x100000)
              {
                uint64_t v17 = @"RCV_GUARDED_DESC";
                goto LABEL_138;
              }

              if ((_DWORD)v16 == 0x200000)
              {
                uint64_t v17 = @"OVERDEALLOC_SOFT";
LABEL_138:
                uint64_t v72 = v17;
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v72,  1LL));
                [v3 setObject:v51 forKeyedSubscript:@"violations"];

                uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v14));
                [v3 setObject:v52 forKeyedSubscript:@"port"];

                unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
                [v3 setObject:v53 forKeyedSubscript:@"guardId"];

                if ((_DWORD)v14 && (_DWORD)v16 == 3) {
                  id v41 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mach_msg_trap() called with msgh_id %u. The trap is not allowed on this platform.",  v14,  v62,  v63);
                }
                else {
                  id v41 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ on mach port %u (guarded with 0x%016qx)",  v17,  v14,  self->_exceptionCode[1]);
                }
                goto LABEL_142;
              }
            }
          }

          else
          {
            if ((HIDWORD(v14) & 0x1FFFFFFFu) <= 0x1F)
            {
              uint64_t v17 = @"DESTROY";
              switch((int)v16)
              {
                case 1:
                  goto LABEL_138;
                case 2:
                  uint64_t v17 = @"MOD_REFS";
                  break;
                case 3:
                  uint64_t v17 = @"INVALID_OPTIONS";
                  break;
                case 4:
                  uint64_t v17 = @"SET_CONTEXT";
                  break;
                case 5:
                  uint64_t v17 = @"THREAD_SET_STATE";
                  break;
                case 6:
                  uint64_t v17 = @"SET_EXCEPTION_BEHAVIOR";
                  break;
                case 8:
                  uint64_t v17 = @"UNGUARDED";
                  break;
                case 16:
                  uint64_t v17 = @"INCORRECT_GUARD";
                  break;
                default:
                  goto LABEL_136;
              }

              goto LABEL_138;
            }

            if ((HIDWORD(v14) & 0x1FFFFFFFu) > 0xFF)
            {
              switch((_DWORD)v16)
              {
                case 0x100:
                  uint64_t v17 = @"INVALID_RIGHT";
                  goto LABEL_138;
                case 0x200:
                  uint64_t v17 = @"INVALID_NAME";
                  goto LABEL_138;
                case 0x400:
                  uint64_t v17 = @"INVALID_VALUE";
                  goto LABEL_138;
              }
            }

            else
            {
              switch((_DWORD)v16)
              {
                case 0x20:
                  uint64_t v17 = @"ILLEGAL_MOVE";
                  goto LABEL_138;
                case 0x40:
                  uint64_t v17 = @"STRICT_REPLY";
                  goto LABEL_138;
                case 0x80:
                  uint64_t v17 = @"MSG_FILTERED";
                  goto LABEL_138;
              }
            }
          }

- (id)terminationReasonExceptionCode
{
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%llx",  exit_snapshot->ers_code));
  }
  else {
    id v3 = 0LL;
  }
  return v3;
}

- (id)decode_reasonNamespace
{
  if (self->_exit_snapshot)
  {
    v7[0] = &off_1000380D8;
    v7[1] = &off_1000380F0;
    v8[0] = @"JETSAM";
    v8[1] = @"SIGNAL";
    v7[2] = &off_100038108;
    v7[3] = &off_100038120;
    v8[2] = @"CODESIGNING";
    v8[3] = @"HANGTRACER";
    v7[4] = &off_100038138;
    v7[5] = &off_100038150;
    v8[4] = @"TEST";
    v8[5] = @"DYLD";
    v7[6] = &off_100038168;
    void v7[7] = &off_100038180;
    v8[6] = @"LIBXPC";
    v8[7] = @"OBJC";
    v7[8] = &off_100038198;
    v7[9] = &off_1000381B0;
    v8[8] = @"EXEC";
    v8[9] = @"FRONTBOARD";
    v7[10] = &off_1000381C8;
    v7[11] = &off_1000381E0;
    v8[10] = @"TCC";
    v8[11] = @"REPORTCRASH";
    v7[12] = &off_1000381F8;
    v7[13] = &off_100038210;
    v8[12] = @"COREANIMATION";
    v8[13] = @"AGGREGATED";
    v7[14] = &off_100038228;
    v7[15] = &off_100038240;
    v8[14] = @"RUNNINGBOARD";
    v8[15] = @"SKYWALK";
    v7[16] = &off_100038258;
    v7[17] = &off_100038270;
    v8[16] = @"SETTINGS";
    v8[17] = @"LIBSYSTEM";
    v7[18] = &off_100038288;
    v7[19] = &off_1000382A0;
    v8[18] = @"FOUNDATION";
    v8[19] = @"WATCHDOG";
    v7[20] = &off_1000382B8;
    v7[21] = &off_1000382D0;
    v8[20] = @"METAL";
    v8[21] = @"WATCHKIT";
    v7[22] = &off_1000382E8;
    v7[23] = &off_100038300;
    v8[22] = @"GUARD";
    v8[23] = @"ANALYTICS";
    v7[24] = &off_100038318;
    v7[25] = &off_100038330;
    v8[24] = @"SANDBOX";
    v8[25] = @"SECURITY";
    v7[26] = &off_100038348;
    v7[27] = &off_100038360;
    v8[26] = @"ENDPOINTSECURITY";
    v8[27] = @"PAC_EXCEPTION";
    v7[28] = &off_100038378;
    v7[29] = &off_100038390;
    v8[28] = @"BLUETOOTH_CHIP";
    v8[29] = @"PORT_SPACE";
    v7[30] = &off_1000383A8;
    v7[31] = &off_1000383C0;
    v8[30] = @"WEBKIT";
    v8[31] = @"BACKLIGHTSERVICES";
    v7[32] = &off_1000383D8;
    v7[33] = &off_1000383F0;
    v8[32] = @"ROSETTA";
    v8[33] = @"OS_REASON_AUDIO";
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  34LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_exit_snapshot->ers_namespace));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

    if (!v5) {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<0x%X>",  self->_exit_snapshot->ers_namespace));
    }
  }

  else
  {
    id v5 = @"<NO_NS>";
  }

  return v5;
}

- (id)decode_reasonLibSystem
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v23[0] = &off_100038408;
  v23[1] = &off_100038420;
  v24[0] = @"Thread parking or terminating still owning a workloop";
  v24[1] = @"Application Triggered Fault";
  v23[2] = &off_100038438;
  v23[3] = &off_100038450;
  v24[2] = @"Application Triggered Fault";
  v24[3] = @"SecInit Initializer";
  void v23[4] = &off_100038468;
  v24[4] = @"PThread Corruption";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  5LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  unint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  if (self->_workloop_id)
  {
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Workloop: %#llx",  self->_workloop_id));
    [v8 addObject:v9];
  }

  if (self->_queue_serial_no)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dispatch Queue: #%lld",  self->_queue_serial_no));
    [v8 addObject:v10];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  if (![v11 appleInternal] || !self->_exit_payload || !self->_exit_payload_length)
  {

    goto LABEL_11;
  }

  uint64_t ers_code = self->_exit_snapshot->ers_code;
  if (ers_code == 2)
  {
  }

  else
  {

    if (ers_code != 5) {
      goto LABEL_11;
    }
  }

  uint64_t v14 = self->_exit_snapshot->ers_code;
  if (v14 == 5)
  {
    -[OSACrashReport decode_os_log_fault_payload](self, "decode_os_log_fault_payload");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"message"));

    if (v21)
    {
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"message"));
      [v8 addObject:v22];
    }
  }

  else if (v14 == 2)
  {
    unsigned int exit_payload_length = self->_exit_payload_length;
    size_t v16 = (4 * exit_payload_length) | 1;
    uint64_t v17 = (char *)malloc(v16);
    unint64_t v18 = v17;
    exit_payload = (const char *)self->_exit_payload;
    if (!exit_payload[exit_payload_length - 1]) {
      self->_unsigned int exit_payload_length = --exit_payload_length;
    }
    if (v17)
    {
      if (strnvisx(v17, v16, exit_payload, exit_payload_length, 18) != -1)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
        [v8 addObject:v20];
      }

      free(v18);
    }
  }

- (id)decode_reasonCarousel
{
  return &__NSDictionary0__struct;
}

- (void)decode_reasonDyldWithInfo:(id)a3
{
  id v4 = a3;
  v55[0] = &off_1000380D8;
  v55[1] = &off_1000380F0;
  v56[0] = @"Library missing";
  v56[1] = @"Wrong architecture";
  v55[2] = &off_100038108;
  v55[3] = &off_100038120;
  v56[2] = @"Wrong version";
  v56[3] = @"Symbol missing";
  v55[4] = &off_100038138;
  v55[5] = &off_100038150;
  v56[4] = @"Code Signature";
  v56[5] = @"Filesystem Sandbox";
  v55[6] = &off_100038168;
  v56[6] = @"Malformed Mach-O";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  7LL));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  [v4 setObject:v7 forKeyedSubscript:@"indicator"];

  exit_payload = self->_exit_payload;
  if (exit_payload)
  {
    if (self->_exit_payload_length < 0x14)
    {
      [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to extract dyld error info: The size of the data is not what is expected"];
    }

    else
    {
      if ((exit_payload[4] & 1) != 0)
      {
        self->_fatalDyldErrorOnLaunch = 1;
        [v4 setObject:&off_1000385B8 forKeyedSubscript:@"details"];
      }

      id v40 = v5;
      uint64_t v44 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
      uint64_t v10 = *((unsigned int *)exit_payload + 2);
      if ((_DWORD)v10 && v10 < self->_exit_payload_length)
      {
        uint64_t v11 = &exit_payload[v10];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &exit_payload[v10]));
        uint64_t v13 = OSASanitizePath(v12, 0LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
        [v44 setObject:v14 forKeyedSubscript:v15];
      }

      uint64_t v16 = *((unsigned int *)exit_payload + 3);
      if ((_DWORD)v16 && v16 < self->_exit_payload_length)
      {
        uint64_t v17 = &exit_payload[v16];
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &exit_payload[v16]));
        uint64_t v19 = OSASanitizePath(v18, 0LL);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
        [v44 setObject:v20 forKeyedSubscript:v21];
      }

      id v41 = v4;
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"reasons"]);
      uint64_t v43 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v23);
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id obj = v22;
      id v24 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v50;
        do
        {
          for (unint64_t i = 0LL; i != v25; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(obj);
            }
            id v28 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)i);
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            id v29 = v44;
            id v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v46;
              do
              {
                uint64_t v33 = 0LL;
                uint64_t v34 = v28;
                do
                {
                  if (*(void *)v46 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v33);
                  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v35]);
                  id v28 = (id)objc_claimAutoreleasedReturnValue([v34 stringByReplacingOccurrencesOfString:v35 withString:v36]);

                  uint64_t v33 = (char *)v33 + 1;
                  uint64_t v34 = v28;
                }

                while (v31 != v33);
                id v31 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
              }

              while (v31);
            }

            [v43 addObject:v28];
          }

          id v25 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        }

        while (v25);
      }

      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
      unsigned int v38 = [v37 appleInternal];

      if (v38) {
        id v39 = @"signatureReasons";
      }
      else {
        id v39 = @"reasons";
      }
      id v4 = v41;
      [v41 setObject:v43 forKeyedSubscript:v39];

      id v5 = v40;
    }
  }
}

- (id)decode_versionCodes:(unsigned __int16)a3[4]
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", *a3));
  v11[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a3[1]));
  v11[1] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a3[2]));
  v11[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a3[3]));
  v11[3] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 4LL));

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@"."]);
  return v9;
}

- (id)decode_reasonBTC
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  exit_payload = (char *)self->_exit_payload;
  if (exit_payload)
  {
    if (self->_exit_payload_length < 0x800)
    {
      [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to extract BTC error info: The size of the data is not what is expected"];
    }

    else
    {
      size_t v119 = (unsigned int *)(exit_payload + 269);
      uuid_unparse((const unsigned __int8 *)exit_payload + 5, out);
      v144[0] = @"bin_id";
      unsigned int v122 = exit_payload;
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(exit_payload + 1)));
      v145[0] = v5;
      v144[1] = @"uuid";
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
      v145[1] = v6;
      v144[2] = @"mac_version";
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_versionCodes:](self, "decode_versionCodes:", v122 + 21));
      v145[2] = v7;
      v144[3] = @"phy_version";
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_versionCodes:](self, "decode_versionCodes:", v122 + 29));
      v145[3] = v8;
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v145,  v144,  4LL));
      [v3 setObject:v9 forKeyedSubscript:@"sw_version"];

      v142[0] = @"id";
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 37)));
      v142[1] = @"params";
      v143[0] = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 41)));
      v141[0] = v11;
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 45)));
      v141[1] = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 49)));
      v141[2] = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 53)));
      v141[3] = v14;
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v141, 4LL));
      v143[1] = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v143,  v142,  2LL));
      int v121 = v3;
      [v3 setObject:v16 forKeyedSubscript:@"reason"];

      unint64_t v18 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
      for (uint64_t i = 0LL; i != 20; i += 4LL)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v122[i + 61]));
        [v18 addObject:v20];
      }

      v139[0] = @"pc";
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 57)));
      v140[0] = v21;
      uint64_t v112 = v18;
      v140[1] = v18;
      v139[1] = @"lr";
      v139[2] = @"cpsr";
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 81)));
      v140[2] = v22;
      v139[3] = @"dfar";
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 85)));
      v140[3] = v23;
      v139[4] = @"dfsr";
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 89)));
      v140[4] = v24;
      v139[5] = @"ifar";
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 93)));
      v140[5] = v25;
      v139[6] = @"ifsr";
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 97)));
      v140[6] = v26;
      unint64_t v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v140,  v139,  7LL));

      v137[0] = @"vic0_vicrawintr";
      unsigned int v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 101)));
      v138[0] = v115;
      v137[1] = @"vic1_vicrawintr";
      uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 105)));
      v138[1] = v113;
      v137[2] = @"vic2_vicrawintr";
      unsigned int v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 109)));
      v138[2] = v110;
      v137[3] = @"irq_vic_0";
      __int128 v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 113)));
      v138[3] = v107;
      v137[4] = @"irq_vic_1";
      unint64_t v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 117)));
      v138[4] = v104;
      v137[5] = @"irq_vic_2";
      unsigned int v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 121)));
      v138[5] = v101;
      v137[6] = @"fiq_vic_0";
      __int128 v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 125)));
      v138[6] = v98;
      v137[7] = @"fiq_vic_1";
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 129)));
      v138[7] = v27;
      v137[8] = @"fiq_vic_2";
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 133)));
      v138[8] = v28;
      v137[9] = @"vic3_vicrawintr";
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 137)));
      v138[9] = v29;
      v137[10] = @"irq_vic_3";
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 141)));
      v138[10] = v30;
      v137[11] = @"fiq_vic_3";
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 145)));
      v138[11] = v31;
      v137[12] = @"raw_irq_status";
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v122 + 149)));
      v138[12] = v32;
      v137[13] = @"prev_raw_irq_status";
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v122 + 157)));
      v138[13] = v33;
      v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  14LL));

      v135[0] = @"local_bt_clk";
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 165)));
      v136[0] = v34;
      v135[1] = @"coex_activity_bits";
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 169)));
      v136[1] = v35;
      v135[2] = @"coex_envelop_bits";
      BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 173)));
      v136[2] = v36;
      v135[3] = @"top_semaphores_lock_status_hw";
      id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 177)));
      v136[3] = v37;
      v135[4] = @"top_semaphores_lock_status_fw";
      unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 181)));
      v136[4] = v38;
      size_t v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v136,  v135,  5LL));

      id v40 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v39);
      uint64_t v41 = 0LL;
      uint64_t v42 = v122 + 204;
      do
      {
        v133[0] = @"syndrome";
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v42[v41 - 16]));
        v134[0] = v43;
        v133[1] = @"far";
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v42[v41 - 12]));
        v134[1] = v44;
        v133[2] = @"pc";
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v42[v41 - 8]));
        v134[2] = v45;
        v133[3] = @"lr";
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v42[v41 - 4]));
        v134[3] = v46;
        v133[4] = @"psr";
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v42[v41]));
        v134[4] = v47;
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v134,  v133,  5LL));
        [v40 addObject:v48];

        v41 += 20LL;
      }

      while (v41 != 60);
      v131[0] = @"registers";
      v129[0] = @"arm";
      v129[1] = @"soc";
      v130[0] = v118;
      v130[1] = v117;
      v129[2] = @"bt";
      v130[2] = v116;
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v130,  v129,  3LL));
      v132[0] = v49;
      v131[1] = @"context";
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[185]));
      v132[1] = v50;
      v131[2] = @"abort_counter";
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[186]));
      v132[2] = v51;
      v131[3] = @"unhandled_exception_counter";
      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[187]));
      v132[3] = v52;
      unint64_t v53 = v40;
      v132[4] = v40;
      v131[4] = @"unhandled_exception_info";
      v131[5] = @"system_exit_status";
      unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[248]));
      v132[5] = v54;
      mach_port_name_t v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v132,  v131,  6LL));
      [v121 setObject:v55 forKeyedSubscript:@"trace"];

      unint64_t v57 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v56);
      for (uint64_t j = 0LL; j != 12; j += 4LL)
      {
        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)&v122[j + 283]));
        [v57 addObject:v59];
      }

      size_t v111 = v53;
      id v61 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v60);
      for (uint64_t k = 0LL; k != 6; k += 2LL)
      {
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)&v122[k + 295]));
        [v61 addObject:v63];
      }

      v127[0] = @"rx_header_status";
      __int128 v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v122 + 249)));
      v128[0] = v108;
      v127[1] = @"tx_header_status";
      uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(v122 + 253)));
      v128[1] = v105;
      v127[2] = @"sync_valid";
      unint64_t v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[255]));
      v128[2] = v102;
      v127[3] = @"hw_machine_sig";
      uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[256]));
      v128[3] = v99;
      v127[4] = @"general_status";
      unsigned int v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[257]));
      v128[4] = v96;
      v127[5] = @"esco_tx_en_state";
      unint64_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)v122 + 129)));
      v128[5] = v94;
      v127[6] = @"sch_current_mrl";
      uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[260]));
      v128[6] = v92;
      v127[7] = @"rx_data_type";
      v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[261]));
      v128[7] = v90;
      v127[8] = @"tx_data_type";
      BOOL v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[262]));
      v128[8] = v88;
      v127[9] = @"rx_packet_length";
      unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[263]));
      v128[9] = v86;
      v127[10] = @"tx_packet_length";
      id v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[264]));
      v128[10] = v85;
      v127[11] = @"total_rx_tx_length";
      id v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[265]));
      v128[11] = v84;
      v127[12] = @"rx_watchdog_timer_counter";
      v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[266]));
      v128[12] = v83;
      v127[13] = @"rx_watchdog_occured";
      unint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[267]));
      v128[13] = v82;
      v127[14] = @"dbl_buf_index";
      int v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[268]));
      v128[14] = v81;
      v127[15] = @"Block_activity_bitmask";
      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *v119));
      v128[15] = v80;
      v127[16] = @"last_scheduled_btclk";
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v119[1]));
      v128[16] = v64;
      v127[17] = @"prev_scheduled_btclk";
      int v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v119[2]));
      v128[17] = v65;
      v127[18] = @"prev_activity_type";
      id v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[281]));
      v128[18] = v66;
      v127[19] = @"prev_virtual_clock_domain";
      int v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[282]));
      v128[19] = v67;
      v128[20] = v57;
      v127[20] = @"bt_clk_freeze";
      v127[21] = @"pt_freeze";
      v128[21] = v61;
      v127[22] = @"sm_clk_freeze";
      __int16 v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v119[8]));
      v128[22] = v68;
      unsigned int v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v128,  v127,  23LL));

      uint64_t v70 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v69);
      for (uint64_t m = 0LL; m != 256; ++m)
      {
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[m + 315]));
        [v70 addObject:v72];
      }

      v126[0] = v114;
      v125[0] = @"current_frame_status";
      v125[1] = @"max_dram_wakeup_duration";
      v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)v119 + 18)));
      v126[1] = v120;
      v125[2] = @"dram_protection_mode";
      unsigned int v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[307]));
      v126[2] = v109;
      v125[3] = @"dram_access_allowed";
      int v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[308] & 1));
      v126[3] = v106;
      v125[4] = @"dram_is_enable";
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 1) & 1));
      v126[4] = v103;
      v125[5] = @"force_dram_awake_bit";
      unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 2) & 1));
      v126[5] = v100;
      v125[6] = @"etm_etb_enabled";
      uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 3) & 1));
      v126[6] = v97;
      v125[7] = @"trx_timers_supported";
      id v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 4) & 1));
      v126[7] = v95;
      v125[8] = @"dart_error_occurred";
      unint64_t v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 5) & 1));
      v126[8] = v93;
      v125[9] = @"syncrhonous_external_abort_occured";
      uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v122[308] >> 6) & 1));
      v126[9] = v91;
      v125[10] = @"init_state";
      int v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[309]));
      v126[10] = v89;
      v125[11] = @"recovery_state";
      unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[310]));
      v126[11] = v87;
      v125[12] = @"sleep_wakeup_state";
      int v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[311]));
      v126[12] = v73;
      v125[13] = @"sleep_go_to_deep_sleep_state";
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[312]));
      v126[13] = v74;
      v125[14] = @"rtkit_assert_state";
      unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[313]));
      v126[14] = v75;
      v125[15] = @"rtkit_power_off_state";
      unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v122[314]));
      v125[16] = @"bulk_status_block";
      v126[15] = v76;
      v126[16] = v70;
      int v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v126,  v125,  17LL));
      id v3 = v121;
      [v121 setObject:v77 forKeyedSubscript:@"debug"];
    }
  }

  unsigned int v123 = @"btc_info";
  uint64_t v124 = v3;
  unsigned int v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));

  return v78;
}

- (id)decode_reasonTcc
{
  if (self->_terminator_reason)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    unsigned __int8 v4 = [v3 appleInternal];

    if ((v4 & 1) != 0) {
      return &__NSDictionary0__struct;
    }
  }

  exit_payload = self->_exit_payload;
  if (!exit_payload) {
    return &__NSDictionary0__struct;
  }
  unsigned int exit_payload_length = self->_exit_payload_length;
  if (!exit_payload_length) {
    return &__NSDictionary0__struct;
  }
  uint64_t v7 = exit_payload_length >= 0x4F ? 79LL : exit_payload_length;
  __memcpy_chk(v16, exit_payload, v7, 80LL);
  v16[v7] = 0;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an %@ key with a string value explaining to the user how the app uses this data.",  v8));

  if (!v9) {
    return &__NSDictionary0__struct;
  }
  uint64_t v13 = v9;
  uint64_t v14 = @"details";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  int64_t v15 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  return v11;
}

- (id)decode_reasonExec
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v8[0] = &off_1000380D8;
  v8[1] = &off_1000380F0;
  v9[0] = @"Bad Mach-O";
  v9[1] = @"SUGID Failure";
  v8[2] = &off_100038108;
  v8[3] = &off_100038120;
  _DWORD v9[2] = @"Activation ThreadState";
  v9[3] = @"Stack Allocation";
  v8[4] = &off_100038138;
  v8[5] = &off_100038150;
  v9[4] = @"String Intialization";
  void v9[5] = @"Copyout Strings";
  v8[6] = &off_100038168;
  v8[7] = &off_100038180;
  v9[6] = @"Copyout DynLinker";
  v9[7] = @"Security Policy";
  v8[8] = &off_100038198;
  v8[9] = &off_1000381B0;
  v9[8] = @"Task Gated";
  v9[9] = @"Fairplay Decryption";
  v8[10] = &off_1000381C8;
  v8[11] = &off_1000381E0;
  v9[10] = @"Decryption";
  v9[11] = @"This UPX compressed binary contains an invalid Mach-O header and cannot be loaded.";
  v8[12] = &off_1000381F8;
  v8[13] = &off_100038210;
  v9[12] = @"No 32-bit Execution";
  v9[13] = @"Binary with wrong platform";
  v8[14] = &off_100038228;
  v8[15] = &off_100038240;
  v9[14] = @"Main FD Allocation";
  v9[15] = @"Copyout Rosetta";
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  16LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  return v3;
}

- (id)decode_reasonCoreAnimation
{
  if (self->_exit_payload && self->_exit_payload_length)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"\n"]);

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"stringByTrimmingColumnSensitive"]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  if ([v6 count])
  {
    int64_t v9 = @"details";
    uint64_t v10 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  else
  {
    uint64_t v7 = &__NSDictionary0__struct;
  }

  return v7;
}

- (id)decode_reasonMetal
{
  if (self->_exit_payload && self->_exit_payload_length)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"\n"]);

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"stringByTrimming"]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  if ([v6 count])
  {
    int64_t v9 = @"details";
    uint64_t v10 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  else
  {
    uint64_t v7 = &__NSDictionary0__struct;
  }

  return v7;
}

- (id)decode_reasonWatchKit
{
  return (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
}

- (id)decode_reasonWatchdog
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  uint64_t v13 = &off_1000380D8;
  uint64_t v14 = @"monitoring timed out for service";
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  terminator_reason = self->_terminator_reason;
  if (terminator_reason)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSString componentsSeparatedByString:]( terminator_reason,  "componentsSeparatedByString:",  @"\n"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"stringByTrimming"]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v10]);

    if ([v11 count]) {
      [v3 setObject:v11 forKeyedSubscript:@"details"];
    }
  }

  return v3;
}

- (id)decode_reasonLibxpc
{
  uint64_t label = xpc_exit_reason_get_label(LODWORD(self->_exit_snapshot->ers_code), a2);
  unsigned int v6 = @"indicator";
  if (label) {
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", label));
  }
  else {
    id v3 = @"<unknown>";
  }
  uint64_t v7 = v3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  if (label) {

  }
  return v4;
}

- (id)decode_reasonPortSpace
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  if ((self->_exit_snapshot->ers_code & 0x1C00000000000000LL) == 0x400000000000000LL)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(Limit %u ports) Exceeded system-wide per-process Port Limit",  self->_exit_snapshot->ers_code & 0xFFFFFF));
    [v3 setObject:v4 forKeyedSubscript:@"indicator"];
  }

  return v3;
}

- (id)decode_reasonCodeSigning
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v8[0] = &off_1000380F0;
  v8[1] = &off_100038108;
  v9[0] = @"Invalid Page";
  v9[1] = @"Task Access Port";
  v8[2] = &off_1000380D8;
  v8[3] = &off_100038120;
  _DWORD v9[2] = @"Taskgated Invalid Signature";
  v9[3] = @"Launch Constraint Violation";
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  return v3;
}

- (id)decode_reasonSandbox
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  if (self->_exit_payload && self->_exit_payload_length)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
    uint64_t v7 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    [v3 setObject:v5 forKeyedSubscript:@"details"];
  }

  return v3;
}

- (id)decode_reasonBacklightServices
{
  return (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
}

- (void)decode_os_log_fault_payload
{
  if (!self->_new_payload && self->_exit_payload)
  {
    id v3 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
    new_payload = self->_new_payload;
    self->_new_payload = v3;

    exit_payload = (unsigned int *)self->_exit_payload;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    unsigned int v7 = [v6 appleInternal];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport safe_encoder:](self, "safe_encoder:", exit_payload[4]));
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_new_payload,  "setObject:forKeyedSubscript:",  v8,  @"message");
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Missing input data for os_log_fault message string",  buf,  2u);
      }
    }

    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport safe_encoder:](self, "safe_encoder:", exit_payload[3]));
    if (v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_new_payload,  "setObject:forKeyedSubscript:",  v9,  @"category");
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Missing input data for os_log_fault category string",  v12,  2u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport safe_encoder:](self, "safe_encoder:", exit_payload[2]));
    if (v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_new_payload,  "setObject:forKeyedSubscript:",  v10,  @"subsystem");
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Missing input data for os_log_fault subsystem string",  v11,  2u);
    }
  }

- (id)safe_encoder:(unsigned int)a3
{
  if (a3)
  {
    uint64_t exit_payload_length = self->_exit_payload_length;
    if (exit_payload_length <= a3)
    {
      unsigned int v7 = &stru_100031020;
    }

    else
    {
      uint64_t v4 = 0LL;
      id v5 = (char *)self->_exit_payload + a3;
      uint64_t v6 = exit_payload_length - a3;
      unsigned int v7 = &stru_100031000;
      while (1)
      {
        if (!v5[v4])
        {
          uint64_t v8 = (char *)malloc((4LL * v4) | 1);
          if (v8) {
            break;
          }
        }

        if (v6 == ++v4) {
          goto LABEL_9;
        }
      }

      uint64_t v11 = v8;
      if (strnvisx(v8, (4LL * v4) | 1, v5, v4, 18) == -1)
      {
        free(v11);
      }

      else
      {
        int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
        free(v11);
        if (v9) {
          return v9;
        }
      }

      unsigned int v7 = &stru_100031000;
    }

- (id)create_os_fault_section
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  [v3 setObject:self->_procName forKeyedSubscript:@"process"];
  terminator_reason = self->_terminator_reason;
  if (terminator_reason) {
    [v3 setObject:terminator_reason forKeyedSubscript:@"format"];
  }
  -[OSACrashReport decode_os_log_fault_payload](self, "decode_os_log_fault_payload");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"message"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"message"));
    [v3 setObject:v6 forKeyedSubscript:@"message"];
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"category"));
  [v3 setObject:v7 forKeyedSubscript:@"category"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_new_payload,  "objectForKeyedSubscript:",  @"subsystem"));
  [v3 setObject:v8 forKeyedSubscript:@"subsystem"];

  return v3;
}

- (id)decode_reason
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonNamespace](self, "decode_reasonNamespace"));
  if (self->_terminator_reason)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    if (([v5 appleInternal] & 1) != 0
      || ((uint32_t ers_namespace = self->_exit_snapshot->ers_namespace, ers_namespace <= 0x16)
        ? (BOOL v7 = ((1 << ers_namespace) & 0x700440) == 0)
        : (BOOL v7 = 1),
          !v7))
    {

LABEL_8:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSString componentsSeparatedByString:]( self->_terminator_reason,  "componentsSeparatedByString:",  @"\n"));
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"stringByTrimming"]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v10]);
      [v3 setObject:v11 forKeyedSubscript:@"reasons"];

      goto LABEL_9;
    }

    if (ers_namespace == 39) {
      goto LABEL_8;
    }
  }

- (id)decode_ubsanCode:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown (0x%02x)",  a3));
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([&off_1000385D0 objectAtIndexedSubscript:v4]);
  }
  BOOL v7 = v6;

  return v7;
}

- (id)decode_esr:(unsigned int *)a3 exceptionStateCount:(unsigned int)a4
{
  if (a4)
  {
    id v6 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, a2);
    BOOL v7 = v6;
    unint64_t v8 = a3[2];
    switch(v8 >> 26)
    {
      case ' ':
      case '!':
        [v6 setString:@"(Instruction Abort)"];
        if ((v8 & 0x1000000) == 0) {
          goto LABEL_11;
        }
        goto LABEL_13;
      case '""':
        uint64_t v11 = @"(PC alignment)";
        goto LABEL_22;
      case '#':
        goto LABEL_17;
      case '$':
      case '%':
        [v6 setString:@"(Data Abort)"];
        if ((v8 & 0x1000000) != 0)
        {
LABEL_13:
          uint64_t v10 = @" No valid info";
          goto LABEL_18;
        }

        [v7 appendFormat:*(&off_100031288 + ((v8 >> 22) & 3))];
        if ((v8 & 0x40) != 0) {
          int64_t v9 = @" write";
        }
        else {
          int64_t v9 = @" read";
        }
        [v7 appendFormat:v9];
LABEL_11:
        switch(v8 & 0x2F)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
            goto LABEL_17;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            uint64_t v10 = @" Translation fault";
            goto LABEL_18;
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
            uint64_t v10 = @" Access flag fault";
            goto LABEL_18;
          case 0xDuLL:
          case 0xEuLL:
          case 0xFuLL:
            uint64_t v10 = @" Permission fault";
            goto LABEL_18;
          case 0x21uLL:
            uint64_t v10 = @" Alignment fault";
            goto LABEL_18;
          default:
            return v7;
        }

        return v7;
      case '&':
        uint64_t v11 = @"(Stack alignment)";
LABEL_22:
        [v6 setString:v11];
        return v7;
      default:
        if (v8 >> 26 != 60)
        {
LABEL_17:
          uint64_t v10 = @" Address size fault";
LABEL_18:
          objc_msgSend(v7, "appendFormat:", v10, v14);
          return v7;
        }

        [v6 setString:@"(Breakpoint)"];
        if ((v8 & 0xFFFC) == 0xC470)
        {
          [v7 appendFormat:@" pointer authentication trap"];
          __asm { BR              X10 }
        }

        if ((v8 & 0x1FFFF) == 0x5519)
        {
          uint64_t v10 = @" -fbounds-safety trap";
          goto LABEL_18;
        }

        if ((v8 & 0x1FF00) == 0x5500)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_ubsanCode:](self, "decode_ubsanCode:", v8));
          [v7 appendFormat:@" UBSAN %@", v13];
        }

        else
        {
          objc_msgSend(v7, "appendFormat:", @" brk %d", v8 & 0x1FFFFFF);
        }

        break;
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

- (id)decode_threadState:(unsigned int *)a3 threadStateCount:(unsigned int)a4 threadStateFlavor:(int)a5 threadPort:(unsigned int)a6 exceptionState:(unsigned int)a7[1296] exceptionStateCount:(unsigned int)a8 withSymbolicator:(_CSTypeRef)a9 usingCatalog:(id)a10
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a10;
  id v15 = -[OSACrashReport _getObjCReadOnlyRange:](self, "_getObjCReadOnlyRange:", a9.var0, a9.var1);
  uint64_t v17 = 0LL;
  if (!a4 || (_DWORD)v10 == 5) {
    goto LABEL_18;
  }
  id v18 = v15;
  uint64_t v19 = v16;
  uint64_t v20 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v16);
  uint64_t v17 = v20;
  if ((_DWORD)v10 == 6)
  {
    uint64_t v49 = v10;
LABEL_7:
    __int128 v48 = v20;
    [v20 setObject:@"ARM_THREAD_STATE64" forKeyedSubscript:@"flavor"];
    id v22 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v21);
    for (uint64_t i = 0LL; i != 58; i += 2LL)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:]( self,  "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:",  *(void *)&a3[i],  v18,  v19,  a9.var0,  a9.var1,  v14));
      [v22 addObject:v24];
    }

    uint64_t v17 = v48;
    [v48 setObject:v22 forKeyedSubscript:@"x"];
    uint64_t v64 = @"value";
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a3 + 29)));
    int v65 = v25;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
    [v48 setObject:v26 forKeyedSubscript:@"fp"];

    uint64_t v62 = @"value";
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a3 + 30)));
    uint64_t v63 = v27;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
    [v48 setObject:v28 forKeyedSubscript:@"lr"];

    unint64_t v29 = *((void *)a3 + 31);
    if (HIWORD(v29))
    {
      id v30 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SP register contains suspicious bits (0x%llX)",  *((void *)a3 + 31)));
      [v30 addObject:v31];
    }

    uint64_t v60 = @"value";
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v29));
    id v61 = v32;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
    [v48 setObject:v33 forKeyedSubscript:@"sp"];

    __int128 v58 = @"value";
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a3 + 32)));
    __int128 v59 = v34;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    [v48 setObject:v35 forKeyedSubscript:@"pc"];

    uint64_t v56 = @"value";
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3[66]));
    unint64_t v57 = v36;
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    [v48 setObject:v37 forKeyedSubscript:@"cpsr"];

    if (a8)
    {
      uint64_t v38 = a7[2];
      uint64_t v39 = *(void *)a7;
      unint64_t v54 = @"value";
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v39));
      mach_port_name_t v55 = v40;
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
      [v48 setObject:v41 forKeyedSubscript:@"far"];

      __int128 v52 = @"value";
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v38));
      unint64_t v53 = v42;
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
      id v44 = [v43 mutableCopy];

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_esr:exceptionStateCount:](self, "decode_esr:exceptionStateCount:", a7, a8));
      if ([v45 length]) {
        [v44 setObject:v45 forKeyedSubscript:@"description"];
      }
      [v48 setObject:v44 forKeyedSubscript:@"esr"];
    }

    uint64_t v10 = v49;
    goto LABEL_16;
  }

  if ((_DWORD)v10 == 1)
  {
    uint64_t v49 = v10;
    a3 += 2;
    goto LABEL_7;
  }

- (id)decode_crashingThreadStateWithSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if (self->_crashedThreadNumber < 0
    || (unint64_t)-[NSMutableArray count](self->_threadInfos, "count") <= self->_crashedThreadNumber)
  {
    int64_t v9 = 0LL;
    goto LABEL_14;
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"threadState"]);

  if (![v9 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Falling back to fetching thread state from stored values",  buf,  2u);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[OSACrashReport decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:]( self,  "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSy mbolicator:usingCatalog:",  self->_threadState,  self->_threadStateCount,  self->_threadStateFlavor,  self->_threadPortOriginal,  self->_exceptionState,  self->_exceptionStateCount,  var0,  var1,  v7));

    int64_t v9 = (void *)v10;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_threadInfos,  "objectAtIndexedSubscript:",  self->_crashedThreadNumber));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"frames"]);

  if (![v12 count]) {
    goto LABEL_12;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
  usedImages = self->_usedImages;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"imageIndex"]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](usedImages, "objectAtIndex:", (int)[v15 intValue]));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"base"]);
  id v18 = (char *)[v17 longLongValue];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"imageOffset"]);
  id v20 = [v19 longLongValue];

  if (v9)
  {
    uint64_t v21 = &v18[(void)v20];
    if (&v18[(void)v20])
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"pc"]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"value"]);
      id v24 = (char *)[v23 longLongValue];

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"pc"]);
      id v12 = [v25 mutableCopy];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21 == v24));
      [v12 setObject:v26 forKeyedSubscript:@"matchesCrashFrame"];

      [v9 setObject:v12 forKeyedSubscript:@"pc"];
      if (v21 != v24)
      {
        uint64_t v27 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s register does not match crashing frame (0x%llX vs 0x%llX)",  "PC",  v24,  v21));
        [v27 addObject:v28];
      }

- (id)decode_threadState:(unsigned int)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  mach_msg_type_number_t old_stateCnt = 68;
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
  *(_OWORD *)old_uint64_t state = 0u;
  *(void *)id v18 = 0LL;
  uint64_t v19 = 0LL;
  mach_msg_type_number_t v17 = 4;
  uint64_t state = thread_get_state(v7, 6, old_state, &old_stateCnt);
  if ((_DWORD)state)
  {
    uint64_t v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread_get_state(THREAD) returned 0x%x: %s",  state,  mach_error_string(state));
  }

  else
  {
    uint64_t v13 = thread_get_state(v7, 7, v18, &v17);
    if (!(_DWORD)v13)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:]( self,  "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCo unt:withSymbolicator:usingCatalog:",  old_state,  old_stateCnt,  6LL,  v7,  v18,  v17,  var0,  var1,  v9));
      goto LABEL_6;
    }

    uint64_t v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"thread_get_state(EXCEPTION) returned 0x%x: %s",  v13,  mach_error_string(v13));
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 addObject:v14];

  id v15 = 0LL;
LABEL_6:

  return v15;
}

- (id)_symbolicateRegister:(unint64_t)a3 inRange:(_CSRange)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6
{
  unint64_t var1 = a5.var1;
  unint64_t var0 = a5.var0;
  unint64_t v8 = a4.var1;
  unint64_t v9 = a4.var0;
  id v12 = a6;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  __int128 v22 = sub_100015078;
  __int128 v23 = sub_100015088;
  __int128 v25 = @"value";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  __int128 v26 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  id v24 = [v14 mutableCopy];

  if (a3 - v9 < v8)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport _readStringAtTaskAddress:maxLength:immutableCheck:]( self,  "_readStringAtTaskAddress:maxLength:immutableCheck:",  a3,  0LL,  0LL));
    [(id)v20[5] setObject:v15 forKeyedSubscript:@"objc-selector"];
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  natural_t v18[2] = sub_100015090;
  v18[3] = &unk_100031070;
  v18[4] = &v19;
  -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:]( self,  "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:",  a3,  a3,  var0,  var1,  v12,  v18);
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (_CSRange)_getObjCReadOnlyRange:(_CSTypeRef)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3010000000LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  id v18 = &unk_10002EB96;
  if ((CSIsNull(a3.var0, a3.var1) & 1) == 0)
  {
    uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime( var0,  var1,  "libobjc.A.dylib",  0x8000000000000000LL);
    uint64_t v7 = v6;
    if ((CSIsNull(SymbolOwnerWithNameAtTime, v6) & 1) == 0)
    {
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x2020000000LL;
      char v14 = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000151E0;
      _OWORD v12[3] = &unk_100030EE0;
      v12[4] = v13;
      v12[5] = &v15;
      CSSymbolOwnerForeachSegment(SymbolOwnerWithNameAtTime, v7, v12);
      _Block_object_dispose(v13, 8);
    }
  }

  unint64_t v8 = v16[4];
  unint64_t v9 = v16[5];
  _Block_object_dispose(&v15, 8);
  unint64_t v10 = v8;
  unint64_t v11 = v9;
  result.unint64_t var1 = v11;
  result.unint64_t var0 = v10;
  return result;
}

- (BOOL)isExceptionNonFatal
{
  int exceptionType = self->_exceptionType;
  if (exceptionType == 12) {
    return (unint64_t)*self->_exceptionCode >> 61 == 3;
  }
  if (exceptionType != 11 || self->_exit_snapshot) {
    return 0;
  }
  unint64_t v4 = *self->_exceptionCode;
  return v4 >> 61 != 1 || (v4 & 0x1C00000000000000LL) != 0x800000000000000LL;
}

- (id)getTrialCache
{
  if (qword_10003EED8 != -1) {
    dispatch_once(&qword_10003EED8, &stru_100031090);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000153E4;
  block[3] = &unk_100030D28;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_10003EED0, block);
  return (id)qword_10003EEC8;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  -[OSACrashReport stashStatus:note:](self, "stashStatus:note:", @"Persisting", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v210 = [v6 appleInternal];

  v344[0] = @"incident";
  v208 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport incidentID](self, "incidentID"));
  v345[0] = v208;
  v345[1] = &off_1000380F0;
  v344[1] = @"version";
  v344[2] = @"deployVersion";
  v345[2] = &off_100038480;
  v344[3] = @"modelCode";
  v206 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v204 = (void *)objc_claimAutoreleasedReturnValue([v206 modelCode]);
  v345[3] = v204;
  v344[4] = @"pid";
  v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proc_id));
  v345[4] = v202;
  v344[5] = @"cpuType";
  v201 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_cpuType](self, "decode_cpuType"));
  v345[5] = v201;
  v344[6] = @"procRole";
  uint64_t task_role = self->_task_role;
  else {
    unint64_t v8 = *(&off_1000312A8 + task_role);
  }
  v345[6] = v8;
  v344[7] = @"coalitionID";
  v200 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_coalition_id));
  v345[7] = v200;
  v344[8] = @"osVersion";
  v343[0] = &__kCFBooleanTrue;
  v342[0] = @"isEmbedded";
  v342[1] = @"train";
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v198 = (void *)objc_claimAutoreleasedReturnValue([v199 osTrain]);
  v343[1] = v198;
  v342[2] = @"build";
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v196 = (void *)objc_claimAutoreleasedReturnValue([v197 buildVersion]);
  v343[2] = v196;
  v342[3] = @"releaseType";
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 releaseType]);
  v343[3] = v10;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v343,  v342,  4LL));
  v345[8] = v11;
  v344[9] = @"captureTime";
  uint64_t v12 = OSADateFormat(2LL, *(double *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v345[9] = v13;
  v344[10] = @"uptime";
  id v14 = [(id)objc_opt_class(self) reduceToTwoSigFigures:self->_awakeSystemUptime];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v345[10] = v15;
  v344[11] = @"userID";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_uid));
  v345[11] = v16;
  v344[12] = @"codeSigningMonitor";
  uint64_t v17 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)objc_opt_class(self) codeSigningMonitor]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v345[12] = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v345,  v344,  13LL));
  v5[2](v5, v19);

  uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport problemType](self, "problemType"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSALog commonFieldsForBody:](&OBJC_CLASS___OSALog, "commonFieldsForBody:", v21));
  v5[2](v5, v22);

  __darwin_time_t tv_sec = self->_proc_starttime.tv_sec;
  if (tv_sec >= 1)
  {
    v340 = @"procLaunch";
    uint64_t v24 = OSADateFormat( 2LL,  (double)tv_sec - kCFAbsoluteTimeIntervalSince1970 + (double)self->_proc_starttime.tv_usec / 1000000.0);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v341 = v25;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v341,  &v340,  1LL));
    v5[2](v5, v26);
  }

  if (self->_proc_start_abstime)
  {
    v338 = @"procStartAbsTime";
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    v339 = v27;
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v339,  &v338,  1LL));
    v5[2](v5, v28);
  }

  if (self->_proc_exit_abstime)
  {
    v336 = @"procExitAbsTime";
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    v337 = v29;
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v337,  &v336,  1LL));
    v5[2](v5, v30);
  }

  if (-[NSString length](self->_procName, "length"))
  {
    v334 = @"procName";
    procuint64_t Name = self->_procName;
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &procName,  &v334,  1LL));
    v5[2](v5, v31);
  }

  if (-[NSString length](self->_procPath, "length"))
  {
    __int128 v32 = self->_procPath;
    v332 = @"procPath";
    v333 = v32;
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v333,  &v332,  1LL));
    v5[2](v5, v33);
  }

  if (-[NSDictionary count](self->_bundle_info, "count"))
  {
    v330 = @"bundleInfo";
    bundle_mach_timebase_info info = self->_bundle_info;
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &bundle_info,  &v330,  1LL));
    v5[2](v5, v34);
  }

  if (-[NSDictionary count](self->_build_info, "count"))
  {
    v328 = @"buildInfo";
    build_mach_timebase_info info = self->_build_info;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &build_info,  &v328,  1LL));
    v5[2](v5, v35);
  }

  if (-[NSDictionary count](self->_store_info, "count"))
  {
    v326 = @"storeInfo";
    store_mach_timebase_info info = self->_store_info;
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &store_info,  &v326,  1LL));
    v5[2](v5, v36);
  }

  if (-[NSString length](self->_parentProcessName, "length"))
  {
    v324 = @"parentProc";
    parentProcessuint64_t Name = self->_parentProcessName;
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &parentProcessName,  &v324,  1LL));
    v5[2](v5, v37);
  }

  if (self->_ppid)
  {
    v322 = @"parentPid";
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    v323 = v38;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v323,  &v322,  1LL));
    v5[2](v5, v39);
  }

  if (-[NSString length](self->_coalition_name, "length"))
  {
    v320 = @"coalitionName";
    coalition_unsigned int name = self->_coalition_name;
    id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &coalition_name,  &v320,  1LL));
    v5[2](v5, v40);
  }

  if (self->_is_beta)
  {
    v5[2](v5, &off_100037FD0);
  }

  else
  {
    v318 = @"crashReporterKey";
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 crashReporterKey]);
    v319 = v42;
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v319,  &v318,  1LL));
    v5[2](v5, v43);
  }

  id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unsigned int v45 = [v44 isLowPowerModeEnabled];

  if (v45) {
    v5[2](v5, &off_100038020);
  }
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport problemType](self, "problemType"));
  unsigned int v47 = [v46 isEqualToString:@"309"];

  if (v47)
  {
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[GenerativeModelsState getGMAvailability]( &OBJC_CLASS____TtC11ReportCrash21GenerativeModelsState,  "getGMAvailability"));
    if ([v48 count])
    {
      v316 = @"appleIntelligenceStatus";
      v317 = v48;
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v317,  &v316,  1LL));
      v5[2](v5, v49);
    }
  }

  device_lock_uint64_t state = self->_device_lock_state;
  if ((device_lock_state & 0x80000000) == 0 && device_lock_state != 3)
  {
    int device_unlocked_since_boot = self->_device_unlocked_since_boot;
    if ((device_unlocked_since_boot & 0x80000000) == 0)
    {
      v314 = @"wasUnlockedSinceBoot";
      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  device_unlocked_since_boot != 0));
      v315 = v52;
      unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v315,  &v314,  1LL));
      v5[2](v5, v53);

      device_lock_uint64_t state = self->_device_lock_state;
    }

    v312 = @"isLocked";
    unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", device_lock_state == 1));
    v313 = v54;
    mach_port_name_t v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v313,  &v312,  1LL));
    v5[2](v5, v55);
  }

  if (v210)
  {
    uint64_t v56 = (void *)MGCopyAnswer(@"HWModelStr", 0LL);
    v311[0] = v56;
    v310[0] = @"codeName";
    v310[1] = @"systemID";
    unint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 systemId]);
    v311[1] = v58;
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v311,  v310,  2LL));
    v5[2](v5, v59);

    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 automatedDeviceGroup]);

    if (v61)
    {
      v308 = @"AutomatedDeviceGroup";
      v309 = v61;
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v309,  &v308,  1LL));
      v5[2](v5, v62);
    }
  }

  int responsible_pid = self->_responsible_pid;
  if (responsible_pid && responsible_pid != self->_proc_id)
  {
    if (self->_responsibleProc)
    {
      v306[0] = @"responsiblePid";
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      v306[1] = @"responsibleProc";
      responsibleProc = self->_responsibleProc;
      v307[0] = v64;
      v307[1] = responsibleProc;
      id v66 = (void **)v307;
      int v67 = (const __CFString **)v306;
      uint64_t v68 = 2LL;
    }

    else
    {
      v304 = @"responsiblePid";
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      v305 = v64;
      id v66 = &v305;
      int v67 = &v304;
      uint64_t v68 = 1LL;
    }

    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v67,  v68));
    v5[2](v5, v69);
  }

  if (self->_consecutiveCrashCount)
  {
    v302 = @"consecutiveCrashCount";
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v303 = v70;
    __int128 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v303,  &v302,  1LL));
    v5[2](v5, v71);
  }

  if (self->_throttleTimeout)
  {
    v300 = @"throttleTimeout";
    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v301 = v72;
    int v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v301,  &v300,  1LL));
    v5[2](v5, v73);
  }

  cs_signing_id = self->_cs_signing_id;
  if (cs_signing_id)
  {
    v298 = @"codeSigningID";
    v299 = cs_signing_id;
    unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v299,  &v298,  1LL));
    v5[2](v5, v75);
  }

  cs_team_id = self->_cs_team_id;
  if (cs_team_id)
  {
    v296 = @"codeSigningTeamID";
    v297 = cs_team_id;
    int v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v297,  &v296,  1LL));
    v5[2](v5, v77);
  }

  if (self->_cs_status)
  {
    v294 = @"codeSigningFlags";
    unsigned int v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v295 = v78;
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v295,  &v294,  1LL));
    v5[2](v5, v79);
  }

  v292 = @"codeSigningValidationCategory";
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_cs_validation_category));
  v293 = v80;
  int v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v293,  &v292,  1LL));
  v5[2](v5, v81);

  v290 = @"codeSigningTrustLevel";
  unint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_cs_trust_level));
  v291 = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v291,  &v290,  1LL));
  v5[2](v5, v83);

  if (self->_pc_bytes)
  {
    v288[0] = @"beforePC";
    id v84 = (void *)objc_claimAutoreleasedReturnValue( -[NSData base64EncodedStringWithOptions:]( self->_pc_bytes_before,  "base64EncodedStringWithOptions:",  0LL));
    v289[0] = v84;
    v288[1] = @"atPC";
    id v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_pc_bytes, "base64EncodedStringWithOptions:", 0LL));
    v289[1] = v85;
    unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v289,  v288,  2LL));

    v286 = @"instructionByteStream";
    v287 = v86;
    unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v287,  &v286,  1LL));
    v5[2](v5, v87);
  }

  id v88 = [(id)objc_opt_class(self) bootSessionUUID];
  uint64_t v89 = objc_claimAutoreleasedReturnValue(v88);
  v90 = (void *)v89;
  if (v89)
  {
    v284 = @"bootSessionUUID";
    uint64_t v285 = v89;
    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v285,  &v284,  1LL));
    v5[2](v5, v91);
  }

  v207 = v90;
  if (self->_jit_start_address && self->_jit_end_address)
  {
    v282 = @"jitStartAddress";
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    v283 = v92;
    unint64_t v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v283,  &v282,  1LL));
    v5[2](v5, v93);

    v280 = @"jitEndAddress";
    unint64_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_jit_end_address));
    v281 = v94;
    id v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v281,  &v280,  1LL));
    v5[2](v5, v95);
  }

  if (!-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"CommCenter"))
  {
    uint64_t v96 = MGCopyAnswer(@"BasebandFirmwareVersion", 0LL);
    uint64_t v97 = (void *)v96;
    if (v96)
    {
      v278 = @"basebandVersion";
      uint64_t v279 = v96;
      __int128 v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v279,  &v278,  1LL));
      v5[2](v5, v98);
    }
  }

  vmregion_mach_timebase_info info = self->_vmregion_info;
  if (vmregion_info)
  {
    v276 = @"vmRegionInfo";
    v277 = vmregion_info;
    unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v277,  &v276,  1LL));
    v5[2](v5, v100);
  }

  if (self->_is_lightweight_corpse)
  {
    v5[2](v5, &off_100038048);
  }

  else if (self->_is_simulated)
  {
    v5[2](v5, &off_100038070);
    caller_unsigned int name = self->_caller_name;
    if (caller_name)
    {
      v274 = @"simulatedCaller";
      v275 = caller_name;
      id v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v275,  &v274,  1LL));
      v5[2](v5, v141);
    }
  }

  else if (-[OSACrashReport isExceptionNonFatal](self, "isExceptionNonFatal"))
  {
    v5[2](v5, &off_100038098);
  }

  v272 = @"exception";
  unsigned int v101 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_exceptionCodes](self, "decode_exceptionCodes"));
  v273 = v101;
  unint64_t v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v273,  &v272,  1LL));
  v5[2](v5, v102);

  uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reason](self, "decode_reason"));
  if ([v103 count])
  {
    v270 = @"termination";
    v271 = v103;
    unint64_t v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v271,  &v270,  1LL));
    v5[2](v5, v104);

    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v103 objectForKeyedSubscript:@"reasons"]);
    if (![v105 count])
    {
      uint64_t v106 = objc_claimAutoreleasedReturnValue([v103 objectForKeyedSubscript:@"details"]);

      uint64_t v105 = (void *)v106;
    }

    if ([v105 count])
    {
      __int128 v107 = (NSString *)objc_claimAutoreleasedReturnValue([v105 componentsJoinedByString:@"\n"]);
      mxTerminationReason = self->_mxTerminationReason;
      self->_mxTerminationReason = v107;
    }
  }

  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_code == 5)
  {
    unsigned int v110 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport create_os_fault_section](self, "create_os_fault_section"));
    if ([v110 count])
    {
      v268 = @"os_fault";
      v269 = v110;
      size_t v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v269,  &v268,  1LL));
      v5[2](v5, v111);
    }
  }

  if (-[NSString length](self->_ktriage_info, "length"))
  {
    v266 = @"ktriageinfo";
    ktriage_mach_timebase_info info = self->_ktriage_info;
    uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &ktriage_info,  &v266,  1LL));
    v5[2](v5, v112);
  }

  uint64_t v113 = self->_vmregion_info;
  if (v113)
  {
    v264 = @"vmregioninfo";
    v265 = v113;
    unsigned int v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v265,  &v264,  1LL));
    v5[2](v5, v114);
  }

  if (-[NSMutableDictionary count](self->_applicationSpecificInfo, "count"))
  {
    v262 = @"asi";
    applicationSpecificInfo = self->_applicationSpecificInfo;
    unsigned int v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &applicationSpecificInfo,  &v262,  1LL));
    v5[2](v5, v115);
  }

  if (-[NSDictionary count](self->_exceptionReasonDetails, "count"))
  {
    v260 = @"exceptionReason";
    exceptionReasonDetails = self->_exceptionReasonDetails;
    size_t v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &exceptionReasonDetails,  &v260,  1LL));
    v5[2](v5, v116);
  }

  if (-[NSDictionary count](self->_workQueueLimits, "count"))
  {
    workQueueLimits = self->_workQueueLimits;
    v258[0] = @"workQueueLimits";
    v258[1] = &off_100038498;
    v259[0] = workQueueLimits;
    v259[1] = &off_1000380D8;
    unint64_t v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v259,  v258,  2LL));
    v5[2](v5, v118);
  }

  v205 = v103;
  uint64_t v209 = 16376LL;
  if (-[NSArray count](self->_lastExceptionBacktrace, "count"))
  {
    v256 = @"lastExceptionBacktrace";
    lastExceptionBacktrace = self->_lastExceptionBacktrace;
    size_t v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &lastExceptionBacktrace,  &v256,  1LL));
    v5[2](v5, v119);
  }

  if (-[NSMutableArray count](self->_threadInfos, "count"))
  {
    if ((self->_crashedThreadNumber & 0x80000000) == 0)
    {
      v254 = @"faultingThread";
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      v255 = v120;
      int v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v255,  &v254,  1LL));
      v5[2](v5, v121);

      unsigned int v122 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_threadInfos,  "objectAtIndexedSubscript:",  self->_crashedThreadNumber));
      [v122 setObject:&__kCFBooleanTrue forKeyedSubscript:@"triggered"];
      [v122 setObject:self->_threadStateDecoded forKeyedSubscript:@"threadState"];
    }

    v252 = @"threads";
    threadInfos = self->_threadInfos;
    unsigned int v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &threadInfos,  &v252,  1LL));
    v5[2](v5, v123);
  }

  if (-[NSArray count](self->_usedImages, "count"))
  {
    usedImages = self->_usedImages;
    v250[0] = @"usedImages";
    v250[1] = &off_100038498;
    v251[0] = usedImages;
    v251[1] = &off_1000380D8;
    unsigned int v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v251,  v250,  2LL));
    v5[2](v5, v126);
  }

  if (self->_sharedCacheBase)
  {
    uuid_unparse_lower(self->_sharedCacheUuid, out);
    v247[0] = @"sharedCache";
    v245[0] = @"base";
    v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_sharedCacheBase));
    v246[0] = v127;
    v245[1] = @"size";
    v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_sharedCacheSize));
    v246[1] = v128;
    v245[2] = @"uuid";
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
    v246[2] = v129;
    unsigned int v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v246,  v245,  3LL));
    v247[1] = &off_100038498;
    v248[0] = v130;
    v248[1] = &off_1000380D8;
    uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v248,  v247,  2LL));
    v5[2](v5, v131);

    uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  }

  v133 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v124);
  if (self->_crashedThreadNumber < 0)
  {
    if (self->_highlightedThreadNumber < 0) {
      goto LABEL_120;
    }
    int v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    [v133 setObject:v134 forKeyedSubscript:@"threadHighlighted"];
  }

  else
  {
    int v134 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v132);
    v135 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_threadInfos,  "objectAtIndexedSubscript:",  self->_crashedThreadNumber));
    v136 = (void *)objc_claimAutoreleasedReturnValue([v135 objectForKeyedSubscript:@"name"]);

    if (v136)
    {
      size_t v137 = (void *)objc_claimAutoreleasedReturnValue([v135 objectForKeyedSubscript:@"name"]);
      [v134 setObject:v137 forKeyedSubscript:@"name"];

      uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }

    v138 = (void *)objc_claimAutoreleasedReturnValue([v135 objectForKeyedSubscript:@"queue"]);

    if (v138)
    {
      unsigned int v139 = (void *)objc_claimAutoreleasedReturnValue([v135 objectForKeyedSubscript:@"queue"]);
      [v134 setObject:v139 forKeyedSubscript:@"queue"];

      uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }

    [v133 setObject:v134 forKeyedSubscript:@"threadTriggered"];
  }

LABEL_120:
  vmSummary = self->_vmSummary;
  if (vmSummary)
  {
    v243 = @"vmSummary";
    v244 = vmSummary;
    v143 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v244 forKeys:&v243 count:1]);
    v5[2](v5, v143);
  }

  probGuardReport = self->_probGuardReport;
  if (probGuardReport)
  {
    v241 = @"probGuardReport";
    v242 = probGuardReport;
    uint64_t v145 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v242 forKeys:&v241 count:1]);
    v5[2](v5, v145);
  }

  memoryErrorReport = self->_memoryErrorReport;
  if (memoryErrorReport)
  {
    v239 = @"memoryErrorReport";
    v240 = memoryErrorReport;
    uint64_t v147 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v240 forKeys:&v239 count:1]);
    v5[2](v5, v147);
  }

  sanitizerReport = self->_sanitizerReport;
  if (sanitizerReport)
  {
    v237 = @"quarantineReport";
    v238 = sanitizerReport;
    v149 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v238 forKeys:&v237 count:1]);
    v5[2](v5, v149);
  }

  if ([v133 count])
  {
    v235[0] = @"legacyInfo";
    v235[1] = &off_100038498;
    v236[0] = v133;
    v236[1] = &off_1000380D8;
    v150 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:v236 forKeys:v235 count:2]);
    v5[2](v5, v150);
  }

  logWritingSignature = self->_logWritingSignature;
  if (logWritingSignature)
  {
    v233 = @"logWritingSignature";
    v234 = logWritingSignature;
    v152 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v234 forKeys:&v233 count:1]);
    v5[2](v5, v152);
  }

  v153 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport getTrialCache](self, "getTrialCache"));
  v154 = v153;
  if (v153)
  {
    v155 = (void *)objc_claimAutoreleasedReturnValue([v153 dictionaryWithValuesForKeys:&off_100038600]);
    v156 = (void *)objc_claimAutoreleasedReturnValue([v154 objectForKeyedSubscript:@"errors"]);
    if ([v155 count])
    {
      v231[0] = @"trialInfo";
      v231[1] = &off_100038498;
      v232[0] = v155;
      v232[1] = &off_1000380D8;
      v157 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:v232 forKeys:v231 count:2]);
      v5[2](v5, v157);
    }

    else
    {
      if (![v156 count])
      {
LABEL_138:

        goto LABEL_139;
      }

      v158 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      v157 = (void *)objc_claimAutoreleasedReturnValue([v156 componentsJoinedByString:@"; "]);
      v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to retrieve Trial info: %@",  v157));
      [v158 addObject:v159];
    }

    uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    goto LABEL_138;
  }

- (BOOL)saveWithOptions:(id)a3
{
  id v4 = a3;
  if (-[OSACrashReport needsUrgentSubmission](self, "needsUrgentSubmission")) {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:&__kCFBooleanTrue forKeyedSubscript:kOSALogOptionUrgent];
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OSACrashReport;
  BOOL v5 = -[OSACrashReport saveWithOptions:](&v7, "saveWithOptions:", v4);
  if (!self->_is_simulated) {
    -[OSACrashReport sendToMetricKit](self, "sendToMetricKit");
  }

  return v5;
}

- (BOOL)needsUrgentSubmission
{
  return self->_is_beta || self->_needsUrgentSubmission;
}

- (void)checkIfNeedsUrgentSubmission
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getTaskingKey:@"disableUrgentSubmission"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    BOOL v7 = 0;
    if (v6)
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Urgent submission has been disabled",  v8,  2u);
      BOOL v7 = 0;
    }
  }

  else
  {
    if (!self->_sroute_id) {
      return;
    }
    BOOL v7 = 1;
  }

  self->_needsUrgentSubmission = v7;
}

- (id)getNotificationInfo
{
  unsigned int v3 = (void *)objc_opt_new(&OBJC_CLASS___OSACrashUserNotificationInfo, a2);
  objc_msgSend(v3, "setUrgentSubmission:", -[OSACrashReport needsUrgentSubmission](self, "needsUrgentSubmission"));
  [v3 setBundleVersion:self->_bundleVersion];
  [v3 setIsBeta:self->_is_beta];
  if (!self->_is_simulated) {
    return v3;
  }
  exit_snapshot = self->_exit_snapshot;
  if (!exit_snapshot || exit_snapshot->ers_namespace != 18 || self->_crashedThreadNumber < 0) {
    return v3;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v20 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"frames"]);
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v6) {
    goto LABEL_21;
  }
  id v7 = v6;
  int v21 = 0;
  uint64_t v8 = *(void *)v25;
  int v23 = -1;
  while (2)
  {
    unint64_t v9 = 0LL;
    int v10 = v21;
    v21 += (int)v7;
    do
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      int v11 = v10 + (_DWORD)v9;
      uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v9);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"imageIndex"]);
      signed int v14 = [v13 intValue];

      if (v10 + (_DWORD)v9 == 1)
      {
        int v23 = v14;
        goto LABEL_17;
      }

      if (v11)
      {
        if (v11 > 6) {
          goto LABEL_21;
        }
      }

      else
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"symbol"]);
        unsigned __int8 v16 = [@"os_fault_with_payload" isEqualToString:v15];

        if ((v16 & 1) != 0) {
          goto LABEL_17;
        }
      }

      if (v14 != v23)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_usedImages, "objectAtIndex:", v14));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"name"]);
        [v3 setFaultingImage:v18];

        goto LABEL_21;
      }

- (id)getObserverInfo
{
  unsigned int v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  lastExceptionBacktrace = self->_lastExceptionBacktrace;
  if (lastExceptionBacktrace && -[NSArray count](lastExceptionBacktrace, "count"))
  {
    [v3 setObject:self->_lastExceptionBacktrace forKeyedSubscript:@"frames"];
  }

  else if ((self->_crashedThreadNumber & 0x80000000) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"frames"]);
    [v3 setObject:v6 forKeyedSubscript:@"frames"];
  }

  [v3 setObject:self->_usedImages forKeyedSubscript:@"images"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proc_id));
  [v3 setObject:v7 forKeyedSubscript:@"pid"];

  [v3 setObject:self->_procName forKeyedSubscript:@"name"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]));
  [v3 setObject:v8 forKeyedSubscript:@"time"];

  if (-[NSMutableDictionary count](self->_applicationSpecificInfoFullSensitive, "count")) {
    [v3 setObject:self->_applicationSpecificInfoFullSensitive forKeyedSubscript:@"asi"];
  }
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_is_simulated));
  [v3 setObject:v9 forKeyedSubscript:@"isSimulated"];

  return v3;
}

- (void)sendToMetricKit
{
  v2 = self;
  int v77 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport problemType](self, "problemType"));
  if (![v77 isEqualToString:@"309"] || !v2->_bundle_id)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    procuint64_t Name = v2->_procName;
    bundle_id = v2->_bundle_id;
    *(_DWORD *)buf = 138543874;
    uint64_t v105 = procName;
    __int16 v106 = 2114;
    __int128 v107 = v77;
    __int16 v108 = 2114;
    unsigned int v109 = bundle_id;
    uint64_t v56 = "no MetricKit for process %{public}@ type %{public}@ bundleId %{public}@";
    uint32_t v57 = 32;
LABEL_47:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v56, buf, v57);
    goto LABEL_63;
  }

  if (qword_10003EF30 != -1) {
    dispatch_once(&qword_10003EF30, &stru_100031100);
  }
  if (!qword_10003EEE0
    || !qword_10003EEE8
    || !qword_10003EEF0
    || !qword_10003EEF8
    || !qword_10003EF00
    || !qword_10003EF08
    || !qword_10003EF10
    || !qword_10003EF18
    || !qword_10003EF20
    || !qword_10003EF28)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    uint64_t v56 = "failed to dynamically load MetricKit classes";
    uint32_t v57 = 2;
    goto LABEL_47;
  }

  unsigned int v76 = v2->_bundle_id;
  if (objc_msgSend((id)qword_10003EEE0, "isMetricKitClient:"))
  {
    uint64_t v79 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id obj = v2->_threadInfos;
    uint64_t v89 = v2;
    id v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v100,  v117,  16LL);
    if (v81)
    {
      uint64_t v80 = *(void *)v101;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v101 != v80) {
            objc_enumerationMutation(obj);
          }
          unsigned int v5 = *(void **)(*((void *)&v100 + 1) + 8 * v4);
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          __int128 v99 = 0u;
          v83 = v5;
          uint64_t v85 = v4;
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"frames"]);
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reverseObjectEnumerator]);

          id v87 = v7;
          id v92 = [v7 countByEnumeratingWithState:&v96 objects:v116 count:16];
          if (v92)
          {
            uint64_t v94 = 0LL;
            id v8 = 0LL;
            uint64_t v90 = *(void *)v97;
            do
            {
              unint64_t v9 = 0LL;
              int v10 = v8;
              do
              {
                if (*(void *)v97 != v90) {
                  objc_enumerationMutation(v87);
                }
                int v11 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)v9);
                uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"imageIndex"]);
                signed int v13 = [v12 intValue];

                signed int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"imageOffset"]);
                uint64_t v15 = (char *)[v14 longLongValue];

                unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v2->_usedImages, "objectAtIndex:", v13));
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"base"]);
                id v18 = [v17 longLongValue];

                id v19 = objc_alloc((Class)qword_10003EEF0);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"name"]);
                int v21 = objc_alloc(&OBJC_CLASS___NSUUID);
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"uuid"]);
                int v23 = -[NSUUID initWithUUIDString:](v21, "initWithUUIDString:", v22);
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v15[(void)v18]));
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v15));
                if (v10)
                {
                  unsigned int v115 = v10;
                  uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v115,  1LL));
                }

                else
                {
                  uint64_t v27 = objc_opt_new(&OBJC_CLASS___NSArray, v25);
                }

                __int128 v28 = (void *)v27;
                id v8 = [v19 initWithBinaryName:v20 binaryUUID:v23 address:v24 binaryOffset:v26 sampleCount:&off_1000380D8 withDepth:(char *)v9 + v94 subFrameArray:v27];

                unint64_t v9 = (char *)v9 + 1;
                int v10 = v8;
                v2 = v89;
              }

              while (v92 != v9);
              id v92 = [v87 countByEnumeratingWithState:&v96 objects:v116 count:16];
              v94 += (uint64_t)v9;
            }

            while (v92);
          }

          else
          {
            id v8 = 0LL;
          }

          id v30 = objc_alloc((Class)qword_10003EEE8);
          if (v8)
          {
            id v114 = v8;
            uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v114, 1LL));
          }

          else
          {
            uint64_t v31 = objc_opt_new(&OBJC_CLASS___NSArray, v29);
          }

          __int128 v32 = (void *)v31;
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:@"triggered"]);
          id v34 = objc_msgSend(v30, "initWithTopCallStackFrames:isAttributedThread:", v32, objc_msgSend(v33, "BOOLValue"));

          if (v34) {
            [v79 addObject:v34];
          }

          uint64_t v4 = v85 + 1;
        }

        while ((id)(v85 + 1) != v81);
        id v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v100,  v117,  16LL);
      }

      while (v81);
    }

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2->_bundle_info, "objectForKeyedSubscript:", kCFBundleVersionKey));
    id v95 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_bundle_info,  "objectForKeyedSubscript:",  @"CFBundleShortVersionString"));
    id v37 = objc_alloc((Class)qword_10003EEF8);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v35 buildVersion]);
    unsigned int v86 = v35;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v35 modelCode]);
    id v40 = &stru_100031928;
    id v84 = (void *)v36;
    if (v36) {
      uint64_t v41 = (const __CFString *)v36;
    }
    else {
      uint64_t v41 = &stru_100031928;
    }
    id v91 = [v37 initWithRegionFormat:&stru_100031928 osVersion:v38 deviceType:v39 appBuildVersion:v41 bundleID:v2->_bundle_id];

    uint64_t v42 = (void *)qword_10003EEE0;
    uint64_t proc_id = v2->_proc_id;
    id v44 = v2->_bundle_id;
    uint64_t v82 = OBJC_IVAR___OSAReport__capture_time;
    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *(double *)&v2->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]));
    unint64_t v93 = (void *)objc_claimAutoreleasedReturnValue([v42 getSignpostDataforPid:proc_id forClient:v44 andEventTimestamp:v45]);

    if (v2->_exceptionReasonDetails)
    {
      id v46 = objc_alloc((Class)qword_10003EF28);
      unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"composed_message"));
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"format_string"));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"arguments"));
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"type"));
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"class"));
      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_exceptionReasonDetails,  "objectForKeyedSubscript:",  @"name"));
      id v53 = [v46 initWithComposedMessage:v47 formatString:v48 arguments:v49 type:v50 className:v51 exceptionName:v52];

      v2 = v89;
      id v40 = &stru_100031928;
    }

    else
    {
      id v53 = 0LL;
    }

    id v58 = objc_alloc((Class)qword_10003EF08);
    uint64_t v59 = v2->_proc_id;
    mxTerminationReason = v2->_mxTerminationReason;
    vmregion_mach_timebase_info info = v2->_vmregion_info;
    if (v95) {
      id v40 = v95;
    }
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v2->_exceptionType));
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *v2->_exceptionCode));
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v2->_signal));
    id v65 = [objc_alloc((Class)qword_10003EF00) initWithThreadArray:v79 aggregatedByProcess:0];
    id v88 = v53;
    id v66 = [v58 initWithMetaData:v91 applicationVersion:v40 signpostData:v93 pid:v59 terminationReason:mxTerminationReason applicationSpecificInfo:0 virtualMemory RegionInfo:vmregion_info exceptionType:v62 exceptionCode:v63 exceptionReason:v53 signal:v64 stackTrace:v65];

    BOOL v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v66)
    {
      uint64_t v69 = v84;
      uint64_t v68 = v86;
      if (v67)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sending MXCrashDiagnostic to MetricKit",  buf,  2u);
      }

      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EF18 sharedManager]);
      uint64_t v112 = v76;
      id v71 = objc_alloc((Class)qword_10003EF10);
      unsigned int v110 = @"crashDiagnostic";
      id v111 = v66;
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v111,  &v110,  1LL));
      id v73 = [v71 initPayloadDataWithDiagnostics:v72];
      id v113 = v73;
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v113,  &v112,  1LL));
      unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *(double *)&v89->OSAReport_opaque[v82]));
      [v70 sendDiagnostic:v74 forDate:v75 andSourceID:5];
    }

    else
    {
      uint64_t v69 = v84;
      uint64_t v68 = v86;
      if (v67)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to create MXCrashDiagnostic",  buf,  2u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v105 = v76;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is not a MetricKit client",  buf,  0xCu);
  }

LABEL_63:
}

- (void)donateToBiome
{
  if (objc_opt_class(&OBJC_CLASS___BMProcessCrash)
    && objc_opt_class(&OBJC_CLASS___BMProcessCrashException)
    && objc_opt_class(&OBJC_CLASS___BMProcessCrashTerminationReason)
    && !-[OSACrashReport is_simulated](self, "is_simulated")
    && -[OSACrashReport exceptionType](self, "exceptionType") != 11)
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_exceptionCodes](self, "decode_exceptionCodes"));
    id v3 = objc_alloc(&OBJC_CLASS___BMProcessCrashException);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"codes"]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"type"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"signal"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"subtype"]);
    id v28 = [v3 initWithCodes:v4 type:v5 signal:v6 subtype:v7];

    id v8 = objc_alloc(&OBJC_CLASS___BMProcessCrashTerminationReason);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport terminationReasonExceptionCode](self, "terminationReasonExceptionCode"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonNamespace](self, "decode_reasonNamespace"));
    id v29 = [v8 initWithCode:v9 namespaceName:v10];

    id v27 = objc_alloc(&OBJC_CLASS___BMProcessCrash);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport incidentID](self, "incidentID"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport procName](self, "procName"));
    signed int v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport bundle_id](self, "bundle_id"));
    signed int v14 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport short_vers](self, "short_vers"));
    bundleVersion = self->_bundleVersion;
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport responsibleProc](self, "responsibleProc"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport coalitionName](self, "coalitionName"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_is_first_party));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_is_beta));
    id v20 = [v27 initWithIncidentID:v11 processName:v12 bundleID:v13 appVersion:v14 bundleVersion:bundleVersion exception:v28 terminationReason:v29 responsibleApp:v16  coalitionName:v17 isFirstParty:v18 isBeta:v19];

    uint64_t v21 = BiomeLibrary();
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 OSAnalytics]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 Stability]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 Crash]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 source]);
    [v26 sendEvent:v20];
  }

- (void)sendToCoreAnalytics
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[OSACrashReport problemType](self, "problemType"));
  if (![v4 isEqualToString:@"309"])
  {

    return;
  }

  if (self->_consecutiveCrashCount)
  {
  }

  else
  {
    throttleTimeuuid_string_t out = self->_throttleTimeout;

    if (!throttleTimeout) {
      return;
    }
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100019B34;
  v5[3] = &unk_100031048;
  v5[4] = self;
  AnalyticsSendEventLazy(@"com.apple.stability.launchdThrottling", v5);
}

+ (BOOL)isInLDM
{
  return 0;
}

- (unint64_t)sRouteID
{
  if (self->_probGuardReport) {
    return 1LL;
  }
  if (self->_memoryErrorReport) {
    return 15LL;
  }
  if (self->_sanitizerReport) {
    return 11LL;
  }
  if (!self->_exceptionStateCount
    || ((v4 = self->_exceptionState[2], v5 = v4 & 0xFC01FFFF, unsigned int v6 = v4 & 0xFC01FF00, v5 != -268413671)
      ? (unint64_t result = 2LL)
      : (unint64_t result = 14LL),
        v6 != -268413696))
  {
    exit_snapshot = self->_exit_snapshot;
    if (exit_snapshot && exit_snapshot->ers_code == 3367907150)
    {
      return 2LL;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationSpecificInfo,  "objectForKeyedSubscript:",  @"libsystem_c.dylib"));
      unsigned __int8 v9 = [v8 containsObject:@"detected buffer overflow"];

      if ((v9 & 1) != 0) {
        return 3LL;
      }
      int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationSpecificInfo,  "objectForKeyedSubscript:",  @"libsystem_c.dylib"));
      unsigned __int8 v11 = [v10 containsObject:@"detected source and destination buffer overlap"];

      if ((v11 & 1) != 0)
      {
        return 3LL;
      }

      else
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationSpecificInfo,  "objectForKeyedSubscript:",  @"libsystem_c.dylib"));
        unsigned __int8 v13 = [v12 containsObject:@"stack buffer overflow"];

        if ((v13 & 1) != 0)
        {
          return 4LL;
        }

        else if (self->_exceptionType == 12 {
               && (unint64_t)-[OSACrashReport codeZeroForGuardException](self, "codeZeroForGuardException") >> 61 == 1)
        }
        {
          return 12LL;
        }

        else
        {
          signed int v14 = self->_exit_snapshot;
          if (v14 && (v14->ers_flags & 0x1000) != 0)
          {
            return 13LL;
          }

          else if (-[OSACrashReport shouldEnableUrgentSubmission](self, "shouldEnableUrgentSubmission"))
          {
            return 16LL;
          }

          else
          {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

- (NSString)coalitionName
{
  return self->_coalition_name;
}

- (int)proc_id
{
  return self->_proc_id;
}

- (NSString)procName
{
  return self->_procName;
}

- (NSString)bundle_id
{
  return self->_bundle_id;
}

- (NSString)short_vers
{
  return self->_short_vers;
}

- (NSString)responsibleProc
{
  return self->_responsibleProc;
}

- (BOOL)is_beta
{
  return self->_is_beta;
}

- (BOOL)is_simulated
{
  return self->_is_simulated;
}

- (int)exceptionType
{
  return self->_exceptionType;
}

- (unint64_t)crashingAddress
{
  return self->_crashingAddress;
}

- (unint64_t)sharedCacheAddress
{
  return self->_sharedCacheAddress;
}

- (NSString)logWritingSignature
{
  return self->_logWritingSignature;
}

- (NSMutableString)logWritingSignatureFrames
{
  return (NSMutableString *)objc_getProperty(self, a2, 16432LL, 1);
}

- (void)setLogWritingSignatureFrames:(id)a3
{
}

- (unsigned)consecutiveCrashCount
{
  return self->_consecutiveCrashCount;
}

- (unsigned)throttleTimeout
{
  return self->_throttleTimeout;
}

- (OSAExclaveContainer)exclaveContainer
{
  return self->_exclaveContainer;
}

- (void)setExclaveContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)shouldEnableUrgentSubmission
{
  v2 = self;
  char v3 = sub_1000203F8();

  return v3 & 1;
}

- (void)updateLogWritingSignatureWithSymbol:(id)a3 address:(unint64_t)a4
{
  id v7 = a3;
  id v8 = self;
  sub_100021110(a3, a4);
}

@end