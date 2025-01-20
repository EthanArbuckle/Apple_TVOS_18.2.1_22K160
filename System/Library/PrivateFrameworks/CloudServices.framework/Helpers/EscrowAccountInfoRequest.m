@interface EscrowAccountInfoRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowAccountInfoRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowAccountInfoResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"/escrowproxy/api/get_records"]);

  return v3;
}

- (id)command
{
  return @"GETRECORDS";
}

- (id)bodyDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___EscrowAccountInfoRequest;
  id v2 = -[EscrowGenericRequest bodyDictionary](&v5, "bodyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 setObject:@"com.apple.securebackup.record" forKeyedSubscript:@"label"];
  return v3;
}

- (void)performRequestWithHandler:(id)a3
{
}

@end