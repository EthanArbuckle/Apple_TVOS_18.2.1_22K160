@interface RestoreDownloadItemsResponse
- (NSArray)requestItems;
- (StoreDownloadQueueResponse)serverResponse;
- (void)dealloc;
- (void)setRequestItems:(id)a3;
- (void)setServerResponse:(id)a3;
- (void)setServerResponseWithError:(id)a3;
@end

@implementation RestoreDownloadItemsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RestoreDownloadItemsResponse;
  -[RestoreDownloadItemsResponse dealloc](&v3, "dealloc");
}

- (void)setServerResponseWithError:(id)a3
{
  self->_serverResponse = -[StoreDownloadQueueResponse initWithError:userIdentifier:]( objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse),  "initWithError:userIdentifier:",  a3,  0LL);
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (StoreDownloadQueueResponse)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

@end