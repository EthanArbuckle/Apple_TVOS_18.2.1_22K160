@interface MSDS3UploadRequest
- (MSDS3UploadRequest)init;
- (NSDictionary)httpHeaders;
- (NSString)logFilePath;
- (NSString)s3url;
- (int64_t)retryAttempts;
- (void)setHttpHeaders:(id)a3;
- (void)setLogFilePath:(id)a3;
- (void)setRetryAttempts:(int64_t)a3;
- (void)setS3url:(id)a3;
@end

@implementation MSDS3UploadRequest

- (MSDS3UploadRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDS3UploadRequest;
  v2 = -[MSDS3UploadRequest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDS3UploadRequest setS3url:](v2, "setS3url:", 0LL);
    -[MSDS3UploadRequest setLogFilePath:](v3, "setLogFilePath:", 0LL);
    -[MSDS3UploadRequest setHttpHeaders:](v3, "setHttpHeaders:", 0LL);
    -[MSDS3UploadRequest setRetryAttempts:](v3, "setRetryAttempts:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (NSString)s3url
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setS3url:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSString)logFilePath
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLogFilePath:(id)a3
{
}

- (int64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(int64_t)a3
{
  self->_retryAttempts = a3;
}

- (void).cxx_destruct
{
}

@end