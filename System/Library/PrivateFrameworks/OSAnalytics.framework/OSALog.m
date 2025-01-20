@interface OSALog
+ (BOOL)isDataVaultEnabled;
+ (BOOL)randomlySelectForRetention:(id)a3;
+ (id)additionalRootsInstalled;
+ (id)commonFieldsForBody:(id)a3;
+ (id)createForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7;
+ (id)locallyCreateForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7;
+ (id)logObjForBugType:(id)a3;
+ (id)scanProxies:(id)a3;
+ (unsigned)scanLogs:(id)a3 from:(id)a4;
+ (unsigned)scanLogs:(id)a3 from:(id)a4 options:(id)a5;
+ (void)cleanupForUser:(id)a3;
+ (void)cleanupRetired:(id)a3;
+ (void)createRetiredDirectory:(id)a3;
+ (void)iterateLogsWithOptions:(id)a3 usingBlock:(id)a4;
+ (void)markDescriptor:(int)a3 forKey:(id)a4 withObj:(id)a5;
+ (void)markDescriptor:(int)a3 withPairs:(id)a4 andOptions:(id)a5;
+ (void)markFile:(id)a3 withKey:(const char *)a4 value:(const char *)a5;
+ (void)markPurgeableLevel:(unint64_t)a3 path:(id)a4;
+ (void)purgeLogs:(id)a3;
- (BOOL)deleteOnRetire;
- (BOOL)isReasonableSize:(int64_t)a3 forRouting:(id)a4;
- (BOOL)retire:(const char *)a3;
- (NSDictionary)metaData;
- (NSString)bugType;
- (NSString)filepath;
- (NSString)oldFilePath;
- (OSALog)initWithFilepath:(id)a3 type:(id)a4;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5 error:(id *)a6;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7;
- (OSALog)initWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- (OSALog)initWithType:(id)a3 filepath:(id)a4 metadata:(id)a5 options:(id)a6 at:(double)a7 error:(id *)a8;
- (__sFILE)stream;
- (id)description;
- (void)closeFileStream;
- (void)dealloc;
- (void)markWithKey:(const char *)a3 value:(const char *)a4;
- (void)rename:(id)a3;
- (void)setDeleteOnRetire:(BOOL)a3;
- (void)setOldFilePath:(id)a3;
@end

@implementation OSALog

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v113 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[OSALog initWithPath:forRouting:usingConfig:options:error:].cold.1();
  }
  v103.receiver = self;
  v103.super_class = (Class)&OBJC_CLASS___OSALog;
  v17 = -[OSALog init](&v103, sel_init);
  if (!v17) {
    goto LABEL_92;
  }
  v97 = a7;
  v102 = "rejected";
  [v16 objectForKeyedSubscript:@"<cleanup>"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17->_deleteOnRetire = [v18 BOOLValue];

  [v16 objectForKeyedSubscript:@"<preserve>"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17->_preserveFiles = [v19 BOOLValue];

  [v16 objectForKeyedSubscript:@"<exempt>"];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  char v21 = [v20 BOOLValue];

  p_filepath = (id *)&v17->_filepath;
  objc_storeStrong((id *)&v17->_filepath, a3);
  v17->_stream = fopen(-[NSString fileSystemRepresentation](v17->_filepath, "fileSystemRepresentation"), "r");
  v23 = __error();
  stream = v17->_stream;
  id v98 = v13;
  if (stream)
  {
    int v25 = fileno(stream);
    if (fstat(v25, &v101))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        id v26 = *p_filepath;
        int v27 = *__error();
        *(_DWORD *)buf = 138412546;
        id v110 = v26;
        __int16 v111 = 1024;
        LODWORD(st_size) = v27;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' fstat errno %d",  buf,  0x12u);
      }

      v102 = "rejected-fstat";
      fclose(v17->_stream);
      v17->_stream = 0LL;
      v28 = a7;
      goto LABEL_77;
    }

    [*p_filepath pathExtension];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    char v36 = [v35 isEqualToString:@"synced"];
    id v37 = *p_filepath;
    if ((v36 & 1) != 0)
    {
      [v37 stringByDeletingPathExtension];
      id v38 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v38 = v37;
    }

    v39 = v38;

    uint64_t v40 = [v39 pathExtension];
    bugType = v17->_bugType;
    v17->_bugType = (NSString *)v40;

    gettimeofday(&v100, 0LL);
    if ((v21 & 1) == 0 && v100.tv_sec - v101.st_mtimespec.tv_sec > 2591999)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        id v59 = *p_filepath;
        *(_DWORD *)buf = 138412290;
        id v110 = v59;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' is too old for submission",  buf,  0xCu);
      }

      fclose(v17->_stream);
      v17->_stream = 0LL;
      v102 = "rejected-age";
      v28 = a7;
      goto LABEL_76;
    }

    [v16 objectForKeyedSubscript:@"<metadata>"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v42;
    if (v42 && ![v42 BOOLValue])
    {
      if ((v21 & 1) != 0
        || -[OSALog isReasonableSize:forRouting:](v17, "isReasonableSize:forRouting:", v101.st_size, v14))
      {
        v60 = v96;
        if (([v14 isEqualToString:@"anon"] & 1) == 0
          && ([v96 BOOLValue] & 1) != 0)
        {
          metaData = v17->_metaData;
          v17->_metaData = (NSDictionary *)MEMORY[0x189604A60];

          v28 = v97;
LABEL_75:

LABEL_76:
LABEL_77:
          if (v17->_stream) {
            goto LABEL_78;
          }
          v58 = v102;
          goto LABEL_84;
        }

        v95 = (NSDictionary *)objc_opt_new();
        if ([v14 isEqualToString:@"anon"])
        {
          [v39 stringByDeletingPathExtension];
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 pathExtension];
          v65 = v39;
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v66, @"subrouting");
          uint64_t v67 = [v66 stringByAppendingPathExtension:v17->_bugType];
          v68 = v17->_bugType;
          v17->_bugType = (NSString *)v67;

          v39 = v65;
        }

        v93 = v39;
        if (initWithPath_forRouting_usingConfig_options_error__onceToken != -1) {
          dispatch_once(&initWithPath_forRouting_usingConfig_options_error__onceToken, &__block_literal_global_3);
        }
        int v69 = fileno(v17->_stream);
        ssize_t v70 = flistxattr(v69, (char *)buf, 0x1FFuLL, 0);
        if (v70 >= 1)
        {
          ssize_t v71 = v70;
          buf[v70] = 0;
          v72 = buf;
          do
          {
            ssize_t v73 = fgetxattr(v69, (const char *)v72, __ptr, 0x20uLL, 0, 0);
            if (v73 >= 1)
            {
              __ptr[v73] = 0;
              [NSString stringWithUTF8String:v72];
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (([(id)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist containsObject:v74] & 1) == 0)
              {
                [NSString stringWithUTF8String:__ptr];
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v75, v74);
              }
            }

            v72 += strlen((const char *)v72) + 1;
          }

          while (v72 - buf < v71);
        }

        v76 = v17->_metaData;
        v17->_metaData = v95;

        v39 = v93;
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          id v91 = *p_filepath;
          *(_DWORD *)buf = 138412546;
          id v110 = v91;
          __int16 v111 = 2048;
          off_t st_size = v101.st_size;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' is too large (%lld) for submission",  buf,  0x16u);
        }

        v102 = "rejected-rawsize";
        fclose(v17->_stream);
        v17->_stream = 0LL;
      }

void __60__OSALog_initWithPath_forRouting_usingConfig_options_error___block_invoke()
{
  v2[9] = *MEMORY[0x1895F89C0];
  v2[0] = @"SubmissionPolicy";
  v2[1] = @"routing";
  v2[2] = @"urgent";
  v2[3] = @"Signature";
  v2[4] = @"LogType";
  v2[5] = @"dialog_displayed";
  v2[6] = @"ReopenPath";
  v2[7] = @"displayName";
  v2[8] = @"priority";
  uint64_t v0 = [MEMORY[0x189603F18] arrayWithObjects:v2 count:9];
  v1 = (void *)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist;
  initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist = v0;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = -[OSALog initWithPath:forRouting:usingConfig:options:error:]( self,  "initWithPath:forRouting:usingConfig:options:error:",  v12,  v11,  v13,  v10,  a6);

  return v14;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = -[OSALog initWithPath:forRouting:usingConfig:options:error:]( self,  "initWithPath:forRouting:usingConfig:options:error:",  v10,  v9,  v11,  v8,  0LL);

  return v12;
}

- (OSALog)initWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[a4 mutableCopy];
  [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"<exempt>"];
  id v10 = -[OSALog initWithPath:forRouting:options:error:]( self,  "initWithPath:forRouting:options:error:",  v8,  &stru_189E21910,  v9,  a5);

  return v10;
}

- (id)description
{
  return self->_filepath;
}

- (void)closeFileStream
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  stream = self->_stream;
  if (stream)
  {
    if (fclose(stream))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v4 = -[NSString lastPathComponent](self->_filepath, "lastPathComponent");
        int v5 = *__error();
        v6 = __error();
        v7 = strerror(*v6);
        int v8 = 138412802;
        id v9 = v4;
        __int16 v10 = 1024;
        int v11 = v5;
        __int16 v12 = 2080;
        id v13 = v7;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "WARNING: Failed to close %@. Please do NOT call -[NSFileHandle closeFile] errno=%d: %s",  (uint8_t *)&v8,  0x1Cu);
      }
    }

    self->_stream = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSALog;
  -[OSALog dealloc](&v3, sel_dealloc);
}

