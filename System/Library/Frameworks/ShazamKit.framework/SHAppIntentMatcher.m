@interface SHAppIntentMatcher
- (SHAppIntentMatcher)initWithRunnerMatcher:(id)a3;
- (SHMatcher)childMatcher;
- (SHMatcher)matcher;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (void)_stop;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setChildMatcher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHAppIntentMatcher

- (SHAppIntentMatcher)initWithRunnerMatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHAppIntentMatcher;
  v6 = -[SHAppIntentMatcher init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_matcher, a3);
  }

  return v7;
}

- (void)startRecognitionForRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcher](self, "matcher"));
  [v4 setDelegate:self];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcher](self, "matcher"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcherRequest](self, "matcherRequest"));
  [v6 startRecognitionForRequest:v5];
}

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcherRequest](self, "matcherRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHAppIntentMatcher stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcherRequest](self, "matcherRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
    v8 = objc_opt_new(&OBJC_CLASS___SHSignature);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v8,  v11));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher delegate](self, "delegate"));
    [v10 matcher:self didProduceResponse:v9];

    -[SHAppIntentMatcher _stop](self, "_stop");
  }

- (void)_stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcher](self, "matcher"));
  [v3 setDelegate:0];

  -[SHAppIntentMatcher setChildMatcher:](self, "setChildMatcher:", 0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher matcher](self, "matcher"));
  [v4 stopRecognition];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHAppIntentMatcher delegate](self, "delegate"));
  [v6 matcher:self didProduceResponse:v5];
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcher)childMatcher
{
  return self->_childMatcher;
}

- (void)setChildMatcher:(id)a3
{
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end