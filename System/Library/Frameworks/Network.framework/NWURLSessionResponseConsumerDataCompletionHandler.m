@interface NWURLSessionResponseConsumerDataCompletionHandler
- (NSURLResponse)response;
- (id)createResumeInfo;
- (id)initWithCompletionHandler:(id *)a1;
- (int64_t)countOfBytesReceived;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDataCompletionHandler

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  v15 = (void (**)(id, uint64_t, void))a5;
  id v8 = a4;
  data = (OS_dispatch_data *)a3;
  if (self)
  {
    objc_setProperty_atomic(self, v9, v8, 16LL);
    uint64_t v11 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v11);
    v12 = (OS_dispatch_data *)MEMORY[0x1895F8AA8];
    id v13 = MEMORY[0x1895F8AA8];
    data = self->_data;
    self->_data = v12;
  }

  else
  {
    uint64_t v14 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v14);
  }

  v15[2](v15, 1LL, 0LL);
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  v12 = (char *)a3;
  id v13 = (dispatch_data_s *)a4;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  if (v13)
  {
    if (self) {
      data = self->_data;
    }
    else {
      data = 0LL;
    }
    v17 = data;
    dispatch_data_t concat = dispatch_data_create_concat(v17, v13);
    if (self) {
      objc_storeStrong((id *)&self->_data, concat);
    }

    -[NWURLSessionTask setCountOfBytesReceived:]( (uint64_t)v12,  -[NWURLSessionResponseConsumerDataCompletionHandler countOfBytesReceived](self, "countOfBytesReceived"));
  }

  if (v9)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v12);
    if (self)
    {
      id v19 = self->_completionHandler;
      v20 = self->_data;
      id Property = objc_getProperty(self, v21, 16LL, 1);
    }

    else
    {
      v20 = 0LL;
      id v19 = 0LL;
      id Property = 0LL;
    }

    id v23 = Property;
    if (v12)
    {
      uint64_t v24 = 248LL;
      if (!*((void *)v12 + 31)) {
        uint64_t v24 = 240LL;
      }
      id v25 = *(id *)&v12[v24];
    }

    else
    {
      id v25 = 0LL;
    }

    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke;
    v41[3] = &unk_189BC7210;
    id v42 = v14;
    v43 = v20;
    id v44 = v23;
    id v45 = v19;
    id v26 = v23;
    v27 = v20;
    v39 = v26;
    id v40 = v14;
    id v37 = v19;
    v38 = v27;
    if (v12)
    {
      v28 = (id *)*((id *)v12 + 51);
      v30 = v28;
      if (v28) {
        int v31 = objc_msgSend(v28[3], "_callCompletionHandlerInline", v37, v27, v26);
      }
      else {
        int v31 = 0;
      }
      id v32 = objc_getProperty(v12, v29, 440LL, 1);
      [*((id *)v12 + 33) takeCachedResponse];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id *)*((id *)v12 + 51);
      v35 = v34;
      if (v34)
      {
        [v34[2] URLCache];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v36 = 0LL;
      }
    }

    else
    {
      v35 = 0LL;
      id v32 = 0LL;
      v30 = 0LL;
      int v31 = 0;
      v33 = 0LL;
      v36 = 0LL;
    }

    -[NWURLSessionDelegateWrapper runCompletionHandler:noAsync:task:metrics:cachedResponse:cache:]( (uint64_t)v25,  v41,  v31,  v12,  v32,  v33,  v36);

    id v14 = v40;
  }

  v15[2](v15, 0LL);
}

- (NSURLResponse)response
{
  if (self) {
    self = (NWURLSessionResponseConsumerDataCompletionHandler *)objc_getProperty(self, a2, 16LL, 1);
  }
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  if (!self) {
    return 0LL;
  }
  v3 = self->_data;
  if (!v3) {
    return 0LL;
  }
  v4 = v3;
  size_t size = dispatch_data_get_size((dispatch_data_t)self->_data);

  return size;
}

- (id)createResumeInfo
{
  return 0LL;
}

- (void).cxx_destruct
{
}

uint64_t __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke( void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[7];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, 0LL, a1[6]);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, a1[5], a1[6]);
  }
}

- (id)initWithCompletionHandler:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NWURLSessionResponseConsumerDataCompletionHandler;
    a1 = (id *)objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = _Block_copy(v3);
      id v5 = a1[1];
      a1[1] = v4;

      objc_storeStrong(a1 + 3, MEMORY[0x1895F8AA8]);
    }
  }

  return a1;
}

@end