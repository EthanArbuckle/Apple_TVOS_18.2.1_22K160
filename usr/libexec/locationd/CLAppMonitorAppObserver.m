@interface CLAppMonitorAppObserver
- (CLAppMonitorAppObserver)initWithAppMonitorProxy:(id)a3;
- (CLAppMonitorProtocol)appMonitor;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setAppMonitor:(id)a3;
@end

@implementation CLAppMonitorAppObserver

- (CLAppMonitorAppObserver)initWithAppMonitorProxy:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLAppMonitorAppObserver;
  v4 = -[CLAppMonitorAppObserver init](&v6, "init");
  if (v4) {
    v4->_appMonitor = (CLAppMonitorProtocol *)a3;
  }
  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)dealloc
{
  self->_appMonitor = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAppMonitorAppObserver;
  -[CLAppMonitorAppObserver dealloc](&v3, "dealloc");
}

- (CLAppMonitorProtocol)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
  self->_appMonitor = (CLAppMonitorProtocol *)a3;
}

@end