@interface EscrowGetCountrySMSCodesResponse
- (NSDictionary)countrySMSCodes;
@end

@implementation EscrowGetCountrySMSCodesResponse

- (NSDictionary)countrySMSCodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"map"]);

  return (NSDictionary *)v3;
}

@end