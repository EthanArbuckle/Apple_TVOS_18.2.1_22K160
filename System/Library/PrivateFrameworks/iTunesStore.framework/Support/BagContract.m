@interface BagContract
- (AMSBagValue)accountFlagsURL;
- (AMSBagValue)appleMusicDeviceOfferDeepLink;
- (AMSBagValue)iCloudDeviceOfferDeepLink;
- (AMSBagValue)trustedDomains;
- (id)_bagWithError:(id *)a3;
@end

@implementation BagContract

- (AMSBagValue)accountFlagsURL
{
  id v9 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BagContract _bagWithError:](self, "_bagWithError:", &v9));
  id v3 = v9;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"account-flags"]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue frozenBagValueWithKey:value:valueType:]( &OBJC_CLASS___AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"account-flags",  v4,  5LL));
  }

  else
  {
    uint64_t v6 = AMSError(0LL, 0LL, 0LL, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"account-flags",  5LL,  v4));
  }

  v7 = (void *)v5;

  return (AMSBagValue *)v7;
}

- (AMSBagValue)trustedDomains
{
  id v9 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BagContract _bagWithError:](self, "_bagWithError:", &v9));
  id v3 = v9;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"trustedDomains"]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue frozenBagValueWithKey:value:valueType:]( &OBJC_CLASS___AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"trustedDomains",  v4,  0LL));
  }

  else
  {
    uint64_t v6 = AMSError(0LL, 0LL, 0LL, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"trustedDomains",  0LL,  v4));
  }

  v7 = (void *)v5;

  return (AMSBagValue *)v7;
}

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  id v9 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BagContract _bagWithError:](self, "_bagWithError:", &v9));
  id v3 = v9;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"appleMusicDeviceOfferDeepLink"]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue frozenBagValueWithKey:value:valueType:]( &OBJC_CLASS___AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"appleMusicDeviceOfferDeepLink",  v4,  5LL));
  }

  else
  {
    uint64_t v6 = AMSError(0LL, 0LL, 0LL, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"appleMusicDeviceOfferDeepLink",  5LL,  v4));
  }

  v7 = (void *)v5;

  return (AMSBagValue *)v7;
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  id v9 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BagContract _bagWithError:](self, "_bagWithError:", &v9));
  id v3 = v9;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"iCloudDeviceOfferDeepLink"]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue frozenBagValueWithKey:value:valueType:]( &OBJC_CLASS___AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"iCloudDeviceOfferDeepLink",  v4,  5LL));
  }

  else
  {
    uint64_t v6 = AMSError(0LL, 0LL, 0LL, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"iCloudDeviceOfferDeepLink",  5LL,  v4));
  }

  v7 = (void *)v5;

  return (AMSBagValue *)v7;
}

- (id)_bagWithError:(id *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  uint64_t v6 = -[ISLoadURLBagOperation initWithBagContext:](v4, "initWithBagContext:", v5);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007B574;
  v14[3] = &unk_10034AC30;
  v7 = dispatch_semaphore_create(0LL);
  v15 = v7;
  -[ISLoadURLBagOperation setCompletionBlock:](v6, "setCompletionBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v8 addOperation:v6];

  dispatch_time_t v9 = dispatch_time(0LL, 60000000000LL);
  uint64_t v10 = dispatch_semaphore_wait(v7, v9);
  if (a3 && v10)
  {
    uint64_t v11 = AMSError(1LL, 0LL, 0LL, 0LL);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v6, "URLBag"));

  return v12;
}

@end