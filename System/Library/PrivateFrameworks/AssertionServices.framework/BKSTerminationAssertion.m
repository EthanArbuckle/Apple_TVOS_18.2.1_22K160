@interface BKSTerminationAssertion
- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 context:(id)a6 withHandler:(id)a7;
- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 withHandler:(id)a6;
- (BKSTerminationContext)context;
- (BOOL)acquire;
- (NSString)targetBundleIdentifier;
- (unint64_t)_bksErrorForRBSRequestError:(unint64_t)a3;
- (unint64_t)efficacy;
- (void)invalidate;
@end

@implementation BKSTerminationAssertion

- (unint64_t)_bksErrorForRBSRequestError:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return 0LL;
  }
  else {
    return qword_1862E1A90[a3 - 1];
  }
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 withHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[BKSTerminationContext terminationAssertionContext]( &OBJC_CLASS___BKSTerminationContext,  "terminationAssertionContext");
  v14 = -[BKSTerminationAssertion initWithBundleIdentifier:efficacy:name:context:withHandler:]( self,  "initWithBundleIdentifier:efficacy:name:context:withHandler:",  v12,  a4,  v11,  v13,  v10);

  return v14;
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 context:(id)a6 withHandler:(id)a7
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___BKSTerminationAssertion;
  v14 = -[BKSAssertion _initWithName:handler:](&v25, sel__initWithName_handler_, a5, a7);
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v14->_efficacy = a4;
    uint64_t v17 = [v13 copy];
    context = v14->_context;
    v14->_context = (BKSTerminationContext *)v17;

    [MEMORY[0x189612388] systemTarget];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSAssertion _setTarget:](v14, "_setTarget:", v19);

    v20 = (void *)MEMORY[0x189612290];
    [MEMORY[0x189612320] predicateMatchingBundleIdentifier:v12];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 limitationWithPredicate:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    [MEMORY[0x189603F18] arrayWithObjects:v26 count:1];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSAssertion _setAttributes:](v14, "_setAttributes:", v23);

    -[BKSAssertion _acquireAsynchronously](v14, "_acquireAsynchronously");
  }

  return v14;
}

- (BOOL)acquire
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = __Block_byref_object_copy__46;
  v11[4] = __Block_byref_object_dispose__47;
  id v12 = 0LL;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  uint64_t v2 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__BKSTerminationAssertion_acquire__block_invoke;
  v6[3] = &unk_189E3B508;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = v11;
  v6[7] = &v13;
  -[BKSAssertion _lock:](self, "_lock:", v6);
  if (v14[5])
  {
    v5[0] = v2;
    v5[1] = 3221225472LL;
    v5[2] = __34__BKSTerminationAssertion_acquire__block_invoke_2;
    v5[3] = &unk_189E3B530;
    v5[4] = &v13;
    v5[5] = &v7;
    v5[6] = v11;
    [MEMORY[0x1896123B0] performBackgroundWork:v5];
  }

  char v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

void __34__BKSTerminationAssertion_acquire__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(MEMORY[0x189612398]);
  objc_msgSend(v3, "setExceptionCode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "exceptionCode"));
  objc_msgSend(*(id *)(a1 + 32), "_lock_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setExplanation:v4];

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72LL);
  if (v5 == 2) {
    unsigned int v6 = 30;
  }
  else {
    unsigned int v6 = 20;
  }
  if (v5 == 3) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setMaximumTerminationResistance:v7];
  v8 = (void *)[objc_alloc(MEMORY[0x1896123A0]) initWithProcessIdentity:v2 context:v3];
  id v23 = 0LL;
  id v24 = 0LL;
  char v9 = [v8 execute:&v24 error:&v23];
  id v10 = v24;
  id v11 = v23;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_lock_setInternalAssertion:", v10);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) && v10)
  {
    [v11 domain];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:*MEMORY[0x1896124B0]])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 3) {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      }
    }

    else
    {
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "_bksErrorForRBSRequestError:", objc_msgSend(v11, "code"));
    [v11 userInfo];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v14 errorWithDomain:@"BKSAssertionError" code:v15 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }

  uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_lock_acquisitionHandler");
  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
}

uint64_t __34__BKSTerminationAssertion_acquire__block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1[4] + 8LL) + 40LL) + 16LL))( *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
}

- (void)invalidate
{
}

- (unint64_t)efficacy
{
  return self->_efficacy;
}

- (NSString)targetBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BKSTerminationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end