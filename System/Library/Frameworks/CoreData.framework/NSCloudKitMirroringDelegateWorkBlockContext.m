@interface NSCloudKitMirroringDelegateWorkBlockContext
- (NSCloudKitMirroringDelegateWorkBlockContext)initWithTransactionLabel:(id)a3 powerAssertionLabel:(id)a4;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegateWorkBlockContext

- (NSCloudKitMirroringDelegateWorkBlockContext)initWithTransactionLabel:(id)a3 powerAssertionLabel:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateWorkBlockContext;
  v6 = -[NSCloudKitMirroringDelegateWorkBlockContext init](&v9, sel_init);
  if (v6)
  {
    v6->_transactionLabel = (NSString *)a3;
    v7 = (NSString *)a4;
    v6->_powerAssertionLabel = v7;
    v6->_uiAppInstance = (id)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)v7,  &v6->_powerAssertionID);
  }

  return v6;
}

- (void)dealloc
{
  self->_uiAppInstance = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringDelegateWorkBlockContext;
  -[NSCloudKitMirroringDelegateWorkBlockContext dealloc](&v3, sel_dealloc);
}

@end