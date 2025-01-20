@interface MRPlayerPath
- (BOOL)tvm_isAirplayReceiver;
@end

@implementation MRPlayerPath

- (BOOL)tvm_isAirplayReceiver
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  if ([v4 isEqualToString:@"airtunesd"])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self, "client"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    unsigned __int8 v5 = [v7 isEqualToString:@"com.apple.TVAirPlay"];
  }

  return v5;
}

@end