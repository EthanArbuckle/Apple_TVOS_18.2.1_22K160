@interface IAPInfoUpdateRequestTask
- (void)main;
@end

@implementation IAPInfoUpdateRequestTask

- (void)main
{
  v3 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = (id)objc_opt_class(self, v7);
    __int16 v16 = 2114;
    v17 = v4;
    id v11 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%@]: %{public}@ Starting legacy request to refresh IAPs",  buf,  0x16u);
  }

  id v8 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001E33D4;
  v12[3] = &unk_1003E9B18;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  sub_10029D594((uint64_t)v9, v10, v12);
}

@end