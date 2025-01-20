@interface WFLoggerFile
- (WFLoggerFile)initWithDirectoryPath:(id)a3 dirPath:(__CFString *)a4 fileNamePrefix:(__CFString *)a5 runLoopRef:(__CFRunLoop *)a6 runLoopMode:(__CFString *)a7 classC:(unsigned __int8)a8 dateFormatter:(__CFDateFormatter *)a9 maxFileSizeInMB:(unint64_t)a10 logLifespanInDays:(unint64_t)a11 dispatchQueue:(id)a12;
- (WFLoggerFile)initWithFilePath:(id)a3 filePath:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10 dispatchQueue:(id)a11;
- (__CFString)changeLogFile:(unsigned __int8)a3;
- (__CFString)createDateString;
- (__CFString)generateLogFileName;
- (__CFString)getLogDirPath;
- (__CFString)getLogFileNamePrefix;
- (__CFString)getLogFilePath;
- (id)getLogLifespanInDays;
- (id)mapLogLevelEnum:(unint64_t)a3;
- (unint64_t)getLogLevelEnable;
- (unint64_t)getLogLevelPersist;
- (unint64_t)getLogPrivacy;
- (unint64_t)getMaxFileSizeInMB;
- (unsigned)checkLogFileUpdate:(__CFString *)a3;
- (unsigned)doesLogFileExist:(__CFString *)a3;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)cleanStaleLogs;
- (void)createLogFile:(__CFString *)a3 fileClassC:(unsigned __int8)a4;
- (void)dealloc;
- (void)init:(id)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9;
- (void)removeLogFile:(const char *)a3 maxAge:(double)a4;
- (void)removeLogFilesFromDir:(const char *)a3;
- (void)rotateLogFile:(__CFString *)a3;
- (void)schedule:(unsigned __int8)a3;
- (void)setLogLevelEnable:(unint64_t)a3;
- (void)setLogLevelPersist:(unint64_t)a3;
- (void)setLogLifespanInDays:(id)a3;
- (void)setLogPrivacy:(unint64_t)a3;
- (void)setMaxFileSizeInMB:(unint64_t)a3;
- (void)startWatchingLogFile;
- (void)stopWatchingLogFile;
- (void)writeToFile:(unint64_t)a3 cfStrMsg:(__CFString *)a4;
@end

@implementation WFLoggerFile

- (__CFString)getLogFilePath
{
  return self->_logFilePath;
}

- (__CFString)getLogDirPath
{
  return self->_directoryPath;
}

- (__CFString)getLogFileNamePrefix
{
  return self->_fileNamePrefix;
}

- (id)mapLogLevelEnum:(unint64_t)a3
{
  if (a3 == 4) {
    return @"ERROR";
  }
  else {
    return @"NOTICE";
  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  v9 = (void *)[objc_alloc(NSString) initWithUTF8String:a5];
  id v10 = (id)[objc_alloc(NSString) initWithFormat:v9 arguments:a6];
  -[WFLoggerFile writeToFile:cfStrMsg:](self, "writeToFile:cfStrMsg:", a3, v10);
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
}

- (void)writeToFile:(unint64_t)a3 cfStrMsg:(__CFString *)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self->_filePtr)
  {
    SCPrint();
  }

  else
  {
    if (writeToFile_cfStrMsg__onceToken != -1) {
      dispatch_once(&writeToFile_cfStrMsg__onceToken, &__block_literal_global_6);
    }
    v5 = (void *)MEMORY[0x1895BA820]();
    uint64_t v6 = [NSString stringWithFormat:@"%@", a4];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v5);
  }

void __37__WFLoggerFile_writeToFile_cfStrMsg___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x1895BA820]();
  uint64_t v1 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s FAILED. _filePtr is nil",  "-[WFLoggerFile writeToFile:cfStrMsg:]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v3 = v1;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v0);
}

