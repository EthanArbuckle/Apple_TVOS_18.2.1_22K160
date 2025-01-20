@interface GKTurnBasedMultiplayerTurnCountBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
@end

@implementation GKTurnBasedMultiplayerTurnCountBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerTurnCountBulletin loadBulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v10 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBasedTurnCount];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"i"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pushCredentialForEnvironment:", objc_msgSend(v12, "environment")));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playerInternal]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);
    unsigned int v17 = [v16 isEqualToString:v11];

    if (v17)
    {
      v30 = v12;
      v31 = v11;
      v32 = v7;
      id v33 = v5;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"tc"]);
      id v18 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"t"]);
            id v24 = [v23 unsignedIntegerValue];

            v25 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"d"]);
            v26 = -[GKGameDescriptor initWithPushDictionary:]( objc_alloc(&OBJC_CLASS___GKGameDescriptor),  "initWithPushDictionary:",  v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameDescriptor bundleIdentifier](v26, "bundleIdentifier"));

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](&OBJC_CLASS___GKBadgeController, "sharedController"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameDescriptor bundleIdentifier](v26, "bundleIdentifier"));
              [v28 setBadgeCount:v24 forBundleID:v29 badgeType:2];
            }
          }

          id v19 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }

        while (v19);
      }

      v7 = v32;
      id v5 = v33;
      v12 = v30;
      v11 = v31;
    }
  }

  if (v7) {
    v7[2](v7, 0LL);
  }
}

@end