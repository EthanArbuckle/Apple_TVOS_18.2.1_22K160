@interface DMWrapperProcessWatchdogCoordinatorPluginState
- (BOOL)running;
- (BOOL)watchdogged;
- (DMWrapperProcessWatchdogCoordinatorPluginState)initWithPlugin:(id)a3;
- (DataMigrationPlugin)plugin;
- (OS_dispatch_queue)queue;
- (int)pid;
- (void)setPid:(int)a3;
- (void)setPlugin:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setWatchdogged:(BOOL)a3;
@end

@implementation DMWrapperProcessWatchdogCoordinatorPluginState

- (DMWrapperProcessWatchdogCoordinatorPluginState)initWithPlugin:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DMWrapperProcessWatchdogCoordinatorPluginState;
  v5 = -[DMWrapperProcessWatchdogCoordinatorPluginState init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[DMWrapperProcessWatchdogCoordinatorPluginState setPlugin:](v5, "setPlugin:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.datamigrator.watchdogCoordinator.plugin.%@", v7));
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    -[DMWrapperProcessWatchdogCoordinatorPluginState setQueue:](v6, "setQueue:", v9);

    -[DMWrapperProcessWatchdogCoordinatorPluginState setRunning:](v6, "setRunning:", 0LL);
    -[DMWrapperProcessWatchdogCoordinatorPluginState setWatchdogged:](v6, "setWatchdogged:", 0LL);
    -[DMWrapperProcessWatchdogCoordinatorPluginState setPid:](v6, "setPid:", 0LL);
  }

  return v6;
}

- (DataMigrationPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)watchdogged
{
  return self->_watchdogged;
}

- (void)setWatchdogged:(BOOL)a3
{
  self->_watchdogged = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end