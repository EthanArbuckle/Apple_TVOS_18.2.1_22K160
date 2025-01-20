@interface CSAutomaticVolumeEnabledMonitor
+ (id)sharedInstance;
- (CSAutomaticVolumeEnabledMonitor)init;
- (void)_didReceiveAutomaticVolumeToggled:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation CSAutomaticVolumeEnabledMonitor

- (CSAutomaticVolumeEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAutomaticVolumeEnabledMonitor;
  return -[CSAutomaticVolumeEnabledMonitor init](&v3, "init");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v8 = v7;
  queue = (dispatch_queue_s *)self->_queue;
  if (queue)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000A3F8C;
    v10[3] = &unk_10022EFD0;
    id v11 = v7;
    v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)_didReceiveAutomaticVolumeToggled:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000A3F78;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSAutomaticVolumeEnabledMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[CSAutomaticVolumeEnabledMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector(v6, "CSAutomaticVolumeEnabledMonitor:didReceiveEnabled:") & 1) != 0) {
    [v6 CSAutomaticVolumeEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_queue = &self->_queue;
  objc_storeStrong((id *)&self->_queue, a3);
  id v6 = a3;
  id v7 = (dispatch_queue_s *)*p_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3EE4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_stopMonitoring
{
  queue = self->_queue;
  self->_queue = 0LL;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FEC0 != -1) {
    dispatch_once(&qword_10027FEC0, &stru_10022C130);
  }
  return (id)qword_10027FEB8;
}

@end