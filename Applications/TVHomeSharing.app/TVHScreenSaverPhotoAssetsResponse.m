@interface TVHScreenSaverPhotoAssetsResponse
- (BOOL)finishedRequest;
- (NSArray)photoAssets;
- (NSError)error;
- (TVHScreenSaverPhotoAssetsResponse)init;
- (unint64_t)responseCount;
- (void)setError:(id)a3;
- (void)setFinishedRequest:(BOOL)a3;
- (void)setPhotoAssets:(id)a3;
- (void)setResponseCount:(unint64_t)a3;
@end

@implementation TVHScreenSaverPhotoAssetsResponse

- (TVHScreenSaverPhotoAssetsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPhotoAssetsResponse;
  v2 = -[TVHScreenSaverPhotoAssetsResponse init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_finishedRequest = 1;
    photoAssets = v2->_photoAssets;
    v2->_responseCount = 1LL;
    v2->_photoAssets = (NSArray *)&__NSArray0__struct;
  }

  return v3;
}

- (unint64_t)responseCount
{
  return self->_responseCount;
}

- (void)setResponseCount:(unint64_t)a3
{
  self->_responseCount = a3;
}

- (BOOL)finishedRequest
{
  return self->_finishedRequest;
}

- (void)setFinishedRequest:(BOOL)a3
{
  self->_finishedRequest = a3;
}

- (NSArray)photoAssets
{
  return self->_photoAssets;
}

- (void)setPhotoAssets:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end