- (void)rename:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_filepath, a3);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[OSALog rename:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (id)logObjForBugType:(id)a3
{
  id v3 = a3;
  if (v3 && ([&unk_189E31DA8 containsObject:v3] & 1) != 0)
  {
    v4 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    id v5 = (void *)[v4 logDomain];
  }

  else
  {
    id v5 = (void *)MEMORY[0x1895F8DA0];
    id v6 = MEMORY[0x1895F8DA0];
  }

  return v5;
}

- (OSALog)initWithType:(id)a3 filepath:(id)a4 metadata:(id)a5 options:(id)a6 at:(double)a7 error:(id *)a8
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v13 = (char *)a3;
  uint64_t v14 = (char *)a4;
  id v44 = a5;
  id v15 = a6;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___OSALog;
  id v16 = -[OSALog init](&v46, sel_init);
  if (!v16) {
    goto LABEL_22;
  }
  mode_t v42 = umask(0);
  objc_storeStrong((id *)&v16->_filepath, a4);
  +[OSALog logObjForBugType:](&OBJC_CLASS___OSALog, "logObjForBugType:", v13);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v13;
    __int16 v52 = 2114;
    v53 = v14;
    _os_log_impl(&dword_1861AC000, v17, OS_LOG_TYPE_DEFAULT, "creating type %{public}@ as %{public}@", buf, 0x16u);
  }

  v18 = v14;
  uint64_t v19 = open_dprotected_np((const char *)[v18 UTF8String], 2561, 4, 0, 432);
  if ((v19 & 0x80000000) == 0)
  {
    +[OSASystemConfiguration ensureConformanceOfFile:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureConformanceOfFile:options:",  v19,  v15);
    v20 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    uint64_t v21 = [v20 createReportMetadata:v13 with:v44 at:v15 usingOptions:a7];
    metaData = v16->_metaData;
    v16->_metaData = (NSDictionary *)v21;

    v23 = v16->_metaData;
    v49 = @"bug_type";
    [MEMORY[0x189603F18] arrayWithObjects:&v49 count:1];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary dictionaryWithValuesForKeys:](v23, "dictionaryWithValuesForKeys:", v24);
    int v25 = (void *)objc_claimAutoreleasedReturnValue();

    id v26 = v16->_metaData;
    id v45 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v26 options:0 error:&v45];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v45;
    if (v27)
    {
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:v19 closeOnDealloc:0];
      [v15 objectForKeyedSubscript:@"alt-metadata"];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v29 = v28 == 0LL;

      if (v29)
      {
        [v40 writeData:v27];
        [MEMORY[0x189603F48] dataWithBytes:"\n" length:1];
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 writeData:v30];
      }

      if ((v19 & 0x80000000) == 0)
      {
        +[OSALog markDescriptor:withPairs:andOptions:]( &OBJC_CLASS___OSALog,  "markDescriptor:withPairs:andOptions:",  v19,  v25,  v15);
        v16->_stream = fdopen(v19, "w");
        goto LABEL_20;
      }
    }

    else
    {
      if (a8) {
        *a8 = v41;
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = 0LL;
        __int16 v52 = 2114;
        v53 = (char *)v41;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error while serializing ips metadata %{public}@. Error: %{public}@",  buf,  0x16u);
      }

      close(v19);
    }

    unlink((const char *)[v18 UTF8String]);
    goto LABEL_20;
  }

  uint64_t v31 = *__error();
  int v32 = __error();
  v33 = strerror(*v32);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v18;
    __int16 v52 = 2082;
    v53 = v33;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error creating file %{public}@, %{public}s",  buf,  0x16u);
  }

  if (!a8) {
    goto LABEL_21;
  }
  id v34 = objc_alloc(MEMORY[0x189607870]);
  v47[0] = *MEMORY[0x1896075E0];
  [NSString stringWithUTF8String:v33];
  int v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = @"errno";
  v48[0] = v25;
  [MEMORY[0x189607968] numberWithInt:v31];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v35;
  [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:v47 count:2];
  char v36 = (void *)objc_claimAutoreleasedReturnValue();
  *a8 = (id)[v34 initWithDomain:@"OSALog" code:13 userInfo:v36];

LABEL_20:
LABEL_21:
  umask(v42);
LABEL_22:
  if (v16->_stream) {
    id v37 = v16;
  }
  else {
    id v37 = 0LL;
  }
  id v38 = v37;

  return v38;
}

- (OSALog)initWithFilepath:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSALog;
  uint64_t v9 = -[OSALog init](&v12, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bugType, a4);
    objc_storeStrong((id *)&v10->_filepath, a3);
  }

  return v10;
}

+ (void)markPurgeableLevel:(unint64_t)a3 path:(id)a4
{
  unint64_t v7 = a3;
  id v4 = a4;
  int v5 = fsctl((const char *)[v4 fileSystemRepresentation], 0xC0084A44uLL, &v7, 0);
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      +[OSALog markPurgeableLevel:path:].cold.1(v4, (uint64_t *)&v7, v6);
    }
  }
}

+ (BOOL)randomlySelectForRetention:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  if (randomlySelectForRetention__onceToken != -1) {
    dispatch_once(&randomlySelectForRetention__onceToken, &__block_literal_global_134);
  }
  id v4 = (dispatch_queue_s *)randomlySelectForRetention__logRetentionCountQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__OSALog_randomlySelectForRetention___block_invoke_2;
  v7[3] = &unk_189E20A28;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v5 = v3;
  dispatch_sync(v4, v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __37__OSALog_randomlySelectForRetention___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.osanalytics.logRetentionCount", 0LL);
  v1 = (void *)randomlySelectForRetention__logRetentionCountQueue;
  randomlySelectForRetention__logRetentionCountQueue = (uint64_t)v0;
}

void __37__OSALog_randomlySelectForRetention___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v2 = -[OSADateCounter initWithIdentifier:]( objc_alloc(&OBJC_CLASS___OSADateCounter),  "initWithIdentifier:",  @"logLimit_309");
  if ([*(id *)(a1 + 32) isEqualToString:@"309"])
  {
    if (-[OSADateCounter count](v2, "count") <= 0x31 && OSARandomSelection(0x1F4uLL, @"logLimitRate_309"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      -[OSADateCounter increment](v2, "increment");
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        int v4 = 138543362;
        uint64_t v5 = v3;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Retaining additional log with bug type %{public}@",  (uint8_t *)&v4,  0xCu);
      }
    }
  }
}

+ (id)locallyCreateForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  v135[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v83 = a7;
  uint64_t v118 = 0LL;
  v119 = &v118;
  uint64_t v120 = 0x3032000000LL;
  v121 = __Block_byref_object_copy__3;
  v122 = __Block_byref_object_dispose__3;
  id v123 = 0LL;
  uint64_t v112 = 0LL;
  uint64_t v113 = &v112;
  uint64_t v114 = 0x3032000000LL;
  v115 = __Block_byref_object_copy__3;
  v116 = __Block_byref_object_dispose__3;
  id v117 = 0LL;
  uint64_t v106 = 0LL;
  v107 = &v106;
  uint64_t v108 = 0x3032000000LL;
  v109 = __Block_byref_object_copy__3;
  id v110 = __Block_byref_object_dispose__3;
  __int16 v111 = @"Undescribed error";
  [v12 objectForKeyedSubscript:@"LogType"];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v13 length])
  {
    uint64_t v14 = v10;

    char v13 = v14;
  }

  uint64_t v104 = 0LL;
  uint64_t v105 = 0LL;
  uint64_t v101 = 0LL;
  v102 = &v101;
  uint64_t v103 = 0x2020000000LL;
  [v12 objectForKeyedSubscript:@"override-filePath"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = v15 != 0LL;

  if (v16) {
    goto LABEL_7;
  }
  v17 = +[OSALogTrackerObject sharedTrackers](&OBJC_CLASS___OSALogTrackerObject, "sharedTrackers");
  v18 = (id *)(v107 + 5);
  id obj = (id)v107[5];
  int v19 = objc_msgSend( v17,  "osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:",  v10,  v13,  v102 + 3,  &v105,  v12,  &obj);
  objc_storeStrong(v18, obj);
  if (v19)
  {

LABEL_7:
    id v21 = v11;
    [v21 objectForKeyedSubscript:@"roots_installed"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = v22 == 0LL;

    if (v23)
    {
      +[OSALog additionalRootsInstalled](&OBJC_CLASS___OSALog, "additionalRootsInstalled");
      int v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v24 = (void *)[v21 mutableCopy];
        [v24 addEntriesFromDictionary:v25];
      }

      else
      {
        v24 = v21;
      }
    }

    else
    {
      v24 = v21;
    }

    [v12 objectForKeyedSubscript:@"capture-time"];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 doubleValue];
    double v28 = v27;

    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 logPathForType:v10 at:v12 options:v28];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      [v12 objectForKeyedSubscript:@"move-file"];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1895F87A8];
      v85[1] = 3221225472LL;
      v85[2] = __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke;
      v85[3] = &unk_189E20A50;
      id v32 = v31;
      id v86 = v32;
      id v87 = v30;
      v93 = &v118;
      v88 = v10;
      id v89 = v24;
      id v90 = v12;
      double v97 = v28;
      id v92 = v83;
      id v94 = &v106;
      BOOL v99 = v16;
      v95 = &v112;
      v96 = &v101;
      id v91 = v13;
      uint64_t v98 = v105;
      __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke((uint64_t)v85);

      v33 = v86;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v129 = v10;
        __int16 v130 = 2112;
        v131 = v13;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Report of type '%{public}@(%@)' not saved because the destination is unavailable",  buf,  0x16u);
      }

      id v34 = (void *)v107[5];
      v107[5] = (uint64_t)@"Destination unavailable";

      v35 = (void *)MEMORY[0x189607870];
      uint64_t v36 = v107[5];
      uint64_t v134 = *MEMORY[0x1896075E0];
      v135[0] = v36;
      [MEMORY[0x189603F68] dictionaryWithObjects:v135 forKeys:&v134 count:1];
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = [v35 errorWithDomain:@"OSALog" code:5 userInfo:v32];
      v33 = (void *)v113[5];
      v113[5] = v37;
    }

    goto LABEL_19;
  }

  BOOL v20 = +[OSALog randomlySelectForRetention:](&OBJC_CLASS___OSALog, "randomlySelectForRetention:", v10);

  if (v20) {
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v129 = v10;
    __int16 v130 = 2112;
    v131 = v13;
    __int16 v132 = 2048;
    uint64_t v133 = v105;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Report of type '%{public}@(%@)' not saved because the limit of %lu logs has been reached",  buf,  0x20u);
  }

  uint64_t v67 = (void *)MEMORY[0x189607870];
  uint64_t v68 = v107[5];
  uint64_t v126 = *MEMORY[0x1896075E0];
  uint64_t v127 = v68;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = [v67 errorWithDomain:@"OSALog" code:4 userInfo:v24];
  id v30 = (void *)v113[5];
  v113[5] = v69;
