@interface LACConcurrencyUtilities
+ (OS_dispatch_queue)daemonQueue;
+ (id)createDefaultQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4;
+ (id)createDefaultSerialQueueWithIdentifier:(id)a3;
+ (id)createQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4 qos:(unsigned int)a5;
+ (id)createSerialQueueWithIdentifier:(id)a3 qos:(unsigned int)a4;
+ (id)createUserInitiatedSerialQueueWithIdentifier:(id)a3;
+ (id)globalUserInitiatedConcurrentQueue;
@end

@implementation LACConcurrencyUtilities

+ (OS_dispatch_queue)daemonQueue
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__LACConcurrencyUtilities_daemonQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (daemonQueue_onceToken != -1) {
    dispatch_once(&daemonQueue_onceToken, block);
  }
  return (OS_dispatch_queue *)(id)daemonQueue__queue;
}

void __38__LACConcurrencyUtilities_daemonQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) createUserInitiatedSerialQueueWithIdentifier:@"daemon-serial-queue"];
  v2 = (void *)daemonQueue__queue;
  daemonQueue__queue = v1;
}

+ (id)createDefaultSerialQueueWithIdentifier:(id)a3
{
  return (id)[a1 createDefaultQueueWithIdentifier:a3 concurrencyAttribute:0];
}

+ (id)createUserInitiatedSerialQueueWithIdentifier:(id)a3
{
  return (id)[a1 createSerialQueueWithIdentifier:a3 qos:25];
}

+ (id)createSerialQueueWithIdentifier:(id)a3 qos:(unsigned int)a4
{
  return (id)[a1 createQueueWithIdentifier:a3 concurrencyAttribute:0 qos:*(void *)&a4];
}

+ (id)createDefaultQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4
{
  id v5 = a3;
  v6 = (dispatch_queue_attr_s *)a4;
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v5 UTF8String], v6);

  return v7;
}

+ (id)createQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4 qos:(unsigned int)a5
{
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[a3 UTF8String], v6);

  return v7;
}

+ (id)globalUserInitiatedConcurrentQueue
{
  return dispatch_get_global_queue(25LL, 0LL);
}

@end