@interface WFLoggerOsLog
+ (unsigned)convertWFLogLevelToOsLogLevel:(unint64_t)a3;
+ (void)WFLogOsLog:(unint64_t)a3 cfStrMsg:(__CFString *)a4;
- (NSString)getProfileFilePath;
- (id)formatOsLogProfile:(id)a3 levelEnabled:(id)a4 levelPersist:(id)a5 ttlDays:(id)a6 privacy:(id)a7;
- (id)getLevelEnabled:(id)a3 category:(id)a4;
- (id)getLevelPersist:(id)a3 category:(id)a4;
- (id)getLogLifespanInDays;
- (id)getPrivacy:(id)a3 category:(id)a4;
- (id)getTtlDays:(id)a3 category:(id)a4;
- (id)init:(id)a3 subSystem:(__CFString *)a4 category:(__CFString *)a5 logLifespanInDays:(unint64_t)a6 logLevel:(unint64_t)a7 logPrivacy:(unint64_t)a8 dispatchQueue:(id)a9;
- (id)mapLogLevelEnum:(unint64_t)a3;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (unint64_t)mapLogLevelStr:(id)a3;
- (unsigned)convertLogLevel:(unint64_t)a3;
- (unsigned)doesProfileExist:(id)a3;
- (unsigned)setLevelEnabled:(id)a3 category:(id)a4 value:(id)a5;
- (unsigned)setLevelPersist:(id)a3 category:(id)a4 value:(id)a5;
- (unsigned)setPrivacy:(id)a3 category:(id)a4 value:(id)a5;
- (unsigned)setTtlDays:(id)a3 category:(id)a4 value:(id)a5;
- (unsigned)writeDictToFile:(id)a3 idStr:(id)a4;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)createOsLogProfile;
- (void)dealloc;
- (void)setLogLevelEnable:(unint64_t)a3;
- (void)setLogLevelPersist:(unint64_t)a3;
- (void)setLogLifespanInDays:(id)a3;
- (void)setLogPrivacy:(unint64_t)a3;
- (void)setMaxSizeInKb:(unint64_t)a3;
@end

@implementation WFLoggerOsLog

