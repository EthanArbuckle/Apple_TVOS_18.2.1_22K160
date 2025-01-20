@interface LSGetStatus
@end

@implementation LSGetStatus

uint64_t ___LSGetStatus_block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

@end