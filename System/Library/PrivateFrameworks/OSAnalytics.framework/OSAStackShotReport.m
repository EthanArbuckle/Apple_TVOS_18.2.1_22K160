@interface OSAStackShotReport
- (BOOL)dead_snapshot;
- (BOOL)includeSyslog;
- (BOOL)isActionable;
- (NSArray)frontmostPids;
- (OSAStackShotReport)initWithName:(id)a3 reason:(id)a4 exceptionCode:(int64_t *)a5 exceptionCodeCount:(unsigned int)a6;
- (const)ss_trace_buffer;
- (id)appleCareDetails;
- (id)exceptionCodesDescription;
- (id)getExtraData:(id)a3;
- (id)getStackshotData;
- (id)getVMStatistics;
- (id)initForPid:(int)a3 process:(id)a4 withReason:(id)a5 exceptionCode:(int64_t *)a6 exceptionCodeCount:(unsigned int)a7 stackshotFlags:(unsigned int)a8;
- (id)problemType;
- (id)reportNamePrefix;
- (id)resampleUUIDsForTask:(int)a3 usingCatalog:(id)a4;
- (int)jetsamLevel;
- (int)resampleTruncatedBacktracesForTask:(int)a3 forThreads:(id)a4 usingCatalog:(id)a5 in:(id)a6 usingSymbolicator:(_CSTypeRef)a7;
- (unint64_t)capture_absoluteTime;
- (unsigned)flags;
- (unsigned)ss_sequence;
- (unsigned)ss_trace_length;
- (void)acquireStackshot;
- (void)addCustomField:(const char *)a3 value:(id)a4 into:(id)a5;
- (void)addNotes:(id)a3;
- (void)dealloc;
- (void)decodeKCDataWithBlock:(id)a3 withTuning:(id)a4 usingCatalog:(id)a5;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)queryThermalData;
- (void)setAdditionalPayload:(id)a3;
- (void)setDead_snapshot:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setIncidentID:(id)a3;
- (void)setIncludeSyslog:(BOOL)a3;
- (void)setJetsamLevel:(int)a3;
- (void)setReason:(id)a3;
- (void)setSs_sequence:(unsigned int)a3;
- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8;
- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8 isSnapshotDead:(BOOL)a9;
- (void)useStackshotData:(id)a3 frontmostPids:(id)a4 atTime:(double)a5 machTime:(unint64_t)a6 sequence:(unsigned int)a7;
@end

@implementation OSAStackShotReport

- (id)initForPid:(int)a3 process:(id)a4 withReason:(id)a5 exceptionCode:(int64_t *)a6 exceptionCodeCount:(unsigned int)a7 stackshotFlags:(unsigned int)a8
{
  id v15 = a4;
  id v16 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___OSAStackShotReport;
  v17 = -[OSAReport init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_pid = a3;
    objc_storeStrong((id *)&v17->_appName, a4);
    -[OSAStackShotReport setReason:](v18, "setReason:", v16);
    uint64_t v19 = objc_opt_new();
    frontmostPids = v18->_frontmostPids;
    v18->_frontmostPids = (NSMutableArray *)v19;

    v18->_ss_sequence = -1;
    v18->_exceptionCodeCount = a7;
    v21 = (int64_t *)calloc(8uLL, a7);
    v18->_exceptionCodes = v21;
    memcpy(v21, a6, 8LL * v18->_exceptionCodeCount);
    if ((a8 & 0x80000000) != 0) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v18->super._logWritingOptions,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"override-limit");
    }
    v18->_flags = a8 & 0x7FFFFFFF;
    v18->_jetsamLevel = -1;
    uint64_t v22 = objc_opt_new();
    extras = v18->_extras;
    v18->_extras = (NSMutableDictionary *)v22;

    v18->_capture_absoluteTime = mach_absolute_time();
    v18->super._capture_time = CFAbsoluteTimeGetCurrent();
    v24 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    int v25 = [v24 appleInternal];

    if (v25) {
      v18->_includeSyslog = 1;
    }
    if (initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken != -1) {
      dispatch_once( &initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken,  &__block_literal_global);
    }
  }

  return v18;
}

void __100__OSAStackShotReport_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags___block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 getTaskingKey:@"stackshot_tuning"];
  v2 = (void *)tasked_tuning;
  tasked_tuning = v1;

  if (tasked_tuning)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)tasked_tuning;
      tasked_tuning = 0LL;
    }
  }

- (OSAStackShotReport)initWithName:(id)a3 reason:(id)a4 exceptionCode:(int64_t *)a5 exceptionCodeCount:(unsigned int)a6
{
  return (OSAStackShotReport *)-[OSAStackShotReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:]( self,  "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:",  0LL,  a3,  a4,  a5,  *(void *)&a6,  0LL);
}