- (void)dealloc
{
  loggingTimer = self->_loggingTimer;
  if (loggingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)loggingTimer);
    dispatch_release((dispatch_object_t)self->_loggingTimer);
    self->_loggingTimer = 0LL;
  }

  filePtr = self->_filePtr;
  if (filePtr)
  {
    fclose(filePtr);
    self->_filePtr = 0LL;
  }

  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    CFRelease(logFilePath);
    self->_logFilePath = 0LL;
  }

  presetFilePath = self->_presetFilePath;
  if (presetFilePath)
  {
    CFRelease(presetFilePath);
    self->_presetFilePath = 0LL;
  }

  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0LL;
  }

  fileNamePrefix = self->_fileNamePrefix;
  if (fileNamePrefix)
  {
    CFRelease(fileNamePrefix);
    self->_fileNamePrefix = 0LL;
  }

  fileCreationDate = self->_fileCreationDate;
  if (fileCreationDate)
  {
    CFRelease(fileCreationDate);
    self->_fileCreationDate = 0LL;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WFLoggerFile;
  -[WFLoggerFile dealloc](&v10, sel_dealloc);
}

- (WFLoggerFile)initWithDirectoryPath:(id)a3 dirPath:(__CFString *)a4 fileNamePrefix:(__CFString *)a5 runLoopRef:(__CFRunLoop *)a6 runLoopMode:(__CFString *)a7 classC:(unsigned __int8)a8 dateFormatter:(__CFDateFormatter *)a9 maxFileSizeInMB:(unint64_t)a10 logLifespanInDays:(unint64_t)a11 dispatchQueue:(id)a12
{
  unsigned int v12 = a8;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___WFLoggerFile;
  v18 = -[WFLoggerFile init](&v24, sel_init);
  v19 = v18;
  if (a9 && a7 && a6 && a5 && a4 && a3 && v18)
  {
    v18->_presetFilePath = 0LL;
    v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v18->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a4);
    v19->_fileNamePrefix = (__CFString *)CFStringCreateCopy(v20, a5);
    v19->super._dispatchQueue = (OS_dispatch_queue *)a12;
    -[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]( v19,  "init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:",  a3,  a6,  a7,  v12,  a9,  a10,  a11);
  }

  else
  {
    v21 = (void *)MEMORY[0x1895BA820]();
    uint64_t v22 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Failed to init: %p %p %p %p %p %p %p",  "-[WFLoggerFile initWithDirectoryPath:dirPath:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxF ileSizeInMB:logLifespanInDays:dispatchQueue:]",  v19,  a3,  a4,  a5,  a6,  a7,  a9);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v22;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v21);

    return 0LL;
  }

  return v19;
}

- (WFLoggerFile)initWithFilePath:(id)a3 filePath:(__CFString *)a4 runLoopRef:(__CFRunLoop *)a5 runLoopMode:(__CFString *)a6 classC:(unsigned __int8)a7 dateFormatter:(__CFDateFormatter *)a8 maxFileSizeInMB:(unint64_t)a9 logLifespanInDays:(unint64_t)a10 dispatchQueue:(id)a11
{
  uint64_t v12 = a7;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___WFLoggerFile;
  v17 = -[WFLoggerFile init](&v25, sel_init);
  v18 = (void *)MEMORY[0x1895BA820]();
  if (a8 && a6 && a5 && a4 && a3 && v17)
  {
    v19 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v17->_presetFilePath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a4);
    v17->_directoryPath = (__CFString *)CFStringCreateCopy( v19,  (CFStringRef)-[__CFString stringByDeletingLastPathComponent]( a4,  "stringByDeletingLastPathComponent"));
    v17->super._dispatchQueue = (OS_dispatch_queue *)a11;
    objc_autoreleasePoolPop(v18);
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a4);
    v21 = (char *)calloc(1uLL, MaximumSizeOfFileSystemRepresentation);
    CFStringGetFileSystemRepresentation(a4, v21, MaximumSizeOfFileSystemRepresentation);
    if (v21)
    {
      uint64_t v22 = fopen(v21, "a");
      if (v22) {
        fclose(v22);
      }
      free(v21);
    }

    -[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]( v17,  "init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:",  a3,  a5,  a6,  v12,  a8,  a9,  a10);
  }

  else
  {
    uint64_t v23 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Failed to init: %p %p %p %p %p %p",  "-[WFLoggerFile initWithFilePath:filePath:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLife spanInDays:dispatchQueue:]",  v17,  a3,  a4,  a5,  a6,  a8);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v23;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v18);

    return 0LL;
  }

  return v17;
}

