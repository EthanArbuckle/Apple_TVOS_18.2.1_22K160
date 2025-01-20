@interface NWURLSessionRequestBodyInfo
- (id)bodyProviderFromOffset:(id *)a1;
- (id)initWithFileURL:(void *)a3 queue:;
- (id)initWithRequest:(void *)a3 queue:;
@end

@implementation NWURLSessionRequestBodyInfo

- (void).cxx_destruct
{
}

- (id)initWithFileURL:(void *)a3 queue:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyInfo;
    v8 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      id v16 = 0LL;
      uint64_t v9 = *MEMORY[0x189603C20];
      id v15 = 0LL;
      int v10 = [v6 getResourceValue:&v16 forKey:v9 error:&v15];
      id v11 = v16;
      id v12 = v15;
      if (v10)
      {
        a1[1] = (id)[v11 longLongValue];
      }

      else
      {
        a1[1] = (id)-1LL;
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
        }
        v13 = (os_log_s *)(id)gurlLogObj;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = v6;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl(&dword_181A5C000, v13, OS_LOG_TYPE_ERROR, "Failed to size file %@: %@", buf, 0x16u);
        }
      }

      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

- (id)initWithRequest:(void *)a3 queue:
{
  id v6 = a3;
  if (a1)
  {
    id v7 = a2;
    uint64_t v8 = [v7 HTTPBody];
    uint64_t v9 = [v7 HTTPBodyStream];

    if (v8 | v9)
    {
      v16.receiver = a1;
      v16.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyInfo;
      id v11 = objc_msgSendSuper2(&v16, sel_init);
      if (v11)
      {
        if (v8)
        {
          uint64_t v12 = [(id)v8 _createDispatchData];
          v13 = (void *)*((void *)v11 + 2);
          *((void *)v11 + 2) = v12;

          uint64_t v14 = [(id)v8 length];
        }

        else
        {
          if (![(id)v9 streamStatus]) {
            objc_storeStrong((id *)v11 + 4, (id)v9);
          }
          uint64_t v14 = -1LL;
        }

        *((void *)v11 + 1) = v14;
        objc_storeStrong((id *)v11 + 5, a3);
      }

      a1 = v11;
      id v10 = a1;
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)bodyProviderFromOffset:(id *)a1
{
  v3 = a1;
  if (!a1) {
    return v3;
  }
  id v4 = a2;
  if (a1[2])
  {
    v5 = objc_alloc(&OBJC_CLASS___NWURLSessionRequestBodyData);
    id v6 = v3[2];
    v2 = (dispatch_data_s *)v6;
    if (v5)
    {
      cleanup_handler.receiver = v5;
      cleanup_handler.super_class = (Class)&OBJC_CLASS___NWURLSessionRequestBodyData;
      id v7 = objc_msgSendSuper2(&cleanup_handler, sel_init);
      v3 = v7;
      if (v7)
      {
        objc_storeStrong(v7 + 1, v6);
        v3[2] = (id)dispatch_data_get_size(v2);
        v3[3] = v4;
      }

      goto LABEL_6;
    }

@end