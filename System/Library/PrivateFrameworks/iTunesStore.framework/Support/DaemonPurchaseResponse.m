@interface DaemonPurchaseResponse
- (StoreDownloadQueueResponse)decodedResponse;
- (void)dealloc;
- (void)setDecodedResponse:(id)a3;
@end

@implementation DaemonPurchaseResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DaemonPurchaseResponse;
  -[DaemonPurchaseResponse dealloc](&v3, "dealloc");
}

- (StoreDownloadQueueResponse)decodedResponse
{
  return self->_decodedResponse;
}

- (void)setDecodedResponse:(id)a3
{
}

@end