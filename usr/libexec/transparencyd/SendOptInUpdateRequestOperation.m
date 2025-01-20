@interface SendOptInUpdateRequestOperation
- (IDSKTOptInResult)result;
- (KTOperationDependencies)deps;
- (NSDictionary)request;
- (NSOperation)finishedOp;
- (SendOptInUpdateRequestOperation)initWithDependenics:(id)a3 optInRequest:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation SendOptInUpdateRequestOperation

- (SendOptInUpdateRequestOperation)initWithDependenics:(id)a3 optInRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SendOptInUpdateRequestOperation;
  v8 = -[KTGroupOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[SendOptInUpdateRequestOperation setDeps:](v8, "setDeps:", v6);
    -[SendOptInUpdateRequestOperation setRequest:](v9, "setRequest:", v7);
  }

  return v9;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[SendOptInUpdateRequestOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  if (qword_1002EEE60 != -1) {
    dispatch_once(&qword_1002EEE60, &stru_100289270);
  }
  v5 = (void *)qword_1002EEE68;
  if (os_log_type_enabled((os_log_t)qword_1002EEE68, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation request](self, "request"));
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "sending opt-in state change to IDS: %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 idsOperations]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation request](self, "request"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001BD6A4;
  v11[3] = &unk_1002892B8;
  v11[4] = self;
  [v9 sendOptInUpdateRequest:v10 withCompletion:v11];
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

- (NSDictionary)request
{
  return (NSDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (IDSKTOptInResult)result
{
  return (IDSKTOptInResult *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end