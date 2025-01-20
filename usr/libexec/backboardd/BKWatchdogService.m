@interface BKWatchdogService
- (BKHIDSystemInterface)hidSystem;
- (BKSystemShellSentinel)systemAppSentinel;
- (BKTVOutController)tvOutController;
- (BKWatchdogService)init;
- (BOOL)isAlive;
- (void)registerClientsForMonitoring;
- (void)setHidSystem:(id)a3;
- (void)setSystemAppSentinel:(id)a3;
- (void)setTvOutController:(id)a3;
@end

@implementation BKWatchdogService

- (BKWatchdogService)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BKWatchdogService;
  v2 = -[BKWatchdogService init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
    systemAppSentinel = v2->_systemAppSentinel;
    v2->_systemAppSentinel = (BKSystemShellSentinel *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    hidSystem = v2->_hidSystem;
    v2->_hidSystem = (BKHIDSystemInterface *)v5;

    id v7 = sub_100044434();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    tvOutController = v2->_tvOutController;
    v2->_tvOutController = (BKTVOutController *)v8;
  }

  return v2;
}

- (void)registerClientsForMonitoring
{
  tvOutController = self->_tvOutController;
  if (tvOutController) {
    wd_endpoint_add_queue(tvOutController->_workQueue);
  }
}

- (BOOL)isAlive
{
  return -[BKSystemShellSentinel collectiveWatchdogPing](self->_systemAppSentinel, "collectiveWatchdogPing");
}

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (void)setSystemAppSentinel:(id)a3
{
}

- (BKHIDSystemInterface)hidSystem
{
  return self->_hidSystem;
}

- (void)setHidSystem:(id)a3
{
}

- (BKTVOutController)tvOutController
{
  return self->_tvOutController;
}

- (void)setTvOutController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end