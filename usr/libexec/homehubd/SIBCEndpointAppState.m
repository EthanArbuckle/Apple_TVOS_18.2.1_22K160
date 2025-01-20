@interface SIBCEndpointAppState
- (id)hhd_bridgedAppState;
@end

@implementation SIBCEndpointAppState

- (id)hhd_bridgedAppState
{
  id v3 = objc_alloc(&OBJC_CLASS___HHEndpointAppState);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SIBCEndpointAppState endpointId](self, "endpointId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SIBCEndpointAppState appId](self, "appId"));
  id v6 = [v3 initWithEndpointId:v4 activeAppId:v5];

  return v6;
}

@end