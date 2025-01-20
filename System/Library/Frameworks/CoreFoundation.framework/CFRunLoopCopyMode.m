@interface CFRunLoopCopyMode
@end

@implementation CFRunLoopCopyMode

uint64_t ____CFRunLoopCopyMode_block_invoke(uint64_t result)
{
  **(_BYTE **)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

@end