LABEL_19:

  [MEMORY[0x189603FC8] dictionary];
  id v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 setObject:v10 forKeyedSubscript:@"bug_type"];
  [MEMORY[0x189607968] numberWithInt:v107[5] == 0];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 setObject:v39 forKeyedSubscript:@"saved"];

  uint64_t v40 = (void *)v113[5];
  if (v40)
  {
    [v40 userInfo];
    id v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 objectForKeyedSubscript:@"errno"];
    mode_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = [v42 intValue];

    id v44 = (void *)NSString;
    uint64_t v45 = v107[5];
    [(id)v113[5] domain];
    objc_super v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 stringWithFormat:@"%@ (%@:%ld:%d)", v45, v46, objc_msgSend((id)v113[5], "code"), v43];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 setObject:v47 forKeyedSubscript:@"error"];

    if ((_DWORD)v43)
    {
      [(id)v113[5] userInfo];
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v48 objectForKeyedSubscript:@"errno"];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 setObject:v49 forKeyedSubscript:@"errno"];
    }
  }

  else
  {
    [v38 setObject:v107[5] forKeyedSubscript:@"error"];
  }

  AnalyticsSendEvent();
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", @"211"))
  {
    +[OSAStateMonitor recordEvent:](&OBJC_CLASS___OSAStateMonitor, "recordEvent:", @"ca-log-written");
    if (v107[5])
    {
      v124[0] = @"crk";
      v50 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      uint64_t v51 = [v50 crashReporterKey];
      __int16 v52 = (void *)v51;
      if (v10) {
        v53 = v10;
      }
      else {
        v53 = @"<unknown>";
      }
      v125[0] = v51;
      v125[1] = v53;
      v124[1] = @"bug_type";
      v124[2] = @"error";
      uint64_t v54 = objc_msgSend(v38, "objectForKeyedSubscript:");
      off_t v55 = (void *)v54;
      if (v54) {
        v56 = (const __CFString *)v54;
      }
      else {
        v56 = @"<unknown>";
      }
      v125[2] = v56;
      [MEMORY[0x189603F68] dictionaryWithObjects:v125 forKeys:v124 count:3];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      rtcsc_send(2003LL, 2003LL, v57);
    }
  }

  if (+[OSALog isDataVaultEnabled](&OBJC_CLASS___OSALog, "isDataVaultEnabled"))
  {
    [v12 objectForKeyedSubscript:@"datavault-filePath"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v58 BOOLValue] || v107[5])
    {
LABEL_44:

      goto LABEL_45;
    }

    [(id)v119[5] filepath];
    id v59 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v60 = v59 == 0LL;

    if (!v60)
    {
      [(id)v119[5] filepath];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      [v61 lastPathComponent];
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      id v62 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [v62 pathSubmission];
      [(id)v63 stringByAppendingPathComponent:v58];
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896078A8] defaultManager];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v119[5] filepath];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      id v84 = 0LL;
      LOBYTE(v63) = [v65 copyItemAtPath:v66 toPath:v64 error:&v84];
      id v81 = v84;

      if ((v63 & 1) != 0)
      {
        +[OSALog markFile:withKey:value:](&OBJC_CLASS___OSALog, "markFile:withKey:value:", v64, "DoNotSubmit", "1");
        [(id)v119[5] setOldFilePath:v64];
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        +[OSALog locallyCreateForSubmission:metadata:options:error:writing:].cold.1( (uint64_t)v81,  v70,  v71,  v72,  v73,  v74,  v75,  v76);
      }

      [(id)v119[5] filepath];
      id v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSALog markPurgeableLevel:path:](&OBJC_CLASS___OSALog, "markPurgeableLevel:path:", 98308LL, v77);

      goto LABEL_44;
    }
  }

void __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke(uint64_t a1)
{
  v87[1] = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v75 = v2;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Moving source file '%{public}@' into submission directory",  buf,  0xCu);
    }

    uint64_t v3 = fopen((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], "r");
    if (v3)
    {
      int v4 = v3;
      +[OSASystemConfiguration ensureConformanceOfFile:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureConformanceOfFile:options:",  fileno(v3),  *(void *)(a1 + 64));
      +[OSALog markDescriptor:withPairs:andOptions:]( &OBJC_CLASS___OSALog,  "markDescriptor:withPairs:andOptions:",  fileno(v4),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
      fclose(v4);
      uint64_t v5 = -[OSALog initWithFilepath:type:]( objc_alloc(&OBJC_CLASS___OSALog),  "initWithFilepath:type:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
      uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8LL);
      unint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL)) {
        goto LABEL_18;
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8LL);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = @"Unable to access log from existing file";

      uint64_t v10 = (void *)MEMORY[0x189607870];
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
      uint64_t v86 = *MEMORY[0x1896075E0];
      v87[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v87 forKeys:&v86 count:1];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v10 errorWithDomain:@"OSALog" code:6 userInfo:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 104) + 8LL);
      id v15 = *(id *)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }

    else
    {
      id v32 = (void *)NSString;
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *__error();
      v35 = __error();
      [v32 stringWithFormat:@"Unable to open file '%@': [%d] %s", v33, v34, strerror(*v35)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = v12;
        _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      uint64_t v36 = *(void *)(*(void *)(a1 + 96) + 8LL);
      uint64_t v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = @"Unable to open file";

      id v38 = (void *)MEMORY[0x189607870];
      uint64_t v84 = *MEMORY[0x1896075E0];
      v85 = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = [v38 errorWithDomain:@"OSALog" code:3 userInfo:v15];
      uint64_t v40 = *(void *)(*(void *)(a1 + 104) + 8LL);
      id v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
  }

  else
  {
    [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) lastPathComponent];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [@"." stringByAppendingString:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringByAppendingPathComponent:v18];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    int v19 = objc_alloc(&OBJC_CLASS___OSALog);
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 64);
    double v23 = *(double *)(a1 + 120);
    id v71 = 0LL;
    uint64_t v24 = -[OSALog initWithType:filepath:metadata:options:at:error:]( v19,  "initWithType:filepath:metadata:options:at:error:",  v20,  v12,  v21,  v22,  &v71,  v23);
    id v25 = v71;
    uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8LL);
    double v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v24;

    double v28 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    if (v28)
    {
      uint64_t v29 = *(void *)(a1 + 80);
      uint64_t v30 = fileno((FILE *)[v28 stream]);
      id v70 = v25;
      int v31 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v29 + 16))(v29, v30, &v70);
      id v15 = v70;

      if (v31)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) closeFileStream];
      }

      else
      {
        unlink((const char *)[v12 UTF8String]);
        uint64_t v42 = *(void *)(*(void *)(a1 + 88) + 8LL);
        uint64_t v43 = *(void **)(v42 + 40);
        *(void *)(v42 + 40) = 0LL;
      }
    }

    else
    {
      id v15 = v25;
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL))
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 96) + 8LL);
      uint64_t v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = @"Unable to create a new log file";

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL), v15);
    }
  }

