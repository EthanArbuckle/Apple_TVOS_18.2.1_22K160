@interface EscrowSRPRequest
- (Class)responseClass;
- (id)additionalHeaders;
- (id)bodyDictionary;
- (id)command;
- (id)validateInput;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowSRPRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (id)validateInput
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___EscrowSRPRequest;
  id v3 = -[EscrowGenericRequest validateInput](&v10, "validateInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));
    id v6 = [v5 length];

    if (v6) {
      return 0LL;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing DSID"));
    uint64_t v8 = CloudServicesLog(v4);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044BA0();
    }
  }

  return v4;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowSRPResponse, a2);
}

- (id)command
{
  return @"SRP_INIT";
}

- (id)additionalHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___EscrowSRPRequest;
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
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___EscrowSRPRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v12, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);

  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"blob"];
  }
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest bypassToken](self, "bypassToken"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest bypassToken](self, "bypassToken"));
    [v4 setObject:v8 forKeyedSubscript:@"phoneNumberToken"];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest challengeCode](self, "challengeCode"));

  if (v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest challengeCode](self, "challengeCode"));
    [v4 setObject:v10 forKeyedSubscript:@"smsChallengeCode"];
  }

  if (-[EscrowGenericRequest silentAttempt](self, "silentAttempt")) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"silentAttempt"];
  }

  return v4;
}

@end