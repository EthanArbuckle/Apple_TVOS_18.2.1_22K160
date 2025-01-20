@interface AMSDUpdateDeviceLanguageTask
- (id)_updateLanguageForAccount:(id)a3 mediaType:(id)a4;
- (id)perform;
@end

@implementation AMSDUpdateDeviceLanguageTask

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004644C;
  v3[3] = &unk_1000D5C50;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDUpdateDeviceLanguageTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (id)_updateLanguageForAccount:(id)a3 mediaType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDBag bagForMediaType:](&OBJC_CLASS___AMSDBag, "bagForMediaType:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_storefrontForMediaType:", v6));
  id v9 = [v8 length];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
    [v10 setAccountMediaType:v6];
    id v11 = [[AMSURLRequestEncoder alloc] initWithBag:v7];
    id v12 = [v11 setAccount:v5];
    uint64_t v14 = AMSLogKey(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v11 setLogUUID:v15];

    [v11 setClientInfo:v10];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 URLForKey:@"change-language"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 requestWithMethod:2 bagURL:v16 parameters:0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 thenWithBlock:&stru_1000D7F90]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100046CC4;
    v22[3] = &unk_1000D7FB8;
    v19 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
    v23 = v19;
    [v18 addFinishBlock:v22];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The device is missing a storefront for the specified media type. mediaType = %@",  v6));
    uint64_t v20 = AMSError(2LL, @"Missing Storefront", v10, 0LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v20);
    v19 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue( +[AMSBinaryPromise promiseWithError:]( &OBJC_CLASS___AMSBinaryPromise,  "promiseWithError:",  v11));
  }

  return v19;
}

@end