@interface LoadMicroPaymentQueuePaymentsOperation
- (BOOL)_appendRangeRequestsToResponse:(id)a3 error:(id *)a4;
- (BOOL)_loadResponseReturningError:(id *)a3;
- (BOOL)_parsePropertyList:(id)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (MicroPaymentQueueResponse)response;
- (NSString)URLBagKey;
- (void)dealloc;
- (void)run;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setURLBagKey:(id)a3;
@end

@implementation LoadMicroPaymentQueuePaymentsOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadMicroPaymentQueuePaymentsOperation;
  -[LoadMicroPaymentQueuePaymentsOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v4 = 0LL;
  BOOL v3 = -[LoadMicroPaymentQueuePaymentsOperation _loadResponseReturningError:](self, "_loadResponseReturningError:", &v4);
  -[LoadMicroPaymentQueuePaymentsOperation setError:](self, "setError:", v4);
  -[LoadMicroPaymentQueuePaymentsOperation setSuccess:](self, "setSuccess:", v3);
}

- (BOOL)_appendRangeRequestsToResponse:(id)a3 error:(id *)a4
{
  id v22 = 0LL;
  v7 = -[LoadMicroPaymentQueuePaymentsOperation request](self, "request");
  v8 = -[LoadMicroPaymentQueuePaymentsOperation URLBagKey](self, "URLBagKey");
  id v21 = a3;
  id v9 = [a3 rangesToLoad];
  uint64_t v10 = (uint64_t)[v9 count];
  if (v10 < 1)
  {
    LOBYTE(v16) = 1;
    if (!a4) {
      return v16;
    }
    goto LABEL_11;
  }

  uint64_t v11 = v10;
  v20 = a4;
  uint64_t v12 = 2LL;
  do
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    v14 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueuePaymentsOperation);
    -[LoadMicroPaymentQueuePaymentsOperation setURLBagKey:](v14, "setURLBagKey:", v8);
    id v15 = -[MicroPaymentQueueRequest copy](v7, "copy");
    objc_msgSend(v15, "setRangeEndIdentifier:", objc_msgSend(v9, "objectAtIndex:", v12 - 1));
    objc_msgSend(v15, "setRangeStartIdentifier:", objc_msgSend(v9, "objectAtIndex:", v12 - 2));
    -[LoadMicroPaymentQueuePaymentsOperation setRequest:](v14, "setRequest:", v15);
    unsigned int v16 = -[LoadMicroPaymentQueuePaymentsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v22);
    if (v16) {
      objc_msgSend(v21, "appendResponse:", -[LoadMicroPaymentQueuePaymentsOperation response](v14, "response"));
    }
    else {
      id v17 = v22;
    }

    -[NSAutoreleasePool drain](v13, "drain");
    if (v12 < v11) {
      char v18 = v16;
    }
    else {
      char v18 = 0;
    }
    v12 += 2LL;
  }

  while ((v18 & 1) != 0);
  a4 = v20;
  if (v20) {
LABEL_11:
  }
    *a4 = v22;
  return v16;
}

