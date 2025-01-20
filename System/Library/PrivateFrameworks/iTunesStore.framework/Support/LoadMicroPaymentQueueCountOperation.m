@interface LoadMicroPaymentQueueCountOperation
- (BOOL)_loadCountReturningError:(id *)a3;
- (BOOL)_setCountWithResponse:(id)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (NSDate)lastQueueCheckDate;
- (NSString)URLBagKey;
- (int64_t)queueItemCount;
- (void)dealloc;
- (void)run;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setQueueItemCount:(int64_t)a3;
- (void)setRequest:(id)a3;
- (void)setURLBagKey:(id)a3;
@end

@implementation LoadMicroPaymentQueueCountOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadMicroPaymentQueueCountOperation;
  -[LoadMicroPaymentQueueCountOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v22 = 0LL;
  objc_super v3 = -[LoadMicroPaymentQueueCountOperation request](self, "request");
  v4 = -[LoadMicroPaymentQueueCountOperation lastQueueCheckDate](self, "lastQueueCheckDate");
  if (v4
    && (v5 = v4, -[NSDate timeIntervalSinceNow](v4, "timeIntervalSinceNow"), v6 < 2.22044605e-16)
    && (id v7 = objc_msgSend( -[LoadMicroPaymentQueueCountOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  +[SSURLBagContext contextWithBagType:]( SSURLBagContext,  "contextWithBagType:",  -[MicroPaymentQueueRequest URLBagType](v3, "URLBagType")),  0),  "valueForKey:",  @"p2-in-app-download-queue-check-interval")) != 0 && (v8 = v7,  -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow"),  v10 = v9,  objc_msgSend(v8, "doubleValue"),  v10 >= -v11))
  {
    id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)[v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class(self);
      __int16 v25 = 2112;
      v26 = -[MicroPaymentQueueRequest clientIdentity](v3, "clientIdentity");
      uint64_t v18 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Throttling queue check for client: %@",  &v23,  22);
      if (v18)
      {
        v19 = (void *)v18;
        v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
        free(v19);
        v21 = v20;
        SSFileLog(v14, @"%@");
      }
    }

    uint64_t v13 = SSError(SSErrorDomain, 129LL, 0LL, 0LL);
    BOOL v12 = 0LL;
    uint64_t v22 = v13;
  }

  else
  {
    BOOL v12 = -[LoadMicroPaymentQueueCountOperation _loadCountReturningError:](self, "_loadCountReturningError:", &v22);
    uint64_t v13 = v22;
  }

  -[LoadMicroPaymentQueueCountOperation setError:](self, "setError:", v13, v21);
  -[LoadMicroPaymentQueueCountOperation setSuccess:](self, "setSuccess:", v12);
}

- (BOOL)_loadCountReturningError:(id *)a3
{
  v21 = 0LL;
  v5 = -[LoadMicroPaymentQueueCountOperation request](self, "request");
  id v6 = -[MicroPaymentQueueRequest newStoreURLOperation:](v5, "newStoreURLOperation:", &v21);
  [v6 setDelegate:self];
  if (!v6)
  {
    BOOL v18 = 0;
    if (!a3) {
      return v18;
    }
    goto LABEL_19;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v6 setDataProvider:v7];
  id v8 = objc_msgSend(objc_msgSend(v6, "requestProperties"), "mutableCopy");
  objc_msgSend(v8, "setURLBagKey:", -[LoadMicroPaymentQueueCountOperation URLBagKey](self, "URLBagKey"));
  [v6 setRequestProperties:v8];

  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  BOOL v12 = (os_log_s *)[v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    uint64_t v13 = objc_opt_class(self);
    id v14 = -[LoadMicroPaymentQueueCountOperation URLBagKey](self, "URLBagKey");
    int v22 = 138412802;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    v27 = v5;
    uint64_t v15 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Running %@ request: %@",  &v22,  32);
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
      free(v16);
      v20 = v17;
      SSFileLog(v9, @"%@");
    }
  }

  if (-[LoadMicroPaymentQueueCountOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v6,  &v21,  v20)) {
    BOOL v18 = -[LoadMicroPaymentQueueCountOperation _setCountWithResponse:error:]( self,  "_setCountWithResponse:error:",  -[DaemonProtocolDataProvider output](v7, "output"),  &v21);
  }
  else {
    BOOL v18 = 0;
  }

  [v6 setDelegate:0];
  if (a3) {
LABEL_19:
  }
    *a3 = v21;
  return v18;
}

- (BOOL)_setCountWithResponse:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(a3, v7);
  if ((isKindOfClass & 1) == 0)
  {
    id v14 = (void *)ISError(2LL, 0LL, 0LL);
    if (!a4) {
      return isKindOfClass & 1;
    }
    goto LABEL_16;
  }

  id v9 = [a3 objectForKey:@"download-queue-item-count"];
  if ((objc_opt_respondsToSelector(v9, "intValue") & 1) != 0)
  {
    -[LoadMicroPaymentQueueCountOperation setQueueItemCount:]( self,  "setQueueItemCount:",  (int)[v9 intValue]);
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    int v11 = [v10 shouldLog];
    LODWORD(v12) = [v10 shouldLogToDisk] ? v11 | 2 : v11;
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    uint64_t v12 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO) ? v12 : v12 & 2u;
    if ((_DWORD)v12)
    {
      int v17 = 138412802;
      uint64_t v18 = objc_opt_class(self);
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      int v22 = -[LoadMicroPaymentQueueCountOperation URLBagKey](self, "URLBagKey");
      id v14 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Server claims %@ items for %@",  &v17,  32);
      if (!v14) {
        goto LABEL_15;
      }
      uint64_t v15 = v14;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      SSFileLog(v10, @"%@");
    }
  }

  id v14 = 0LL;
LABEL_15:
  if (a4) {
LABEL_16:
  }
    *a4 = v14;
  return isKindOfClass & 1;
}

- (NSDate)lastQueueCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLastQueueCheckDate:(id)a3
{
}

- (int64_t)queueItemCount
{
  return self->_queueItemCount;
}

- (void)setQueueItemCount:(int64_t)a3
{
  self->_queueItemCount = a3;
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)URLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setURLBagKey:(id)a3
{
}

@end