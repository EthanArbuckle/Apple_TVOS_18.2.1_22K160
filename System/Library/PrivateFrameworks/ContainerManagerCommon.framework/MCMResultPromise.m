@interface MCMResultPromise
- (BOOL)complete;
- (MCMResult)result;
- (MCMResultPromise)init;
- (MCMResultPromise)initWithCompletion:(id)a3;
- (id)completion;
- (void)completeWithResult:(id)a3;
@end

@implementation MCMResultPromise

- (MCMResultPromise)initWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMResultPromise;
  v5 = -[MCMResultPromise init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5->_result;
    v5->_result = 0LL;

    uint64_t v8 = MEMORY[0x1895CE54C](v4);
    id completion = v6->_completion;
    v6->_id completion = (id)v8;

    v6->_complete = 0;
  }

  return v6;
}

- (MCMResultPromise)init
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMResultPromise;
  v2 = -[MCMResultPromise init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    id v4 = v2->_result;
    v2->_result = 0LL;

    id completion = v3->_completion;
    v3->_id completion = 0LL;

    v3->_complete = 0;
  }

  return v3;
}

- (MCMResult)result
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_result;
  if (!v3)
  {
    _os_crash();
    __break(1u);
  }

  id v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)completeWithResult:(id)a3
{
  id v10 = a3;
  v5 = self;
  objc_sync_enter(v5);
  p_result = &v5->_result;
  objc_storeStrong((id *)&v5->_result, a3);
  v5->_complete = 1;
  -[MCMResultPromise completion](v5, "completion");
  objc_super v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v7)
  {
    uint64_t v8 = v7[2](v7, *p_result);
    v9 = (void *)*p_result;
    void *p_result = v8;
  }
}

- (BOOL)complete
{
  return self->_complete;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
}

@end