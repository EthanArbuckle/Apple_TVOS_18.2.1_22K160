@interface PTTraceConfig
+ (BOOL)resetConfig;
+ (BOOL)supportsSecureCoding;
+ (PTTraceConfig)configWithDictionary:(id)a3;
+ (PTTraceConfig)configWithTemplate:(unint64_t)a3;
+ (PTTraceConfig)configWithTracePlanName:(id)a3;
+ (PTTraceConfig)configWithTracePlanURL:(id)a3;
+ (id)_defaultTraceRecordConfig;
+ (id)getCurrentConfig;
- (BOOL)compressWhenFinished;
- (BOOL)enableSwiftUITracing;
- (BOOL)includeKernelStacks;
- (BOOL)includeOSLogs;
- (BOOL)includeOSSignposts;
- (BOOL)overrideIncludeOSLogs;
- (BOOL)overrideIncludeOSSignposts;
- (BOOL)overrideSymbolicate;
- (BOOL)skipNotification;
- (BOOL)storeConfig;
- (BOOL)symbolicate;
- (BOOL)useTraceRecord;
- (BOOL)validateConfig;
- (NSMutableArray)traceGroups;
- (NSString)ownerName;
- (NSString)planNameOrPath;
- (NSString)traceName;
- (NSURL)traceDirectoryURL;
- (NSXPCConnection)connection;
- (OS_os_transaction)tracingActiveTransaction;
- (PTTraceConfig)initWithCoder:(id)a3;
- (id)_getRemoteObjectProxy;
- (id)copyWithZone:(_NSZone *)a3;
- (int)ownerPID;
- (unint64_t)callstackSamplingRateMS;
- (unint64_t)kernelBufferDrainRateMS;
- (unint64_t)kernelBufferSizeMB;
- (unint64_t)source;
- (unint64_t)traceDurationSecs;
- (unint64_t)traceTimeoutS;
- (unint64_t)traceType;
- (unsigned)kernelBufferDrainQoS;
- (void)_initConnection;
- (void)_invalidateSession;
- (void)encodeWithCoder:(id)a3;
- (void)setCallstackSamplingRateMS:(unint64_t)a3;
- (void)setCompressWhenFinished:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setEnableSwiftUITracing:(BOOL)a3;
- (void)setIncludeKernelStacks:(BOOL)a3;
- (void)setIncludeOSLogs:(BOOL)a3;
- (void)setIncludeOSSignposts:(BOOL)a3;
- (void)setKernelBufferDrainQoS:(unsigned int)a3;
- (void)setKernelBufferDrainRateMS:(unint64_t)a3;
- (void)setKernelBufferSizeMB:(unint64_t)a3;
- (void)setOverrideIncludeOSLogs:(BOOL)a3;
- (void)setOverrideIncludeOSSignposts:(BOOL)a3;
- (void)setOverrideSymbolicate:(BOOL)a3;
- (void)setOwnerName:(id)a3;
- (void)setOwnerPID:(int)a3;
- (void)setPlanNameOrPath:(id)a3;
- (void)setSkipNotification:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
- (void)setSymbolicate:(BOOL)a3;
- (void)setTraceDirectoryURL:(id)a3;
- (void)setTraceDurationSecs:(unint64_t)a3;
- (void)setTraceGroups:(id)a3;
- (void)setTraceName:(id)a3;
- (void)setTraceTimeoutS:(unint64_t)a3;
- (void)setTraceType:(unint64_t)a3;
- (void)setTracingActiveTransaction:(id)a3;
- (void)setUseTraceRecord:(BOOL)a3;
@end

@implementation PTTraceConfig

