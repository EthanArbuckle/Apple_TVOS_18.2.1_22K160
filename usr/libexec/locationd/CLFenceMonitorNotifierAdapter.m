@interface CLFenceMonitorNotifierAdapter
- (BOOL)valid;
- (CLFenceMonitorNotifierAdapter)initWithFenceMonitor:(void *)a3;
- (void)fenceNotifier;
- (void)onScenarioTrigger:(id)a3;
- (void)onVisit:(id)a3;
- (void)setFenceNotifier:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLFenceMonitorNotifierAdapter

- (CLFenceMonitorNotifierAdapter)initWithFenceMonitor:(void *)a3
{
  if (!a3) {
    return 0LL;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLFenceMonitorNotifierAdapter;
  result = -[CLFenceMonitorNotifierAdapter init](&v5, "init");
  if (result)
  {
    result->_fenceNotifier = a3;
    result->_valid = 1;
  }

  return result;
}

- (void)onVisit:(id)a3
{
  if (-[CLFenceMonitorNotifierAdapter valid](self, "valid")) {
    sub_1009BDC00((uint64_t)-[CLFenceMonitorNotifierAdapter fenceNotifier](self, "fenceNotifier"), a3);
  }
}

- (void)onScenarioTrigger:(id)a3
{
  if (-[CLFenceMonitorNotifierAdapter valid](self, "valid")) {
    sub_1009BDE54((uint64_t)-[CLFenceMonitorNotifierAdapter fenceNotifier](self, "fenceNotifier"), a3);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)fenceNotifier
{
  return self->_fenceNotifier;
}

- (void)setFenceNotifier:(void *)a3
{
  self->_fenceNotifier = a3;
}

@end