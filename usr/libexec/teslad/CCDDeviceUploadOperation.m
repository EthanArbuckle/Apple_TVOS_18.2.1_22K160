@interface CCDDeviceUploadOperation
- (BOOL)operationExecuting;
- (BOOL)operationFinished;
- (NSError)error;
- (NSMutableData)responseData;
- (NSURLSession)urlSession;
- (id)deviceUploadCompletionBlock;
- (void)completeOperationWithResponse:(id)a3 error:(id)a4;
- (void)setDeviceUploadCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setOperationFinished:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation CCDDeviceUploadOperation

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadOperation deviceUploadCompletionBlock](self, "deviceUploadCompletionBlock"));

  if (v8)
  {
    if (v7)
    {
      v12 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v15, 0xCu);
      }
    }

    v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[CCDDeviceUploadOperation deviceUploadCompletionBlock]( self,  "deviceUploadCompletionBlock"));
    ((void (**)(void, id, id))v13)[2](v13, v6, v7);
  }

  else
  {
    v14 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No completion block, canceling operation",  (uint8_t *)&v15,  2u);
    }

    -[CCDDeviceUploadOperation cancel](self, "cancel");
  }
}

- (id)deviceUploadCompletionBlock
{
  return *(id *)((char *)&self->super._requestCount + 3);
}

- (void)setDeviceUploadCompletionBlock:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)((char *)&self->super._httpResponseContentType + 3);
}

- (void)setError:(id)a3
{
}

- (BOOL)operationExecuting
{
  return BYTE3(self->super._retryAfterInterval);
}

- (void)setOperationExecuting:(BOOL)a3
{
  BYTE3(self->super._retryAfterInterval) = a3;
}

- (BOOL)operationFinished
{
  return BYTE4(self->super._retryAfterInterval);
}

- (void)setOperationFinished:(BOOL)a3
{
  BYTE4(self->super._retryAfterInterval) = a3;
}

- (NSMutableData)responseData
{
  return *(NSMutableData **)(&self->_operationFinished + 2);
}

- (void)setResponseData:(id)a3
{
}

- (NSURLSession)urlSession
{
  return *(NSURLSession **)((char *)&self->_deviceUploadCompletionBlock + 3);
}

- (void)setUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end