+ (PTTraceConfig)configWithTemplate:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___PTTraceConfig);
  -[PTTraceConfig setSymbolicate:](v4, "setSymbolicate:", 1LL);
  -[PTTraceConfig setCallstackSamplingRateMS:](v4, "setCallstackSamplingRateMS:", 1LL);
  -[PTTraceConfig setTraceType:](v4, "setTraceType:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"));
  -[PTTraceConfig setTraceDirectoryURL:](v4, "setTraceDirectoryURL:", v5);

  -[PTTraceConfig setTraceName:](v4, "setTraceName:", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_100016128,  &off_100016140,  &off_100016158,  &off_100016170,  &off_100016188,  0LL));
  -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v6);

  -[PTTraceConfig setCompressWhenFinished:](v4, "setCompressWhenFinished:", 1LL);
  -[PTTraceConfig setIncludeOSLogs:](v4, "setIncludeOSLogs:", 1LL);
  -[PTTraceConfig setIncludeOSSignposts:](v4, "setIncludeOSSignposts:", 1LL);
  -[PTTraceConfig setTraceTimeoutS:](v4, "setTraceTimeoutS:", 0LL);
  -[PTTraceConfig setUseTraceRecord:](v4, "setUseTraceRecord:", 0LL);
  -[PTTraceConfig setTraceDurationSecs:](v4, "setTraceDurationSecs:", 0LL);
  -[PTTraceConfig setSkipNotification:](v4, "setSkipNotification:", 0LL);
  -[PTTraceConfig setIncludeKernelStacks:](v4, "setIncludeKernelStacks:", 1LL);
  -[PTTraceConfig setEnableSwiftUITracing:](v4, "setEnableSwiftUITracing:", 0LL);
  -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", sysconf(57) << 6);
  if (-[PTTraceConfig kernelBufferSizeMB](v4, "kernelBufferSizeMB") <= 0x7F) {
    -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", 128LL);
  }
  if (-[PTTraceConfig kernelBufferSizeMB](v4, "kernelBufferSizeMB") >= 0x401) {
    -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", 1024LL);
  }
  -[PTTraceConfig setKernelBufferDrainQoS:](v4, "setKernelBufferDrainQoS:", 25LL);
  -[PTTraceConfig setKernelBufferDrainRateMS:](v4, "setKernelBufferDrainRateMS:", 500LL);
  if (a3 - 1 < 2)
  {
    v7 = +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_100016128,  &off_100016140,  &off_100016158,  &off_100016170,  &off_100016188,  0LL);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v8);

    goto LABEL_12;
  }

  if (a3 == 3)
  {
    v7 = +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &off_1000161A0,  &off_100016140,  &off_100016188,  0LL,  v21,  v22);
    goto LABEL_9;
  }

  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v9) {
    sub_10000D50C(v9, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_12:
  -[PTTraceConfig setOwnerPID:](v4, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v4, "ownerPID"), buffer, 0x21u);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  4LL));
  -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig ownerName](v4, "ownerName"));
  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
    -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v19);
  }

  -[PTTraceConfig setSource:](v4, "setSource:", 4LL);
  return v4;
}

+ (PTTraceConfig)configWithDictionary:(id)a3
{
  id v3 = a3;
  if (!v3 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v3, v4) & 1) == 0)) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"traceConfigurationDictionary is not a valid dictionary.");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTemplate"]);

  if (!v5)
  {
    uint64_t v11 = 1LL;
    goto LABEL_10;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTemplate"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"traceTemplate is not a string.");
  }
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTemplate"]);
  uint64_t v10 = traceConfigTemplateForString(v9);

  if (v10)
  {
    uint64_t v11 = v10;
LABEL_10:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[PTTraceConfig configWithTemplate:](&OBJC_CLASS___PTTraceConfig, "configWithTemplate:", v11));
    goto LABEL_12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTemplate"]);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a valid trace template.",  v13);

  uint64_t v12 = 0LL;
