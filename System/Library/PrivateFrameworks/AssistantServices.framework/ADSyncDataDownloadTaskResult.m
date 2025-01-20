@interface ADSyncDataDownloadTaskResult
- (ADSyncDataDownloadTaskResult)initWithState:(int64_t)a3;
- (NSString)serverGeneration;
- (int64_t)batchSize;
- (int64_t)errorCode;
- (int64_t)state;
- (void)setBatchSize:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setServerGeneration:(id)a3;
@end

@implementation ADSyncDataDownloadTaskResult

- (ADSyncDataDownloadTaskResult)initWithState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSyncDataDownloadTaskResult;
  result = -[ADSyncDataDownloadTaskResult init](&v5, "init");
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)serverGeneration
{
  return self->_serverGeneration;
}

- (void)setServerGeneration:(id)a3
{
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
}

@end