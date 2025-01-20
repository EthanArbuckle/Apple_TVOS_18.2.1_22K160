@interface SHAudioTapMatcher
- (BOOL)finishSessionConditionsMetForRequest:(id)a3 response:(id)a4;
- (BOOL)isRunning;
- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4;
- (BOOL)shouldGenerateSpectralOutput;
- (NSRecursiveLock)lock;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTap)audioTap;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 catalog:(id)a5;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 session:(id)a5;
- (SHAudioTapMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5 catalog:(id)a6;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (SHSession)session;
- (id)errorResponseSignature;
- (void)_stop;
- (void)session:(id)a3 didProduceResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHAudioTapMatcher

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 sessionDriver:(id)a4 audioRecordingManager:(id)a5 catalog:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc(&OBJC_CLASS___SHSession);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 _createMatcher]);
  v16 = -[SHSession initWithCatalog:matcher:sessionDriver:]( v14,  "initWithCatalog:matcher:sessionDriver:",  v10,  v15,  v12);

  v17 = -[SHAudioTapMatcher initWithAudioTap:audioRecordingManager:session:]( self,  "initWithAudioTap:audioRecordingManager:session:",  v13,  v11,  v16);
  return v17;
}

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 catalog:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[SHSession initWithCatalog:](objc_alloc(&OBJC_CLASS___SHSession), "initWithCatalog:", v8);

  id v12 = -[SHAudioTapMatcher initWithAudioTap:audioRecordingManager:session:]( self,  "initWithAudioTap:audioRecordingManager:session:",  v10,  v9,  v11);
  return v12;
}

- (SHAudioTapMatcher)initWithAudioTap:(id)a3 audioRecordingManager:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SHAudioTapMatcher;
  id v12 = -[SHAudioTapMatcher init](&v21, "init");
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioTap, a3);
    objc_storeStrong((id *)&v13->_audioRecordingManager, a4);
    objc_storeStrong((id *)&v13->_session, a5);
    v14 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v13->_lock;
    v13->_lock = v14;

    objc_initWeak(&location, v13);
    objc_copyWeak(&v19, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[SHAudioTapMatcher audioTap]( v13,  "audioTap",  _NSConcreteStackBlock,  3221225472LL,  sub_1000254BC,  &unk_10006D5A0));
    [v16 setCompletion:&v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
  [v5 lock];

  BOOL v6 = -[SHAudioTapMatcher isRunning](self, "isRunning");
  if (v6)
  {
    uint64_t v7 = sh_log_object(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error: audio tap matcher: %@ asked to start recognition when it is already matching",  (uint8_t *)&v21,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHCoreError errorWithCode:underlyingError:]( &OBJC_CLASS___SHCoreError,  "errorWithCode:underlyingError:",  101LL,  0LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher delegate](self, "delegate"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher errorResponseSignature](self, "errorResponseSignature"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v12,  v10));
    [v11 matcher:self didProduceResponse:v13];
  }

  else
  {
    -[SHAudioTapMatcher setMatcherRequest:](self, "setMatcherRequest:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher session](self, "session"));
    [v14 setDelegate:self];

    uint64_t v16 = sh_log_object(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = (SHAudioTapMatcher *)objc_claimAutoreleasedReturnValue([v4 deadline]);
      int v21 = 138412290;
      v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "startRecognition based upon deadline %@",  (uint8_t *)&v21,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioRecordingManager](self, "audioRecordingManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioTap](self, "audioTap"));
    [v19 attachTap:v20];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
    [v9 unlock];
  }
}

- (id)errorResponseSignature
{
  v3 = objc_opt_new(&OBJC_CLASS___SHSignature);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioTap](self, "audioTap"));
  id v5 = [v4 recordingSource];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSignature metrics](v3, "metrics"));
  [v6 setRecordingSource:v5];

  return v3;
}