- (id)init:(id)a3 subSystem:(__CFString *)a4 category:(__CFString *)a5 logLifespanInDays:(unint64_t)a6 logLevel:(unint64_t)a7 logPrivacy:(unint64_t)a8 dispatchQueue:(id)a9
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___WFLoggerOsLog;
  v15 = -[WFLoggerOsLog init](&v35, sel_init);
  v16 = v15;
  if (a5 && a4 && a3 && v15)
  {
    v15->super._ctxt = (WFLogger *)a3;
    v15->_subSystem = a4;
    v15->_category = a5;
    v15->super._dispatchQueue = (OS_dispatch_queue *)a9;
    v15->_osLog = (OS_os_log *)MEMORY[0x1895F8DA0];
    v17 = -[WFLoggerOsLog getProfileFilePath](v15, "getProfileFilePath");
    if (!-[WFLoggerOsLog doesProfileExist:](v16, "doesProfileExist:", v17)) {
      -[WFLoggerOsLog createOsLogProfile](v16, "createOsLogProfile");
    }
    if (a6 >= 0x1E) {
      unint64_t v18 = 30LL;
    }
    else {
      unint64_t v18 = a6;
    }
    v16->_logLifeSpanInDays = v18;
    -[WFLoggerOsLog setLogLifespanInDays:]( v16,  "setLogLifespanInDays:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:"));
    -[WFLoggerOsLog setLogLevelEnable:](v16, "setLogLevelEnable:", a7);
    -[WFLoggerOsLog setLogLevelPersist:](v16, "setLogLevelPersist:", a7);
    -[WFLoggerOsLog setLogPrivacy:](v16, "setLogPrivacy:", a8);
    v16->_osLog = os_log_create( (const char *)-[__CFString UTF8String](v16->_subSystem, "UTF8String"),  (const char *)-[__CFString UTF8String](v16->_category, "UTF8String"));
    if (-[WFLoggerOsLog doesProfileExist:](v16, "doesProfileExist:", v17))
    {
      v19 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v17];
      int v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "isReadableFileAtPath:", v17);
      int v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "isWritableFileAtPath:", v17);
      context = (void *)MEMORY[0x1895BA820]();
      v22 = (void *)NSString;
      uint64_t v23 = -[NSString UTF8String](v17, "UTF8String");
      if (v20) {
        v24 = "YES";
      }
      else {
        v24 = "NO";
      }
      if (v21) {
        v25 = "YES";
      }
      else {
        v25 = "NO";
      }
      uint64_t v26 = objc_msgSend( v22,  "stringWithFormat:",  @"OSLog Profile is %s. Readable:%s Writable:%s Custom settings: levelEnabled:%s levelPersist:%s ttlDays:%d privacy:%s",  v23,  v24,  v25,  objc_msgSend( -[WFLoggerOsLog getLevelEnabled:category:]( v16,  "getLevelEnabled:category:",  v19,  @"DEFAULT-OPTIONS"),  "UTF8String"),  objc_msgSend( -[WFLoggerOsLog getLevelPersist:category:]( v16,  "getLevelPersist:category:",  v19,  @"DEFAULT-OPTIONS"),  "UTF8String"),  objc_msgSend( -[WFLoggerOsLog getTtlDays:category:](v16, "getTtlDays:category:", v19, @"DEFAULT-OPTIONS"),  "unsignedIntValue"),  objc_msgSend( -[WFLoggerOsLog getPrivacy:category:](v16, "getPrivacy:category:", v19, @"DEFAULT-OPTIONS"),  "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v26;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_autoreleasePoolPop(context);
      v27 = (void *)MEMORY[0x1895BA820]();
      uint64_t v28 = [NSString stringWithFormat:@"%@", v19];
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v28;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v27);
      v16->_currentLevel = -[WFLoggerOsLog getLogLevelEnable](v16, "getLogLevelEnable");
    }

    else
    {
      v31 = (void *)MEMORY[0x1895BA820]();
      uint64_t v32 = objc_msgSend( NSString,  "stringWithFormat:",  @"OSLog Profile %s doesn't exist",  -[NSString UTF8String](v17, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v32;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v31);
    }
  }

  else
  {
    v29 = (void *)MEMORY[0x1895BA820]();
    uint64_t v30 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Failed to init: %p %p %p %p",  "-[WFLoggerOsLog init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:]",  v16,  a3,  a4,  a5);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v30;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v29);

    return 0LL;
  }

  return v16;
}

- (void)dealloc
{
  osLog = self->_osLog;
  if (osLog)
  {

    self->_osLog = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WFLoggerOsLog;
  -[WFLoggerOsLog dealloc](&v4, sel_dealloc);
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unsigned __int8 v11 = -[WFLoggerOsLog convertLogLevel:](self, "convertLogLevel:");
  if (self->_currentLevel <= a3 && self->_category)
  {
    os_log_type_t v12 = v11;
    v13 = (void *)[objc_alloc(NSString) initWithUTF8String:a5];
    v14 = (void *)[objc_alloc(NSString) initWithFormat:v13 arguments:a6];
    osLog = self->_osLog;
    BOOL v16 = os_log_type_enabled(osLog, v12);
    if (a4 == 2)
    {
      if (v16)
      {
        int v18 = 138543362;
        v19 = v14;
        v17 = "%{public}@";
LABEL_8:
        _os_log_impl(&dword_187EBF000, osLog, v12, v17, (uint8_t *)&v18, 0xCu);
      }
    }

    else if (v16)
    {
      int v18 = 138477827;
      v19 = v14;
      v17 = "%{private}@";
      goto LABEL_8;
    }
  }

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  os_log_type_t v9 = -[WFLoggerOsLog convertLogLevel:](self, "convertLogLevel:");
  if (self->_currentLevel <= a3 && self->_category)
  {
    os_log_type_t v10 = v9;
    osLog = self->_osLog;
    BOOL v12 = os_log_type_enabled(osLog, v9);
    if (a4 == 2)
    {
      if (!v12) {
        return;
      }
      int v14 = 138543362;
      v15 = a5;
      v13 = "%{public}@";
    }

    else
    {
      if (!v12) {
        return;
      }
      int v14 = 138477827;
      v15 = a5;
      v13 = "%{private}@";
    }

    _os_log_impl(&dword_187EBF000, osLog, v10, v13, (uint8_t *)&v14, 0xCu);
  }

+ (void)WFLogOsLog:(unint64_t)a3 cfStrMsg:(__CFString *)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  os_log_type_t v5 = +[WFLoggerOsLog convertWFLogLevelToOsLogLevel:]( &OBJC_CLASS___WFLoggerOsLog,  "convertWFLogLevelToOsLogLevel:",  a3);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], v5))
  {
    int v6 = 138543362;
    v7 = a4;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], v5, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