LABEL_18:
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL))
  {
    [MEMORY[0x1896078A8] defaultManager];
    objc_super v46 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) filepath];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = *(void *)(a1 + 40);
    id v69 = 0LL;
    int v49 = [v46 moveItemAtPath:v47 toPath:v48 error:&v69];
    id v50 = v69;

    if (v49)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) rename:*(void *)(a1 + 40)];
      if (!*(_BYTE *)(a1 + 136))
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL);
        +[OSALogTrackerObject sharedTrackers](&OBJC_CLASS___OSALogTrackerObject, "sharedTrackers");
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = *(void *)(a1 + 72);
        [*(id *)(a1 + 64) objectForKeyedSubscript:@"Signature"];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v51, "osa_logTracker_incrementForSubtype:signature:filepath:", v52, v53, objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation"));
      }

      +[OSABridgeLinkProxy transfer:key:]( &OBJC_CLASS___OSABridgeLinkProxy,  "transfer:key:",  *(void *)(a1 + 40),  *(void *)(a1 + 72));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = *(void **)(a1 + 72);
        uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL);
        uint64_t v56 = *(void *)(a1 + 128);
        uint64_t v58 = *(void *)(a1 + 40);
        v57 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544386;
        uint64_t v75 = v57;
        __int16 v76 = 2112;
        id v77 = v54;
        __int16 v78 = 2048;
        uint64_t v79 = v55;
        __int16 v80 = 2048;
        uint64_t v81 = v56;
        __int16 v82 = 2114;
        uint64_t v83 = v58;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Saved type '%{public}@(%@)' report (%lu of max %lu) at %{public}@",  buf,  0x34u);
      }

      uint64_t v59 = *(void *)(*(void *)(a1 + 96) + 8LL);
      BOOL v60 = *(void **)(v59 + 40);
      *(void *)(v59 + 40) = 0LL;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) filepath];
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v75 = v65;
        __int16 v76 = 2114;
        id v77 = v50;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unable to move tmp file '%{public}@': %{public}@",  buf,  0x16u);
      }

      uint64_t v66 = *(void *)(*(void *)(a1 + 96) + 8LL);
      uint64_t v67 = *(void **)(v66 + 40);
      *(void *)(v66 + 40) = @"Unable to move tmp file";

      uint64_t v68 = *(void *)(*(void *)(a1 + 104) + 8LL);
      id v50 = v50;
      BOOL v60 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = v50;
    }

    goto LABEL_32;
  }

  uint64_t v61 = *(void *)(*(void *)(a1 + 96) + 8LL);
  if (!*(void *)(v61 + 40))
  {
    *(void *)(v61 + 40) = @"Failed to create log";
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL))
  {
    id v62 = (void *)MEMORY[0x189607870];
    uint64_t v72 = *MEMORY[0x1896075E0];
    uint64_t v73 = @"datawriter returned with negative response";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = [v62 errorWithDomain:@"OSALog" code:14 userInfo:v50];
    uint64_t v64 = *(void *)(*(void *)(a1 + 104) + 8LL);
    BOOL v60 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;
LABEL_32:
  }

+ (id)createForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  uint64_t v134 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v111 = a7;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v73 = (void *)MEMORY[0x186E34260](v111);
    NSUserName();
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v131 = 138413314;
    *(void *)&v131[4] = v10;
    *(_WORD *)&v131[12] = 2112;
    *(void *)&v131[14] = v11;
    *(_WORD *)&v131[22] = 2112;
    __int16 v132 = v12;
    *(_WORD *)uint64_t v133 = 2048;
    *(void *)&v133[2] = v73;
    *(_WORD *)&v133[10] = 2112;
    *(void *)&v133[12] = v74;
    _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "createForSubmission: %@ metadata: %@ options: %@ block: %p (by %@)",  v131,  0x34u);
  }

  if (v12) {
    uint64_t v13 = [v12 mutableCopy];
  }
  else {
    uint64_t v13 = objc_opt_new();
  }
  uint64_t v14 = (void *)v13;
  id v15 = (void *)objc_opt_new();
  if (v11)
  {
    [v12 objectForKeyedSubscript:@"nestedMetadata"];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v16 BOOLValue];

    if (v17) {
      [v15 setObject:v11 forKeyedSubscript:@"custom_headers"];
    }
    else {
      [v15 addEntriesFromDictionary:v11];
    }
  }

  [v12 objectForKeyedSubscript:@"capture-time"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v19 = v18 == 0LL;

  if (v19)
  {
    [MEMORY[0x189607968] numberWithDouble:CFAbsoluteTimeGetCurrent()];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v20 forKeyedSubscript:@"capture-time"];
  }

  [v11 objectForKeyedSubscript:@"incident_id"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = v21 == 0LL;

  if (v22)
  {
    [MEMORY[0x189607AB8] UUID];
    double v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 UUIDString];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v24 forKeyedSubscript:@"incident_id"];
  }

  [v12 objectForKeyedSubscript:@"LogType"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v26 = [v25 length] == 0;

  if (v26) {
    [v14 setObject:v10 forKeyedSubscript:@"LogType"];
  }
  uint64_t v27 = geteuid();
  if (v27 >= 0x1F4)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v27];
    double v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v28 forKeyedSubscript:@"file-owner-uid"];
  }

  [v12 objectForKeyedSubscript:@"observer_info"];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v30 = v29 == 0LL;

  if (v30)
  {
    [MEMORY[0x189603FC8] dictionaryWithObject:v10 forKey:@"bug_type"];
    int v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v31 forKeyedSubscript:@"observer_info"];
  }

  else
  {
    [v14 objectForKeyedSubscript:@"observer_info"];
    int v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setObject:v10 forKeyedSubscript:@"bug_type"];
  }

  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = [v32 usesLegacySubmission:v10];

  if (v33) {
    [v14 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"alt-metadata"];
  }
  if (+[OSALog isDataVaultEnabled](&OBJC_CLASS___OSALog, "isDataVaultEnabled")
    && _os_feature_enabled_impl()
    && [v10 isEqualToString:@"309"])
  {
    [v14 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"datavault-filePath"];
  }

  *(void *)v131 = 0LL;
  *(void *)&v131[8] = v131;
  *(void *)&v131[16] = 0x3032000000LL;
  __int16 v132 = __Block_byref_object_copy__3;
  *(void *)uint64_t v133 = __Block_byref_object_dispose__3;
  *(void *)&v133[8] = 0LL;
  [v12 objectForKeyedSubscript:@"override-filePath"];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    context = (void *)MEMORY[0x186E340A4]();
    mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0LL, 2uLL);
    connection = mach_service;
    if (!mach_service)
    {
      BOOL v56 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
      if (v56) {
        +[OSALog createForSubmission:metadata:options:error:writing:].cold.1(v56, v57, v58, v59, v60, v61, v62, v63);
      }
      uint64_t v64 = (void *)MEMORY[0x189607870];
      uint64_t v118 = *MEMORY[0x1896075E0];
      v119 = @"Couldn't get XPC connection";
      uint64_t v65 = [MEMORY[0x189603F68] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      uint64_t v66 = [v64 errorWithDomain:@"OSALog" code:17 userInfo:v65];
      xpc_connection_t v107 = (xpc_connection_t)v65;
      uint64_t v36 = 0LL;
      uint64_t v67 = *(os_log_s **)(*(void *)&v131[8] + 40LL);
      *(void *)(*(void *)&v131[8] + 40LL) = v66;
      goto LABEL_103;
    }

    uint64_t v40 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_187;
    handler[3] = &unk_189E20580;
    handler[4] = v131;
    xpc_connection_set_event_handler(mach_service, handler);
    id v41 = xpc_connection_create(0LL, 0LL);
    xpc_connection_t v107 = v41;
    if (!v41)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v130 = 0;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Couldn't config private XPC connection",  v130,  2u);
      }

      id v69 = (void *)MEMORY[0x189607870];
      uint64_t v120 = *MEMORY[0x1896075E0];
      v121 = @"Couldn't config private XPC connection";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
      id v70 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v71 = [v69 errorWithDomain:@"OSALog" code:16 userInfo:v70];
      uint64_t v72 = *(void **)(*(void *)&v131[8] + 40LL);
      *(void *)(*(void *)&v131[8] + 40LL) = v71;

      uint64_t v36 = 0LL;
      goto LABEL_95;
    }

    v112[0] = v40;
    v112[1] = 3221225472LL;
    v112[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_191;
    v112[3] = &unk_189E20AC8;
    id v113 = v111;
    xpc_connection_set_event_handler(v41, v112);
    xpc_endpoint_t v42 = xpc_endpoint_create(v41);
    xpc_connection_resume(v41);
    xpc_connection_resume(connection);
    xpc_object_t v43 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_value(v43, "datawriter_endpoint", v42);
    xpc_object_t xdict = v43;
    xpc_endpoint_t v104 = v42;
    memset(v130, 0, sizeof(v130));
    uint64_t v44 = getprogname();
    if (!v44)
    {
      pid_t v45 = getpid();
      uint64_t v44 = (const char *)v130;
      __sprintf_chk((char *)v130, 0, 0x20uLL, "%d", v45);
    }

    xpc_dictionary_set_string(xdict, "caller", v44);
    xpc_dictionary_set_uint64(xdict, "operation", 6uLL);
    objc_super v46 = (const char *)[@"bug_type" UTF8String];
    id v47 = v10;
    xpc_dictionary_set_string(xdict, v46, (const char *)[v47 UTF8String]);
    if ([v15 count])
    {
      ns2xpc(v15);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(xdict, "additionalHeaders", v48);
    }

    if ([v14 count])
    {
      ns2xpc(v14);
      int v49 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(xdict, "options", v49);
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v129 = (const char *)v47;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "C1. request '%@' report service via XPC/osanalyticshelper",  buf,  0xCu);
    }

    xpc_object_t v50 = xpc_connection_send_message_with_reply_sync(connection, xdict);
    xpc_object_t v105 = v50;
    if (v50)
    {
      if (xpc_dictionary_get_BOOL(v50, "result"))
      {
        string = xpc_dictionary_get_string(v105, "filePath");
        if (string)
        {
          uint64_t v52 = objc_alloc(&OBJC_CLASS___OSALog);
          [NSString stringWithUTF8String:string];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v36 = -[OSALog initWithFilepath:type:](v52, "initWithFilepath:type:", v53, v47);

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v129 = string;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "C6. report request completed: %s",  buf,  0xCu);
          }

          uint64_t v54 = xpc_dictionary_get_string(v105, "oldFilePath");
          if (!v54) {
            goto LABEL_94;
          }
          [NSString stringWithUTF8String:v54];
          uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[OSALog setOldFilePath:](v36, "setOldFilePath:", v55);
          goto LABEL_93;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
          +[OSALog createForSubmission:metadata:options:error:writing:].cold.2();
        }
        if (!*(void *)(*(void *)&v131[8] + 40LL))
        {
          id v90 = (void *)MEMORY[0x189607870];
          uint64_t v126 = *MEMORY[0x1896075E0];
          uint64_t v127 = @"Incomplete XPC result -- no filename";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
          uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v76 = [v90 errorWithDomain:@"OSALog" code:7 userInfo:v55];
          goto LABEL_78;
        }
      }

      else
      {
        xpc_object_t v77 = v105;
        if (v105 == (xpc_object_t)MEMORY[0x1895F91A0])
        {
          BOOL v78 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
          if (v78)
          {
            +[OSALog createForSubmission:metadata:options:error:writing:].cold.3(v78, v79, v80, v81, v82, v83, v84, v85);
            xpc_object_t v77 = v105;
          }
        }

        uint64_t v86 = (char *)MEMORY[0x186E34644](v77);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v129 = v86;
          _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "XPC Response: '%s'", buf, 0xCu);
        }

        if (v86) {
          free(v86);
        }
        id v87 = xpc_dictionary_get_string(v105, "error_desc");
        if (!v87)
        {
          v88 = *(void **)(*(void *)&v131[8] + 40LL);
          if (v88)
          {
            id v89 = [v88 localizedDescription];
            id v87 = (const char *)[v89 UTF8String];
          }

          else
          {
            id v87 = 0LL;
          }
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v129 = v87;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "C6. report request failed: %s",  buf,  0xCu);
        }

        if (!*(void *)(*(void *)&v131[8] + 40LL))
        {
          uint64_t v103 = xpc_dictionary_get_string(v105, "error_domain");
          uint64_t uint64 = xpc_dictionary_get_uint64(v105, "error_code");
          uint64_t v101 = (void *)MEMORY[0x189607870];
          if (v103)
          {
            objc_msgSend(NSString, "stringWithUTF8String:");
            uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v55 = @"OSALog";
          }

          uint64_t v124 = *MEMORY[0x1896075E0];
          if (v87)
          {
            [NSString stringWithUTF8String:v87];
            id v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v92 = @"<unknown>";
          }

          v125 = v92;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v94 = [v101 errorWithDomain:v55 code:uint64 userInfo:v93];
          v95 = *(void **)(*(void *)&v131[8] + 40LL);
          *(void *)(*(void *)&v131[8] + 40LL) = v94;

          if (v87) {
          uint64_t v36 = 0LL;
          }
          if (!v103) {
            goto LABEL_94;
          }
          goto LABEL_93;
        }
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid XPC response", buf, 2u);
      }

      if (!*(void *)(*(void *)&v131[8] + 40LL))
      {
        uint64_t v75 = (void *)MEMORY[0x189607870];
        uint64_t v122 = *MEMORY[0x1896075E0];
        id v123 = @"Invalid XPC response";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
        uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v76 = [v75 errorWithDomain:@"OSALog" code:15 userInfo:v55];
LABEL_78:
        id v91 = *(void **)(*(void *)&v131[8] + 40LL);
        *(void *)(*(void *)&v131[8] + 40LL) = v76;

        uint64_t v36 = 0LL;
LABEL_93:

        goto LABEL_94;
      }
    }

    uint64_t v36 = 0LL;
