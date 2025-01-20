@interface NWURLSessionStreamTask
- (BOOL)isKindOfClass:(Class)a3;
- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:;
- (id)response;
- (void)checkForCompletion;
- (void)closeRead;
- (void)closeWrite;
- (void)loaderBetterPathAvailable;
- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5;
- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)startNextLoad:(BOOL)a3;
- (void)startSecureConnection;
- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionStreamTask

- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:
{
  id v8 = a2;
  if (a1)
  {
    v9 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, 0LL, a3, a4);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 33, a2);
      *((_BYTE *)v10 + 469) = [v8 allowsWrite] ^ 1;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionStreamTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (id)response
{
  if (self) {
    self = *(NWURLSessionStreamTask **)&self->_readClosed;
  }
  return self;
}

- (void)startNextLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    nw_context_assert_queue(self->super._sessionContext);
    configuration = self->super._configuration;
    if (configuration)
    {
      if (-[NSURLRequest _explicitlySetTimeoutInterval]( configuration->_request,  "_explicitlySetTimeoutInterval")) {
        -[NSURLRequest timeoutInterval](configuration->_request, "timeoutInterval");
      }
      else {
        -[NSURLSessionConfiguration timeoutIntervalForRequest]( configuration->_configuration,  "timeoutIntervalForRequest");
      }
    }

    else
    {
      double v6 = 0.0;
    }

    self->super._timeoutIntervalForRequest = v6;
    if (v3) {
      goto LABEL_7;
    }
  }

  else
  {
    nw_context_assert_queue(0LL);
    if (v3)
    {
LABEL_7:
      -[NWURLSessionTask startStartTimer]((uint64_t)self);
      -[NWURLSessionTask startResourceTimer](self);
    }
  }

  if (self) {
    loader = self->super._loader;
  }
  else {
    loader = 0LL;
  }
  -[NWURLLoader start:](loader, "start:", &__block_literal_global_467);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10 = a6;
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_189BBF0F8;
  block[4] = self;
  id v14 = v10;
  double v15 = a5;
  unint64_t v16 = a3;
  unint64_t v17 = a4;
  id v12 = v10;
  dispatch_async(queue, block);
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke;
  v14[3] = &unk_189BC1490;
  id v15 = v8;
  id v16 = v9;
  double v17 = a4;
  v14[4] = self;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)closeWrite
{
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__NWURLSessionStreamTask_closeWrite__block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)closeRead
{
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__NWURLSessionStreamTask_closeRead__block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startSecureConnection
{
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__NWURLSessionStreamTask_startSecureConnection__block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)loaderBetterPathAvailable
{
  if (self)
  {
    uint64_t v3 = 31LL;
    Class v10 = (&self->super.super.isa)[v3];
    objc_super v5 = self;
    if (v10)
    {
      -[NWURLSessionDelegateWrapper delegateFor_betterRouteDiscovered](v10, v4);
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v10[4].isa;
        v11[0] = MEMORY[0x1895F87A8];
        v11[1] = 3221225472LL;
        v11[2] = __66__NWURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke;
        v11[3] = &unk_189BC6E60;
        id v12 = v6;
        id v13 = v7;
        id v14 = v5;
        p_isa = &v10[6].isa->isa;
        id v9 = v7;
        -[NWURLSessionDelegateQueue runDelegateBlock:](p_isa, v11);
      }
    }
  }

  else
  {
  }

- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v10 = a5;
  if (self)
  {
    startTimeoutTimer = self->super._startTimeoutTimer;
    if (startTimeoutTimer)
    {
      self->super._startTimeoutTimer = 0LL;
      nw_queue_cancel_source((uint64_t)startTimeoutTimer, v9);
    }

    requestTimeoutTimer = self->super._requestTimeoutTimer;
    if (requestTimeoutTimer)
    {
      self->super._requestTimeoutTimer = 0LL;
      nw_queue_cancel_source((uint64_t)requestTimeoutTimer, v9);
    }

    resourceTimeoutTimer = self->super._resourceTimeoutTimer;
    if (resourceTimeoutTimer)
    {
      self->super._resourceTimeoutTimer = 0LL;
      nw_queue_cancel_source((uint64_t)resourceTimeoutTimer, v9);
    }
  }
}

