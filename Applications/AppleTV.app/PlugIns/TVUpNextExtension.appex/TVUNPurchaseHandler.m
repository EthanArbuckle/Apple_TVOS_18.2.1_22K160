@interface TVUNPurchaseHandler
+ (void)_showMediaNotAllowedByProfileAlert;
+ (void)_validateRestrictionsForPurchase:(id)a3;
+ (void)purchaseItemWithBuyParams:(id)a3 completion:(id)a4;
@end

@implementation TVUNPurchaseHandler

+ (void)purchaseItemWithBuyParams:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000770C;
  v8[3] = &unk_100031040;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 _validateRestrictionsForPurchase:v8];
}

+ (void)_validateRestrictionsForPurchase:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000084A0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - validating restrictions for purchase.",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007B9C;
  v10[3] = &unk_1000310E0;
  objc_copyWeak(&v12, buf);
  id v8 = v4;
  id v11 = v8;
  id v9 = [v7 validateRestrictionForSetting:0 allowInteraction:1 withCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

+ (void)_showMediaNotAllowedByProfileAlert
{
  id v2 = sub_1000084A0();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - purchase is not allowed by profile, showing alert.",  v6,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVPlayback"));
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"VideoDisabledByUserProfileErrorDescription" value:&stru_100032790 table:0]);

  CFUserNotificationDisplayNotice(0.0, 3uLL, 0LL, 0LL, 0LL, v5, 0LL, 0LL);
}

@end