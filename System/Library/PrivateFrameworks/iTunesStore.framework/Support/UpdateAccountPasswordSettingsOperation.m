@interface UpdateAccountPasswordSettingsOperation
+ (int64_t)_accountPasswordSettingValueForServerValue:(id)a3;
- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4;
- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4 requestProperties:(id)a5;
- (id)_newAccountPasswordSettingsDictionary;
- (id)_requestDictionary;
- (id)_serverValueForAccountPasswordSettingValue:(int64_t)a3 defaultValue:(id)a4;
- (int64_t)freeDownloadsPasswordSetting;
- (int64_t)paidPurchasesPasswordSetting;
- (void)run;
@end

@implementation UpdateAccountPasswordSettingsOperation

- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4
{
  return -[UpdateAccountPasswordSettingsOperation initWithFreeDownloadsPasswordSetting:paidPurchasesPasswordSetting:requestProperties:]( self,  "initWithFreeDownloadsPasswordSetting:paidPurchasesPasswordSetting:requestProperties:",  a3,  a4,  0LL);
}

- (UpdateAccountPasswordSettingsOperation)initWithFreeDownloadsPasswordSetting:(int64_t)a3 paidPurchasesPasswordSetting:(int64_t)a4 requestProperties:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UpdateAccountPasswordSettingsOperation;
  v9 = -[UpdateAccountPasswordSettingsOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_freeDownloadsPasswordSetting = a3;
    v9->_paidPurchasesPasswordSetting = a4;
    v11 = (SSMutableURLRequestProperties *)[v8 mutableCopy];
    requestProperties = v10->_requestProperties;
    v10->_requestProperties = v11;
  }

  return v10;
}

- (int64_t)freeDownloadsPasswordSetting
{
  int64_t freeDownloadsPasswordSetting = self->_freeDownloadsPasswordSetting;
  -[UpdateAccountPasswordSettingsOperation unlock](self, "unlock");
  return freeDownloadsPasswordSetting;
}

- (int64_t)paidPurchasesPasswordSetting
{
  int64_t paidPurchasesPasswordSetting = self->_paidPurchasesPasswordSetting;
  -[UpdateAccountPasswordSettingsOperation unlock](self, "unlock");
  return paidPurchasesPasswordSetting;
}

- (void)run
{
  id v16 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v16 setDataProvider:v3];

  [v16 setUseUserSpecificURLBag:1];
  requestProperties = self->_requestProperties;
  if (!requestProperties)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    v6 = self->_requestProperties;
    self->_requestProperties = v5;

    requestProperties = self->_requestProperties;
  }

  -[SSMutableURLRequestProperties setURLBagKey:](requestProperties, "setURLBagKey:", @"update-password-settings");
  -[SSMutableURLRequestProperties setShouldSendSecureToken:](self->_requestProperties, "setShouldSendSecureToken:", 1LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdateAccountPasswordSettingsOperation _requestDictionary](self, "_requestDictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSMutableURLRequestProperties requestParameters](self->_requestProperties, "requestParameters"));
  if ([v8 count])
  {
    id v9 = [v7 mutableCopy];
    [v9 addEntriesFromDictionary:v8];
    id v10 = [v9 copy];

    v7 = v10;
  }

  -[SSMutableURLRequestProperties setHTTPMethod:](self->_requestProperties, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setRequestParameters:](self->_requestProperties, "setRequestParameters:", v7);
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( self->_requestProperties,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  [v16 setRequestProperties:self->_requestProperties];
  if (-[UpdateAccountPasswordSettingsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v16,  0LL))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v16 dataProvider]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 output]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"jingleDocType"]);
    id v14 = [v13 isEqualToString:@"success"];
  }

  else
  {
    id v14 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v16 error]);
  -[UpdateAccountPasswordSettingsOperation setError:](self, "setError:", v15);

  -[UpdateAccountPasswordSettingsOperation setSuccess:](self, "setSuccess:", v14);
}

- (id)_requestDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);

  id v5 = -[UpdateAccountPasswordSettingsOperation _newAccountPasswordSettingsDictionary]( self,  "_newAccountPasswordSettingsDictionary");
  v8[0] = @"guid";
  v8[1] = @"settings";
  v9[0] = v4;
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return v6;
}

- (id)_newAccountPasswordSettingsDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateAccountPasswordSettingsOperation _serverValueForAccountPasswordSettingValue:defaultValue:]( self,  "_serverValueForAccountPasswordSettingValue:defaultValue:",  self->_freeDownloadsPasswordSetting,  @"always"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[UpdateAccountPasswordSettingsOperation _serverValueForAccountPasswordSettingValue:defaultValue:]( self,  "_serverValueForAccountPasswordSettingValue:defaultValue:",  self->_paidPurchasesPasswordSetting,  @"always"));
  v7[0] = @"free";
  v7[1] = @"paid";
  v8[0] = v3;
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

- (id)_serverValueForAccountPasswordSettingValue:(int64_t)a3 defaultValue:(id)a4
{
  id v5 = a4;
  v6 = v5;
  else {
    v7 = off_10034FDF8[a3 - 1];
  }

  return v7;
}

+ (int64_t)_accountPasswordSettingValueForServerValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"always"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"sometimes"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"never"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end