- (void).cxx_destruct
{
}

void __47__NWURLSessionStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[33];
  }
  id v8 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v8;
    if (v8)
    {
      *((_BYTE *)v8 + 10) = 1;
      if (*((_BYTE *)v8 + 8))
      {
        if (!*((_BYTE *)v8 + 11))
        {
          *((_BYTE *)v8 + 11) = 1;
          *((_BYTE *)v8 + 8) = 0;
          id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
          v4 = (void *)v8[7];
          v8[7] = v3;

          objc_super v5 = (void *)nw_protocol_boringssl_copy_definition();
          options = nw_protocol_create_options(v5);

          v7 = options;
          -[NWURLLoaderTCP configureTLS:]((uint64_t)v8, v7);

          nw_connection_append_and_start_application_protocol((void *)v8[8], v7);
          v2 = v8;
        }
      }
    }

    goto LABEL_8;
  }

  v2 = v8;
  if (!v8)
  {
LABEL_8:

    return;
  }

  _os_crash();
  __break(1u);
}

void __35__NWURLSessionStreamTask_closeRead__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_9;
  }
  if (*(void *)(v2 + 288) != 2LL && !*(_BYTE *)(v2 + 468))
  {
    *(_BYTE *)(v2 + 468) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = 248LL;
      if (!*(void *)(v3 + 248)) {
        uint64_t v4 = 240LL;
      }
      id v5 = *(id *)(v3 + v4);
      double v6 = *(void **)(a1 + 32);
      goto LABEL_8;
    }

- (void)checkForCompletion
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    if (*(void *)(a1 + 288) == 1LL)
    {
      if (*(_BYTE *)(a1 + 468) && *(_BYTE *)(a1 + 469)
        || ([(id)a1 error], uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
      {
        uint64_t v3 = 248LL;
        if (!*(void *)(a1 + 248)) {
          uint64_t v3 = 240LL;
        }
        id v4 = *(id *)(a1 + v3);
        [(id)a1 error];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v4, (void *)a1, v5, 0LL);

        -[NWURLSessionTask complete](a1);
      }
    }
  }

uint64_t __36__NWURLSessionStreamTask_closeWrite__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1)
  {
    uint64_t v2 = 0LL;
    goto LABEL_5;
  }

  if (*(void *)(v1 + 288) != 2LL && !*(_BYTE *)(v1 + 469))
  {
    uint64_t v2 = *(void **)(v1 + 264);
LABEL_5:
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __36__NWURLSessionStreamTask_closeWrite__block_invoke_2;
    v3[3] = &unk_189BBF480;
    v3[4] = v1;
    return [v2 writeData:0 complete:1 completionHandler:v3];
  }

  return result;
}

void __36__NWURLSessionStreamTask_closeWrite__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 469) = 1, (uint64_t v3 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v4 = 248LL;
    if (!*(void *)(v3 + 248)) {
      uint64_t v4 = 240LL;
    }
    id v5 = (id *)*(id *)(v3 + v4);
    id v7 = *(id *)(a1 + 32);
    if (v5)
    {
      -[NWURLSessionDelegateWrapper delegateFor_writeClosed](v5, v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        id v9 = v5[4];
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 3221225472LL;
        v12[2] = __56__NWURLSessionDelegateWrapper_writeClosedForStreamTask___block_invoke;
        v12[3] = &unk_189BC6E60;
        id v13 = v8;
        id v14 = v9;
        id v15 = v7;
        id v10 = v5[6];
        id v11 = v9;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v12);
      }
    }
  }

  else
  {
    id v5 = 0LL;
    id v7 = 0LL;
  }

  -[NWURLSessionStreamTask checkForCompletion](*(void *)(a1 + 32));
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](v3);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v25[3] = &unk_189BC91E8;
    id v15 = (dispatch_source_s *)*(id *)(a1 + 48);
    v25[4] = *(void *)(a1 + 32);
    v26 = v15;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v14, v25);

    id v13 = v26;
    goto LABEL_11;
  }

  if (v3)
  {
    if (v3[36] == 2LL)
    {
      -[NWURLSessionTask delegateWrapper](v3);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_3;
      v23[3] = &unk_189BC91E8;
      double v17 = (dispatch_source_s *)*(id *)(a1 + 48);
      v23[4] = *(void *)(a1 + 32);
      v24 = v17;
      -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v16, v23);

      id v13 = v24;
      goto LABEL_11;
    }

    if (*(double *)(a1 + 56) <= 0.0)
    {
      id v5 = 0LL;
      goto LABEL_9;
    }

    uint64_t v4 = (dispatch_queue_s *)v3[29];
  }

  else
  {
    uint64_t v4 = 0LL;
    id v5 = 0LL;
    id v8 = 0LL;
  }

  id v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);
  dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  block[3] = &unk_189BC93A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_source_set_event_handler(v5, v7);

  dispatch_activate(v5);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