LABEL_12:
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"symbolicate"]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"symbolicate"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v17 = objc_opt_isKindOfClass(v15, v16);

    if ((v17 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"symbolicate");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"symbolicate"]);
    if ([v18 unsignedLongValue])
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"symbolicate"]);
      id v20 = [v19 unsignedLongValue];

      if (v20 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"symbolicate");
      }
    }

    else
    {
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"symbolicate"]);
    objc_msgSend(v12, "setSymbolicate:", objc_msgSend(v21, "BOOLValue"));
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"callstackSamplingRateMS"]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"callstackSamplingRateMS"]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v25 = objc_opt_isKindOfClass(v23, v24);

    if ((v25 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned long type.",  @"callstackSamplingRateMS");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"callstackSamplingRateMS"]);
    objc_msgSend(v12, "setCallstackSamplingRateMS:", objc_msgSend(v26, "unsignedLongValue"));
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceName"]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceName"]);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
    char v30 = objc_opt_isKindOfClass(v28, v29);

    if ((v30 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a string type.",  @"traceName");
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceName"]);
    id v32 = [v31 copy];
    [v12 setTraceName:v32];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"compressWhenFinished"]);

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"compressWhenFinished"]);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v36 = objc_opt_isKindOfClass(v34, v35);

    if ((v36 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"compressWhenFinished");
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"compressWhenFinished"]);
    if ([v37 unsignedLongValue])
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"compressWhenFinished"]);
      id v39 = [v38 unsignedLongValue];

      if (v39 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"compressWhenFinished");
      }
    }

    else
    {
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"compressWhenFinished"]);
    objc_msgSend(v12, "setCompressWhenFinished:", objc_msgSend(v40, "BOOLValue"));
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSLogs"]);

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSLogs"]);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v44 = objc_opt_isKindOfClass(v42, v43);

    if ((v44 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeOSLogs");
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSLogs"]);
    if ([v45 unsignedLongValue])
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSLogs"]);
      id v47 = [v46 unsignedLongValue];

      if (v47 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeOSLogs");
      }
    }

    else
    {
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSLogs"]);
    objc_msgSend(v12, "setIncludeOSLogs:", objc_msgSend(v48, "BOOLValue"));
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSSignposts"]);

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSSignposts"]);
    uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v52 = objc_opt_isKindOfClass(v50, v51);

    if ((v52 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeOSSignposts");
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSSignposts"]);
    if ([v53 unsignedLongValue])
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSSignposts"]);
      id v55 = [v54 unsignedLongValue];

      if (v55 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeOSSignposts");
      }
    }

    else
    {
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeOSSignposts"]);
    objc_msgSend(v12, "setIncludeOSSignposts:", objc_msgSend(v56, "BOOLValue"));
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTimeoutS"]);

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTimeoutS"]);
    uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v60 = objc_opt_isKindOfClass(v58, v59);

    if ((v60 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned long type.",  @"traceTimeoutS");
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceTimeoutS"]);
    objc_msgSend(v12, "setTraceTimeoutS:", objc_msgSend(v61, "unsignedLongValue"));
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"useTraceRecord"]);

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"useTraceRecord"]);
    uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v65 = objc_opt_isKindOfClass(v63, v64);

    if ((v65 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"useTraceRecord");
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"useTraceRecord"]);
    if ([v66 unsignedLongValue])
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"useTraceRecord"]);
      id v68 = [v67 unsignedLongValue];

      if (v68 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"useTraceRecord");
      }
    }

    else
    {
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"useTraceRecord"]);
    objc_msgSend(v12, "setUseTraceRecord:", objc_msgSend(v69, "BOOLValue"));
  }

  v70 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDurationSecs"]);

  if (v70)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDurationSecs"]);
    uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v73 = objc_opt_isKindOfClass(v71, v72);

    if ((v73 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned long type.",  @"traceDurationSecs");
    }
    v74 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDurationSecs"]);
    objc_msgSend(v12, "setTraceDurationSecs:", objc_msgSend(v74, "unsignedLongValue"));
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"skipNotification"]);

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"skipNotification"]);
    uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v78 = objc_opt_isKindOfClass(v76, v77);

    if ((v78 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"skipNotification");
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"skipNotification"]);
    if ([v79 unsignedLongValue])
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"skipNotification"]);
      id v81 = [v80 unsignedLongValue];

      if (v81 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"skipNotification");
      }
    }

    else
    {
    }

    v82 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"skipNotification"]);
    objc_msgSend(v12, "setSkipNotification:", objc_msgSend(v82, "BOOLValue"));
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeKernelStacks"]);

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeKernelStacks"]);
    uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v86 = objc_opt_isKindOfClass(v84, v85);

    if ((v86 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeKernelStacks");
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeKernelStacks"]);
    if ([v87 unsignedLongValue])
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeKernelStacks"]);
      id v89 = [v88 unsignedLongValue];

      if (v89 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"includeKernelStacks");
      }
    }

    else
    {
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"includeKernelStacks"]);
    objc_msgSend(v12, "setIncludeKernelStacks:", objc_msgSend(v90, "BOOLValue"));
  }

  v91 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferSizeMB"]);

  if (v91)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferSizeMB"]);
    uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v94 = objc_opt_isKindOfClass(v92, v93);

    if ((v94 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned long type.",  @"kernelBufferSizeMB");
    }
    v95 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferSizeMB"]);
    objc_msgSend(v12, "setKernelBufferSizeMB:", objc_msgSend(v95, "unsignedLongValue"));
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainRateMS"]);

  if (v96)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainRateMS"]);
    uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v99 = objc_opt_isKindOfClass(v97, v98);

    if ((v99 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned long type.",  @"kernelBufferDrainRateMS");
    }
    v100 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainRateMS"]);
    objc_msgSend(v12, "setKernelBufferDrainRateMS:", objc_msgSend(v100, "unsignedLongValue"));
  }

  v101 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainQoS"]);

  if (v101)
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainQoS"]);
    uint64_t v103 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v104 = objc_opt_isKindOfClass(v102, v103);

    if ((v104 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not an unsigned integer type.",  @"kernelBufferDrainQoS");
    }
    v105 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"kernelBufferDrainQoS"]);
    objc_msgSend(v12, "setKernelBufferDrainQoS:", objc_msgSend(v105, "unsignedIntValue"));
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"enableSwiftUITracing"]);

  if (v106)
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"enableSwiftUITracing"]);
    uint64_t v108 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v109 = objc_opt_isKindOfClass(v107, v108);

    if ((v109 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"enableSwiftUITracing");
    }
    v110 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"enableSwiftUITracing"]);
    if ([v110 unsignedLongValue])
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"enableSwiftUITracing"]);
      id v112 = [v111 unsignedLongValue];

      if (v112 != (id)1) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"%@ is not a BOOLean type.",  @"enableSwiftUITracing");
      }
    }

    else
    {
    }

    v113 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"enableSwiftUITracing"]);
    objc_msgSend(v12, "setEnableSwiftUITracing:", objc_msgSend(v113, "BOOLValue"));
  }

  v114 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDirectoryURL"]);

  if (v114)
  {
    v115 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDirectoryURL"]);
    uint64_t v116 = objc_opt_class(&OBJC_CLASS___NSString);
    char v117 = objc_opt_isKindOfClass(v115, v116);

    if ((v117 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"traceDirectoryURL is not a string type.");
    }
    v118 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceDirectoryURL"]);
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v118));
    [v12 setTraceDirectoryURL:v119];
  }

  v120 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceType"]);

  if (v120)
  {
    v121 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceType"]);
    uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSString);
    char v123 = objc_opt_isKindOfClass(v121, v122);

    if ((v123 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"traceType is not a string type.");
    }
    v124 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceType"]);
    [v12 setTraceType:traceTypeForString(v124)];
  }

  v125 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceGroups"]);

  if (v125)
  {
    v126 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceGroups"]);
    uint64_t v127 = objc_opt_class(&OBJC_CLASS___NSArray);
    char v128 = objc_opt_isKindOfClass(v126, v127);

    if ((v128 & 1) == 0) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"traceGroups is not an NSArray type.");
    }
    v129 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"traceGroups"]);
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v141 = 0u;
    __int128 v142 = 0u;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    id v131 = v129;
    id v132 = [v131 countByEnumeratingWithState:&v141 objects:v145 count:16];
    if (v132)
    {
      id v133 = v132;
      uint64_t v134 = *(void *)v142;
      do
      {
        for (i = 0LL; i != v133; i = (char *)i + 1)
        {
          if (*(void *)v142 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = *(void **)(*((void *)&v141 + 1) + 8LL * (void)i);
          if (v136 && traceGroupForString(*(void **)(*((void *)&v141 + 1) + 8LL * (void)i)))
          {
            v137 = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  traceGroupForString(v136));
            v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
            [v130 addObject:v138];
          }
        }

        id v133 = [v131 countByEnumeratingWithState:&v141 objects:v145 count:16];
      }

      while (v133);
    }

    if ([v130 count]) {
      [v12 setTraceGroups:v130];
    }
  }

  [v12 setSource:4];
  v139 = v12;

  return v139;
}

