@interface LWCRExecutor
+ (id)executor;
- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4;
@end

@implementation LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
  uint64_t v7 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v25[3] = &unk_189F83150;
  id v26 = v6;
  v23[0] = v7;
  v23[1] = 3221225472LL;
  v23[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v23[3] = &unk_189F83178;
  id v24 = v26;
  v21[0] = v7;
  v21[1] = 3221225472LL;
  v21[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4;
  v21[3] = &unk_189F831A0;
  id v8 = v24;
  id v22 = v8;
  v27 = off_189F831D0;
  id v28 = (id)MEMORY[0x186E4830C](v25);
  id v29 = (id)MEMORY[0x186E4830C](v23);
  id v30 = (id)MEMORY[0x186E4830C](v21);
  v20[0] = &v27;
  v20[1] = 0LL;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v9 = *(_OWORD *)(v5 + 72);
  __int128 v31 = *(_OWORD *)(v5 + 56);
  __int128 v32 = v9;
  __int128 v33 = *(_OWORD *)(v5 + 88);
  uint64_t v34 = *((void *)v5 + 13);
  else {
    v10 = 0LL;
  }
  TLE::Executor::getOperationsFromCE((TLE::Executor *)v20, v10, (uint64_t)&v18);
  if ((_DWORD)v18)
  {
    BOOL v11 = 0;
    v12 = (void *)*((void *)&v19 + 1);
    if (!*((void *)&v19 + 1)) {
      goto LABEL_16;
    }
  }

  else
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v12 = (void *)*((void *)&v19 + 1);
    (*(void (**)(__int128 *__return_ptr, void, void (***)(TLE::CallbackEncyclopedia *__hidden)))(**((void **)&v19 + 1) + 16LL))( &v31,  *((void *)&v19 + 1),  &v27);
    if ((_DWORD)v31) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = BYTE8(v32) == 0;
    }
    BOOL v11 = !v13;
  }

  uint64_t v14 = v12[1];
  if (v14 <= 0)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "Over-release of an object";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  uint64_t v15 = v14 - 1;
  v12[1] = v15;
  if (!v15) {
    (*(void (**)(void *))(*v12 + 8LL))(v12);
  }
LABEL_16:

  return v11;
}

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2( uint64_t a1@<X0>,  uint64_t a2@<X1>,  uint64_t a3@<X2>,  uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  id v6 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v5 valueForKey:v6];
  uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();

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

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3( uint64_t a1@<X0>,  uint64_t a2@<X1>,  uint64_t a3@<X2>,  uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  id v6 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v5 valueForKey:v6];
  id v8 = (char *)objc_claimAutoreleasedReturnValue();

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

BOOL __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = (void *)[objc_alloc(NSString) initWithBytes:a2 length:a3 encoding:4];
  [v3 valueForKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

uint64_t __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 bindName:a2];
}

+ (id)executor
{
  return objc_alloc_init(&OBJC_CLASS___LWCRExecutor);
}

@end