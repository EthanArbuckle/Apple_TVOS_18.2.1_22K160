@interface GKProfileServicePrivate
+ (Class)interfaceClass;
+ (id)cacheKeyForScopedIDs:(id)a3;
+ (id)cacheKeyForScopedIDsWithGameBundleID:(id)a3 playerID:(id)a4;
+ (id)makeGKScopedIDsFromInternal:(id)a3;
+ (id)parseContactAssociationIDsFromRelationships:(id)a3 contactAssociationIDMap:(id)a4 contacts:(id)a5;
+ (id)scopedIDsFetchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4;
+ (unint64_t)requiredEntitlements;
- (id)fetchScopedIDsCacheKeysWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5;
- (id)filterPlayerIDsThatNeedPreloading:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5;
- (id)loadCachedScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 error:(id *)a5 moc:(id)a6;
- (void)allowFriendInvitesFrom:(unint64_t)a3 handler:(id)a4;
- (void)cachePhotos:(id)a3 avatarType:(id)a4 fileNames:(id)a5 handler:(id)a6;
- (void)clearScopedIdsCacheWithHandler:(id)a3;
- (void)deletePhotoWithHandler:(id)a3;
- (void)denyFriendInvitesFrom:(unint64_t)a3 handler:(id)a4;
- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 cachedScopedIDs:(id)a5 handler:(id)a6;
- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDsCacheKeys:(id)a5 cacheOnly:(BOOL)a6 handler:(id)a7;
- (void)fetchAndCacheScopedPlayerIDsForRequest:(id)a3 scopedIDsCacheKeys:(id)a4 cacheOnly:(BOOL)a5 handler:(id)a6;
- (void)getContextualPromptStatesWithCompletion:(id)a3;
- (void)getNicknameSuggestions:(int64_t)a3 handler:(id)a4;
- (void)getProfilePrivacyWithHandler:(id)a3;
- (void)getProfilesForPlayerIDs:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5;
- (void)getTermsAndConditionsURLWithHandler:(id)a3;
- (void)invalidateCachedProfileForLocalPlayerWithHandler:(id)a3;
- (void)loadProfileForPlayer:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6;
- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5;
- (void)preloadInstalledGamesScopedPlayerIDs:(id)a3 completion:(id)a4;
- (void)setArcadeSubscriptionExpiration:(id)a3 handler:(id)a4;
- (void)setFindable:(BOOL)a3 handler:(id)a4;
- (void)setFriendInvitesAllowedFlag:(id)a3 source:(unint64_t)a4 handler:(id)a5;
- (void)setGlobalFriendListAccess:(int)a3 handler:(id)a4;
- (void)setPhotoData:(id)a3 avatarType:(id)a4 handler:(id)a5;
- (void)setPlayerNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5;
- (void)setPrivacyNoticeVersion:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setProfilePrivacy:(int)a3 handler:(id)a4;
- (void)setProfileSettings:(id)a3 handler:(id)a4;
- (void)setStatus:(id)a3 handler:(id)a4;
@end

@implementation GKProfileServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKProfileServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x20000LL;
}

- (void)setStatus:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if ((unint64_t)[v8 length] >= 0x8D)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 substringToIndex:140]);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  608LL,  "-[GKProfileServicePrivate setStatus:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100025704;
  v22[3] = &unk_10026BEC8;
  id v15 = v12;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  v26 = self;
  [v15 performOnQueue:v14 block:v22];

  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100025970;
    v19[3] = &unk_10026B030;
    id v21 = v7;
    id v20 = v15;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)cachePhotos:(id)a3 avatarType:(id)a4 fileNames:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  641LL,  "-[GKProfileServicePrivate cachePhotos:avatarType:fileNames:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100025BA4;
  v26[3] = &unk_10026BB28;
  id v18 = v15;
  id v27 = v18;
  id v19 = v11;
  id v28 = v19;
  v29 = self;
  id v20 = v10;
  id v30 = v20;
  id v21 = v12;
  id v31 = v21;
  [v18 performOnQueue:v17 block:v26];

  if (v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100025E60;
    v24[3] = &unk_10026B120;
    id v25 = v13;
    [v18 notifyOnQueue:v23 block:v24];
  }
}

