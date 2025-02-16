@interface NDPowerlogReporter
- (NDPowerlogReporter)initWithTask:(id)a3;
- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4;
- (void)taskWillResume;
- (void)taskWillSuspend;
@end

@implementation NDPowerlogReporter

- (NDPowerlogReporter)initWithTask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NDPowerlogReporter;
  v6 = -[NDPowerlogReporter init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    v7->_hasStarted = 0;
    v7->_suspendedDurationSinceLastUpdate = 0.0;
  }

  return v7;
}

- (void)taskWillResume
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_hasStarted)
  {
    self->_suspendedDurationSinceLastUpdate = self->_suspendedDurationSinceLastUpdate + Current - self->_lastSuspendTime;
  }

  else
  {
    self->_hasStarted = 1;
    self->_lastUpdateTime = Current;
  }

- (void)taskWillSuspend
{
  self->_lastSuspendTime = CFAbsoluteTimeGetCurrent();
}

- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4
{
  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  self->_suspendedDurationSinceLastUpdate = 0.0;
}

- (void).cxx_destruct
{
}

@end