@interface SecVerifySignatureAndMac
@end

@implementation SecVerifySignatureAndMac

__n128 __SecVerifySignatureAndMac_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v3 = *(_OWORD *)(a1 + 48);
  __int128 v7 = *(_OWORD *)(a1 + 32);
  v6[2] = __SecVerifySignatureAndMac_block_invoke_2;
  v6[3] = &unk_189673458;
  char v11 = *(_BYTE *)(a1 + 64);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  __int128 v10 = v3;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  v12[2] = __PerformWithBufferAndClear_block_invoke;
  v12[3] = &unk_189676A80;
  v12[4] = v6;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v4;
  v13[1] = v4;
  __PerformWithBufferAndClear_block_invoke((uint64_t)v12, 0x20uLL, v13);
  return result;
}

@end