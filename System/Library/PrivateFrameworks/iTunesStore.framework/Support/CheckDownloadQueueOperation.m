@interface CheckDownloadQueueOperation
- (CheckDownloadQueueOperation)init;
- (CheckDownloadQueueOperation)initWithDownloadQueueRequest:(id)a3;
- (StoreDownloadQueueRequest)downloadQueueRequest;
- (id)_account;
- (id)_newURLOperation;
- (int64_t)numberOfAvailableDownloads;
- (void)_runPendingCancelDownloadOperations;
- (void)dealloc;
- (void)run;
@end

@implementation CheckDownloadQueueOperation

- (CheckDownloadQueueOperation)init
{
  return -[CheckDownloadQueueOperation initWithDownloadQueueRequest:](self, "initWithDownloadQueueRequest:", 0LL);
}

- (CheckDownloadQueueOperation)initWithDownloadQueueRequest:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CheckDownloadQueueOperation.m",  33LL,  @"Must have a request");
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CheckDownloadQueueOperation;
  v5 = -[CheckDownloadQueueOperation init](&v7, "init");
  if (v5) {
    v5->_request = (StoreDownloadQueueRequest *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CheckDownloadQueueOperation;
  -[CheckDownloadQueueOperation dealloc](&v3, "dealloc");
}

- (StoreDownloadQueueRequest)downloadQueueRequest
{
  return (StoreDownloadQueueRequest *)-[StoreDownloadQueueRequest copy](self->_request, "copy");
}

- (int64_t)numberOfAvailableDownloads
{
  int64_t numberOfAvailableDownloads = self->_numberOfAvailableDownloads;
  -[CheckDownloadQueueOperation unlock](self, "unlock");
  return numberOfAvailableDownloads;
}

- (void)run
{
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    uint64_t v7 = objc_opt_class(self);
    request = self->_request;
    int v36 = 138412546;
    uint64_t v37 = v7;
    __int16 v38 = 2112;
    int64_t v39 = (int64_t)request;
    uint64_t v9 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Running request: %@",  &v36,  22);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v10);
      v32 = v11;
      SSFileLog(v3, @"%@");
    }
  }

  -[CheckDownloadQueueOperation _runPendingCancelDownloadOperations](self, "_runPendingCancelDownloadOperations", v32);
  v35 = 0LL;
  id v12 = -[CheckDownloadQueueOperation _newURLOperation](self, "_newURLOperation");
  if ((-[CheckDownloadQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v12,  &v35) & 1) != 0)
  {
    id v13 = objc_msgSend( objc_msgSend(objc_msgSend(v12, "dataProvider"), "output"),  "objectForKey:",  @"download-queue-item-count");
    else {
      int64_t v14 = 0LL;
    }
    id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v23) {
      id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v24 = [v23 shouldLog];
    else {
      LODWORD(v25) = v24;
    }
    v26 = (os_log_s *)[v23 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      uint64_t v27 = objc_opt_class(self);
      v28 = self->_request;
      int v36 = 138412802;
      uint64_t v37 = v27;
      __int16 v38 = 2048;
      int64_t v39 = v14;
      __int16 v40 = 2112;
      v41 = v28;
      LODWORD(v34) = 32;
      uint64_t v29 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "%@: Found %ld downloads for request: %@",  &v36,  v34);
      if (v29)
      {
        v30 = (void *)v29;
        v31 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v29, 4LL);
        free(v30);
        v33 = v31;
        SSFileLog(v23, @"%@");
      }
    }

    -[CheckDownloadQueueOperation lock](self, "lock", v33);
    self->_int64_t numberOfAvailableDownloads = v14;
    -[CheckDownloadQueueOperation unlock](self, "unlock");
    -[CheckDownloadQueueOperation setSuccess:](self, "setSuccess:", 1LL);
  }

  else
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      uint64_t v19 = objc_opt_class(self);
      v20 = self->_request;
      int v36 = 138412802;
      uint64_t v37 = v19;
      __int16 v38 = 2112;
      int64_t v39 = (int64_t)v20;
      __int16 v40 = 2112;
      v41 = v35;
      LODWORD(v34) = 32;
      uint64_t v21 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Request %@ failed: %@",  &v36,  v34);
      if (v21)
      {
        v22 = (void *)v21;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
        free(v22);
        SSFileLog(v15, @"%@");
      }
    }
  }
}

- (id)_account
{
  v2 = -[StoreDownloadQueueRequest accountIdentifier](self->_request, "accountIdentifier");
  if (!v2) {
    return objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  }
  id result = objc_msgSend( +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),  "accountWithUniqueIdentifier:",  v2);
  if (!result) {
    return objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  }
  return result;
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v3 setUseUserSpecificURLBag:1];
  id v4 = -[CheckDownloadQueueOperation _account](self, "_account");
  uint64_t v5 = -[SSAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccount:",  v4);
  [v3 setAuthenticationContext:v5];

  v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v6, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setCachePolicy:](v6, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:]( v6,  "setURLBagKey:",  -[StoreDownloadQueueRequest queueCountURLBagKey](self->_request, "queueCountURLBagKey"));
  -[SSMutableURLRequestProperties setURLBagType:]( v6,  "setURLBagType:",  SSURLBagTypeForAccountScope([v4 accountScope]));
  [v3 setRequestProperties:v6];

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v3 setDataProvider:v7];

  return v3;
}

- (void)_runPendingCancelDownloadOperations
{
  id v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadsOperation);
  -[CheckDownloadQueueOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, 0LL);
}

@end