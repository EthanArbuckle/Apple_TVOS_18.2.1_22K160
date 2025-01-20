@interface SHAppIntentRunnerMatcher
- (SHAppIntentRunnerMatcher)initWithSource:(int64_t)a3;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (WFLinkActionWorkflowRunnerClient)workflowRunnerClient;
- (int64_t)source;
- (void)_stop;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setWorkflowRunnerClient:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SHAppIntentRunnerMatcher

- (SHAppIntentRunnerMatcher)initWithSource:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHAppIntentRunnerMatcher;
  result = -[SHAppIntentRunnerMatcher init](&v5, "init");
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = [[LNMetadataProvider alloc] initWithOptions:2];
  id v5 = [[LNFullyQualifiedActionIdentifier alloc] initWithActionIdentifier:@"RecognizeMusicIntent" bundleIdentifier:@"com.apple.musicrecognition"];
  id v30 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  id v28 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 actionsWithFullyQualifiedIdentifiers:v6 error:&v28]);
  id v8 = v28;

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"com.apple.musicrecognition"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  id v12 = objc_alloc(&OBJC_CLASS___LNValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LNPrimitiveValueType BOOLValueType](&OBJC_CLASS___LNPrimitiveValueType, "BOOLValueType"));
  id v14 = [v12 initWithValue:&__kCFBooleanTrue valueType:v13];

  id v15 = [[LNParameter alloc] initWithIdentifier:@"addToLibrary" value:v14];
  v16 = v15;
  if (v11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[LNConnectionPolicy policyWithActionMetadata:]( &OBJC_CLASS___LNConnectionPolicy,  "policyWithActionMetadata:",  v11));
    v29 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 actionWithParameters:v18]);

    if (-[SHAppIntentRunnerMatcher source](self, "source")) {
      uint64_t v20 = 7LL;
    }
    else {
      uint64_t v20 = 6LL;
    }
    v21 = -[WFLinkActionWorkflowRunnerClient initWithLinkAction:bundleIdentifier:runSource:]( objc_alloc(&OBJC_CLASS___WFLinkActionWorkflowRunnerClient),  "initWithLinkAction:bundleIdentifier:runSource:",  v19,  @"com.apple.musicrecognition",  v20);
    -[SHAppIntentRunnerMatcher setWorkflowRunnerClient:](self, "setWorkflowRunnerClient:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher workflowRunnerClient](self, "workflowRunnerClient"));
    [v22 setDelegate:self];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher workflowRunnerClient](self, "workflowRunnerClient"));
    [v23 start];
  }

  else
  {
    uint64_t v24 = sh_log_object(v15);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to fetch metadata for Recognize Music App Intent",  v27,  2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v8));
    v26 = objc_opt_new(&OBJC_CLASS___SHSignature);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v26,  v17));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher delegate](self, "delegate"));
    [v23 matcher:self didProduceResponse:v19];
  }
}

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher matcherRequest](self, "matcherRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHAppIntentRunnerMatcher stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher matcherRequest](self, "matcherRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher workflowRunnerClient](self, "workflowRunnerClient"));
    [v8 stop];

    id v12 = (id)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
    v9 = objc_opt_new(&OBJC_CLASS___SHSignature);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v9,  v12));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher delegate](self, "delegate"));
    [v11 matcher:self didProduceResponse:v10];

    -[SHAppIntentRunnerMatcher _stop](self, "_stop");
  }

- (void)_stop
{
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = sh_log_object(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "workflowRunnerClient:%@ didFinishRunningWorkflowWithOutput:%@ error:%@ cancelled:%i",  (uint8_t *)&v18,  0x26u);
  }

  if (v12)
  {
    id v15 = objc_opt_new(&OBJC_CLASS___SHSignature);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v15,  v12));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentRunnerMatcher delegate](self, "delegate"));
    [v17 matcher:self didProduceResponse:v16];

    -[SHAppIntentRunnerMatcher _stop](self, "_stop");
  }
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (WFLinkActionWorkflowRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (void)setWorkflowRunnerClient:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end