+ (id)_defaultTraceRecordConfig
{
  v2 = objc_alloc_init(&OBJC_CLASS___PTTraceConfig);
  -[PTTraceConfig setUseTraceRecord:](v2, "setUseTraceRecord:", 1LL);
  -[PTTraceConfig setTraceType:](v2, "setTraceType:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"));
  -[PTTraceConfig setTraceDirectoryURL:](v2, "setTraceDirectoryURL:", v3);

  -[PTTraceConfig setTraceName:](v2, "setTraceName:", 0LL);
  -[PTTraceConfig setSkipNotification:](v2, "setSkipNotification:", 0LL);
  -[PTTraceConfig setCompressWhenFinished:](v2, "setCompressWhenFinished:", 1LL);
  -[PTTraceConfig setKernelBufferSizeMB:](v2, "setKernelBufferSizeMB:", 0LL);
  -[PTTraceConfig setOverrideIncludeOSSignposts:](v2, "setOverrideIncludeOSSignposts:", 0LL);
  -[PTTraceConfig setOverrideIncludeOSLogs:](v2, "setOverrideIncludeOSLogs:", 0LL);
  -[PTTraceConfig setOverrideSymbolicate:](v2, "setOverrideSymbolicate:", 0LL);
  -[PTTraceConfig setOwnerPID:](v2, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v2, "ownerPID"), buffer, 0x21u);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  4LL));
  -[PTTraceConfig setOwnerName:](v2, "setOwnerName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig ownerName](v2, "ownerName"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
    -[PTTraceConfig setOwnerName:](v2, "setOwnerName:", v6);
  }

  return v2;
}