- (void)setPhotoData:(id)a3 avatarType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  673LL,  "-[GKProfileServicePrivate setPhotoData:avatarType:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100026038;
  v22[3] = &unk_10026BEC8;
  id v15 = v12;
  id v23 = v15;
  id v24 = self;
  id v16 = v8;
  id v25 = v16;
  id v17 = v9;
  id v26 = v17;
  [v15 performOnQueue:v14 block:v22];

  if (v10)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000263B4;
    v20[3] = &unk_10026B120;
    id v21 = v10;
    [v15 notifyOnQueue:v19 block:v20];
  }
}

- (void)deletePhotoWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKProfileService: deletePhotoWithHandler", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  709LL,  "-[GKProfileServicePrivate deletePhotoWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002659C;
  v17[3] = &unk_10026B170;
  id v12 = v9;
  id v18 = v12;
  id v19 = self;
  [v12 performOnQueue:v11 block:v17];

  if (v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000267D8;
    v15[3] = &unk_10026B120;
    id v16 = v5;
    [v12 notifyOnQueue:v14 block:v15];
  }
}

- (void)setFindable:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  739LL,  "-[GKProfileServicePrivate setFindable:handler:]"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000268F8;
  v12[3] = &unk_10026C640;
  BOOL v16 = a3;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBlock:v12];
}

- (void)setPlayerNickname:(id)a3 suggestionsCount:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void, void, void))v9;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  772LL,  "-[GKProfileServicePrivate setPlayerNickname:suggestionsCount:handler:]"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100026E00;
    v21[3] = &unk_10026C690;
    int64_t v25 = a4;
    id v22 = v8;
    id v23 = self;
    id v13 = v12;
    id v24 = v13;
    [v13 performOnManagedObjectContext:v21];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000272A8;
    v18[3] = &unk_10026B030;
    id v19 = v13;
    id v20 = v10;
    id v16 = v13;
    [v16 notifyOnQueue:v15 block:v18];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers(v9);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10002D5A4();
    }
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    ((void (**)(void, void *, void, id))v10)[2](v10, &__NSArray0__struct, 0LL, v16);
  }
}

- (void)getNicknameSuggestions:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v24 = @"suggestions-count";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  int64_t v25 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  820LL,  "-[GKProfileServicePrivate getNicknameSuggestions:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v9));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100027530;
  v20[3] = &unk_10026B080;
  id v21 = v8;
  id v22 = self;
  id v11 = v10;
  id v23 = v11;
  id v12 = v8;
  [v11 perform:v20];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002771C;
  v17[3] = &unk_10026B030;
  id v18 = v11;
  id v19 = v6;
  id v15 = v11;
  id v16 = v6;
  [v15 notifyOnQueue:v14 block:v17];
}

- (void)getTermsAndConditionsURLWithHandler:(id)a3
{
  id v4 = a3;
  id v21 = @"key";
  id v22 = @"TD.termsOfServiceURL";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  844LL,  "-[GKProfileServicePrivate getTermsAndConditionsURLWithHandler:]"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v6));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100027958;
  v17[3] = &unk_10026B080;
  id v18 = v5;
  id v19 = self;
  id v8 = v7;
  id v20 = v8;
  id v9 = v5;
  [v8 perform:v17];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027B40;
  v14[3] = &unk_10026B030;
  id v15 = v8;
  id v16 = v4;
  id v12 = v8;
  id v13 = v4;
  [v12 notifyOnQueue:v11 block:v14];
}

- (void)setGlobalFriendListAccess:(int)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  866LL,  "-[GKProfileServicePrivate setGlobalFriendListAccess:handler:]"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v7));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100027D04;
  v17[3] = &unk_10026C730;
  int v19 = a3;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 performOnManagedObjectContext:v17];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027F94;
  v14[3] = &unk_10026B030;
  id v15 = v9;
  id v16 = v6;
  id v12 = v9;
  id v13 = v6;
  [v12 notifyOnQueue:v11 block:v14];
}

- (void)setArcadeSubscriptionExpiration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  908LL,  "-[GKProfileServicePrivate setArcadeSubscriptionExpiration:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100028160;
  v19[3] = &unk_10026B080;
  id v20 = v6;
  id v21 = self;
  id v10 = v9;
  id v22 = v10;
  id v11 = v6;
  [v10 perform:v19];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000282B4;
  v16[3] = &unk_10026B030;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)allowFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
}

