@interface WLDMetricsUtilities
+ (void)sendMetricsEvents:(id)a3 metricsController:(id)a4;
@end

@implementation WLDMetricsUtilities

+ (void)sendMetricsEvents:(id)a3 metricsController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDMetricsUtilities.sendMetricsEvents");
  id v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = WLKSystemLogObject(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDMetricsUtilities - Will send events: %@",  buf,  0xCu);
    }

    [v6 enqueueEvents:v5];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 flush]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __59__WLDMetricsUtilities_sendMetricsEvents_metricsController___block_invoke;
    v13[3] = &unk_10003D0B0;
    v13[4] = &v14;
    [v10 addFinishBlock:v13];
  }

  else
  {
    uint64_t v11 = WLKSystemLogObject(0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDMetricsUtilities - No metrics to report.",  buf,  2u);
    }

    v10 = (void *)v15[5];
    v15[5] = 0LL;
  }

  _Block_object_dispose(&v14, 8);
}

void __59__WLDMetricsUtilities_sendMetricsEvents_metricsController___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = WLKSystemLogObject();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v13 = 138412290;
      id v14 = v4;
      uint64_t v8 = "WLDMetricsUtilities - Error flushing events: %@";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }

  else if (v7)
  {
    LOWORD(v13) = 0;
    uint64_t v8 = "WLDMetricsUtilities - Events flushed.";
    v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_6;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0LL;
}

@end