LABEL_94:

    id v70 = v113;
LABEL_95:

    +[OSALog logObjForBugType:](&OBJC_CLASS___OSALog, "logObjForBugType:", v10);
    uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      if (v36) {
        v96 = @"success";
      }
      else {
        v96 = @"FAILED";
      }
      if (*(void *)(*(void *)&v131[8] + 40LL)) {
        [*(id *)(*(void *)&v131[8] + 40) localizedDescription];
      }
      else {
        -[OSALog filepath](v36, "filepath");
      }
      double v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int16 v130 = 138543874;
      *(void *)&v130[4] = v10;
      *(_WORD *)&v130[12] = 2112;
      *(void *)&v130[14] = v96;
      *(_WORD *)&v130[22] = 2114;
      *(void *)&v130[24] = v97;
      _os_log_impl( &dword_1861AC000,  v67,  OS_LOG_TYPE_DEFAULT,  "client log create type %{public}@ result %@: %{public}@",  v130,  0x20u);
    }

uint64_t __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:a2];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }

  return 1LL;
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_187( uint64_t a1,  void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  int v4 = v3;
  if (v3 != (id)MEMORY[0x1895F9198] && MEMORY[0x186E34734](v3) == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1895F91B0]);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "com.apple.osanalytics.osanalyticshelper";
      __int16 v16 = 2080;
      int v17 = string;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Got xpc error message from %s: %s\n",  buf,  0x16u);
    }

    uint64_t v6 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896075E0];
    objc_msgSend(NSString, "stringWithFormat:", @"XPC Error: %s", string);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v6 errorWithDomain:@"OSALog" code:8 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_191( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (MEMORY[0x186E34734]() == MEMORY[0x1895F9238])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "C3. private back-channel connection established",  buf,  2u);
    }

    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_192;
    v5[3] = &unk_189E20AA0;
    id v7 = *(id *)(a1 + 32);
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, v5);
    xpc_connection_resume((xpc_connection_t)v4);
  }
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_192( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (MEMORY[0x186E34734]() == MEMORY[0x1895F9250])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      uint64_t v5 = xpc_dictionary_dup_fd(v3, "fileDesc");
      if ((_DWORD)v5)
      {
        uint64_t v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          int v10 = 67109120;
          LODWORD(v11) = v6;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "C4. write payload using file descriptor (%d)",  (uint8_t *)&v10,  8u);
        }

        uint64_t v7 = *(void *)(a1 + 40);
        if (v7)
        {
          uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:v6];
          (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
        }

        BOOL v9 = 1;
        close(v6);
      }

      else
      {
        BOOL v9 = 0;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 67109120;
          LODWORD(v11) = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "C4. ERROR no file descriptor (%d)",  (uint8_t *)&v10,  8u);
          BOOL v9 = 0;
        }
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v10 = 67109120;
        LODWORD(v11) = v9;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "C5. payload writing complete, return status %d",  (uint8_t *)&v10,  8u);
      }

      xpc_dictionary_set_BOOL(reply, "result", v9);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "C4. ERROR Unable to reply",  (uint8_t *)&v10,  2u);
    }
  }
}

- (BOOL)isReasonableSize:(int64_t)a3 forRouting:(id)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 hasSuffix:@".pll.anon"])
  {
  }

  else
  {
    BOOL v7 = -[NSString hasSuffix:](self->_filepath, "hasSuffix:", @".mss.anon");

    if (!v7)
    {
      unint64_t v8 = 0x100000LL;
      return v8 >= a3;
    }
  }

  unint64_t v8 = 104857600LL;
  return v8 >= a3;
}

- (void)markWithKey:(const char *)a3 value:(const char *)a4
{
  uint64_t v6 = -[NSString UTF8String](self->_filepath, "UTF8String");
  size_t v7 = strlen(a4);
  if (setxattr(v6, a3, a4, v7 + 1, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[OSALog markWithKey:value:].cold.1();
    }
  }

+ (void)markFile:(id)a3 withKey:(const char *)a4 value:(const char *)a5
{
  id v7 = a3;
  unint64_t v8 = (const char *)[v7 UTF8String];
  size_t v9 = strlen(a5);
  if (setxattr(v8, a4, a5, v9 + 1, 0, 0) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    +[OSALog markFile:withKey:value:].cold.1();
  }
}

+ (void)markDescriptor:(int)a3 forKey:(id)a4 withObj:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    size_t v9 = (const char *)[v8 UTF8String];
    int v10 = v9;
LABEL_7:
    size_t v12 = strlen(v9);
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v13 = [v8 stringValue];
    int v10 = (const char *)[v13 UTF8String];

    size_t v9 = v10;
    goto LABEL_7;
  }

  id v11 = v8;
  int v10 = (const char *)[v11 bytes];
  size_t v12 = [v11 length];
LABEL_8:
  size_t v14 = v12;
  if (v10 && v12)
  {
    id v15 = v7;
    if (fsetxattr(a3, (const char *)[v15 UTF8String], v10, v14, 0, 0)
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *__error();
      int v17 = __error();
      uint64_t v18 = strerror(*v17);
      int v19 = 138412802;
      id v20 = v15;
      __int16 v21 = 1024;
      int v22 = v16;
      __int16 v23 = 2080;
      uint64_t v24 = v18;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unable to set xattr '%@', errno=%d: %s",  (uint8_t *)&v19,  0x1Cu);
    }

    goto LABEL_15;
  }

+ (void)markDescriptor:(int)a3 withPairs:(id)a4 andOptions:(id)a5
{
  uint64_t v7 = markDescriptor_withPairs_andOptions__onceToken;
  id v10 = a5;
  id v8 = a4;
  if (v7 != -1) {
    dispatch_once(&markDescriptor_withPairs_andOptions__onceToken, &__block_literal_global_219);
  }
  uint64_t v9 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2;
  v13[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  int v14 = a3;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];

  v11[0] = v9;
  v11[1] = 3221225472LL;
  v11[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3;
  v11[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  int v12 = a3;
  [v10 enumerateKeysAndObjectsUsingBlock:v11];
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke()
{
  v2[9] = *MEMORY[0x1895F89C0];
  v2[0] = @"SubmissionPolicy";
  v2[1] = @"routing";
  v2[2] = @"urgent";
  v2[3] = @"Signature";
  v2[4] = @"LogType";
  v2[5] = @"dialog_displayed";
  v2[6] = @"ReopenPath";
  v2[7] = @"displayName";
  v2[8] = @"priority";
  uint64_t v0 = [MEMORY[0x189603F18] arrayWithObjects:v2 count:9];
  v1 = (void *)markDescriptor_withPairs_andOptions__option_xattr_whitelist;
  markDescriptor_withPairs_andOptions__option_xattr_whitelist = v0;
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    +[OSALog markDescriptor:forKey:withObj:]( &OBJC_CLASS___OSALog,  "markDescriptor:forKey:withObj:",  *(unsigned int *)(a1 + 32),  v6,  v5);
  }
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(id)markDescriptor_withPairs_andOptions__option_xattr_whitelist containsObject:v6])
  {
    +[OSALog markDescriptor:forKey:withObj:]( &OBJC_CLASS___OSALog,  "markDescriptor:forKey:withObj:",  *(unsigned int *)(a1 + 32),  v6,  v5);
  }
}

