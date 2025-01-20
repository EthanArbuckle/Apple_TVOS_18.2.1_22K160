@interface FAUpdateFamilyMemberFlagsOperation
- (FAUpdateFamilyMemberFlagsOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flags:(id)a7;
- (NSDictionary)flags;
- (NSNumber)dsid;
- (id)updateMemberFlags;
- (void)_addBodyToRequest:(id)a3;
- (void)_addHeadersToRequest:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagsOperation

- (FAUpdateFamilyMemberFlagsOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flags:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___FAUpdateFamilyMemberFlagsOperation;
  v17 = -[FANetworkClient initWithNetworkService:](&v20, "initWithNetworkService:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dsid, a6);
    objc_storeStrong((id *)&v18->_flags, a7);
    objc_storeStrong((id *)&v18->_grandSlamSigner, a4);
    objc_storeStrong((id *)&v18->_familyGrandSlamSigner, a5);
  }

  return v18;
}

- (id)updateMemberFlags
{
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 ensureDeviceUnlockedSinceBoot]);
  v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v19 then]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000F124;
  v25[3] = &unk_100040EA0;
  v25[4] = self;
  uint64_t v4 = ((uint64_t (**)(void, void *))v3)[2](v3, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v18 then]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000F160;
  v24[3] = &unk_1000416D8;
  v24[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000F1A4;
  v23[3] = &unk_100041700;
  v23[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000F204;
  v22[3] = &unk_100041358;
  v22[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v22);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v13 then]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000F25C;
  v21[3] = &unk_100041A18;
  v21[4] = self;
  uint64_t v15 = ((uint64_t (**)(void, void *))v14)[2](v14, v21);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (void)_addHeadersToRequest:(id)a3
{
  id v12 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
  objc_msgSend(v12, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
  objc_msgSend(v12, "aa_addLoggedInAppleIDHeaderWithAccount:", v7);

  objc_msgSend(v12, "ak_addAnisetteHeaders");
  objc_msgSend(v12, "ak_addClientInfoHeader");
  objc_msgSend(v12, "ak_addDeviceUDIDHeader");
  objc_msgSend(v12, "ak_addInternalBuildHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
  [v12 setValue:v9 forHTTPHeaderField:@"X-MMe-Language"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 abbreviation]);
  [v12 setValue:v11 forHTTPHeaderField:@"X-MMe-Timezone"];

  [v12 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  -[AAGrandSlamSigner signURLRequest:](self->_grandSlamSigner, "signURLRequest:", v12);
  -[AAGrandSlamSigner signURLRequest:](self->_familyGrandSlamSigner, "signURLRequest:", v12);
}

- (void)_addBodyToRequest:(id)a3
{
  id v12 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_flags, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  if ([v4 count])
  {
    unint64_t v6 = 0LL;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v6]);
      v15[1] = @"flagValue";
      v16[0] = v7;
      v15[0] = @"flagName";
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_flags, "objectForKeyedSubscript:", v7));
      v16[1] = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
      [v5 setObject:v9 atIndexedSubscript:v6];

      ++v6;
    }

    while ((unint64_t)[v4 count] > v6);
  }

  dsid = self->_dsid;
  v13[0] = @"memberDSID";
  v13[1] = @"memberFlags";
  v14[0] = dsid;
  v14[1] = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  objc_msgSend(v12, "aa_setBodyWithParameters:", v11);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDictionary)flags
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end