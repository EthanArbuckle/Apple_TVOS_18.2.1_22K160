@interface OSAReport
+ (id)bootArgs;
+ (id)bootSessionUUID;
+ (id)findBundleAtPath:(id)a3 withKeys:(id)a4 bundleURL:(id *)a5;
+ (id)kernelVersionDescription;
+ (id)reduceToTwoSigFigures:(unint64_t)a3;
+ (id)systemIDWithDescription:(BOOL)a3;
+ (unsigned)codeSigningMonitor;
+ (unsigned)executeWithTimeout:(unsigned int)a3 Code:(id)a4;
+ (void)codeSigningMonitor;
- (BOOL)isActionable;
- (BOOL)isAppleTV;
- (BOOL)saveWithOptions:(id)a3;
- (NSArray)notes;
- (NSString)etlKey;
- (NSString)logfile;
- (NSString)oldLogFile;
- (OSAReport)init;
- (double)captureTime;
- (double)capture_time;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)getSyslogForPids:(id)a3 andOptionalSenders:(id)a4 additionalPredicates:(id)a5;
- (id)incidentID;
- (id)problemType;
- (id)reportNamePrefix;
- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)setEtlKey:(id)a3;
@end

@implementation OSAReport

- (OSAReport)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSAReport;
  v2 = -[OSAReport init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    logWritingOptions = v2->_logWritingOptions;
    v2->_logWritingOptions = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (id)problemType
{
}

- (id)getSyslogForPids:(id)a3 andOptionalSenders:(id)a4 additionalPredicates:(id)a5
{
  v88[5] = *MEMORY[0x1895F89C0];
  id v52 = a3;
  id v51 = a4;
  id v7 = a5;
  [MEMORY[0x189603FA8] array];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  if ([v9 appleInternal])
  {
  }

  else
  {
    v10 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    int v11 = [v10 carrierInstall];

    if (!v11) {
      goto LABEL_45;
    }
  }

  if (getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken != -1) {
    dispatch_once(&getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken, &__block_literal_global_4);
  }
  if (getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj
    && getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj)
  {
    if (!dispatch_semaphore_wait( (dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore,  0LL))
    {
      context = (void *)MEMORY[0x186E340A4]();
      v87[0] = &unk_189E30950;
      v87[1] = &unk_189E30968;
      v88[0] = @"default";
      v88[1] = @"   info";
      v87[2] = &unk_189E30980;
      v87[3] = &unk_189E30998;
      v88[2] = @"  debug";
      v88[3] = @"  error";
      v87[4] = &unk_189E309B0;
      v88[4] = @"  fault";
      [MEMORY[0x189603F68] dictionaryWithObjects:v88 forKeys:v87 count:5];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj localStore];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)buf = 0LL;
      v79 = buf;
      uint64_t v80 = 0x3032000000LL;
      v81 = __Block_byref_object_copy__4;
      v82 = __Block_byref_object_dispose__4;
      id v83 = 0LL;
      v77[0] = MEMORY[0x1895F87A8];
      v77[1] = 3221225472LL;
      v77[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_26;
      v77[3] = &unk_189E20CE0;
      v77[4] = buf;
      [v49 prepareWithCompletionHandler:v77];
      v12 = (void *)*((void *)v79 + 5);
      if (v12)
      {
        [v12 setFlags:13];
        uint64_t v13 = MEMORY[0x1895F8AE0];
        id v14 = MEMORY[0x1895F8AE0];
        [*((id *)v79 + 5) setTarget:v13];

        uint64_t v74 = 0LL;
        v75[0] = &v74;
        v75[1] = 0x3032000000LL;
        v75[2] = __Block_byref_object_copy__4;
        v75[3] = __Block_byref_object_dispose__4;
        id v76 = 0LL;
        [MEMORY[0x189603FA8] array];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        id v16 = v52;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v71;
          do
          {
            for (uint64_t i = 0LL; i != v17; ++i)
            {
              if (*(void *)v71 != v18) {
                objc_enumerationMutation(v16);
              }
              [MEMORY[0x1896079C8] predicateWithFormat:@"processID == %@", *(void *)(*((void *)&v70 + 1) + 8 * i)];
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 addObject:v20];
            }

            uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v86 count:16];
          }

          while (v17);
        }

        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v21 = v51;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v85 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v67;
          do
          {
            for (uint64_t j = 0LL; j != v22; ++j)
            {
              if (*(void *)v67 != v23) {
                objc_enumerationMutation(v21);
              }
              [MEMORY[0x1896079C8] predicateWithFormat:@"senderImagePath CONTAINS[cd] %@", *(void *)(*((void *)&v66 + 1) + 8 * j)];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 addObject:v25];
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v85 count:16];
          }

          while (v22);
        }

        if (v7) {
          [v15 addObjectsFromArray:v7];
        }
        if ([v15 count])
        {
          [MEMORY[0x189607820] orPredicateWithSubpredicates:v15];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          [*((id *)v79 + 5) setFilterPredicate:v26];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.4((uint64_t)v26);
          }
        }

        else
        {
          BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
          if (v27) {
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.3( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34);
          }
        }

        [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->_capture_time + 0.5];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 dateByAddingTimeInterval:-300.0];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, *((id *)v79 + 5));
        v63[0] = 0LL;
        v63[1] = v63;
        v63[2] = 0x2020000000LL;
        int v64 = 0;
        v61[0] = 0LL;
        v61[1] = v61;
        v61[2] = 0x3032000000LL;
        v61[3] = __Block_byref_object_copy__4;
        v61[4] = __Block_byref_object_dispose__4;
        id v62 = 0LL;
        v37 = (void *)*((void *)v79 + 5);
        v54[0] = MEMORY[0x1895F87A8];
        v54[1] = 3221225472LL;
        v54[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_35;
        v54[3] = &unk_189E20D08;
        v58 = v61;
        v59 = v63;
        id v38 = v36;
        id v55 = v38;
        id v56 = v48;
        id v8 = v8;
        id v57 = v8;
        objc_copyWeak(&v60, &location);
        [v37 setEventHandler:v54];
        v39 = (void *)*((void *)v79 + 5);
        v53[0] = MEMORY[0x1895F87A8];
        v53[1] = 3221225472LL;
        v53[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2;
        v53[3] = &unk_189E20D30;
        v53[4] = &v74;
        [v39 setInvalidationHandler:v53];
        double Current = CFAbsoluteTimeGetCurrent();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.2((uint64_t)v38, (uint64_t)v35);
        }
        [*((id *)v79 + 5) activateStreamFromDate:v35];
        v41 = (dispatch_semaphore_s *)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
        dispatch_time_t v42 = dispatch_time(0LL, 120000000000LL);
        if (dispatch_semaphore_wait(v41, v42))
        {

          id v8 = 0LL;
        }

        else
        {
          double v43 = CFAbsoluteTimeGetCurrent();
          v44 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v45 = MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:]( (uint64_t)v75,  v84,  [v8 count],  v43 - Current);
          }

          if ([v8 count]) {
            [v8 addObject:@"Timestamp                         Type Thread  Act Process[pid] (Sender)"];
          }
          dispatch_semaphore_signal((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore);
        }

        [*((id *)v79 + 5) invalidate];
        objc_destroyWeak(&v60);

        _Block_object_dispose(v61, 8);
        _Block_object_dispose(v63, 8);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v74, 8);
      }

      _Block_object_dispose(buf, 8);

      objc_autoreleasePoolPop(context);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "OSLogEvent unsupported in this environment",  buf,  2u);
  }