- (BOOL)retire:(const char *)a3
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  p_filepath = &self->_filepath;
  filepath = self->_filepath;
  if (!filepath) {
    return 1;
  }
  uint64_t v7 = (void *)-[NSString copy](filepath, "copy");
  -[OSALog closeFileStream](self, "closeFileStream");
  if (!self->_preserveFiles)
  {
    uint64_t v54 = v7;
    if (self->_deleteOnRetire)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *p_filepath;
        *(_DWORD *)buf = 136315394;
        uint64_t v66 = a3;
        __int16 v67 = 2114;
        uint64_t v68 = (const char *)v12;
        _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Cleanup %s '%{public}@'", buf, 0x16u);
      }

      [MEMORY[0x189604030] fileURLWithPath:*p_filepath];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v58 = 0LL;
      char v14 = OSASafeRemoveFileAtURL(v13, &v58);
      id v9 = v58;

      if ((v14 & 1) != 0)
      {
LABEL_11:
        uint64_t v10 = 1LL;
LABEL_27:
        +[OSALog logObjForBugType:](&OBJC_CLASS___OSALog, "logObjForBugType:", self->_bugType);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = @"<unknown>";
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          bugType = (const __CFString *)self->_bugType;
          if (!bugType) {
            bugType = @"<unknown>";
          }
          uint64_t v27 = "success";
          double v28 = self->_filepath;
          *(_DWORD *)buf = 138544130;
          if (!(_DWORD)v10) {
            uint64_t v27 = "failed";
          }
          uint64_t v66 = (const char *)bugType;
          __int16 v67 = 2082;
          uint64_t v68 = a3;
          __int16 v69 = 2114;
          id v70 = v28;
          __int16 v71 = 2080;
          uint64_t v72 = v27;
          _os_log_impl( &dword_1861AC000,  v24,  OS_LOG_TYPE_DEFAULT,  "Retiring (%{public}@) %{public}s '%{public}@': %s",  buf,  0x2Au);
        }

        uint64_t v29 = (const __CFString *)self->_bugType;
        if (!v29) {
          uint64_t v29 = @"<unknown>";
        }
        v64[0] = v29;
        v63[0] = @"bug_type";
        v63[1] = @"reason";
        if (a3)
        {
          [NSString stringWithUTF8String:a3];
          BOOL v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          BOOL v30 = @"<unknown>";
        }

        v64[1] = v30;
        v63[2] = @"proxied";
        objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NSString containsString:](*p_filepath, "containsString:", @"ProxiedDevice-"));
        int v31 = (void *)objc_claimAutoreleasedReturnValue();
        v64[2] = v31;
        v63[3] = @"success";
        [MEMORY[0x189607968] numberWithBool:v10];
        id v32 = (void *)objc_claimAutoreleasedReturnValue();
        v64[3] = v32;
        [MEMORY[0x189603F68] dictionaryWithObjects:v64 forKeys:v63 count:4];
        int v33 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        if (a3) {
        if (-[NSString isEqualToString:](self->_bugType, "isEqualToString:", @"211")
        }
          && !-[NSString containsString:](*p_filepath, "containsString:", @"ProxiedDevice-")
          && (-[NSString containsString:](*p_filepath, "containsString:", @"Analytics-Never")
           || -[NSString containsString:](*p_filepath, "containsString:", @"Analytics-2")))
        {
          v61[0] = @"crk";
          v53 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
          uint64_t v34 = [v53 crashReporterKey];
          uint64_t v35 = (void *)v34;
          uint64_t v36 = (const __CFString *)self->_bugType;
          if (!v36) {
            uint64_t v36 = @"<unknown>";
          }
          v62[0] = v34;
          v62[1] = v36;
          v61[1] = @"bug_type";
          v61[2] = @"incident_id";
          uint64_t v37 = -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          id v38 = (void *)v37;
          if (v37) {
            uint64_t v39 = (const __CFString *)v37;
          }
          else {
            uint64_t v39 = @"<unknown>";
          }
          v62[2] = v39;
          v61[3] = @"timestamp";
          uint64_t v40 = -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          id v41 = (void *)v40;
          if (v40) {
            xpc_endpoint_t v42 = (const __CFString *)v40;
          }
          else {
            xpc_endpoint_t v42 = @"<unknown>";
          }
          v62[3] = v42;
          v61[4] = @"reason";
          if (a3)
          {
            [NSString stringWithUTF8String:a3];
            uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          v62[4] = v25;
          v61[5] = @"optInStatus";
          xpc_object_t v43 = (void *)MEMORY[0x189607968];
          +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "numberWithBool:", objc_msgSend(v44, "optInApple"));
          pid_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          v62[5] = v45;
          [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:v61 count:6];
          objc_super v46 = (void *)objc_claimAutoreleasedReturnValue();
          rtcsc_send(2001LL, 2001LL, v46);

          if (a3) {
          v60[0] = v54;
          }
          v59[0] = @"logPath";
          v59[1] = @"retiredReason";
          if (a3)
          {
            [NSString stringWithUTF8String:a3];
            id v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v47 = @"<unknown>";
          }

          v60[1] = v47;
          [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:2];
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
          +[OSAStateMonitor recordEvent:with:]( &OBJC_CLASS___OSAStateMonitor,  "recordEvent:with:",  @"ca-log-retired",  v52);

          if (a3) {
        }
          }

        uint64_t v7 = v54;
        goto LABEL_68;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[OSALog retire:].cold.1();
      }
LABEL_17:
      uint64_t v10 = 0LL;
      goto LABEL_27;
    }

    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 appleInternal])
    {
      if (-[NSString hasSuffix:](*p_filepath, "hasSuffix:", @"pll.anon"))
      {

LABEL_59:
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v49 = *p_filepath;
          *(_DWORD *)buf = 138543362;
          uint64_t v66 = (const char *)v49;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Auto deletion of '%{public}@'",  buf,  0xCu);
        }

        [MEMORY[0x189604030] fileURLWithPath:*p_filepath];
        xpc_object_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        id v57 = 0LL;
        char v51 = OSASafeRemoveFileAtURL(v50, &v57);
        id v9 = v57;

        if ((v51 & 1) != 0) {
          goto LABEL_11;
        }
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[OSALog retire:].cold.1();
        }
        goto LABEL_17;
      }

      BOOL v48 = -[NSString hasSuffix:](*p_filepath, "hasSuffix:", @"mss.anon");

      if (v48) {
        goto LABEL_59;
      }
    }

    else
    {
    }

    -[NSString stringByDeletingLastPathComponent](*p_filepath, "stringByDeletingLastPathComponent");
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringByAppendingPathComponent:@"Retired"];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString lastPathComponent](*p_filepath, "lastPathComponent");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByAppendingPathComponent:v18];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604030] fileURLWithPath:*p_filepath];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604030] fileURLWithPath:v19];
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v56 = 0LL;
    char v22 = OSASafeMoveItemAtURL(v20, v21, &v56);
    id v9 = v56;

    if ((v22 & 1) != 0)
    {
      objc_storeStrong((id *)p_filepath, v19);
      -[OSALog markWithKey:value:](self, "markWithKey:value:", "retired-reason", a3);
      uint64_t v10 = 1LL;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[OSALog retire:].cold.2();
      }
      uint64_t v10 = 0LL;
    }

    if (-[NSString isEqualToString:](self->_bugType, "isEqualToString:", @"211"))
    {
      __int16 v23 = -[NSString fileSystemRepresentation](self->_filepath, "fileSystemRepresentation");
      v55[0] = MEMORY[0x1895F87A8];
      v55[1] = 3221225472LL;
      v55[2] = __17__OSALog_retire___block_invoke;
      v55[3] = &unk_189E20B30;
      v55[4] = self;
      OSASafeOpenReadOnly((uint64_t)v23, v55);
    }

    goto LABEL_27;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *p_filepath;
    *(_DWORD *)buf = 136315394;
    uint64_t v66 = a3;
    __int16 v67 = 2114;
    uint64_t v68 = (const char *)v8;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Sparing %s '%{public}@'", buf, 0x16u);
  }

  id v9 = 0LL;
  LODWORD(v10) = 1;
LABEL_68:

  return (_DWORD)v10 != 0;
}

void __17__OSALog_retire___block_invoke(int a1, int a2)
{
  if (fcntl(a2, 64, 2LL) == -1 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __17__OSALog_retire___block_invoke_cold_1();
  }
}

+ (void)cleanupRetired:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v3;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Cleaning up retired logs (in %{public}@)",  buf,  0xCu);
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = [v3 stringByAppendingPathComponent:@"Retired"];
  id v6 = (const char *)[v5 fileSystemRepresentation];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __25__OSALog_cleanupRetired___block_invoke;
  v9[3] = &unk_189E20B58;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  osa_scanDir(v6, 129LL, v9, 0LL);
}

