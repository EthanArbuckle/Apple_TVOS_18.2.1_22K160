@interface CLHidEventMonitorManager
- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5;
- (void)addSystemClientMatching:(id)a3;
- (void)removeSystemClientmatching:(id)a3;
@end

@implementation CLHidEventMonitorManager

- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLHidEventMonitorManager;
  return -[CLHidEventManager initWithDelegate:queue:matching:type:]( &v6,  "initWithDelegate:queue:matching:type:",  a3,  a4,  a5,  1LL);
}

- (void)addSystemClientMatching:(id)a3
{
}

- (void)removeSystemClientmatching:(id)a3
{
}

@end