- (void)init:(id)a3 runLoopRef:(__CFRunLoop *)a4 runLoopMode:(__CFString *)a5 classC:(unsigned __int8)a6 dateFormatter:(__CFDateFormatter *)a7 maxFileSizeInMB:(unint64_t)a8 logLifespanInDays:(unint64_t)a9
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  self->super._ctxt = (WFLogger *)a3;
  self->_runLoopRef = a4;
  self->_runLoopMode = a5;
  self->_classC = a6;
  self->_privacy = 2LL;
  self->_level = 3LL;
  self->_fileCreationDate = 0LL;
  self->_dateFormatter = a7;
  self->_logLifespanInDays = (NSNumber *)[MEMORY[0x189607968] numberWithUnsignedLong:a9];
  unint64_t v11 = 5000000LL;
  if (a8 - 6 >= 0xFFFFFFFFFFFFFFFBLL) {
    unint64_t v11 = 1000000 * a8;
  }
  self->_maxFileSizeInBytes = v11;
  self->_timerInterval = 600LL;
  unint64_t v12 = -[NSNumber unsignedLongValue](self->_logLifespanInDays, "unsignedLongValue");
  self->_fileAgeOutInterval = 86400 * v12;
  v13 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: _timerInterval %lu  _fileAgeOutInterval %lu",  "-[WFLoggerFile init:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:]",  self->_timerInterval,  86400 * v12);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v13, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v14 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->super._dispatchQueue);
  self->_loggingTimer = v14;
  if (v14)
  {
    dispatch_set_context((dispatch_object_t)v14, self);
    dispatch_source_set_event_handler_f( (dispatch_source_t)self->_loggingTimer,  (dispatch_function_t)WFLoggerTimerTmoCallBack);
    loggingTimer = self->_loggingTimer;
    dispatch_time_t v16 = dispatch_time(0LL, 1000000000 * self->_timerInterval);
    dispatch_source_set_timer((dispatch_source_t)loggingTimer, v16, 1000000000 * self->_timerInterval, 0LL);
    self->_loggingTimerStarted = 1;
    dispatch_activate((dispatch_object_t)self->_loggingTimer);
  }

  else
  {
    v17 = (void *)MEMORY[0x1895BA820]();
    uint64_t v18 = [NSString stringWithFormat:@"FILE LOGGING TIMER NOT CREATED"];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v17);
  }

  if (-[WFLoggerFile checkLogFileUpdate:](self, "checkLogFileUpdate:", 0LL))
  {
    v19 = -[WFLoggerFile changeLogFile:](self, "changeLogFile:", self->_classC);
    if (v19) {
      CFRelease(v19);
    }
  }

- (void)schedule:(unsigned __int8)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (!self->_loggingTimerStarted)
    {
      loggingTimer = self->_loggingTimer;
      dispatch_time_t v5 = dispatch_time(0LL, 1000000000 * self->_timerInterval);
      dispatch_source_set_timer((dispatch_source_t)loggingTimer, v5, 1000000000 * self->_timerInterval, 0LL);
      self->_loggingTimerStarted = 1;
    }

    uint64_t v6 = "started";
  }

  else
  {
    dispatch_source_set_timer((dispatch_source_t)self->_loggingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    self->_loggingTimerStarted = 0;
    uint64_t v6 = "stopped";
  }

  v7 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: WFLoggerTimer %s.",  "-[WFLoggerFile schedule:]",  v6);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v7, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

- (__CFString)createDateString
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = CFDateFormatterCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  kCFDateFormatterShortStyle,  kCFDateFormatterMediumStyle);
  if (v3)
  {
    uint64_t v4 = v3;
    CFDateFormatterSetFormat(v3, @"MM-dd-yyyy__HH:mm:ss");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v2, v4, Current);
    CFRelease(v4);
    return StringWithAbsoluteTime;
  }

  else
  {
    uint64_t v8 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: null wifiLoggingDateFormatter",  "-[WFLoggerFile createDateString]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v8, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    return 0LL;
  }

- (__CFString)generateLogFileName
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[WFLoggerFile createDateString](self, "createDateString");
  uint64_t v4 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"%s/%s-%@%s",  -[__CFString UTF8String](self->_directoryPath, "UTF8String"),  -[__CFString UTF8String](self->_fileNamePrefix, "UTF8String"),  v3,  ".log");
  if (v3) {
    CFRelease(v3);
  }
  if (!v4)
  {
    uint64_t v6 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: null logFileName",  "-[WFLoggerFile generateLogFileName]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v6, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v4;
}

