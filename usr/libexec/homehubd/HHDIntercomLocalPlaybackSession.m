@interface HHDIntercomLocalPlaybackSession
- (HHDIntercomLocalPlaybackSession)initWithHHEndpoint:(id)a3;
- (HHEndpoint)endpoint;
- (SIBSApplicationForegroundAssertion)foregroundAssertion;
- (void)invalidateAssertion;
- (void)setForegroundAssertion:(id)a3;
@end

@implementation HHDIntercomLocalPlaybackSession

- (HHDIntercomLocalPlaybackSession)initWithHHEndpoint:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HHDIntercomLocalPlaybackSession;
  v7 = -[HHDIntercomLocalPlaybackSession initWithEndpointIdentifier:](&v9, "initWithEndpointIdentifier:", v6);

  if (v7) {
    objc_storeStrong((id *)&v7->_endpoint, a3);
  }

  return v7;
}

- (void)invalidateAssertion
{
  foregroundAssertion = self->_foregroundAssertion;
  if (foregroundAssertion)
  {
    -[SIBSApplicationForegroundAssertion invalidate](foregroundAssertion, "invalidate");
    v4 = self->_foregroundAssertion;
    self->_foregroundAssertion = 0LL;
  }

- (HHEndpoint)endpoint
{
  return self->_endpoint;
}

- (SIBSApplicationForegroundAssertion)foregroundAssertion
{
  return self->_foregroundAssertion;
}

- (void)setForegroundAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end