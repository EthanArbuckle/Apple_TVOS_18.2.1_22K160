@interface WFLogger
+ (id)sharedWFLoggerSingleton;
- (NSNumber)getLogLifespanInDays;
- (WFLogger)init;
- (id)loggerBase;
- (unint64_t)getDestination;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (void)WFLog:(unint64_t)a3 message:(const char *)a4;
- (void)dump;
- (void)setDestinationCircularBuffer;
- (void)setDestinationFile:(__CFString *)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9;
- (void)setDestinationFileLocation:(__CFString *)a3 fileNamePrefix:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10;
- (void)setDestinationOsLog:(__CFString *)a3 category:(__CFString *)a4 logLifespanInDays:(unint64_t)a5 logLevel:(unint64_t)a6 logPrivacy:(unint64_t)a7;
@end

@implementation WFLogger

+ (id)sharedWFLoggerSingleton
{
  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  id v4 = (id)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    id v4 = objc_alloc_init((Class)a1);
    _sharedWFLoggerSingleton = (uint64_t)v4;
  }

  objc_sync_exit(v3);
  return v4;
}

- (WFLogger)init
{
  result = (WFLogger *)_sharedWFLoggerSingleton;
  if (!_sharedWFLoggerSingleton)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___WFLogger;
    id v4 = -[WFLogger init](&v6, sel_init);
    if (v4)
    {
      v5 = v4;
      v4->_destination = 1LL;
      v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wflogger", 0LL);
      -[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]( v5,  "setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:",  @"com.apple.WiFiPolicy",  &stru_18A170410,  7LL,  3LL,  2LL);
      _sharedWFLoggerSingleton = (uint64_t)v5;
      v5->_wflRunningOnWatchClassDevice = MGGetSInt32Answer() == 6;
      v5->_wflEnableDualLoggingOnWatchClassDevice = 1;
    }

    return (WFLogger *)_sharedWFLoggerSingleton;
  }

  return result;
}

- (unint64_t)getDestination
{
  return self->_destination;
}

- (id)loggerBase
{
  return self->_loggerBase;
}

- (void)setDestinationCircularBuffer
{
  if (self->_destination != 4)
  {
    loggerBase = self->_loggerBase;
    if (loggerBase)
    {

      self->_loggerBase = 0LL;
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___WFLoggerCircularBuffer);
    if (v4)
    {
      self->_loggerBase = &v4->super;
      self->_destination = 4LL;
    }
  }

- (void)setDestinationFile:(__CFString *)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v16 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s filePath is empty",  "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v16, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else if (self->_destination != 3 {
         || (loggerBase = self->_loggerBase) == 0LL
  }
         || (v18 = (const __CFString *)-[WFLoggerBase getLogFilePath](loggerBase, "getLogFilePath")) == 0LL
         || CFStringCompare(a3, v18, 4uLL))
  {
    v19 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s Logging destination will change to file: %s",  "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]",  -[__CFString UTF8String](a3, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v19, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    if (self->_wflRunningOnWatchClassDevice)
    {
      if (!self->_wflEnableDualLoggingOnWatchClassDevice)
      {
        v20 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured",  "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]");
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v20, "UTF8String")),  "UTF8String");
          *(_DWORD *)buf = 136446210;
          uint64_t v26 = v21;
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_18A16DA10;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    unsigned __int8 v24 = a6;
    block[8] = a7;
    block[9] = a8;
    block[10] = a9;
    dispatch_sync(dispatchQueue, block);
  }

void __109__WFLogger_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  v3 = -[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]( objc_alloc(&OBJC_CLASS___WFLoggerFile),  "initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:",  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(*(void *)(a1 + 32) + 32LL));
  if (v3)
  {
    id v4 = v3;
    v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (v5)
    {

      *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
    }

    -[WFLoggerFile schedule:](v4, "schedule:", 1LL);
    *(void *)(*(void *)(a1 + 32) + 8LL) = v4;
    *(void *)(*(void *)(a1 + 32) + 16LL) = 3LL;
    objc_super v6 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s Logging destination changed to file: %s",  "-[WFLogger setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespan InDays:]_block_invoke",  objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v6, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

- (void)setDestinationFileLocation:(__CFString *)a3 fileNamePrefix:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v17 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s dirPath is empty",  "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:max FileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      return;
    }
