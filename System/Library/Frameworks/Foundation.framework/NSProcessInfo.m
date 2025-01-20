@interface NSProcessInfo
+ (NSProcessInfo)alloc;
+ (NSProcessInfo)allocWithZone:(_NSZone *)a3;
+ (NSProcessInfo)processInfo;
- (BOOL)automaticTerminationSupportEnabled;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isMacCatalystApp;
- (BOOL)isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion *)version;
- (BOOL)isTranslated;
- (BOOL)isiOSAppOnMac;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSOperatingSystemVersion)operatingSystemVersion;
- (NSProcessInfoThermalState)thermalState;
- (NSString)globallyUniqueString;
- (NSString)hostName;
- (NSString)operatingSystemName;
- (NSString)operatingSystemVersionString;
- (NSString)processName;
- (NSString)userName;
- (NSUInteger)activeProcessorCount;
- (NSUInteger)operatingSystem;
- (NSUInteger)processorCount;
- (id)beginActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason;
- (id)beginSuspensionOfSystemBehaviors:(unint64_t)a3 reason:(id)a4;
- (id)userHomeDirectory;
- (unint64_t)physicalMemory;
- (void)_exitIfSuddenTerminationEnabledWithStatus:(int)a3;
- (void)_exitWhenSuddenTerminationEnabledWithStatus:(int)a3;
- (void)_reactivateActivity:(id)a3;
- (void)dealloc;
- (void)disableAutomaticTermination:(NSString *)reason;
- (void)enableAutomaticTermination:(NSString *)reason;
- (void)endActivity:(id)activity;
- (void)endSystemBehaviorSuspension:(id)a3;
- (void)performActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason usingBlock:(void *)block;
- (void)performExpiringActivityWithReason:(NSString *)reason usingBlock:(void *)block;
- (void)setArguments:(id)a3;
- (void)setAutomaticTerminationSupportEnabled:(BOOL)automaticTerminationSupportEnabled;
- (void)setProcessName:(NSString *)processName;
@end

@implementation NSProcessInfo

+ (NSProcessInfo)processInfo
{
  if (&OBJC_CLASS___NSProcessInfo == a1) {
    return +[_NSSwiftProcessInfo processInfo](&OBJC_CLASS____NSSwiftProcessInfo, "processInfo");
  }
  if (qword_18C496A58 != -1) {
    dispatch_once(&qword_18C496A58, &__block_literal_global_39);
  }
  return (NSProcessInfo *)qword_18C496A60;
}

