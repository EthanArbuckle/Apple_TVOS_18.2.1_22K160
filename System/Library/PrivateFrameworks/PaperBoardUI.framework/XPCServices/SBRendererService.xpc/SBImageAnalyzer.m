@interface SBImageAnalyzer
- (SBImageAnalyzer)init;
- (id)executeAnalysisRequest:(id)a3 completion:(id)a4;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (void)_self_invalidate;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBImageAnalyzer

- (SBImageAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SBImageAnalyzer;
  v2 = -[SBImageAnalyzer init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", @"SBImageAnalyzer");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SBImageAnalyzer;
  -[SBImageAnalyzer dealloc](&v3, "dealloc");
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  if (v6)
  {
    v7 = v5->_operationQueue;
    operationQueue = v5->_operationQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100004E08;
    v10[3] = &unk_10000C440;
    v9 = v7;
    v11 = v9;
    id v12 = v6;
    -[NSOperationQueue addBarrierBlock:](operationQueue, "addBarrierBlock:", v10);
  }

  objc_sync_exit(v5);
}

- (id)executeAnalysisRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_operationQueue)
  {
    v9 = -[SBImageAnalyzerOperation initWithRequest:completion:]( objc_alloc(&OBJC_CLASS___SBImageAnalyzerOperation),  "initWithRequest:completion:",  v6,  v7);
    -[NSOperationQueue addOperation:](v8->_operationQueue, "addOperation:", v9);
    objc_initWeak(&location, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SBImageAnalyzerOperation progress](v9, "progress"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100005164;
    v13[3] = &unk_10000C468;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    [v10 setCancellationHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    if (!v7)
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    v18 = @"invalidated";
    v9 = (SBImageAnalyzerOperation *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PRUISAnalyzer",  -1LL,  v9));
    v7[2](v7, 0LL, v11);

    v10 = 0LL;
  }

LABEL_6:
  objc_sync_exit(v8);

  return v10;
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_operationQueue)
  {
    if (a4)
    {
      NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
      v22 = @"invalidated";
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SBImageAnalyzer",  -1LL,  v12));
    }

    objc_sync_exit(v7);

    v8 = 0LL;
    goto LABEL_12;
  }

  v8 = -[SBImageAnalyzerOperation initWithRequest:completion:]( objc_alloc(&OBJC_CLASS___SBImageAnalyzerOperation),  "initWithRequest:completion:",  v6,  0LL);
  objc_sync_exit(v7);

  operationQueue = v7->_operationQueue;
  v20 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  -[NSOperationQueue addOperations:waitUntilFinished:](operationQueue, "addOperations:waitUntilFinished:", v10, 1LL);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SBImageAnalyzerOperation response](v8, "response"));
  if (!v11)
  {
    if (!a4) {
      goto LABEL_13;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SBImageAnalyzerOperation error](v8, "error"));
    id v14 = v13;
    if (v13)
    {
      *a4 = v13;
    }

    else
    {
      NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
      v19 = @"unknown error";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      id v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", @"PRUISAnalyzer", -2LL, v15));
      *a4 = v16;
    }

LABEL_12:
    a4 = 0LL;
    goto LABEL_13;
  }

  a4 = (id *)objc_claimAutoreleasedReturnValue(-[SBImageAnalyzerOperation response](v8, "response"));
LABEL_13:

  return a4;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  -[SBImageAnalyzer _self_invalidate](obj, "_self_invalidate");
  objc_sync_exit(obj);
}

- (void)_self_invalidate
{
  objc_super v3 = self->_operationQueue;
  operationQueue = self->_operationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000054D8;
  v7[3] = &unk_10000C490;
  v8 = v3;
  v5 = v3;
  -[NSOperationQueue addBarrierBlock:](operationQueue, "addBarrierBlock:", v7);
  id v6 = self->_operationQueue;
  self->_operationQueue = 0LL;
}

- (void).cxx_destruct
{
}

@end