LABEL_6:
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v17, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    return;
  }

  if (-[__CFString isEmpty](a4, "isEmpty"))
  {
    v17 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s fileNamePrefix is empty",  "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:max FileSizeInMB:logLifespanInDays:]");
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      return;
    }
    goto LABEL_6;
  }

  if (self->_destination != 3
    || (loggerBase = self->_loggerBase) == 0LL
    || (v19 = (__CFString *)-[WFLoggerBase getLogDirPath](loggerBase, "getLogDirPath"),
        uint64_t v20 = -[WFLoggerBase getLogFileNamePrefix](self->_loggerBase, "getLogFileNamePrefix"),
        !v19)
    || (uint64_t v21 = (__CFString *)v20) == 0LL
    || (-[__CFString isEmpty](v19, "isEmpty") & 1) != 0
    || (-[__CFString isEmpty](v21, "isEmpty") & 1) != 0
    || CFStringCompare(a3, v19, 4uLL)
    || CFStringCompare(a4, v21, 4uLL))
  {
    v22 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s Logging destination will change to directory: %s FileNamePrefix: %s",  "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:max FileSizeInMB:logLifespanInDays:]",  -[__CFString UTF8String](a3, "UTF8String"),  -[__CFString UTF8String](a4, "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v22, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    if (self->_wflRunningOnWatchClassDevice && !self->_wflEnableDualLoggingOnWatchClassDevice)
    {
      v23 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Dual logging suppressed on watch class device. WiFi logs will not be present in the system log while file logging is configured",  "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:m axFileSizeInMB:logLifespanInDays:]");
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v23, "UTF8String")),  "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v29 = v24;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke;
    block[3] = &unk_18A16DA38;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    unsigned __int8 v27 = a7;
    block[8] = a6;
    block[9] = a8;
    block[10] = a9;
    void block[11] = a10;
    dispatch_sync(dispatchQueue, block);
  }

void __132__WFLogger_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  v3 = -[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:dispatchQueue:]( objc_alloc(&OBJC_CLASS___WFLoggerFile),  "initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLif espanInDays:dispatchQueue:",  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(*(void *)(a1 + 32) + 32LL));
  if (v3)
  {
    id v4 = v3;
    v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (v5)
    {

      *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
    }

    -[WFLoggerFile schedule:](v4, "schedule:", 1LL);
    *(void *)(*(void *)(a1 + 32) + 8LL) = v4;
    *(void *)(*(void *)(a1 + 32) + 16LL) = 3LL;
    objc_super v6 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s Logging destination changed to directory: %s FileNamePrefix: %s",  "-[WFLogger setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxF ileSizeInMB:logLifespanInDays:]_block_invoke",  objc_msgSend(*(id *)(a1 + 40), "UTF8String"),  objc_msgSend(*(id *)(a1 + 48), "UTF8String"));
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v6, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

- (void)setDestinationOsLog:(__CFString *)a3 category:(__CFString *)a4 logLifespanInDays:(unint64_t)a5 logLevel:(unint64_t)a6 logPrivacy:(unint64_t)a7
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (-[__CFString isEmpty](a3, "isEmpty"))
  {
    v13 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s subSystem is empty",  "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v13, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else if (self->_destination != 2)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke;
    block[3] = &unk_18A16DA60;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a7;
    dispatch_sync(dispatchQueue, block);
  }

id __79__WFLogger_setDestinationOsLog_category_logLifespanInDays_logLevel_logPrivacy___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (v2) {
    [v2 stopWatchingLogFile];
  }
  id result = -[WFLoggerOsLog init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:]( objc_alloc(&OBJC_CLASS___WFLoggerOsLog),  "init:subSystem:category:logLifespanInDays:logLevel:logPrivacy:dispatchQueue:",  *(void *)(*(void *)(a1 + 32) + 32LL));
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 8))
    {
      objc_super v6 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s Logging destination changed to system wide logging (os_log)",  "-[WFLogger setDestinationOsLog:category:logLifespanInDays:logLevel:logPrivacy:]_block_invoke");
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v8 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v6, "UTF8String")),  "UTF8String");
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
      uint64_t v5 = *(void *)(a1 + 32);
    }

    *(void *)(v5 + 8) = v4;
    *(void *)(*(void *)(a1 + 32) + 16LL) = 2LL;
    id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) getLogPrivacy];
    *(void *)(*(void *)(a1 + 32) + 24LL) = result;
  }

  return result;
}