- (void)dealloc
{
  if (self->_stackshot_config) {
    stackshot_config_dealloc();
  }
  free(self->_exceptionCodes);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSAStackShotReport;
  -[OSAStackShotReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return @"288";
}

- (id)appleCareDetails
{
  v19[4] = *MEMORY[0x1895F89C0];
  if (self->_pid)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x189612A40]) initWithPid:self->_pid];
    v4 = v3;
    if (v3)
    {
      [v3 userAppName];
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFURLRef v6 = CFURLCreateWithFileSystemPath(0LL, v5, kCFURLPOSIXPathStyle, 1u);
      if (v6)
      {
        CFURLRef v7 = v6;
        v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
        if (v8)
        {
          v9 = v8;
          v10 = CFBundleCreate(0LL, v8);
          if (v10)
          {
            v11 = v10;
            CFBundleGetIdentifier(v10);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFRelease(v11);
          }

          else
          {
            v12 = 0LL;
          }

          CFRelease(v9);
        }

        else
        {
          v12 = 0LL;
        }

        CFRelease(v7);
      }

      else
      {
        v12 = 0LL;
      }
    }

    else
    {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  appName = self->_appName;
  if (appName)
  {
    v19[0] = &unk_189E30740;
    v19[1] = appName;
    v14 = &stru_189E21910;
    if (v12) {
      id v15 = v12;
    }
    else {
      id v15 = &stru_189E21910;
    }
    v19[2] = v15;
    reason = self->_reason;
    if (reason)
    {
      -[NSString stringByReplacingOccurrencesOfString:withString:]( reason,  "stringByReplacingOccurrencesOfString:withString:",  @"\n",  @" ");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    v19[3] = v14;
    [MEMORY[0x189603F18] arrayWithObjects:v19 count:4];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (reason) {
  }
    }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (id)reportNamePrefix
{
  appName = self->_appName;
  if (appName)
  {
    [NSString stringWithFormat:@"stacks+%@", appName];
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = @"stacks";
  }

  if (self->_ss_sequence == -1)
  {
    v5 = &stru_189E21910;
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"-%u", self->_ss_sequence);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v5);
  CFURLRef v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setIncidentID:(id)a3
{
}

- (void)setReason:(id)a3
{
}

- (id)getExtraData:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_extras, "objectForKey:", a3);
}

- (void)queryThermalData
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&queryThermalData_queried > 30.0)
  {
    queryThermalData_queried = *(void *)&Current;
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __38__OSAStackShotReport_queryThermalData__block_invoke;
    v4[3] = &unk_189E20268;
    v4[4] = self;
    +[OSAReport executeWithTimeout:Code:](&OBJC_CLASS___OSAReport, "executeWithTimeout:Code:", 2000LL, v4);
  }

uint64_t __38__OSAStackShotReport_queryThermalData__block_invoke(uint64_t a1)
{
  uint64_t result = OSThermalNotificationCurrentLevel();
  *(_DWORD *)(*(void *)(a1 + 32) + 120LL) = result;
  return result;
}

- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8
{
}

- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8 isSnapshotDead:(BOOL)a9
{
  id v16 = a5;
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0LL;
  }

  self->_ss_trace_buffer = a3;
  self->_ss_trace_length = a4;
  self->_ss_sequence = a8;
  if (!self->_pid) {
    self->_pid = -1;
  }
  -[NSMutableArray removeAllObjects](self->_frontmostPids, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_frontmostPids, "addObjectsFromArray:", v16);
  self->super._capture_time = a6;
  self->_capture_absoluteTime = a7;
  self->_dead_snapshot = a9;
}

- (void)useStackshotData:(id)a3 frontmostPids:(id)a4 atTime:(double)a5 machTime:(unint64_t)a6 sequence:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v16 = a4;
  id v13 = v12;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  -[OSAStackShotReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:]( self,  "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:",  v14,  v15,  v16,  a6,  v7,  a5);
}