Class __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1LL);
  v1 = (void *)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
  getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore = (uint64_t)v0;

  getSyslogForPids_andOptionalSenders_additionalPredicates__loggingSupport_dylib = (uint64_t)dlopen( "/System/Library/PrivateFra meworks/LoggingSupport.fra mework/LoggingSupport",  4);
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObuint64_t j = (uint64_t)objc_getClass("OSLogEventStore");
  Class result = objc_getClass("OSLogEventStream");
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObuint64_t j = (uint64_t)result;
  return result;
}

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_26( uint64_t a1,  void *a2,  uint64_t a3)
{
  if (!a3)
  {
    v4 = (objc_class *)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj;
    id v5 = a2;
    uint64_t v6 = [[v4 alloc] initWithSource:v5];

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_35( uint64_t a1,  void *a2)
{
  id v35 = a2;
  BOOL v3 = [v35 type] == 1024;
  v4 = v35;
  if (v3)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      uint64_t v5 = [v35 bootUUID];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8LL);
    int v9 = *(_DWORD *)(v8 + 24);
    *(_DWORD *)(v8 + 24) = v9 + 1;
    if (v9 <= 126)
    {
      v10 = *(void **)(a1 + 32);
      [v35 date];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 compare:v11] == -1)
      {
        v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        [v35 bootUUID];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = [v12 isEqual:v13];

        if ((_DWORD)v12)
        {
          id v14 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v35, "logType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:v15];
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

          [v35 composedMessage];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v34 = [v17 length];
          if (v34 < 1025) {
            goto LABEL_15;
          }
          for (uint64_t i = [v17 substringToIndex:1024];
          {
            v19 = (void *)i;

            uint64_t v17 = v19;
LABEL_15:
            uint64_t v20 = [v17 rangeOfString:@"\n"];
            if (v20) {
              break;
            }
            [v17 substringFromIndex:1];
          }

          uint64_t v21 = v20;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v22 = [v17 substringToIndex:v20];

            uint64_t v17 = (void *)v22;
          }

          uint64_t v33 = (void *)NSString;
          objc_msgSend(v35, "date", v21);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          OSANSDateFormat(2u, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [v35 threadIdentifier];
          uint64_t v26 = [v35 activityIdentifier];
          [v35 process];
          BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = [v35 processIdentifier];
          [v35 sender];
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v17 length];
          uint64_t v31 = @"...";
          if (v30 == v34) {
            uint64_t v31 = &stru_189E21910;
          }
          [v33 stringWithFormat:@"%@ %@ 0x%05llx 0x%llx %@[%d] (%@): %@%@", v24, WeakRetained, v25, v26, v27, v28, v29, v17, v31];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

          if ([v32 length]) {
            [*(id *)(a1 + 48) addObject:v32];
          }

          goto LABEL_12;
        }
      }

      else
      {
      }
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained invalidate];
LABEL_12:

    v4 = v35;
  }
}