LABEL_9:
    id v8 = (void *)v3[33];
    goto LABEL_10;
  }

  id v8 = 0LL;
LABEL_10:
  id v9 = *(void **)(a1 + 40);
  id v10 = v8;
  id v11 = (void *)[v9 _createDispatchData];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_5;
  v18[3] = &unk_189BBF120;
  uint64_t v12 = *(void *)(a1 + 32);
  v19 = v5;
  uint64_t v20 = v12;
  id v21 = *(id *)(a1 + 48);
  id v13 = v5;
  [v10 writeData:v11 complete:0 completionHandler:v18];

LABEL_11:
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v4 = v2[33];
    id v5 = v2;
    if (v3
      && (uint64_t v6 = *MEMORY[0x189607740],
          v9.receiver = v3,
          v9.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      id v8 = v7;
      [v7 fillErrorForLoader:v4 andTask:v5];
    }

    else
    {
      id v8 = 0LL;
    }

    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v8);
  }

  else
  {
    id v8 = 0LL;
    (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0LL);
  }
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    uint64_t v3 = *(id **)(a1 + 32);
    if (v3)
    {
      id v4 = objc_alloc(&OBJC_CLASS___NWURLError);
      id v5 = v3[33];
      uint64_t v6 = v3;
      if (v4)
      {
        uint64_t v7 = *MEMORY[0x189607740];
        v11.receiver = v4;
        v11.super_class = (Class)&OBJC_CLASS___NWURLError;
        id v8 = (NWURLError *)objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, -1001, 0);
        id v4 = v8;
        if (v8) {
          -[NWURLError fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
        }
      }

      id v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic_copy(v10, v9, v4, 136LL);
      }
    }

    else
    {
      id v4 = 0LL;
    }
  }

  -[NWURLSessionStreamTask checkForCompletion](*(void *)(a1 + 32));
}

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(dispatch_source_s **)(a1 + 32);
  if (v4) {
    dispatch_source_cancel(v4);
  }
  [*(id *)(a1 + 40) error];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v5)
  {
    objc_super v11 = *(void **)(a1 + 40);
    if (v11)
    {
      objc_setProperty_atomic_copy(v11, v6, v3, 136LL);
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        goto LABEL_6;
      }
    }