- (void)acquireStackshot
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  -[NSMutableArray removeAllObjects](self->super._notes, "removeAllObjects");
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0LL;
  }

  self->_ss_trace_uint64_t buffer = 0LL;
  self->_ss_trace_length = 0;
  self->_capture_absoluteTime = mach_absolute_time();
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = stackshot_config_create();
  if (v3)
  {
    v4 = (void *)v3;
    unsigned int flags = self->_flags;
    self->_unsigned int flags = flags | 0x10000;
    if ((flags & 0xFFFEFFFF) == 0)
    {
      self->_unsigned int flags = flags | 0x1200F;
      [(id)tasked_tuning objectForKeyedSubscript:@"uuid_faulting"];
      CFURLRef v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = v6;
      [(id)tasked_tuning objectForKeyedSubscript:@"waitinfos"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      [(id)tasked_tuning objectForKeyedSubscript:@"shared_cache_layout"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
    }

    if (stackshot_config_set_flags())
    {
      notes = self->super._notes;
      [NSString stringWithFormat:@"Failed to set flags for stackshot config"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v13);

LABEL_17:
      stackshot_config_dealloc();
      goto LABEL_19;
    }

    uint64_t v29 = stackshot_capture_with_config();
    if ((_DWORD)v29)
    {
      uint64_t v30 = v29;
      v31 = self->super._notes;
      v32 = (void *)NSString;
      uint64_t v33 = geteuid();
      objc_msgSend( v32,  "stringWithFormat:",  @"Stackshot syscall failed (from euid %d) with error %d: %s",  v33,  v30,  strerror(v30));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v31, "addObject:", v34);

      if ((_DWORD)v30 == 2 && (self->_flags & 0x8000) != 0) {
        -[NSMutableArray addObject:]( self->super._notes,  "addObject:",  @"Stackshot key-combo received while a prior stackshot was still processing.");
      }
      goto LABEL_17;
    }

    self->_stackshot_config = v4;
    self->_ss_trace_uint64_t buffer = (const void *)stackshot_config_get_stackshot_buffer();
    self->_ss_trace_length = stackshot_config_get_stackshot_size();
    if ((self->_flags & 0x10000) == 0) {
      self->_jetsamLevel = memorystatus_control();
    }
  }

  else
  {
    uint64_t v14 = self->super._notes;
    [NSString stringWithFormat:@"Failed to allocate memory for stackshot config"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v15);
  }

- (id)getStackshotData
{
  if (self->_ss_trace_buffer && self->_ss_trace_length)
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (void)addNotes:(id)a3
{
}

- (void)setAdditionalPayload:(id)a3
{
}

- (BOOL)isActionable
{
  return self->_ss_trace_buffer && self->_ss_trace_length || (self->_flags & 0x8000) == 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v69[10] = *MEMORY[0x1895F89C0];
  v5 = (void (**)(id, void *))a4;
  v68[0] = @"incident";
  v47 = -[OSAReport incidentID](self, "incidentID");
  v69[0] = v47;
  v68[1] = @"crashReporterKey";
  v46 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v46 crashReporterKey];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v45;
  v68[2] = @"product";
  v44 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v44 modelCode];
  CFURLRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v6;
  v68[3] = @"build";
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 productNameVersionBuildString];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v8;
  v68[4] = @"kernel";
  uint64_t v9 = [(id)objc_opt_class() kernelVersionDescription];
  v10 = (void *)v9;
  uint64_t v11 = tasked_tuning;
  if (!tasked_tuning) {
    uint64_t v11 = MEMORY[0x189604A60];
  }
  v69[4] = v9;
  v69[5] = v11;
  v68[5] = @"tuning";
  v68[6] = @"exception";
  uint64_t v12 = -[OSAStackShotReport exceptionCodesDescription](self, "exceptionCodesDescription");
  id v13 = (void *)v12;
  reason = (const __CFString *)self->_reason;
  if (!reason) {
    reason = &stru_189E21910;
  }
  v69[6] = v12;
  v69[7] = reason;
  v68[7] = @"reason";
  v68[8] = @"frontmostPids";
  v69[8] = self->_frontmostPids;
  v68[9] = @"codeSigningMonitor";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v69 forKeys:v68 count:10];
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v16);
  v17 = -[OSAStackShotReport problemType](self, "problemType");
  v18 = +[OSALog commonFieldsForBody:](&OBJC_CLASS___OSALog, "commonFieldsForBody:", v17);
  v5[2](v5, v18);

  if (self->_pid)
  {
    v66 = @"pid";
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v19;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v20);
  }

  additionalPayload = self->_additionalPayload;
  if (additionalPayload)
  {
    v64 = @"additionalPayload";
    v65 = additionalPayload;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v22);
  }

  if (self->_thermalSensorValues)
  {
    v62 = @"thermalData";
    v60[0] = @"thermalLevel";
    [MEMORY[0x189607968] numberWithInt:self->_thermalNotificationCurrentLevel];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = @"sensors";
    v61[0] = v23;
    v61[1] = self->_thermalSensorValues;
    [MEMORY[0x189603F68] dictionaryWithObjects:v61 forKeys:v60 count:2];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v25);
  }

  v26 = objc_alloc_init(&OBJC_CLASS___OSABinaryImageCatalog);
  if (*self->_exceptionCodes == 3131746989LL) {
    objc_super v27 = &unk_189E31868;
  }
  else {
    objc_super v27 = (void *)tasked_tuning;
  }
  id v28 = v27;
  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]( self,  "decodeKCDataWithBlock:withTuning:usingCatalog:",  v5,  v28,  v26);
  v58 = @"date";
  OSADateFormat(1u, self->super._capture_time);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v29;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v30);

  v56 = @"absoluteTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_capture_absoluteTime];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v31;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v32);

  v54 = @"binaryImages";
  -[OSABinaryImageCatalog reportUsedImages](v26, "reportUsedImages");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v33;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v34);

  -[OSABinaryImageCatalog appendNotesTo:](v26, "appendNotesTo:", self->super._notes);
  if (self->_includeSyslog && includeSection((void *)tasked_tuning, (uint64_t)@"syslog"))
  {
    v35 = -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:]( self,  "getSyslogForPids:andOptionalSenders:additionalPredicates:",  0LL,  0LL,  0LL);
    v36 = v35;
    if (v35)
    {
      v52[0] = @"syslog";
      [v35 reverseObjectEnumerator];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 allObjects];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = &unk_189E30770;
      v53[0] = v38;
      v53[1] = &unk_189E30758;
      [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v39);
    }

    else
    {
      -[NSMutableArray addObject:](self->super._notes, "addObject:", @"Syslog query timed out");
    }
  }

  if (-[NSMutableArray count](self->super._notes, "count"))
  {
    notes = self->super._notes;
    v50 = @"notes";
    v51 = notes;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v41);
  }

  if (-[NSMutableDictionary count](self->_extras, "count"))
  {
    extras = self->_extras;
    v48 = @"additionalDetails";
    v49 = extras;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v43);
  }
}

