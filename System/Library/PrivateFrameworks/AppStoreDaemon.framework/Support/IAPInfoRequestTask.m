@interface IAPInfoRequestTask
- (void)main;
@end

@implementation IAPInfoRequestTask

- (void)main
{
  v3 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = ASDLogHandleForCategory(9LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v40 = (id)objc_opt_class(self, v7);
    __int16 v41 = 2114;
    v42 = v4;
    id v28 = v40;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%{public}@]: %{public}@ Starting legacy request to get IAPs for active account",  buf,  0x16u);
  }

  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v9 = response;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse adamIds](v9, "adamIds"));
  id v11 = [v10 count];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  id v13 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v11)
  {
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_1002B8FD4;
    v34 = &unk_1003F1150;
    v35 = self;
    dispatch_semaphore_t v36 = v12;
    v15 = v12;
    sub_10029C3B0((uint64_t)v14, v10, v4, &v31);

    dispatch_time_t v16 = dispatch_time(0LL, 60000000000LL);
    uint64_t v17 = dispatch_semaphore_wait(v15, v16);
    dispatch_semaphore_t v18 = v36;
  }

  else
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1002B8DA4;
    v37[3] = &unk_1003F1150;
    v37[4] = self;
    dispatch_semaphore_t v38 = v12;
    v15 = v12;
    sub_10029D000((uint64_t)v14, v4, v37);

    dispatch_time_t v19 = dispatch_time(0LL, 60000000000LL);
    uint64_t v17 = dispatch_semaphore_wait(v15, v19);
    dispatch_semaphore_t v18 = v38;
  }

  if (v17)
  {
    id v20 = objc_alloc(&OBJC_CLASS___ASDIAPInfoResponse);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  515LL,  0LL));
    id v22 = [v20 initWithError:v21];
    sub_1001BA9FC(self, v22);

    if (self) {
      LOBYTE(self->super.super._keepAlive) = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IAPInfoRequestOperationErrorDomain",  1LL,  0LL,  v31,  v32,  v33,  v34,  v35));
    if (self) {
      objc_setProperty_atomic_copy(self, v23, v24, 32LL);
    }

    uint64_t v25 = ASDLogHandleForCategory(9LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_opt_class(self, v27);
      *(_DWORD *)buf = 138543618;
      id v40 = v29;
      __int16 v41 = 2114;
      v42 = v4;
      id v30 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "[%{public}@]: %{public}@ Timed out on semaphore",  buf,  0x16u);
    }
  }
}

@end