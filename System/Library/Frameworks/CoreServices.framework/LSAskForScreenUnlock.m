@interface LSAskForScreenUnlock
@end

@implementation LSAskForScreenUnlock

void ___LSAskForScreenUnlock_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___LSAskForScreenUnlock_block_invoke_2;
  block[3] = &unk_189D78870;
  v6 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t ___LSAskForScreenUnlock_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

@end