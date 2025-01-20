@interface SHA256
@end

@implementation SHA256

uint64_t __SHA256_FdChunk_block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __SHA256_FdChunk_block_invoke_2(uint64_t result, int a2, dispatch_data_t data, int a4)
{
  v7 = (void *)result;
  if (data)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 0x40000000LL;
    applier[2] = __SHA256_FdChunk_block_invoke_3;
    applier[3] = &unk_18A30CB18;
    applier[4] = *(void *)(result + 32);
    result = dispatch_data_apply(data, applier);
  }

  if (a4) {
    *(_DWORD *)(*(void *)(v7[5] + 8LL) + 24LL) = a4;
  }
  if (a2)
  {
    v8 = (dispatch_semaphore_s *)v7[7];
    *(_BYTE *)(*(void *)(v7[6] + 8LL) + 24LL) = data == (dispatch_data_t)MEMORY[0x1895F8AA8];
    return dispatch_semaphore_signal(v8);
  }

  return result;
}

uint64_t __SHA256_FdChunk_block_invoke_3(uint64_t a1, int a2, int a3, void *data, unint64_t len)
{
  if (len >> 31) {
    MD4FdChunk_cold_1();
  }
  CC_SHA256_Update((CC_SHA256_CTX *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), data, len);
  return 1LL;
}

@end