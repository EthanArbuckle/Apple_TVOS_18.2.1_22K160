@interface RPSetLogLevel
@end

@implementation RPSetLogLevel

dispatch_semaphore_s *___RPSetLogLevel_block_invoke(uint64_t a1)
{
  result = *(dispatch_semaphore_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result)
  {
    result = (dispatch_semaphore_s *)dispatch_semaphore_signal(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

  return result;
}

@end