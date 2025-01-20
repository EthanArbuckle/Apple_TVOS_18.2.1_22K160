@interface UTDynamicGetTagSpecification
@end

@implementation UTDynamicGetTagSpecification

void ___UTDynamicGetTagSpecification_block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  v11 = (void *)[objc_alloc(NSString) initWithBytes:*(void *)a3 length:*(unsigned int *)(a3 + 8) encoding:4];
  if (v11)
  {
    v14 = v11;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12 forKeyedSubscript:v14];
    }

    v13 = (void *)[objc_alloc(NSString) initWithBytes:*(void *)a5 length:*(unsigned int *)(a5 + 8) encoding:4];
    if (v13) {
      [v12 addObject:v13];
    }

    v11 = v14;
  }
}

@end