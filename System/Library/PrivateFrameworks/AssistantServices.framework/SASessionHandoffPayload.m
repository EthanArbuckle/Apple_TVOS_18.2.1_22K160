@interface SASessionHandoffPayload
- (void)_ad_setPayloadOnRequestInfo:(id)a3;
@end

@implementation SASessionHandoffPayload

- (void)_ad_setPayloadOnRequestInfo:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SASessionHandoffPayload sessionHandoffData](self, "sessionHandoffData"));
  [v4 setHandoffRequestData:v5];
}

@end