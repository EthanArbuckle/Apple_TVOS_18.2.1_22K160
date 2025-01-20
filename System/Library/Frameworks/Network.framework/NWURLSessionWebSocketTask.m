@interface NWURLSessionWebSocketTask
+ (void)addWebSocketHeadersToRequest:(uint64_t)a1;
- (BOOL)isKindOfClass:(Class)a3;
- (NSData)closeReason;
- (id)response;
- (int64_t)closeCode;
- (int64_t)maximumMessageSize;
- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4;
- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4;
- (void)checkForCompletion;
- (void)completeTaskWithError:(id)a3;
- (void)processWork;
- (void)receiveMessage;
- (void)receiveMessageWithCompletionHandler:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendPingWithPongReceiveHandler:(id)a3;
- (void)setMaximumMessageSize:(int64_t)a3;
- (void)setPendingReceiveCompletionHandlers:(uint64_t)a1;
- (void)startNextLoad:(BOOL)a3;
@end

@implementation NWURLSessionWebSocketTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionWebSocketTask;
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
    self = (NWURLSessionWebSocketTask *)self->_closeReason;
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
  }

  else
  {
    nw_context_assert_queue(0LL);
    configuration = 0LL;
  }

  v6 = configuration;
  v7 = -[NWURLSessionTask currentRequest](self, "currentRequest");
  id v8 = v7;
  if (v6) {
    objc_storeStrong(v6 + 4, v7);
  }

  if (self)
  {
    v9 = self->super._configuration;
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      else {
        [p_isa[2] timeoutIntervalForRequest];
      }
    }

    else
    {
      double v11 = 0.0;
    }

    self->super._timeoutIntervalForRequest = v11;

    if (v3) {
      goto LABEL_11;
    }
  }

  else
  {

    if (v3)
    {
LABEL_11:
      -[NWURLSessionTask startStartTimer]((uint64_t)self);
      -[NWURLSessionTask startResourceTimer](self);
    }
  }

  v12 = objc_alloc(&OBJC_CLASS___NWURLLoaderHTTP);
  v13 = -[NWURLSessionTask currentRequest](self, "currentRequest");
  if (self)
  {
    v14 = self->super._configuration;
    v15 = self->super._queue;
    v16 = (NWURLLoader *)-[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]( (id *)&v12->super.isa,  v13,  0LL,  v14,  v15,  self);
    loader = self->super._loader;
    self->super._loader = v16;

    v18 = self->super._loader;
  }

  else
  {

    v18 = 0LL;
  }

  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke;
  v19[3] = &unk_189BC93A0;
  v19[4] = self;
  -[NWURLLoader start:](v18, "start:", v19);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke;
  aBlock[3] = &unk_189BC50A8;
  id v17 = v6;
  id v18 = v7;
  aBlock[4] = self;
  id v9 = v6;
  id v10 = v7;
  double v11 = _Block_copy(aBlock);
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = v8;
  block[1] = 3221225472LL;
  block[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5;
  block[3] = &unk_189BC91E8;
  block[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(queue, block);
}

- (void)receiveMessageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke;
  v7[3] = &unk_189BC91E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendPingWithPongReceiveHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke;
  aBlock[3] = &unk_189BC91E8;
  aBlock[4] = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = _Block_copy(aBlock);
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6;
  v10[3] = &unk_189BC91E8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke;
  aBlock[3] = &unk_189BC75E8;
  aBlock[4] = self;
  int64_t v22 = a3;
  id v8 = v6;
  id v21 = v8;
  id v9 = _Block_copy(aBlock);
  if (self) {
    queue = (dispatch_queue_s *)self->super._queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = v7;
  block[1] = 3221225472LL;
  block[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3;
  block[3] = &unk_189BC91E8;
  block[4] = self;
  id v11 = v9;
  id v19 = v11;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
  if (self) {
    id v13 = self->super._queue;
  }
  else {
    id v13 = 0LL;
  }
  v15[0] = v7;
  v15[1] = 3221225472LL;
  v15[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_4;
  v15[3] = &unk_189BC0AE8;
  v14 = v13;
  objc_copyWeak(&v16, &location);
  dispatch_after(v12, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4
{
}

- (void)completeTaskWithError:(id)a3
{
  id newValue = a3;
  if (!self)
  {
    nw_context_assert_queue(0LL);
    Class v12 = 0LL;
LABEL_11:
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v12, self, newValue, 0LL);

    -[NWURLSessionTask complete]((uint64_t)self);
    goto LABEL_12;
  }

  nw_context_assert_queue(self->super._sessionContext);
  if (self->super._internalState != 2)
  {
    if (newValue)
    {
      objc_setProperty_atomic_copy(self, v4, newValue, 136LL);
    }

    else
    {
      uint64_t v5 = objc_alloc(&OBJC_CLASS___NWURLError);
      id v6 = self->super._loader;
      uint64_t v7 = self;
      if (v5)
      {
        uint64_t v8 = *MEMORY[0x189607740];
        v14.receiver = v5;
        v14.super_class = (Class)&OBJC_CLASS___NWURLError;
        id v9 = -[NWURLSessionWebSocketTask initWithDomain:code:userInfo:]( &v14,  sel_initWithDomain_code_userInfo_,  v8,  -1005LL,  0LL);
        uint64_t v5 = (NWURLError *)v9;
        if (v9) {
          -[NWURLSessionWebSocketTask fillErrorForLoader:andTask:](v9, "fillErrorForLoader:andTask:", v6, v7);
        }
      }

      objc_setProperty_atomic_copy(v7, v10, v5, 136LL);
    }

    -[NWURLSessionWebSocketTask processWork]((uint64_t)self);
    uint64_t v11 = 31LL;
    Class v12 = (&self->super.super.isa)[v11];
    goto LABEL_11;
  }

- (int64_t)maximumMessageSize
{
  return *(void *)&self->_receiving;
}

- (void)setMaximumMessageSize:(int64_t)a3
{
  *(void *)&self->_receiving = a3;
}

- (int64_t)closeCode
{
  return self->_maximumMessageSize;
}

- (NSData)closeReason
{
  return (NSData *)self->_closeCode;
}

- (void).cxx_destruct
{
}

- (void)processWork
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    id v2 = *(id *)(a1 + 504);
    if (v2)
    {
    }

    else
    {
      [(id)a1 error];
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3) {
        return;
      }
    }

    id v4 = *(id *)(a1 + 512);
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v6 = *(void **)(a1 + 512);
    *(void *)(a1 + 512) = v5;

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16LL))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }

    if (!*(_BYTE *)(a1 + 468))
    {
      if (objc_msgSend(*(id *)(a1 + 528), "count", (void)v12)) {
        -[NWURLSessionWebSocketTask receiveMessage](a1);
      }
    }
  }

