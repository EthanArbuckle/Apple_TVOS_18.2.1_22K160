@interface LSLazyLoadObjectOnQueue
@end

@implementation LSLazyLoadObjectOnQueue

void ___LSLazyLoadObjectOnQueue_block_invoke(uint64_t a1)
{
}

void ___LSLazyLoadObjectOnQueue_block_invoke_2(uint64_t a1)
{
  id v2 = **(id **)(a1 + 48);
  if (!v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void ***)(a1 + 48);
    id v2 = v3;
    v5 = *v4;
    *v4 = v2;
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v2;
}

@end