@interface PBMachineDataOperation
- (NSHTTPURLResponse)response;
- (PBMachineDataOperation)initWithURLResponse:(id)a3;
- (void)run;
- (void)setResponse:(id)a3;
@end

@implementation PBMachineDataOperation

- (PBMachineDataOperation)initWithURLResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBMachineDataOperation;
  v5 = -[PBMachineDataOperation init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[PBMachineDataOperation setResponse:](v5, "setResponse:", v4);
  }

  return v6;
}

- (void)run
{
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_10010B4E4;
  v34 = sub_10010B4F4;
  id v35 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBMachineDataOperation response](self, "response"));
  BOOL v4 = v3 == 0LL;

  if (v4)
  {
    uint64_t v15 = ISErrorWithDomain( @"PBMachineDataOperationErrorDomain",  402LL,  0LL,  @"No response provided for machine data");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[PBMachineDataOperation setError:](self, "setError:", v16);

    -[PBMachineDataOperation setSuccess:](self, "setSuccess:", 0LL);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));

    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___SSMachineDataRequest);
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBMachineDataOperation response](self, "response"));
      id v9 = [v7 initWithURLResponse:v8];

      if (v9)
      {
        *(void *)v24 = 0LL;
        v25 = v24;
        uint64_t v26 = 0x3032000000LL;
        v27 = sub_10010B4E4;
        v28 = sub_10010B4F4;
        dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
        id v10 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 actionName]);
          *(_DWORD *)buf = 138412290;
          v37 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Triggering MD action: %@",  buf,  0xCu);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
        [v9 setAccountIdentifier:v12];

        dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
        v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10010B50C;
        v19[3] = &unk_1003D7AA8;
        id v20 = v9;
        v21 = self;
        v22 = &v30;
        v23 = v24;
        dispatch_async(v14, v19);

        dispatch_semaphore_wait(*((dispatch_semaphore_t *)v25 + 5), 0xFFFFFFFFFFFFFFFFLL);
        _Block_object_dispose(v24, 8);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "No MD action required",  v24,  2u);
        }

        -[PBMachineDataOperation setSuccess:](self, "setSuccess:", 1LL);
      }

      if (v31[5]) {
        -[PBMachineDataOperation setError:](self, "setError:");
      }
    }

    else
    {
      uint64_t v17 = ISErrorWithDomain( @"PBMachineDataOperationErrorDomain",  401LL,  0LL,  @"No user signed in for machine data");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[PBMachineDataOperation setError:](self, "setError:", v18);

      -[PBMachineDataOperation setSuccess:](self, "setSuccess:", 0LL);
    }
  }

  _Block_object_dispose(&v30, 8);
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end