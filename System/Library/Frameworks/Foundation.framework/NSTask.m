@interface NSTask
+ (NSTask)allocWithZone:(_NSZone *)a3;
+ (NSTask)launchedTaskWithExecutableURL:(NSURL *)url arguments:(NSArray *)arguments error:(NSError *)error terminationHandler:(void *)terminationHandler;
+ (NSTask)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments;
+ (id)currentTaskDictionary;
+ (id)launchedTaskWithDictionary:(id)a3;
- (BOOL)isRunning;
- (BOOL)isSpawnedProcessDisclaimed;
- (BOOL)launchAndReturnError:(NSError *)error;
- (BOOL)resume;
- (BOOL)suspend;
- (NSArray)arguments;
- (NSData)launchRequirementData;
- (NSDictionary)environment;
- (NSQualityOfService)qualityOfService;
- (NSString)currentDirectoryPath;
- (NSString)launchPath;
- (NSTask)init;
- (NSTaskTerminationReason)terminationReason;
- (NSURL)currentDirectoryURL;
- (NSURL)executableURL;
- (id)standardError;
- (id)standardInput;
- (id)standardOutput;
- (int)processIdentifier;
- (int)terminationStatus;
- (int64_t)suspendCount;
- (void)interrupt;
- (void)launch;
- (void)setArguments:(NSArray *)arguments;
- (void)setCurrentDirectoryPath:(NSString *)currentDirectoryPath;
- (void)setCurrentDirectoryURL:(NSURL *)currentDirectoryURL;
- (void)setEnvironment:(NSDictionary *)environment;
- (void)setExecutableURL:(NSURL *)executableURL;
- (void)setLaunchPath:(NSString *)launchPath;
- (void)setStandardError:(id)standardError;
- (void)setStandardInput:(id)standardInput;
- (void)setStandardOutput:(id)standardOutput;
- (void)setTerminationHandler:(void *)terminationHandler;
- (void)terminate;
- (void)terminationHandler;
@end

@implementation NSTask

- (void)terminationHandler
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setTerminationHandler:(void *)terminationHandler
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)terminationStatus
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTaskTerminationReason)terminationReason
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)isRunning
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)launch
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)launchAndReturnError:(NSError *)error
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setArguments:(NSArray *)arguments
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryPath:(NSString *)currentDirectoryPath
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCurrentDirectoryURL:(NSURL *)currentDirectoryURL
{
  if (!currentDirectoryURL)
  {
    v6 = -[NSFileManager currentDirectoryPath]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "currentDirectoryPath");
    goto LABEL_5;
  }

  if (-[NSURL isFileURL](currentDirectoryURL, "isFileURL"))
  {
    v6 = (NSString *)objc_msgSend(-[NSURL standardizedURL](currentDirectoryURL, "standardizedURL"), "path");
LABEL_5:
    -[NSTask setCurrentDirectoryPath:](self, "setCurrentDirectoryPath:", v6);
    return;
  }

  v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: non-file URL argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v7);
  -[NSTask currentDirectoryURL](v8, v9);
}

- (NSURL)currentDirectoryURL
{
  return (NSURL *)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  -[NSTask currentDirectoryPath](self, "currentDirectoryPath"),  1);
}

- (void)setEnvironment:(NSDictionary *)environment
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLaunchPath:(NSString *)launchPath
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSURL)executableURL
{
  result = -[NSTask launchPath](self, "launchPath");
  if (result) {
    return (NSURL *)[MEMORY[0x189604030] fileURLWithPath:result isDirectory:0];
  }
  return result;
}

- (void)setExecutableURL:(NSURL *)executableURL
{
  if (executableURL)
  {
    v4 = executableURL;
    if (!-[NSURL isFileURL](executableURL, "isFileURL"))
    {
      v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: non-file URL argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v6);
      JUMPOUT(0x18362602CLL);
    }

    executableURL = (NSURL *)objc_msgSend(-[NSURL standardizedURL](v4, "standardizedURL"), "path");
  }

  -[NSTask setLaunchPath:](self, "setLaunchPath:", executableURL);
}

- (void)interrupt
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)terminate
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)suspend
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)resume
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int64_t)suspendCount
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (int)processIdentifier
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)launchPath
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)environment
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)currentDirectoryPath
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)launchRequirementData
{
  return 0LL;
}