+ (unsigned)convertWFLogLevelToOsLogLevel:(unint64_t)a3
{
  unint64_t v3 = 0x111000010200uLL >> (8 * a3);
  if (a3 >= 6) {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unsigned)convertLogLevel:(unint64_t)a3
{
  return +[WFLoggerOsLog convertWFLogLevelToOsLogLevel:]( &OBJC_CLASS___WFLoggerOsLog,  "convertWFLogLevelToOsLogLevel:",  a3);
}

- (id)formatOsLogProfile:(id)a3 levelEnabled:(id)a4 levelPersist:(id)a5 ttlDays:(id)a6 privacy:(id)a7
{
  unsigned __int8 v11 = (void *)objc_msgSend(MEMORY[0x189603FC8], "dictionary", a3, a4, a5, a6);
  BOOL v12 = (void *)[MEMORY[0x189603FC8] dictionary];
  v13 = (void *)[MEMORY[0x189603FC8] dictionary];
  [v13 setObject:a4 forKeyedSubscript:@"Enable"];
  [v13 setObject:a5 forKeyedSubscript:@"Persist"];
  [v12 setObject:v13 forKeyedSubscript:@"Level"];
  [v12 setObject:0 forKeyedSubscript:@"TTL"];
  [v12 setObject:a7 forKeyedSubscript:@"Default-Privacy-Setting"];
  objc_msgSend( v12,  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"Enable-Oversize-Messages");
  objc_msgSend( v11,  "setObject:forKeyedSubscript:",  v12,  objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(a3, "UTF8String")));
  return v11;
}

- (id)getLevelEnabled:(id)a3 category:(id)a4
{
  if (a3 && a4) {
    return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", a4),  "objectForKeyedSubscript:",  @"Level"),  "objectForKeyedSubscript:",  @"Enable");
  }
  else {
    return 0LL;
  }
}

- (id)getLevelPersist:(id)a3 category:(id)a4
{
  if (a3 && a4) {
    return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", a4),  "objectForKeyedSubscript:",  @"Level"),  "objectForKeyedSubscript:",  @"Persist");
  }
  else {
    return 0LL;
  }
}

