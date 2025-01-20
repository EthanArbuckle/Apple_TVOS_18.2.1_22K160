@interface CheckPreorderQueueOperation
- (CheckPreorderQueueOperation)initWithAccountIdentifier:(id)a3;
- (NSNumber)accountIdentifier;
- (id)_newURLOperation;
- (int64_t)numberOfPreordersInQueue;
- (void)dealloc;
- (void)run;
@end

@implementation CheckPreorderQueueOperation

- (CheckPreorderQueueOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CheckPreorderQueueOperation;
  v4 = -[CheckPreorderQueueOperation init](&v6, "init");
  if (v4) {
    v4->_accountID = (NSNumber *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CheckPreorderQueueOperation;
  -[CheckPreorderQueueOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  return self->_accountID;
}

- (int64_t)numberOfPreordersInQueue
{
  int64_t numberOfPreorders = self->_numberOfPreorders;
  -[CheckPreorderQueueOperation unlock](self, "unlock");
  return numberOfPreorders;
}

- (void)run
{
  id v3 = -[CheckPreorderQueueOperation _newURLOperation](self, "_newURLOperation");
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    int v38 = 138412290;
    uint64_t v39 = objc_opt_class(self);
    uint64_t v9 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Checking preorder queue",  &v38,  12);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v10);
      v34 = v11;
      *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
    }
  }

  v37 = 0LL;
  id v12 = -[CheckPreorderQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v37,  v8,  v34);
  if ((v12 & 1) != 0)
  {
    id v13 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      id v16 = [v13 objectForKey:@"pre-order-queue-count"];
      if ((objc_opt_respondsToSelector(v16, "intValue") & 1) != 0)
      {
        id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v17) {
          id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v18 = [v17 shouldLog];
        else {
          LODWORD(v19) = v18;
        }
        v20 = (os_log_s *)[v17 OSLogObject];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          uint64_t v19 = v19;
        }
        else {
          v19 &= 2u;
        }
        if ((_DWORD)v19)
        {
          uint64_t v22 = objc_opt_class(self);
          int v38 = 138412546;
          uint64_t v39 = v22;
          __int16 v40 = 2112;
          id v41 = v16;
          LODWORD(v36) = 22;
          uint64_t v23 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%@: Found %@ preorders in the queue",  &v38,  v36);
          if (v23)
          {
            v24 = (void *)v23;
            v25 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL);
            free(v24);
            v35 = v25;
            *(void *)&double v21 = SSFileLog(v17, @"%@").n128_u64[0];
          }
        }

        -[CheckPreorderQueueOperation lock](self, "lock", v21, v35);
        self->_int64_t numberOfPreorders = (int)[v16 intValue];
        -[CheckPreorderQueueOperation unlock](self, "unlock");
      }
    }
  }

  else
  {
    id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v26) {
      id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v27 = [v26 shouldLog];
    else {
      LODWORD(v28) = v27;
    }
    v29 = (os_log_s *)[v26 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v28 = v28;
    }
    else {
      v28 &= 2u;
    }
    if ((_DWORD)v28)
    {
      uint64_t v30 = objc_opt_class(self);
      int v38 = 138412546;
      uint64_t v39 = v30;
      __int16 v40 = 2112;
      id v41 = v37;
      LODWORD(v36) = 22;
      uint64_t v31 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%@: Could not check preorder queue: %@",  &v38,  v36);
      if (v31)
      {
        v32 = (void *)v31;
        v33 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
        free(v32);
        v35 = v33;
        *(void *)&double v15 = SSFileLog(v26, @"%@").n128_u64[0];
      }
    }
  }

  -[CheckPreorderQueueOperation setError:](self, "setError:", v37, v15, v35);
  -[CheckPreorderQueueOperation setSuccess:](self, "setSuccess:", v12);
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  id v4 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];

  unsigned int v5 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountID);
  [v3 setAuthenticationContext:v5];

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setCachePolicy:](v6, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v6, "setURLBagKey:", @"p2-check-pre-order-queue");
  [v3 setRequestProperties:v6];

  return v3;
}

@end