+ (PTTraceConfig)configWithTracePlanName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTTraceConfig _defaultTraceRecordConfig](&OBJC_CLASS___PTTraceConfig, "_defaultTraceRecordConfig"));
  [v4 setPlanNameOrPath:v3];

  return (PTTraceConfig *)v4;
}

+ (PTTraceConfig)configWithTracePlanURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTTraceConfig _defaultTraceRecordConfig](&OBJC_CLASS___PTTraceConfig, "_defaultTraceRecordConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  [v4 setPlanNameOrPath:v5];
  return (PTTraceConfig *)v4;
}

+ (id)getCurrentConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Getting Current Config",  buf,  2u);
  }

  *(void *)buf = 0LL;
  BOOL v9 = buf;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_10000B3C0;
  uint64_t v12 = sub_10000B3D0;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___PTTraceConfig);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 5) connection]);

  if (!v3) {
    [*((id *)v9 + 5) _initConnection];
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 5) _getRemoteObjectProxy]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B3D8;
  v7[3] = &unk_100014C10;
  v7[4] = buf;
  v7[5] = a1;
  [v4 getCurrentStoredConfig:v7];

  [*((id *)v9 + 5) _invalidateSession];
  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

+ (BOOL)resetConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resetting config", buf, 2u);
  }

  v2 = objc_alloc_init(&OBJC_CLASS___PTTraceConfig);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](v2, "connection"));

  if (!v3) {
    -[PTTraceConfig _initConnection](v2, "_initConnection");
  }
  *(void *)buf = 0LL;
  v8 = buf;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig _getRemoteObjectProxy](v2, "_getRemoteObjectProxy"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000B5D0;
  v6[3] = &unk_1000145E8;
  v6[4] = buf;
  [v4 resetConfig:v6];

  -[PTTraceConfig _invalidateSession](v2, "_invalidateSession");
  LOBYTE(v4) = v8[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

- (BOOL)storeConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Storing config", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](self, "connection"));

  if (!v3) {
    -[PTTraceConfig _initConnection](self, "_initConnection");
  }
  *(void *)buf = 0LL;
  uint64_t v9 = buf;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig _getRemoteObjectProxy](self, "_getRemoteObjectProxy"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B7A4;
  v7[3] = &unk_1000145E8;
  v7[4] = buf;
  [v4 applyConfig:self withError:v7];

  -[PTTraceConfig _invalidateSession](self, "_invalidateSession");
  uint8_t v5 = v9[24];
  _Block_object_dispose(buf, 8);
  return v5;
}

- (BOOL)validateConfig
{
  return 1;
}

- (void)_initConnection
{
  uint8_t v5 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.PerformanceTrace.PerformanceTraceService");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PTServiceInterface));
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v3);
  -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_100014C50);
  -[NSXPCConnection setInterruptionHandler:](v5, "setInterruptionHandler:", &stru_100014C70);
  -[PTTraceConfig setConnection:](self, "setConnection:", v5);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](self, "connection"));
  [v4 resume];
}

- (id)_getRemoteObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](self, "connection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014C90]);

  return v3;
}

