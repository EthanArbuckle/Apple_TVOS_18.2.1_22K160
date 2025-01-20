@interface INAcknowledgeAccountAlertRequest
- (INAcknowledgeAccountAlertRequest)initWithAccount:(id)a3 store:(id)a4;
- (NSData)pushToken;
- (NSDictionary)pushMessageInfo;
- (id)urlRequest;
- (id)urlString;
- (void)setPushMessageInfo:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation INAcknowledgeAccountAlertRequest

- (INAcknowledgeAccountAlertRequest)initWithAccount:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___INAcknowledgeAccountAlertRequest;
  v9 = -[INAcknowledgeAccountAlertRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
  }

  return v10;
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dismissAlertURL]);

  return v3;
}

- (id)urlRequest
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___INAcknowledgeAccountAlertRequest;
  id v3 = -[INAcknowledgeAccountAlertRequest urlRequest](&v23, "urlRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  uint64_t v7 = _INLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100015758(self);
  }

  id v9 = [v5 setHTTPMethod:@"POST"];
  pushMessageInfo = self->_pushMessageInfo;
  if (pushMessageInfo)
  {
    id v22 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  pushMessageInfo,  0LL,  &v22));
    id v12 = v22;
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = _INLogSystem(v12);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000156D4();
      }
    }

    else
    {
      [v5 setHTTPBody:v11];
    }
  }

  uint64_t v16 = _INLogSystem(v9);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10001561C(v5);
  }

  [v5 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData aaf_toHexString](self->_pushToken, "aaf_toHexString"));
  [v5 setValue:v18 forHTTPHeaderField:@"X-APNS-Token"];

  uint64_t v19 = _INLogSystem(objc_msgSend(v5, "aa_addDeviceIDHeader"));
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000155A4(v5);
  }

  objc_msgSend(v5, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  return v5;
}

- (NSDictionary)pushMessageInfo
{
  return self->_pushMessageInfo;
}

- (void)setPushMessageInfo:(id)a3
{
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