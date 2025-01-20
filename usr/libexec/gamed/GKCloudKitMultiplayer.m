@interface GKCloudKitMultiplayer
+ (BOOL)isOwnZoneID:(id)a3;
+ (id)databaseForZoneID:(id)a3;
+ (id)msgServiceQueue;
+ (id)packFakeRealTimeBulletinWithZoneData:(id)a3;
+ (id)packFakeTurnBasedBulletinWithZoneData:(id)a3;
+ (id)sessionCache;
+ (void)acceptShareMetadata:(id)a3 retryCount:(int)a4 completionHandler:(id)a5;
+ (void)bundleIDsForContainerName:(id)a3 handler:(id)a4;
+ (void)deleteInviteRecordWithRecordID:(id)a3 fromDatabase:(id)a4;
+ (void)generateAndStoreInviteBulletinForRecord:(id)a3 database:(id)a4;
+ (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
+ (void)handleLegacyShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5;
+ (void)primaryPlayerWithHandler:(id)a3;
+ (void)updateUserWithHandler:(id)a3;
@end

@implementation GKCloudKitMultiplayer

+ (id)sessionCache
{
  if (qword_1002BB508 != -1) {
    dispatch_once(&qword_1002BB508, &stru_1002700C0);
  }
  return (id)qword_1002BB500;
}

+ (void)updateUserWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 sessionCache]);
  [v5 updateUserWithHandler:v4];
}

+ (void)primaryPlayerWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"getPrimaryPlayer"));
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_100097928;
    v23 = sub_100097938;
    id v24 = 0LL;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100097DB0;
    v18[3] = &unk_1002700E8;
    v18[4] = &v19;
    v18[5] = a1;
    [v5 perform:v18];
    id v6 = [v5 waitWithTimeout:5.0];
    uint64_t v7 = (uint64_t)v6;
    if (v20[5])
    {
      v8 = 0LL;
    }

    else
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError _gkUserErrorForGameSessionErrorCode:userInfo:]( &OBJC_CLASS___NSError,  "_gkUserErrorForGameSessionErrorCode:userInfo:",  2LL,  0LL));
      v8 = v6;
    }

    if (v7 || v8)
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v6);
      }
      v17 = (os_log_s *)os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_ERROR)) {
        sub_10009ADC0((uint64_t)v8, v7, v17);
      }
      uint64_t v15 = 0LL;
      v14 = v8;
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers(v6);
      }
      v12 = (os_log_s *)os_log_GKAccount;
      if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = v20[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Fetched primary iCloud player: %@", buf, 0xCu);
      }

      v14 = 0LL;
      uint64_t v15 = v20[5];
    }

    v4[2](v4, v15, v14);

    _Block_object_dispose(&v19, 8);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(0LL);
    }
    v10 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_10009AD80(v10);
    }
  }
}

+ (BOOL)isOwnZoneID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerName]);
  if ([v5 isEqualToString:CKCurrentUserDefaultName])
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerName]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sessionCache]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userRecordID]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
    unsigned __int8 v6 = [v7 isEqualToString:v10];
  }

  return v6;
}

+ (id)databaseForZoneID:(id)a3
{
  if ([a1 isOwnZoneID:a3]) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils privateDatabase]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "privateDatabase"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils sharedDatabase]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "sharedDatabase"));
  }
  return v3;
}

+ (void)bundleIDsForContainerName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"bundleIDsForContainerName"));
    if (v6)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 sessionCache]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIDsForContainerName:v6]);
      [v8 setResult:v10];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 result]);
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  v6));
        uint64_t v13 = v12;
        if (v12)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_100098124;
          v19[3] = &unk_10026BEC8;
          id v20 = v12;
          id v21 = v6;
          id v22 = v9;
          id v23 = v8;
          [v23 perform:v19];

          v14 = v20;
        }

        else
        {
          id v24 = v6;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
          [v8 setResult:v14];
        }
      }
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100098368;
    v16[3] = &unk_10026B030;
    id v17 = v8;
    id v18 = v7;
    id v15 = v8;
    [v15 notifyOnMainQueueWithBlock:v16];
  }
}

+ (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 share]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);

  id v12 = [v11 isEqualToString:@"com.apple.legacygaming.invites"];
  if ((v12 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(v12);
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10009AE30();
    }
LABEL_17:
    v7[2](v7, 0LL);
    goto LABEL_19;
  }

  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v12);
  }
  v14 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Handle CloudKit share metadata - %@", buf, 0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v15 recordMessageInviteProcessingTimestamp];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteURLManager sharedManager](&OBJC_CLASS___GKInviteURLManager, "sharedManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 acceptingInProgressRecordIDs]);
  unsigned int v18 = [v17 containsObject:v9];

  if (!v18)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteURLManager sharedManager](&OBJC_CLASS___GKInviteURLManager, "sharedManager"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 acceptingInProgressRecordIDs]);
    [v24 addObject:v9];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"acceptShareWithShareMetadata"));
    BOOL v26 = [v6 participantStatus] != (id)2;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100098750;
    v33[3] = &unk_100270138;
    id v36 = a1;
    id v34 = v6;
    BOOL v37 = v26;
    id v27 = v25;
    id v35 = v27;
    [v27 perform:v33];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10009882C;
    v29[3] = &unk_10026B1E8;
    id v30 = v9;
    id v31 = v27;
    v32 = v7;
    id v28 = v27;
    [v28 notifyOnMainQueueWithBlock:v29];

    goto LABEL_19;
  }

  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers(v19);
  }
  id v21 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Already processing same share metadata, returning.",  buf,  2u);
  }

  if (v7) {
    goto LABEL_17;
  }
