@interface NWURLSessionResponseConsumerDownload
- (NSURLResponse)response;
- (id)createResumeInfo;
- (id)errorForErrorCode:(uint64_t)a3 withPOSIXCode:(void *)a4 andTask:;
- (id)initWithResumeInfo:(void *)a3 completionHandler:;
- (int64_t)countOfBytesReceived;
- (void)checkCountOfBytesReceived;
- (void)deliverCompletionForTask:(uint64_t)a1;
- (void)setError:(uint64_t)a1;
- (void)setFileURL:(uint64_t)a1;
- (void)setIo:(uint64_t)a1;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDownload

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  v8 = (id *)a3;
  id v9 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (!self)
  {
    uint64_t v44 = countOfBytesExpectedToReceive(v9);
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v44);
    if (v8) {
      goto LABEL_7;
    }
LABEL_44:
    v16 = 0LL;
    v17 = 0LL;
    goto LABEL_31;
  }

  objc_setProperty_atomic(self, v10, v9, 24LL);
  uint64_t v12 = countOfBytesExpectedToReceive(v9);
  if (self->_isResuming)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 statusCode] == 206)
    {
      if (v12 != *MEMORY[0x189601E78]) {
        v12 += self->_countOfBytesReceivedInternal;
      }
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      int64_t countOfBytesReceivedInternal = self->_countOfBytesReceivedInternal;
    }

    else
    {
      [MEMORY[0x1896078A8] defaultManager];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 removeItemAtURL:self->_fileURL error:0];

      -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)self);
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      int64_t countOfBytesReceivedInternal = 0LL;
    }

    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v8, countOfBytesReceivedInternal);
    v37 = -[NWURLSessionTask delegateWrapper](v8);
    -[NWURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:]( (uint64_t)v37,  v8,  [v8 countOfBytesReceived],  objc_msgSend(v8, "countOfBytesExpectedToReceive"));
  }

  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  }

  v13 = self->_fileURL;
  if (v13)
  {
    BOOL isResuming = self->_isResuming;

    if (!isResuming)
    {
      [MEMORY[0x1896078A8] defaultManager];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 removeItemAtURL:self->_fileURL error:0];

      fileURL = self->_fileURL;
      if (!fileURL) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }

  if (!v8) {
    goto LABEL_44;
  }
LABEL_7:
  v15 = (id *)v8[51];
  v16 = v15;
  if (v15)
  {
    [v15[3] _pathToDownloadTaskFile];
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {

      if (!self)
      {
LABEL_11:
        [MEMORY[0x1896078A8] defaultManager];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 temporaryDirectory];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 URLByAppendingPathComponent:@"URLSessionDownload_XXXXXX.tmp" isDirectory:0];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (![v21 getFileSystemRepresentation:v49 maxLength:1024])
        {
          uint64_t v38 = 63LL;
LABEL_35:
          v39 = -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:]( (uint64_t)self,  -3000LL,  v38,  v8);
          v11[2](v11, 0LL, v39);

          goto LABEL_23;
        }

        int v22 = mkstemps(v49, 4);
        if (v22 != -1)
        {
          dispatch_fd_t v23 = v22;
          [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v49 isDirectory:0 relativeToURL:0];
          v24 = (NSURL *)objc_claimAutoreleasedReturnValue();
          if (self)
          {
            v25 = self->_fileURL;
            self->_fileURL = v24;

            v26 = self->_fileURL;
          }

          else
          {

            v26 = 0LL;
          }

          v27 = v26;
          v28 = -[NSURL lastPathComponent](v27, "lastPathComponent");
          if (self) {
            objc_storeStrong((id *)&self->_tempFileName, v28);
          }

          if (v8) {
            goto LABEL_18;
          }
LABEL_42:
          v30 = 0LL;
          v31 = 0LL;
          goto LABEL_20;
        }

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v13 = (dispatch_data_s *)a4;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    size_t size = 0LL;
    if (self) {
      goto LABEL_3;
    }
LABEL_16:
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, 0LL);
    BOOL v18 = v14 == 0LL;
    if (!v14)
    {
      id v14 = 0LL;
      if (v9)
      {
        -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, 0LL);
        goto LABEL_20;
      }
    }

    goto LABEL_5;
  }

  size_t size = dispatch_data_get_size(v13);
  if (!self) {
    goto LABEL_16;
  }
