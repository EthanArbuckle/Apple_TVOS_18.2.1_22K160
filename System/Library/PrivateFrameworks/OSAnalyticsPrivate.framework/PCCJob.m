@interface PCCJob
- (NSDate)lastTouch;
- (NSDictionary)metadata;
- (NSDictionary)options;
- (NSString)event;
- (NSString)jid;
- (NSString)nextFilepath;
- (NSString)target;
- (NSString)type;
- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5;
- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5 forFile:(id)a6;
- (id)description;
- (id)result;
- (void)packageLog:(id)a3 forRouting:(id)a4 info:(id)a5 options:(id)a6;
- (void)registerResult:(BOOL)a3 error:(id)a4;
@end

@implementation PCCJob

- (NSString)nextFilepath
{
  return (NSString *)-[OSALog filepath](self->_package, "filepath");
}

- (id)result
{
  return self->_errObj;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PCCJob;
  v12 = -[PCCJob init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jid, a3);
    objc_storeStrong((id *)&v13->_target, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    uint64_t v14 = [MEMORY[0x189603F50] date];
    lastTouch = v13->_lastTouch;
    v13->_lastTouch = (NSDate *)v14;

    type = v13->_type;
    v13->_type = (NSString *)@"xfer-file";

    [v11 objectForKeyedSubscript:@"event"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      uint64_t v18 = [v11 objectForKeyedSubscript:@"event"];
      event = v13->_event;
      v13->_event = (NSString *)v18;
    }

    else
    {
      [v11 objectForKeyedSubscript:@"jobEvent"];
      event = (void *)objc_claimAutoreleasedReturnValue();
      if (event)
      {
        uint64_t v20 = [v11 objectForKeyedSubscript:@"jobEvent"];
        v21 = v13->_event;
        v13->_event = (NSString *)v20;
      }

      else
      {
        v21 = v13->_event;
        v13->_event = (NSString *)@"<unknown>";
      }
    }
  }

  return v13;
}

- (id)description
{
  v2 = (void *)NSString;
  jid = self->_jid;
  v4 = -[OSALog filepath](self->_package, "filepath");
  [v2 stringWithFormat:@"single %@ %@", jid, v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5 forFile:(id)a6
{
  v38[3] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  v12 = -[PCCJob initWithID:forTarget:options:](self, "initWithID:forTarget:options:", a3, a4, v10);
  if (v12)
  {
    [v10 objectForKeyedSubscript:@"<preserve>"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 BOOLValue];

    int v14 = OSAIsRSDDisplay();
    BOOL v15 = -[NSString isEqualToString:](v12->_jid, "isEqualToString:", @"<unsolicited>");
    [MEMORY[0x189611B08] sharedInstance];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 pathSubmission];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 hasPrefix:v17])
    {
    }

    else
    {
      [MEMORY[0x189611B08] sharedInstance];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringByDeletingLastPathComponent];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = [v18 isWhitelisted:v19 forDomain:@"transfer_paths"];

      if (!v20)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "path non-accessible, abandoning job",  v32,  2u);
        }

        v29 = (void *)MEMORY[0x189607870];
        uint64_t v33 = *MEMORY[0x1896075E0];
        v34 = @"Path non-accessible";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v29 errorWithDomain:@"ProxyJobErrorDomain" code:3 userInfo:v24];
        errObj = v12->_errObj;
        v12->_errObj = (NSError *)v30;
        goto LABEL_12;
      }
    }

    v37[0] = @"<preserve>";
    [MEMORY[0x189607968] numberWithBool:v14 ^ 1u];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v21;
    v37[1] = @"<exempt>";
    [MEMORY[0x189607968] numberWithBool:!v15];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v22;
    v37[2] = @"<cleanup>";
    [MEMORY[0x189607968] numberWithBool:0];
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:3];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PCCJob packageLog:forRouting:info:options:]( v12,  "packageLog:forRouting:info:options:",  v11,  @"<sync>",  &unk_18A166B50,  v24);
    if (v12->_package)
    {
LABEL_13:

      goto LABEL_14;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "specific file not available, abandoning job",  v32,  2u);
    }

    v25 = (void *)MEMORY[0x189607870];
    uint64_t v35 = *MEMORY[0x1896075E0];
    v36 = @"File unavailable";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    errObj = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v25 errorWithDomain:@"ProxyJobErrorDomain" code:2 userInfo:errObj];
    v28 = v12->_errObj;
    v12->_errObj = (NSError *)v27;

LABEL_12:
    goto LABEL_13;
  }

- (void)packageLog:(id)a3 forRouting:(id)a4 info:(id)a5 options:(id)a6
{
  v42[8] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = (objc_class *)MEMORY[0x189611AF0];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc(v11);
  [MEMORY[0x189611B08] sharedInstance];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (OSALog *)[v15 initWithPath:v14 forRouting:v13 usingConfig:v16 options:v12 error:0];

  package = self->_package;
  self->_package = v17;

  v19 = self->_package;
  if (v19)
  {
    -[OSALog closeFileStream](v19, "closeFileStream");
    -[OSALog filepath](self->_package, "filepath");
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189611B08] sharedInstance];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 pathSubmission];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = [v20 hasPrefix:v22];

    if (v23)
    {
      v24 = -[OSALog filepath](self->_package, "filepath");
      [MEMORY[0x189611B08] sharedInstance];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 pathSubmission];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 stringByReplacingOccurrencesOfString:v26 withString:&stru_18A161700];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 stringByDeletingLastPathComponent];
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v28 = &stru_18A161700;
    }

    [MEMORY[0x189611B08] sharedInstance];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 crashReporterKey];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = @"name";
    v31 = -[OSALog filepath](self->_package, "filepath");
    [v31 lastPathComponent];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v32;
    v42[1] = v30;
    v41[1] = @"proxied_dev";
    v41[2] = @"subdir";
    v42[2] = v28;
    v42[3] = v10;
    v41[3] = @"status";
    v41[4] = @"device_class";
    [MEMORY[0x189607968] numberWithInt:MGGetSInt32Answer()];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    event = self->_event;
    jid = self->_jid;
    v42[4] = v33;
    v42[5] = jid;
    v41[5] = @"jobId";
    v41[6] = @"jobEvent";
    v42[6] = event;
    v41[7] = @"jobType";
    v36 = -[PCCJob type](self, "type");
    v42[7] = v36;
    [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:8];
    v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    self->_metadata = v37;

    [MEMORY[0x189603F50] date];
    v39 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastTouch = self->_lastTouch;
    self->_lastTouch = v39;
  }
}

- (void)registerResult:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (v5)
  {
    -[OSALog retire:](self->_package, "retire:", "transferred");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "finished transferring log successfully",  (uint8_t *)&v9,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "file send failure, abandoning job: %@",  (uint8_t *)&v9,  0xCu);
    }

    objc_storeStrong((id *)&self->_errObj, a4);
  }

  package = self->_package;
  self->_package = 0LL;
}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)target
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSDate)lastTouch
{
  return (NSDate *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end