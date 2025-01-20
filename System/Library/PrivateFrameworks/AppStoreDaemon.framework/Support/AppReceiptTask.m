@interface AppReceiptTask
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)main;
@end

@implementation AppReceiptTask

- (void)main
{
  if (!self || !*(void *)&self->_attributeToAppStore)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    v4 = *(void **)&self->_attributeToAppStore;
    *(void *)&self->_attributeToAppStore = v3;
  }

  v5 = sub_100289C18((char *)objc_alloc(&OBJC_CLASS___FetchReceiptTask), *(void **)&self->super._success);
  v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 138) = self->_account;
    v7 = self->_app;
    objc_setProperty_nonatomic_copy(v6, v8, v7, 50LL);
    v6[42] = (char)self->super._error;
    p_attributeToAppStore = &self->_attributeToAppStore;
    objc_setProperty_nonatomic_copy(v6, v10, *(id *)&self->_attributeToAppStore, 90LL);
    objc_storeWeak((id *)(v6 + 66), self);
  }

  else
  {
    v7 = self->_app;
    p_attributeToAppStore = &self->_attributeToAppStore;
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1001A6494;
  v26[3] = &unk_1003E9880;
  v11 = dispatch_semaphore_create(0LL);
  v27 = v11;
  [v6 setCompletionBlock:v26];
  v12 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
  v13 = v12;
  if (v12) {
    -[NSOperationQueue addOperation:](v12->_operationQueue, "addOperation:", v6);
  }
  dispatch_time_t v14 = dispatch_time(0LL, 120000000000LL);
  if (dispatch_semaphore_wait(v11, v14))
  {
    uint64_t v16 = ASDLogHandleForCategory(14LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)p_attributeToAppStore;
      v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success bundleID]);
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v24;
      __int16 v30 = 2114;
      v31 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@]  Timed out refreshing receipt",  buf,  0x16u);
    }

    uint64_t v18 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 515LL, 0LL, 0LL);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  else
  {
    if (v6) {
      id Property = objc_getProperty(v6, v15, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v19 = Property;
  }

  v22 = v19;
  if (!v19)
  {
    if (v6)
    {
      objc_storeStrong((id *)&self->_logKey, *(id *)(v6 + 146));
      BOOL v23 = v6[43] != 0;
    }

    else
    {
      objc_storeStrong((id *)&self->_logKey, 0LL);
      BOOL v23 = 0;
    }

    BYTE1(self->super._error) = v23;
  }

  LOBYTE(self->super._keepAlive) = v22 == 0LL;
  objc_setProperty_atomic_copy(self, v20, v22, 32LL);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    uint64_t v5 = ASDErrorDomain;
    id v6 = a4;
    uint64_t v7 = ASDErrorWithDescription(v5, 531LL, @"No client available to handled authenticate request");
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
  }

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    uint64_t v5 = ASDErrorDomain;
    id v6 = a4;
    uint64_t v7 = ASDErrorWithDescription(v5, 531LL, @"No client available to handled server dialog");
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
  }

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  if (a4)
  {
    uint64_t v5 = ASDErrorDomain;
    id v6 = a4;
    uint64_t v7 = ASDErrorWithDescription(v5, 531LL, @"No client available to handle engagement request");
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
  }

- (void).cxx_destruct
{
}

@end