- (NSString)processName
{
  name = self->name;
  if (!name)
  {
    v4 = (const char **)_CFGetProgname();
    name = (NSString *)CFStringCreateWithFileSystemRepresentation(0LL, *v4);
    self->name = name;
  }

  v5 = (void *)-[NSString copy](name, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
  return (NSString *)v5;
}

+ (NSProcessInfo)allocWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (qword_18C496A70 != -1) {
    dispatch_once(&qword_18C496A70, &__block_literal_global_137);
  }
  if (byte_18C496A51 && &OBJC_CLASS___NSProcessInfo == a1) {
    return (NSProcessInfo *)+[NSProcessInfo allocWithZone:](&OBJC_CLASS____NSSwiftProcessInfo, "allocWithZone:", a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
  return (NSProcessInfo *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (NSProcessInfo)alloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (qword_18C496A70 != -1) {
    dispatch_once(&qword_18C496A70, &__block_literal_global_137);
  }
  if (byte_18C496A51 && &OBJC_CLASS___NSProcessInfo == a1) {
    return (NSProcessInfo *)objc_alloc(&OBJC_CLASS____NSSwiftProcessInfo);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSProcessInfo;
  return (NSProcessInfo *)objc_msgSendSuper2(&v4, sel_alloc);
}

uint64_t __28__NSProcessInfo_processInfo__block_invoke()
{
  uint64_t result = [objc_allocWithZone((Class)NSProcessInfo) init];
  qword_18C496A60 = result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProcessInfo;
  -[NSProcessInfo dealloc](&v3, sel_dealloc);
}

- (NSString)operatingSystemName
{
  NSUInteger v2 = -[NSProcessInfo operatingSystem](self, "operatingSystem");
  if (v2 - 1 > 4) {
    return (NSString *)@"NSUnknownOperatingSystem";
  }
  else {
    return (NSString *)off_189C9FE68[v2 - 1];
  }
}

- (NSUInteger)operatingSystem
{
  return 5LL;
}

- (id)userHomeDirectory
{
  return NSHomeDirectoryForUser(0LL);
}

- (BOOL)isTranslated
{
  return 0;
}

- (NSDictionary)environment
{
  uint64_t result = self->environment;
  if (result) {
    return result;
  }
  environ_lock_np();
  objc_super v3 = *_NSGetEnviron();
  if (!v3)
  {
    environ_unlock_np();
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }

  uint64_t v4 = (void **)malloc(0x100uLL);
  uint64_t v5 = *v3;
  if (*v3)
  {
    unint64_t v6 = 0LL;
    unint64_t v7 = 32LL;
    while (1)
    {
      if (v6 >= v7)
      {
        if ((v7 & 0x8000000000000000LL) != 0)
        {
          environ_unlock_np();
          freeenv(v4, 2 * v7);
          return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
        }

        uint64_t v4 = (void **)realloc(v4, 16 * v7);
        uint64_t v5 = v3[v6];
        v7 *= 2LL;
      }

      v4[v6] = strdup(v5);
      uint64_t v8 = v6 + 1;
      uint64_t v5 = v3[++v6];
      if (!v5)
      {
        environ_unlock_np();
        goto LABEL_13;
      }
    }
  }

  environ_unlock_np();
  if (!v4) {
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }
  uint64_t v8 = 0LL;
LABEL_13:
  v9 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v8];
  if (v8)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      uint64_t v11 = 0LL;
      v12 = v4[i];
      while (1)
      {
        int v13 = v12[v11];
        if (v13 == 61 || v13 == 0) {
          break;
        }
        ++v11;
      }

      uint64_t v15 = 0LL;
      while (v12[v11 + v15++])
        ;
      if (v15 != 1)
      {
        v17 = +[NSString stringWithBytes:length:encoding:]( &OBJC_CLASS___NSString,  "stringWithBytes:length:encoding:",  v4[i],  v11,  4LL);
        if (!v17)
        {
          v18 = v4[i];
          if (__NSDefaultStringEncodingFullyInited) {
            uint64_t v19 = _NSDefaultStringEncoding;
          }
          else {
            uint64_t v19 = _NSDefaultCStringEncoding();
          }
          v17 = +[NSString stringWithBytes:length:encoding:]( &OBJC_CLASS___NSString,  "stringWithBytes:length:encoding:",  v18,  v12 - v18 + v11,  v19);
        }

        uint64_t v20 = (uint64_t)&v12[v11 + 1];
        v21 = +[NSString stringWithBytes:length:encoding:]( &OBJC_CLASS___NSString,  "stringWithBytes:length:encoding:",  v20,  v15 - 2,  4LL);
        if (!v21)
        {
          if (__NSDefaultStringEncodingFullyInited) {
            uint64_t v22 = _NSDefaultStringEncoding;
          }
          else {
            uint64_t v22 = _NSDefaultCStringEncoding();
          }
          v21 = +[NSString stringWithBytes:length:encoding:]( &OBJC_CLASS___NSString,  "stringWithBytes:length:encoding:",  v20,  v15 - 2,  v22);
        }

        if (v17 && v21 && ![v9 objectForKey:v17]) {
          [v9 setObject:v21 forKey:v17];
        }
      }
    }
  }

  v23 = (NSDictionary *)[MEMORY[0x189603F68] dictionaryWithDictionary:v9];

  freeenv(v4, v8);
  return v23;
}

- (NSArray)arguments
{
  arguments = self->arguments;
  if (!arguments)
  {
    uint64_t v4 = (const char *)_CFProcessPath();
    uint64_t v5 = (id)CFStringCreateWithFileSystemRepresentation(0LL, v4);
    if (!v5)
    {
      id v6 = objc_allocWithZone((Class)&OBJC_CLASS___NSString);
      size_t v7 = strlen(v4);
      if (__NSDefaultStringEncodingFullyInited) {
        uint64_t v8 = _NSDefaultStringEncoding;
      }
      else {
        uint64_t v8 = _NSDefaultCStringEncoding();
      }
      uint64_t v5 = (__CFString *)(id)[v6 initWithBytes:v4 length:v7 encoding:v8];
    }

    if (!v5) {
      uint64_t v5 = &stru_189CA6A28;
    }
    uint64_t v9 = -[__CFString stringByStandardizingPath](v5, "stringByStandardizingPath");
    v10 = (void *)[MEMORY[0x189603FA8] array];
    uint64_t v11 = *_NSGetArgv();
    uint64_t v12 = *_NSGetArgc();
    if ((int)v12 >= 1)
    {
      do
      {
        if (*v11)
        {
          int v13 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *v11,  4LL);
          if (v13
            || (int v13 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *v11,  5LL)) != 0LL)
          {
            [v10 addObject:v13];
          }
        }

        ++v11;
        --v12;
      }

      while (v12);
    }

    if ([v10 count]) {
      [v10 replaceObjectAtIndex:0 withObject:v9];
    }
    else {
      [v10 addObject:v9];
    }
    arguments = (NSArray *)[v10 copy];
    self->arguments = arguments;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
  return arguments;
}