- (void)_invalidateSession
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](self, "connection"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[PTTraceConfig connection](self, "connection"));
    [v4 invalidate];
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PTTraceConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint8_t v5 = -[PTTraceConfig init](self, "init");
  if (v5)
  {
    -[PTTraceConfig setSymbolicate:](v5, "setSymbolicate:", [v4 decodeBoolForKey:@"symbolicate"]);
    -[PTTraceConfig setCallstackSamplingRateMS:]( v5,  "setCallstackSamplingRateMS:",  (int)[v4 decodeIntForKey:@"callstackSamplingRateMS"]);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"traceGroups"]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v9));
    -[PTTraceConfig setTraceGroups:](v5, "setTraceGroups:", v10);

    -[PTTraceConfig setTraceType:](v5, "setTraceType:", (int)[v4 decodeIntForKey:@"traceType"]);
    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"traceDirectoryURL"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[PTTraceConfig setTraceDirectoryURL:](v5, "setTraceDirectoryURL:", v12);

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"traceName"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[PTTraceConfig setTraceName:](v5, "setTraceName:", v14);

    -[PTTraceConfig setCompressWhenFinished:]( v5,  "setCompressWhenFinished:",  [v4 decodeBoolForKey:@"compressWhenFinished"]);
    -[PTTraceConfig setIncludeOSLogs:]( v5,  "setIncludeOSLogs:",  [v4 decodeBoolForKey:@"includeOSLogs"]);
    -[PTTraceConfig setIncludeOSSignposts:]( v5,  "setIncludeOSSignposts:",  [v4 decodeBoolForKey:@"includeOSSignposts"]);
    -[PTTraceConfig setTraceTimeoutS:]( v5,  "setTraceTimeoutS:",  (int)[v4 decodeIntForKey:@"traceTimeoutS"]);
    -[PTTraceConfig setSkipNotification:]( v5,  "setSkipNotification:",  [v4 decodeBoolForKey:@"skipNotification"]);
    -[PTTraceConfig setIncludeKernelStacks:]( v5,  "setIncludeKernelStacks:",  [v4 decodeBoolForKey:@"includeKernelStacks"]);
    -[PTTraceConfig setKernelBufferSizeMB:]( v5,  "setKernelBufferSizeMB:",  (int)[v4 decodeIntForKey:@"kernelBufferSizeMB"]);
    -[PTTraceConfig setKernelBufferDrainQoS:]( v5,  "setKernelBufferDrainQoS:",  [v4 decodeIntForKey:@"kernelBufferDrainQoS"]);
    -[PTTraceConfig setKernelBufferDrainRateMS:]( v5,  "setKernelBufferDrainRateMS:",  (int)[v4 decodeIntForKey:@"kernelBufferDrainRateMS"]);
    -[PTTraceConfig setOwnerPID:](v5, "setOwnerPID:", [v4 decodeIntForKey:@"ownerPID"]);
    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ownerName"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[PTTraceConfig setOwnerName:](v5, "setOwnerName:", v16);

    -[PTTraceConfig setSource:](v5, "setSource:", (int)[v4 decodeIntForKey:@"source"]);
    -[PTTraceConfig setTraceDurationSecs:]( v5,  "setTraceDurationSecs:",  (int)[v4 decodeIntForKey:@"traceDurationSecs"]);
    -[PTTraceConfig setUseTraceRecord:]( v5,  "setUseTraceRecord:",  [v4 decodeBoolForKey:@"useTraceRecord"]);
    -[PTTraceConfig setEnableSwiftUITracing:]( v5,  "setEnableSwiftUITracing:",  [v4 decodeBoolForKey:@"enableSwiftUITracing"]);
    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"planNameOrPath"];
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[PTTraceConfig setPlanNameOrPath:](v5, "setPlanNameOrPath:", v18);

    -[PTTraceConfig setOverrideSymbolicate:]( v5,  "setOverrideSymbolicate:",  [v4 decodeBoolForKey:@"overrideSymbolicate"]);
    -[PTTraceConfig setOverrideIncludeOSSignposts:]( v5,  "setOverrideIncludeOSSignposts:",  [v4 decodeBoolForKey:@"overrideIncludeOSSignposts"]);
    -[PTTraceConfig setOverrideIncludeOSLogs:]( v5,  "setOverrideIncludeOSLogs:",  [v4 decodeBoolForKey:@"overrideIncludeOSLogs"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig symbolicate](self, "symbolicate"), @"symbolicate");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[PTTraceConfig callstackSamplingRateMS](self, "callstackSamplingRateMS"),  @"callstackSamplingRateMS");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceGroups](self, "traceGroups"));
  [v9 encodeObject:v4 forKey:@"traceGroups"];

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceType](self, "traceType"), @"traceType");
  uint8_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceDirectoryURL](self, "traceDirectoryURL"));
  [v9 encodeObject:v5 forKey:@"traceDirectoryURL"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceName](self, "traceName"));
  [v9 encodeObject:v6 forKey:@"traceName"];

  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig compressWhenFinished](self, "compressWhenFinished"),  @"compressWhenFinished");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeOSLogs](self, "includeOSLogs"), @"includeOSLogs");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig includeOSSignposts](self, "includeOSSignposts"),  @"includeOSSignposts");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceTimeoutS](self, "traceTimeoutS"), @"traceTimeoutS");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig skipNotification](self, "skipNotification"),  @"skipNotification");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig includeKernelStacks](self, "includeKernelStacks"),  @"includeKernelStacks");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[PTTraceConfig kernelBufferSizeMB](self, "kernelBufferSizeMB"),  @"kernelBufferSizeMB");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[PTTraceConfig kernelBufferDrainQoS](self, "kernelBufferDrainQoS"),  @"kernelBufferDrainQoS");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[PTTraceConfig kernelBufferDrainRateMS](self, "kernelBufferDrainRateMS"),  @"kernelBufferDrainRateMS");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig ownerPID](self, "ownerPID"), @"ownerPID");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig ownerName](self, "ownerName"));
  [v9 encodeObject:v7 forKey:@"ownerName"];

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig source](self, "source"), @"source");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[PTTraceConfig traceDurationSecs](self, "traceDurationSecs"),  @"traceDurationSecs");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig useTraceRecord](self, "useTraceRecord"),  @"useTraceRecord");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig enableSwiftUITracing](self, "enableSwiftUITracing"),  @"enableSwiftUITracing");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig planNameOrPath](self, "planNameOrPath"));
  [v9 encodeObject:v8 forKey:@"planNameOrPath"];

  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig overrideSymbolicate](self, "overrideSymbolicate"),  @"overrideSymbolicate");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig overrideIncludeOSSignposts](self, "overrideIncludeOSSignposts"),  @"overrideIncludeOSSignposts");
  objc_msgSend( v9,  "encodeBool:forKey:",  -[PTTraceConfig overrideIncludeOSLogs](self, "overrideIncludeOSLogs"),  @"overrideIncludeOSLogs");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___PTTraceConfig);
  -[PTTraceConfig setSymbolicate:](v4, "setSymbolicate:", -[PTTraceConfig symbolicate](self, "symbolicate"));
  -[PTTraceConfig setCallstackSamplingRateMS:]( v4,  "setCallstackSamplingRateMS:",  -[PTTraceConfig callstackSamplingRateMS](self, "callstackSamplingRateMS"));
  uint8_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceGroups](self, "traceGroups"));
  id v6 = [v5 copy];
  -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v6);

  -[PTTraceConfig setTraceType:](v4, "setTraceType:", -[PTTraceConfig traceType](self, "traceType"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceDirectoryURL](self, "traceDirectoryURL"));
  id v8 = [v7 copy];
  -[PTTraceConfig setTraceDirectoryURL:](v4, "setTraceDirectoryURL:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig traceName](self, "traceName"));
  id v10 = [v9 copy];
  -[PTTraceConfig setTraceName:](v4, "setTraceName:", v10);

  -[PTTraceConfig setCompressWhenFinished:]( v4,  "setCompressWhenFinished:",  -[PTTraceConfig compressWhenFinished](self, "compressWhenFinished"));
  -[PTTraceConfig setIncludeOSLogs:](v4, "setIncludeOSLogs:", -[PTTraceConfig includeOSLogs](self, "includeOSLogs"));
  -[PTTraceConfig setIncludeOSSignposts:]( v4,  "setIncludeOSSignposts:",  -[PTTraceConfig includeOSSignposts](self, "includeOSSignposts"));
  -[PTTraceConfig setTraceTimeoutS:](v4, "setTraceTimeoutS:", -[PTTraceConfig traceTimeoutS](self, "traceTimeoutS"));
  -[PTTraceConfig setSkipNotification:]( v4,  "setSkipNotification:",  -[PTTraceConfig skipNotification](self, "skipNotification"));
  -[PTTraceConfig setIncludeKernelStacks:]( v4,  "setIncludeKernelStacks:",  -[PTTraceConfig includeKernelStacks](self, "includeKernelStacks"));
  -[PTTraceConfig setKernelBufferSizeMB:]( v4,  "setKernelBufferSizeMB:",  -[PTTraceConfig kernelBufferSizeMB](self, "kernelBufferSizeMB"));
  -[PTTraceConfig setKernelBufferDrainQoS:]( v4,  "setKernelBufferDrainQoS:",  -[PTTraceConfig kernelBufferDrainQoS](self, "kernelBufferDrainQoS"));
  -[PTTraceConfig setKernelBufferDrainRateMS:]( v4,  "setKernelBufferDrainRateMS:",  -[PTTraceConfig kernelBufferDrainRateMS](self, "kernelBufferDrainRateMS"));
  -[PTTraceConfig setUseTraceRecord:](v4, "setUseTraceRecord:", -[PTTraceConfig useTraceRecord](self, "useTraceRecord"));
  -[PTTraceConfig setEnableSwiftUITracing:]( v4,  "setEnableSwiftUITracing:",  -[PTTraceConfig enableSwiftUITracing](self, "enableSwiftUITracing"));
  -[PTTraceConfig setOwnerPID:](v4, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v4, "ownerPID"), buffer, 0x21u);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  4LL));
  -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTTraceConfig ownerName](v4, "ownerName"));
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
    -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v13);
  }

  -[PTTraceConfig setSource:](v4, "setSource:", 4LL);
  return v4;
}

