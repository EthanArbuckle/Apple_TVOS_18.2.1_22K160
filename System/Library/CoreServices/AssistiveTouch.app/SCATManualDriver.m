@interface SCATManualDriver
- (BOOL)_handleStepNextAction;
- (BOOL)_handleStepPreviousAction;
- (int)driverType;
- (void)_idleTimerDidFire;
@end

@implementation SCATManualDriver

- (int)driverType
{
  return 1;
}

- (BOOL)_handleStepNextAction
{
  return 1;
}

- (BOOL)_handleStepPreviousAction
{
  return 1;
}

- (void)_idleTimerDidFire
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATManualDriver;
  -[SCATDriver _idleTimerDidFire](&v3, "_idleTimerDidFire");
  if (-[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner")) {
    -[SCATDriver pauseScanning](self, "pauseScanning");
  }
}

@end