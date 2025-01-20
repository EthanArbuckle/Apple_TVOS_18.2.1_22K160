@interface KTFetchServerOptInStatus
- (KTFetchServerOptInStatus)initWithDependencies:(id)a3 reason:(id)a4 retryScheduler:(id)a5;
- (KTNearFutureScheduler)retryScheduler;
- (KTOperationDependencies)deps;
- (NSOperation)finishedOp;
- (NSString)reason;
- (void)groupStart;
- (void)retry;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setReason:(id)a3;
- (void)setRetryScheduler:(id)a3;
@end

@implementation KTFetchServerOptInStatus

- (KTFetchServerOptInStatus)initWithDependencies:(id)a3 reason:(id)a4 retryScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTFetchServerOptInStatus;
  v11 = -[KTGroupOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFetchServerOptInStatus setDeps:](v11, "setDeps:", v8);
    -[KTFetchServerOptInStatus setRetryScheduler:](v12, "setRetryScheduler:", v10);
    -[KTFetchServerOptInStatus setReason:](v12, "setReason:", v9);
  }

  return v12;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateMonitor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ktStatus]);

  if ([v5 optIn] == (id)2
    || [v5 accountStatus] != (id)4 && objc_msgSend(v5, "idsAccountStatus") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountOperations]);
    id v29 = 0LL;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryAccount:&v29]);
    id v8 = v29;

    if (v25)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSOperation);
      -[KTFetchServerOptInStatus setFinishedOp:](self, "setFinishedOp:", v9);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus finishedOp](self, "finishedOp"));
      -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v25 username]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](&OBJC_CLASS___IDSURI, "URIWithUnprefixedURI:", v11));
      *(void *)location = 0LL;
      objc_initWeak((id *)location, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contextStore]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 logClient]);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000270C0;
      v26[3] = &unk_100278C58;
      objc_copyWeak(&v28, (id *)location);
      uint64_t v17 = kKTApplicationIdentifierIDS;
      id v18 = v12;
      id v27 = v18;
      [v14 contextForApplication:v17 logClient:v16 fetchState:1 completionHandler:v26];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stateMonitor]);
      [v23 setServerOptInState:2];

      if (qword_1002E6490 != -1) {
        dispatch_once(&qword_1002E6490, &stru_100278B88);
      }
      v24 = (os_log_s *)qword_1002E6498;
      if (os_log_type_enabled((os_log_t)qword_1002E6498, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "KTFetchServerOptInStatus: failed to check server opt-in, no account: %@",  location,  0xCu);
      }
    }
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stateMonitor]);
    [v20 setServerOptInState:2];

    if (qword_1002E6490 != -1) {
      dispatch_once(&qword_1002E6490, &stru_100278B68);
    }
    v21 = (os_log_s *)qword_1002E6498;
    if (os_log_type_enabled((os_log_t)qword_1002E6498, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "KTFetchServerOptInStatus: CDP is ready and we found an opt-in state, skipping KT server opt-in state",  location,  2u);
    }
  }
}

- (void)retry
{
  if (qword_1002E6490 != -1) {
    dispatch_once(&qword_1002E6490, &stru_100278C78);
  }
  v3 = (os_log_s *)qword_1002E6498;
  if (os_log_type_enabled((os_log_t)qword_1002E6498, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "triggering a server opt-in state fetch retry",  v12,  2u);
  }

  v4 = objc_alloc(&OBJC_CLASS___KTPendingFlag);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus retryScheduler](self, "retryScheduler"));
  v6 = -[KTPendingFlag initWithFlag:conditions:scheduler:]( v4,  "initWithFlag:conditions:scheduler:",  @"CheckServerOptIn",  2LL,  v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 flagHandler]);
  [v8 handlePendingFlag:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stateMonitor]);
  [v10 setNewServerOptInRequests:1];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus retryScheduler](self, "retryScheduler"));
  [v11 trigger];
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTNearFutureScheduler)retryScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setRetryScheduler:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end