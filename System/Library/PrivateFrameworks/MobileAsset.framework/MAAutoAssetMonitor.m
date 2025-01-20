@interface MAAutoAssetMonitor
+ (BOOL)supportsSecureCoding;
+ (id)defaultDispatchQueue;
- (MAAutoAssetMonitor)initWithCoder:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (NSString)autoAssetClientName;
- (OS_dispatch_queue)notificationDispatchQueue;
- (id)cancelRegistrationSync;
- (id)description;
- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 error:(id *)a5 notifyingStatusChanges:(id)a6;
- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 notifyingFromQueue:(id)a5 error:(id *)a6 notifyingStatusChanges:(id)a7;
- (id)registerForNotificationsSync;
- (id)registerForNotificationsSync:(id)a3;
- (id)statusChangeNotificationBlock;
- (id)summary;
- (void)cancelRegistration:(id)a3;
- (void)registerForNotifications:(id)a3;
- (void)registerForNotifications:(id)a3 completion:(id)a4;
- (void)setStatusChangeNotificationBlock:(id)a3;
@end

@implementation MAAutoAssetMonitor

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 error:(id *)a5 notifyingStatusChanges:(id)a6
{
  return -[MAAutoAssetMonitor initForClientName:forAssetSelector:notifyingFromQueue:error:notifyingStatusChanges:]( self,  "initForClientName:forAssetSelector:notifyingFromQueue:error:notifyingStatusChanges:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 notifyingFromQueue:(id)a5 error:(id *)a6 notifyingStatusChanges:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MAAutoAssetMonitor;
  v17 = -[MAAutoAssetMonitor init](&v25, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v23 = v18;
    goto LABEL_9;
  }

  objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
  objc_storeStrong((id *)&v18->_assetSelector, a4);
  uint64_t v19 = MEMORY[0x1895A2018](v16);
  id statusChangeNotificationBlock = v18->_statusChangeNotificationBlock;
  v18->_id statusChangeNotificationBlock = (id)v19;

  if (v15)
  {
    v21 = (OS_dispatch_queue *)v15;
  }

  else
  {
    +[MAAutoAssetMonitor defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetMonitor, "defaultDispatchQueue");
    v21 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }

  notificationDispatchQueue = v18->_notificationDispatchQueue;
  v18->_notificationDispatchQueue = v21;

  if (v18->_notificationDispatchQueue)
  {
    if (a6) {
      *a6 = 0LL;
    }
    goto LABEL_8;
  }

  if (a6)
  {
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"auto-monitor(defaultDispatchQueue)",  0LL,  @"unable to assign notification dispatch queue");
    v23 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v23 = 0LL;
  }

- (MAAutoAssetMonitor)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MAAutoAssetMonitor;
  return -[MAAutoAssetMonitor init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)registerForNotifications:(id)a3
{
  id v4 = a3;
  dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__MAAutoAssetMonitor_registerForNotifications___block_invoke;
  v7[3] = &unk_189FF9738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__MAAutoAssetMonitor_registerForNotifications___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) assetSelector];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)registerForNotificationsSync
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  @"auto-monitor(registerForNotificationsSync)",  0LL,  @"MAAutoAsset-under-development");
}

- (void)registerForNotifications:(id)a3 completion:(id)a4
{
  id v5 = a4;
  dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke;
  v8[3] = &unk_189FF9738;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) assetSelector];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)registerForNotificationsSync:(id)a3
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  @"auto-monitor(registerForNotificationsSync:)",  0LL,  @"MAAutoAsset-under-development");
}

- (void)cancelRegistration:(id)a3
{
  id v4 = a3;
  dispatch_get_global_queue(0LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__MAAutoAssetMonitor_cancelRegistration___block_invoke;
  v7[3] = &unk_189FF9738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__MAAutoAssetMonitor_cancelRegistration___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(void *)(a1 + 40))
  {
    v2 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
    uint64_t v3 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) assetSelector];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);
  }
}

- (id)cancelRegistrationSync
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  @"auto-monitor(cancelRegistrationSync)",  0LL,  @"MAAutoAsset-under-development");
}

- (id)description
{
  return @"MAAutoAssetMonitor SPI:description not-yet-implemented [see rdar://84676752]";
}

- (id)summary
{
  return @"MAAutoAssetMonitor SPI:summary not-yet-implemented [see rdar://84676752]";
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_0 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_0, &__block_literal_global_3);
  }
  return (id)defaultDispatchQueue_defaultQueue_0;
}

void __42__MAAutoAssetMonitor_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.framework.autoassetmonitor" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_0;
  defaultDispatchQueue_defaultQueue_0 = (uint64_t)v1;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (id)statusChangeNotificationBlock
{
  return self->_statusChangeNotificationBlock;
}

- (void)setStatusChangeNotificationBlock:(id)a3
{
}

- (OS_dispatch_queue)notificationDispatchQueue
{
  return self->_notificationDispatchQueue;
}

- (void).cxx_destruct
{
}

@end