- (void)receiveMessage
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    [(id)a1 error];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      id v4 = *(id *)(a1 + 528);
      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
      -[NWURLSessionWebSocketTask setPendingReceiveCompletionHandlers:](a1, v5);

      -[NWURLSessionTask delegateWrapper]((void *)a1);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke;
      v9[3] = &unk_189BC9238;
      id v10 = v4;
      uint64_t v11 = a1;
      id v7 = v4;
      -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v6, v9);
    }

    else
    {
      *(_BYTE *)(a1 + 468) = 1;
      BOOL v3 = *(void **)(a1 + 504);
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2;
      v8[3] = &unk_189BBF198;
      v8[4] = a1;
      nw_connection_receive_internal(v3, 0LL, 0xFFFFFFFF, 0xFFFFFFFF, v8);
    }
  }

- (void)setPendingReceiveCompletionHandlers:(uint64_t)a1
{
}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "error", (void)v9);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v8);

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2( uint64_t a1,  void *a2,  void *a3,  int a4,  void *a5)
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id newValue = a2;
  __int128 v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(_BYTE *)(v11 + 468) = 0;
    __int128 v12 = *(void **)(a1 + 32);
  }

  else
  {
    __int128 v12 = 0LL;
  }

  [v12 error];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
    goto LABEL_76;
  }

  nw_ws_opcode_t opcode = nw_ws_opcode_invalid;
  if (v9 && a4)
  {
    if (nw_protocol_copy_ws_definition::onceToken != -1) {
      dispatch_once(&nw_protocol_copy_ws_definition::onceToken, &__block_literal_global_3592);
    }
    __int128 v15 = (nw_protocol_definition *)(id)nw_protocol_copy_ws_definition::definition;
    __int128 v13 = nw_content_context_copy_protocol_metadata(v9, v15);

    if (v13) {
      nw_ws_opcode_t opcode = nw_ws_metadata_get_opcode((nw_protocol_metadata_t)v13);
    }
    else {
      nw_ws_opcode_t opcode = nw_ws_opcode_invalid;
    }
  }

  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    v53 = (os_log_s *)(id)gurlLogObj;
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_94;
    }
    v54 = *(void **)(a1 + 32);
    if (v54)
    {
      [v54 logDescription];
      v55 = *(void **)(a1 + 32);
      if (v55)
      {
        [v55 logDescription];
        int v56 = v66;
        size = newValue;
LABEL_91:
        if (size) {
          size = (dispatch_data_s *)dispatch_data_get_size(size);
        }
        *(_DWORD *)buf = 136448002;
        *(void *)&buf[4] = "-[NWURLSessionWebSocketTask receiveMessage]_block_invoke_2";
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2098;
        *(void *)&buf[20] = v67;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v56;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = opcode;
        LOWORD(v70) = 2048;
        *(void *)((char *)&v70 + 2) = size;
        WORD5(v70) = 1024;
        HIDWORD(v70) = a4;
        LOWORD(v71) = 2112;
        *(void *)((char *)&v71 + 2) = v10;
        _os_log_impl( &dword_181A5C000,  v53,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> received message: %d, size: %zu, complete: %{BOOL}d, error: %@",  buf,  0x42u);
LABEL_94:

        goto LABEL_12;
      }
    }

    else
    {
      v67[0] = 0LL;
      v67[1] = 0LL;
      int v68 = 0;
    }

    size = newValue;
    int v56 = 0;
    uint64_t v64 = 0LL;
    uint64_t v65 = 0LL;
    int v66 = 0;
    goto LABEL_91;
  }