- (void)setArguments:(id)a3
{
  arguments = self->arguments;
  if (arguments != a3)
  {

    self->arguments = (NSArray *)[a3 copy];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)hostName
{
  uint64_t result = self->hostName;
  if (!result)
  {
    os_unfair_lock_lock(&hostName_hostNameLock);
    if (!self->hostName) {
      self->hostName = (NSString *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x189601EA8], "currentHost"), "name"),  "copy");
    }
    os_unfair_lock_unlock(&hostName_hostNameLock);
    return self->hostName;
  }

  return result;
}

- (void)setProcessName:(NSString *)processName
{
  name = self->name;
  if (name != processName)
  {

    self->name = (NSString *)-[NSString copy](processName, "copy");
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&processLock);
}

- (NSString)globallyUniqueString
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  NSUInteger v2 = CFUUIDCreate(0LL);
  objc_super v3 = CFUUIDCreateString(0LL, v2);
  buffer[0] = 0;
  CFStringGetCString(v3, buffer, 256LL, 0x600u);
  buffer[255] = 0;
  size_t v4 = strlen(buffer);
  uint64_t v5 = &buffer[v4];
  size_t v6 = 256 - v4;
  uint64_t v7 = getpid();
  uint64_t v8 = mach_absolute_time();
  snprintf(v5, v6, "-%ld-%016qX", v7, v8);
  CFRelease(v3);
  CFRelease(v2);
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer);
}

- (NSString)userName
{
  return (NSString *)(id)CFCopyUserName();
}

- (NSString)operatingSystemVersionString
{
  return (NSString *)(id)CFCopySystemVersionString();
}

- (NSOperatingSystemVersion)operatingSystemVersion
{
  uint64_t result = (NSOperatingSystemVersion *)_CFOperatingSystemVersionGetCurrent();
  *retstr = v5;
  return result;
}

- (BOOL)isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion *)version
{
  return _CFOperatingSystemVersionIsAtLeastVersion() != 0;
}

- (NSUInteger)processorCount
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = processorCount__pcnt;
  if (processorCount__pcnt == -1)
  {
    *(void *)NSOperatingSystemVersion v5 = 0x300000006LL;
    size_t v4 = 4LL;
    if (sysctl(v5, 2u, &processorCount__pcnt, &v4, 0LL, 0LL))
    {
      int v2 = 0;
      processorCount__pcnt = 0;
    }

    else
    {
      return processorCount__pcnt;
    }
  }

  return v2;
}

