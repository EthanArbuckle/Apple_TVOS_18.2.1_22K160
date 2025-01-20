@interface GKTurnBasedServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (void)getTurnBasedBadgeCountWithHandler:(id)a3;
- (void)showMatch:(id)a3;
@end

@implementation GKTurnBasedServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKTurnBasedServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x1000000LL;
}

- (void)getTurnBasedBadgeCountWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedService.m",  1689LL,  "-[GKTurnBasedServicePrivate getTurnBasedBadgeCountWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  v29[3] = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10008E04C;
  v21[3] = &unk_10026FD40;
  v21[4] = self;
  id v8 = v6;
  id v22 = v8;
  v23 = v29;
  v24 = &v25;
  [v7 performBlockAndWait:v21];

  if (*((_BYTE *)v26 + 24))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008E178;
    v17[3] = &unk_10026D890;
    v17[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"game"]);
    id v18 = v9;
    id v19 = v8;
    v20 = v29;
    [v19 perform:v17];
  }

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008E3D4;
    v12[3] = &unk_10026FDB8;
    id v15 = v4;
    v16 = v29;
    id v13 = v8;
    v14 = self;
    [v13 notifyOnQueue:v11 block:v12];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)showMatch:(id)a3
{
  id v27 = a3;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v27 matchID]);
  if (v3)
  {
    id v4 = (GKTurnBasedMultiplayerBulletin *)v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v27 bundleID]);
    if (!v5)
    {
LABEL_8:

      goto LABEL_9;
    }

    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleVersion]);

    if (v7)
    {
      id v4 = objc_alloc_init(&OBJC_CLASS___GKTurnBasedMultiplayerBulletin);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleVersion]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v27 shortBundleVersion]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v27 game]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 adamID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKGameDescriptor gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:]( &OBJC_CLASS___GKGameDescriptor,  "gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:",  v8,  v9,  v10,  v12));

      -[GKBulletin setGameDescriptor:](v4, "setGameDescriptor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v27 matchID]);
      -[GKTurnBasedMultiplayerBulletin setMatchID:](v4, "setMatchID:", v14);

      -[GKBulletin setPushCommand:](v4, "setPushCommand:", 81LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleVersion]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](v4, "gameDescriptor"));
      [v16 setBundleVersion:v15];

      v17 = (void *)objc_claimAutoreleasedReturnValue([v27 shortBundleVersion]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](v4, "gameDescriptor"));
      [v18 setShortBundleVersion:v17];

      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 acceptedInviteManager]);

      [v20 addTurnBasedEvent:v4];
      v21 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
      unsigned int v22 = GKGetApplicationStateForBundleID(v21);

      if (v22 == 8
        || (v23 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]),
            GKLaunchApplicationWithIdentifier(v23, 0LL),
            v23,
            v22 >= 4))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v24));

        [v25 fetchTurnBasedData];
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
      [v26 reportEvent:GKReporterDomainTurnBased type:GKReporterTurnBasedShowMatch];

      goto LABEL_8;
    }
  }

@end