uint64_t __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_511(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      *(void *)(v4 + 480) = *(void *)(a1 + 48);
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_nonatomic_copy(v5, v3, *(id *)(a1 + 40), 488LL);
      }
    }

    uint64_t v6 = nw_content_context_create("close");
    nw_content_context_set_is_final(v6, 1);
    metadata = nw_ws_create_metadata(nw_ws_opcode_close);
    uint64_t v8 = metadata;
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      nw_ws_metadata_set_close_code(metadata, (nw_ws_close_code_t)v9);
    }
    nw_content_context_set_metadata_for_protocol(v6, v8);
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      id v10 = (void *)v10[63];
    }
    uint64_t v11 = *(void **)(a1 + 40);
    __int128 v12 = v10;
    __int128 v13 = (dispatch_data_s *)[v11 _createDispatchData];
    completion[0] = MEMORY[0x1895F87A8];
    completion[1] = 3221225472LL;
    completion[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2;
    completion[3] = &unk_189BC5E68;
    completion[4] = *(void *)(a1 + 32);
    nw_connection_send(v12, v13, v6, 1, completion);
  }

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  uint64_t v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 36) != 2LL)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    uint64_t v3 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [v2 logDescription];
      [v2 logDescription];
      *(_DWORD *)buf = 68289282;
      int v7 = 16;
      __int16 v8 = 2098;
      uint64_t v9 = &v5;
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> cancelling automatically since the server did not reply to our close frame",  buf,  0x18u);
    }

    [v2 cancel];
  }
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    uint64_t v3 = *(void ***)(a1 + 32);
    if (v3) {
      uint64_t v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]( objc_alloc(&OBJC_CLASS___NWURLError),  v8,  v3[33],  v3);
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  [*(id *)(a1 + 32) error];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0LL;
  }
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136LL);
    uint64_t v6 = *(void **)(a1 + 32);
  }

  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);
}