- (void)denyFriendInvitesFrom:(unint64_t)a3 handler:(id)a4
{
}

- (void)setFriendInvitesAllowedFlag:(id)a3 source:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v9);
  }
  id v12 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKProfileService: setFriendInvitesAllowedFlag: %@, source: %@",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v16 = v15;
  if ((a4 & 1) != 0) {
    [v15 setObject:v8 forKeyedSubscript:@"allow-friend-invites-from-challenges"];
  }
  if ((a4 & 2) != 0) {
    [v16 setObject:v8 forKeyedSubscript:@"allow-friend-invites-from-multiplayer-invites"];
  }
  if ([v16 count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100028518;
    v18[3] = &unk_10026C758;
    int v19 = v10;
    -[GKProfileServicePrivate setProfileSettings:handler:](self, "setProfileSettings:handler:", v16, v18);
    id v17 = v19;
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:description:]( &OBJC_CLASS___NSError,  "userErrorForCode:description:",  17LL,  @"At least one source must be selected"));
    ((void (**)(void, void *))v10)[2](v10, v17);
  }
}

- (void)setPrivacyNoticeVersion:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKDaemon;
  BOOL v10 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v10)
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKProfileService: setPrivacyNoticeVersion:%lu",  buf,  0xCu);
  }

  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers(v10);
  }
  id v12 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412290;
    unint64_t v23 = (unint64_t)v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Syncing the privacy notice version (%@) to the server...",  buf,  0xCu);
  }

  uint64_t v20 = GKAccountPrivacyNoticeVersionKey;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v21 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100028828;
  v18[3] = &unk_10026C758;
  id v19 = v7;
  id v17 = v7;
  -[GKProfileServicePrivate setProfileSettings:handler:](self, "setProfileSettings:handler:", v16, v18);
}

- (void)setProfilePrivacy:(int)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = @"everyone";
  if (a3 == 2) {
    id v8 = @"me";
  }
  if (a3 == 1) {
    id v9 = @"friends";
  }
  else {
    id v9 = v8;
  }
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v6);
  }
  id v11 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKProfileService: setProfilePrivacy:%@",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  995LL,  "-[GKProfileServicePrivate setProfilePrivacy:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100028B84;
  v25[3] = &unk_10026C780;
  int v29 = a3;
  id v26 = (__CFString *)v9;
  id v27 = self;
  id v15 = v13;
  id v28 = v15;
  [v15 performOnManagedObjectContext:v25];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100028E4C;
  v21[3] = &unk_10026B148;
  id v22 = v15;
  id v23 = v14;
  id v24 = v7;
  id v18 = v7;
  id v19 = v14;
  id v20 = v15;
  [v20 notifyOnQueue:v17 block:v21];
}

- (void)setProfileSettings:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1039LL,  "-[GKProfileServicePrivate setProfileSettings:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100029040;
  v19[3] = &unk_10026B408;
  id v20 = v6;
  id v21 = self;
  id v10 = v9;
  id v22 = v10;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000291F0;
  v16[3] = &unk_10026B030;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)invalidateCachedProfileForLocalPlayerWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1064LL,  "-[GKProfileServicePrivate invalidateCachedProfileForLocalPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  [v6 performOnManagedObjectContext:&stru_10026C7E8];
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 replyQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000293C8;
    v9[3] = &unk_10026B120;
    id v10 = v4;
    [v6 notifyOnQueue:v8 block:v9];
  }
}

- (void)getProfilePrivacyWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKProfileService: getProfilePrivacyWithHandler",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1081LL,  "-[GKProfileServicePrivate getProfilePrivacyWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100029588;
  v18[3] = &unk_10026C810;
  id v10 = v9;
  id v19 = v10;
  [v10 performOnManagedObjectContext:v18];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100029620;
  v15[3] = &unk_10026B310;
  id v16 = v10;
  id v17 = v5;
  id v13 = v5;
  id v14 = v10;
  [v14 notifyOnQueue:v12 block:v15];
}

