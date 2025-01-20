@interface __CFN_TaskMetrics
- (char)initWithTask:(char *)a1;
- (void)completeWithError:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)lockTransactionMetrics:(uint64_t)a1;
- (void)nextTransaction:(void *)a3 withNewRequest:;
@end

@implementation __CFN_TaskMetrics

- (char)initWithTask:(char *)a1
{
  id v3 = a2;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_CLASS_____CFN_TaskMetrics;
    a1 = (char *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 _uniqueIdentifier];
      v5 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v4;

      *((void *)a1 + 4) = [v3 taskIdentifier];
      id v6 = v3;
      objc_opt_self();
      [v6 _effectiveConfiguration];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 _timingDataOptions];
      if (+[NSURLConnection _collectsTimingData](&OBJC_CLASS___NSURLConnection, "_collectsTimingData"))
      {
        char v9 = +[NSURLConnection _timingDataOptions](&OBJC_CLASS___NSURLConnection, "_timingDataOptions");
        v8 |= ((2
              * +[NSURLConnection _timingDataOptions](&OBJC_CLASS___NSURLConnection, "_timingDataOptions")) & 4LL | (2LL * (v9 & 1))) ^ 6;
      }

      *((void *)a1 + 9) = v8;
      *((void *)a1 + 11) = 1LL;
      uint64_t v10 = [MEMORY[0x189603FA8] array];
      v11 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v10;

      [v6 startTime];
      *((void *)a1 + 6) = v12;
      *(int64x2_t *)(a1 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
      [v6 _effectiveConfiguration];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 _sourceApplicationBundleIdentifier];
      v15 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v14;

      [v6 _effectiveConfiguration];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)a1 + 4) = [v16 _pidForHAR];

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

