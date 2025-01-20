@interface SANPAddOutputDevicesToGroupResponse
- (int64_t)resultCallbackCode;
@end

@implementation SANPAddOutputDevicesToGroupResponse

- (int64_t)resultCallbackCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SANPAddOutputDevicesToGroupResponse routeResponse](self, "routeResponse"));
  int64_t v3 = [v2 isEqualToString:SAMPRemoteCommandOutcomeSUCCESSValue] - 1;

  return v3;
}

@end