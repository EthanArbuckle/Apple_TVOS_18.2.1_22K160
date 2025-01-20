@interface INRequest
- (AADeviceInfo)deviceInfoProvider;
- (ACAccount)account;
- (INRequest)initWithAccount:(id)a3 pushToken:(id)a4;
- (NSDictionary)parameters;
- (id)_basicBodyParameters;
- (id)addBodyParameters:(id)a3;
- (id)urlRequest;
@end

@implementation INRequest

- (INRequest)initWithAccount:(id)a3 pushToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v19 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_authTokenWithError:", &v19));
  id v10 = v19;
  v11 = v10;
  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___INRequest;
    v12 = -[INRequest init](&v18, "init");
    v13 = (id *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_account, a3);
      objc_storeStrong(v13 + 2, a4);
    }

    self = v13;
    v14 = self;
  }

  else
  {
    uint64_t v15 = _INLogSystem(v10);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100016D8C();
    }

    v14 = 0LL;
  }

  return v14;
}

- (id)_basicBodyParameters
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  else {
    v4 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"isPrimaryAccount");
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  pushToken = self->_pushToken;
  if (pushToken)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSData aaf_toHexString](pushToken, "aaf_toHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"pushToken");
  }

  else
  {
    uint64_t v8 = _INLogSystem(0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100016E38(v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount aa_personID](self->_account, "aa_personID"));
  if (v16)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, @"dsid");
  }

  else
  {
    uint64_t v17 = _INLogSystem(0LL);
    objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100016E08(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount username](self->_account, "username"));
  if (v26) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, @"appleId");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 udid]);

  if (v28) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v28, @"udid");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 serialNumber]);

  if (v30) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v30, @"serialNumber");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"deviceInfo");

  return v3;
}

- (AADeviceInfo)deviceInfoProvider
{
  deviceInfoProvider = self->_deviceInfoProvider;
  if (!deviceInfoProvider)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AADeviceInfo);
    v5 = self->_deviceInfoProvider;
    self->_deviceInfoProvider = v4;

    deviceInfoProvider = self->_deviceInfoProvider;
  }

  return deviceInfoProvider;
}

- (NSDictionary)parameters
{
  parameters = self->_parameters;
  if (!parameters)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest _basicBodyParameters](self, "_basicBodyParameters"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[INRequest addBodyParameters:](self, "addBodyParameters:", v4));
    v6 = self->_parameters;
    self->_parameters = v5;

    parameters = self->_parameters;
  }

  return parameters;
}

- (id)addBodyParameters:(id)a3
{
  return a3;
}

- (id)urlRequest
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[INRequest parameters](self, "parameters"));
  v4 = (void *)v3;
  if (v3 && self->_account)
  {
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___INRequest;
    id v5 = -[INRequest urlRequest](&v34, "urlRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = [v6 mutableCopy];

    uint64_t v9 = _INLogSystem(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10001706C(self, v10);
    }

    [v7 setHTTPMethod:@"POST"];
    id v33 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  &v33));
    id v12 = v33;
    uint64_t v13 = v12;
    if (v11)
    {
      [v7 setHTTPBody:v11];
      uint64_t v14 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v11, 4LL);
      uint64_t v15 = _INLogSystem(v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100017008();
      }

      objc_msgSend(v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
      [v7 addValue:@"Settings/1.0 CFNetwork/672.1.10 Darwin/14.0.0" forHTTPHeaderField:@"User-Agent"];
      [v7 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
      [v7 addValue:@"en-us" forHTTPHeaderField:@"Accept-Language"];
      uint64_t v17 = _INLogSystem(objc_msgSend(v7, "aa_addMultiUserDeviceHeaderIfEnabled"));
      objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100016FCC(v18);
      }

      dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AAAbsintheSigner sharedSigner](&OBJC_CLASS___AAAbsintheSigner, "sharedSigner"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10000DC50;
      v30[3] = &unk_1000250F0;
      id v21 = v7;
      id v31 = v21;
      uint64_t v22 = v19;
      v32 = v22;
      [v20 signatureForData:v11 completion:v30];

      uint64_t v23 = dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v24 = _INLogSystem(v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100016F4C(v21, v25);
      }

      id v26 = v21;
    }

    else
    {
      uint64_t v28 = _INLogSystem(v12);
      uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100016EE8();
      }
      id v26 = 0LL;
    }
  }

  else
  {
    uint64_t v27 = _INLogSystem(v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100016E68(self, (os_log_s *)v7);
    }
    id v26 = 0LL;
  }

  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end