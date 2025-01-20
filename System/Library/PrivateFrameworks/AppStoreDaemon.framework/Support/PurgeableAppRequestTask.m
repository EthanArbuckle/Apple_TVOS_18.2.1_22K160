@interface PurgeableAppRequestTask
- (void)main;
@end

@implementation PurgeableAppRequestTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(20LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self, v6);
    id v8 = v7;
    if (self)
    {
      v9 = self->super._response;
      error = self->super.super._error;
      v11 = v9;
    }

    else
    {
      v9 = 0LL;
      v11 = 0LL;
      error = 0LL;
    }

    v12 = error;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v12, "clientID"));
    int v39 = 138544130;
    v40 = v7;
    __int16 v41 = 2114;
    v42 = v3;
    __int16 v43 = 2114;
    v44 = v9;
    __int16 v45 = 2114;
    v46 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Purgeable request with options: %{public}@ client: %{public}@",  (uint8_t *)&v39,  0x2Au);
  }

  id v14 = sub_10021E048((uint64_t)&OBJC_CLASS___CacheDeleteCoordinator);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)v15;
  if (v15) {
    v17 = *(void **)(v15 + 48);
  }
  else {
    v17 = 0LL;
  }
  id v18 = v17;

  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v20 = response;
  id v21 = sub_10019FA38(v18, v20, v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);
  uint64_t v24 = ASDLogHandleForCategory(20LL);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v23)
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v28 = (void *)objc_opt_class(self, v27);
    id v29 = v28;
    v30 = (ASDRequestResponse *)objc_claimAutoreleasedReturnValue([v22 error]);
    int v39 = 138543874;
    v40 = v28;
    __int16 v41 = 2114;
    v42 = v3;
    __int16 v43 = 2114;
    v44 = v30;
    _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] Purgable app request resulted in error: %{public}@",  (uint8_t *)&v39,  0x20u);
  }

  else
  {
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v32 = (void *)objc_opt_class(self, v31);
    id v29 = v32;
    v33 = (ASDRequestResponse *)[v22 purgeableSize];
    int v39 = 138543874;
    v40 = v32;
    __int16 v41 = 2114;
    v42 = v3;
    __int16 v43 = 2048;
    v44 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Purgeable request complete with purgeableSize: %lld",  (uint8_t *)&v39,  0x20u);
  }

LABEL_15:
  sub_1001BA9FC(self, v22);
  unsigned __int8 v34 = [v22 success];
  if (self) {
    LOBYTE(self->super.super._keepAlive) = v34;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);
  uint64_t v36 = ASDErrorWithSafeUserInfo(v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v36);
  if (self) {
    objc_setProperty_atomic_copy(self, v37, v38, 32LL);
  }
}

@end