- (void)WFLog:(unint64_t)a3 message:(const char *)a4
{
  if (self->_loggerBase && self->_destination != 1)
  {
    uint64_t v22 = 0LL;
    va_list v23 = (va_list)&v24;
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], a4, 0x8000100u);
    if (v8 || (uint64_t v8 = CFStringCreateWithCString(v7, a4, 0)) != 0LL)
    {
      if (self->_destination == 2)
      {
        CFStringRef v9 = CFStringCreateWithFormatAndArguments(v7, 0LL, v8, v23);
        v20[3] = (uint64_t)v9;
      }

      else
      {
        gettimeofday(&v17, 0LL);
        localtime_r(&v17.tv_sec, &v18);
        Mutable = CFStringCreateMutable(v7, 0LL);
        v20[3] = (uint64_t)Mutable;
        CFStringAppendFormat( Mutable,  0LL,  @"%02d/%02d/%04d %2d:%02d:%02d.%03d ",  (v18.tm_mon + 1),  v18.tm_mday,  (v18.tm_year + 1900),  v18.tm_hour,  v18.tm_min,  v18.tm_sec,  (v17.tv_usec / 1000));
        CFStringAppendFormatAndArguments((CFMutableStringRef)v20[3], 0LL, v8, v23);
      }

      uint64_t v11 = MEMORY[0x1895F87A8];
      if (self->_destination != 2
        && (!self->_wflRunningOnWatchClassDevice || self->_wflEnableDualLoggingOnWatchClassDevice))
      {
        *(void *)&v18.tm_sec = 0LL;
        *(void *)&v18.tm_hour = &v18;
        *(void *)&v18.tm_mon = 0x2020000000LL;
        *(void *)&v18.tm_wday = 0LL;
        CFStringRef v12 = CFStringCreateWithFormatAndArguments(v7, 0LL, v8, v23);
        *(void *)(*(void *)&v18.tm_hour + 24LL) = v12;
        dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
        block[0] = v11;
        block[1] = 3221225472LL;
        block[2] = __26__WFLogger_WFLog_message___block_invoke;
        block[3] = &unk_18A16DA88;
        block[4] = &v18;
        block[5] = a3;
        dispatch_async(dispatchQueue, block);
        _Block_object_dispose(&v18, 8);
      }

      CFRelease(v8);
      v14 = (dispatch_queue_s *)self->_dispatchQueue;
      v15[0] = v11;
      v15[1] = 3221225472LL;
      v15[2] = __26__WFLogger_WFLog_message___block_invoke_2;
      v15[3] = &unk_18A16DAB0;
      v15[4] = self;
      v15[5] = &v19;
      v15[6] = a3;
      dispatch_async(v14, v15);
    }

    _Block_object_dispose(&v19, 8);
  }

  objc_sync_exit(self);
}

void __26__WFLogger_WFLog_message___block_invoke(uint64_t a1)
{
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

void __26__WFLogger_WFLog_message___block_invoke_2(void *a1)
{
  v2 = *(const void **)(*(void *)(a1[5] + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = 0LL;
  }

- (void)dump
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    -[WFLoggerBase dump](loggerBase, "dump");
  }
}

- (NSNumber)getLogLifespanInDays
{
  id result = (NSNumber *)self->_loggerBase;
  if (result) {
    return (NSNumber *)-[NSNumber getLogLifespanInDays](result, "getLogLifespanInDays");
  }
  return result;
}

- (unint64_t)getLogPrivacy
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return -[WFLoggerBase getLogPrivacy](loggerBase, "getLogPrivacy");
  }
  else {
    return 1LL;
  }
}

- (unint64_t)getLogLevelEnable
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return -[WFLoggerBase getLogLevelEnable](loggerBase, "getLogLevelEnable");
  }
  else {
    return 3LL;
  }
}

- (unint64_t)getLogLevelPersist
{
  loggerBase = self->_loggerBase;
  if (loggerBase) {
    return -[WFLoggerBase getLogLevelPersist](loggerBase, "getLogLevelPersist");
  }
  else {
    return 3LL;
  }
}

- (unint64_t)getMaxFileSizeInMB
{
  unint64_t result = (unint64_t)self->_loggerBase;
  if (result) {
    return [(id)result getMaxFileSizeInMB];
  }
  return result;
}

@end