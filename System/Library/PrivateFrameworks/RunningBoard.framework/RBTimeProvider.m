@interface RBTimeProvider
+ (id)sharedInstance;
- (double)startTimeForProcess:(id)a3;
- (id)executeWithCancellingAfter:(double)a3 onQueue:(id)a4 block:(id)a5;
- (void)executeAfter:(double)a3 onQueue:(id)a4 block:(id)a5;
@end

@implementation RBTimeProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  return (id)sharedInstance_result;
}

void __32__RBTimeProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RBTimeProvider);
  v1 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v0;
}

- (void)executeAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a5;
  queue = (dispatch_queue_s *)a4;
  dispatch_time_t v8 = dispatch_time(0LL, v6);
  dispatch_after(v8, queue, v7);
}

- (id)executeWithCancellingAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a5;
  dispatch_time_t v8 = (dispatch_queue_s *)a4;
  dispatch_time_t v9 = dispatch_time(0LL, v6);
  dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v8);

  dispatch_set_context(v10, v10);
  dispatch_source_set_timer(v10, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v10, v7);

  dispatch_activate(v10);
  v11 = +[RBTimeProviderEvent eventWithSource:](&OBJC_CLASS___RBTimeProviderEvent, "eventWithSource:", v10);
  return v11;
}

- (double)startTimeForProcess:(id)a3
{
  return result;
}

@end