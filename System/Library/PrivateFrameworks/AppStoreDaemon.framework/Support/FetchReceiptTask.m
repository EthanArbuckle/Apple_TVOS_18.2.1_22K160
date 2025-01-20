@interface FetchReceiptTask
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation FetchReceiptTask

- (void)mainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!*(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2))
  {
    v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    v6 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
    *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2) = (FetchReceiptTaskDelegate *)v5;
  }

  v7 = *(ACAccount **)((char *)&self->_account + 2);
  id v35 = 0LL;
  id v8 = v7;
  v9 = sub_10028A05C((uint64_t)self, v8, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v35;

  if (ASDErrorIsEqual(v11, ASDServerErrorDomain, 500328LL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(&self->_revoked + 1));
    char v13 = objc_opt_respondsToSelector(WeakRetained, "handleAuthenticateRequest:resultHandler:");

    uint64_t v14 = ASDLogHandleForCategory(14LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
        id v18 = *(id *)((char *)&self->_account + 2);
        id v19 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
        *(_DWORD *)buf = 138412546;
        v37 = v17;
        __int16 v38 = 2114;
        v39 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Handling authentication request",  buf,  0x16u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
      [v21 setAccountMediaType:*(void *)(&self->super._finished + 1)];
      id v22 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
      [v22 setClientInfo:v21];
      [v22 setDebugReason:@"Receipt"];
      v23 = *(NSError **)((char *)&self->super.super._error + 2);
      if (v23)
      {
        id v24 = v23;
      }

      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v21 accountMediaType]);
        id v26 = sub_10028B524((uint64_t)self, v25);
        id v24 = (id)objc_claimAutoreleasedReturnValue(v26);
      }

      v27 = -[AMSAuthenticateRequest initWithAccount:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithAccount:options:",  v24,  v22);
      id v28 = objc_loadWeakRetained((id *)(&self->_revoked + 1));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10028B5B8;
      v33[3] = &unk_1003EBD80;
      v33[4] = self;
      id v34 = v4;
      [v28 handleAuthenticateRequest:v27 resultHandler:v33];
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v29 = *(FetchReceiptTaskDelegate **)((char *)&self->_delegate + 2);
        id v30 = *(id *)((char *)&self->_account + 2);
        id v31 = v29;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleID]);
        *(_DWORD *)buf = 138412546;
        v37 = v29;
        __int16 v38 = 2114;
        v39 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] No delegate to handle authentication request",  buf,  0x16u);
      }

      (*((void (**)(id, id))v4 + 2))(v4, v11);
    }
  }

  else
  {
    sub_10028B684((uint64_t)self, v10, v11, v4);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  v10 = sub_10028B500((char *)self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  char v12 = objc_opt_respondsToSelector(v11, "handleDialogRequest:resultHandler:");

  uint64_t v13 = ASDLogHandleForCategory(14LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v16 = *(id *)((char *)&self->_delegate + 2);
        v17 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v16 = 0LL;
        v17 = 0LL;
      }

      id v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
      int v27 = 138412546;
      id v28 = v16;
      __int16 v29 = 2114;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Handling dialog request",  (uint8_t *)&v27,  0x16u);
    }

    v20 = sub_10028B500((char *)self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v21 handleDialogRequest:v8 resultHandler:v9];
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v23 = *(id *)((char *)&self->_delegate + 2);
        id v24 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v23 = 0LL;
        id v24 = 0LL;
      }

      id v25 = v24;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleID]);
      int v27 = 138412546;
      id v28 = v23;
      __int16 v29 = 2114;
      id v30 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] No delegate to handle dialog request",  (uint8_t *)&v27,  0x16u);
    }

    uint64_t v22 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v9[2](v9, 0LL, v21);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  v10 = sub_10028B500((char *)self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  char v12 = objc_opt_respondsToSelector(v11, "handleAuthenticateRequest:resultHandler:");

  uint64_t v13 = ASDLogHandleForCategory(14LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v16 = *(id *)((char *)&self->_delegate + 2);
        v17 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v16 = 0LL;
        v17 = 0LL;
      }

      id v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
      int v27 = 138412546;
      id v28 = v16;
      __int16 v29 = 2114;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Handling authentication request",  (uint8_t *)&v27,  0x16u);
    }

    v20 = sub_10028B500((char *)self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v21 handleAuthenticateRequest:v8 resultHandler:v9];
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v23 = *(id *)((char *)&self->_delegate + 2);
        id v24 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v23 = 0LL;
        id v24 = 0LL;
      }

      id v25 = v24;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleID]);
      int v27 = 138412546;
      id v28 = v23;
      __int16 v29 = 2114;
      id v30 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] No delegate to handle authentication request",  (uint8_t *)&v27,  0x16u);
    }

    uint64_t v22 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v9[2](v9, 0LL, v21);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  v10 = sub_10028B500((char *)self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  char v12 = objc_opt_respondsToSelector(v11, "handleEngagementRequest:resultHandler:");

  uint64_t v13 = ASDLogHandleForCategory(14LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v16 = *(id *)((char *)&self->_delegate + 2);
        v17 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v16 = 0LL;
        v17 = 0LL;
      }

      id v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
      int v27 = 138412546;
      id v28 = v16;
      __int16 v29 = 2114;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Handling engagement request",  (uint8_t *)&v27,  0x16u);
    }

    v20 = sub_10028B500((char *)self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v21 handleEngagementRequest:v8 resultHandler:v9];
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v23 = *(id *)((char *)&self->_delegate + 2);
        id v24 = *(ACAccount **)((char *)&self->_account + 2);
      }

      else
      {
        id v23 = 0LL;
        id v24 = 0LL;
      }

      id v25 = v24;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleID]);
      int v27 = 138412546;
      id v28 = v23;
      __int16 v29 = 2114;
      id v30 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] No delegate to handle engagement request",  (uint8_t *)&v27,  0x16u);
    }

    uint64_t v22 = ASDErrorWithDescription(ASDErrorDomain, 908LL, @"Operation Canceled");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v9[2](v9, 0LL, v21);
  }
}

- (void).cxx_destruct
{
}

@end