- (void)setIncludeOSSignposts:(BOOL)a3
{
  self->_includeOSSignposts = a3;
  self->_overrideIncludeOSSignposts = 1;
}

- (void)setIncludeOSLogs:(BOOL)a3
{
  self->_includeOSLogs = a3;
  self->_overrideIncludeOSLogs = 1;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
  self->_overrideSymbolicate = 1;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (unint64_t)callstackSamplingRateMS
{
  return self->_callstackSamplingRateMS;
}

- (void)setCallstackSamplingRateMS:(unint64_t)a3
{
  self->_callstackSamplingRateMS = a3;
}

- (NSMutableArray)traceGroups
{
  return self->_traceGroups;
}

- (void)setTraceGroups:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)traceType
{
  return self->_traceType;
}

- (void)setTraceType:(unint64_t)a3
{
  self->_traceType = a3;
}

- (NSURL)traceDirectoryURL
{
  return self->_traceDirectoryURL;
}

- (void)setTraceDirectoryURL:(id)a3
{
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
}

- (int)ownerPID
{
  return self->_ownerPID;
}

- (void)setOwnerPID:(int)a3
{
  self->_ownerPID = a3;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (BOOL)compressWhenFinished
{
  return self->_compressWhenFinished;
}

- (void)setCompressWhenFinished:(BOOL)a3
{
  self->_compressWhenFinished = a3;
}

- (BOOL)includeOSLogs
{
  return self->_includeOSLogs;
}

- (BOOL)includeOSSignposts
{
  return self->_includeOSSignposts;
}

- (unint64_t)traceTimeoutS
{
  return self->_traceTimeoutS;
}

- (void)setTraceTimeoutS:(unint64_t)a3
{
  self->_traceTimeoutS = a3;
}

- (unint64_t)traceDurationSecs
{
  return self->_traceDurationSecs;
}

- (void)setTraceDurationSecs:(unint64_t)a3
{
  self->_traceDurationSecs = a3;
}

- (BOOL)skipNotification
{
  return self->_skipNotification;
}

- (void)setSkipNotification:(BOOL)a3
{
  self->_skipNotification = a3;
}

- (BOOL)useTraceRecord
{
  return self->_useTraceRecord;
}

- (void)setUseTraceRecord:(BOOL)a3
{
  self->_useTraceRecord = a3;
}

- (BOOL)includeKernelStacks
{
  return self->_includeKernelStacks;
}

- (void)setIncludeKernelStacks:(BOOL)a3
{
  self->_includeKernelStacks = a3;
}

- (unint64_t)kernelBufferSizeMB
{
  return self->_kernelBufferSizeMB;
}

- (void)setKernelBufferSizeMB:(unint64_t)a3
{
  self->_kernelBufferSizeMB = a3;
}

- (unsigned)kernelBufferDrainQoS
{
  return self->_kernelBufferDrainQoS;
}

- (void)setKernelBufferDrainQoS:(unsigned int)a3
{
  self->_kernelBufferDrainQoS = a3;
}

- (unint64_t)kernelBufferDrainRateMS
{
  return self->_kernelBufferDrainRateMS;
}

- (void)setKernelBufferDrainRateMS:(unint64_t)a3
{
  self->_kernelBufferDrainRateMS = a3;
}

- (BOOL)enableSwiftUITracing
{
  return self->_enableSwiftUITracing;
}

- (void)setEnableSwiftUITracing:(BOOL)a3
{
  self->_enableSwiftUITracing = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)planNameOrPath
{
  return self->_planNameOrPath;
}

- (void)setPlanNameOrPath:(id)a3
{
}

- (BOOL)overrideIncludeOSSignposts
{
  return self->_overrideIncludeOSSignposts;
}

- (void)setOverrideIncludeOSSignposts:(BOOL)a3
{
  self->_overrideIncludeOSSignposts = a3;
}

- (BOOL)overrideIncludeOSLogs
{
  return self->_overrideIncludeOSLogs;
}

- (void)setOverrideIncludeOSLogs:(BOOL)a3
{
  self->_overrideIncludeOSLogs = a3;
}

- (BOOL)overrideSymbolicate
{
  return self->_overrideSymbolicate;
}

- (void)setOverrideSymbolicate:(BOOL)a3
{
  self->_overrideSymbolicate = a3;
}

- (OS_os_transaction)tracingActiveTransaction
{
  return self->_tracingActiveTransaction;
}

- (void)setTracingActiveTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end