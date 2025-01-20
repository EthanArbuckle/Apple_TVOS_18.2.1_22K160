@interface INAccountEventDetailsRequest
+ (Class)responseClass;
- (INAccountEventDetailsRequest)initWithAccount:(id)a3 pushMessage:(id)a4;
- (NSData)pushToken;
- (id)urlRequest;
- (id)urlString;
- (void)setPushToken:(id)a3;
@end

@implementation INAccountEventDetailsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___INAccountEventDetailsResponse, a2);
}

- (INAccountEventDetailsRequest)initWithAccount:(id)a3 pushMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___INAccountEventDetailsRequest;
  v9 = -[INAccountEventDetailsRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_pushMessage, a4);
  }

  return v10;
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getAccountEventDetailsURL]);

  return v3;
}

- (id)urlRequest
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___INAccountEventDetailsRequest;
  id v3 = -[INAccountEventDetailsRequest urlRequest](&v24, "urlRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  uint64_t v7 = _INLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100015758(self);
  }

  [v5 setHTTPMethod:@"POST"];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSMessage userInfo](self->_pushMessage, "userInfo"));
  id v10 = [v9 mutableCopy];

  [v10 removeObjectForKey:@"aps"];
  id v23 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  &v23));
  id v12 = v23;
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = _INLogSystem(v12);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100015F54();
    }
  }

  else
  {
    id v16 = [v5 setHTTPBody:v11];
  }

  uint64_t v17 = _INLogSystem(v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10001561C(v5);
  }

  [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSData aaf_toHexString](self->_pushToken, "aaf_toHexString"));
  [v5 setValue:v19 forHTTPHeaderField:@"X-APNS-Token"];

  uint64_t v20 = _INLogSystem(objc_msgSend(v5, "aa_addDeviceIDHeader"));
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000155A4(v5);
  }

  objc_msgSend(v5, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  return v5;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end