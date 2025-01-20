@interface XBLaunchImageClientTransactionWork
- (XBLaunchImageClientTransactionWork)init;
- (XBLaunchImageContextWrapper)contextWrapper;
- (void)setContextWrapper:(id)a3;
@end

@implementation XBLaunchImageClientTransactionWork

- (XBLaunchImageClientTransactionWork)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XBLaunchImageClientTransactionWork;
  v2 = -[XBLaunchImageClientTransactionWork init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = os_transaction_create("LaunchImageClient");
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;
  }

  return v2;
}

- (XBLaunchImageContextWrapper)contextWrapper
{
  return self->_contextWrapper;
}

- (void)setContextWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end