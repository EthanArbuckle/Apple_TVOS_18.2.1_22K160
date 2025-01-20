@interface MessageAttachmentSingleStatus
- (NSError)transferError;
- (NSString)additionalErrorInfo;
- (NSString)errorURLString;
- (int64_t)errorFileSize;
- (void)setAdditionalErrorInfo:(id)a3;
- (void)setErrorFileSize:(int64_t)a3;
- (void)setErrorURLString:(id)a3;
- (void)setTransferError:(id)a3;
@end

@implementation MessageAttachmentSingleStatus

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTransferError:(id)a3
{
}

- (NSString)additionalErrorInfo
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAdditionalErrorInfo:(id)a3
{
}

- (NSString)errorURLString
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setErrorURLString:(id)a3
{
}

- (int64_t)errorFileSize
{
  return self->_errorFileSize;
}

- (void)setErrorFileSize:(int64_t)a3
{
  self->_errorFileSize = a3;
}

- (void).cxx_destruct
{
}

@end