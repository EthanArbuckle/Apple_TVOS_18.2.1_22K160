@interface SDContainer
- (BOOL)addSDUnits:(id)a3;
- (BOOL)evaluateCollectionFlags;
- (BOOL)evaluateCollectionFlagsWithOverlay:(unint64_t)a3 withName:(id)a4;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (NSMutableArray)units;
- (NSString)destination;
- (NSString)name;
- (OS_os_activity)executionActivity;
- (SDContainer)init;
- (SDContainer)initWithName:(id)a3 andDestination:(id)a4 withDelegate:(id)a5;
- (SDRuntimeFlagDelegate)runtimeFlagDelegate;
- (unint64_t)runtimeChecks;
- (void)applyContainerOverride:(id)a3;
- (void)setDestination:(id)a3;
- (void)setExecutionActivity:(id)a3;
- (void)setName:(id)a3;
- (void)setRuntimeChecks:(unint64_t)a3;
- (void)setRuntimeFlagDelegate:(id)a3;
- (void)setUnits:(id)a3;
- (void)updateContainerWithOverride;
@end

@implementation SDContainer

- (SDContainer)init
{
  return -[SDContainer initWithName:andDestination:withDelegate:]( self,  "initWithName:andDestination:withDelegate:",  @"none",  @"none",  0LL);
}

- (SDContainer)initWithName:(id)a3 andDestination:(id)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDContainer;
  v11 = -[SDContainer init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    -[SDContainer setName:](v11, "setName:", v8);
    objc_storeStrong((id *)&v12->_destination, a4);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    units = v12->_units;
    v12->_units = (NSMutableArray *)v13;

    objc_storeWeak((id *)&v12->_runtimeFlagDelegate, v10);
    os_activity_t v15 = _os_activity_create( (void *)&_mh_execute_header,  "Container activity",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    executionActivity = v12->_executionActivity;
    v12->_executionActivity = v15;
  }

  return v12;
}

- (BOOL)addSDUnits:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
  [v5 addObjectsFromArray:v4];

  return 1;
}

- (BOOL)execute
{
}

- (BOOL)executeFromCallback
{
}

- (BOOL)evaluateCollectionFlags
{
  BOOL v3 = -[SDContainer evaluateCollectionFlagsWithOverlay:withName:]( self,  "evaluateCollectionFlagsWithOverlay:withName:",  -[SDContainer runtimeChecks](self, "runtimeChecks"),  0LL);
  if (v3)
  {
    id v4 = sub_1000241E4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing container: %@...", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "stdoutWrite:", @"Subsystem: %s; Category: %s; Log: ", "com.apple.sysdiagnose", "containers");

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    [v8 stdoutWrite:@"Executing container: %@...", v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing container: %@...", v11 category msg];
  }

  return v3;
}

- (BOOL)evaluateCollectionFlagsWithOverlay:(unint64_t)a3 withName:(id)a4
{
  id v58 = a4;
  unint64_t v57 = -[SDContainer runtimeChecks](self, "runtimeChecks") | a3;
  uint64_t v6 = sub_10004024C();
  int v7 = sub_100020BE0();
  uint64_t v8 = 2LL;
  if (!v7) {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = v8 | v6;
  else {
    uint64_t v10 = 0LL;
  }
  int v11 = sub_100020CE0();
  uint64_t v12 = 4096LL;
  if (!v11) {
    uint64_t v12 = 0LL;
  }
  uint64_t v13 = v9 | v10 | v12;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  else {
    uint64_t v14 = 0LL;
  }
  os_activity_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  unsigned int v16 = [v15 shouldRunLogGenerationTasks];
  uint64_t v17 = 16LL;
  if (!v16) {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = v13 | v14 | v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  else {
    uint64_t v20 = 0LL;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  unsigned int v22 = [v21 shouldRunOSLogArchive];
  uint64_t v23 = 64LL;
  if (!v22) {
    uint64_t v23 = 0LL;
  }
  uint64_t v24 = v20 | v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  unsigned int v26 = [v25 shouldRunIDSDump];
  uint64_t v27 = 128LL;
  if (!v26) {
    uint64_t v27 = 0LL;
  }
  uint64_t v28 = v18 | v24 | v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  else {
    uint64_t v30 = 0LL;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  unsigned int v32 = [v31 shouldGetFeedbackData];
  uint64_t v33 = 1024LL;
  if (!v32) {
    uint64_t v33 = 0LL;
  }
  uint64_t v34 = v30 | v33;
  int v35 = sub_100020B7C();
  uint64_t v36 = 0x2000LL;
  if (!v35) {
    uint64_t v36 = 0LL;
  }
  uint64_t v37 = v34 | v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  unsigned int v39 = [v38 isTestingMode];
  uint64_t v40 = 0x4000LL;
  if (!v39) {
    uint64_t v40 = 0LL;
  }
  uint64_t v41 = v28 | v37 | v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 providedPIDorProcess]);
  unint64_t v44 = v41 | ((unint64_t)(v43 != 0LL) << 9);

  unint64_t v45 = v44;
  unint64_t v46 = v57 & ~v44;
  if (v46)
  {
    v47 = sub_1000241E4();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v58)
    {
      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
        *(_DWORD *)buf = 138413058;
        v60 = v50;
        __int16 v61 = 2112;
        unint64_t v62 = (unint64_t)v58;
        __int16 v63 = 2048;
        unint64_t v64 = v57;
        __int16 v65 = 2048;
        unint64_t v66 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%@ (%@): Req - %04llX State - %04llX. Conditions did not pass.",  buf,  0x2Au);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      [v51 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ (%@): Req - %04llX State - %04llX. Conditions did not pass.", v52, v58, v57, v45 category msg];
    }

    else
    {
      if (v49)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
        *(_DWORD *)buf = 138412802;
        v60 = v53;
        __int16 v61 = 2048;
        unint64_t v62 = v57;
        __int16 v63 = 2048;
        unint64_t v64 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%@ : Req - %04llX State - %04llX. Conditions did not pass.",  buf,  0x20u);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      [v51 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : Req - %04llX State - %04llX. Conditions did not pass.", v52, v57, v45, v55 category msg];
    }
  }

  return v46 == 0;
}

