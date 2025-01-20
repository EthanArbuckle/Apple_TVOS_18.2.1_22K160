@interface GKCloudKitMultiplayerUtils
+ (BOOL)isCloudDriveEnabledForBundleID:(id)a3;
+ (BOOL)shouldRetryForError:(id)a3 andRetryCount:(int)a4;
+ (id)cloudKitOperationConfigurationForContainer:(id)a3;
+ (id)cloudKitOperationConfigurationForSocialGamingSessionsContainer;
+ (id)privateDatabase;
+ (id)sharedDatabase;
+ (void)createZoneWithName:(id)a3 handler:(id)a4;
+ (void)fetchShareRecordsWithRecordIDs:(id)a3 inDatabase:(id)a4 handler:(id)a5;
+ (void)fetchUserRecordIDWithHandler:(id)a3;
+ (void)saveInviteRecord:(id)a3 database:(id)a4 retryCount:(int)a5 completionHandler:(id)a6;
@end

@implementation GKCloudKitMultiplayerUtils

+ (BOOL)isCloudDriveEnabledForBundleID:(id)a3
{
  id v3 = a3;
  v4 = (void *)TCCAccessCopyInformation(kTCCServiceUbiquity);
  if (![v4 count])
  {

    v4 = &__NSArray0__struct;
  }

  v5 = (void *)TCCAccessCopyInformation(kTCCServiceLiverpool);
  if (![v5 count])
  {

    v5 = &__NSArray0__struct;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 arrayByAddingObjectsFromArray:v5]);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    v20 = v5;
    v21 = v4;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v12 = (__CFBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTCCInfoBundle, v20, v21, (void)v22));
        v13 = v12;
        if (v12)
        {
          CFStringRef Identifier = CFBundleGetIdentifier(v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(Identifier);
          if ([v15 isEqualToString:v3])
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kTCCInfoGranted]);
            unsigned int v17 = [v16 BOOLValue];

            if (!v17)
            {

              BOOL v18 = 0;
              goto LABEL_18;
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    BOOL v18 = 1;
LABEL_18:
    v5 = v20;
    v4 = v21;
  }

  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

+ (void)createZoneWithName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v7,  CKCurrentUserDefaultName);
  uint64_t v9 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", v7);

  -[CKRecordZone setZoneID:](v9, "setZoneID:", v8);
  v10 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v9));
  v12 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v10,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v11,  0LL);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKModifyRecordZonesOperation setConfiguration:](v12, "setConfiguration:", v13);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000F7F84;
  v16[3] = &unk_1002726A0;
  id v17 = v6;
  id v14 = v6;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v12, "setModifyRecordZonesCompletionBlock:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 privateDatabase]);
  [v15 addOperation:v12];
}

+ (id)cloudKitOperationConfigurationForContainer:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CKOperationConfiguration);
  -[CKOperationConfiguration setContainer:](v4, "setContainer:", v3);

  -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](v4, "setDiscretionaryNetworkBehavior:", 0LL);
  -[CKOperationConfiguration setAutomaticallyRetryNetworkFailures:](v4, "setAutomaticallyRetryNetworkFailures:", 0LL);
  -[CKOperationConfiguration setQualityOfService:](v4, "setQualityOfService:", 17LL);
  return v4;
}

+ (id)cloudKitOperationConfigurationForSocialGamingSessionsContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8078;
  block[3] = &unk_100271FA0;
  block[4] = a1;
  if (qword_1002BB6B8 != -1) {
    dispatch_once(&qword_1002BB6B8, block);
  }
  return (id)qword_1002BB6B0;
}

+ (void)fetchShareRecordsWithRecordIDs:(id)a3 inDatabase:(id)a4 handler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v12 count])
  {
    v10 = -[CKFetchRecordsOperation initWithRecordIDs:]( objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation),  "initWithRecordIDs:",  v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 cloudKitOperationConfigurationForSocialGamingSessionsContainer]);
    -[CKFetchRecordsOperation setConfiguration:](v10, "setConfiguration:", v11);

    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v10, "setFetchRecordsCompletionBlock:", v9);
    [v8 addOperation:v10];
  }

  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

+ (void)fetchUserRecordIDWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions"));
  [v4 fetchUserRecordIDWithCompletionHandler:v3];
}

+ (id)privateDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 privateCloudDatabase]);

  return v3;
}

+ (id)sharedDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.socialgaming.sessions"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedCloudDatabase]);

  return v3;
}

+ (void)saveInviteRecord:(id)a3 database:(id)a4 retryCount:(int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v35 = v10;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v15 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v13,  "initWithRecordsToSave:recordIDsToDelete:",  v14,  0LL);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKCloudKitMultiplayerUtils cloudKitOperationConfigurationForSocialGamingSessionsContainer]( &OBJC_CLASS___GKCloudKitMultiplayerUtils,  "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  -[CKModifyRecordsOperation setConfiguration:](v15, "setConfiguration:", v16);

  -[CKModifyRecordsOperation setSavePolicy:](v15, "setSavePolicy:", 0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKCloudKitMultiplayerUtils.m",  131LL,  "+[GKCloudKitMultiplayerUtils saveInviteRecord:database:retryCount:completionHandler:]"));
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v17));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000F8504;
  v27[3] = &unk_100272768;
  v19 = v15;
  v28 = v19;
  id v20 = v18;
  id v29 = v20;
  id v21 = v10;
  id v30 = v21;
  id v22 = v11;
  id v31 = v22;
  id v33 = a1;
  int v34 = a5;
  id v23 = v12;
  id v32 = v23;
  [v20 perform:v27];
  if (v23)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000F8BA8;
    v24[3] = &unk_10026B030;
    id v26 = v23;
    id v25 = v20;
    [v25 notifyOnMainQueueWithBlock:v24];
  }
}

+ (BOOL)shouldRetryForError:(id)a3 andRetryCount:(int)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

  BOOL v8 = 0;
  if (a4 < 1 || !v7) {
    goto LABEL_26;
  }
  id v9 = [v5 code];
  if (v9 == (id)2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues", 0));
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v20 = [v19 code];
          if (v20 != (id)23)
          {
            id v20 = [v19 code];
            if (v20 != (id)7) {
              continue;
            }
          }

          if (!os_log_GKGeneral) {
            id v23 = (id)GKOSLoggers(v20);
          }
          __int128 v24 = (os_log_s *)os_log_GKMatch;
          if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v32 = v19;
            __int16 v33 = 1024;
            int v34 = a4;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "should retry for partialError: %@. retryCount: %d",  buf,  0x12u);
          }

          BOOL v8 = 1;
          goto LABEL_26;
        }

        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    goto LABEL_20;
  }

  if (v9 != (id)23 && v9 != (id)7)
  {
LABEL_20:
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:CKErrorRetryAfterKey]);
    BOOL v8 = v22 != 0LL;

    goto LABEL_26;
  }

  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v9);
  }
  id v11 = (os_log_s *)os_log_GKMatch;
  BOOL v8 = 1;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v5;
    __int16 v33 = 1024;
    int v34 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "should retry for error: %@. retryCount: %d",  buf,  0x12u);
  }

@end