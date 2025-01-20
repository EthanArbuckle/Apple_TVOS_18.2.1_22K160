@interface TVAskPermissionRequestExtension
- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4;
@end

@implementation TVAskPermissionRequestExtension

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVAskPermissionRequestExtension::requestUpdatedWithResult Result - %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  id v6 = objc_alloc(&OBJC_CLASS___AMSPurchase);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 buyParams]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](&OBJC_CLASS___AMSBuyParams, "buyParamsWithString:", v7));
  id v9 = [v6 initWithPurchaseType:0 buyParams:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));
  [v9 setAccount:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"TVApp",  @"1"));
  id v13 = [[AMSPurchaseTask alloc] initWithPurchase:v9 bag:v12];
  [v13 setDelegate:self];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 performPurchase]);
  [v14 addFinishBlock:&stru_100004108];
}

@end