LABEL_19:
}

+ (void)handleLegacyShareMetadata:(id)a3 needsAccept:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"acceptShareWithShareMetadata"));
  if (v6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100098A30;
    v18[3] = &unk_10026BF18;
    v18[4] = v8;
    void v18[6] = a1;
    v18[5] = v10;
    id v11 = v18;
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100098C24;
    v17[3] = &unk_10026BF18;
    v17[4] = v8;
    v17[5] = v10;
    v17[6] = a1;
    id v11 = v17;
  }

  [v10 perform:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100098F24;
  v14[3] = &unk_10026B030;
  id v15 = v10;
  id v16 = v9;
  id v12 = v10;
  id v13 = v9;
  [v12 notifyOnMainQueueWithBlock:v14];
}

+ (void)acceptShareMetadata:(id)a3 retryCount:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc(&OBJC_CLASS___CKAcceptSharesOperation);
  id v25 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v12 = -[CKAcceptSharesOperation initWithShareMetadatas:](v10, "initWithShareMetadatas:", v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKAcceptSharesOperation setConfiguration:](v12, "setConfiguration:", v13);

  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_1000990F8;
  id v20 = &unk_1002701D8;
  id v22 = v9;
  id v23 = a1;
  id v21 = v8;
  int v24 = a4;
  id v14 = v9;
  id v15 = v8;
  -[CKAcceptSharesOperation setAcceptSharesCompletionBlock:](v12, "setAcceptSharesCompletionBlock:", &v17);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions",  v17,  v18,  v19,  v20));
  [v16 addOperation:v12];
}

+ (id)packFakeRealTimeBulletinWithZoneData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  BOOL v6 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "packFakeRealTimeBulletinWithZoneData: %@",  buf,  0xCu);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v10 = [v9 currentEnvironment];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentGame]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryCredentialForEnvironment:v10 gameID:v13]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_100287A60,  GKPushCommandKey);
  v83 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playerInternal]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v16, @"i");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"session-token"]);
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"session-token"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v18, @"s");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"s");
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"playerID"]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"playerID"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v20, @"I");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"I");
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-push-token"]);

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-push-token"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v22, @"P");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"P");
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-nat-type"]);

  if (v23)
  {
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-nat-type"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v24, @"N");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"N");
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-nat-ip"]);

  if (v25)
  {
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-nat-ip"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v26, @"A");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"A");
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-blob"]);

  if (v27)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-blob"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v28, @"B");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"B");
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"blob-type"]);

  if (v29)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"blob-type"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v30, @"g");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &stru_10027B720, @"g");
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"self-nat-type"]);
  id v32 = [v31 integerValue];

  *(void *)buf = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue([&stru_10027B720 dataUsingEncoding:4]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  (char *)[v33 length] + 2));
  [v34 appendBytes:buf length:1];
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"matchType"]);
  id v36 = [v35 integerValue];

  BOOL v85 = v36 == (id)1;
  [v34 appendBytes:&v85 length:1];
  [v34 appendData:v33];
  [v34 appendBytes:&unk_1001F2F48 length:1];
  BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"inviteVersion"]);
  uint64_t v38 = [v37 unsignedIntValue];

  uint64_t v84 = v38;
  [v34 appendBytes:&v84 length:1];
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v34 base64EncodedStringWithOptions:0]);
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v39,  @"s",  0LL));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"g"]);

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"g"]);
    [v40 setObject:v42 forKey:@"g"];
  }

  else
  {
    [v40 setObject:&stru_10027B720 forKey:@"g"];
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"a"]);

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"a"]);
    [v40 setObject:v44 forKey:@"a"];
  }

  else
  {
    [v40 setObject:&stru_10027B720 forKey:@"a"];
  }

  uint64_t v45 = GKTransportPseudonymKey;
  uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKTransportPseudonymKey]);
  v47 = (void *)v46;
  if (v46) {
    v48 = (const __CFString *)v46;
  }
  else {
    v48 = &stru_10027B720;
  }
  [v40 setObject:v48 forKey:v45];

  uint64_t v49 = GKInviteSessionIDKey;
  uint64_t v50 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKInviteSessionIDKey]);
  v51 = (void *)v50;
  if (v50) {
    v52 = (const __CFString *)v50;
  }
  else {
    v52 = &stru_10027B720;
  }
  [v40 setObject:v52 forKey:v49];

  uint64_t v53 = GKSuggestedTransportVersionPushShortKey;
  v54 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKSuggestedTransportVersionPushShortKey]);
  if (v54)
  {
    [v40 setObject:v54 forKey:v53];
  }

  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
    [v40 setObject:v55 forKey:v53];
  }

  uint64_t v56 = GKInviteArchivedParticipantInfoKey;
  v57 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKInviteArchivedParticipantInfoKey]);

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v56]);
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchiveObjectWithData:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchiveObjectWithData:",  v58));

    uint64_t v60 = GKInviteGameParticipantsKey;
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:GKInviteGameParticipantsKey]);

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v60]);
      [v40 setObject:v62 forKey:v60];
    }

    uint64_t v63 = GKInviteLobbyParticipantsKey;
    v64 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:GKInviteLobbyParticipantsKey]);

    if (v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v63]);
      [v40 setObject:v65 forKey:v63];
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v40, @"x");
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v67 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundle-id"]);
  v68 = (void *)v67;
  if (v67) {
    v69 = (const __CFString *)v67;
  }
  else {
    v69 = &stru_10027B720;
  }
  [v66 setObject:v69 forKey:@"i"];

  uint64_t v70 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundle-version"]);
  v71 = (void *)v70;
  if (v70) {
    v72 = (const __CFString *)v70;
  }
  else {
    v72 = &stru_10027B720;
  }
  [v66 setObject:v72 forKey:@"v"];

  uint64_t v73 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"short-bundle-version"]);
  v74 = (void *)v73;
  if (v73) {
    v75 = (const __CFString *)v73;
  }
  else {
    v75 = &stru_10027B720;
  }
  [v66 setObject:v75 forKey:@"V"];

  uint64_t v76 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"adam-id"]);
  v77 = (void *)v76;
  if (v76) {
    v78 = (const __CFString *)v76;
  }
  else {
    v78 = &stru_10027B720;
  }
  [v66 setObject:v78 forKey:@"a"];

  uint64_t v79 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"p"]);
  v80 = (void *)v79;
  if (v79) {
    v81 = (const __CFString *)v79;
  }
  else {
    v81 = &stru_10027B720;
  }
  [v66 setObject:v81 forKey:@"p"];

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v66, @"d");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  GKInviteIsFromMessageKey);

  return v7;
}