- (void)startWatchingLogFile
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  logFilePath = self->_logFilePath;
  if (logFilePath)
  {
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(logFilePath);
    dispatch_time_t v5 = (char *)calloc(1uLL, MaximumSizeOfFileSystemRepresentation);
    if (v5)
    {
      uint64_t v6 = v5;
      CFStringGetFileSystemRepresentation(self->_logFilePath, v5, MaximumSizeOfFileSystemRepresentation);
      int v7 = open(v6, 0x8000);
      if (v7 <= 0)
      {
        uint64_t v21 = (void *)[NSString stringWithFormat:@"%s: Invalid log file descriptor for %@", "-[WFLoggerFile startWatchingLogFile]", self->_logFilePath];
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v26 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v21, "UTF8String")),  "UTF8String");
        dispatch_time_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      }

      else
      {
        unsigned int v8 = v7;
        if (self->_eventSource)
        {
          uint64_t v9 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Already watching log file, resetting...",  "-[WFLoggerFile startWatchingLogFile]");
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v26 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v9, "UTF8String")),  "UTF8String");
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }

          dispatch_source_cancel((dispatch_source_t)self->_eventSource);
          dispatch_release((dispatch_object_t)self->_eventSource);
          self->_eventSource = 0LL;
          -[WFLoggerFile schedule:](self, "schedule:", 0LL);
        }

        uint64_t v10 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B88],  v8,  1uLL,  (dispatch_queue_t)self->super._dispatchQueue);
        self->_eventSource = v10;
        if (!v10)
        {
          uint64_t v18 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: dispatch_source_create failed",  "-[WFLoggerFile startWatchingLogFile]");
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v18, "UTF8String")),  "UTF8String");
            *(_DWORD *)buf = 136446210;
            uint64_t v26 = v19;
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }

          close(v8);
          goto LABEL_15;
        }

        -[WFLoggerFile schedule:](self, "schedule:", 1LL);
        eventSource = self->_eventSource;
        uint64_t v12 = MEMORY[0x1895F87A8];
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke;
        handler[3] = &unk_18A16CD60;
        handler[4] = self;
        dispatch_source_set_event_handler((dispatch_source_t)eventSource, handler);
        v13 = self->_eventSource;
        v22[0] = v12;
        v22[1] = 3221225472LL;
        v22[2] = __36__WFLoggerFile_startWatchingLogFile__block_invoke_55;
        v22[3] = &__block_descriptor_36_e5_v8__0l;
        unsigned int v23 = v8;
        dispatch_source_set_cancel_handler((dispatch_source_t)v13, v22);
        dispatch_resume((dispatch_object_t)self->_eventSource);
        v14 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Watching log file %s",  "-[WFLoggerFile startWatchingLogFile]",  v6);
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:
          free(v6);
          return;
        }

        uint64_t v15 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v14, "UTF8String")),  "UTF8String");
        *(_DWORD *)buf = 136446210;
        uint64_t v26 = v15;
        dispatch_time_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      }

      _os_log_impl(&dword_187EBF000, v16, v17, "%{public}s", buf, 0xCu);
      goto LABEL_15;
    }

    v20 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Memory alloc failed",  "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v20, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    v20 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: No log file specified",  "-[WFLoggerFile startWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
  }

