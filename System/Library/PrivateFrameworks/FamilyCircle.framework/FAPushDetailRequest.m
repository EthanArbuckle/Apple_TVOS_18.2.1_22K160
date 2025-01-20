@interface FAPushDetailRequest
+ (Class)responseClass;
- (NSDictionary)pushPayload;
- (id)urlRequest;
- (id)urlString;
- (void)setPushPayload:(id)a3;
@end

@implementation FAPushDetailRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___FAPushDetailResponse);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getFamilyPushDetailsURL]);

  return v3;
}

- (id)urlRequest
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FAPushDetailRequest;
  id v3 = -[FAPushDetailRequest urlRequest](&v15, "urlRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  [v5 setHTTPMethod:@"POST"];
  id v6 = -[NSDictionary mutableCopy](self->_pushPayload, "mutableCopy");
  [v6 removeObjectForKey:@"aps"];
  id v14 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v6,  0LL,  &v14));
  id v8 = v14;
  v10 = v8;
  if (v8)
  {
    uint64_t v11 = _FALogSystem(v8, v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002A440((uint64_t)v10, (uint64_t)v6, v12);
    }
  }

  else
  {
    [v5 setHTTPBody:v7];
  }

  [v5 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  return v5;
}

- (NSDictionary)pushPayload
{
  return self->_pushPayload;
}

- (void)setPushPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end