uint64_t __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"<%lu>", a2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  switch(a2)
  {
    case 3LL:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"invalid position";
      break;
    case 2LL:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"backlog";
      break;
    case 1LL:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"disconnected";
      break;
    default:
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0LL;
      goto LABEL_9;
  }

  *(void *)(v7 + 40) = v9;
LABEL_9:

  return dispatch_semaphore_signal((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore);
}

+ (unsigned)executeWithTimeout:(unsigned int)a3 Code:(id)a4
{
  id v5 = a4;
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = dispatch_group_create();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__OSAReport_executeWithTimeout_Code___block_invoke;
  block[3] = &unk_189E20D58;
  id v12 = v5;
  id v8 = v5;
  dispatch_group_async(v7, v6, block);
  dispatch_time_t v9 = dispatch_time(0LL, 1000000LL * a3);
  LOBYTE(a3) = dispatch_group_wait(v7, v9) != 0;

  return a3;
}

uint64_t __37__OSAReport_executeWithTimeout_Code___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)isAppleTV
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  size_t v6 = 128LL;
  if (!sysctlbyname("hw.machine", v7, &v6, 0LL, 0LL)) {
    return v7[0] == 1819308097 && *(_DWORD *)((char *)v7 + 3) == 1448371564;
  }
  BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v2)
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "unable to run sysctl hw.machine", v5, 2u);
    return 0;
  }

  return result;
}

- (id)incidentID
{
  incidentID = self->_incidentID;
  if (!incidentID)
  {
    uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    id v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x189604DB0]);
    size_t v6 = (__CFString *)CFUUIDCreateString(v4, v5);
    uint64_t v7 = self->_incidentID;
    self->_incidentID = &v6->isa;

    CFRelease(v5);
    incidentID = self->_incidentID;
  }

  if (incidentID) {
    uint64_t v8 = (__CFString *)incidentID;
  }
  else {
    uint64_t v8 = @"<incident x>";
  }
  return v8;
}

- (double)captureTime
{
  return self->_capture_time;
}

