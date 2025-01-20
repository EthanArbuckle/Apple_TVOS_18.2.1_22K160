@interface SUControllerLogger
+ (id)sharedLogger;
- (SUControllerLogger)init;
- (int64_t)logLevel;
- (void)logAtLevel:(int64_t)a3 label:(const char *)a4 format:(id)a5;
- (void)setLogLevel:(int64_t)a3;
- (void)setLoglevel:(int64_t)a3;
@end

@implementation SUControllerLogger

+ (id)sharedLogger
{
  if (qword_100079648 != -1) {
    dispatch_once(&qword_100079648, &stru_100065918);
  }
  return (id)qword_100079640;
}

- (SUControllerLogger)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUControllerLogger;
  v2 = -[SUControllerLogger init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_logLevel = 2LL;
    os_log_t v4 = os_log_create("com.apple.sucontroller", "Info");
    logInfo = v3->_logInfo;
    v3->_logInfo = v4;

    os_log_t v6 = os_log_create("com.apple.sucontroller", "Notice");
    logNotice = v3->_logNotice;
    v3->_logNotice = v6;

    os_log_t v8 = os_log_create("com.apple.sucontroller", "Error");
    logError = v3->_logError;
    v3->_logError = v8;
  }

  return v3;
}

- (void)setLoglevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void)logAtLevel:(int64_t)a3 label:(const char *)a4 format:(id)a5
{
  id v8 = a5;
  v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v8, &v19);

  if (a3 == 1)
  {
    logNotice = self->_logNotice;
    if (!os_log_type_enabled(logNotice, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136446466;
    v16 = a4;
    __int16 v17 = 2114;
    v18 = v9;
    v12 = logNotice;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}s: %{public}@", buf, 0x16u);
    goto LABEL_10;
  }

  if (a3)
  {
    logInfo = self->_logInfo;
    if (!os_log_type_enabled(logInfo, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136446466;
    v16 = a4;
    __int16 v17 = 2114;
    v18 = v9;
    v12 = logInfo;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }

  logError = self->_logError;
  if (os_log_type_enabled(logError, OS_LOG_TYPE_ERROR)) {
    sub_10003EC94((uint64_t)a4, (uint64_t)v9, logError);
  }
LABEL_10:
}

- (int64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(int64_t)a3
{
  self->_logLevel = a3;
}

- (void).cxx_destruct
{
}

@end