void __36__WFLoggerFile_startWatchingLogFile__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v2 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Log file deletion detected, cleaning up and re-creating...",  "-[WFLoggerFile startWatchingLogFile]_block_invoke");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v2, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 120))
  {
    fclose(*(FILE **)(v3 + 120));
    *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  uint64_t v4 = (const void *)[(id)v3 changeLogFile:*(unsigned __int8 *)(v3 + 64)];
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __36__WFLoggerFile_startWatchingLogFile__block_invoke_55(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopWatchingLogFile
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (self->_eventSource)
  {
    uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Stopped watching log file",  "-[WFLoggerFile stopWatchingLogFile]");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0LL;
    -[WFLoggerFile schedule:](self, "schedule:", 0LL);
  }

- (unsigned)checkLogFileUpdate:(__CFString *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)MEMORY[0x1895BA820](self, a2);
  uint64_t v6 = [MEMORY[0x1896078A8] defaultManager];
  unsigned __int8 v7 = 1;
  if (a3)
  {
    if (self->_fileCreationDate)
    {
      unsigned int v8 = (void *)v6;
      if (-[WFLoggerFile doesLogFileExist:](self, "doesLogFileExist:", a3))
      {
        unint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileSize");
        if (v9 >= 0x4C4B41)
        {
          uint64_t v10 = (void *)[NSString stringWithFormat:@"%s File Size: %llu File path is %@", "-[WFLoggerFile checkLogFileUpdate:]", v9, a3];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            uint64_t v17 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v10, "UTF8String")),  "UTF8String");
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }

        uint64_t v11 = (void *)MEMORY[0x1895BA820]();
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "attributesOfItemAtPath:error:", a3, 0), "fileCreationDate");
        objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "date"), "timeIntervalSinceDate:", v12);
        objc_autoreleasePoolPop(v11);
      }
    }
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (__CFString)changeLogFile:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  presetFilePath = self->_presetFilePath;
  if (presetFilePath) {
    uint64_t v6 = (__CFString *)CFRetain(presetFilePath);
  }
  else {
    uint64_t v6 = -[WFLoggerFile generateLogFileName](self, "generateLogFileName");
  }
  unsigned __int8 v7 = v6;
  if (-[WFLoggerFile doesLogFileExist:](self, "doesLogFileExist:", v6) && self->_filePtr)
  {
    unsigned int v8 = (void *)[NSString stringWithFormat:@"Logfile exists. Given Path: %@ KnownPath: %@", v7, self->_logFilePath];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v8, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    -[WFLoggerFile rotateLogFile:](self, "rotateLogFile:", v7);
  }

  else
  {
    -[WFLoggerFile createLogFile:fileClassC:](self, "createLogFile:fileClassC:", v7, v3);
    unint64_t v9 = "YES";
    if (!(_DWORD)v3) {
      unint64_t v9 = "NO";
    }
    uint64_t v10 = (void *)[NSString stringWithFormat:@"%s: Current log file: %@, new log file: %@, class C file: %s", "-[WFLoggerFile changeLogFile:]", self->_logFilePath, v7, v9];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v13 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v10, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

  return v7;
}

- (void)cleanStaleLogs
{
}

- (void)removeLogFilesFromDir:(const char *)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = opendir(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    for (i = readdir(v5); i; i = readdir(v6))
    {
      snprintf(__str, 0x100uLL, "%s/%s", a3, i->d_name);
      if (strstr(__str, ".log")) {
        -[WFLoggerFile removeLogFile:maxAge:](self, "removeLogFile:maxAge:", __str, (double)self->_fileAgeOutInterval);
      }
    }

    closedir(v6);
  }

  else
  {
    unsigned int v8 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Can't open %s",  "-[WFLoggerFile removeLogFilesFromDir:]",  a3);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136446210;
      uint64_t v10 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v8, "UTF8String")),  "UTF8String");
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)__str, 0xCu);
    }
  }

