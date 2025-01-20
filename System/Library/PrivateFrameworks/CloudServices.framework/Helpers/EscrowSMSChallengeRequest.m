@interface EscrowSMSChallengeRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
@end

@implementation EscrowSMSChallengeRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowSMSChallengeResponse, a2);
}

- (id)command
{
  return @"GENERATE_SMS_CHALLENGE";
}

- (id)bodyDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___EscrowSMSChallengeRequest;
  id v2 = -[EscrowGenericRequest bodyDictionary](&v5, "bodyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 setObject:@"com.apple.securebackup.record" forKeyedSubscript:@"label"];
  return v3;
}

@end