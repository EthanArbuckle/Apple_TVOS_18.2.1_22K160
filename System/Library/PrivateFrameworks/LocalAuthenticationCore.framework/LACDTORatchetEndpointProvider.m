@interface LACDTORatchetEndpointProvider
- (LACDTORatchetEndpointProvider)initWithContextProvider:(id)a3;
- (id)endpoint:(id *)a3;
@end

@implementation LACDTORatchetEndpointProvider

- (LACDTORatchetEndpointProvider)initWithContextProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACDTORatchetEndpointProvider;
  v5 = -[LACDTORatchetEndpointProvider init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_contextProvider, v4);
  }

  return v6;
}

- (id)endpoint:(id *)a3
{
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);
  [WeakRetained createContext];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__LACDTORatchetEndpointProvider_endpoint___block_invoke;
    v10[3] = &unk_18A368CC8;
    v12 = &v14;
    v13 = &v20;
    id v11 = v5;
    [v11 bootstrapServiceType:@"kLAServiceTypeRatchet" completionHandler:v10];
    id v6 = v11;
  }

  else
  {
    uint64_t v7 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Unable to create context");
    id v6 = (id)v15[5];
    v15[5] = v7;
  }

  if (a3) {
    *a3 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __42__LACDTORatchetEndpointProvider_endpoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v8 = v11;
  }

  id v9 = v8;
  v10 = *v7;
  *uint64_t v7 = v9;
}

- (void).cxx_destruct
{
}

@end