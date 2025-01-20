@interface CCDRetrieveClientCertificateOperation
- (BOOL)certificateRetrievalFailed;
- (BOOL)isAsynchronous;
- (NSTimer)timeoutTimer;
- (id)certificateRetrievalCompletionBlock;
- (int64_t)certificateRetrievalRequestCount;
- (void)_completeOperationWithReferenceKey:(id)a3 certificates:(id)a4 error:(id)a5;
- (void)_retryCertificateRetrievalIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5;
- (void)_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:(id)a3;
- (void)_startRetryTimerWithInterval:(double)a3;
- (void)retrieveClientCertificate;
- (void)setCertificateRetrievalCompletionBlock:(id)a3;
- (void)setCertificateRetrievalFailed:(BOOL)a3;
- (void)setCertificateRetrievalRequestCount:(int64_t)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)start;
- (void)timeoutTimerDidFire:(id)a3;
@end

@implementation CCDRetrieveClientCertificateOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
}

- (void)retrieveClientCertificate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000892C;
  v2[3] = &unk_1000189B0;
  v2[4] = self;
  +[CCDDeviceIdentitySupport retrieveClientCertificateWithCompletion:]( &OBJC_CLASS___CCDDeviceIdentitySupport,  "retrieveClientCertificateWithCompletion:",  v2);
}

- (void)_completeOperationWithReferenceKey:(id)a3 certificates:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[CCDRetrieveClientCertificateOperation certificateRetrievalCompletionBlock]( self,  "certificateRetrievalCompletionBlock"));

  if (v11)
  {
    if (v10)
    {
      v15 = *(os_log_s **)(DEPLogObjects(v12, v13, v14) + 8);
      BOOL v12 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        int v19 = 138543618;
        v20 = self;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Error: %@",  (uint8_t *)&v19,  0x16u);
      }
    }

    v16 = *(os_log_s **)(DEPLogObjects(v12, v13, v14) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completed. Calling the completion block.",  (uint8_t *)&v19,  0xCu);
    }

    v17 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[CCDRetrieveClientCertificateOperation certificateRetrievalCompletionBlock]( self,  "certificateRetrievalCompletionBlock"));
    ((void (**)(void, id, id, id))v17)[2](v17, v8, v9, v10);
  }

  else
  {
    v18 = *(os_log_s **)(DEPLogObjects(v12, v13, v14) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No completion block, canceling %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    -[CCDRetrieveClientCertificateOperation cancel](self, "cancel");
  }

  -[CCDOperation endOperation](self, "endOperation");
}

- (void)_retryCertificateRetrievalIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  if (a3)
  {
    v7 = *(os_log_s **)(DEPLogObjects(self, a2, a3) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }

    -[CCDRetrieveClientCertificateOperation _startRetryTimerWithInterval:](self, "_startRetryTimerWithInterval:", a4);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[CCDError maxRetriesExceededErrorWithUnderlyingError:]( &OBJC_CLASS___CCDError,  "maxRetriesExceededErrorWithUnderlyingError:",  a5,  a4));
    -[CCDRetrieveClientCertificateOperation _completeOperationWithReferenceKey:certificates:error:]( self,  "_completeOperationWithReferenceKey:certificates:error:",  0LL,  0LL,  v8);
  }

- (void)_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4 = a3;
  -[CCDRetrieveClientCertificateOperation setCertificateRetrievalRequestCount:]( self,  "setCertificateRetrievalRequestCount:",  (char *)-[CCDRetrieveClientCertificateOperation certificateRetrievalRequestCount]( self,  "certificateRetrievalRequestCount")
  + 1);
  -[CCDRetrieveClientCertificateOperation _retryCertificateRetrievalIfAllowed:afterDelay:orFailWithError:]( self,  "_retryCertificateRetrievalIfAllowed:afterDelay:orFailWithError:",  -[CCDRetrieveClientCertificateOperation certificateRetrievalRequestCount](self, "certificateRetrievalRequestCount") < 5,  v4,  4.0);
}

- (void)_startRetryTimerWithInterval:(double)a3
{
  v5 = objc_alloc(&OBJC_CLASS___NSTimer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  v7 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v5,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v6,  self,  "timeoutTimerDidFire:",  0LL,  0LL,  0.0);
  -[CCDRetrieveClientCertificateOperation setTimeoutTimer:](self, "setTimeoutTimer:", v7);

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDRetrieveClientCertificateOperation timeoutTimer](self, "timeoutTimer"));
  [v9 addTimer:v8 forMode:NSRunLoopCommonModes];
}

- (void)timeoutTimerDidFire:(id)a3
{
  if (-[CCDRetrieveClientCertificateOperation certificateRetrievalFailed](self, "certificateRetrievalFailed", a3)) {
    -[CCDRetrieveClientCertificateOperation retrieveClientCertificate](self, "retrieveClientCertificate");
  }
}

- (id)certificateRetrievalCompletionBlock
{
  return *(id *)((char *)&self->super.super._private1 + 3);
}

- (void)setCertificateRetrievalCompletionBlock:(id)a3
{
}

- (BOOL)certificateRetrievalFailed
{
  return BYTE3(self->super.super._private);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  BYTE3(self->super.super._private) = a3;
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(void *)(&self->super._operationReady + 1);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(void *)(&self->super._operationReady + 1) = a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)(&self->_certificateRetrievalFailed + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end