@interface AppURLInContainer
@end

@implementation AppURLInContainer

uint64_t ___AppURLInContainer_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  v7 = v6;
  if (a3 == 4
    && ([v6 pathExtension],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"app"],
        v8,
        v9))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  return v10;
}

@end