- (void)setStandardInput:(id)standardInput
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardOutput:(id)standardOutput
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setStandardError:(id)standardError
{
  v5 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)standardInput
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardOutput
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)standardError
{
  v4 = NSClassFromString((NSString *)@"NSTask");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSQualityOfService)qualityOfService
{
  return 0LL;
}

- (BOOL)isSpawnedProcessDisclaimed
{
  return 0;
}

- (NSTask)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTask;
  return -[NSTask init](&v3, sel_init);
}

+ (NSTask)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSTask == a1) {
    a1 = (id)objc_opt_self();
  }
  return (NSTask *)NSAllocateObject((Class)a1, 0LL, a3);
}

+ (id)currentTaskDictionary
{
  return (id)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObjectsAndKeys:",  -[NSFileManager currentDirectoryPath]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "currentDirectoryPath"),  @"_NSTaskDirectoryPath",  +[NSFileHandle fileHandleWithStandardInput](NSFileHandle, "fileHandleWithStandardInput"),  @"_NSTaskInputFileHandle",  +[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"),  @"_NSTaskOutputFileHandle",  +[NSFileHandle fileHandleWithStandardError](NSFileHandle, "fileHandleWithStandardError"),  @"_NSTaskDiagnosticFileHandle",  0);
}

+ (id)launchedTaskWithDictionary:(id)a3
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) init];
  [v4 launchWithDictionary:a3 error:0];
  return v4;
}

+ (NSTask)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments
{
  v6 = (NSTask *)(id)[objc_allocWithZone((Class)a1) init];
  id v7 = +[NSTask currentTaskDictionary](&OBJC_CLASS___NSTask, "currentTaskDictionary");
  if (arguments)
  {
    v8 = v7;
    [v7 setObject:path forKey:@"_NSTaskExecutablePath"];
    [v8 setObject:arguments forKey:@"_NSTaskArgumentArray"];
    -[NSTask launchWithDictionary:error:](v6, "launchWithDictionary:error:", v8, 0LL);
    return v6;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"must provide array of arguments" userInfo:0]);
    return +[NSTask launchedTaskWithExecutableURL:arguments:error:terminationHandler:](v10, v11, v12, v13, v14, v15);
  }

+ (NSTask)launchedTaskWithExecutableURL:(NSURL *)url arguments:(NSArray *)arguments error:(NSError *)error terminationHandler:(void *)terminationHandler
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (!url)
  {
    v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    v21 = @"must provide a launch url";
    goto LABEL_16;
  }

  if (!-[NSURL isFileURL](url, "isFileURL"))
  {
    if (error)
    {
      v26 = @"NSURL";
      v27[0] = url;
      uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      uint64_t v18 = 262LL;
LABEL_11:
      *error = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v18,  v17);
    }

    return 0LL;
  }

  id v11 = -[NSURL path](url, "path");
  if (!v11)
  {
    if (error)
    {
      v24 = @"NSURL";
      v25 = url;
      uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v18 = 260LL;
      goto LABEL_11;
    }

    return 0LL;
  }

  id v12 = v11;
  id v13 = objc_alloc_init((Class)a1);
  if (arguments)
  {
    v14 = v13;
    id v15 = +[NSTask currentTaskDictionary](&OBJC_CLASS___NSTask, "currentTaskDictionary");
    [v15 setObject:v12 forKey:@"_NSTaskExecutablePath"];
    [v15 setObject:arguments forKey:@"_NSTaskArgumentArray"];
    [v15 setObject:MEMORY[0x189604A88] forKey:@"_NSTaskUseErrorsForRuntimeFailures"];
    [v14 setTerminationHandler:terminationHandler];
    if ([v14 launchWithDictionary:v15 error:error]) {
      return (NSTask *)v14;
    }

    return 0LL;
  }

  v19 = (void *)MEMORY[0x189603F70];
  uint64_t v20 = *MEMORY[0x189603A60];
  v21 = @"must provide array of arguments";
LABEL_16:
  objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0, terminationHandler));
  return (NSTask *)-[NSConcreteTask qualityOfService](v22, v23);
}

@end