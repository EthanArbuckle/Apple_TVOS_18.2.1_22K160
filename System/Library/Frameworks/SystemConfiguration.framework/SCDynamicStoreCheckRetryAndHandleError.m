@interface SCDynamicStoreCheckRetryAndHandleError
@end

@implementation SCDynamicStoreCheckRetryAndHandleError

uint64_t ____SCDynamicStoreCheckRetryAndHandleError_block_invoke(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(*(void *)(result + 32) + 40LL);
  if (v1)
  {
    uint64_t v2 = result;
    result = mach_port_deallocate(*MEMORY[0x1895FBBE0], v1);
    *(_DWORD *)(*(void *)(v2 + 32) + 40LL) = 0;
  }

  return result;
}

@end