- (id)getTtlDays:(id)a3 category:(id)a4
{
  if (a3 && a4) {
    return (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", a4),  "objectForKeyedSubscript:",  @"TTL"),  "objectForKeyedSubscript:",  @"Default");
  }
  else {
    return 0LL;
  }
}

- (id)getPrivacy:(id)a3 category:(id)a4
{
  if (a3 && a4) {
    return (id)objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", a4),  "objectForKeyedSubscript:",  @"Default-Privacy-Setting");
  }
  else {
    return 0LL;
  }
}

- (unsigned)writeDictToFile:(id)a3 idStr:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned __int8 v5 = 1;
  if ((objc_msgSend( a3,  "writeToFile:atomically:",  -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath"),  1) & 1) == 0)
  {
    int v6 = (void *)MEMORY[0x1895BA820]();
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s NOT updated", objc_msgSend(a4, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v6);
    return 0;
  }

  return v5;
}

- (unsigned)setLevelEnabled:(id)a3 category:(id)a4 value:(id)a5
{
  if (a3
    && a4
    && a5
    && (id v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:]( self,  "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:",  a4,  a5,  -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:"),  -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4),  -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0LL)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, @"LevelEnabled");
  }

  else
  {
    return 0;
  }

- (unsigned)setLevelPersist:(id)a3 category:(id)a4 value:(id)a5
{
  if (a3
    && a4
    && a5
    && (id v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:]( self,  "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:",  a4,  -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"),  a5,  -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4),  -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0LL)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, @"LevelPersist");
  }

  else
  {
    return 0;
  }

- (unsigned)setTtlDays:(id)a3 category:(id)a4 value:(id)a5
{
  if (a3
    && a4
    && a5
    && (id v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:]( self,  "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:",  a4,  -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"),  -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", a3, a4),  a5,  -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", a3, a4))) != 0LL)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, @"TtlDays");
  }

  else
  {
    return 0;
  }

- (unsigned)setPrivacy:(id)a3 category:(id)a4 value:(id)a5
{
  if (a3
    && a4
    && a5
    && (id v6 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:]( self,  "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:",  a4,  -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:"),  -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", a3, a4),  -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", a3, a4),  a5)) != 0LL)
  {
    return -[WFLoggerOsLog writeDictToFile:idStr:](self, "writeDictToFile:idStr:", v6, @"Privacy");
  }

  else
  {
    return 0;
  }

- (void)createOsLogProfile
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (-[WFLoggerBase WFIsInternalInstall](self, "WFIsInternalInstall")) {
    unint64_t v3 = @"Debug";
  }
  else {
    unint64_t v3 = @"Default";
  }
  id v4 = -[WFLoggerOsLog formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:]( self,  "formatOsLogProfile:levelEnabled:levelPersist:ttlDays:privacy:",  @"DEFAULT-OPTIONS",  v3,  v3,  [MEMORY[0x189607968] numberWithInt:0],  @"Public");
  unsigned __int8 v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    id v6 = (void *)MEMORY[0x1895BA820]();
    uint64_t v7 = objc_msgSend( NSString,  "stringWithFormat:",  @"File %s already exists",  -[NSString UTF8String](v5, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v7;
      uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
LABEL_19:
      _os_log_impl(&dword_187EBF000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    if (v4) {
      id v9 = v4;
    }
    else {
      id v9 = (id)MEMORY[0x189604A60];
    }
    if (objc_msgSend( (id)objc_msgSend( MEMORY[0x1896079E8],  "dataWithPropertyList:format:options:error:",  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithDictionary:", v9),  200,  0,  0),  "writeToFile:options:error:",  v5,  1,  &v14))
    {
      id v6 = (void *)MEMORY[0x1895BA820]();
      uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"File %s created with defaults",  -[NSString UTF8String](v5, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v10;
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        goto LABEL_19;
      }
    }

    else
    {
      if (v14)
      {
        uint64_t v11 = (void *)MEMORY[0x1895BA820]();
        uint64_t v12 = [NSString stringWithFormat:@"%@", v14];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v12;
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v11);
      }

      id v6 = (void *)MEMORY[0x1895BA820]();
      uint64_t v13 = objc_msgSend( NSString,  "stringWithFormat:",  @"File NOT created %s",  -[NSString UTF8String](v5, "UTF8String"));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v13;
        uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        goto LABEL_19;
      }
    }
  }

  objc_autoreleasePoolPop(v6);
}

- (NSString)getProfileFilePath
{
  unint64_t v3 = (void *)[NSString stringWithFormat:@"%@", @"/Library/Preferences/Logging/Subsystems/"];
  return (NSString *)[v3 stringByAppendingPathComponent:objc_msgSend( NSString, "stringWithFormat:", @"%s.plist", -[__CFString UTF8String](self->_subSystem, "UTF8String"))];
}

- (unsigned)doesProfileExist:(id)a3
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "fileExistsAtPath:", a3);
}

- (void)setLogLifespanInDays:(id)a3
{
  unsigned __int8 v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v5];
    -[WFLoggerOsLog setTtlDays:category:value:](self, "setTtlDays:category:value:", v6, @"DEFAULT-OPTIONS", a3);
  }

- (id)getLogLifespanInDays
{
  unint64_t v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3)) {
    return 0LL;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v3];
  id v5 = -[WFLoggerOsLog getTtlDays:category:](self, "getTtlDays:category:", v4, @"DEFAULT-OPTIONS");

  return v5;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  id v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v5];
    id v8 = (id)v6;
    if (a3 == 2) {
      uint64_t v7 = @"Public";
    }
    else {
      uint64_t v7 = @"Private";
    }
    -[WFLoggerOsLog setPrivacy:category:value:](self, "setPrivacy:category:value:", v6, @"DEFAULT-OPTIONS", v7);
  }

- (unint64_t)getLogPrivacy
{
  unint64_t v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3)) {
    return 2LL;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v3];
  if (objc_msgSend( -[WFLoggerOsLog getPrivacy:category:](self, "getPrivacy:category:", v4, @"DEFAULT-OPTIONS"),  "isEqualToString:",  @"Public")) {
    unint64_t v5 = 2LL;
  }
  else {
    unint64_t v5 = 1LL;
  }

  return v5;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  unint64_t v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v5];
    -[WFLoggerOsLog setLevelEnabled:category:value:]( self,  "setLevelEnabled:category:value:",  v6,  @"DEFAULT-OPTIONS",  -[WFLoggerOsLog mapLogLevelEnum:](self, "mapLogLevelEnum:", a3));
    self->_currentLevel = -[WFLoggerOsLog getLogLevelEnable](self, "getLogLevelEnable");
  }

- (unint64_t)getLogLevelEnable
{
  unint64_t v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3)) {
    return 3LL;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v3];
  unint64_t v5 = -[WFLoggerOsLog mapLogLevelStr:]( self,  "mapLogLevelStr:",  -[WFLoggerOsLog getLevelEnabled:category:](self, "getLevelEnabled:category:", v4, @"DEFAULT-OPTIONS"));

  return v5;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  unint64_t v5 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v5))
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v5];
    -[WFLoggerOsLog setLevelPersist:category:value:]( self,  "setLevelPersist:category:value:",  v6,  @"DEFAULT-OPTIONS",  -[WFLoggerOsLog mapLogLevelEnum:](self, "mapLogLevelEnum:", a3));
  }

