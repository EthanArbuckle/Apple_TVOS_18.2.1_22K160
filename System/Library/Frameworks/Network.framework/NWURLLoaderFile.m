@interface NWURLLoaderFile
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)errorForErrorCode:(int)a3 withPOSIXCode:;
- (id)initWithRequest:(void *)a3 queue:;
- (id)takeCachedResponse;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)setError:(uint64_t)a1;
- (void)start:(id)a3;
- (void)stop;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoaderFile

- (void)start:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(void))a3;
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0LL;
  }
  v6 = URL;
  int v7 = open(-[NSURL fileSystemRepresentation](v6, "fileSystemRepresentation"), 0);
  dispatch_fd_t v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    if (fstat(v7, &v36))
    {
      int v29 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      uint64_t v30 = -1101LL;
      uint64_t v31 = -3001LL;
      if (v29 == 13) {
        uint64_t v31 = -1102LL;
      }
      if (v29 != 21) {
        uint64_t v30 = v31;
      }
      if (v29 == 2) {
        uint64_t v32 = -1100LL;
      }
      else {
        uint64_t v32 = v30;
      }
      v33 = -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:]((uint64_t)self, v32, v29);
      -[NWURLLoaderFile setError:]((uint64_t)self, v33);

      goto LABEL_19;
    }

    if (self)
    {
      self->_fileSize = v36.st_size;
      v9 = self->_expectedDevice;
      if (v9)
      {
        v10 = v9;
        dev_t st_dev = v36.st_dev;
        LOBYTE(st_dev) = st_dev == -[NSNumber intValue](self->_expectedDevice, "intValue");

        if ((st_dev & 1) == 0)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
          }
          v18 = (os_log_s *)(id)gurlLogObj;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v19 = -[NSNumber intValue](self->_expectedDevice, "intValue");
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_impl(&dword_181A5C000, v18, OS_LOG_TYPE_ERROR, "File %@ not on the expected device %d", buf, 0x12u);
          }

          v20 = objc_alloc(&OBJC_CLASS___NWURLError);
          if (v20)
          {
            uint64_t v21 = *MEMORY[0x189607740];
            *(void *)buf = v20;
            *(void *)&buf[8] = &OBJC_CLASS___NWURLError;
            v22 = (NWURLError *)objc_msgSendSuper2( (objc_super *)buf,  sel_initWithDomain_code_userInfo_,  v21,  -1104,  0);
          }

          else
          {
            v22 = 0LL;
          }

          -[NWURLError setFailingURL:](v22, "setFailingURL:", self->_URL);
          error = self->_error;
          self->_error = v22;

          goto LABEL_19;
        }
      }

      queue = self->_queue;
    }

    else
    {
      queue = 0LL;
    }

    v13 = queue;
    cleanup_handler[0] = MEMORY[0x1895F87A8];
    cleanup_handler[1] = 3221225472LL;
    cleanup_handler[2] = __25__NWURLLoaderFile_start___block_invoke;
    cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
    dispatch_fd_t v35 = v8;
    dispatch_io_t v14 = dispatch_io_create(0LL, v8, v13, cleanup_handler);
    if (self)
    {
      io = self->_io;
      p_io = &self->_io;
      *p_io = (OS_dispatch_io *)v14;

      v17 = (dispatch_io_s *)*p_io;
    }

    else
    {

      v17 = 0LL;
    }

    dispatch_io_set_low_water(v17, 0xFFFFFFFFFFFFFFFFLL);
LABEL_19:
    v4[2](v4);
    goto LABEL_20;
  }

  int v24 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  uint64_t v25 = -1101LL;
  uint64_t v26 = -3001LL;
  if (v24 == 13) {
    uint64_t v26 = -1102LL;
  }
  if (v24 != 21) {
    uint64_t v25 = v26;
  }
  if (v24 == 2) {
    uint64_t v27 = -1100LL;
  }
  else {
    uint64_t v27 = v25;
  }
  v28 = -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:]((uint64_t)self, v27, v24);
  -[NWURLLoaderFile setError:]((uint64_t)self, v28);

  v4[2](v4);
LABEL_20:
}

