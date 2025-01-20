@interface LogoutOperation
- (LogoutOperation)initWithAccount:(id)a3;
- (SSAccount)account;
- (id)_copyAuthenticationContext;
- (id)_sbsyncData;
- (void)_disableAutomaticDownloadKinds;
- (void)_disableBookkeeper;
- (void)_sendLogoutRequest;
- (void)run;
@end

@implementation LogoutOperation

- (LogoutOperation)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LogoutOperation;
  v6 = -[LogoutOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (SSAccount)account
{
  v3 = self->_account;
  -[LogoutOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
}

- (id)_copyAuthenticationContext
{
  v3 = objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LogoutOperation account](self, "account"));
  id v5 = -[SSMutableAuthenticationContext initWithAccount:](v3, "initWithAccount:", v4);

  -[SSMutableAuthenticationContext setPromptStyle:](v5, "setPromptStyle:", 1000LL);
  return v5;
}

- (void)_disableAutomaticDownloadKinds
{
  v4 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:]( objc_alloc(&OBJC_CLASS___SetAutomaticDownloadKindsOperation),  "initWithDownloadKinds:",  0LL);
  -[SetAutomaticDownloadKindsOperation setShouldSuppressServerDialogs:](v4, "setShouldSuppressServerDialogs:", 1LL);
  id v3 = -[LogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  -[SetAutomaticDownloadKindsOperation setAuthenticationContext:](v4, "setAuthenticationContext:", v3);
  -[LogoutOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v4, 0LL);
}

- (void)_disableBookkeeper
{
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LogoutOperation account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v19 setUserIdentifier:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[LogoutOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v19,  0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"push-notification-types"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"add-push-notification-type-url"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
      [v10 setDataProvider:v11];

      id v12 = -[LogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
      [v10 setAuthenticationContext:v12];
      v13 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
      -[SSMutableURLRequestProperties setHTTPMethod:](v13, "setHTTPMethod:", @"POST");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
      -[SSMutableURLRequestProperties setURL:](v13, "setURL:", v14);

      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v13,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 guid]);

      if (v17) {
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v17, @"guid");
      }
      v18 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"0",  @"bookkeeperDomain:com.apple.upp",  0LL);
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v18, @"put-parameters");
      -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  @"mzbookkeeper",  @"notification-type");

      -[SSMutableURLRequestProperties setRequestParameters:](v13, "setRequestParameters:", v15);
      [v10 setRequestProperties:v13];
      -[LogoutOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v10, 0LL);
    }
  }
}

- (id)_sbsyncData
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v13 = 0LL;
  sub_1001A9B64(-1LL, (uint64_t)&v15, (uint64_t)&v13 + 4, (uint64_t)&v14, (uint64_t)&v13);
  id v3 = 0LL;
  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LogoutOperation account](self, "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    id v7 = [v6 unsignedLongLongValue];

    v8 = objc_alloc_init(&OBJC_CLASS___SSVFairPlaySubscriptionController);
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSData);
    id v10 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v9,  "initWithBytesNoCopy:length:freeWhenDone:",  v15,  HIDWORD(v13),  0LL);
    id v12 = 0LL;
    -[SSVFairPlaySubscriptionController generateSubscriptionBagRequestWithAccountUniqueIdentifier:transactionType:machineIDData:returningSubscriptionBagData:error:]( v8,  "generateSubscriptionBagRequestWithAccountUniqueIdentifier:transactionType:machineIDData:returningSubscriptionBagData:error:",  v7,  303LL,  v10,  &v12,  0LL);
    id v3 = v12;
  }

  if (v15) {
    sub_10019C12C(v15);
  }
  if (v14) {
    sub_10019C12C(v14);
  }
  return v3;
}

- (void)_sendLogoutRequest
{
  id v17 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v17 setDataProvider:v3];

  [v17 setUseUserSpecificURLBag:1];
  id v4 = -[LogoutOperation _copyAuthenticationContext](self, "_copyAuthenticationContext");
  [v17 setAuthenticationContext:v4];
  id v5 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);

  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, @"guid");
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[LogoutOperation _sbsyncData](self, "_sbsyncData"));
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v9, @"sbsync");
  }
  if (-[NSMutableDictionary count](v6, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  100LL,  0LL,  0LL));
    -[SSMutableURLRequestProperties setHTTPBody:](v5, "setHTTPBody:", v10);
    -[SSMutableURLRequestProperties setHTTPMethod:](v5, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v5,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  }

  -[SSMutableURLRequestProperties setURLBagKey:](v5, "setURLBagKey:", @"logout");

  [v17 setRequestProperties:v5];
  -[LogoutOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v17, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v17 dataProvider]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 output]);

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    uint64_t v14 = SSVSubscriptionBagForDictionary(v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___SSVFairPlaySubscriptionController);
      -[SSVFairPlaySubscriptionController importSubscriptionKeyBagData:returningError:]( v16,  "importSubscriptionKeyBagData:returningError:",  v15,  0LL);
    }
  }
}

- (void).cxx_destruct
{
}

@end