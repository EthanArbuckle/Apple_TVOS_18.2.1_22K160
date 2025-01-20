@interface HHDKeepAliveManagerFactory
- (id)createAnalyticsReporter;
- (id)createFileManager;
- (id)createTransactionWithName:(const char *)a3;
@end

@implementation HHDKeepAliveManagerFactory

- (id)createFileManager
{
  return objc_alloc_init(&OBJC_CLASS___HHDKeepAliveFileManager);
}

- (id)createTransactionWithName:(const char *)a3
{
  return (id)os_transaction_create(a3, a2);
}

- (id)createAnalyticsReporter
{
  return +[HHAnalyticsReporter sharedReporter](&OBJC_CLASS___HHAnalyticsReporter, "sharedReporter");
}

@end