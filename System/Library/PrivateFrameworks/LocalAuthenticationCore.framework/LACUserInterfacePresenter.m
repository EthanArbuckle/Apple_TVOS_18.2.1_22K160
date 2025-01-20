@interface LACUserInterfacePresenter
- (LACUserInterfacePresenter)initWithReplyQueue:(id)a3 uiController:(id)a4;
- (void)presentUIForIdentifier:(int64_t)a3 request:(id)a4 completion:(id)a5;
@end

@implementation LACUserInterfacePresenter

- (LACUserInterfacePresenter)initWithReplyQueue:(id)a3 uiController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACUserInterfacePresenter;
  v9 = -[LACUserInterfacePresenter init](&v15, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:]( &OBJC_CLASS___LACConcurrencyUtilities,  "createUserInitiatedSerialQueueWithIdentifier:",  v11);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_replyQueue, a3);
    objc_storeStrong((id *)&v9->_uiController, a4);
  }

  return v9;
}

- (void)presentUIForIdentifier:(int64_t)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    [v8 options];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1000];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKey:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 BOOLValue];

    LACLogUI();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        NSStringFromLACUserInterfaceRequestIdentifier(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "Skipping UI for %@ rid: %{public}@, not interactive evaluation",  buf,  0x16u);
      }

      replyQueue = (dispatch_queue_s *)self->_replyQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5;
      block[3] = &unk_18A3692C8;
      id v33 = v9;
      dispatch_async(replyQueue, block);
    }

    else
    {
      if (v15)
      {
        NSStringFromLACUserInterfaceRequestIdentifier(a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_189219000, v14, OS_LOG_TYPE_DEFAULT, "Will present UI for %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      workQueue = (dispatch_queue_s *)self->_workQueue;
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6;
      v28[3] = &unk_18A368DD0;
      objc_copyWeak(v31, (id *)buf);
      id v29 = v8;
      v31[1] = (id)a3;
      id v30 = v9;
      dispatch_async(workQueue, v28);

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    LACLogUI();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[LACUserInterfacePresenter presentUIForIdentifier:request:completion:].cold.1((uint64_t)self, a3, v19);
    }

    v20 = (void *)NSString;
    [MEMORY[0x189607968] numberWithInteger:a3];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 stringWithFormat:@"Unsupported user interface request: %@", v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[LACError errorWithCode:debugDescription:](&OBJC_CLASS___LACError, "errorWithCode:debugDescription:", -1000LL, v22);
    v24 = (dispatch_queue_s *)self->_replyQueue;
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke;
    v34[3] = &unk_18A368E98;
    id v35 = v23;
    id v36 = v9;
    id v25 = v23;
    dispatch_async(v24, v34);
  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 3);
    [*(id *)(a1 + 32) contextID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 userInterfaceWithUUID:v6];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 32);
    v10 = -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:]( objc_alloc(&OBJC_CLASS___LACUserInterfaceRequest),  "initWithIdentifier:evaluationRequest:",  v8,  v9);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3;
    v12[3] = &unk_18A369318;
    v15[1] = *(id *)(a1 + 56);
    objc_copyWeak(v15, v2);
    id v14 = *(id *)(a1 + 40);
    id v11 = v7;
    id v13 = v11;
    [v11 processRequest:v10 completion:v12];

    objc_destroyWeak(v15);
  }
}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogUI();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLACUserInterfaceRequestIdentifier(*(void *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_189219000, v4, OS_LOG_TYPE_DEFAULT, "Did dismiss UI for %@ with error: %@", buf, 0x16u);
  }

  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained[1];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9;
    block[3] = &unk_18A3692F0;
    id v12 = *(id *)(a1 + 40);
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, block);
  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

- (void)presentUIForIdentifier:(uint64_t)a1 request:(uint64_t)a2 completion:(os_log_s *)a3 .cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  NSStringFromLACUserInterfaceRequestIdentifier(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl( &dword_189219000,  a3,  OS_LOG_TYPE_ERROR,  "%@ cannot present UI for identifier: %@",  (uint8_t *)&v6,  0x16u);
}

@end