+ (id)systemIDWithDescription:(BOOL)a3
{
  BOOL v3 = a3;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 appleInternal];

  if (v5)
  {
    size_t v6 = (const __CFString *)MGCopyAnswer();
    if (v6)
    {
      uint64_t v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 != CFStringGetTypeID())
      {
        CFRelease(v7);
        uint64_t v7 = @"ERROR UDID was not a string";
      }
    }

    else
    {
      uint64_t v7 = @"UDID was null";
    }

    if (v3) {
      uint64_t v10 = @"UDID:                %@\n";
    }
    else {
      uint64_t v10 = @"%@";
    }
    objc_msgSend(NSString, "stringWithFormat:", v10, v7);
    dispatch_time_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }

  else
  {
    dispatch_time_t v9 = &stru_189E21910;
  }

  return v9;
}

+ (id)kernelVersionDescription
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  bzero(v5, 0x400uLL);
  size_t v4 = 1023LL;
  uint64_t v2 = sysctlbyname("kern.version", v5, &v4, 0LL, 0LL);
  if ((_DWORD)v2) {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown (error %d)>", v2);
  }
  else {
    [NSString stringWithUTF8String:v5];
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bootArgs
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  size_t v5 = 1023LL;
  int v2 = sysctlbyname("kern.bootargs", v6, &v5, 0LL, 0LL);
  BOOL v3 = 0LL;
  if (!v2)
  {
    [NSString stringWithUTF8String:v6];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

+ (unsigned)codeSigningMonitor
{
  unsigned int v4 = 0;
  size_t v3 = 4LL;
  if (!sysctlbyname("security.codesigning.monitor", &v4, &v3, 0LL, 0LL)) {
    return v4;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    +[OSAReport codeSigningMonitor].cold.1();
  }
  return -1;
}

+ (id)bootSessionUUID
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  memset(v6, 0, sizeof(v6));
  size_t v5 = 37LL;
  int v2 = sysctlbyname("kern.bootsessionuuid", v6, &v5, 0LL, 0LL);
  size_t v3 = 0LL;
  if (!v2)
  {
    [NSString stringWithUTF8String:v6];
    size_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)appleCareDetails
{
}

- (id)reportNamePrefix
{
}

- (BOOL)isActionable
{
  return 1;
}

- (id)additionalIPSMetadata
{
  v6[1] = *MEMORY[0x1895F89C0];
  size_t v5 = @"incident_id";
  -[OSAReport incidentID](self, "incidentID");
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  size_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[OSAReport generateLogAtLevel:withBlock:]", "OSAReport.m", 355, "0");
}

- (BOOL)saveWithOptions:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[OSAReport isActionable](self, "isActionable"))
  {
    if (-[NSMutableArray count](self->_notes, "count"))
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v25 = self->_notes;
      uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
      if (v26)
      {
        uint64_t v27 = *(void *)v33;
        uint64_t v28 = (os_log_s *)MEMORY[0x1895F8DA0];
        do
        {
          for (uint64_t i = 0LL; i != v26; ++i)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(v25);
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v30;
              _os_log_impl(&dword_1861AC000, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
          }

          uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
        }

        while (v26);
      }
    }

    else
    {
      BOOL v12 = 0;
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "report not saved because it is non-actionable (ie: extension hangs or internal-only)",  buf,  2u);
    }

    BOOL v12 = 0;
    goto LABEL_27;
  }

  -[NSMutableDictionary addEntriesFromDictionary:](self->_logWritingOptions, "addEntriesFromDictionary:", v4);
  -[OSAReport reportNamePrefix](self, "reportNamePrefix");
  size_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_logWritingOptions,  "setObject:forKeyedSubscript:",  v5,  @"override-filePrefix");

  -[OSAReport problemType](self, "problemType");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSAReport additionalIPSMetadata](self, "additionalIPSMetadata");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  logWritingOptions = self->_logWritingOptions;
  v36[4] = self;
  id v37 = 0LL;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __29__OSAReport_saveWithOptions___block_invoke;
  v36[3] = &unk_189E20DA8;
  +[OSALog createForSubmission:metadata:options:error:writing:]( &OBJC_CLASS___OSALog,  "createForSubmission:metadata:options:error:writing:",  v6,  v7,  logWritingOptions,  &v37,  v36);
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v37;

  if (v9) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = v11;
  [v9 filepath];
  uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  logfile = self->_logfile;
  self->_logfile = v13;

  [v9 oldFilePath];
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  oldLogFile = self->_oldLogFile;
  self->_oldLogFile = v15;

  [v4 objectForKeyedSubscript:@"override-filePath"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v18 = v17 == 0LL;

  if (v18)
  {
    v19 = -[OSAReport appleCareDetails](self, "appleCareDetails");
    if (v19)
    {
      double capture_time = self->_capture_time;
      -[OSAReport problemType](self, "problemType");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v21;
      -[OSAReport incidentID](self, "incidentID");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v22;
      [MEMORY[0x189603F18] arrayWithObjects:v39 count:2];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 arrayByAddingObjectsFromArray:v19];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      logForAppleCare(v24, capture_time);
    }
  }

