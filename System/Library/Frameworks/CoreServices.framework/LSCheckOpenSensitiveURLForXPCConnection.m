@interface LSCheckOpenSensitiveURLForXPCConnection
@end

@implementation LSCheckOpenSensitiveURLForXPCConnection

uint64_t ___LSCheckOpenSensitiveURLForXPCConnection_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (object_getClass(v4) == (Class)MEMORY[0x1895F92E8])
  {
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    int v7 = [*(id *)(a1 + 40) hasPrefix:v6];
    if (v7) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
    uint64_t v5 = v7 ^ 1u;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  return v5;
}

@end