- (void)getProfilesForPlayerIDs:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1398LL,  "-[GKProfileServicePrivate getProfilesForPlayerIDs:fetchOptions:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000297EC;
  v20[3] = &unk_10026B080;
  void v20[4] = self;
  id v21 = v7;
  id v11 = v10;
  id v22 = v11;
  id v12 = v7;
  [v11 perform:v20];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000298E8;
  v17[3] = &unk_10026B310;
  id v18 = v11;
  id v19 = v8;
  id v15 = v8;
  id v16 = v11;
  [v16 notifyOnQueue:v14 block:v17];
}

- (void)loadProfileForPlayer:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  v33[3] = 0LL;
  if (v10)
  {
    id v34 = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1481LL,  "-[GKProfileServicePrivate loadProfileForPlayer:pieces:context:handler:]"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v15,  v11,  v16));

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100029C7C;
    v26[3] = &unk_10026C888;
    id v27 = v10;
    id v18 = v14;
    unsigned __int8 v32 = a4;
    id v28 = v18;
    int v29 = self;
    id v19 = v17;
    id v30 = v19;
    id v31 = v33;
    [v19 performOnManagedObjectContext:v26];
    if (v13)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyQueue]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10002A1D4;
      v22[3] = &unk_10026B878;
      id v24 = v13;
      int64_t v25 = v33;
      id v23 = v19;
      [v23 notifyOnQueue:v21 block:v22];
    }
  }

  else if (v12)
  {
    (*((void (**)(id, void, double))v12 + 2))(v12, 0LL, 0.0);
  }

  _Block_object_dispose(v33, 8);
}

- (void)preloadInstalledGamesScopedPlayerIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002A358;
  v13[3] = &unk_10026B120;
  id v7 = a4;
  id v14 = v7;
  id v8 = objc_retainBlock(v13);
  if ([v6 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKGameServicePrivate, "serviceFromService:", self));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002A36C;
    v10[3] = &unk_10026C900;
    id v12 = v8;
    v10[4] = self;
    id v11 = v6;
    [v9 fetchInstalledGameIdCacheWithHandler:v10];
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

+ (id)scopedIDsFetchRequestWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDScopedIds _gkFetchRequest](&OBJC_CLASS___GKCDScopedIds, "_gkFetchRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"playerId IN %@ AND gameBundleId IN %@ AND fetchedOn != nil",  v6,  v5));

  [v7 setPredicate:v8];
  return v7;
}

- (id)filterPlayerIDsThatNeedPreloading:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]",  v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKProfileServicePrivate filterPlayerIDsThatNeedPreloading:gameBundleIDs:moc:]",  [v15 UTF8String],  1631));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:]( &OBJC_CLASS___GKProfileServicePrivate,  "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:",  v7,  v8));
  id v18 = objc_opt_new(&OBJC_CLASS___NSExpressionDescription);
  -[NSExpressionDescription setName:](v18, "setName:", @"gameBundleIDCount");
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForKeyPath:]( &OBJC_CLASS___NSExpression,  "expressionForKeyPath:",  @"gameBundleId"));
  v40 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"count:",  v20));
  -[NSExpressionDescription setExpression:](v18, "setExpression:", v21);

  -[NSExpressionDescription setExpressionResultType:](v18, "setExpressionResultType:", 200LL);
  v39[0] = @"playerId";
  v39[1] = v18;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  [v17 setPropertiesToFetch:v22];

  [v17 setPropertiesToGroupBy:&off_100288610];
  [v17 setResultType:2];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSExpressionDescription name](v18, "name"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForVariable:](&OBJC_CLASS___NSExpression, "expressionForVariable:", v23));
  int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"%@ >= %d",  v24,  [v8 count]));
  [v17 setHavingPredicate:v25];

  id v38 = 0LL;
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v17 error:&v38]);
  id v27 = v38;
  id v28 = v27;
  if (v27)
  {
    if (!os_log_GKGeneral) {
      id v29 = (id)GKOSLoggers(v27);
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10002DA54();
    }
    id v30 = &__NSArray0__struct;
  }

  else
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v26 _gkMapWithBlock:&stru_10026C940]);
    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10002AD70;
    v36[3] = &unk_10026C968;
    id v37 = v32;
    id v33 = v32;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v36));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v34]);
  }

  return v30;
}

