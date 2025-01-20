@interface EscrowChangeSMSTargetRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (id)validateInput;
@end

@implementation EscrowChangeSMSTargetRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowChangeSMSTargetResponse, a2);
}

- (id)command
{
  return @"ALTER_SMS_TARGET";
}

- (id)validateInput
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___EscrowChangeSMSTargetRequest;
  id v3 = -[EscrowPasswordAuthenticatedRequest validateInput](&v12, "validateInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryDialCode](self, "countryDialCode"));
    if ([v5 length])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));
      id v7 = [v6 length];

      if (v7) {
        return 0LL;
      }
    }

    else
    {
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing parameters"));
    uint64_t v9 = CloudServicesLog(v4);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Missing parameters", v11, 2u);
    }
  }

  return v4;
}

- (id)bodyDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___EscrowChangeSMSTargetRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v12, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryDialCode](self, "countryDialCode"));
  [v4 setObject:v5 forKeyedSubscript:@"countryDialCode"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));
  [v4 setObject:v6 forKeyedSubscript:@"phoneNumber"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryCode](self, "countryCode"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryCode](self, "countryCode"));
    [v4 setObject:v8 forKeyedSubscript:@"countryISOCode"];
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest bypassToken](self, "bypassToken"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest bypassToken](self, "bypassToken"));
    [v4 setObject:v10 forKeyedSubscript:@"phoneNumberToken"];
  }

  return v4;
}

@end