- (BOOL)isRunning
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher matcherRequest](self, "matcherRequest"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioTap](self, "audioTap"));
  id v9 = [v8 recordingSource];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 metrics]);
  [v10 setRecordingSource:v9];

  if (-[SHAudioTapMatcher isRunning](self, "isRunning"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher delegate](self, "delegate"));
    char v12 = objc_opt_respondsToSelector(v11, "session:shouldAttemptToMatchSignature:");

    if ((v12 & 1) != 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher delegate](self, "delegate"));
      unsigned __int8 v14 = [v13 session:v6 shouldAttemptToMatchSignature:v7];
    }

    else
    {
      unsigned __int8 v14 = 1;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)session:(id)a3 didProduceResponse:(id)a4
{
  id v21 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher matcherRequest](self, "matcherRequest"));
  unsigned int v6 = -[SHAudioTapMatcher finishSessionConditionsMetForRequest:response:]( self,  "finishSessionConditionsMetForRequest:response:",  v5,  v21);

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SHMatcherResponse);
    [v21 recordingIntermission];
    double v9 = v8;
    [v21 recordingSignatureOffset];
    double v11 = v10;
    [v21 retrySeconds];
    double v13 = v12;
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v21 match]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v21 signature]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher matcherRequest](self, "matcherRequest"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 requestID]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v21 error]);
    id v19 = [v7 initWithRecordingIntermission:v14 recordingSignatureOffset:v15 retrySeconds:v17 match:v18 signature:v9 runningAssociatedRequestID:v11 error:v13];

    id v21 = v19;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher delegate](self, "delegate"));
  [v20 matcher:self didProduceResponse:v21];

  if (v6) {
    -[SHAudioTapMatcher _stop](self, "_stop");
  }
}

- (BOOL)finishSessionConditionsMetForRequest:(id)a3 response:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 result];
  if ([v5 stopCondition] == (id)3) {
    unsigned int v8 = [v5 hasHitDeadline];
  }
  else {
    unsigned int v8 = 0;
  }
  id v9 = [v5 stopCondition];
  id v10 = [v5 stopCondition];
  if (v10 == (id)2)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 match]);
    BOOL v12 = v11 != 0LL;
  }

  else
  {
    BOOL v12 = 0;
  }

  uint64_t v13 = sh_log_object(v10);
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v19[0] = 67109888;
    v19[1] = v8;
    __int16 v20 = 1024;
    BOOL v21 = v9 == 0LL;
    __int16 v22 = 1024;
    BOOL v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v7 == (id)3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Tagging finish conditions: timeOut %d, oneAttempt: %d, foundMatch: %d, failed %d",  (uint8_t *)v19,  0x1Au);
  }

  if (v9) {
    char v15 = v8;
  }
  else {
    char v15 = 1;
  }
  char v16 = v15 | v12;
  if (v7 == (id)3) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v16;
  }

  return v17;
}

- (void)_stop
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stopping recognition", v12, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
  [v5 lock];

  -[SHAudioTapMatcher setMatcherRequest:](self, "setMatcherRequest:", 0LL);
  -[SHAudioTapMatcher setDelegate:](self, "setDelegate:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher session](self, "session"));
  [v6 setDelegate:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioRecordingManager](self, "audioRecordingManager"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioTap](self, "audioTap"));
  [v7 detachTap:v8];

  audioRecordingManager = self->_audioRecordingManager;
  self->_audioRecordingManager = 0LL;

  audioTap = self->_audioTap;
  self->_audioTap = 0LL;

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
  [v11 unlock];
}

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher matcherRequest](self, "matcherRequest"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHAudioTapMatcher stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher matcherRequest](self, "matcherRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    uint64_t v9 = sh_log_object(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      uint64_t v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Stopping recognition for matcher %@",  (uint8_t *)&v17,  0xCu);
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
    [v11 lock];

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher errorResponseSignature](self, "errorResponseSignature"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v13,  v12));

    char v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher delegate](self, "delegate"));
    [v15 matcher:self didProduceResponse:v14];

    -[SHAudioTapMatcher _stop](self, "_stop");
    char v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher lock](self, "lock"));
    [v16 unlock];
  }

- (BOOL)shouldGenerateSpectralOutput
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioTap](self, "audioTap"));
  id v4 = [v3 recordingSource];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapMatcher audioRecordingManager](self, "audioRecordingManager"));
  LOBYTE(v4) = v4 == [v5 suggestedAudioRecordingSource];

  return (char)v4;
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHAudioTap)audioTap
{
  return self->_audioTap;
}

- (SHSession)session
{
  return self->_session;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
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