- (void)checkForCompletion
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    if (*(void *)(a1 + 288) == 1LL)
    {
      [(id)a1 error];
      id v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        [(id)a1 error];
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        [(id)a1 completeTaskWithError:v3];
      }
    }
  }

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](*(void **)(a1 + 32));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2;
    v19[3] = &unk_189BC91E8;
    uint64_t v14 = (nw_content_context *)*(id *)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    v20 = v14;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v13, v19);

    id v3 = v20;
  }

  else
  {
    id v3 = nw_content_context_create("ping");
    metadata = nw_ws_create_metadata(nw_ws_opcode_ping);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(dispatch_queue_s **)(v5 + 232);
    }
    else {
      uint64_t v6 = 0LL;
    }
    uint64_t v7 = MEMORY[0x1895F87A8];
    pong_handler[0] = MEMORY[0x1895F87A8];
    pong_handler[1] = 3221225472LL;
    pong_handler[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3;
    pong_handler[3] = &unk_189BBF170;
    pong_handler[4] = v5;
    id v18 = *(id *)(a1 + 40);
    nw_ws_metadata_set_pong_handler(metadata, v6, pong_handler);
    nw_content_context_set_metadata_for_protocol(v3, metadata);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      unsigned int v9 = *(unsigned __int16 *)(v8 + 470);
      *(_WORD *)(v8 + 470) = v9 + 1;
    }

    else
    {
      unsigned int v9 = 0;
    }

    __int16 buffer = __rev16(v9);
    __int16 v10 = dispatch_data_create(&buffer, 2uLL, 0LL, 0LL);
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(nw_connection **)(v11 + 504);
    }
    else {
      uint64_t v12 = 0LL;
    }
    v15[0] = v7;
    v15[1] = 3221225472LL;
    v15[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5;
    v15[3] = &unk_189BC5E68;
    void v15[4] = v11;
    nw_connection_send(v12, v10, v3, 1, v15);
  }
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  id v3 = *(const void **)(a1 + 40);
  int v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *(void ***)(a1 + 32);
    if (v4) {
      int v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]( objc_alloc(&OBJC_CLASS___NWURLError),  v3,  v4[33],  v4);
    }
  }

  else
  {
    int v4 = 0LL;
  }

  [*(id *)(a1 + 32) error];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0LL;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      __int16 v10 = 0LL;
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    if (!v12) {
      goto LABEL_19;
    }
    objc_setProperty_atomic_copy(v12, v6, v4, 136LL);
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_19;
    }
  }

  uint64_t v9 = 248LL;
  if (!*(void *)(v8 + 248)) {
    uint64_t v9 = 240LL;
  }
  __int16 v10 = (void **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4;
  v13[3] = &unk_189BC91E8;
  id v11 = *(id *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  if (v10) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);
  }

  -[NWURLSessionWebSocketTask checkForCompletion](*(void *)(a1 + 32));
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = *(void ***)(a1 + 32);
    if (v3) {
      id v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]( objc_alloc(&OBJC_CLASS___NWURLError),  v8,  v3[33],  v3);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  [*(id *)(a1 + 32) error];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0LL;
  }
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136LL);
    uint64_t v6 = *(void **)(a1 + 32);
  }

  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[66];
  }
  id v3 = *(const void **)(a1 + 40);
  int v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](a1[4]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2;
    v14[3] = &unk_189BC91E8;
    id v11 = (nw_content_context *)a1[6];
    v14[4] = a1[4];
    __int128 v15 = v11;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v10, v14);

    id v3 = v15;
  }

  else
  {
    id v3 = nw_content_context_create("send");
    if ([a1[5] type])
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_text);
      [a1[5] string];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 dataUsingEncoding:4];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
      [a1[5] data];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    nw_content_context_set_metadata_for_protocol(v3, metadata);
    BOOL v7 = a1[4];
    if (v7) {
      BOOL v7 = (void *)v7[63];
    }
    id v8 = v7;
    uint64_t v9 = (dispatch_data_s *)[v6 _createDispatchData];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3;
    v12[3] = &unk_189BBF170;
    v12[4] = a1[4];
    id v13 = a1[6];
    nw_connection_send(v8, v9, v3, 1, v12);
  }
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  id v3 = *(const void **)(a1 + 40);
  int v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *(void ***)(a1 + 32);
    if (v4) {
      int v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]( objc_alloc(&OBJC_CLASS___NWURLError),  v3,  v4[33],  v4);
    }
  }

  else
  {
    int v4 = 0LL;
  }

  [*(id *)(a1 + 32) error];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0LL;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      __int16 v10 = 0LL;
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    if (!v12) {
      goto LABEL_19;
    }
    objc_setProperty_atomic_copy(v12, v6, v4, 136LL);
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_19;
    }
  }

  uint64_t v9 = 248LL;
  if (!*(void *)(v8 + 248)) {
    uint64_t v9 = 240LL;
  }
  __int16 v10 = (void **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4;
  v13[3] = &unk_189BC91E8;
  id v11 = *(id *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  if (v10) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);
  }

  -[NWURLSessionWebSocketTask checkForCompletion](*(void *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) error];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[33];
  }
  id v3 = v2;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2;
  v5[3] = &unk_189BBEE98;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  int v4 = v3;
  [v4 readResponse:v5];
}

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v63 = a2;
  id v5 = a3;
  id v6 = (void *)a1[4];
  if (!v6) {
    goto LABEL_51;
  }
  for (uint64_t i = v6[33]; i == a1[5]; uint64_t i = 0LL)
  {
    id newValue = v5;
    if (v5)
    {
      [v6 error];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      id v6 = (void *)a1[4];
      if (!v8)
      {
        if (v6)
        {
          objc_setProperty_atomic_copy(v6, v9, newValue, 136LL);
          id v6 = (void *)a1[4];
        }
      }
    }

    [v6 error];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = a1[4];
    if (v10)
    {
      [(id)a1[4] error];
      id v58 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v11 completeTaskWithError:v58];

      -[NWURLSessionWebSocketTask processWork](a1[4]);
      goto LABEL_47;
    }

    a1 = v63;
    if (!v11) {
      goto LABEL_46;
    }
    nw_context_assert_queue(*(void **)(v11 + 312));
    uint64_t v13 = *(void *)(v11 + 336);
    if (v13)
    {
      *(void *)(v11 + 336) = 0LL;
      nw_queue_cancel_source(v13, v12);
    }

    uint64_t v14 = *(void *)(v11 + 320);
    if (v14)
    {
      *(void *)(v11 + 320) = 0LL;
      nw_queue_cancel_source(v14, v12);
    }

    uint64_t v15 = *(void *)(v11 + 352);
    if (v15)
    {
      *(void *)(v11 + 352) = 0LL;
      nw_queue_cancel_source(v15, v12);
    }

    -[NWURLSessionTask updateResponse:](v11, a1);
    objc_setProperty_nonatomic_copy((id)v11, v16, a1, 496LL);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = objc_alloc(&OBJC_CLASS___NWURLError);
      id v46 = *(id *)(v11 + 264);
      id v47 = (id)v11;
      if (v45)
      {
        uint64_t v48 = *MEMORY[0x189607740];
        v78.receiver = v45;
        v78.super_class = (Class)&OBJC_CLASS___NWURLError;
        uint64_t v49 = (NWURLError *)objc_msgSendSuper2(&v78, sel_initWithDomain_code_userInfo_, v48, -1011, 0);
        v45 = v49;
        if (v49) {
          -[NWURLError fillErrorForLoader:andTask:](v49, "fillErrorForLoader:andTask:", v46, v47);
        }
      }

      [v47 completeTaskWithError:v45];
      -[NWURLSessionWebSocketTask processWork]((uint64_t)v47);