void __62__NWURLSessionStreamTask_writeData_timeout_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 288) == 2LL) {
    goto LABEL_5;
  }
  [(id)v2 error];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = *(void *)(a1 + 32);
  if (!v3)
  {
    if (v2)
    {
      if (*(_BYTE *)(v2 + 468))
      {
        -[NWURLSessionTask delegateWrapper]((void *)v2);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
        v22[3] = &unk_189BC91E8;
        id v16 = (dispatch_source_s *)*(id *)(a1 + 40);
        v22[4] = *(void *)(a1 + 32);
        v23 = v16;
        -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v15, v22);

        uint64_t v7 = v23;
        goto LABEL_20;
      }

      if (*(double *)(a1 + 48) <= 0.0)
      {
        objc_super v9 = 0LL;
        goto LABEL_18;
      }

      uint64_t v8 = *(dispatch_queue_s **)(v2 + 232);
    }

    else
    {
      uint64_t v8 = 0LL;
      objc_super v9 = 0LL;
      uint64_t v12 = 0LL;
    }

    objc_super v9 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v8);
    dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4;
    block[3] = &unk_189BC93A0;
    block[4] = *(void *)(a1 + 32);
    dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_source_set_event_handler(v9, v11);

    dispatch_activate(v9);
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2)
    {
      uint64_t v12 = 0LL;
LABEL_19:
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_5;
      v17[3] = &unk_189BBF0D0;
      v18 = v9;
      uint64_t v19 = v2;
      id v20 = *(id *)(a1 + 40);
      uint64_t v7 = v9;
      [v12 readDataOfMinimumIncompleteLength:v13 maximumLength:v14 completionHandler:v17];

      goto LABEL_20;
    }

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0LL, 1LL, v2);
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3( uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v4 = v2[33];
    id v5 = v2;
    if (v3
      && (uint64_t v6 = *MEMORY[0x189607740],
          v9.receiver = v3,
          v9.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      id v8 = v7;
      [v7 fillErrorForLoader:v4 andTask:v5];
    }

    else
    {
      id v8 = 0LL;
    }

    (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0LL, 1LL, v8);
  }

  else
  {
    id v8 = 0LL;
    (*(void (**)(uint64_t, void, uint64_t, void))(v1 + 16))(v1, 0LL, 1LL, 0LL);
  }
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    id v3 = *(id **)(a1 + 32);
    if (v3)
    {
      id v4 = objc_alloc(&OBJC_CLASS___NWURLError);
      id v5 = v3[33];
      uint64_t v6 = v3;
      if (v4)
      {
        uint64_t v7 = *MEMORY[0x189607740];
        v11.receiver = v4;
        v11.super_class = (Class)&OBJC_CLASS___NWURLError;
        id v8 = (NWURLError *)objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, -1001, 0);
        id v4 = v8;
        if (v8) {
          -[NWURLError fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
        }
      }

      dispatch_time_t v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic_copy(v10, v9, v4, 136LL);
      }
    }

    else
    {
      id v4 = 0LL;
    }
  }

  -[NWURLSessionStreamTask checkForCompletion](*(void *)(a1 + 32));
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_5( uint64_t a1,  void *a2,  int a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  objc_super v9 = *(dispatch_source_s **)(a1 + 32);
  if (v9) {
    dispatch_source_cancel(v9);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10 && *(_BYTE *)(v10 + 468))
  {
    -[NWURLSessionTask delegateWrapper]((void *)v10);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_6;
    v29[3] = &unk_189BC91E8;
    v18 = &v30;
    id v21 = *(id *)(a1 + 48);
    v29[4] = *(void *)(a1 + 40);
    id v30 = v21;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v20, v29);

    goto LABEL_17;
  }

  [(id)v10 error];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !v11)
  {
    v22 = *(void **)(a1 + 40);
    if (v22)
    {
      objc_setProperty_atomic_copy(v22, v12, v8, 136LL);
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        goto LABEL_8;
      }
    }

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_6( uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v4 = v2[33];
    id v5 = v2;
    if (v3
      && (uint64_t v6 = *MEMORY[0x189607740],
          v9.receiver = v3,
          v9.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v7 = objc_msgSendSuper2(&v9, sel_initWithDomain_code_userInfo_, v6, -1005, 0)) != 0))
    {
      id v8 = v7;
      [v7 fillErrorForLoader:v4 andTask:v5];
    }

    else
    {
      id v8 = 0LL;
    }

    (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0LL, 1LL, v8);
  }

  else
  {
    id v8 = 0LL;
    (*(void (**)(uint64_t, void, uint64_t, void))(v1 + 16))(v1, 0LL, 1LL, 0LL);
  }
}

void __82__NWURLSessionStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_7( uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) error];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v2, v1, v4);
}

@end