void __25__OSALog_cleanupRetired___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithUTF8String:");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringByAppendingPathComponent:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v5 = *(void **)(a1 + 40);
  id v15 = 0LL;
  [v5 attributesOfItemAtPath:v4 error:&v15];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v15;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      int v17 = v4;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Failed to get attrs for retired log '%{public}@': %{public}@",  buf,  0x16u);
    }

    goto LABEL_10;
  }

  [v6 fileModificationDate];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 timeIntervalSinceNow];
  double v10 = fabs(v9);

  if (v10 <= 604800.0)
  {
LABEL_10:
    id v13 = v7;
    goto LABEL_11;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v4;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Removing old retired log '%{public}@'",  buf,  0xCu);
  }

  [MEMORY[0x189604030] fileURLWithPath:v4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  char v12 = OSASafeRemoveFileAtURL(v11, &v14);
  id v13 = v14;

  if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v17 = v4;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to remove retired log '%{public}@': %{public}@",  buf,  0x16u);
  }

+ (void)cleanupForUser:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FA8] arrayWithObject:&stru_189E21910];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3) {
    [v4 addObject:v3];
  }
  id v13 = v3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x189604A88];
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x189603FC8], "dictionary", v13);
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 setObject:v8 forKeyedSubscript:@"include-proxies"];
        if (+[OSALog isDataVaultEnabled](&OBJC_CLASS___OSALog, "isDataVaultEnabled")) {
          [v12 setObject:v8 forKeyedSubscript:@"datavault-filePath"];
        }
        if ([v11 length]) {
          [v12 setObject:v11 forKeyedSubscript:@"file-owner"];
        }
        +[OSALog iterateLogsWithOptions:usingBlock:]( &OBJC_CLASS___OSALog,  "iterateLogsWithOptions:usingBlock:",  v12,  &__block_literal_global_251);

        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }
}

void __25__OSALog_cleanupForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [v2 pathExtension];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"proxy"];

  if ((v4 & 1) == 0)
  {
    id v23 = 0LL;
    uint64_t v5 = *MEMORY[0x189603B88];
    id v22 = 0LL;
    int v6 = [v2 getResourceValue:&v23 forKey:v5 error:&v22];
    id v7 = v23;
    id v8 = v22;
    if (v6)
    {
      [v7 timeIntervalSinceNow];
      if (fabs(v9) > 2592000.0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          [v2 path];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          uint64_t v25 = v10;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Removing old log '%{public}@'",  buf,  0xCu);
        }

        [v2 URLByDeletingLastPathComponent];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 lastPathComponent];
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v12 isEqualToString:@"Retired"];

        if ((v13 & 1) != 0)
        {
          id v20 = v8;
          char v14 = OSASafeRemoveFileAtURL(v2, &v20);
          id v15 = v20;

          if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            [v2 path];
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            uint64_t v25 = v16;
            __int16 v26 = 2114;
            id v27 = v15;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to remove old log '%{public}@': %{public}@",  buf,  0x16u);
          }
        }

        else
        {
          __int128 v17 = objc_alloc(&OBJC_CLASS___OSALog);
          [v2 path];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          id v21 = v8;
          id v19 = -[OSALog initWithPath:options:error:](v17, "initWithPath:options:error:", v18, &unk_189E31C78, &v21);
          id v15 = v21;

          -[OSALog retire:](v19, "retire:", "expired");
        }

        goto LABEL_13;
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __25__OSALog_cleanupForUser___block_invoke_cold_1(v2);
    }

    id v15 = v8;
LABEL_13:
  }
}

+ (id)scanProxies:(id)a3
{
  id v3 = a3;
  +[OSALog createRetiredDirectory:](&OBJC_CLASS___OSALog, "createRetiredDirectory:", v3);
  [MEMORY[0x189603FA8] array];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  int v6 = opendir((const char *)[v5 fileSystemRepresentation]);
  if (v6)
  {
    id v7 = v6;
    for (i = readdir(v6); i; i = readdir(v7))
    {
      if (i->d_type == 4)
      {
        [NSString stringWithUTF8String:i->d_name];
        double v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 hasPrefix:@"ProxiedDevice-"])
        {
          [v5 stringByAppendingPathComponent:v9];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];
          +[OSALog createRetiredDirectory:](&OBJC_CLASS___OSALog, "createRetiredDirectory:", v10);
        }
      }
    }

    closedir(v7);
  }

  return v4;
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4 options:(id)a5
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v52 = a4;
  id v51 = a5;
  uint64_t v97 = 0LL;
  uint64_t v98 = &v97;
  uint64_t v99 = 0x2020000000LL;
  int v100 = 0;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
  id v56 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (v9)
  {
    uint64_t v57 = *(void *)v94;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v59 = v9;
      do
      {
        if (*(void *)v94 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = *(void **)(*((void *)&v93 + 1) + 8 * v10);
        [v61 objectForKeyedSubscript:@"<inactive>"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v12 = v11 == 0LL;

        if (v12)
        {
          [v61 objectForKeyedSubscript:@"logs"];
          char v13 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189603FA8] array];
          char v14 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          __int128 v89 = 0u;
          __int128 v90 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v105 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v90;
            do
            {
              for (uint64_t i = 0LL; i != v16; ++i)
              {
                if (*(void *)v90 != v17) {
                  objc_enumerationMutation(v15);
                }
                id v19 = *(id *)(*((void *)&v89 + 1) + 8 * i);
              }

              uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v105 count:16];
            }

            while (v16);
          }

          [v15 removeObjectsInArray:v14];
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v20 = [v15 count];
            *((_DWORD *)v98 + 6) += v20;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v21 = (void *)[v15 mutableCopy];
              [v61 setObject:v21 forKeyedSubscript:@"logs"];
            }
          }

          else
          {
            uint64_t v22 = objc_opt_new();

            [v61 setObject:v22 forKeyedSubscript:@"logs"];
            id v15 = (id)v22;
          }

          [v61 objectForKeyedSubscript:@"extensions"];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v104 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v86;
            do
            {
              for (uint64_t j = 0LL; j != v25; ++j)
              {
                if (*(void *)v86 != v26) {
                  objc_enumerationMutation(v24);
                }
                [v8 setObject:v15 forKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * j)];
              }

              uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v104 count:16];
            }

            while (v25);
          }

          [v61 objectForKeyedSubscript:@"<descend>"];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          int v29 = [v28 BOOLValue];

          if (v29)
          {
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v81 = 0u;
            __int128 v82 = 0u;
            id v30 = v24;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v103 count:16];
            if (v31)
            {
              uint64_t v32 = *(void *)v82;
              do
              {
                for (uint64_t k = 0LL; k != v31; ++k)
                {
                  if (*(void *)v82 != v32) {
                    objc_enumerationMutation(v30);
                  }
                  [v63 setObject:v15 forKeyedSubscript:*(void *)(*((void *)&v81 + 1) + 8 * k)];
                }

                uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v103 count:16];
              }

              while (v31);
            }
          }

          [v61 objectForKeyedSubscript:@"routing"];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 setObject:v15 forKeyedSubscript:v34];
        }

        ++v10;
      }

      while (v10 != v59);
      uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
    }

    while (v9);
  }

  [v51 objectForKeyedSubscript:@"only-urgent"];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  int v36 = [v35 BOOLValue];

  uint64_t v37 = 324LL;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  if (v36) {
    uint64_t v37 = 836LL;
  }
  uint64_t v54 = v37;
  __int128 v77 = 0uLL;
  __int128 v78 = 0uLL;
  id v53 = v52;
  uint64_t v60 = [v53 countByEnumeratingWithState:&v77 objects:v102 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v78;
    do
    {
      for (uint64_t m = 0LL; m != v60; ++m)
      {
        if (*(void *)v78 != v58) {
          objc_enumerationMutation(v53);
        }
        id v38 = *(void **)(*((void *)&v77 + 1) + 8 * m);
        uint64_t v39 = [v38 length];
        BOOL v40 = [v63 count] == 0;
        if (([v8 count] || objc_msgSend(v56, "count")) && objc_msgSend(v38, "length"))
        {
          id v41 = (const char *)[v38 fileSystemRepresentation];
          v71[0] = MEMORY[0x1895F87A8];
          v71[1] = 3221225472LL;
          v71[2] = __32__OSALog_scanLogs_from_options___block_invoke;
          v71[3] = &unk_189E20BC0;
          id v72 = v56;
          uint64_t v76 = v39;
          id v73 = v8;
          id v74 = v63;
          uint64_t v75 = &v97;
          osa_scanDir(v41, v54 | v40, v71, &__block_literal_global_271);
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          id v42 = obj;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v67 objects:v101 count:16];
          if (v43)
          {
            uint64_t v44 = *(void *)v68;
            do
            {
              for (uint64_t n = 0LL; n != v43; ++n)
              {
                if (*(void *)v68 != v44) {
                  objc_enumerationMutation(v42);
                }
                objc_super v46 = *(void **)(*((void *)&v67 + 1) + 8 * n);
                [v46 objectForKeyedSubscript:@"<sort>"];
                id v47 = (void *)objc_claimAutoreleasedReturnValue();
                if ([v47 length])
                {
                  [v46 objectForKeyedSubscript:@"logs"];
                  BOOL v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v65[0] = MEMORY[0x1895F87A8];
                  v65[1] = 3221225472LL;
                  v65[2] = __32__OSALog_scanLogs_from_options___block_invoke_2;
                  v65[3] = &unk_189E20C28;
                  id v66 = v47;
                  [v48 sortUsingComparator:v65];
                }
              }

              uint64_t v43 = [v42 countByEnumeratingWithState:&v67 objects:v101 count:16];
            }

            while (v43);
          }
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "no reason to scan", buf, 2u);
        }
      }

      uint64_t v60 = [v53 countByEnumeratingWithState:&v77 objects:v102 count:16];
    }

    while (v60);
  }

  unsigned int v49 = *((_DWORD *)v98 + 6);
  _Block_object_dispose(&v97, 8);

  return v49;
}

