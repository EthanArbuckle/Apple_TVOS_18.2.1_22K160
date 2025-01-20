@interface SecureBackupDaemonLoggerObservers
- (SecureBackupDaemonLoggerObservers)initWithLogger:(id)a3;
@end

@implementation SecureBackupDaemonLoggerObservers

- (SecureBackupDaemonLoggerObservers)initWithLogger:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecureBackupDaemonLoggerObservers;
  v5 = -[SecureBackupDaemonLoggerObservers init](&v8, "init");
  if (v5)
  {
    [v4 updateExistingOperations];
    v6 = v5;
  }

  return v5;
}

@end