- (id)exceptionCodesDescription
{
  if (self->_exceptionCodeCount)
  {
    [MEMORY[0x189603FA8] array];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_exceptionCodeCount)
    {
      unint64_t v4 = 0LL;
      do
      {
        objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", self->_exceptionCodes[v4]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v5];

        ++v4;
      }

      while (v4 < self->_exceptionCodeCount);
    }

    objc_msgSend(v3, "componentsJoinedByString:", @", ");
    CFURLRef v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    CFURLRef v6 = &stru_189E21910;
  }

  return v6;
}

- (id)getVMStatistics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  mach_msg_type_number_t host_info64_outCnt = 38;
  host_t v3 = MEMORY[0x186E33F9C]();
  if (host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt))
  {
    [v2 setObject:@"host_statistics64 failed" forKeyedSubscript:@"error"];
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:host_info64_out[0]];
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:@"free_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:host_info64_out[1]];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v5 forKeyedSubscript:@"active_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:host_info64_out[2]];
    CFURLRef v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v6 forKeyedSubscript:@"inactive_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:host_info64_out[3]];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v7 forKeyedSubscript:@"wire_count"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v31];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v8 forKeyedSubscript:@"zero_fill_count"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v32];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v9 forKeyedSubscript:@"reactivations"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v33];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v10 forKeyedSubscript:@"pageins"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v34];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v11 forKeyedSubscript:@"pageouts"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v35];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v12 forKeyedSubscript:@"faults"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v36];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v13 forKeyedSubscript:@"cow_faults"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v37];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v14 forKeyedSubscript:@"lookups"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v38];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v15 forKeyedSubscript:@"hits"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v39];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v16 forKeyedSubscript:@"purges"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v40];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v17 forKeyedSubscript:@"purgeable_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v41];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v18 forKeyedSubscript:@"speculative_count"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v42];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v19 forKeyedSubscript:@"decompressions"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v43];
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v20 forKeyedSubscript:@"compressions"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v44];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v21 forKeyedSubscript:@"swapins"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v45];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v22 forKeyedSubscript:@"swapouts"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v46];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v23 forKeyedSubscript:@"compressor_page_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v47];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v24 forKeyedSubscript:@"throttled_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v48];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v25 forKeyedSubscript:@"external_page_count"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v49];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v26 forKeyedSubscript:@"internal_page_count"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v50];
    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v27 forKeyedSubscript:@"total_uncompressed_pages_in_compressor"];
  }

  mach_port_deallocate(*MEMORY[0x1895FBBE0], v3);
  return v2;
}

- (int)resampleTruncatedBacktracesForTask:(int)a3 forThreads:(id)a4 usingCatalog:(id)a5 in:(id)a6 usingSymbolicator:(_CSTypeRef)a7
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  uint64_t v11 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ((CSIsNull() & 1) == 0 && getpid() != (_DWORD)v11)
  {
    v17 = (void *)MEMORY[0x186E340A4]();
    mach_port_name_t v58 = 0;
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      objc_msgSend( NSString,  "stringWithFormat:",  @"task_read_for_pid(%d) for resampling backtraces failed",  v11);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v19);
      int v16 = 0;
