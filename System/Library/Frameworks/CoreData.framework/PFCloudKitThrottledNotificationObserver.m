@interface PFCloudKitThrottledNotificationObserver
- (PFCloudKitThrottledNotificationObserver)initWithLabel:(id)a3 handlerBlock:(id)a4;
- (void)dealloc;
- (void)noteRecievedNotification:(uint64_t)a1;
@end

@implementation PFCloudKitThrottledNotificationObserver

- (PFCloudKitThrottledNotificationObserver)initWithLabel:(id)a3 handlerBlock:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PFCloudKitThrottledNotificationObserver;
  v6 = -[PFCloudKitThrottledNotificationObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_notificationStalenessInterval = 10LL;
    atomic_store(0, (unsigned int *)&v6->_notificationIteration);
    v6->_label = (NSString *)a3;
    v7->_assertionLabel = (NSString *)[objc_alloc(NSString) initWithFormat:@"CoreData: %@", v7->_label];
    v7->_notificationHandlerBlock = (id)[a4 copy];
  }

  return v7;
}

- (void)dealloc
{
  self->_notificationHandlerBlock = 0LL;
  self->_assertionLabel = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitThrottledNotificationObserver;
  -[PFCloudKitThrottledNotificationObserver dealloc](&v3, sel_dealloc);
}

- (void)noteRecievedNotification:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 name];
    v4 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Got: %@ - %d"];
    v7 = (unsigned int *)(a1 + 8);
    atomic_load((unsigned int *)(a1 + 8));
    _NSCoreDataLog( v5,  v6,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
    objc_autoreleasePoolPop(v4);
    do
      unsigned int v14 = __ldaxr(v7);
    while (__stlxr(v14 + 1, v7));
    if (v14)
    {
      v15 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v16 = __ckLoggingOverride;
      }
      uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Already scheduled a block to respond to '%@', %d notifications since."];
      atomic_load((unsigned int *)(a1 + 8));
      _NSCoreDataLog( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
      objc_autoreleasePoolPop(v15);
    }

    else
    {
      uint64_t v28 = 0LL;
      uint64_t v24 = +[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  *(void *)(a1 + 16),  &v28);
      dispatch_time_t v25 = dispatch_time(0LL, 1000000000LL * *(void *)(a1 + 32));
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke;
      block[3] = &unk_189EABD68;
      block[4] = a1;
      block[5] = v3;
      block[6] = v24;
      block[7] = v28;
      dispatch_after(v25, global_queue, block);
    }
  }

void __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v2 = (unsigned int *)(*(void *)(a1 + 32) + 8LL);
  do
    __ldaxr(v2);
  while (__stlxr(0, v2));
  uint64_t v3 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v4 = __ckLoggingOverride;
  }
  uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Executing '%@' block for '%@' clearing %d iterations."];
  _NSCoreDataLog( v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]_block_invoke");
  objc_autoreleasePoolPop(v3);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (v12)
  {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(a1 + 40));
  }

  else
  {
    uint64_t v13 = [NSString stringWithUTF8String:"No notification handler block specified. Dropping: %@"];
    _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, *(void *)(a1 + 40));
    uint64_t v20 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: No notification handler block specified. Dropping: %@",  buf,  0xCu);
    }
  }

  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  *(void *)(a1 + 56),  *(void **)(a1 + 48));
}

@end