@interface LSCoreTypesRecordProxy
@end

@implementation LSCoreTypesRecordProxy

uint64_t __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke( uint64_t result,  int a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a3;
  if (*(_DWORD *)(*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) + 160LL) == 11)
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = a2;
    *a5 = 1;
  }

  return result;
}

void __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke_3(uint64_t a1, void *a2)
{
}

@end