LABEL_46:

LABEL_47:
      id v5 = newValue;
      break;
    }

    v60 = a1;
    [(id)v11 currentRequest];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 valueForHTTPHeaderField:@"Sec-WebSocket-Key"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      nw_protocol_options_t options = nw_ws_create_options(nw_ws_version_13);
      nw_ws_options_set_permessage_deflate(options, 1);
      nw_ws_options_set_auto_reply_ping(options, 1);
      nw_ws_options_set_skip_handshake(options, 1);
      nw_ws_options_set_maximum_message_size(options, [(id)v11 maximumMessageSize]);
      [v60 valueForHTTPHeaderField:@"Sec-WebSocket-Protocol"];
      id v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend((id)v11, "currentRequest", v59);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 valueForHTTPHeaderField:@"Sec-WebSocket-Protocol"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 componentsSeparatedByString:@","];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:&v78 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v68;
          do
          {
            for (uint64_t j = 0LL; j != v23; ++j)
            {
              if (*(void *)v68 != v24) {
                objc_enumerationMutation(v22);
              }
              id v26 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              [MEMORY[0x189607810] whitespaceCharacterSet];
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v26 stringByTrimmingCharactersInSet:v27];
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              nw_ws_options_add_subprotocol(options, (const char *)[v28 cStringUsingEncoding:5]);
            }

            uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:&v78 count:16];
          }

          while (v23);
        }
      }

      uint64_t HTTPResponse = CFURLResponseGetHTTPResponse();
      if ((nw_ws_validate_server_response_with_protocol_options(HTTPResponse, (uint64_t)v61, options, &v66) & 1) != 0)
      {
        uint64_t v30 = 248LL;
        if (!*(void *)(v11 + 248)) {
          uint64_t v30 = 240LL;
        }
        uint64_t v31 = *(void *)(v11 + v30);
        uint64_t v32 = (id *)(id)v11;
        id v34 = v59;
        uint64_t v35 = (void *)MEMORY[0x1895F87A8];
        if (v31)
        {
          v36 = -[NWURLSessionDelegateWrapper delegateFor_didOpenWithProtocol]((_BYTE *)v31, v33);
          if (v36)
          {
            v37 = *(id *)(v31 + 32);
            v71.receiver = (id)MEMORY[0x1895F87A8];
            v71.super_class = (Class)3221225472LL;
            uint64_t v72 = __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke;
            v73 = &unk_189BC7848;
            nw_protocol_options_t v74 = v36;
            v75 = v37;
            v76 = v32;
            id v77 = v34;
            id v38 = *(void **)(v31 + 48);
            v39 = v37;
            uint64_t v35 = (void *)MEMORY[0x1895F87A8];
            id v40 = v39;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v38, &v71);
          }
        }

        id v41 = v32[33];
        uint64_t v42 = [v41 underlyingConnection];
        id v43 = v32[63];
        v32[63] = (id)v42;

        v64[0] = 0LL;
        v64[1] = v64;
        v64[2] = 0x2020000000LL;
        char v65 = 0;
        id v44 = v32[63];
        v71.receiver = v35;
        v71.super_class = (Class)3221225472LL;
        uint64_t v72 = __44__NWURLSessionWebSocketTask_handleResponse___block_invoke;
        v73 = &unk_189BBF148;
        v75 = v64;
        nw_protocol_options_t v74 = options;
        nw_connection_modify_connected_protocol_stack_internal(v44, &v71, 1);

        -[NWURLSessionWebSocketTask processWork]((uint64_t)v32);
        _Block_object_dispose(v64, 8);
      }

      else
      {
        v50 = objc_alloc(&OBJC_CLASS___NWURLError);
        id v51 = *(id *)(v11 + 264);
        id v52 = (id)v11;
        if (v50)
        {
          uint64_t v53 = *MEMORY[0x189607740];
          v71.receiver = v50;
          v71.super_class = (Class)&OBJC_CLASS___NWURLError;
          v54 = (NWURLError *)objc_msgSendSuper2(&v71, sel_initWithDomain_code_userInfo_, v53, -1011, 0);
          v50 = v54;
          if (v54) {
            -[NWURLError fillErrorForLoader:andTask:](v54, "fillErrorForLoader:andTask:", v51, v52);
          }
        }
        v55 = -[NWURLError webSocketHandshakeFailureReason](v50, "webSocketHandshakeFailureReason");
        BOOL v56 = v55 == 0LL;

        if (v56)
        {
          [MEMORY[0x189607968] numberWithInt:v66];
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NWURLError setWebSocketHandshakeFailureReason:](v50, "setWebSocketHandshakeFailureReason:", v57);
        }

        objc_msgSend(v52, "completeTaskWithError:", v50, v59);
        -[NWURLSessionWebSocketTask processWork]((uint64_t)v52);
      }

      goto LABEL_46;
    }

    _os_assert_log();
    id v6 = (void *)_os_crash();
    __break(1u);
