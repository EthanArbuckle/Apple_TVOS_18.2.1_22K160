@interface EscrowLogRecoveryRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
@end

@implementation EscrowLogRecoveryRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowLogRecoveryResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"/escrowproxy/api/recovery_log"]);

  return v3;
}

- (id)command
{
  return @"RECOVERYLOG";
}

- (id)bodyDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___EscrowLogRecoveryRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v9, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recoveryUUID](self, "recoveryUUID"));
  [v4 setObject:v5 forKeyedSubscript:@"recovery_uuid"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest doubleRecoveryUUID](self, "doubleRecoveryUUID"));
  [v4 setObject:v6 forKeyedSubscript:@"double_recovery_uuid"];

  if (-[EscrowGenericRequest recoveryResult](self, "recoveryResult")) {
    v7 = &__kCFBooleanTrue;
  }
  else {
    v7 = &__kCFBooleanFalse;
  }
  [v4 setObject:v7 forKeyedSubscript:@"recovery_result"];
  return v4;
}

@end