@interface NWURLSessionRequestBodyFile
- (int64_t)countOfBytesSent;
- (void)close;
- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionRequestBodyFile

- (int64_t)countOfBytesSent
{
  if (self) {
    return *(void *)(self + 32);
  }
  return self;
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, void, uint64_t, NWURLSessionRequestBodyFile *))a5;
  if (self && (uint64_t error = self->_error, (_DWORD)error))
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:error userInfo:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x189607740];
      v20.receiver = v10;
      v20.super_class = (Class)&OBJC_CLASS___NWURLError;
      v12 = -[NWURLSessionRequestBodyFile initWithDomain:code:userInfo:]( &v20,  sel_initWithDomain_code_userInfo_,  v11,  -3001LL,  0LL);
    }

    else
    {
      v12 = 0LL;
    }

    -[NWURLSessionRequestBodyFile setUnderlyingError:](v12, "setUnderlyingError:", v9);
    v7[2](v7, 0LL, 1LL, v12);
  }

  else
  {
    v20.receiver = 0LL;
    v20.super_class = (Class)&v20;
    uint64_t v21 = 0x3032000000LL;
    v22 = __Block_byref_object_copy__14649;
    v23 = __Block_byref_object_dispose__14650;
    v13 = (void *)MEMORY[0x1895F8AA8];
    id v14 = MEMORY[0x1895F8AA8];
    id v24 = v13;
    if (self)
    {
      v15 = self->_io;
      queue = (dispatch_queue_s *)self->_queue;
    }

    else
    {
      v15 = 0LL;
      queue = 0LL;
    }

    if (a3 <= 0x4000) {
      a3 = 0x4000LL;
    }
    io_handler[0] = MEMORY[0x1895F87A8];
    io_handler[1] = 3221225472LL;
    io_handler[2] = __91__NWURLSessionRequestBodyFile_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
    io_handler[3] = &unk_189BBE0A0;
    v18 = v7;
    v19 = &v20;
    io_handler[4] = self;
    dispatch_io_read((dispatch_io_t)v15, 0LL, a3, queue, io_handler);

    _Block_object_dispose(&v20, 8);
  }
}

- (void)close
{
  if (self)
  {
    io = self->_io;
    if (io) {
      dispatch_io_close((dispatch_io_t)io, 1uLL);
    }
  }

- (void).cxx_destruct
{
}

void __91__NWURLSessionRequestBodyFile_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke( void *a1,  int a2,  void *a3,  int a4)
{
  v7 = a3;
  data = v7;
  if (!v7)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a4 userInfo:0];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v15)
    {
      uint64_t v16 = *MEMORY[0x189607740];
      v19.receiver = v15;
      v19.super_class = (Class)&OBJC_CLASS___NWURLError;
      id v17 = objc_msgSendSuper2(&v19, sel_initWithDomain_code_userInfo_, v16, -3001, 0);
    }

    else
    {
      id v17 = 0LL;
    }

    [v17 setUnderlyingError:v14];
    (*(void (**)(void))(a1[5] + 16LL))();

LABEL_6:
    uint64_t v11 = data;
    goto LABEL_7;
  }

  dispatch_data_t concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(void *)(a1[6] + 8LL) + 40LL), v7);
  uint64_t v9 = *(void *)(a1[6] + 8LL);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = concat;

  uint64_t v11 = data;
  if (a2)
  {
    size_t size = dispatch_data_get_size(data);
    uint64_t v13 = a1[4];
    if (v13) {
      *(void *)(v13 + 32) += size;
    }
    (*(void (**)(void, void, BOOL, void))(a1[5] + 16LL))( a1[5],  *(void *)(*(void *)(a1[6] + 8LL) + 40LL),  size == 0,  0LL);
    goto LABEL_6;
  }

uint64_t __60__NWURLSessionRequestBodyFile_initWithFileURL_offset_queue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 && gLogDatapath)
  {
    uint64_t v5 = a1;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    v3 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[NWURLSessionRequestBodyFile initWithFileURL:offset:queue:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s Failed to read file %{errno}d", buf, 0x12u);
    }

    a1 = v5;
  }

  return close(*(_DWORD *)(a1 + 32));
}

@end