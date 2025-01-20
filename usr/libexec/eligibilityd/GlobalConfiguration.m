@interface GlobalConfiguration
+ (GlobalConfiguration)sharedInstance;
- (BOOL)hasInternalContent;
- (BOOL)isMemoryConstrainedDevice;
- (BOOL)setTestMode:(BOOL)a3 withError:(id *)a4;
- (BOOL)testMode;
- (BOOL)testModeEnabled;
- (GlobalConfiguration)init;
- (NSString)currentUsername;
- (OS_dispatch_queue)testModeQueue;
- (id)debugDescription;
- (void)setTestModeEnabled:(BOOL)a3;
- (void)setTestModeQueue:(id)a3;
@end

@implementation GlobalConfiguration

- (GlobalConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GlobalConfiguration;
  v2 = -[GlobalConfiguration init](&v7, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.eligibilityd.testMode", v4);
    -[GlobalConfiguration setTestModeQueue:](v2, "setTestModeQueue:", v5);
  }

  return v2;
}

- (BOOL)hasInternalContent
{
  if (qword_100044768 != -1) {
    dispatch_once(&qword_100044768, &stru_100034C00);
  }
  return byte_100044770;
}

- (BOOL)isMemoryConstrainedDevice
{
  if (qword_100044778 != -1) {
    dispatch_once(&qword_100044778, &stru_100034C20);
  }
  return byte_100044780;
}

- (NSString)currentUsername
{
  return (NSString *)@"mobile";
}

- (BOOL)setTestMode:(BOOL)a3 withError:(id *)a4
{
  BOOL v7 = -[GlobalConfiguration hasInternalContent](self, "hasInternalContent");
  if (v7)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GlobalConfiguration testModeQueue](self, "testModeQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000F228;
    v13[3] = &unk_100034C48;
    v13[4] = self;
    BOOL v14 = a3;
    dispatch_sync(v8, v13);

    id v9 = 0LL;
  }

  else
  {
    id v10 = sub_10000C968();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[GlobalConfiguration setTestMode:withError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Test mode can only be set on internal builds",  buf,  0xCu);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (a4)
    {
      id v9 = v9;
      *a4 = v9;
    }
  }

  return v7;
}

- (BOOL)testMode
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GlobalConfiguration testModeQueue](self, "testModeQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F1F8;
  v5[3] = &unk_100034FD0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)debugDescription
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GlobalConfiguration currentUsername](self, "currentUsername"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<GlobalConfiguration currUser: %@, testMode: %d>",  v3,  -[GlobalConfiguration testMode](self, "testMode")));

  return v4;
}

- (OS_dispatch_queue)testModeQueue
{
  return self->_testModeQueue;
}

- (void)setTestModeQueue:(id)a3
{
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(BOOL)a3
{
  self->_testModeEnabled = a3;
}

- (void).cxx_destruct
{
}

+ (GlobalConfiguration)sharedInstance
{
  if (qword_100044760 != -1) {
    dispatch_once(&qword_100044760, &stru_100034BE0);
  }
  return (GlobalConfiguration *)(id)qword_100044758;
}

@end