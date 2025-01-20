@interface LegacyManifestRequestTask
- (void)main;
@end

@implementation LegacyManifestRequestTask

- (void)main
{
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v4 = response;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse manifest](v4, "manifest"));

  id v6 = [v5 manifestType];
  if (self) {
    error = self->super.super._error;
  }
  else {
    error = 0LL;
  }
  v8 = error;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v8, "clientID"));

  uint64_t v10 = ASDLogHandleForCategory(2LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v28 = (id)objc_opt_class(self, v12);
    __int16 v29 = 2114;
    v30 = v5;
    __int16 v31 = 2114;
    v32 = v9;
    id v13 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Installing manifest: %{public}@ for client: %{public}@",  buf,  0x20u);
  }

  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_1001A8434;
  v22 = &unk_1003EA960;
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v24 = v9;
  v25 = self;
  id v26 = v6;
  id v14 = v9;
  v15 = v23;
  [v5 enumerateActivitiesUsingBlock:&v19];
  id v16 = objc_alloc(&OBJC_CLASS___ASDInstallManifestRequestResponse);
  id v17 = objc_msgSend(v16, "initWithResults:", v15, v19, v20, v21, v22);
  sub_1001BA9FC(self, v17);

  if (self)
  {
    LOBYTE(self->super.super._keepAlive) = 1;
    objc_setProperty_atomic_copy(self, v18, 0LL, 32LL);
  }
}

@end