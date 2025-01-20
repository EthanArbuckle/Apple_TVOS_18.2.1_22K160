@interface INBagRenewal
+ (void)attemptRenewCredentialsWithAccount:(id)a3 completion:(id)a4;
@end

@implementation INBagRenewal

+ (void)attemptRenewCredentialsWithAccount:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_altDSID"));
  v19[0] = kACRenewCredentialsShouldAvoidUIKey;
  v19[1] = kACRenewCredentialsShouldForceKey;
  v20[0] = &__kCFBooleanTrue;
  v20[1] = &__kCFBooleanFalse;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  uint64_t v10 = _INLogSystem(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000149A0((uint64_t)v8, v11);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100003744;
  v15[3] = &unk_100024A90;
  id v17 = v8;
  id v18 = v6;
  id v16 = v7;
  id v12 = v8;
  id v13 = v7;
  id v14 = v6;
  [v13 renewCredentialsForAccount:v5 options:v9 completion:v15];
}

@end