- (void)applyContainerOverride:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[SDContainer applyContainerOverride:]", "SDContainer.m", 92, "0 && \"Must use a concrete subclass\"");
}

- (void)updateContainerWithOverride
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 capOverride]);

    if (v6)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 capOverride]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

      if (v10) {
        goto LABEL_6;
      }
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 capOverride]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 stringByReplacingOccurrencesOfString:@" task" withString:&stru_10008D288]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v14]);

      if (v10) {
        goto LABEL_6;
      }
      os_activity_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 capOverride]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 stringByReplacingOccurrencesOfString:@" collection" withString:&stru_10008D288]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v18]);

      if (v10)
      {
LABEL_6:
        if ((-[SDContainer runtimeChecks](self, "runtimeChecks") & 0x800) != 0)
        {
          uint64_t v20 = sub_1000241E4();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ : ENABLED", buf, 0xCu);
          }

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          objc_msgSend( v23,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
            "com.apple.sysdiagnose",
            "containers");

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          [v24 stdoutWrite:@"%@ : ENABLED", v25];

          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          [v26 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : ENABLED", v27 category msg];

          -[SDContainer setRuntimeChecks:]( self,  "setRuntimeChecks:",  -[SDContainer runtimeChecks](self, "runtimeChecks") ^ 0x800);
        }

        uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v19);
        if ((objc_opt_isKindOfClass(v10, v28) & 1) != 0
          && ![v10 caseInsensitiveCompare:@"disable"])
        {
          -[SDContainer setRuntimeChecks:](self, "setRuntimeChecks:", 2048LL);
          v31 = sub_1000241E4();
          unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@ : DISABLED", buf, 0xCu);
          }

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          objc_msgSend( v34,  "stdoutWrite:",  @"Subsystem: %s; Category: %s; Log: ",
            "com.apple.sysdiagnose",
            "containers");

          int v35 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          [v35 stdoutWrite:@"%@ : DISABLED", v36];

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          [v37 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : DISABLED", v38 category msg];
        }

        else
        {
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary, v29);
          if ((objc_opt_isKindOfClass(v10, v30) & 1) != 0) {
            -[SDContainer applyContainerOverride:](self, "applyContainerOverride:", v10);
          }
        }
      }
    }
  }

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSMutableArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
}

- (unint64_t)runtimeChecks
{
  return self->_runtimeChecks;
}

- (void)setRuntimeChecks:(unint64_t)a3
{
  self->_runtimeChecks = a3;
}

- (SDRuntimeFlagDelegate)runtimeFlagDelegate
{
  return (SDRuntimeFlagDelegate *)objc_loadWeakRetained((id *)&self->_runtimeFlagDelegate);
}

- (void)setRuntimeFlagDelegate:(id)a3
{
}

- (OS_os_activity)executionActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExecutionActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end