@interface LSWriteApplicationPlaceholderToURL
@end

@implementation LSWriteApplicationPlaceholderToURL

void ___LSWriteApplicationPlaceholderToURL_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E2A59C]();
  id v12 = 0LL;
  v9 = 0LL;
  id v10 = 0LL;
  char v11 = 0;
  int v3 = _LSWriteBundlePlaceholderToURLInternal((id *)&v9, *(NSURL **)(a1 + 32), *(NSURL **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    id v5 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v3,  (uint64_t)"_LSWriteApplicationPlaceholderToURL_block_invoke",  62LL,  0LL);
    uint64_t v6 = 0LL;
  }

  else
  {
    id v5 = 0LL;
    uint64_t v6 = 1LL;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v6, v5);
  if (v9 && v11) {
    _LSContextDestroy(v9);
  }
  id v7 = v10;
  v9 = 0LL;
  id v10 = 0LL;

  char v11 = 0;
  id v8 = v12;
  id v12 = 0LL;

  objc_autoreleasePoolPop(v2);
}

@end