- (void)createLogFile:(__CFString *)a3 fileClassC:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v52 = *MEMORY[0x1895F89C0];
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  *(_OWORD *)v44 = 0u;
  __int128 v45 = 0u;
  unsigned __int8 v7 = (void *)MEMORY[0x1895BA820](self, a2);
  unsigned int v8 = (__CFString *)-[__CFString stringByDeletingLastPathComponent](a3, "stringByDeletingLastPathComponent");
  if (-[__CFString UTF8String](v8, "UTF8String"))
  {
    -[__CFString UTF8String](v8, "UTF8String");
    __strlcpy_chk();
  }

  directoryPath = self->_directoryPath;
  if (directoryPath)
  {
    CFRelease(directoryPath);
    self->_directoryPath = 0LL;
  }

  uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  self->_directoryPath = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
  objc_autoreleasePoolPop(v7);
  if (!v44[0] || stat(v44, &v41) != -1)
  {
    char v11 = 0;
    goto LABEL_8;
  }

  if (!mkdir(v44, 0x1FDu))
  {
    v33 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Re-created missing log directory %s",  "-[WFLoggerFile createLogFile:fileClassC:]",  v44);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v33, "UTF8String")),  "UTF8String");
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v34;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    char v11 = 1;
LABEL_8:
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
    uint64_t v13 = (char *)calloc(1uLL, MaximumSizeOfFileSystemRepresentation);
    CFStringGetFileSystemRepresentation(a3, v13, MaximumSizeOfFileSystemRepresentation);
    logFilePath = self->_logFilePath;
    if (logFilePath)
    {
      char v15 = CFEqual(a3, logFilePath) ? v11 : 1;
      if ((v15 & 1) == 0 && self->_filePtr) {
        goto LABEL_35;
      }
    }

    if (v4)
    {
      int v16 = open_dprotected_np(v13, 514, 3, 0, 384LL);
      if (v16 < 0)
      {
        v35 = (void *)NSString;
        v36 = __error();
        v37 = (void *)objc_msgSend( v35,  "stringWithFormat:",  @"%s: open_dprotected_np failed with %s (%s)",  "-[WFLoggerFile createLogFile:fileClassC:]",  v13,  strerror(*v36));
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
      }

      else
      {
        uint64_t v17 = fdopen(v16, "ab");
        uint64_t v18 = (void *)NSString;
        if (v17)
        {
          uint64_t v19 = v17;
          v20 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Device unlocked since boot, will log to class C file: %s",  "-[WFLoggerFile createLogFile:fileClassC:]",  v13);
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          goto LABEL_28;
        }

        v38 = __error();
        v37 = (void *)objc_msgSend( v18,  "stringWithFormat:",  @"%s: fdopen failed %s (%s)",  "-[WFLoggerFile createLogFile:fileClassC:]",  v13,  strerror(*v38));
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
      }
    }

    else
    {
      unsigned int v23 = fopen(v13, "a");
      objc_super v24 = (void *)NSString;
      if (v23)
      {
        uint64_t v19 = v23;
        v20 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Will log to file: %s",  "-[WFLoggerFile createLogFile:fileClassC:]",  v13);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:
          uint64_t v25 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v20, "UTF8String")),  "UTF8String");
          *(_DWORD *)buf = 136446210;
          uint64_t v43 = v25;
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

- (void)removeLogFile:(const char *)a3 maxAge:(double)a4
{
  if (!stat(a3, &v7))
  {
    time_t v6 = time(0LL);
    if (difftime(v6, v7.st_mtimespec.tv_sec) > a4) {
      remove(a3);
    }
  }

- (unsigned)doesLogFileExist:(__CFString *)a3
{
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  uint64_t v5 = (char *)calloc(1uLL, MaximumSizeOfFileSystemRepresentation);
  if (!v5) {
    return 0;
  }
  time_t v6 = v5;
  CFStringGetFileSystemRepresentation(a3, v5, MaximumSizeOfFileSystemRepresentation);
  unsigned __int8 v7 = stat(v6, &v9) == 0;
  free(v6);
  return v7;
}

- (void)rotateLogFile:(__CFString *)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  unint64_t maxFileSizeInBytes = self->_maxFileSizeInBytes;
  memset(&v34, 0, sizeof(v34));
  unsigned __int8 isFileLoggingEnabled = self->_isFileLoggingEnabled;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
  unsigned int v8 = (char *)calloc(1uLL, MaximumSizeOfFileSystemRepresentation);
  if (v8)
  {
    stat v9 = v8;
    CFStringGetFileSystemRepresentation(a3, v8, MaximumSizeOfFileSystemRepresentation);
    if (stat(v9, &v34))
    {
      uint64_t v10 = (void *)NSString;
      char v11 = __error();
      uint64_t v12 = (void *)objc_msgSend( v10,  "stringWithFormat:",  @"%s: #error File status on %s returned non-zero (%s)",  "-[WFLoggerFile rotateLogFile:]",  v9,  strerror(*v11));
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        free(v9);
        self->_unsigned __int8 isFileLoggingEnabled = isFileLoggingEnabled;
        return;
      }

- (void)setMaxFileSizeInMB:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile setMaxFileSizeInMB:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (unint64_t)getMaxFileSizeInMB
{
  return self->_maxFileSizeInBytes / 0xF4240;
}

- (void)setLogLifespanInDays:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile setLogLifespanInDays:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (id)getLogLifespanInDays
{
  return self->_logLifespanInDays;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile setLogPrivacy:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (unint64_t)getLogPrivacy
{
  return self->_privacy;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile setLogLevelEnable:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (unint64_t)getLogLevelEnable
{
  return self->_level;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile setLogLevelPersist:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (unint64_t)getLogLevelPersist
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v2 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s not applicable",  "-[WFLoggerFile getLogLevelPersist]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v5 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v2, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  return 3LL;
}

@end