LABEL_3:
  int64_t v17 = self->_countOfBytesReceivedInternal + size;
  self->_int64_t countOfBytesReceivedInternal = v17;
  -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, v17);
  BOOL v18 = v14 == 0LL;
  if (!v14 && v9)
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, self->_countOfBytesReceivedInternal);
    if (self->_io) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }

- (NSURLResponse)response
{
  if (self) {
    self = (NWURLSessionResponseConsumerDownload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  if (self) {
    return *(void *)(self + 72);
  }
  return self;
}

- (id)createResumeInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerResumeInfo);
  v4 = v3;
  if (!self)
  {
    tempFileName = 0LL;
    if (!v3) {
      return v4;
    }
    goto LABEL_6;
  }

  tempFileName = self->_tempFileName;
  if (!tempFileName)
  {
    tempFileName = self->_fileURL;
    if (!v3) {
      return v4;
    }
LABEL_6:
    uint64_t v6 = 1LL;
    goto LABEL_7;
  }

  if (v3)
  {
    uint64_t v6 = 2LL;
LABEL_7:
    v7 = tempFileName;
    Class v8 = (&v4->super.isa)[v6];
    (&v4->super.isa)[v6] = v7;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)deliverCompletionForTask:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v3);
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 64);
    [v6 downloadTaskResumeData];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = v7 != 0LL;

    if (v4)
    {
      BOOL v9 = (id *)v4[51];
      v10 = v9;
      if (v9 && ([v9[3] _keepDownloadTaskFile] & 1) != 0)
      {
        BOOL v11 = 1;

        if (!v5) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }

    else
    {
      v10 = 0LL;
    }

    BOOL v11 = *(void *)(a1 + 40) == 0LL;

    if (!v5) {
      goto LABEL_10;
    }
LABEL_9:
    if (v6)
    {
      if (!v7 && !*(void *)(a1 + 40))
      {
        [MEMORY[0x1896078A8] defaultManager];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 removeItemAtURL:v5 error:0];
      }

      id v5 = 0LL;
      id v12 = *(void **)(a1 + 16);
      if (v12) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = 248LL;
    if (!*(void *)(v2 + 248)) {
      uint64_t v3 = 240LL;
    }
    v4 = (id *)*(id *)(v2 + v3);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      goto LABEL_5;
    }
  }

  else
  {
    id v5 = 0LL;
    v4 = 0LL;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
LABEL_5:
      uint64_t v7 = *(void *)(v6 + 72);
      goto LABEL_6;
    }
  }

  uint64_t v7 = 0LL;
LABEL_6:
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [v5 countOfBytesExpectedToReceive];
  uint64_t v10 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  id v24 = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2;
  id v25 = &unk_189BC55B0;
  char v28 = *(_BYTE *)(a1 + 64);
  int8x16_t v22 = *(int8x16_t *)(a1 + 32);
  id v11 = (id)v22.i64[0];
  int8x16_t v26 = vextq_s8(v22, v22, 8uLL);
  id v27 = *(id *)(a1 + 48);
  id v12 = v5;
  SEL v14 = v23;
  if (v4)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didWriteData](v4, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      id v16 = v4[4];
      id v17 = v4[5];
      v29[0] = v10;
      v29[1] = 3221225472LL;
      v29[2] = __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke;
      v29[3] = &unk_189BC6FF0;
      id v30 = v15;
      id v31 = v16;
      id v18 = v12;
      uint64_t v35 = v8;
      uint64_t v36 = v7;
      uint64_t v37 = v9;
      id v32 = v18;
      id v33 = v17;
      id v34 = v14;
      id v19 = v4[6];
      id v20 = v17;
      id v21 = v16;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v19, v29);
    }

    else
    {
      ((void (*)(void *))v24)(v14);
    }
  }
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_3( uint64_t a1,  int a2,  void *a3,  int a4)
{
  id v10 = a3;
  if (a2)
  {
    if (a4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (!v7 || !*(void *)(v7 + 64))
      {
        -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:]( v7,  -3003LL,  a4,  *(void **)(a1 + 40));
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          objc_storeStrong((id *)(v9 + 64), v8);
        }
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

- (id)errorForErrorCode:(uint64_t)a3 withPOSIXCode:(void *)a4 andTask:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *MEMORY[0x189607688];
  id v8 = a4;
  [v6 errorWithDomain:v7 code:a3 userInfo:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = objc_alloc(&OBJC_CLASS___NWURLError);
  id v11 = v8;
  if (v10)
  {
    uint64_t v12 = *MEMORY[0x189607740];
    v16.receiver = v10;
    v16.super_class = (Class)&OBJC_CLASS___NWURLError;
    id v13 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v12, a2, 0);
    SEL v14 = v13;
    if (v13) {
      [v13 fillErrorForLoader:0 andTask:v11];
    }
  }

  else
  {
    SEL v14 = 0LL;
  }

  [v14 setUnderlyingError:v9];
  return v14;
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2( uint64_t a1,  const char *a2)
{
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_2:
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 64);
    }
    else {
      uint64_t v4 = 0LL;
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v4);
    return;
  }

  id v5 = *(void **)(a1 + 32);
  if (!v5 || !v5[6])
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:]((uint64_t)v5, *(void **)(a1 + 40));
    goto LABEL_2;
  }

  objc_setProperty_nonatomic_copy(v5, a2, *(id *)(a1 + 48), 56LL);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(dispatch_io_s **)(v6 + 48);
  }
  else {
    uint64_t v7 = 0LL;
  }
  dispatch_io_close(v7, 0LL);
}

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(_BYTE *)(a1 + 64) && !*(_BYTE *)(a1 + 65))
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }

- (void)checkCountOfBytesReceived
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *MEMORY[0x189603C20];
  [*(id *)(a1 + 32) removeCachedResourceValueForKey:*MEMORY[0x189603C20]];
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = 0LL;
  id v11 = 0LL;
  id v4 = v3;
  char v5 = [v4 getResourceValue:&v11 forKey:v2 error:&v10];
  id v6 = v11;
  id v7 = v10;

  if ((v5 & 1) != 0)
  {
    uint64_t v8 = [v6 longLongValue];
  }

  else
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    uint64_t v9 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_181A5C000, v9, OS_LOG_TYPE_ERROR, "Error getting response consumer file size: %@", buf, 0xCu);
    }

    uint64_t v8 = 0LL;
  }

  *(void *)(a1 + 72) = v8;
}

- (void)setFileURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void __79__NWURLSessionResponseConsumerDownload_task_deliverResponse_completionHandler___block_invoke( uint64_t a1,  int a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 64);
  }
  if (a2 || v4)
  {
    uint64_t v16 = 65541LL;
    if (ffsctl(*(_DWORD *)(a1 + 48), 0xC0084A44uLL, &v16, 0))
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v13 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        *(_DWORD *)buf = 67109120;
        int v18 = v14;
        _os_log_impl( &dword_181A5C000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to make download file purgeable: %{errno}d",  buf,  8u);
      }
    }

    close(*(_DWORD *)(a1 + 48));
    if (a2)
    {
      -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:]( *(void *)(a1 + 32),  -3000LL,  a2,  *(void **)(a1 + 40));
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLSessionResponseConsumerDownload setError:](*(void *)(a1 + 32), v15);

      -[NWURLSessionResponseConsumerDownload setIo:](*(void *)(a1 + 32));
      return;
    }
  }

  else
  {
    close(*(_DWORD *)(a1 + 48));
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(void *)(v5 + 56))
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:](v5, *(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = *(void **)(v6 + 56);
      uint64_t v8 = (uint64_t)v7 + 16;
    }

    else
    {
      id v7 = 0LL;
      uint64_t v8 = 16LL;
    }

    uint64_t v9 = *(void (**)(void))v8;
    id v10 = v7;
    v9();

    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v11, 0LL, 56LL);
    }
  }

- (void)setIo:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), 0LL);
  }
}

- (id)initWithResumeInfo:(void *)a3 completionHandler:
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_CLASS___NWURLSessionResponseConsumerDownload;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      id v7 = _Block_copy(v6);
      id v8 = a1[2];
      a1[2] = v7;

      if (v5)
      {
        objc_storeStrong(a1 + 5, v5[2]);
        if (a1[5])
        {
          [MEMORY[0x1896078A8] defaultManager];
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          [v9 temporaryDirectory];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 URLByAppendingPathComponent:a1[5] isDirectory:0];
          id v12 = a1[4];
          a1[4] = (id)v11;
        }

        else
        {
          id v13 = v5[1];
          id v9 = a1[4];
          a1[4] = v13;
        }

        *((_BYTE *)a1 + 8) = 1;
        -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)a1);
      }
    }
  }

  return a1;
}

@end