LABEL_35:

      objc_autoreleasePoolPop(v17);
      goto LABEL_36;
    }

    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x189612A48]) initWithPID:v11 options:64];
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "setSymbolicator:", var0, var1);
      mach_msg_type_number_t act_listCnt = 0;
      if (!task_threads(v58, &act_list, &act_listCnt))
      {
        if (act_listCnt)
        {
          unsigned int v46 = v17;
          unsigned int v48 = v21;
          unint64_t v27 = 0LL;
          int v16 = 0;
          id v19 = 0LL;
          v26 = (ipc_space_t *)MEMORY[0x1895FBBE0];
          id v47 = v13;
          do
          {
            uint64_t v28 = act_list[v27];
            mach_msg_type_number_t thread_info_outCnt = 6;
            if (thread_info(v28, 4u, thread_info_out, &thread_info_outCnt)) {
              uint64_t v29 = -1LL;
            }
            else {
              uint64_t v29 = *(void *)thread_info_out;
            }
            [MEMORY[0x189607968] numberWithUnsignedLongLong:v29];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 objectForKeyedSubscript:v30];
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              unint64_t v51 = v27;
              int v50 = v28;
              [v48 sampleThread:v28];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v33 = (uint64_t *)[v32 backtrace];
              unsigned int v49 = v32;
              uint64_t v34 = [v32 backtraceLength];
              objc_msgSend( NSString,  "stringWithFormat:",  @"Unmapped pages caused truncated backtrace; re-sampled %d frames",
                v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v31;
              [v31 setObject:v35 forKeyedSubscript:@"notice"];

              if (v33) {
                BOOL v36 = (_DWORD)v34 == 0;
              }
              else {
                BOOL v36 = 1;
              }
              if (!v36)
              {
                [MEMORY[0x189603FA8] arrayWithCapacity:v34];
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
                do
                {
                  uint64_t v38 = v19;
                  uint64_t v39 = *v33++;
                  id v53 = v19;
                  [v14 searchFrame:v39 in:v15 result:&v53];
                  id v40 = v15;
                  id v41 = v14;
                  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                  id v19 = v53;

                  [v37 addObject:v42];
                  id v14 = v41;
                  id v15 = v40;
                  if (v39) {
                    BOOL v43 = v19 == 0LL;
                  }
                  else {
                    BOOL v43 = 0;
                  }
                  if (v43) {
                    ++v16;
                  }
                  LODWORD(v34) = v34 - 1;
                }

                while ((_DWORD)v34);
                [v52 setObject:v37 forKeyedSubscript:@"resampledUserFrames"];

                id v13 = v47;
                v26 = (ipc_space_t *)MEMORY[0x1895FBBE0];
              }

              unint64_t v27 = v51;
              uint64_t v31 = v52;
              LODWORD(v28) = v50;
            }

            mach_port_deallocate(*v26, v28);

            ++v27;
          }

          while (v27 < act_listCnt);
          mach_vm_size_t v44 = 4LL * act_listCnt;
          v21 = v48;
          v17 = v46;
        }

        else
        {
          id v19 = 0LL;
          int v16 = 0;
          mach_vm_size_t v44 = 0LL;
          v26 = (ipc_space_t *)MEMORY[0x1895FBBE0];
        }

        mach_vm_deallocate(*v26, (mach_vm_address_t)act_list, v44);
        goto LABEL_34;
      }

      uint64_t v22 = v21;
      uint64_t v23 = self->super._notes;
      objc_msgSend(NSString, "stringWithFormat:", @"task_threads() for %d failed", v11);
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = self->super._notes;
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to create VMUSampler for %d", v11);
    }

    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = v23;
    v21 = v22;
    -[NSMutableArray addObject:](v25, "addObject:", v24);

    id v19 = 0LL;
    int v16 = 0;
    v26 = (ipc_space_t *)MEMORY[0x1895FBBE0];
LABEL_34:
    mach_port_deallocate(*v26, v58);

    goto LABEL_35;
  }

  int v16 = 0;
LABEL_36:

  return v16;
}

- (id)resampleUUIDsForTask:(int)a3 usingCatalog:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [MEMORY[0x189603FA8] array];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (getpid() != (_DWORD)v4)
  {
    v8 = (void *)MEMORY[0x186E340A4]();
    uint64_t v9 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      objc_msgSend( NSString,  "stringWithFormat:",  @"task_read_for_pid(%d) for resampling UUIDs failed",  v4);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v11);
    }

    else
    {
      if (_dyld_process_info_create())
      {
        id v15 = v6;
        id v16 = v7;
        _dyld_process_info_for_each_image();
        _dyld_process_info_release();
        [v16 sortByAddressAndSetInferredSizes];

        uint64_t v12 = v15;
      }

      else
      {
        id v13 = self->super._notes;
        objc_msgSend( NSString,  "stringWithFormat:",  @"_dyld_process_info_create(%d) for resampling UUIDs failed with %d",  v4,  v17);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v13, "addObject:", v12);
      }

      mach_port_deallocate(*v9, 0);
    }

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

uint64_t __56__OSAStackShotReport_resampleUUIDsForTask_usingCatalog___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) isAddressInTargetedCache:a2];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 40) addImage:a3 address:a2 size:0];
  }
  return result;
}

- (void)addCustomField:(const char *)a3 value:(id)a4 into:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  if (a3 && v13)
  {
    [NSString stringWithUTF8String:a3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ([v8 count]
        && ([v8 top], (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v11 = v10;
        [v10 data];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 setObject:v13 forKeyedSubscript:v9];
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extras, "setObject:forKeyedSubscript:", v13, v9);
      }
    }
  }
}

