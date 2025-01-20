@interface SHMatcherController
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHMatchResultNotificationScheduler)notificationScheduler;
- (SHMatcher)matcher;
- (SHMatcherController)associatedMatcherController;
- (SHMatcherController)initWithMatcher:(id)a3 notificationScheduler:(id)a4;
- (SHMatcherDelegate)delegate;
- (SHMatcherDelegate)matcherDelegateForResponse;
- (SHMatcherRequest)matcherRequest;
- (SHWorkerDelegate)workerDelegate;
- (_SHDownstreamMatcherDelegate)downstreamMatcherDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)downstreamMatcher:(id)a3 didProduceResponse:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setAssociatedMatcherController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownstreamMatcherDelegate:(id)a3;
- (void)setMatcher:(id)a3;
- (void)setMatcherDelegateForResponse:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setNotificationScheduler:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)shutdownWorkerForRequestID:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHMatcherController

- (SHMatcherController)initWithMatcher:(id)a3 notificationScheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SHMatcherController;
  v9 = -[SHMatcherController init](&v13, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS____SHDownstreamMatcherDelegate);
    downstreamMatcherDelegate = v9->_downstreamMatcherDelegate;
    v9->_downstreamMatcherDelegate = v10;

    -[_SHDownstreamMatcherDelegate setWorker:](v9->_downstreamMatcherDelegate, "setWorker:", v9);
    objc_storeStrong((id *)&v9->_matcher, a3);
    -[SHMatcher setDelegate:](v9->_matcher, "setDelegate:", v9->_downstreamMatcherDelegate);
    objc_storeStrong((id *)&v9->_notificationScheduler, a4);
  }

  return v9;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  -[SHMatcherController setMatcherRequest:](self, "setMatcherRequest:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  [v5 startRecognitionForRequest:v4];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherDelegateForResponse](self, "matcherDelegateForResponse"));
  [v8 matcher:v7 didProduceResponse:v6];

  -[SHMatcherController setMatcherDelegateForResponse:](self, "setMatcherDelegateForResponse:", 0LL);
}

- (void)downstreamMatcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 matcher]);
  unsigned int v10 = [v6 isEqual:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController delegate](self, "delegate"));
  [v11 matcher:v6 didProduceResponse:v7];

  if ((v10 & 1) == 0)
  {
    if (([v7 isStillRunningAssociatedRequest] & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));
      [v12 setAssociatedMatcherController:0];
    }

    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 delegate]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 matcher]);
    [v14 matcher:v16 didProduceResponse:v7];
  }

  if (([v7 isStillRunningAssociatedRequest] & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    unsigned __int8 v18 = objc_msgSend(v17, "sh_isMatchAttemptCancelledError");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherRequest](self, "matcherRequest"));
    unsigned int v20 = [v19 sendNotifications];

    if (!v20 || (v18 & 1) != 0)
    {
      if (v10) {
        -[SHMatcherController setAssociatedMatcherController:](self, "setAssociatedMatcherController:", 0LL);
      }
      -[SHMatcherController stopRecognition](self, "stopRecognition");
    }

    else
    {
      objc_initWeak(&location, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController notificationScheduler](self, "notificationScheduler"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000404FC;
      v22[3] = &unk_10006DF58;
      char v24 = v10;
      objc_copyWeak(&v23, &location);
      [v21 sendNotificationForResponse:v7 completionHandler:v22];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

- (NSUUID)workerID
{
  if (!self->_workerID)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___SHAppIntentMatcher);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

    if ((isKindOfClass & 1) != 0)
    {
      id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
      id v7 = SHAppIntentMatcherUUID;
LABEL_9:
      v12 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", *v7);
LABEL_10:
      workerID = self->_workerID;
      self->_workerID = v12;

      return self->_workerID;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___SHAudioTapMatcher);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___SHMultipleConcurrentMatcher);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___SHSignatureGeneratorMatcher);
        char v17 = objc_opt_isKindOfClass(v15, v16);

        if ((v17 & 1) == 0)
        {
          v12 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          goto LABEL_10;
        }

        goto LABEL_8;
      }
    }

LABEL_8:
    id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v7 = &SHRecordingMatcherUUID;
    goto LABEL_9;
  }

  return self->_workerID;
}

- (NSUUID)taskID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherRequest](self, "matcherRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requestID]);

  return (NSUUID *)v3;
}

- (int64_t)executionScope
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SHAppIntentMatcher);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    goto LABEL_6;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SHAudioTapMatcher);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    return 1LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SHMultipleConcurrentMatcher);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {

    goto LABEL_5;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SHSignatureGeneratorMatcher);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  return (isKindOfClass & 1) != 0;
}

- (void)shutdownWorker
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherRequest](self, "matcherRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHMatcherController shutdownWorkerForRequestID:](self, "shutdownWorkerForRequestID:", v3);
}

- (void)shutdownWorkerForRequestID:(id)a3
{
  id v18 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherRequest](self, "matcherRequest"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  unsigned int v6 = [v5 isEqual:v18];

  if (v6)
  {
    -[SHMatcherController setMatcherRequest:](self, "setMatcherRequest:", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
    [v7 stopRecognitionForRequestID:v18];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController completionHandler](self, "completionHandler"));
    if (v8)
    {
      uint64_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SHMatcherController completionHandler](self, "completionHandler"));
      v9[2]();

      -[SHMatcherController setCompletionHandler:](self, "setCompletionHandler:", 0LL);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController workerDelegate](self, "workerDelegate"));
    [v10 finishedWorker:self];

    -[SHMatcherController setWorkerDelegate:](self, "setWorkerDelegate:", 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
      objc_super v13 = objc_opt_new(&OBJC_CLASS___SHSignature);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v13,  v12));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController associatedMatcherController](self, "associatedMatcherController"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 downstreamMatcherDelegate]);
      char v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
      [v16 matcher:v17 didProduceResponse:v14];
    }
  }
}

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcherRequest](self, "matcherRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHMatcherController stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherController matcher](self, "matcher"));
  [v4 setDelegate:0];

  -[SHMatcherController shutdownWorkerForRequestID:](self, "shutdownWorkerForRequestID:", v5);
}

- (SHWorkerDelegate)workerDelegate
{
  return (SHWorkerDelegate *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SHMatcherController)associatedMatcherController
{
  return (SHMatcherController *)objc_loadWeakRetained((id *)&self->_associatedMatcherController);
}

- (void)setAssociatedMatcherController:(id)a3
{
}

- (SHMatcherDelegate)matcherDelegateForResponse
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_matcherDelegateForResponse);
}

- (void)setMatcherDelegateForResponse:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (_SHDownstreamMatcherDelegate)downstreamMatcherDelegate
{
  return self->_downstreamMatcherDelegate;
}

- (void)setDownstreamMatcherDelegate:(id)a3
{
}

- (SHMatchResultNotificationScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

- (void)setNotificationScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end