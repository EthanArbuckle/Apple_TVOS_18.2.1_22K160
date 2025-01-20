@interface SHSignatureGeneratorMatcher
- (BOOL)shouldGenerateSpectralOutput;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTap)tap;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)request;
- (SHSessionDriver)sessionDriver;
- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4;
- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5;
- (id)responseSignatureForRequest:(id)a3;
- (void)_stop;
- (void)matchSignature:(id)a3;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHSignatureGeneratorMatcher

- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___SHCustomCatalog);
  id v9 = objc_alloc(&OBJC_CLASS___SHStreamingSessionDriver);
  -[SHCustomCatalog minimumQuerySignatureDuration](v8, "minimumQuerySignatureDuration");
  double v11 = v10;
  -[SHCustomCatalog maximumQuerySignatureDuration](v8, "maximumQuerySignatureDuration");
  double v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHCustomCatalog _configuration](v8, "_configuration"));
  [v14 streamingBufferDuration];
  id v16 = [v9 initWithMinimumSignatureDuration:v11 maximumSignatureDuration:v13 bufferDuration:v15];

  v17 = -[SHSignatureGeneratorMatcher initWithAudioTap:sessionDriver:audioRecordingManager:]( self,  "initWithAudioTap:sessionDriver:audioRecordingManager:",  v7,  v16,  v6);
  return v17;
}

- (SHSignatureGeneratorMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SHSignatureGeneratorMatcher;
  double v12 = -[SHSignatureGeneratorMatcher init](&v18, "init");
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioRecordingManager, a5);
    objc_storeStrong((id *)&v13->_tap, a3);
    objc_storeStrong((id *)&v13->_sessionDriver, a4);
    -[SHSessionDriver setSessionDriverDelegate:](v13->_sessionDriver, "setSessionDriverDelegate:", v13);
    objc_initWeak(&location, v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000206D8;
    v15[3] = &unk_10006D5A0;
    objc_copyWeak(&v16, &location);
    -[SHAudioTap setCompletion:](v13->_tap, "setCompletion:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)matchSignature:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));
  id v6 = [v5 recordingSource];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metrics]);
  [v7 setRecordingSource:v6];

  id v8 = objc_alloc(&OBJC_CLASS___SHMatcherResponse);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  id v12 = [v8 initWithRecordingIntermission:0 recordingSignatureOffset:v4 retrySeconds:v10 match:0 signature:0.0 runningAssociatedRequestID:0.0 error:0.0];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher delegate](self, "delegate"));
  [v11 matcher:self didProduceResponse:v12];
}

- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher delegate](self, "delegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v6,  v7));

  [v8 matcher:self didProduceResponse:v9];
  -[SHSignatureGeneratorMatcher _stop](self, "_stop");
}

- (void)startRecognitionForRequest:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));

  if (v6)
  {
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    double v15 = @"Signature generator worker passed multiple requests";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  202LL,  0LL,  v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher delegate](self, "delegate"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SHSignatureGeneratorMatcher responseSignatureForRequest:]( self,  "responseSignatureForRequest:",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v11,  v8));
    [v9 matcher:self didProduceResponse:v12];

    -[SHSignatureGeneratorMatcher _stop](self, "_stop");
  }

  else
  {
    objc_storeStrong((id *)&self->_request, a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher audioRecordingManager](self, "audioRecordingManager"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));
    [v8 attachTap:v13];
  }
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v24 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher sessionDriver](self, "sessionDriver"));
  [v5 matcher:self didProduceResponse:v24];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deadline]);
  if (v7)
  {
    BOOL v8 = 0;
  }

  else
  {
    [v24 retrySeconds];
    BOOL v8 = v9 <= 0.0;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deadline]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deadline]);
    NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 earlierDate:v14]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deadline]);
    BOOL v18 = v15 == v17;
  }

  else
  {
    BOOL v18 = 0;
  }

  if (v8 || v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher delegate](self, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[SHSignatureGeneratorMatcher responseSignatureForRequest:]( self,  "responseSignatureForRequest:",  v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v22,  v19));
    [v20 matcher:self didProduceResponse:v23];

    -[SHSignatureGeneratorMatcher _stop](self, "_stop");
  }
}

- (void)_stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher audioRecordingManager](self, "audioRecordingManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));
    [v4 detachTap:v5];

    tap = self->_tap;
    self->_tap = 0LL;
  }

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));

    if (v8)
    {
      -[SHSignatureGeneratorMatcher _stop](self, "_stop");
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SHSignatureGeneratorMatcher responseSignatureForRequest:]( self,  "responseSignatureForRequest:",  v9));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v10,  v11));

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher delegate](self, "delegate"));
      [v12 matcher:self didProduceResponse:v13];
    }
  }

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHSignatureGeneratorMatcher stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (id)responseSignatureForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 signature]);

  if (v5)
  {
    id v6 = (SHSignature *)objc_claimAutoreleasedReturnValue([v4 signature]);
  }

  else
  {
    id v6 = objc_opt_new(&OBJC_CLASS___SHSignature);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));
    id v8 = [v7 recordingSource];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignature metrics](v6, "metrics"));
    [v9 setRecordingSource:v8];
  }

  return v6;
}

- (BOOL)shouldGenerateSpectralOutput
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher tap](self, "tap"));
  id v4 = [v3 recordingSource];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignatureGeneratorMatcher audioRecordingManager](self, "audioRecordingManager"));
  LOBYTE(v4) = v4 == [v5 suggestedAudioRecordingSource];

  return (char)v4;
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHAudioTap)tap
{
  return self->_tap;
}

- (SHSessionDriver)sessionDriver
{
  return self->_sessionDriver;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHMatcherRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end