LABEL_27:
  return v12;
}

void __29__OSAReport_saveWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  void v6[2] = __29__OSAReport_saveWithOptions___block_invoke_2;
  v6[3] = &unk_189E20D80;
  id v7 = v3;
  id v5 = v3;
  [v4 streamContentAtLevel:1 withBlock:v6];
}

uint64_t __29__OSAReport_saveWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  [MEMORY[0x189603FA8] array];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke;
  BOOL v18 = &unk_189E20DF8;
  uint64_t v21 = &v25;
  id v8 = v7;
  id v19 = v8;
  uint64_t v22 = v23;
  id v9 = v6;
  id v20 = v9;
  -[OSAReport generateLogAtLevel:withBlock:](self, "generateLogAtLevel:withBlock:", v4, &v15);
  int v10 = *((_DWORD *)v26 + 6);
  if (!v10)
  {
    if (objc_msgSend(v8, "count", v15, v16, v17, v18, v19) != 1) {
      __assert_rtn("-[OSAReport streamContentAtLevel:withBlock:]", "OSAReport.m", 499, "[section_stack count] == 1");
    }
    objc_msgSend(v8, "section_pop");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 dataUsingEncoding:4 allowLossyConversion:1];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = (*((uint64_t (**)(id, void *))v9 + 2))(v9, v12);
    *((_DWORD *)v26 + 6) = v13;

    int v10 = *((_DWORD *)v26 + 6);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && !*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    uint64_t v25 = __Block_byref_object_copy__4;
    uint64_t v26 = __Block_byref_object_dispose__4;
    id v27 = 0LL;
    if ([*(id *)(a1 + 32) count])
    {
      [MEMORY[0x189603FB8] data];
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectForKey:&unk_189E309C8];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 BOOLValue];

      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88;
      v15[3] = &unk_189E20DD0;
      id v16 = *(id *)(a1 + 32);
      id v7 = v4;
      uint64_t v8 = *(void *)(a1 + 56);
      id v17 = v7;
      uint64_t v18 = v8;
      id v19 = &v22;
      uint64_t v20 = v6;
      [v3 enumerateKeysAndObjectsUsingBlock:v15];
      id v9 = v17;
      id v10 = v7;

      BOOL v11 = v10;
    }

    else
    {
      BOOL v12 = (id *)(v23 + 5);
      obuint64_t j = (id)v23[5];
      [MEMORY[0x1896078D8] dataWithJSONObject:v3 options:1 error:&obj];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v12, obj);
      objc_msgSend(v10, "subdataWithRange:", 0, objc_msgSend(v10, "length") - 2);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "section_push:", @"\n}\n");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count] != 0;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v11,  v13,  v14);
    _Block_object_dispose(&v22, 8);
  }
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:&unk_189E309E0])
  {
    if (![*(id *)(a1 + 32) count]) {
      __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_1();
    }
    id v7 = *(void **)(a1 + 40);
    objc_msgSend( @"\n",  "stringByPaddingToLength:withString:startingAtIndex:",  2 * objc_msgSend(*(id *)(a1 + 32), "count") - 1,  @" ",  0);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = 1;
    [v8 dataUsingEncoding:4 allowLossyConversion:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendData:v10];

    BOOL v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "section_pop");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 dataUsingEncoding:4 allowLossyConversion:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 appendData:v13];

    uint64_t v14 = a1 + 48;
    goto LABEL_12;
  }

  if (([v5 isEqual:&unk_189E309C8] & 1) == 0)
  {
    uint64_t v14 = a1 + 48;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      uint64_t v15 = *(void **)(a1 + 40);
      [MEMORY[0x189603F48] dataWithBytes:"," length:1];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 appendData:v16];
    }

    id v17 = *(void **)(a1 + 40);
    objc_msgSend( @"\n",  "stringByPaddingToLength:withString:startingAtIndex:",  (2 * objc_msgSend(*(id *)(a1 + 32), "count")) | 1,  @" ",  0);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 dataUsingEncoding:4 allowLossyConversion:1];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 appendData:v19];

    if ([v5 isEqual:&unk_189E309F8])
    {
      uint64_t v20 = *(void **)(a1 + 40);
      [NSString stringWithFormat:@"%@ : {", v6];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 dataUsingEncoding:4 allowLossyConversion:1];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 appendData:v22];

      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = @"}";
    }

    else
    {
      if (![v5 isEqual:&unk_189E30A10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_2();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          int v28 = *(void **)(a1 + 40);
          uint64_t v29 = (void *)NSString;
          id v30 = v6;
          if (v30)
          {
            uint64_t v31 = (void *)MEMORY[0x186E340A4]();
            [MEMORY[0x1896078D8] dataWithJSONObject:v30 options:4 error:0];
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              __int128 v33 = (void *)[objc_alloc(NSString) initWithData:v32 encoding:4];
              objc_msgSend(v33, "substringWithRange:", 1, objc_msgSend(v33, "length") - 2);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              __int128 v34 = 0LL;
            }

            objc_autoreleasePoolPop(v31);
          }

          else
          {
            __int128 v34 = 0LL;
          }

          [v29 stringWithFormat:@"\"%@\" : \"%@\"", v5, v34];
          id v45 = (void *)objc_claimAutoreleasedReturnValue();
          char v9 = 1;
          [v45 dataUsingEncoding:4 allowLossyConversion:1];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 appendData:v46];
        }

        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v36 = *(void **)(a1 + 40);
          if ((isKindOfClass & 1) != 0)
          {
            [NSString stringWithFormat:@"%@ : %@", v5, v6];
            id v37 = (void *)objc_claimAutoreleasedReturnValue();
            char v9 = 1;
            [v37 dataUsingEncoding:4 allowLossyConversion:1];
            id v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v36 appendData:v38];
          }

          else
          {
            [NSString stringWithFormat:@"%@ : ", v5];
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            char v9 = 1;
            [v39 dataUsingEncoding:4 allowLossyConversion:1];
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            [v36 appendData:v40];

            uint64_t v41 = *(void **)(a1 + 40);
            uint64_t v42 = *(void *)(a1 + 64);
            uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8LL);
            obuint64_t j = *(id *)(v43 + 40);
            [MEMORY[0x1896078D8] dataWithJSONObject:v6 options:v42 error:&obj];
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)(v43 + 40), obj);
            [v41 appendData:v44];
          }
        }

        goto LABEL_12;
      }

      uint64_t v25 = *(void **)(a1 + 40);
      [NSString stringWithFormat:@"%@ : [", v6];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 dataUsingEncoding:4 allowLossyConversion:1];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 appendData:v27];

      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = @"]";
    }

    objc_msgSend(v23, "section_push:", v24);
    char v9 = 0;
