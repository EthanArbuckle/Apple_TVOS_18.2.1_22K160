@interface _ProtocolDelegate
- (_ProtocolDelegate)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
@end

@implementation _ProtocolDelegate

- (_ProtocolDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____ProtocolDelegate;
  v2 = -[_ProtocolDelegate init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ThreadSafeDictionary);
    tagEnvironment = v2->_tagEnvironment;
    v2->_tagEnvironment = v3;
  }

  return v2;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 logKey]);
  v13 = sub_100279068(self, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = v14;
  if (v14)
  {
    v17 = (SilentRequestPresenter *)objc_getProperty(v14, v15, 32LL, 1);
    if (v17) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v18 = ASDLogHandleForCategory(14LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2114;
      id v30 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[%{public}@] Environment not found for task: %{public}@",  buf,  0x16u);
    }
  }

  uint64_t v20 = ASDLogHandleForCategory(14LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[%{public}@] Using silent presenter for authentication as no other presenter was specified",  buf,  0xCu);
  }

  v17 = objc_alloc_init(&OBJC_CLASS___SilentRequestPresenter);
LABEL_10:
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1002792E8;
  v24[3] = &unk_1003EBD80;
  id v25 = v12;
  id v26 = v11;
  id v22 = v11;
  id v23 = v12;
  -[SilentRequestPresenter presentAuthenticateRequest:resultHandler:]( v17,  "presentAuthenticateRequest:resultHandler:",  v10,  v24);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 logKey]);
  v13 = sub_100279068(self, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = v14;
  if (v14)
  {
    v17 = (SilentRequestPresenter *)objc_getProperty(v14, v15, 32LL, 1);
    if (v17) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v18 = ASDLogHandleForCategory(14LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2114;
      id v30 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[%{public}@] Environment not found for task: %{public}@",  buf,  0x16u);
    }
  }

  uint64_t v20 = ASDLogHandleForCategory(14LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[%{public}@] Using silent presenter for dialog as no other presenter was specified",  buf,  0xCu);
  }

  v17 = objc_alloc_init(&OBJC_CLASS___SilentRequestPresenter);
LABEL_10:
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10027963C;
  v24[3] = &unk_1003EBDA8;
  id v25 = v12;
  id v26 = v11;
  id v22 = v11;
  id v23 = v12;
  -[SilentRequestPresenter presentDialogRequest:resultHandler:](v17, "presentDialogRequest:resultHandler:", v10, v24);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 logKey]);
  v13 = sub_100279068(self, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = v14;
  if (v14)
  {
    uint64_t v18 = (SilentRequestPresenter *)objc_getProperty(v14, v15, 32LL, 1);
    if (v18) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v19 = ASDLogHandleForCategory(14LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v12;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[%{public}@] Environment not found for task: %{public}@",  buf,  0x16u);
    }
  }

  uint64_t v21 = ASDLogHandleForCategory(14LL);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "[%{public}@] Using silent presenter for engagement as no other presenter was specified",  buf,  0xCu);
  }

  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___SilentRequestPresenter);
  if (!v16)
  {
    id Property = 0LL;
    goto LABEL_11;
  }

- (void).cxx_destruct
{
}

@end