- (unint64_t)getLogLevelPersist
{
  unint64_t v3 = -[WFLoggerOsLog getProfileFilePath](self, "getProfileFilePath");
  if (!-[WFLoggerOsLog doesProfileExist:](self, "doesProfileExist:", v3)) {
    return 3LL;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithContentsOfFile:v3];
  unint64_t v5 = -[WFLoggerOsLog mapLogLevelStr:]( self,  "mapLogLevelStr:",  -[WFLoggerOsLog getLevelPersist:category:](self, "getLevelPersist:category:", v4, @"DEFAULT-OPTIONS"));

  return v5;
}

- (id)mapLogLevelEnum:(unint64_t)a3
{
  unint64_t v3 = @"Default";
  if (a3 == 2) {
    unint64_t v3 = @"Info";
  }
  if (a3 == 1) {
    return @"Debug";
  }
  else {
    return (id)v3;
  }
}

- (unint64_t)mapLogLevelStr:(id)a3
{
  if ([a3 isEqualToString:@"Debug"]) {
    return 1LL;
  }
  if ([a3 isEqualToString:@"Info"]) {
    return 2LL;
  }
  [a3 isEqualToString:@"Default"];
  return 3LL;
}

- (void)setMaxSizeInKb:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v3 = (void *)MEMORY[0x1895BA820](self, a2, a3);
  uint64_t v4 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerOsLog setMaxSizeInKb:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v3);
}

- (unint64_t)getMaxFileSizeInMB
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x1895BA820](self, a2);
  uint64_t v3 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerOsLog getMaxFileSizeInMB]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v2);
  return 0LL;
}

@end