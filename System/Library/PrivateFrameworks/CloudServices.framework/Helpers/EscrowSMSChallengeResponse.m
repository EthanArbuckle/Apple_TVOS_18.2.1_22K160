@interface EscrowSMSChallengeResponse
- (NSNumber)smsVerificationCodeLength;
@end

@implementation EscrowSMSChallengeResponse

- (NSNumber)smsVerificationCodeLength
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"smsChallengeLength"]);

  return (NSNumber *)v3;
}

@end