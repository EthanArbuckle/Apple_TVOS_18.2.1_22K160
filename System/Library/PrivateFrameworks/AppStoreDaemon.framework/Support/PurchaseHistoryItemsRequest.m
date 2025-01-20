@interface PurchaseHistoryItemsRequest
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation PurchaseHistoryItemsRequest

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_token);
  }
  else {
    id WeakRetained = 0LL;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained notificationClient]);

  if (!v15)
  {
    uint64_t v16 = ASDLogHandleForCategory(8LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    id v38 = v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      context = self->_context;
      if (context) {
        context = objc_getProperty(context, v18, 16LL, 1);
      }
      id v32 = context;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 hashedDescription]);
      *(_DWORD *)buf = 138543362;
      v43 = v33;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Items request received auth challenge for:%{public}@ but found no notification client to pass on to. Attempting internal auth",  buf,  0xCu);

      id v34 = v13;
    }

    else
    {

      id v19 = v13;
      if (!self)
      {
LABEL_11:

        id v10 = v38;
        goto LABEL_12;
      }
    }

    id v20 = v12;
    id v21 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    [v21 setDebugReason:@"Purchase History Items"];
    [v21 setAuthenticationType:1];
    id v22 = objc_alloc(&OBJC_CLASS___AMSAuthenticateTask);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 account]);

    id v24 = [v22 initWithAccount:v23 options:v21 bag:self->_bag];
    [v24 setDelegate:self];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 performAuthentication]);
    id v41 = 0LL;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 resultWithError:&v41]);
    id v27 = v41;

    if (v27)
    {
      uint64_t v28 = ASDLogHandleForCategory(8LL);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        Property = self->_context;
        if (Property) {
          Property = objc_getProperty(Property, v30, 16LL, 1);
        }
        id v37 = Property;
        v36 = (void *)objc_claimAutoreleasedReturnValue([v37 hashedDescription]);
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        __int16 v44 = 2112;
        id v45 = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Internal auth failed for %{public}@ with error:%@",  buf,  0x16u);
      }
    }

    (*((void (**)(id, void *, id))v13 + 2))(v13, v26, v27);

    goto LABEL_11;
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100286358;
  v39[3] = &unk_1003EBD80;
  v39[4] = self;
  id v40 = v13;
  [v15 deliverAuthenticateRequest:v12 withResultHandler:v39];

LABEL_12:
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = ASDLogHandleForCategory(8LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v11 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v11, "present"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100286654;
  v14[3] = &unk_1003EBDA8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

- (void).cxx_destruct
{
}

@end