- (NSUInteger)activeProcessorCount
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = activeProcessorCount__pcnt;
  if (activeProcessorCount__pcnt == -1)
  {
    *(void *)NSOperatingSystemVersion v5 = 0x1900000006LL;
    size_t v4 = 4LL;
    if (sysctl(v5, 2u, &activeProcessorCount__pcnt, &v4, 0LL, 0LL))
    {
      int v2 = 0;
      activeProcessorCount__pcnt = 0;
    }

    else
    {
      return activeProcessorCount__pcnt;
    }
  }

  return v2;
}

- (unint64_t)physicalMemory
{
  v4[1] = *MEMORY[0x1895F89C0];
  if ((_MergedGlobals_115 & 1) != 0) {
    return qword_18C496A68;
  }
  v4[0] = 8LL;
  int v2 = sysctlbyname("hw.memsize", &qword_18C496A68, v4, 0LL, 0LL);
  unint64_t result = 0LL;
  _MergedGlobals_115 = v2 == 0;
  if (!v2) {
    return qword_18C496A68;
  }
  return result;
}

- (void)_exitIfSuddenTerminationEnabledWithStatus:(int)a3
{
}

- (void)_exitWhenSuddenTerminationEnabledWithStatus:(int)a3
{
}

- (void)disableAutomaticTermination:(NSString *)reason
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)enableAutomaticTermination:(NSString *)reason
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setAutomaticTerminationSupportEnabled:(BOOL)automaticTerminationSupportEnabled
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (BOOL)automaticTerminationSupportEnabled
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProcessInfo;
  -[NSProcessInfo doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)_reactivateActivity:(id)a3
{
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [a3 _reactivate];
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invalid class type" userInfo:0]);
      -[NSProcessInfo beginSuspensionOfSystemBehaviors:reason:](v4, v5, v6, v7);
    }
  }

- (id)beginSuspensionOfSystemBehaviors:(unint64_t)a3 reason:(id)a4
{
  return  -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]( objc_alloc(&OBJC_CLASS____NSActivityAssertion),  "_initWithActivityOptions:reason:expirationHandler:",  0xFF00EFFFFFLL,  a4,  0LL);
}

- (void)endSystemBehaviorSuspension:(id)a3
{
  if (a3) {
    [a3 _endFromDealloc:0];
  }
}

- (id)beginActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason
{
  if (reason && _NSIsNSString() && -[NSString length](reason, "length")) {
    return  -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]( objc_alloc(&OBJC_CLASS____NSActivityAssertion),  "_initWithActivityOptions:reason:expirationHandler:",  options,  reason,  0LL);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
  -[NSProcessInfo endActivity:](v7, v8, v9);
  return result;
}

- (void)endActivity:(id)activity
{
  if (activity)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [activity _endFromDealloc:0];
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Invalid class type" userInfo:0]);
      -[NSProcessInfo performActivityWithOptions:reason:block:](v4, v5, v6, v7, v8);
    }
  }

- (void)performActivityWithOptions:(NSActivityOptions)options reason:(NSString *)reason usingBlock:(void *)block
{
}

- (void)performExpiringActivityWithReason:(NSString *)reason usingBlock:(void *)block
{
}

- (NSProcessInfoThermalState)thermalState
{
  return -[NSProcessInfo thermalState]( +[_NSSwiftProcessInfo processInfo](&OBJC_CLASS____NSSwiftProcessInfo, "processInfo"),  "thermalState");
}

- (BOOL)isLowPowerModeEnabled
{
  return -[NSProcessInfo isLowPowerModeEnabled]( +[_NSSwiftProcessInfo processInfo](&OBJC_CLASS____NSSwiftProcessInfo, "processInfo"),  "isLowPowerModeEnabled");
}

- (BOOL)isMacCatalystApp
{
  return _CFMZEnabled() != 0;
}

- (BOOL)isiOSAppOnMac
{
  return 0;
}

@end