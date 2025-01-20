@interface SAURIHandoffPayload
- (void)_ad_setPayloadOnRequestInfo:(id)a3;
@end

@implementation SAURIHandoffPayload

- (void)_ad_setPayloadOnRequestInfo:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SAURIHandoffPayload link](self, "link"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
  [v4 setHandoffURLString:v5];
}

@end