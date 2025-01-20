@interface LWCRExecutor
@end

@implementation LWCRExecutor

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke( uint64_t a1@<X0>,  uint64_t a2@<X1>,  uint64_t a3@<X2>,  uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v5 valueForKey:v6];
  v7 = (char *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_OWORD *)a4 = *(_OWORD *)(v7 + 8);
    *(void *)(a4 + 16) = *((void *)v7 + 3);
  }

  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0LL;
    *(void *)(a4 + 16) = 0LL;
  }
}

void __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2( uint64_t a1@<X0>,  uint64_t a2@<X1>,  uint64_t a3@<X2>,  uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v5 valueForKey:v6];
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    __int128 v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 8);
    *(_OWORD *)(a4 + 16) = v7;
    *(void *)(a4 + 32) = *((void *)v8 + 5);
  }

  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0LL;
    *(void *)(a4 + 16) = 0LL;
  }
}

BOOL __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v3 valueForKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

@end