LABEL_12:
    *(_BYTE *)(*(void *)(*(void *)v14 + 8LL) + 24LL) = v9;
  }
}

+ (id)findBundleAtPath:(id)a3 withKeys:(id)a4 bundleURL:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = __Block_byref_object_copy__4;
  id v30 = __Block_byref_object_dispose__4;
  id v31 = (id)objc_opt_new();
  char v9 = (void *)objc_opt_new();
  id v10 = (void *)MEMORY[0x186E340A4]();
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  [MEMORY[0x189604030] fileURLWithPath:v7];
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (findBundleAtPath_withKeys_bundleURL__onceToken != -1) {
    dispatch_once(&findBundleAtPath_withKeys_bundleURL__onceToken, &__block_literal_global_116);
  }
  if (v21[5])
  {
    BOOL v11 = (dispatch_queue_s *)findBundleAtPath_withKeys_bundleURL__bundle_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2;
    block[3] = &unk_189E20E40;
    uint64_t v18 = &v20;
    id v17 = v8;
    id v19 = &v26;
    dispatch_sync(v11, block);
    [(id)v21[5] path];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setString:v12];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v7;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "no URL for '%{private}@'", buf, 0xCu);
  }

  _Block_object_dispose(&v20, 8);

  objc_autoreleasePoolPop(v10);
  if (a5)
  {
    [MEMORY[0x189604030] fileURLWithPath:v9];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ([(id)v27[5] count]) {
    uint64_t v13 = (void *)v27[5];
  }
  else {
    uint64_t v13 = 0LL;
  }
  id v14 = v13;

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.osanalytics.bundlereader.serialqueue", 0LL);
  v1 = (void *)findBundleAtPath_withKeys_bundleURL__bundle_queue;
  findBundleAtPath_withKeys_bundleURL__bundle_queue = (uint64_t)v0;
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  int v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = CFBundleCopyBundleURL(v2);
    if (v4 && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:v4] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v5;
        __int16 v43 = 2112;
        v44 = v4;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "CFBundle URL refined %@ to %@",  buf,  0x16u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v4);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(const __CFString **)(*((void *)&v35 + 1) + 8 * i);
          CFBundleGetValueForInfoDictionaryKey(v3, v11);
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v8);
    }

    CFRelease(v3);
  }

  else
  {
    [MEMORY[0x1896077F8] bundleWithURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "*** found alternate bundle", buf, 2u);
      }

      [v4 bundleURL];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:v13] & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = v14;
          __int16 v43 = 2112;
          v44 = v13;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "NSBundle URL refined %@ to %@",  buf,  0x16u);
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v13);
      }

      [v4 infoDictionary];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
        do
        {
          for (uint64_t j = 0LL; j != v18; ++j)
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * j);
            objc_msgSend(v15, "objectForKeyedSubscript:", v21, (void)v31);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22) {
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v22 forKeyedSubscript:v21];
            }
          }

          uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }

        while (v18);
      }
    }

    else
    {
      BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
      if (v23) {
        __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1( v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30);
      }
    }
  }
}