- (id)fetchScopedIDsCacheKeysWithPlayerIDs:(id)a3 gameBundleIDs:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]",  v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v13,  "-[GKProfileServicePrivate fetchScopedIDsCacheKeysWithPlayerIDs:gameBundleIDs:moc:]",  [v15 UTF8String],  1660));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:]( &OBJC_CLASS___GKProfileServicePrivate,  "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:",  v7,  v8));
  [v17 setPropertiesToFetch:&off_100288628];
  [v17 setResultType:2];
  uint64_t v22 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v17 error:&v22]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _gkMapWithBlock:&stru_10026C988]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));

  return v20;
}

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_10026C9C8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 filteredArrayUsingPredicate:v11]);

  if ([v12 count] && objc_msgSend(v8, "count"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1689LL,  "-[GKProfileServicePrivate loadScopedPlayerIDs:gameBundleIDs:handler:]"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v13));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002B24C;
    v27[3] = &unk_10026C5C8;
    v27[4] = self;
    id v15 = v12;
    id v28 = v15;
    id v16 = v8;
    id v29 = v16;
    id v17 = v14;
    id v30 = v17;
    [v17 performOnManagedObjectContext:v27];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyQueue]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10002B2F4;
    v21[3] = &unk_10026C9F0;
    id v22 = v17;
    id v23 = v15;
    id v24 = v16;
    int64_t v25 = self;
    id v26 = v9;
    id v20 = v17;
    [v20 notifyOnQueue:v19 block:v21];
  }

  else
  {
    (*((void (**)(id, void *, void))v9 + 2))(v9, &__NSArray0__struct, 0LL);
  }
}

+ (id)makeGKScopedIDsFromInternal:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 gamePlayerId]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 teamPlayerId]);
    id v6 = [v5 length];

    if (!v6)
    {
      id v10 = 0LL;
      goto LABEL_7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerId]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 gameBundleId]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 gamePlayerId]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 teamPlayerId]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKScopedIDs makePersistentWithPlayerID:gameBundleID:gamePlayerID:teamPlayerID:]( &OBJC_CLASS___GKScopedIDs,  "makePersistentWithPlayerID:gameBundleID:gamePlayerID:teamPlayerID:",  v4,  v7,  v8,  v9));
  }

  else
  {
    id v10 = 0LL;
  }

LABEL_7:
  return v10;
}

- (id)loadCachedScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 error:(id *)a5 moc:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v12, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s not invoked on managed object context queue at %@",  "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]",  v13));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKProfileService.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]",  v14,  "-[GKProfileServicePrivate loadCachedScopedPlayerIDs:gameBundleIDs:error:moc:]",  [v16 UTF8String],  1760));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKProfileServicePrivate scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:]( &OBJC_CLASS___GKProfileServicePrivate,  "scopedIDsFetchRequestWithPlayerIDs:gameBundleIDs:",  v8,  v9));
    id v40 = 0LL;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 executeFetchRequest:v18 error:&v40]);
    id v20 = v40;
    id v21 = v20;
    if (v20)
    {
      if (a5) {
        *a5 = v20;
      }
      id v22 = &__NSArray0__struct;
    }

    else
    {
      unsigned __int8 v32 = v18;
      id v34 = v8;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v24 = v19;
      id v25 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v37;
        do
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_10002BB68;
            v35[3] = &unk_10026CA18;
            v35[4] = v29;
            if (([v23 _gkContainsObjectPassingTest:v35] & 1) == 0)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue( +[GKProfileServicePrivate makeGKScopedIDsFromInternal:]( &OBJC_CLASS___GKProfileServicePrivate,  "makeGKScopedIDsFromInternal:",  v29));
              if (v30) {
                [v23 addObject:v30];
              }
            }
          }

          id v26 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }

        while (v26);
      }

      id v22 = [v23 copy];
      id v8 = v34;
      id v18 = v32;
      id v21 = 0LL;
    }
  }

  else
  {
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)cacheKeyForScopedIDs:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 gameBundleID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 playerID]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKProfileServicePrivate cacheKeyForScopedIDsWithGameBundleID:playerID:]( &OBJC_CLASS___GKProfileServicePrivate,  "cacheKeyForScopedIDsWithGameBundleID:playerID:",  v4,  v5));
  return v6;
}

