@interface GKGameService
+ (Class)interfaceClass;
+ (id)sharedGameActivityStore;
+ (unint64_t)requiredEntitlements;
- (void)_getPerGameFriendsPlayerIDForBundleID:(id)a3 handler:(id)a4;
- (void)checkTCCAuthorization:(id)a3;
- (void)fetchMostRecentGameActivityForBundleID:(id)a3 handler:(id)a4;
- (void)getArcadeHighlightForAdamID:(id)a3 count:(int64_t)a4 handler:(id)a5;
- (void)getPerGameFriendsForBundleID:(id)a3 handler:(id)a4;
- (void)getPerGameSettingsForBundleID:(id)a3 handler:(id)a4;
- (void)resetTCCAuthorization:(id)a3;
- (void)setPerGameSettings:(id)a3 handler:(id)a4;
- (void)storeGameForBundleIDs:(id)a3 completion:(id)a4;
@end

@implementation GKGameService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKGameServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 16LL;
}

+ (id)sharedGameActivityStore
{
  if (qword_1002BB4C8 != -1) {
    dispatch_once(&qword_1002BB4C8, &stru_10026D138);
  }
  return (id)qword_1002BB4C0;
}

- (void)getArcadeHighlightForAdamID:(id)a3 count:(int64_t)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (qword_1002BB4D0 != -1) {
    dispatch_once(&qword_1002BB4D0, &stru_10026D158);
  }
  id v9 = objc_alloc(&OBJC_CLASS___ASCCollectionRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100039BE4;
  v13[3] = &unk_10026D1F8;
  id v14 = [v9 initWithID:ASCCollectionIDGamesForYou kind:ASCLockupKindApp context:ASCLockupContextGameCenter limit:10];
  id v15 = v7;
  v16 = self;
  id v17 = v8;
  id v10 = v7;
  id v11 = v8;
  id v12 = v14;
  dispatch_async(&_dispatch_main_q, v13);
}

- (void)getPerGameSettingsForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  152LL,  "-[GKGameService getPerGameSettingsForBundleID:handler:]"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003A4FC;
    v17[3] = &unk_10026B408;
    id v18 = v6;
    v19 = self;
    id v10 = v9;
    id v20 = v10;
    [v10 performOnManagedObjectContext:v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003AAD0;
    v14[3] = &unk_10026B310;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)setPerGameSettings:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  218LL,  "-[GKGameService setPerGameSettings:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10003ACB0;
  v19[3] = &unk_10026B408;
  id v20 = v6;
  id v10 = v9;
  id v21 = v10;
  v22 = self;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003B404;
  v16[3] = &unk_10026B030;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)getPerGameFriendsForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  321LL,  "-[GKGameService getPerGameFriendsForBundleID:handler:]"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003B5E0;
    v17[3] = &unk_10026B080;
    void v17[4] = self;
    id v18 = v6;
    id v10 = v9;
    id v19 = v10;
    [v10 perform:v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003B950;
    v14[3] = &unk_10026B030;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)checkTCCAuthorization:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  369LL,  "-[GKGameService checkTCCAuthorization:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003BB14;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003BC68;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)resetTCCAuthorization:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  394LL,  "-[GKGameService resetTCCAuthorization:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003BE40;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v16 = v8;
  id v9 = v8;
  [v6 perform:v15];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003BEE8;
  v13[3] = &unk_10026B120;
  id v14 = v4;
  id v12 = v4;
  [v6 notifyOnQueue:v11 block:v13];
}

- (void)_getPerGameFriendsPlayerIDForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  419LL,  "-[GKGameService _getPerGameFriendsPlayerIDForBundleID:handler:]"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003C2E4;
    v17[3] = &unk_10026D328;
    id v18 = v6;
    id v19 = self;
    id v10 = v9;
    id v20 = v10;
    id v21 = &stru_10026D2B0;
    [v10 performOnManagedObjectContext:v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003CBC8;
    v14[3] = &unk_10026B310;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)storeGameForBundleIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Add games: %@ ", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKProfileServicePrivate, "serviceFromService:", self));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);

  id v15 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKGameService.m",  521LL,  "-[GKGameService storeGameForBundleIDs:completion:]"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[GKService transactionGroupWithName:forPlayerID:]( self,  "transactionGroupWithName:forPlayerID:",  v16,  0LL));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10003CEF4;
  v33[3] = &unk_10026B408;
  id v34 = v6;
  v35 = v15;
  id v18 = v17;
  id v36 = v18;
  id v19 = v15;
  id v20 = v6;
  [v18 performOnManagedObjectContext:v33];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10003D17C;
  v27[3] = &unk_10026D350;
  id v28 = v18;
  id v29 = v14;
  v31 = self;
  id v32 = v8;
  id v30 = v11;
  id v23 = v11;
  id v24 = v8;
  id v25 = v14;
  id v26 = v18;
  [v26 notifyOnQueue:v22 block:v27];
}

- (void)fetchMostRecentGameActivityForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameService sharedGameActivityStore](&OBJC_CLASS___GKGameService, "sharedGameActivityStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003D434;
  v9[3] = &unk_10026D378;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchAndRemoveLatestActivityWithBundleID:v6 completionHandler:v9];
}

@end