- (void)nextTransaction:(void *)a3 withNewRequest:
{
  v50[2] = *MEMORY[0x1895F89C0];
  id v39 = a3;
  if (!a1) {
    goto LABEL_28;
  }
  if (a2 == 2 && *(_BYTE *)(a1 + 13))
  {
    *(_BYTE *)(a1 + 13) = 0;
    goto LABEL_28;
  }

  id v6 = objc_getProperty((id)a1, v5, 96LL, 1);
  -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)v6, a2, (void *)a1);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = objc_alloc(&OBJC_CLASS_____CFN_TransactionMetrics);
  char v9 = (void *)[v39 copy];
  id v10 = v9;
  if (!v9)
  {
    if (v6) {
      v11 = (void *)v6[7];
    }
    else {
      v11 = 0LL;
    }
    id v10 = v11;
  }

  id v12 = v10;
  if (v8)
  {
    *(void *)v40 = v8;
    *(void *)&v40[8] = &OBJC_CLASS_____CFN_TransactionMetrics;
    uint64_t v8 = (__CFN_TransactionMetrics *)objc_msgSendSuper2((objc_super *)v40, sel_init);
    if (v8)
    {
      uint64_t v13 = [MEMORY[0x189607AB8] UUID];
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v13;

      objc_storeStrong((id *)&v8->_request, v10);
      int64x2_t v15 = vdupq_n_s64(0x7FF8000000000000uLL);
      *(int64x2_t *)&v8->_beginTime = v15;
      *(int64x2_t *)&v8->_cacheLookupBeginTime = v15;
      *(int64x2_t *)&v8->_requestBeginTime = v15;
      *(int64x2_t *)&v8->_responseBeginTime = v15;
      v8->_reusedAfterTime = NAN;
    }
  }

  if (!v9) {
  if (v8)
  }
  {
    v8->_beginTime = Current;
    v8->_options = *(void *)(a1 + 72);
    v8->_schedulingTier = *(void *)(a1 + 88);
    v8->_pidForHAR = *(_DWORD *)(a1 + 16);
    v16 = *(void **)(a1 + 24);
    v17 = v8;
    id v18 = v16;
    if (HARLoggingEnabled(v8->_pidForHAR))
    {
      request = v17->_request;
LABEL_17:
      v20 = request;
      [MEMORY[0x189603FC8] dictionary];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[NSURLRequest URL](v20, "URL");
      [v22 absoluteString];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 setObject:v23 forKeyedSubscript:@"url"];
      v24 = -[NSURLRequest HTTPMethod](v20, "HTTPMethod");
      [v21 setObject:v24 forKeyedSubscript:@"method"];

      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[NSURLRequest attribution](v20, "attribution"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 setObject:v25 forKeyedSubscript:@"attribution"];

      [MEMORY[0x1896078D8] dataWithJSONObject:v21 options:0 error:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = 0LL;
      v50[1] = 0LL;
      [v18 getUUIDBytes:v50];
      v49[0] = 0LL;
      v49[1] = 0LL;
      if (v8) {
        v27 = v8->_UUID;
      }
      else {
        v27 = 0LL;
      }
      v28 = v27;
      -[NSUUID getUUIDBytes:](v28, "getUUIDBytes:", v49);

      instrumentsTransactionLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (v8) {
        v30 = v8->_UUID;
      }
      else {
        v30 = 0LL;
      }
      v31 = v30;
      os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v29, v31);

      instrumentsTransactionLog();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        int v35 = [v26 length];
        uint64_t v36 = [v26 bytes];
        *(void *)v40 = 0x1004120602LL;
        *(_WORD *)&v40[8] = 2098;
        *(void *)&v40[10] = v49;
        __int16 v41 = 1042;
        int v42 = 16;
        __int16 v43 = 2098;
        v44 = v50;
        __int16 v45 = 1040;
        int v46 = v35;
        __int16 v47 = 2082;
        uint64_t v48 = v36;
        _os_signpost_emit_with_name_impl( &dword_18298D000,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  v32,  "Transaction",  "UUID: %{public,uuid_t}.16P, Task UUID: %{public,uuid_t}.16P, Additional Info: %{public,xcode:data}.*s",  v40,  0x32u);
      }
    }
  }

  else
  {
    id v18 = *(id *)(a1 + 24);
    BOOL v38 = HARLoggingEnabled(0);
    request = 0LL;
    if (v38) {
      goto LABEL_17;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  [*(id *)(a1 + 40) addObject:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  objc_setProperty_atomic((id)a1, v37, v8, 96LL);

LABEL_28:
}

- (void).cxx_destruct
{
}

- (void)completeWithError:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v20 = a2;
  if (a1)
  {
    id Property = objc_getProperty((id)a1, v3, 96LL, 1);
    if (v20) {
      uint64_t v5 = 1024LL;
    }
    else {
      uint64_t v5 = 1LL;
    }
    -[__CFN_TransactionMetrics end:taskMetrics:]((uint64_t)Property, v5, (void *)a1);
    *(CFAbsoluteTime *)(a1 + 64) = CFAbsoluteTimeGetCurrent();
    int v6 = *(_DWORD *)(a1 + 16);
    id v7 = *(id *)(a1 + 24);
    id v8 = v20;
    if (HARLoggingEnabled(v6))
    {
      [MEMORY[0x189603FC8] dictionary];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        [MEMORY[0x189603FC8] dictionary];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 domain];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v11 forKeyedSubscript:@"domain"];

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v8, "code"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v12 forKeyedSubscript:@"code"];

        [v8 localizedDescription];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v13 forKeyedSubscript:@"localizedDescription"];

        [v8 description];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v14 forKeyedSubscript:@"description"];

        [v9 setObject:v10 forKeyedSubscript:@"error"];
      }

      [MEMORY[0x1896078D8] dataWithJSONObject:v9 options:0 error:0];
      int64x2_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      instrumentsTaskLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v7);

      instrumentsTaskLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 67109634;
        BOOL v22 = v20 == 0LL;
        __int16 v23 = 1040;
        int v24 = [v15 length];
        __int16 v25 = 2082;
        uint64_t v26 = [v15 bytes];
        _os_signpost_emit_with_name_impl( &dword_18298D000,  v19,  OS_SIGNPOST_EVENT,  v17,  "Task Completed",  "Succeeded: %{BOOL}d, Additional Info: %{public,xcode:data}.*s",  buf,  0x18u);
      }
    }
  }
}

- (void)lockTransactionMetrics:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4[2](v4, *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    id v3 = v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_UUID forKey:@"UUID"];
  [v4 encodeInteger:self->_identifier forKey:@"identifier"];
  os_unfair_lock_lock(&self->_lock);
  [v4 encodeObject:self->_transactionMetrics forKey:@"transactionMetrics"];
  os_unfair_lock_unlock(&self->_lock);
  [v4 encodeDouble:@"createTime" forKey:self->_createTime];
  [v4 encodeDouble:@"firstResumeTime" forKey:self->_firstResumeTime];
  [v4 encodeDouble:@"completeTime" forKey:self->_completeTime];
  [v4 encodeInt64:self->_options forKey:@"options"];
}

@end