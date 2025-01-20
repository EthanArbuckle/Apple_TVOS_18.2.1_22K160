@interface GTFuture
@end

@implementation GTFuture

id __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) unlock];
}

void __24__GTFuture_notifyGroup___block_invoke(uint64_t a1)
{
}

void __34__GTFuture_notifyOnQueue_handler___block_invoke(uint64_t a1)
{
}

void __30__GTFuture_resolveWithFuture___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  [*(id *)(v2 + 16) unlock];
  objc_msgSend(*(id *)(a1 + 40), "_setResult:error:notify_NOLOCK:", v3, v4, 1);
}

id __31__GTFuture_timeoutAfter_label___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  id result = [*(id *)(v2 + 16) unlock];
  if (!v3) {
    return objc_msgSend( *(id *)(a1 + 32),  "_setResult:error:notify_NOLOCK:",  0,  +[GTError_capture errorWithDomain:code:userInfo:]( GTError_capture,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  5,  0),  1);
  }
  return result;
}

void __29__GTFuture_addResultHandler___block_invoke(uint64_t a1)
{
}

void __29__GTFuture_addResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  [*(id *)(v2 + 16) unlock];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __29__GTFuture_addResultHandler___block_invoke_3;
  block[3] = &unk_20D2C8;
  uint64_t v6 = *(void *)(a1 + 40);
  block[5] = v4;
  block[6] = v6;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void __29__GTFuture_addResultHandler___block_invoke_3(uint64_t a1)
{
}

void __26__GTFuture_logPerformance__block_invoke(id a1)
{
  +[GTFuture logPerformance]::log = -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"),  "BOOLForKey:",  @"GPUDebugger.DYFuture.LogPerformance");
}

@end