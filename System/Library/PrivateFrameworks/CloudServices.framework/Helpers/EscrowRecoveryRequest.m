@interface EscrowRecoveryRequest
- (Class)responseClass;
- (id)additionalHeaders;
- (id)bodyDictionary;
- (id)command;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowRecoveryRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowRecoveryResponse, a2);
}

- (id)command
{
  return @"RECOVER";
}

- (id)additionalHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___EscrowRecoveryRequest;
  id v3 = -[EscrowGenericRequest additionalHeaders](&v7, "additionalHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  if (-[EscrowGenericRequest duplicate](self, "duplicate")
    || -[EscrowGenericRequest silentDoubleRecovery](self, "silentDoubleRecovery"))
  {
    [v5 setObject:@"true" forKeyedSubscript:@"X-Apple-Cyrus-Silent-Recovery"];
  }

  return v5;
}

- (id)bodyDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___EscrowRecoveryRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v10, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);

  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"blob"];
  }
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest challengeCode](self, "challengeCode"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest challengeCode](self, "challengeCode"));
    [v4 setObject:v8 forKeyedSubscript:@"smsChallengeCode"];
  }

  if (-[EscrowGenericRequest silentAttempt](self, "silentAttempt")) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"silentAttempt"];
  }

  return v4;
}

@end