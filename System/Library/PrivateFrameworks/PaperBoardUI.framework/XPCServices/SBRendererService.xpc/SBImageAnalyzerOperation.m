@interface SBImageAnalyzerOperation
- (BOOL)_hasError;
- (NSError)error;
- (NSProgress)progress;
- (PRUISAnalysisServiceRequest)request;
- (PRUISAnalysisServiceResponse)response;
- (SBImageAnalyzerOperation)initWithRequest:(id)a3 completion:(id)a4;
- (void)_determineProminentColor;
- (void)_fireCompletionWithError:(id)a3;
- (void)_setupAnalysisOperations;
- (void)cancel;
@end

@implementation SBImageAnalyzerOperation

- (SBImageAnalyzerOperation)initWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SBImageAnalyzerOperation;
  v9 = -[SBImageAnalyzerOperation init](&v19, "init");
  if (v9)
  {
    id v10 = [v8 copy];
    id v11 = v9->super.super._private;
    v9->super.super._private = v10;

    v12 = objc_opt_new(&OBJC_CLASS___BSAtomicSignal);
    v13 = *(void **)&v9->super.super._private1;
    *(void *)&v9->super.super._private1 = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    reserved2 = v9->super._reserved2;
    v9->super._reserved2 = v14;

    objc_storeStrong((id *)&v9->_prominentColor, a3);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", -1LL));
    firedCompletionSignal = v9->_firedCompletionSignal;
    v9->_firedCompletionSignal = (BSAtomicSignal *)v16;

    -[SBImageAnalyzerOperation _setupAnalysisOperations](v9, "_setupAnalysisOperations");
  }

  return v9;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SBImageAnalyzerOperation;
  -[SBImageAnalyzerOperation cancel](&v6, "cancel");
  v3 = self;
  objc_sync_enter(v3);
  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  id v8 = @"cancelled.";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PaperBoardUI",  -1LL,  v4));
  -[SBImageAnalyzerOperation _fireCompletionWithError:](v3, "_fireCompletionWithError:", v5);

  objc_sync_exit(v3);
}

- (void)_setupAnalysisOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor requestIdentifier](self->_prominentColor, "requestIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SBImageAnalyzerOperation servicing request %@",  v3));

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000596C;
  v8[3] = &unk_10000C468;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  -[SBImageAnalyzerOperation addExecutionBlock:](self, "addExecutionBlock:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005AF0;
  v6[3] = &unk_10000C4B8;
  objc_copyWeak(&v7, &location);
  -[SBImageAnalyzerOperation setCompletionBlock:](self, "setCompletionBlock:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_hasError
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [v2->super._reserved2 count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_fireCompletionWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([*(id *)&v5->super.super._private1 signal])
  {
    id v6 = [v5->super._reserved2 copy];
    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (![v6 count])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor requestedAnalyses](v5->_prominentColor, "requestedAnalyses"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100005EA8;
      v20[3] = &unk_10000C4E0;
      v20[4] = v5;
      v21 = v7;
      [v8 enumerateObjectsUsingBlock:v20];
    }

    if (-[NSMutableDictionary count](v7, "count"))
    {
      id v9 = objc_alloc(&OBJC_CLASS___PRUISAnalysisServiceResponse);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor requestIdentifier](v5->_prominentColor, "requestIdentifier"));
      id v11 = -[PRUISAnalysisServiceResponse initWithRequestIdentifier:reports:]( v9,  "initWithRequestIdentifier:reports:",  v10,  v7);
      accumulatedErrors = v5->_accumulatedErrors;
      v5->_accumulatedErrors = v11;
    }

    else if ([v6 count] == (id)1)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 firstObject]);
      osTransaction = v5->_osTransaction;
      v5->_osTransaction = (OS_os_transaction *)v13;
    }

    else
    {
      if ([v6 count])
      {
        v22[0] = NSLocalizedFailureReasonErrorKey;
        v22[1] = NSMultipleUnderlyingErrorsKey;
        v23[0] = @"multiple crippling failures were experienced";
        v23[1] = v6;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
      }

      else
      {
        NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
        v25 = @"no results were returned";
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PaperBoardUI",  -1LL,  v15));
      v17 = v5->_osTransaction;
      v5->_osTransaction = (OS_os_transaction *)v16;
    }

    v18 = (void (**)(id, NSMutableArray *, OS_os_transaction *))v5->super.super._private;
    if (v18)
    {
      v18[2](v18, v5->_accumulatedErrors, v5->_osTransaction);
      id v19 = v5->super.super._private;
      v5->super.super._private = 0LL;
    }
  }

  objc_sync_exit(v5);
}

- (void)_determineProminentColor
{
  if (!-[SBImageAnalyzerOperation _hasError](self, "_hasError"))
  {
    objc_initWeak(&location, self);
    BOOL v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    id v4 = objc_claimAutoreleasedReturnValue(-[UIColor image](self->_prominentColor, "image"));
    id v5 = [v4 CGImage];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100006038;
    v8[3] = &unk_10000C508;
    objc_copyWeak(&v10, &location);
    id v6 = v3;
    id v9 = v6;
    PRUISExecuteProminentColorAnalysisOnImage(v5, v8);

    dispatch_time_t v7 = dispatch_time(0LL, 20000000000LL);
    dispatch_group_wait(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSError)error
{
  return (NSError *)self->_osTransaction;
}

- (PRUISAnalysisServiceResponse)response
{
  return (PRUISAnalysisServiceResponse *)self->_accumulatedErrors;
}

- (PRUISAnalysisServiceRequest)request
{
  return (PRUISAnalysisServiceRequest *)self->_prominentColor;
}

- (void).cxx_destruct
{
}

@end