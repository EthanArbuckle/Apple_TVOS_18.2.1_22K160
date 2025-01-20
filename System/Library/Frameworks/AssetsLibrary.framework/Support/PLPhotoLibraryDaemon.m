@interface PLPhotoLibraryDaemon
- (PLPhotoLibraryDaemon)init;
- (int)setup;
- (void)run;
@end

@implementation PLPhotoLibraryDaemon

- (PLPhotoLibraryDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PLPhotoLibraryDaemon;
  v2 = -[PLPhotoLibraryDaemon init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PLDefaultDaemonServices);
    daemonServices = v2->_daemonServices;
    v2->_daemonServices = v3;

    v5 = v2;
  }

  return v2;
}

- (int)setup
{
  uint64_t Log = PLBackendGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = getpid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "assetsd starting up [%d]", (uint8_t *)v7, 8u);
  }

  if (self)
  {
    uint64_t v5 = PLAssertMinimumCoreDataVersion();
    PLDebugEnableCoreDataMultithreadedAsserts(v5);
    +[PLPhotoLibraryPathManager enableMultiLibraryMode]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "enableMultiLibraryMode");
    sub_100001E14((uint64_t)self);
    GSInitialize();
    sub_100001F6C(self);
    sub_100001FE0((uint64_t)self);
    sub_100002078((uint64_t)self);
    sub_100002110((uint64_t)self);
  }

  else
  {
    +[PLPhotoLibraryPathManager enableMultiLibraryMode]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "enableMultiLibraryMode");
  }

  DCIM_IS_PAD();
  return 0;
}

- (void)run
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v2 run];
}

- (void).cxx_destruct
{
}

@end