+ (id)packFakeTurnBasedBulletinWithZoneData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v7 = [v6 currentEnvironment];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentGame]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryCredentialForEnvironment:v7 gameID:v10]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &off_100287A78,  GKPushCommandKey);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerInternal]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, @"i");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_10027B720, @"m");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, @"t");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"session-id"]);
  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"session-id"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, @"s");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_10027B720, @"s");
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"playerID"]);

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"playerID"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, @"I");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_10027B720, @"I");
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bundle-id"]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bundle-id"]);
    [v19 setObject:v21 forKey:@"i"];
  }

  else
  {
    [v19 setObject:&stru_10027B720 forKey:@"i"];
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bundle-version"]);

  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bundle-version"]);
    [v19 setObject:v23 forKey:@"v"];
  }

  else
  {
    [v19 setObject:&stru_10027B720 forKey:@"v"];
  }

  int v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"short-bundle-version"]);

  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"short-bundle-version"]);
    [v19 setObject:v25 forKey:@"V"];
  }

  else
  {
    [v19 setObject:&stru_10027B720 forKey:@"V"];
  }

  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"adam-id"]);

  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"adam-id"]);
    [v19 setObject:v27 forKey:@"a"];
  }

  else
  {
    [v19 setObject:&stru_10027B720 forKey:@"a"];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, @"d");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  GKInviteIsFromMessageKey);

  return v4;
}

+ (void)generateAndStoreInviteBulletinForRecord:(id)a3 database:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKInviteURLManager sharedManager](&OBJC_CLASS___GKInviteURLManager, "sharedManager"));
  unsigned int v8 = [v7 isRecordEqualToMostRecentInviteShare:v5];

  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"connectionData"]);

    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKCloudKitMultiplayer.m",  556LL,  "+[GKCloudKitMultiplayer generateAndStoreInviteBulletinForRecord:database:]"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v12));

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10009A5E0;
      v17[3] = &unk_10026B170;
      id v18 = v5;
      id v19 = v6;
      [v13 perform:v17];
      [v13 notifyOnMainQueueWithBlock:&stru_100270220];
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers(v11);
      }
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
        sub_10009AFB4();
      }
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v9);
    }
    id v15 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_10009B014(v15, v5);
    }
  }
}

+ (id)msgServiceQueue
{
  if (qword_1002BB518 != -1) {
    dispatch_once(&qword_1002BB518, &stru_100270240);
  }
  return (id)qword_1002BB510;
}

+ (void)deleteInviteRecordWithRecordID:(id)a3 fromDatabase:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a4;
    id v7 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
    id v12 = v5;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    uint64_t v9 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v7,  "initWithRecordsToSave:recordIDsToDelete:",  0LL,  v8);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009AC84;
    v10[3] = &unk_100270268;
    id v11 = v5;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v9, "setModifyRecordsCompletionBlock:", v10);
    [v6 addOperation:v9];
  }
}

@end