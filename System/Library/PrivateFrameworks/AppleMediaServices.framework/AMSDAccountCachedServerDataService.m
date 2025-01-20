@interface AMSDAccountCachedServerDataService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)accountAuthSyncForAccountID:(id)a3 reply:(id)a4;
- (void)getDataForAccountIDs:(id)a3 reply:(id)a4;
- (void)manualSyncForAccountID:(id)a3 reply:(id)a4;
- (void)queueMetricsEventNotingExpiry:(id)a3 appID:(id)a4 reply:(id)a5;
- (void)setAutoPlayState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5;
- (void)setPersonalizationState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5;
@end

@implementation AMSDAccountCachedServerDataService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)getDataForAccountIDs:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004030;
  v9[3] = &unk_1000D5BC8;
  id v10 = v5;
  id v8 = v5;
  [v7 dataWithAccounts:v6 completionHandler:v9];
}

- (void)setAutoPlayState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004150;
  v11[3] = &unk_1000D5BF0;
  id v12 = v7;
  id v10 = v7;
  [v9 changeAutoPlayFor:v8 to:v6 completionHandler:v11];
}

- (void)setPersonalizationState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004278;
  v11[3] = &unk_1000D5BF0;
  id v12 = v7;
  id v10 = v7;
  [v9 changePersonalizationFor:v8 to:v6 completionHandler:v11];
}

- (void)queueMetricsEventNotingExpiry:(id)a3 appID:(id)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000435C;
  v12[3] = &unk_1000D5BF0;
  id v13 = v7;
  id v11 = v7;
  [v10 queueMetricsEventFor:v9 appID:v8 completionHandler:v12];
}

- (void)manualSyncForAccountID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000447C;
  v9[3] = &unk_1000D5BF0;
  id v10 = v5;
  id v8 = v5;
  [v7 manualSyncFor:v6 completionHandler:v9];
}

- (void)accountAuthSyncForAccountID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000459C;
  v9[3] = &unk_1000D5BF0;
  id v10 = v5;
  id v8 = v5;
  [v7 accountAuthSyncFor:v6 completionHandler:v9];
}

@end