- (BOOL)_loadResponseReturningError:(id *)a3
{
  id v21 = 0LL;
  v5 = -[LoadMicroPaymentQueuePaymentsOperation request](self, "request");
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

  v7 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v6 setDataProvider:v7];
  id v8 = objc_msgSend(objc_msgSend(v6, "requestProperties"), "mutableCopy");
  objc_msgSend(v8, "setURLBagKey:", -[LoadMicroPaymentQueuePaymentsOperation URLBagKey](self, "URLBagKey"));
  [v6 setRequestProperties:v8];

  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  uint64_t v12 = (os_log_s *)[v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    uint64_t v13 = objc_opt_class(self);
    v14 = -[LoadMicroPaymentQueuePaymentsOperation URLBagKey](self, "URLBagKey");
    int v22 = 138412802;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v5;
    uint64_t v15 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Running %@ request: %@",  &v22,  32);
    if (v15)
    {
      unsigned int v16 = (void *)v15;
      id v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
      free(v16);
      v20 = v17;
      SSFileLog(v9, @"%@");
    }
  }

  if (-[LoadMicroPaymentQueuePaymentsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v6,  &v21,  v20)) {
    BOOL v18 = -[LoadMicroPaymentQueuePaymentsOperation _parsePropertyList:error:]( self,  "_parsePropertyList:error:",  -[DaemonProtocolDataProvider output](v7, "output"),  &v21);
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

- (BOOL)_parsePropertyList:(id)a3 error:(id *)a4
{
  v37 = 0LL;
  v7 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueResponse);
  -[MicroPaymentQueueResponse setUserIdentifier:]( v7,  "setUserIdentifier:",  -[MicroPaymentQueueRequest userIdentifier]( -[LoadMicroPaymentQueuePaymentsOperation request](self, "request"),  "userIdentifier"));
  unsigned __int8 v8 = -[MicroPaymentQueueResponse loadFromPropertyList:](v7, "loadFromPropertyList:", a3);
  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (!v9) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v38 = 138412802;
      uint64_t v39 = objc_opt_class(self);
      __int16 v40 = 2048;
      *(void *)v41 = -[NSArray count](-[MicroPaymentQueueResponse payments](v7, "payments"), "count");
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = -[LoadMicroPaymentQueuePaymentsOperation request](self, "request");
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Fetched %lu payments for %@",  &v38,  32);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        unsigned int v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        v34 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    if (-[LoadMicroPaymentQueuePaymentsOperation _appendRangeRequestsToResponse:error:]( self,  "_appendRangeRequestsToResponse:error:",  v7,  &v37,  v34))
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
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v19 = v19;
      }
      else {
        v19 &= 2u;
      }
      if ((_DWORD)v19)
      {
        uint64_t v21 = objc_opt_class(self);
        unsigned int v22 = -[NSData length](-[MicroPaymentQueueResponse appReceipt](v7, "appReceipt"), "length");
        uint64_t v23 = -[StoreKitClientIdentity bundleIdentifier]( -[MicroPaymentQueueRequest clientIdentity]( -[LoadMicroPaymentQueuePaymentsOperation request](self, "request"),  "clientIdentity"),  "bundleIdentifier");
        int v38 = 138412802;
        uint64_t v39 = v21;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v22;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v23;
        LODWORD(v36) = 28;
        uint64_t v24 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[%@] Deciding to write receipt: %d bytes -- %@",  &v38,  v36);
        if (v24)
        {
          v25 = (void *)v24;
          __int16 v26 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v24, 4LL);
          free(v25);
          v35 = v26;
          SSFileLog(v17, @"%@");
        }
      }

      if (-[NSData length](-[MicroPaymentQueueResponse appReceipt](v7, "appReceipt", v35), "length")) {
        +[AppReceipt writeReceipt:forStoreKitClient:]( &OBJC_CLASS___AppReceipt,  "writeReceipt:forStoreKitClient:",  -[MicroPaymentQueueResponse appReceipt](v7, "appReceipt"),  -[MicroPaymentQueueRequest clientIdentity]( -[LoadMicroPaymentQueuePaymentsOperation request](self, "request"),  "clientIdentity"));
      }
      -[LoadMicroPaymentQueuePaymentsOperation setResponse:](self, "setResponse:", v7);
      BOOL v27 = 1;
    }

    else
    {
      BOOL v27 = 0;
    }
  }

  else
  {
    if (!v9) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v28 = [v10 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    v30 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      int v38 = 138412290;
      uint64_t v39 = objc_opt_class(self);
      uint64_t v31 = _os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Received invalid response",  &v38,  12);
      if (v31)
      {
        v32 = (void *)v31;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
        free(v32);
        SSFileLog(v10, @"%@");
      }
    }

    BOOL v27 = 0;
    v37 = (void *)ISError(2LL, 0LL, 0LL);
  }

  if (a4) {
    *a4 = v37;
  }
  return v27;
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (MicroPaymentQueueResponse)response
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSString)URLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setURLBagKey:(id)a3
{
}

@end