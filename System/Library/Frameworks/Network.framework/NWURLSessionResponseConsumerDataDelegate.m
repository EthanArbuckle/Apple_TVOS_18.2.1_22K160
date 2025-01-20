@interface NWURLSessionResponseConsumerDataDelegate
- (NSURLResponse)response;
- (id)createResumeInfo;
- (int64_t)countOfBytesReceived;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDataDelegate

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    objc_setProperty_atomic(self, v10, v9, 8LL);
  }
  uint64_t v12 = countOfBytesExpectedToReceive(v9);
  -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  if (v8)
  {
    uint64_t v13 = 31LL;
    if (!v8[31]) {
      uint64_t v13 = 30LL;
    }
    id v14 = (id)v8[v13];
  }

  else
  {
    id v14 = 0LL;
  }

  v15 = (void *)MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v32 = __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke;
  v33 = &unk_189BC08A8;
  id v34 = v11;
  id v16 = v11;
  v17 = v8;
  id v18 = v9;
  v20 = v31;
  if (v14)
  {
    v21 = -[NWURLSessionDelegateWrapper delegateFor_didReceiveResponse]((char *)v14, v19);
    if (v21)
    {
      id v30 = *((id *)v14 + 4);
      id v22 = *((id *)v14 + 5);
      v23 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v24 = v21;
      if (v23)
      {
        v35.receiver = v23;
        v35.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        id v25 = -[NWURLSessionResponseConsumerDataDelegate init](&v35, sel_init);
        v23 = (NWURLSessionDelegateDeallocBomb *)v25;
        if (v25)
        {
          objc_storeStrong((id *)v25 + 2, v21);
          v23->__method = sel_dataTask_didReceiveResponse_completionHandler_;
          v15 = (void *)MEMORY[0x1895F87A8];
        }
      }

      v35.receiver = v15;
      v35.super_class = (Class)3221225472LL;
      v36 = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke;
      v37 = &unk_189BC6ED8;
      id v38 = v24;
      id v39 = v30;
      v40 = v17;
      id v41 = v18;
      v42 = v23;
      id v43 = v22;
      v44 = v20;
      v26 = (void *)*((void *)v14 + 6);
      id v27 = v22;
      v28 = v23;
      id v29 = v30;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v26, &v35);
    }

    else
    {
      ((void (*)(void *, uint64_t))v32)(v20, 1LL);
    }
  }
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v58 = a5;
  id v11 = (char *)a3;
  uint64_t v12 = (dispatch_data_s *)a4;
  id v57 = a6;
  id v13 = a7;
  if (v12)
  {
    if (self)
    {
      int64_t v14 = self->_countOfBytesReceivedInternal + dispatch_data_get_size(v12);
      self->_countOfBytesReceivedInternal = v14;
    }

    else
    {
      int64_t v14 = 0LL;
    }

    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v11, v14);
    if (v11)
    {
      uint64_t v15 = 248LL;
      if (!*((void *)v11 + 31)) {
        uint64_t v15 = 240LL;
      }
      id v16 = (id *)*(id *)&v11[v15];
      id v18 = objc_getProperty(v11, v17, 440LL, 1);
      [*((id *)v11 + 33) takeCachedResponse];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id *)*((id *)v11 + 51);
      if (v20)
      {
        v50 = v20;
        [v20[2] URLCache];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v50 = 0LL;
        v21 = 0LL;
      }
    }

    else
    {
      v50 = 0LL;
      id v18 = 0LL;
      id v16 = 0LL;
      v19 = 0LL;
      v21 = 0LL;
    }

    uint64_t v22 = MEMORY[0x1895F87A8];
    v60[0] = MEMORY[0x1895F87A8];
    v60[1] = 3221225472LL;
    v61 = __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke;
    v62 = &unk_189BC8740;
    id v49 = v13;
    id v63 = v13;
    v55 = v11;
    v54 = v12;
    id v52 = v57;
    id v23 = v18;
    id v53 = v19;
    id v51 = v21;
    v56 = v60;
    if (!v16) {
      goto LABEL_23;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withCB](v16, v24);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withoutCB](v16, v26);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse](v16, v28);
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0LL;
    if (v23 && v58)
    {
      v31 = -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](v16, v29);
    }

    if (v58)
    {
      v32 = -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](v16, v29);
      if (v25) {
        goto LABEL_21;
      }
    }

    else
    {
      v32 = 0LL;
      if (v25) {
        goto LABEL_21;
      }
    }

    if (!v27 && !v31 && !v32)
    {
      v61((uint64_t)v56);
LABEL_22:

LABEL_23:
      id v13 = v49;
      goto LABEL_24;
    }

- (NSURLResponse)response
{
  if (self) {
    self = (NWURLSessionResponseConsumerDataDelegate *)objc_getProperty(self, a2, 8LL, 1);
  }
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  if (self) {
    return *(void *)(self + 16);
  }
  return self;
}

- (id)createResumeInfo
{
  return 0LL;
}

- (void).cxx_destruct
{
}

uint64_t __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end