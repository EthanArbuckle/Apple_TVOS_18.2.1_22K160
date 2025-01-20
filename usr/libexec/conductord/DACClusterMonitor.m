@interface DACClusterMonitor
- (BOOL)clusterIsActive;
- (COClusterRoleMonitor)roleMonitor;
- (DACClusterMonitorDelegate)delegate;
- (NSObject)snapshotObserver;
- (OS_dispatch_queue)queue;
- (void)_handleSnapshotUpdate:(id)a3;
- (void)_notifyDelegate;
- (void)dealloc;
- (void)setClusterIsActive:(BOOL)a3;
@end

@implementation DACClusterMonitor

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor snapshotObserver](self, "snapshotObserver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor roleMonitor](self, "roleMonitor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor snapshotObserver](self, "snapshotObserver"));
    [v4 removeObserverForSnapshots:v5];

    snapshotObserver = self->_snapshotObserver;
    self->_snapshotObserver = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DACClusterMonitor;
  -[DACClusterMonitor dealloc](&v7, "dealloc");
}

- (void)_handleSnapshotUpdate:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 count];
  unsigned int v7 = -[DACClusterMonitor clusterIsActive](self, "clusterIsActive");
  if ((v6 != 0LL) != v7)
  {
    unsigned int v8 = v7;
    id v9 = sub_100014610(4);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      int v13 = 134218496;
      v14 = self;
      if (v6) {
        int v12 = 89;
      }
      else {
        int v12 = 78;
      }
      __int16 v15 = 1024;
      int v16 = v11;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%p availability change(%c->%c)",  (uint8_t *)&v13,  0x18u);
    }

    -[DACClusterMonitor setClusterIsActive:](self, "setClusterIsActive:", v6 != 0LL);
    -[DACClusterMonitor _notifyDelegate](self, "_notifyDelegate");
  }

- (void)_notifyDelegate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = -[DACClusterMonitor clusterIsActive](self, "clusterIsActive");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DACClusterMonitor delegate](self, "delegate"));
  [v5 monitor:self clusterIsActive:v4];
}

- (DACClusterMonitorDelegate)delegate
{
  return (DACClusterMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)clusterIsActive
{
  return self->_clusterIsActive;
}

- (void)setClusterIsActive:(BOOL)a3
{
  self->_clusterIsActive = a3;
}

- (COClusterRoleMonitor)roleMonitor
{
  return self->_roleMonitor;
}

- (NSObject)snapshotObserver
{
  return self->_snapshotObserver;
}

- (void).cxx_destruct
{
}

@end