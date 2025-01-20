@interface CCDEnrollmentOperation
- (BOOL)certificateRetrievalFailed;
- (NSError)error;
- (NSTimer)timeoutTimer;
- (double)retryAfterInterval;
- (id)enrollmentCompletionBlock;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
- (int64_t)certificateRetrievalRequestCount;
- (void)completeOperationWithResponse:(id)a3 error:(id)a4;
- (void)setCertificateRetrievalFailed:(BOOL)a3;
- (void)setCertificateRetrievalRequestCount:(int64_t)a3;
- (void)setEnrollmentCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setRetryAfterInterval:(double)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation CCDEnrollmentOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (a5 > 499)
  {
    if (a5 == 500)
    {
      if (a7)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](&OBJC_CLASS___CCDError, "teslaServiceDownError"));
LABEL_12:
        v14 = 0LL;
        *a7 = v15;
        goto LABEL_14;
      }

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentOperation enrollmentCompletionBlock](self, "enrollmentCompletionBlock"));

  if (v8)
  {
    if (v7)
    {
      id v12 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v15, 0xCu);
      }
    }

    id v13 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[CCDEnrollmentOperation enrollmentCompletionBlock]( self,  "enrollmentCompletionBlock"));
    ((void (**)(void, BOOL, id, id))v13)[2](v13, v7 == 0LL, v6, v7);
  }

  else
  {
    v14 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No completion block, canceling operation",  (uint8_t *)&v15,  2u);
    }

    -[CCDEnrollmentOperation cancel](self, "cancel");
  }
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0LL;
}

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  return 0LL;
}

- (id)enrollmentCompletionBlock
{
  return *(id *)((char *)&self->super._requestCount + 3);
}

- (void)setEnrollmentCompletionBlock:(id)a3
{
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(int64_t *)((char *)&self->super._httpResponseContentType + 3);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(NSString **)((char *)&self->super._httpResponseContentType + 3) = (NSString *)a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)(&self->_certificateRetrievalFailed + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)certificateRetrievalFailed
{
  return BYTE3(self->super._retryAfterInterval);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  BYTE3(self->super._retryAfterInterval) = a3;
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_enrollmentCompletionBlock + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_enrollmentCompletionBlock + 3) = a3;
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_certificateRetrievalRequestCount + 3);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end