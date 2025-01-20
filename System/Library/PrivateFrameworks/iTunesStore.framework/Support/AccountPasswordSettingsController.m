@interface AccountPasswordSettingsController
+ (void)observeXPCServer:(id)a3;
+ (void)updateAccountPasswordSettings:(id)a3 connection:(id)a4;
@end

@implementation AccountPasswordSettingsController

+ (void)observeXPCServer:(id)a3
{
}

+ (void)updateAccountPasswordSettings:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(v7, kSSITunesStoreEntitlementAccounts) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v8 takeKeepAliveAssertion:@"com.apple.itunesstored.AccountPasswordSettings"];

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    xpc_object_t reply = (xpc_object_t)SSXPCDictionaryCopyCFObjectWithClass(v6, "1", v9);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v12 = (void *)SSXPCDictionaryCopyCFObjectWithClass(v6, "2", v11);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v14 = (void *)SSXPCDictionaryCopyCFObjectWithClass(v6, "3", v13);
    xpc_object_t value = xpc_dictionary_get_value(v6, "4");
    v16 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (reply)
    {
      v22 = v12;
      id v17 = [v12 integerValue];
      id v18 = [v14 integerValue];
      v21 = -[SSURLRequestProperties initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSURLRequestProperties),  "initWithXPCEncoding:",  v16);
      v19 = -[UpdateAccountPasswordSettingsOperation initWithFreeDownloadsPasswordSetting:paidPurchasesPasswordSetting:requestProperties:]( objc_alloc(&OBJC_CLASS___UpdateAccountPasswordSettingsOperation),  "initWithFreeDownloadsPasswordSetting:paidPurchasesPasswordSetting:requestProperties:",  v17,  v18,  v21);
      objc_initWeak(&location, v19);
      objc_initWeak(&from, a1);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000A11C8;
      v23[3] = &unk_10034D3E0;
      objc_copyWeak(&v27, &from);
      objc_copyWeak(v28, &location);
      id v24 = reply;
      v28[1] = v17;
      v28[2] = v18;
      id v25 = v6;
      id v26 = v7;
      -[UpdateAccountPasswordSettingsOperation setCompletionBlock:](v19, "setCompletionBlock:", v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
      [v20 addOperation:v19];

      objc_destroyWeak(v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      v12 = v22;
    }
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_connection_send_message((xpc_connection_t)v7, reply);
  }
}

@end