- (void)decodeKCDataWithBlock:(id)a3 withTuning:(id)a4 usingCatalog:(id)a5
{
  v559[1] = *MEMORY[0x1895F89C0];
  id v8 = (void (**)(void, void *))a3;
  id v9 = a4;
  id v10 = a5;
  ss_trace_uint64_t buffer = (char *)self->_ss_trace_buffer;
  if (!ss_trace_buffer || (uint64_t ss_trace_length = self->_ss_trace_length, !(_DWORD)ss_trace_length))
  {
    notes = self->super._notes;
    id v16 = @"missing stackshot buffer or size";
    goto LABEL_7;
  }

  unint64_t v13 = (unint64_t)&ss_trace_buffer[ss_trace_length];
  id v14 = ss_trace_buffer + 16;
  if (ss_trace_buffer + 16 > &ss_trace_buffer[ss_trace_length]
    || (unint64_t)&v14[*((unsigned int *)ss_trace_buffer + 1)] > v13
    || *(_DWORD *)ss_trace_buffer != 1503811591)
  {
    notes = self->super._notes;
    id v16 = @"non-parseable kc snapshot buffer";
LABEL_7:
    -[NSMutableArray addObject:](notes, "addObject:", v16);
    goto LABEL_8;
  }

  [MEMORY[0x189603FA8] array];
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dead_snapshot) {
    int v471 = 0;
  }
  else {
    int v471 = excludeSection(v9, (uint64_t)@"sampleTruncatedStacks") ^ 1;
  }
  v495 = v9;
  v496 = v8;
  [MEMORY[0x189603FA8] array];
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v497 = (void *)objc_opt_new();
  [MEMORY[0x189603FA8] array];
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  int v491 = [v18 appleInternal];

  CSSymbolicatorGetFlagsForNListOnlyData();
  uint64_t v19 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  uint64_t v473 = v20;
  uint64_t v474 = v19;
  if (CSIsNull())
  {
    v21 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v22 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.27();
    }
  }

  v494 = objc_alloc_init(&OBJC_CLASS___OSAExclaveContainer);
  -[OSAExclaveContainer parseKCdata:](v494, "parseKCdata:", ss_trace_buffer, v13);
  v501 = 0LL;
  v502 = 0LL;
  unint64_t v492 = 0LL;
  unint64_t v493 = 0LL;
  uint64_t v476 = 0LL;
  uint64_t v477 = 0LL;
  uint64_t v487 = 0LL;
  uint64_t v490 = 0LL;
  uint64_t v469 = 0LL;
  uint64_t v470 = 0LL;
  uint64_t v475 = 0LL;
  v499 = 0LL;
  char v445 = 0;
  uint64_t v472 = 0LL;
  double v23 = *MEMORY[0x189604DA8];
  char v468 = 1;
  unint64_t v24 = 0x189607000uLL;
  v505 = v10;
  v506 = v17;
  v517 = self;
  while (1)
  {
    uint64_t v25 = *((unsigned int *)ss_trace_buffer + 1);
    if ((unint64_t)&v14[v25] > v13) {
LABEL_632:
    }
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.1();
    unsigned int v26 = *(_DWORD *)ss_trace_buffer;
    if (*(_DWORD *)ss_trace_buffer == -242132755) {
      break;
    }
    if ((v26 & 0xFFFFFFF0) == 0x20) {
      uint64_t v27 = 17LL;
    }
    else {
      uint64_t v27 = v26;
    }
    if ((int)v27 > 2111)
    {
      switch((int)v27)
      {
        case 2305:
          if (includeSection(v495, (uint64_t)@"ioStats"))
          {
            [v17 top];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28) {
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.21();
            }
            uint64_t v29 = v28;
            [v28 data];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              uint64_t v31 = v29;
              unint64_t v507 = v13;
              [MEMORY[0x189603FA8] array];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              for (uint64_t i = 0LL; i != 32; i += 8LL)
              {
                [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*(void *)&ss_trace_buffer[i + 48]];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                v536[0] = v34;
                [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*(void *)&ss_trace_buffer[i + 80]];
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
                v536[1] = v35;
                [MEMORY[0x189603F18] arrayWithObjects:v536 count:2];
                BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
                [v32 addObject:v36];
              }

              v534[0] = @"reads";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
              id v479 = (id)objc_claimAutoreleasedReturnValue();
              v533[0] = v479;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
              v464 = (void *)objc_claimAutoreleasedReturnValue();
              v533[1] = v464;
              [MEMORY[0x189603F18] arrayWithObjects:v533 count:2];
              v461 = (void *)objc_claimAutoreleasedReturnValue();
              v535[0] = v461;
              v534[1] = @"writes";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
              v458 = (void *)objc_claimAutoreleasedReturnValue();
              v532[0] = v458;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 5)];
              v456 = (void *)objc_claimAutoreleasedReturnValue();
              v532[1] = v456;
              [MEMORY[0x189603F18] arrayWithObjects:v532 count:2];
              v454 = (void *)objc_claimAutoreleasedReturnValue();
              v535[1] = v454;
              v534[2] = @"paging";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 14)];
              v452 = (void *)objc_claimAutoreleasedReturnValue();
              v531[0] = v452;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 15)];
              v450 = (void *)objc_claimAutoreleasedReturnValue();
              v531[1] = v450;
              [MEMORY[0x189603F18] arrayWithObjects:v531 count:2];
              v448 = (void *)objc_claimAutoreleasedReturnValue();
              v535[2] = v448;
              v534[3] = @"nonpaging";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 16)];
              v446 = (void *)objc_claimAutoreleasedReturnValue();
              v530[0] = v446;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 17)];
              v441 = (void *)objc_claimAutoreleasedReturnValue();
              v530[1] = v441;
              [MEMORY[0x189603F18] arrayWithObjects:v530 count:2];
              v440 = (void *)objc_claimAutoreleasedReturnValue();
              v535[3] = v440;
              v534[4] = @"data";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 18)];
              v439 = (void *)objc_claimAutoreleasedReturnValue();
              v529[0] = v439;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 19)];
              v438 = (void *)objc_claimAutoreleasedReturnValue();
              v529[1] = v438;
              [MEMORY[0x189603F18] arrayWithObjects:v529 count:2];
              v437 = (void *)objc_claimAutoreleasedReturnValue();
              v535[4] = v437;
              v534[5] = @"metadata";
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 20)];
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
              v528[0] = v37;
              [*(id *)(v24 + 2408) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 21)];
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
              v528[1] = v38;
              [MEMORY[0x189603F18] arrayWithObjects:v528 count:2];
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
              v534[6] = @"priorities";
              v535[5] = v39;
              v535[6] = v32;
              [MEMORY[0x189603F68] dictionaryWithObjects:v535 forKeys:v534 count:7];
              id v40 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 data];
              id v41 = (void *)objc_claimAutoreleasedReturnValue();
              [v41 setObject:v40 forKeyedSubscript:@"ioStats"];

              uint64_t v29 = v31;
              id v10 = v505;
              unsigned int v17 = v506;
              unint64_t v13 = v507;
            }

            self = v517;
          }

          goto LABEL_587;
        case 2306:
          unint64_t v510 = v13;
          v558 = @"memoryStatus";
          v556[0] = @"memoryPressure";
          [*(id *)(v24 + 2408) numberWithBool:self->_jetsamLevel > 0];
          id v482 = (id)objc_claimAutoreleasedReturnValue();
          v557[0] = v482;
          v556[1] = @"memoryPages";
          v554[0] = @"free";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 5)];
          v466 = (void *)objc_claimAutoreleasedReturnValue();
          v555[0] = v466;
          v554[1] = @"active";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 6)];
          v462 = (void *)objc_claimAutoreleasedReturnValue();
          v555[1] = v462;
          v554[2] = @"inactive";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 7)];
          v459 = (void *)objc_claimAutoreleasedReturnValue();
          v555[2] = v459;
          v554[3] = @"purgeable";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 8)];
          v457 = (void *)objc_claimAutoreleasedReturnValue();
          v555[3] = v457;
          v554[4] = @"wired";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 9)];
          v455 = (void *)objc_claimAutoreleasedReturnValue();
          v555[4] = v455;
          v554[5] = @"speculative";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 10)];
          v453 = (void *)objc_claimAutoreleasedReturnValue();
          v555[5] = v453;
          v554[6] = @"throttled";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 11)];
          v451 = (void *)objc_claimAutoreleasedReturnValue();
          v555[6] = v451;
          v554[7] = @"fileBacked";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 12)];
          v449 = (void *)objc_claimAutoreleasedReturnValue();
          v555[7] = v449;
          [MEMORY[0x189603F68] dictionaryWithObjects:v555 forKeys:v554 count:8];
          v447 = (void *)objc_claimAutoreleasedReturnValue();
          v557[1] = v447;
          v556[2] = @"compressions";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 13)];
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v557[2] = v65;
          v556[3] = @"decompressions";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 14)];
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v557[3] = v66;
          v556[4] = @"compressorSize";
          [*(id *)(v24 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 15)];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v557[4] = v67;
          v556[5] = @"busyBufferCount";
          [*(id *)(v24 + 2408) numberWithInt:*((unsigned int *)ss_trace_buffer + 16)];
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v557[5] = v68;
          v556[6] = @"memoryPressureDetails";
          unint64_t v69 = v24;
          int v70 = ss_trace_buffer[76];
          if (ss_trace_buffer[76])
          {
            v552[0] = @"pagesWanted";
            [*(id *)(v69 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 17)];
            v444 = (void *)objc_claimAutoreleasedReturnValue();
            v553[0] = v444;
            v552[1] = @"pagesReclaimed";
            [*(id *)(v69 + 2408) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 18)];
            v443 = (void *)objc_claimAutoreleasedReturnValue();
            v553[1] = v443;
            [MEMORY[0x189603F68] dictionaryWithObjects:v553 forKeys:v552 count:2];
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v442;
          }

          else
          {
            v71 = (void *)MEMORY[0x189604A60];
          }

          v557[6] = v71;
          v556[7] = @"pageSize";
          [*(id *)(v69 + 2408) numberWithUnsignedInt:HIDWORD(v477)];
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          v557[7] = v206;
          [MEMORY[0x189603F68] dictionaryWithObjects:v557 forKeys:v556 count:8];
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          v559[0] = v207;
          [MEMORY[0x189603F68] dictionaryWithObjects:v559 forKeys:&v558 count:1];
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          v496[2](v496, v208);

          if (v70)
          {
          }

          id v10 = v505;
          unsigned int v17 = v506;
          self = v517;
          unint64_t v13 = v510;
          unint64_t v24 = 0x189607000LL;
          goto LABEL_587;
        case 2307:
        case 2308:
        case 2311:
        case 2314:
        case 2315:
        case 2316:
        case 2317:
        case 2322:
        case 2323:
        case 2324:
        case 2325:
        case 2326:
        case 2327:
        case 2328:
        case 2334:
        case 2335:
        case 2336:
        case 2339:
        case 2340:
        case 2341:
        case 2342:
        case 2343:
        case 2350:
        case 2351:
        case 2353:
        case 2354:
        case 2355:
        case 2356:
        case 2357:
        case 2358:
        case 2359:
        case 2361:
        case 2362:
        case 2363:
        case 2364:
        case 2365:
        case 2366:
        case 2367:
        case 2368:
        case 2369:
        case 2370:
        case 2375:
          goto LABEL_62;
        case 2309:
          unint64_t v511 = v13;
          [v17 top];
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v74 = *((unsigned int *)ss_trace_buffer + 25);
          if ((_DWORD)v74 == self->_pid) {
            goto LABEL_314;
          }
          if ((_DWORD)v74) {
            goto LABEL_84;
          }
          uint64_t v74 = *((unsigned int *)ss_trace_buffer + 25);