+ (id)reduceToTwoSigFigures:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    unsigned int v4 = log10((double)a3);
    if (v4 + 1 >= 3)
    {
      double v5 = __exp10((double)(v4 - 1));
      unint64_t v3 = v3 / (unint64_t)v5 * (unint64_t)v5;
    }
  }

  return (id)[MEMORY[0x189607968] numberWithUnsignedLongLong:v3];
}

- (double)capture_time
{
  return self->_capture_time;
}

- (NSArray)notes
{
  return &self->_notes->super;
}

- (NSString)logfile
{
  return self->_logfile;
}

- (NSString)etlKey
{
  return self->_etlKey;
}

- (void)setEtlKey:(id)a3
{
}

- (NSString)oldLogFile
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

- (void)getSyslogForPids:(uint64_t)a3 andOptionalSenders:(double)a4 additionalPredicates:.cold.1( uint64_t a1,  uint8_t *buf,  uint64_t a3,  double a4)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40LL);
  *(_DWORD *)buf = 134218498;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = v4;
  _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "OSLogEventStream found %lu lines after %.1f secs (invalidation: %@)",  buf,  0x20u);
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:(uint64_t)a2 additionalPredicates:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "OSLogEventStream enumerate from %@ to %@",  (uint8_t *)&v2,  0x16u);
}

- (void)getSyslogForPids:(uint64_t)a3 andOptionalSenders:(uint64_t)a4 additionalPredicates:(uint64_t)a5 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:additionalPredicates:.cold.4(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "OSLogEventStream query '%@'",  (uint8_t *)&v1,  0xCu);
}

+ (void)codeSigningMonitor
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v0 = *__error();
  int v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2082;
  uint64_t v5 = v2;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error getting security.codesigning.monitor: %d %{public}s",  (uint8_t *)v3,  0x12u);
}

- (void)saveWithOptions:(void *)a1 .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error while writing report payload: %{public}@",  buf,  0xCu);
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_1()
{
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_88_cold_2()
{
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end