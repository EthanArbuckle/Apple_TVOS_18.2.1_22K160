@interface NWURLSessionDownloadTask
- (BOOL)isKindOfClass:(Class)a3;
- (id)createResumeData;
- (id)errorWithResumeData:(id)a3;
- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:;
- (id)initWithResumeInfo:(uint64_t)a3 fromOffset:(int)a4 identifier:(void *)a5 session:;
- (void)cancelByProducingResumeData:(id)a3;
@end

@implementation NWURLSessionDownloadTask

- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:
{
  id v8 = a2;
  if (a1)
  {
    v9 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, 0LL, a3, a4);
    v10 = v9;
    if (v9) {
      objc_storeStrong(v9 + 33, a2);
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
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionDownloadTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (id)errorWithResumeData:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  v6 = v4;
  if (!self) {
    goto LABEL_6;
  }
  v6 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  v6 = v4;
  if ([v4 code] == -999) {
    goto LABEL_6;
  }
  [v5 downloadTaskResumeData];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v6 = -[NWURLSessionDownloadTask createResumeData](self);
    [v5 setDownloadTaskResumeData:v6];
LABEL_6:
  }

  return v5;
}

- (void)cancelByProducingResumeData:(id)a3
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
  v7[2] = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke;
  v7[3] = &unk_189BC91E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(void *)(v2 + 288) == 2LL)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      return;
    }

    v3 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v4 = *(id *)(v2 + 264);
    id v5 = (id)v2;
    if (v3)
    {
      uint64_t v6 = *MEMORY[0x189607740];
      v26.receiver = v3;
      v26.super_class = (Class)&OBJC_CLASS___NWURLError;
      v7 = (NWURLError *)objc_msgSendSuper2(&v26, sel_initWithDomain_code_userInfo_, v6, -999, 0);
      v3 = v7;
      if (v7) {
        -[NWURLError fillErrorForLoader:andTask:](v7, "fillErrorForLoader:andTask:", v4, v5);
      }
    }

    id v8 = *(void **)(a1 + 32);
  }

  else
  {
    id v8 = 0LL;
    v3 = 0LL;
  }
  v9 = -[NWURLSessionDownloadTask createResumeData](v8);
  -[NWURLError setDownloadTaskResumeData:](v3, "setDownloadTaskResumeData:", v9);
  v11 = *(void **)(a1 + 32);
  if (v11 && (objc_setProperty_atomic_copy(v11, v10, v3, 136LL), (uint64_t v12 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v13 = 248LL;
    if (!*(void *)(v12 + 248)) {
      uint64_t v13 = 240LL;
    }
    v14 = (void **)*(id *)(v12 + v13);
  }

  else
  {
    v14 = 0LL;
  }

  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  v22 = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2;
  v23 = &unk_189BC91E8;
  id v25 = *(id *)(a1 + 40);
  id v15 = v9;
  id v24 = v15;
  if (v14) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v14[6], &v20);
  }

  v16 = *(void **)(a1 + 32);
  if (v16) {
    v17 = (void *)v16[53];
  }
  else {
    v17 = 0LL;
  }
  id v18 = v17;
  objc_msgSend(v16, "error", v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 task:v16 deliverData:0 complete:1 error:v19 completionHandler:&__block_literal_global_458];

  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

- (id)createResumeData
{
  id v1 = a1;
  if (a1)
  {
    [a1 currentRequest];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 URL];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 scheme];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    id v5 = v4;
    if ([v5 caseInsensitiveCompare:@"http"])
    {
      uint64_t v6 = [v5 caseInsensitiveCompare:@"https"];

      if (v6)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
        }
        v7 = (os_log_s *)(id)gurlLogObj;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          __int16 v32 = 0;
          id v8 = "Cannot create download resume data for non-HTTP(S) request";
          v9 = (uint8_t *)&v32;
LABEL_14:
          _os_log_impl(&dword_181A5C000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
          id v1 = 0LL;
LABEL_44:

          return v1;
        }

        goto LABEL_15;
      }
    }

    else
    {
    }

    [v2 HTTPMethod];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 caseInsensitiveCompare:@"GET"];

    if (v11)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      v7 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v8 = "Cannot create download resume data for non-GET request";
        v9 = buf;
        goto LABEL_14;
      }

uint64_t __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (id)initWithResumeInfo:(uint64_t)a3 fromOffset:(int)a4 identifier:(void *)a5 session:
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v9 = a2;
  id v10 = a5;
  if (!a1)
  {
    __int16 v30 = 0LL;
    goto LABEL_29;
  }

  id v11 = v9[2];
  id v12 = v9[4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v13 = v12;
    [v13 valueForHTTPHeaderField:@"ETag"];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

      if (!a3) {
        goto LABEL_7;
      }
    }

    else
    {
      [v13 valueForHTTPHeaderField:@"Last-Modified"];
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3) {
        goto LABEL_7;
      }
    }

    if (v14)
    {
      int v45 = a4;
      id v16 = v9[3];
      id v15 = (void *)[v16 mutableCopy];

      [v15 setValue:v14 forHTTPHeaderField:@"If-Range"];
      [v11 valueForHTTPHeaderField:@"Range"];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v46 hasPrefix:@"bytes="])
      {
        [v46 componentsSeparatedByString:@"="];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)[v17 count] <= 1)
        {
        }

        else
        {
          [v17 objectAtIndexedSubscript:1];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            [v18 componentsSeparatedByString:@"-"];
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            if ([v19 count] != 2)
            {
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
              }
              __int16 v32 = v18;
              v33 = (os_log_s *)(id)gurlLogObj;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v46;
                _os_log_impl(&dword_181A5C000, v33, OS_LOG_TYPE_ERROR, "Unsupported Range header value: %@", buf, 0xCu);
              }

              __int16 v30 = 0LL;
              goto LABEL_28;
            }

            v40 = v18;
            if ([v18 hasSuffix:@"-"])
            {
              [v19 objectAtIndexedSubscript:0];
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v41 = [v20 longLongValue];

              uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", v41 + a3);
              [v15 setValue:v21 forHTTPHeaderField:@"Range"];
              v42 = (void *)v21;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
              }
              a4 = v45;
              uint64_t v22 = (os_log_s *)(id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }

            else if ([v18 hasPrefix:@"-"])
            {
              [v19 objectAtIndexedSubscript:1];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v43 = [v34 longLongValue];

              uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=-%lld", v43 - a3);
              [v15 setValue:v35 forHTTPHeaderField:@"Range"];
              a4 = v45;
              v42 = (void *)v35;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
              }
              uint64_t v22 = (os_log_s *)(id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }

            else
            {
              [v19 objectAtIndexedSubscript:0];
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v39 = [v36 longLongValue];

              [v19 objectAtIndexedSubscript:1];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v44 = [v37 longLongValue];

              uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-%lld", v39 + a3, v44);
              [v15 setValue:v38 forHTTPHeaderField:@"Range"];
              a4 = v45;
              v42 = (void *)v38;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
              }
              uint64_t v22 = (os_log_s *)(id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }

            _os_log_impl(&dword_181A5C000, v22, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
LABEL_45:

            v23 = v40;
LABEL_24:

            goto LABEL_25;
          }
        }
      }

      objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setValue:v23 forHTTPHeaderField:@"Range"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      a4 = v45;
      id v19 = (id)gurlLogObj;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl(&dword_181A5C000, (os_log_t)v19, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
      }

      goto LABEL_24;
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

@end