LABEL_84:
          frontmostPids = self->_frontmostPids;
          [*(id *)(v24 + 2408) numberWithInt:v74];
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableArray containsObject:](frontmostPids, "containsObject:", v76))
          {
          }

          else
          {
            if (!*((_DWORD *)ss_trace_buffer + 25))
            {

LABEL_481:
              [v506 top];
              v275 = (void *)objc_claimAutoreleasedReturnValue();
              [v275 omit];
              unint64_t v13 = v511;
              goto LABEL_451;
            }

            char v253 = excludeSection(v495, (uint64_t)@"allPids");

            if ((v253 & 1) != 0) {
              goto LABEL_481;
            }
          }

- (BOOL)includeSyslog
{
  return self->_includeSyslog;
}

- (void)setIncludeSyslog:(BOOL)a3
{
  self->_includeSyslog = a3;
}

- (NSArray)frontmostPids
{
  return &self->_frontmostPids->super;
}

- (unint64_t)capture_absoluteTime
{
  return self->_capture_absoluteTime;
}

- (const)ss_trace_buffer
{
  return self->_ss_trace_buffer;
}

- (unsigned)ss_trace_length
{
  return self->_ss_trace_length;
}

- (int)jetsamLevel
{
  return self->_jetsamLevel;
}

- (void)setJetsamLevel:(int)a3
{
  self->_jetsamLevel = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (BOOL)dead_snapshot
{
  return self->_dead_snapshot;
}

- (void)setDead_snapshot:(BOOL)a3
{
  self->_dead_snapshot = a3;
}

- (unsigned)ss_sequence
{
  return self->_ss_sequence;
}

- (void)setSs_sequence:(unsigned int)a3
{
  self->_ss_sequence = a3;
}

- (void).cxx_destruct
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.1()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.2()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  2018,  "[kc_stack count] == 0");
}

- (void)decodeKCDataWithBlock:(uint8_t *)a1 withTuning:(uint64_t)a2 usingCatalog:(void *)a3 .cold.3( uint8_t *a1,  uint64_t a2,  void *a3)
{
  *(_DWORD *)a1 = 138543362;
  *a3 = a2;
  OUTLINED_FUNCTION_0( &dword_1861AC000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "Expected a task specific shared cache with ID %{public}@ but none was found",  a1);
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.5()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1270,  "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.6()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1275,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.7()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1285,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.8()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1297,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.9()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1315,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.10()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1330,  "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.11()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1342,  "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.12()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1349,  "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.13()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1357,  "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.14()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.15()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1523,  "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.16()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1633,  "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.17()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1835,  "container && (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.18()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1846,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.19()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1902,  "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.20()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1912,  "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.21()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.22()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1944,  "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.23()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1954,  "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.24()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1963,  "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.25()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1972,  "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.26()
{
  __assert_rtn( "-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]",  "OSAStackShotReport.m",  1983,  "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.27()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Failed to create symbolicator", v0, 2u);
}

@end