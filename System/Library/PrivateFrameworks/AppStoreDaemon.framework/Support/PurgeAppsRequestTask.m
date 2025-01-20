@interface PurgeAppsRequestTask
- (void)main;
@end

@implementation PurgeAppsRequestTask

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
    *(_DWORD *)buf = 138544130;
    v64 = v7;
    __int16 v65 = 2114;
    v66 = v3;
    __int16 v67 = 2114;
    v68 = v9;
    __int16 v69 = 2114;
    v70 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Purge request with options: %{public}@ client: %{public}@",  buf,  0x2Au);
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

  uint64_t v20 = objc_opt_class(&OBJC_CLASS___AppPurgeCoordinator, v19);
  id v21 = v18;
  if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
    id v22 = v21;
  }
  else {
    id v22 = 0LL;
  }

  if (v22)
  {
    id v23 = v21;
    if (self)
    {
      v24 = self->super._response;
      v25 = self->super.super._error;
    }

    else
    {
      v24 = 0LL;
      v25 = 0LL;
    }

    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v26, "clientID"));
    id v28 = sub_1001A2178(v23, v24, v3, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 error]);
    uint64_t v31 = ASDLogHandleForCategory(20LL);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v35 = (void *)objc_opt_class(self, v34);
        id v36 = v35;
        v37 = (ASDRequestResponse *)objc_claimAutoreleasedReturnValue([v29 error]);
        *(_DWORD *)buf = 138543874;
        v64 = v35;
        __int16 v65 = 2114;
        v66 = v3;
        __int16 v67 = 2114;
        v68 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] Purge app request resulted in error: %{public}@",  buf,  0x20u);
      }
    }

    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (void *)objc_opt_class(self, v44);
      id v62 = v45;
      if (self) {
        v46 = self->super.super._error;
      }
      else {
        v46 = 0LL;
      }
      v61 = v46;
      v60 = (ASDRequestResponse *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v61, "clientID"));
      if (self) {
        response = self->super._response;
      }
      else {
        response = 0LL;
      }
      v59 = response;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse desiredPurgeAmount](v59, "desiredPurgeAmount"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v29 purgedApps]);
      id v50 = [v49 count];
      id v51 = [v29 purgedSize];
      *(_DWORD *)buf = 138544642;
      v64 = v45;
      __int16 v65 = 2114;
      v66 = v3;
      __int16 v67 = 2114;
      v68 = v60;
      __int16 v69 = 2114;
      v70 = v48;
      __int16 v71 = 2048;
      id v72 = v50;
      __int16 v73 = 2048;
      id v74 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Purged request for client: %{public}@ with desired amount: %{public}@ purged %ld app(s) with a total purge amount: %ld",  buf,  0x3Eu);
    }

    sub_1001BA9FC(self, v29);
    unsigned __int8 v52 = [v29 success];
    if (self) {
      LOBYTE(self->super.super._keepAlive) = v52;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue([v29 error]);
    uint64_t v54 = ASDErrorWithSafeUserInfo(v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v54);
    if (self) {
      objc_setProperty_atomic_copy(self, v55, v56, 32LL);
    }
  }

  else
  {
    uint64_t v38 = ASDLogHandleForCategory(20LL);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v57 = (void *)objc_opt_class(self, v40);
      *(_DWORD *)buf = 138543618;
      v64 = v57;
      __int16 v65 = 2114;
      v66 = v3;
      id v58 = v57;
      _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] Unable to cast appPurgeCoordinator to a AppPurgeCoordinator",  buf,  0x16u);
    }

    uint64_t v41 = ASDErrorWithDescription(ASDErrorDomain, 507LL, 0LL);
    id v23 = (id)objc_claimAutoreleasedReturnValue(v41);
    uint64_t v42 = ASDErrorWithSafeUserInfo(v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (self) {
      objc_setProperty_atomic_copy(self, v43, v29, 32LL);
    }
  }
}

@end