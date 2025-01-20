@interface MRRouteBannerRequestQueueItem
- (MRRouteBannerRequest)request;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation MRRouteBannerRequestQueueItem

- (MRRouteBannerRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end