LABEL_51:
    ;
  }
}

id __44__NWURLSessionWebSocketTask_handleResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, _DWORD *a4)
{
  if (a2 || (uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL), *(_BYTE *)(v4 + 24)))
  {
    id v5 = 0LL;
    *a4 = 0;
  }

  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    *a4 = 2;
    id v5 = *(id *)(a1 + 32);
  }

  return v5;
}

+ (void)addWebSocketHeadersToRequest:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  [v2 valueForHTTPHeaderField:@"Connection"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    [v2 setValue:@"Upgrade" forHTTPHeaderField:@"Connection"];
  }
  [v2 valueForHTTPHeaderField:@"Upgrade"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    [v2 setValue:@"websocket" forHTTPHeaderField:@"Upgrade"];
  }
  [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Version"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    [v2 setValue:@"13" forHTTPHeaderField:@"Sec-WebSocket-Version"];
  }
  [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Key"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    arc4random_buf(__buf, 0x10uLL);
    [MEMORY[0x189603F48] dataWithBytes:__buf length:16];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 base64EncodedStringWithOptions:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setValue:v8 forHTTPHeaderField:@"Sec-WebSocket-Key"];
  }

  [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Extensions"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9) {
    [v2 setValue:@"permessage-deflate" forHTTPHeaderField:@"Sec-WebSocket-Extensions"];
  }
}

@end