+ (id)cacheKeyForScopedIDsWithGameBundleID:(id)a3 playerID:(id)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", a3, a4);
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 cachedScopedIDs:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a5 _gkMapWithBlock:&stru_10026CA58]);
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  -[GKProfileServicePrivate fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:]( self,  "fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:",  v12,  v11,  v14,  0LL,  v10);
}

- (void)fetchAndCacheScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 scopedIDsCacheKeys:(id)a5 cacheOnly:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v33 = a5;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKScopedIDsUtils filterUnsupportedGameBundleIDs:]( &OBJC_CLASS___GKScopedIDsUtils,  "filterUnsupportedGameBundleIDs:",  a4));
  if ([v14 count])
  {
    id v32 = v12;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKScopedIDsUtils batchRequestWithPlayerIDs:gameBundleIDs:desiredSize:]( &OBJC_CLASS___GKScopedIDsUtils,  "batchRequestWithPlayerIDs:gameBundleIDs:desiredSize:",  v12,  v14,  1000LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1836LL,  "-[GKProfileServicePrivate fetchAndCacheScopedPlayerIDs:gameBundleIDs:scopedIDsCacheKeys:cacheOnly:handler:]"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v16));

    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v18 = v15;
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472LL;
          v38[2] = sub_10002C0D4;
          v38[3] = &unk_10026CA80;
          v38[4] = self;
          v38[5] = v23;
          id v39 = v33;
          BOOL v41 = a6;
          id v40 = v17;
          [v40 perform:v38];
        }

        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v20);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10002C2B8;
    v34[3] = &unk_10026CAA8;
    BOOL v37 = a6;
    id v35 = v17;
    id v36 = v13;
    id v26 = v17;
    id v27 = v13;
    [v26 notifyOnQueue:v25 block:v34];

    id v12 = v32;
  }

  else
  {
    id v28 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v29 = (id)GKOSLoggers(0LL);
      id v28 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10002DBD4();
    }
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v30 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002C0BC;
    block[3] = &unk_10026B120;
    id v47 = v13;
    id v18 = v13;
    dispatch_async(v31, block);

    id v27 = v47;
  }
}

- (void)fetchAndCacheScopedPlayerIDsForRequest:(id)a3 scopedIDsCacheKeys:(id)a4 cacheOnly:(BOOL)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002C5A8;
  v17[3] = &unk_10026CAF8;
  id v18 = v10;
  id v19 = v11;
  void v17[4] = self;
  BOOL v20 = a5;
  id v15 = v10;
  id v16 = v11;
  [v13 issueRequest:v12 bagKey:@"gk-get-scoped-ids" clientProxy:v14 handler:v17];
}

- (void)clearScopedIdsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1935LL,  "-[GKProfileServicePrivate clearScopedIdsCacheWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002CD04;
  v15[3] = &unk_10026C810;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002CDD0;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)getContextualPromptStatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKProfileService: getContextualPromptStatesWithCompletion",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKProfileService.m",  1955LL,  "-[GKProfileServicePrivate getContextualPromptStatesWithCompletion:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002CFE8;
  v18[3] = &unk_10026B608;
  void v18[4] = self;
  id v10 = v9;
  id v19 = v10;
  [v10 performOnManagedObjectContext:v18];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002D16C;
  v15[3] = &unk_10026B030;
  id v16 = v10;
  id v17 = v5;
  id v13 = v10;
  id v14 = v5;
  [v13 notifyOnQueue:v12 block:v15];
}

+ (id)parseContactAssociationIDsFromRelationships:(id)a3 contactAssociationIDMap:(id)a4 contacts:(id)a5
{
  uint64_t v8 = sub_100129640(0LL, &qword_1002BA128, &OBJC_CLASS___GKContactRelationshipResult_ptr);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  uint64_t v11 = sub_100129640(0LL, (unint64_t *)&qword_1002B8928, &OBJC_CLASS___CNContact_ptr);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  uint64_t v13 = sub_10017B5F8(v9, v10, v12);
  swift_bridgeObjectRelease(v9, v14);
  swift_bridgeObjectRelease(v10, v15);
  swift_bridgeObjectRelease(v12, v16);
  sub_10017BB04();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13, v18);
  return isa;
}

@end