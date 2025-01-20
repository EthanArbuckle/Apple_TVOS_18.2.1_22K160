@interface GKChallengeService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (id)_filterChallenges:(id)a3 compatibleWithBundleID:(id)a4;
- (void)_determineCompatibleGamesForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)_updateGamesForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)_updatePlayersForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)abortChallenges:(id)a3 handler:(id)a4;
- (void)fetchChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 handler:(id)a4;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 clientBundleID:(id)a5 handler:(id)a6;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 handler:(id)a5;
- (void)getChallengesForGameDescriptor:(id)a3 handler:(id)a4;
- (void)issueChallenge:(id)a3 toPlayers:(id)a4 handler:(id)a5;
- (void)loadChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
@end

@implementation GKChallengeService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKChallengeServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 64LL;
}

- (void)_updatePlayersForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006827C;
    v14[3] = &unk_10026EEF0;
    v9 =  -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  2LL * (void)v8);
    v15 = v9;
    [v6 enumerateObjectsUsingBlock:v14];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100068318;
    v11[3] = &unk_10026B080;
    v11[4] = self;
    v12 = v9;
    id v13 = v6;
    v10 = v9;
    [v7 perform:v11];
  }
}

- (id)_filterChallenges:(id)a3 compatibleWithBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100068604;
    v11[3] = &unk_10026EF18;
    id v12 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v11));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v8]);

    id v5 = (id)v9;
  }

  return v5;
}

- (void)_determineCompatibleGamesForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v33 = v6;
    id v7 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v34 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
          -[NSMutableSet addObject:](v7, "addObject:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 compatibleBundleIDs]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 array]);
          -[NSMutableSet addObjectsFromArray:](v7, "addObjectsFromArray:", v16);
        }

        id v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }

      while (v10);
    }

    v32 = v7;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id obj = v8;
    id v18 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        v21 = 0LL;
        id v35 = v19;
        do
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v21);
          v23 = objc_autoreleasePoolPush();
          v24 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleID]);
          unsigned __int8 v25 = [v17 applicationIsInstalled:v24];

          if ((v25 & 1) == 0)
          {
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v22 compatibleBundleIDs]);
            id v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v38;
              while (2)
              {
                for (j = 0LL; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
                  if ([v17 applicationIsInstalled:v31])
                  {
                    [v22 setBundleID:v31];
                    goto LABEL_25;
                  }
                }

                id v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }

- (void)_updateGamesForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100068A64;
    v9[3] = &unk_10026B080;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 _gkDistinctValuesForKeyPath:@"bundleID"]);
    id v11 = v6;
    id v8 = v10;
    [v7 perform:v9];
  }
}

- (void)fetchChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100068CF4;
  v8[3] = &unk_10026B310;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  [v7 performBlock:v8];
}

- (void)loadChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeService.m",  204LL,  "-[GKChallengeService loadChallengesForGameDescriptor:context:handler:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKCacheTransactionGroup transactionGroupWithName:context:client:]( &OBJC_CLASS___GKCacheTransactionGroup,  "transactionGroupWithName:context:client:",  v10,  v7,  v9));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000690B4;
  v21[3] = &unk_10026BEC8;
  v21[4] = self;
  id v14 = v11;
  id v22 = v14;
  id v15 = v7;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  [v14 performOnQueue:v13 block:v21];

  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10006943C;
    v18[3] = &unk_10026B030;
    id v20 = v8;
    id v19 = v14;
    [v19 notifyOnQueue:v17 block:v18];
  }
}

- (void)getChallengesForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeService.m",  250LL,  "-[GKChallengeService getChallengesForGameDescriptor:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);

  if (!v6)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v13 gameDescriptor]);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000696DC;
  v25[3] = &unk_10026BEC8;
  id v14 = v10;
  id v26 = v14;
  id v27 = self;
  id v15 = v6;
  id v28 = v15;
  id v16 = v12;
  id v29 = v16;
  [v14 performOnQueue:v16 block:v25];
  if (v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100069EAC;
    v19[3] = &unk_10026B0A8;
    id v20 = v14;
    v21 = self;
    id v22 = v15;
    id v23 = v8;
    id v24 = v7;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 handler:(id)a4
{
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 handler:(id)a5
{
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 clientBundleID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeService.m",  345LL,  "-[GKChallengeService getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:]"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10006A46C;
  v31[3] = &unk_10026BEC8;
  id v18 = v15;
  id v32 = v18;
  id v33 = v10;
  id v34 = self;
  id v35 = v11;
  id v19 = v11;
  id v20 = v10;
  [v18 performOnQueue:v17 block:v31];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10006B3BC;
  v26[3] = &unk_10026B0F8;
  id v27 = v18;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v23 = v13;
  id v24 = v12;
  id v25 = v18;
  [v25 notifyOnQueue:v22 block:v26];
}

- (void)issueChallenge:(id)a3 toPlayers:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v9 count]));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( [v8 serverRepresentationForReceivingPlayer:*(void *)(*((void *)&v29 + 1) + 8 * (void)v16)]);
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v14);
  }

  id v18 = objc_alloc(&OBJC_CLASS___GKChallengeNetworkRequest);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleIdentifier]);
  v21 = -[GKChallengeNetworkRequest initWithChallenges:bundleID:](v18, "initWithChallenges:bundleID:", v11, v20);

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v22 writeToNetwork:v21 clientProxy:v23 handler:0];

  if (v10)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 replyQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006BAD4;
    block[3] = &unk_10026B120;
    id v28 = v10;
    dispatch_async(v25, block);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v26 reportEvent:GKReporterDomainChallenge type:GKReporterChallengeIssue];
}

- (void)abortChallenges:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKChallengeService.m",  538LL,  "-[GKChallengeService abortChallenges:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006BCB4;
  v19[3] = &unk_10026B080;
  id v12 = v6;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  id v22 = self;
  [v13 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10006C240;
    v17[3] = &unk_10026B030;
    v17[4] = self;
    id v18 = v7;
    [v13 notifyOnQueue:v15 block:v17];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v16 reportEvent:GKReporterDomainChallenge type:GKReporterChallengeAbort];
}

@end