@interface GKBulletinServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (void)clearBulletinsForReceivedChallenges:(id)a3;
- (void)clearBulletinsForTurnBasedTurn:(id)a3 exchangeID:(id)a4;
- (void)fetchBadgeCountsForBundleID:(id)a3 handler:(id)a4;
- (void)fetchMessageImageForBundleID:(id)a3 handler:(id)a4;
- (void)markAllBadgesAsViewedForType:(unint64_t)a3;
@end

@implementation GKBulletinServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKBulletinServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x10000LL;
}

- (void)markAllBadgesAsViewedForType:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKBulletinService.m",  63LL,  "-[GKBulletinServicePrivate markAllBadgesAsViewedForType:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000CB94;
  v9[3] = &unk_10026B4D0;
  v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (void)fetchBadgeCountsForBundleID:(id)a3 handler:(id)a4
{
  if (a4)
  {
    v5 = (void (**)(id, void *, void))a4;
    id v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](&OBJC_CLASS___GKBadgeController, "sharedController"));
    id v8 = [v7 badgeCountForBundleID:v6 badgeType:1];
    id v9 = [v7 badgeCountForBundleID:v6 badgeType:0];
    id v10 = [v7 badgeCountForBundleID:v6 badgeType:2];

    v15[0] = &off_100287868;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
    v16[0] = v11;
    v15[1] = &off_100287880;
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8));
    v16[1] = v12;
    v15[2] = &off_100287898;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    v16[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    v5[2](v5, v14, 0LL);
  }

- (void)clearBulletinsForReceivedChallenges:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v6 = objc_msgSend(v4, "getBulletinsOfType:", objc_opt_class(GKChallengeReceivedBulletin, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v11)]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 challenge]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 challengeID]);
        unsigned int v15 = [v3 containsObject:v14];

        if (v15) {
          [v4 withdrawBulletin:v12];
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (void)clearBulletinsForTurnBasedTurn:(id)a3 exchangeID:(id)a4
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v7 = objc_msgSend(v5, "getBulletinsOfType:", objc_opt_class(GKTurnBasedMultiplayerTurnBulletin, v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      unint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v12)]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 matchID]);
        unsigned int v15 = [v4 isEqualToString:v14];

        if (v15) {
          [v5 withdrawBulletin:v13];
        }

        unint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

- (void)fetchMessageImageForBundleID:(id)a3 handler:(id)a4
{
  uint64_t v11 = (void (**)(id, void *))a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationProxyForBundleID:v5]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _gkPathForMessageImage]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v9));
  if (v11) {
    v11[2](v11, v10);
  }
}

@end