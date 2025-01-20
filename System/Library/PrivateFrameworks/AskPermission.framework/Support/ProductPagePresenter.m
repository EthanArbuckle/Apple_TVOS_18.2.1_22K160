@interface ProductPagePresenter
+ (BOOL)presentRequest:(id)a3 withError:(id *)a4;
@end

@implementation ProductPagePresenter

+ (BOOL)presentRequest:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138543618;
    id v15 = (id)objc_opt_class(a1);
    __int16 v16 = 2114;
    id v17 = v6;
    id v9 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: Cannot present request, platform not supported. Payload: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v10 = APError(0LL, @"Could not present request", @"Unsupported device platform", 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (a4) {
    *a4 = v11;
  }

  return v12 == 0LL;
}

@end