- (void)stop
{
  if (self)
  {
    io = self->_io;
    if (io)
    {
      dispatch_io_close((dispatch_io_t)io, 1uLL);
      v4 = self->_io;
      self->_io = 0LL;
    }
  }

- (void)readResponse:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  if (self)
  {
    if (self->_error)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
      goto LABEL_9;
    }

    URL = self->_URL;
  }

  else
  {
    URL = 0LL;
  }

  id v15 = 0LL;
  uint64_t v7 = *MEMORY[0x189603B78];
  dispatch_fd_t v8 = URL;
  -[NSURL getResourceValue:forKey:error:](v8, "getResourceValue:forKey:error:", &v15, v7, 0LL);
  id v9 = v15;

  [v9 preferredMIMEType];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = objc_alloc(MEMORY[0x189601EF0]);
  if (self)
  {
    v12 = self->_URL;
    if ((self->_fileSize & 0x8000000000000000LL) != 0LL) {
      unint64_t fileSize = -1LL;
    }
    else {
      unint64_t fileSize = self->_fileSize;
    }
  }

  else
  {
    v12 = 0LL;
    unint64_t fileSize = 0LL;
  }

  dispatch_io_t v14 = (void *)[v11 initWithURL:v12 MIMEType:v10 expectedContentLength:fileSize textEncodingName:0];
  ((void (**)(void, void *, void))v5)[2](v5, v14, 0LL);

LABEL_9:
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = __Block_byref_object_copy__42530;
  v16[4] = __Block_byref_object_dispose__42531;
  dispatch_fd_t v8 = (void *)MEMORY[0x1895F8AA8];
  id v9 = MEMORY[0x1895F8AA8];
  id v17 = v8;
  if (self)
  {
    v10 = self->_io;
    queue = (dispatch_queue_s *)self->_queue;
  }

  else
  {
    v10 = 0LL;
    queue = 0LL;
  }

  if (a3 <= 0x4000) {
    a3 = 0x4000LL;
  }
  io_handler[0] = MEMORY[0x1895F87A8];
  io_handler[1] = 3221225472LL;
  io_handler[2] = __85__NWURLLoaderFile_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  io_handler[3] = &unk_189BBE0A0;
  io_handler[4] = self;
  id v14 = v7;
  id v15 = v16;
  id v12 = v7;
  dispatch_io_read((dispatch_io_t)v10, 0LL, a3, queue, io_handler);

  _Block_object_dispose(v16, 8);
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0LL;
}

- (OS_sec_trust)peerTrust
{
  return 0LL;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (id)takeCachedResponse
{
  return 0LL;
}

- (OS_nw_http_fields)trailerFields
{
  return 0LL;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

void __85__NWURLLoaderFile_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke( uint64_t *a1,  int a2,  void *a3,  int a4)
{
  id v7 = a3;
  data = v7;
  if (v7)
  {
    dispatch_data_t concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(void *)(a1[6] + 8) + 40LL), v7);
    uint64_t v9 = *(void *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = concat;

    if (a2)
    {
      uint64_t v11 = a1[5];
      uint64_t v12 = *(void *)(*(void *)(a1[6] + 8) + 40LL);
      BOOL v13 = dispatch_data_get_size(data) == 0;
      (*(void (**)(uint64_t, uint64_t, BOOL, void))(v11 + 16))(v11, v12, v13, 0LL);
    }
  }

  else
  {
    uint64_t v14 = -1101LL;
    uint64_t v15 = -3001LL;
    if (a4 == 13) {
      uint64_t v15 = -1102LL;
    }
    if (a4 != 21) {
      uint64_t v14 = v15;
    }
    if (a4 == 2) {
      uint64_t v16 = -1100LL;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v17 = a1[5];
    v18 = -[NWURLLoaderFile errorForErrorCode:withPOSIXCode:](a1[4], v16, a4);
    (*(void (**)(uint64_t, void, uint64_t, void *))(v17 + 16))(v17, 0LL, 1LL, v18);
  }
}

- (id)errorForErrorCode:(int)a3 withPOSIXCode:
{
  if (a1)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v6)
    {
      uint64_t v7 = *MEMORY[0x189607740];
      v11.receiver = v6;
      v11.super_class = (Class)&OBJC_CLASS___NWURLError;
      id v8 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, a2, 0);
      if (!a3)
      {
LABEL_5:
        [v8 setFailingURL:*(void *)(a1 + 8)];
        return v8;
      }
    }

    else
    {
      id v8 = 0LL;
      if (!a3) {
        goto LABEL_5;
      }
    }

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a3 userInfo:0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setUnderlyingError:v9];

    goto LABEL_5;
  }

  return 0LL;
}

- (void)setError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

uint64_t __25__NWURLLoaderFile_start___block_invoke(uint64_t a1, int a2)
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
      uint64_t v7 = "-[NWURLLoaderFile start:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEBUG, "%{public}s Failed to read file %{errno}d", buf, 0x12u);
    }

    a1 = v5;
  }

  return close(*(_DWORD *)(a1 + 32));
}

- (id)initWithRequest:(void *)a3 queue:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___NWURLLoaderFile;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 URL];
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      uint64_t v9 = [MEMORY[0x189601EE0] propertyForKey:@"NSURLRequestFileProtocolExpectedDevice" inRequest:v5];
      id v10 = a1[3];
      a1[3] = (id)v9;
    }
  }

  return a1;
}

@end