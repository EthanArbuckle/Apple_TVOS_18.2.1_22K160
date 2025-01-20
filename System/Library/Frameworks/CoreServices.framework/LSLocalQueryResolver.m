@interface LSLocalQueryResolver
@end

@implementation LSLocalQueryResolver

void __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v7 = *(void **)(v6 + 40);
  if (v8)
  {
    [v7 addObject:v8];
  }

  else
  {
    *(void *)(v6 + 40) = 0LL;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
}

BOOL __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v8 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(*(void *)(v8 + 8) + 24LL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v8 = *(void *)(a1 + 40);
  }

  if (!v5 && v6)
  {
    *(_BYTE *)(*(void *)(v8 + 8) + 24LL) = 1;
    uint64_t v8 = *(void *)(a1 + 40);
  }

  int v9 = *(unsigned __int8 *)(*(void *)(v8 + 8) + 24LL);
  objc_autoreleasePoolPop(v7);

  return v9 == 0;
}

@end