@interface KeychainItemUpgradeRequestServer
+ (id)server;
- (KeychainItemUpgradeRequestController)controller;
- (KeychainItemUpgradeRequestServer)initWithLockStateTracker:(id)a3;
- (void)setController:(id)a3;
@end

@implementation KeychainItemUpgradeRequestServer

- (KeychainItemUpgradeRequestServer)initWithLockStateTracker:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KeychainItemUpgradeRequestServer;
  v5 = -[KeychainItemUpgradeRequestServer init](&v9, "init");
  if (v5)
  {
    v6 = -[KeychainItemUpgradeRequestController initWithLockStateTracker:]( objc_alloc(&OBJC_CLASS___KeychainItemUpgradeRequestController),  "initWithLockStateTracker:",  v4);
    controller = v5->_controller;
    v5->_controller = v6;
  }

  return v5;
}

- (KeychainItemUpgradeRequestController)controller
{
  return (KeychainItemUpgradeRequestController *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)server
{
  if (qword_1002DE820 != -1) {
    dispatch_once(&qword_1002DE820, &stru_1002837D0);
  }
  return (id)qword_1002DE818;
}

@end