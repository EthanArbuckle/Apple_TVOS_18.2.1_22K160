@interface SCDynamicStoreNullSession
@end

@implementation SCDynamicStoreNullSession

SCDynamicStoreRef ____SCDynamicStoreNullSession_block_invoke()
{
  SCDynamicStoreRef result = SCDynamicStoreCreateWithOptions(0LL, @"null", 0LL, 0LL, 0LL);
  S_null_session = (uint64_t)result;
  return result;
}

@end