@interface DaemonServiceMatcher
- (BOOL)waitForService;
- (DaemonServiceMatcher)init;
- (void)serviceMatched:(id)a3;
@end

@implementation DaemonServiceMatcher

- (DaemonServiceMatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DaemonServiceMatcher;
  v2 = -[TSDIOKServiceMatcher init](&v6, "init");
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    waitSemaphore = v2->_waitSemaphore;
    v2->_waitSemaphore = (OS_dispatch_semaphore *)v3;
  }

  return v2;
}

- (BOOL)waitForService
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncDaemonService"));
  unsigned int v4 = -[TSDIOKServiceMatcher startNotificationsWithMatchingDictionary:]( self,  "startNotificationsWithMatchingDictionary:",  v3);

  if (!v4) {
    goto LABEL_5;
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitSemaphore, 0xFFFFFFFFFFFFFFFFLL))
  {
    LOBYTE(v5) = 1;
    return v5;
  }

  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    sub_100027F00();
LABEL_5:
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)serviceMatched:(id)a3
{
}

- (void).cxx_destruct
{
}

@end