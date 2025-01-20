@interface LoadMicroPaymentQueuesOperation
- (BOOL)_appendAutoRenewQueueToResponse:(id)a3 error:(id *)a4;
- (BOOL)_appendNormalQueueToResponse:(id)a3 error:(id *)a4;
- (BOOL)_appendToResponse:(id)a3 usingOperation:(id)a4 error:(id *)a5;
- (BOOL)_shouldCheckAutoRenewQueue;
- (MicroPaymentQueueResponse)paymentsResponse;
- (NSArray)userDSIDs;
- (NSDate)lastQueueCheckDate;
- (StoreKitClientIdentity)clientIdentity;
- (id)_URLBagContext;
- (int64_t)reason;
- (void)run;
- (void)setClientIdentity:(id)a3;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setPaymentsResponse:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setUserDSIDs:(id)a3;
@end

@implementation LoadMicroPaymentQueuesOperation

- (StoreKitClientIdentity)clientIdentity
{
  id v3 = -[StoreKitClientIdentity copy](self->_clientIdentity, "copy");
  -[LoadMicroPaymentQueuesOperation unlock](self, "unlock");
  return (StoreKitClientIdentity *)v3;
}

- (NSDate)lastQueueCheckDate
{
  id v3 = -[NSDate copy](self->_lastQueueCheckDate, "copy");
  -[LoadMicroPaymentQueuesOperation unlock](self, "unlock");
  return (NSDate *)v3;
}

- (void)setClientIdentity:(id)a3
{
  v6 = (StoreKitClientIdentity *)a3;
  -[LoadMicroPaymentQueuesOperation lock](self, "lock");
  if (self->_clientIdentity != v6)
  {
    v4 = (StoreKitClientIdentity *)-[StoreKitClientIdentity copy](v6, "copy");
    clientIdentity = self->_clientIdentity;
    self->_clientIdentity = v4;
  }

  -[LoadMicroPaymentQueuesOperation unlock](self, "unlock");
}

- (void)setLastQueueCheckDate:(id)a3
{
  v6 = (NSDate *)a3;
  -[LoadMicroPaymentQueuesOperation lock](self, "lock");
  if (self->_lastQueueCheckDate != v6)
  {
    v4 = (NSDate *)-[NSDate copy](v6, "copy");
    lastQueueCheckDate = self->_lastQueueCheckDate;
    self->_lastQueueCheckDate = v4;
  }

  -[LoadMicroPaymentQueuesOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  +[ISLoadURLBagOperation incrementNetworkCounterForBagContext:]( &OBJC_CLASS___ISLoadURLBagOperation,  "incrementNetworkCounterForBagContext:",  v3);

  v4 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueResponse);
  v5 = objc_alloc(&OBJC_CLASS___ClaimStoreKitClientOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
  v7 = -[ClaimStoreKitClientOperation initWithClientIdentity:](v5, "initWithClientIdentity:", v6);

  if (-[LoadMicroPaymentQueuesOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  0LL))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClaimStoreKitClientOperation clientIdentity](v7, "clientIdentity"));
    -[LoadMicroPaymentQueuesOperation setClientIdentity:](self, "setClientIdentity:", v8);
  }

  id v43 = 0LL;
  BOOL v9 = -[LoadMicroPaymentQueuesOperation _appendNormalQueueToResponse:error:]( self,  "_appendNormalQueueToResponse:error:",  v4,  &v43);
  id v10 = v43;
  if (v9)
  {
    if (!-[LoadMicroPaymentQueuesOperation _shouldCheckAutoRenewQueue](self, "_shouldCheckAutoRenewQueue")
      || (id v42 = v10,
          BOOL v9 = -[LoadMicroPaymentQueuesOperation _appendAutoRenewQueueToResponse:error:]( self,  "_appendAutoRenewQueueToResponse:error:",  v4,  &v42),  v11 = v42,  v10,  v10 = v11,  v9))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v12) {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      id v40 = v10;
      v41 = v7;
      unsigned int v13 = [v12 shouldLog];
      else {
        unsigned int v14 = v13;
      }
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = v14 & 2;
      }
      if ((_DWORD)v16)
      {
        v17 = (void *)objc_opt_class(self);
        id v39 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentQueueResponse appReceipt](v4, "appReceipt"));
        unsigned int v19 = [v18 length];
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
        int v44 = 138412802;
        v45 = v17;
        __int16 v46 = 1024;
        LODWORD(v47[0]) = v19;
        WORD2(v47[0]) = 2112;
        *(void *)((char *)v47 + 6) = v21;
        v22 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[%@] Deciding to write receipt: %d bytes -- %@",  &v44,  28);

        if (!v22) {
          goto LABEL_18;
        }
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
        free(v22);
        v37 = v15;
        SSFileLog(v12, @"%@");
      }

LABEL_18:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentQueueResponse appReceipt](v4, "appReceipt"));
      id v24 = [v23 length];

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentQueueResponse appReceipt](v4, "appReceipt"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
        +[AppReceipt writeReceipt:forStoreKitClient:]( &OBJC_CLASS___AppReceipt,  "writeReceipt:forStoreKitClient:",  v25,  v26);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v37));
      if (!v27) {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v28 = [v27 shouldLog];
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = v28 & 2;
      }
      if ((_DWORD)v30)
      {
        v31 = (void *)objc_opt_class(self);
        id v32 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MicroPaymentQueueResponse payments](v4, "payments"));
        id v34 = [v33 count];
        int v44 = 138412546;
        v45 = v31;
        __int16 v46 = 2048;
        v47[0] = v34;
        LODWORD(v38) = 22;
        v35 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  1LL,  "%@: Fetched %lu total payments",  &v44,  v38);

        id v10 = v40;
        if (!v35)
        {
LABEL_32:

          -[LoadMicroPaymentQueuesOperation setPaymentsResponse:](self, "setPaymentsResponse:", v4);
          BOOL v9 = 1LL;
          v7 = v41;
          goto LABEL_33;
        }

        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
        free(v35);
        v37 = v29;
        SSFileLog(v27, @"%@");
      }

      else
      {
        id v10 = v40;
      }

      goto LABEL_32;
    }
  }

- (BOOL)_appendAutoRenewQueueToResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueueOperation);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation lastQueueCheckDate](self, "lastQueueCheckDate"));
  -[LoadMicroPaymentQueueOperation setLastQueueCheckDate:](v7, "setLastQueueCheckDate:", v8);

  -[LoadMicroPaymentQueueOperation setQueueCountURLBagKey:]( v7,  "setQueueCountURLBagKey:",  @"p2-in-app-check-recurring-download-queue");
  -[LoadMicroPaymentQueueOperation setQueuePaymentsURLBagKey:]( v7,  "setQueuePaymentsURLBagKey:",  @"p2-in-app-recurring-transactions");
  BOOL v9 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueRequest);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
  -[MicroPaymentQueueRequest setClientIdentity:](v9, "setClientIdentity:", v10);

  -[LoadMicroPaymentQueueOperation setRequest:](v7, "setRequest:", v9);
  id v15 = 0LL;
  BOOL v11 = -[LoadMicroPaymentQueuesOperation _appendToResponse:usingOperation:error:]( self,  "_appendToResponse:usingOperation:error:",  v6,  v7,  &v15);

  id v12 = v15;
  unsigned int v13 = v12;
  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_appendNormalQueueToResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueueOperation);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation lastQueueCheckDate](self, "lastQueueCheckDate"));
  -[LoadMicroPaymentQueueOperation setLastQueueCheckDate:](v7, "setLastQueueCheckDate:", v8);

  -[LoadMicroPaymentQueueOperation setQueueCountURLBagKey:]( v7,  "setQueueCountURLBagKey:",  @"p2-in-app-check-download-queue");
  -[LoadMicroPaymentQueueOperation setQueuePaymentsURLBagKey:]( v7,  "setQueuePaymentsURLBagKey:",  @"p2-in-app-pending-transactions");
  BOOL v9 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueRequest);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
  -[MicroPaymentQueueRequest setClientIdentity:](v9, "setClientIdentity:", v10);

  -[LoadMicroPaymentQueueOperation setRequest:](v7, "setRequest:", v9);
  id v15 = 0LL;
  BOOL v11 = -[LoadMicroPaymentQueuesOperation _appendToResponse:usingOperation:error:]( self,  "_appendToResponse:usingOperation:error:",  v6,  v7,  &v15);

  id v12 = v15;
  unsigned int v13 = v12;
  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_appendToResponse:(id)a3 usingOperation:(id)a4 error:(id *)a5
{
  id v30 = a3;
  id v8 = a4;
  v29 = self;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation userDSIDs](self, "userDSIDs"));
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    v27 = a5;
    id obj = v9;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      unsigned int v14 = 0LL;
      id v15 = v12;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v14);
        v17 = objc_autoreleasePoolPush();
        v18 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueueOperation);
        -[LoadMicroPaymentQueueOperation setExpectedCount:](v18, "setExpectedCount:", [v8 expectedCount]);
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v8 lastQueueCheckDate]);
        -[LoadMicroPaymentQueueOperation setLastQueueCheckDate:](v18, "setLastQueueCheckDate:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue([v8 queueCountURLBagKey]);
        -[LoadMicroPaymentQueueOperation setQueueCountURLBagKey:](v18, "setQueueCountURLBagKey:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v8 queuePaymentsURLBagKey]);
        -[LoadMicroPaymentQueueOperation setQueuePaymentsURLBagKey:](v18, "setQueuePaymentsURLBagKey:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
        id v23 = [v22 copy];

        [v23 setUserIdentifier:v16];
        -[LoadMicroPaymentQueueOperation setRequest:](v18, "setRequest:", v23);
        id v31 = v15;
        LODWORD(v22) = -[LoadMicroPaymentQueuesOperation runSubOperation:returningError:]( v29,  "runSubOperation:returningError:",  v18,  &v31);
        id v12 = v31;

        if (!(_DWORD)v22)
        {

          objc_autoreleasePoolPop(v17);
          id v9 = obj;

          if (v27)
          {
            id v12 = v12;
            BOOL v25 = 0;
            id *v27 = v12;
          }

          else
          {
            BOOL v25 = 0;
          }

          goto LABEL_15;
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueueOperation response](v18, "response"));
        [v30 appendResponse:v24];

        objc_autoreleasePoolPop(v17);
        unsigned int v14 = (char *)v14 + 1;
        id v15 = v12;
      }

      while (v11 != v14);
      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  BOOL v25 = 1;
LABEL_15:

  return v25;
}

- (BOOL)_shouldCheckAutoRenewQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation _URLBagContext](self, "_URLBagContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLBagForContext:v2]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 urlForKey:@"p2-in-app-check-recurring-download-queue"]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 urlForKey:@"p2-in-app-recurring-transactions"]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_URLBagContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoadMicroPaymentQueuesOperation clientIdentity](self, "clientIdentity"));
  unsigned int v3 = [v2 isSandboxed];

  return (id)objc_claimAutoreleasedReturnValue( +[SSURLBagContext contextWithBagType:]( &OBJC_CLASS___SSURLBagContext,  "contextWithBagType:",  v3));
}

- (MicroPaymentQueueResponse)paymentsResponse
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPaymentsResponse:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSArray)userDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setUserDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end