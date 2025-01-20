@interface PFCloudKitStoreMonitorProvider
- (id)createMonitorForObservedStore:(id)result inTransactionWithLabel:(uint64_t)a2;
@end

@implementation PFCloudKitStoreMonitorProvider

- (id)createMonitorForObservedStore:(id)result inTransactionWithLabel:(uint64_t)a2
{
  if (result) {
    return -[PFCloudKitStoreMonitor initForStore:]( objc_alloc(&OBJC_CLASS___PFCloudKitStoreMonitor),  "initForStore:",  a2);
  }
  return result;
}

@end