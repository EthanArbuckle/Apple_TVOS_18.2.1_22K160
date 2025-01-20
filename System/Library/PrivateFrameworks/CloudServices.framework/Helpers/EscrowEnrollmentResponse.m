@interface EscrowEnrollmentResponse
- (NSString)bypassToken;
@end

@implementation EscrowEnrollmentResponse

- (NSString)bypassToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"phoneNumberToken"]);

  return (NSString *)v3;
}

@end