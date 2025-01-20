@interface FAUpdateFamilyMemberFlagOperation
- (BOOL)enabled;
- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 accountSigner:(id)a4 memberDSID:(id)a5 flag:(id)a6 enabled:(BOOL)a7;
- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flag:(id)a7 enabled:(BOOL)a8;
- (NSNumber)dsid;
- (NSString)flag;
- (id)_flagKey;
- (id)_flagType;
- (id)accountSigner;
- (id)updateMemberFlag;
- (id)urlByAddingParamsToURL:(id)a3;
- (void)_addBodyToRequest:(id)a3;
- (void)_addHeadersToRequest:(id)a3;
- (void)setAccountSigner:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagOperation

- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flag:(id)a7 enabled:(BOOL)a8
{
  BOOL v8 = a8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000096CC;
  v19[3] = &unk_1000416B0;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v14 = v22;
  id v15 = v21;
  id v16 = v20;
  v17 = -[FAUpdateFamilyMemberFlagOperation initWithNetworkService:accountSigner:memberDSID:flag:enabled:]( self,  "initWithNetworkService:accountSigner:memberDSID:flag:enabled:",  v16,  v19,  a6,  a7,  v8);

  return v17;
}

- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 accountSigner:(id)a4 memberDSID:(id)a5 flag:(id)a6 enabled:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___FAUpdateFamilyMemberFlagOperation;
  id v15 = -[FANetworkClient initWithNetworkService:](&v20, "initWithNetworkService:", a3);
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dsid, a5);
    id v17 = objc_retainBlock(v12);
    id accountSigner = v16->_accountSigner;
    v16->_id accountSigner = v17;

    objc_storeStrong((id *)&v16->_flag, a6);
    v16->_enabled = a7;
  }

  return v16;
}

- (id)updateMemberFlag
{
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 ensureDeviceUnlockedSinceBoot]);
  v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v19 then]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100009A38;
  v25[3] = &unk_100040EA0;
  v25[4] = self;
  uint64_t v4 = ((uint64_t (**)(void, void *))v3)[2](v3, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v18 then]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100009A74;
  v24[3] = &unk_1000416D8;
  v24[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100009AB8;
  v23[3] = &unk_100041700;
  v23[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100009B70;
  v22[3] = &unk_100041358;
  v22[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v22);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v13 then]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100009BC8;
  v21[3] = &unk_100041728;
  v21[4] = self;
  uint64_t v15 = ((uint64_t (**)(void, void *))v14)[2](v14, v21);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)urlByAddingParamsToURL:(id)a3
{
  id v4 = a3;
  v5 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v4,  0LL);

  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_dsid, "stringValue"));
  BOOL v8 = -[NSURLQueryItem initWithName:value:](v6, "initWithName:value:", @"memberId", v7);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyMemberFlagOperation _flagType](self, "_flagType", v8));
  v11 = -[NSURLQueryItem initWithName:value:](v9, "initWithName:value:", @"flagType", v10);
  v18[1] = v11;
  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
  if (self->_enabled) {
    id v13 = @"true";
  }
  else {
    id v13 = @"false";
  }
  id v14 = -[NSURLQueryItem initWithName:value:](v12, "initWithName:value:", @"flagValue", v13);
  v18[2] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  -[NSURLComponents setQueryItems:](v5, "setQueryItems:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v5, "URL"));
  return v16;
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ak_addAnisetteHeaders");
  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
  [v4 setValue:v6 forHTTPHeaderField:@"X-MMe-Language"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 abbreviation]);
  [v4 setValue:v8 forHTTPHeaderField:@"X-MMe-Timezone"];

  uint64_t v9 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyMemberFlagOperation accountSigner](self, "accountSigner"));
  v9[2](v9, v4);
}

- (void)_addBodyToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyMemberFlagOperation _flagKey](self, "_flagKey"));
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    if (self->_enabled) {
      v7 = @"true";
    }
    else {
      v7 = @"false";
    }
    uint64_t v9 = v5;
    v10 = v7;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    objc_msgSend(v4, "aa_setBodyWithParameters:", v8);
  }
}

- (id)_flagType
{
  p_flag = &self->_flag;
  BOOL v3 = -[NSString isEqualToString:](self->_flag, "isEqualToString:", FAMemberFlagScreenTime);
  if (v3) {
    return @"4";
  }
  uint64_t v6 = _FALogSystem(v3, v4);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002A3D4((uint64_t)p_flag, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0LL;
}

- (id)_flagKey
{
  p_flag = &self->_flag;
  BOOL v3 = -[NSString isEqualToString:](self->_flag, "isEqualToString:", FAMemberFlagScreenTime);
  if (v3) {
    return @"screen-time";
  }
  uint64_t v6 = _FALogSystem(v3, v4);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002A3D4((uint64_t)p_flag, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0LL;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)flag
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id)accountSigner
{
  return self->_accountSigner;
}

- (void)setAccountSigner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end