void __32__OSALog_scanLogs_from_options___block_invoke(void *a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  objc_msgSend(NSString, "stringWithUTF8String:");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByAppendingPathComponent:v4];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  char v21 = 0;
  memset(value, 0, sizeof(value));
  id v7 = v6;
  if (getxattr( (const char *)[v7 fileSystemRepresentation],  (const char *)objc_msgSend(@"routing", "UTF8String"),  value,  0x40uLL,  0,  0) >= 1)
  {
    id v8 = (void *)a1[4];
    [NSString stringWithUTF8String:value];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      goto LABEL_12;
    }
  }

  if ([v4 hasSuffix:@".synced"])
  {
    [v4 stringByDeletingPathExtension];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = v4;
  }

  BOOL v12 = v11;
  uint64_t v13 = [v11 pathExtension];
  if (!v13)
  {

    uint64_t v10 = 0LL;
    goto LABEL_17;
  }

  char v14 = (void *)v13;
  size_t v15 = strlen(a2);
  uint64_t v16 = 6LL;
  if (v15 == a1[8]) {
    uint64_t v16 = 5LL;
  }
  id v17 = (id)a1[v16];
  [v17 objectForKeyedSubscript:v14];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    [v17 objectForKeyedSubscript:@"<*>"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
  {
LABEL_12:
    if ((unint64_t)[v10 count] <= 0x3E7)
    {
      [v10 addObject:v7];
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "scan: including '%@'",  (uint8_t *)&v18,  0xCu);
      }

      ++*(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL);
    }
  }

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_269()
{
  return 1LL;
}

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 lastPathComponent];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 hasPrefix:*(void *)(a1 + 32)];

  [v5 lastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  unsigned int v9 = [v8 hasPrefix:*(void *)(a1 + 32)];
  if (v7) {
    return v9 - 1LL;
  }
  else {
    return v9;
  }
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4
{
  return +[OSALog scanLogs:from:options:](&OBJC_CLASS___OSALog, "scanLogs:from:options:", a3, a4, 0LL);
}

+ (void)purgeLogs:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = v3;
    id v5 = (const char *)[v4 fileSystemRepresentation];
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __20__OSALog_purgeLogs___block_invoke;
    v6[3] = &unk_189E20C50;
    id v7 = v4;
    osa_scanDir(v5, 65LL, v6, 0LL);
  }
}

void __20__OSALog_purgeLogs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 pathExtension];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 isEqualToString:@"proxy"];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___OSALog);
    [*(id *)(a1 + 32) stringByAppendingPathComponent:v4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = 0LL;
    unsigned int v9 = -[OSALog initWithPath:options:error:](v7, "initWithPath:options:error:", v8, 0LL, &v24);
    id v10 = v24;

    if (v9)
    {
      if (-[OSALog retire:](v9, "retire:", "opt-changed"))
      {
        id v11 = v10;
LABEL_12:

        goto LABEL_13;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __20__OSALog_purgeLogs___block_invoke_cold_3(a2, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __20__OSALog_purgeLogs___block_invoke_cold_2();
    }

    id v19 = (void *)MEMORY[0x189604030];
    [NSString stringWithUTF8String:a2];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 fileURLWithPath:v20];
    char v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v10;
    char v22 = OSASafeRemoveFileAtURL(v21, &v23);
    id v11 = v23;

    if ((v22 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __20__OSALog_purgeLogs___block_invoke_cold_1();
    }
    goto LABEL_12;
  }

+ (void)iterateLogsWithOptions:(id)a3 usingBlock:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v37 = a4;
  char v6 = (void *)MEMORY[0x186E340A4]();
  id v7 = (void *)objc_opt_new();
  [v5 objectForKeyedSubscript:@"override-filePath"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v8)
  {
    int v11 = [v9 isWhitelisted:v8 forDomain:@"transfer_paths"];

    if (v11)
    {
      [v7 addObject:v8];
    }

    else
    {
      char v36 = 0;
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      BOOL v48 = v8;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "path is not whitelisted for listing: %@",  buf,  0xCu);
    }

    char v36 = 0;
  }

  else
  {
    [v5 objectForKeyedSubscript:@"file-owner"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 pathSubmissionForOwner:v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13) {
      [v7 addObject:v13];
    }
    [v5 objectForKeyedSubscript:@"datavault-filePath"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 pathSubmissionDataVault];

      if (v17)
      {
        [v7 addObject:v17];
        uint64_t v13 = (void *)v17;
      }

      else
      {
        uint64_t v13 = 0LL;
      }
    }

    [v5 objectForKeyedSubscript:@"include-proxies"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v36 = [v18 BOOLValue];
  }

void __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x189604030];
  [NSString stringWithUTF8String:a2];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  [NSString stringWithUTF8String:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v10 count:2];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 fileURLWithPathComponents:v8];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

uint64_t __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if ((*(_BYTE *)(a1 + 32) & 0x40) != 0 || ([v2 isEqualToString:@"Retired"] & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 40)) {
      uint64_t v4 = [v3 hasPrefix:@"ProxiedDevice-"];
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  else
  {
    uint64_t v4 = 1LL;
  }

  return v4;
}

+ (id)additionalRootsInstalled
{
  v8[1] = *MEMORY[0x1895F89C0];
  size_t v5 = 8LL;
  id v2 = 0LL;
  if (!sysctlbyname("kern.roots_installed", &v6, &v5, 0LL, 0LL))
  {
    id v7 = @"roots_installed";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v6];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

+ (id)commonFieldsForBody:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  unsigned int v9 = @"bug_type";
  v10[0] = a3;
  id v3 = (void *)MEMORY[0x189603F68];
  id v4 = a3;
  [v3 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  size_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog additionalRootsInstalled](&OBJC_CLASS___OSALog, "additionalRootsInstalled");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v7 = (void *)[v5 mutableCopy];
    [v7 addEntriesFromDictionary:v6];

    size_t v5 = v7;
  }

  return v5;
}

+ (void)createRetiredDirectory:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "Creating Retired directory in %@", buf, 0xCu);
  }

  id v4 = v3;
  uint64_t v5 = [v4 fileSystemRepresentation];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__OSALog_createRetiredDirectory___block_invoke;
  v7[3] = &unk_189E20B30;
  id v8 = v4;
  id v6 = v4;
  OSASafeOpenReadOnly(v5, v7);
}

void __33__OSALog_createRetiredDirectory___block_invoke(uint64_t a1, int a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  memset(&v13, 0, sizeof(v13));
  if (fstat(a2, &v13))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __33__OSALog_createRetiredDirectory___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
    id v10 = 0LL;
  }

  else
  {
    uint64_t v14 = @"file-owner-uid";
    [MEMORY[0x189607968] numberWithUnsignedInt:v13.st_uid];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  *(void *)(a1 + 32),  @"Retired",  v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog markPurgeableLevel:path:](&OBJC_CLASS___OSALog, "markPurgeableLevel:path:", 75780LL, v12);
}

+ (BOOL)isDataVaultEnabled
{
  return 0;
}

- (__sFILE)stream
{
  return self->_stream;
}

- (NSDictionary)metaData
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)filepath
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)deleteOnRetire
{
  return self->_deleteOnRetire;
}

- (void)setDeleteOnRetire:(BOOL)a3
{
  self->_deleteOnRetire = a3;
}

- (NSString)bugType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)oldFilePath
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOldFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithPath:forRouting:usingConfig:options:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_9();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_debug_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Log::initWithPath:'%@' forRouting:'%@' options:%@",  v2,  0x20u);
  OUTLINED_FUNCTION_10_0();
}

- (void)rename:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)markPurgeableLevel:(int)a3 path:.cold.1(void *a1, uint64_t *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a1 UTF8String];
  uint64_t v6 = __error();
  uint64_t v7 = OUTLINED_FUNCTION_10(v6);
  uint64_t v8 = *a2;
  int v9 = 136315906;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = a3;
  __int16 v13 = 2080;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to mark %s as purgeable %d (%s) (flags 0x%11llx)",  (uint8_t *)&v9,  0x26u);
}

+ (void)locallyCreateForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)createForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)createForSubmission:metadata:options:error:writing:.cold.2()
{
  *(_WORD *)__int16 v0 = 0;
  _os_log_fault_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "(C6. report request completed successfully, but no filename returned!)",  v0,  2u);
}

+ (void)createForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_cold_1( void *a1,  uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error while writing file: %{public}@",  buf,  0xCu);
}

- (void)markWithKey:value:.cold.1()
{
  __int16 v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1861AC000, MEMORY[0x1895F8DA0], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)markFile:withKey:value:.cold.1()
{
  __int16 v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1861AC000, MEMORY[0x1895F8DA0], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)markDescriptor:forKey:withObj:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_7( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "Unsupported ips/xattr type %@ for '%@'",  v2,  v3,  v4,  v5,  2u);

  OUTLINED_FUNCTION_10_0();
}

- (void)retire:.cold.1()
{
}

- (void)retire:.cold.2()
{
}

void __17__OSALog_retire___block_invoke_cold_1()
{
  uint64_t v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  __error();
  OUTLINED_FUNCTION_5( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "Error setting protection class after retiring %{public}@: %{public}s (%{public}i)",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_13();
}

void __25__OSALog_cleanupForUser___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v2,  "Failed to retrieve creation date from %{public}@: %{public}@",  v3,  v4,  v5,  v6,  2u);

  OUTLINED_FUNCTION_10_0();
}

void __20__OSALog_purgeLogs___block_invoke_cold_1()
{
}

void __20__OSALog_purgeLogs___block_invoke_cold_2()
{
}

void __20__OSALog_purgeLogs___block_invoke_cold_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __33__OSALog_createRetiredDirectory___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end