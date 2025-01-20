@interface ICDCloudServiceCapabilitiesRequestContext
- (id)completionHandler;
- (int64_t)privacyAcknowledgementPolicy;
- (void)setCompletionHandler:(id)a3;
- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3;
@end

@implementation ICDCloudServiceCapabilitiesRequestContext

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (int64_t)privacyAcknowledgementPolicy
{
  return self->_privacyAcknowledgementPolicy;
}

- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3
{
  self->_privacyAcknowledgementPolicy = a3;
}

- (void).cxx_destruct
{
}

@end