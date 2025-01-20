@interface SUCoreLog
+ (id)sharedLogger;
- (NSString)category;
- (OS_os_log)oslog;
- (SUCoreLog)initWithCategory:(id)a3;
@end

@implementation SUCoreLog

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1) {
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_4);
  }
  return (id)sharedLogger_logger;
}

void __25__SUCoreLog_sharedLogger__block_invoke()
{
  v0 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"SU");
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;
}

- (SUCoreLog)initWithCategory:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SUCoreLog;
  v6 = -[SUCoreLog init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    id v9 = [v8 commonDomain];
    os_log_t v10 = os_log_create( (const char *)[v9 UTF8String], (const char *)objc_msgSend(v5, "UTF8String"));
    oslog = v7->_oslog;
    v7->_oslog = v10;
  }

  return v7;
}

- (OS_os_log)oslog
{
  return self->_oslog;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
}

@end