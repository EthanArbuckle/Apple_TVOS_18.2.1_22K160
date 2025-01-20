@interface SagaUploadItemPlayDataOperation
- (void)main;
@end

@implementation SagaUploadItemPlayDataOperation

- (void)main
{
  id v46 = [[MSVXPCTransaction alloc] initWithName:@"SagaUploadItemPlayDataOperation"];
  [v46 beginTransaction];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v3 setClientIdentity:v4];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v44 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v5 sagaLastItemPlayDataUploadDate]);
  [v42 timeIntervalSinceReferenceDate];
  double v7 = v6;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyRemoteLocationID,  200LL));
  v61[0] = v40;
  uint64_t v41 = ML3TrackPropertyPlayCountRecent;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:"));
  v60[0] = v38;
  uint64_t v39 = ML3TrackPropertySkipCountRecent;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:"));
  v60[1] = v8;
  uint64_t v9 = ML3TrackPropertyDatePlayed;
  uint64_t v37 = ML3TrackPropertyDatePlayed;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v9,  v10,  4LL));
  v60[2] = v11;
  uint64_t v12 = ML3TrackPropertyDateSkipped;
  uint64_t v36 = ML3TrackPropertyDateSkipped;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v12,  v13,  4LL));
  v60[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 4LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v15));
  v61[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v17));
  v45 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v5,  v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v59[0] = ML3TrackPropertyStoreSagaID;
  v59[1] = v41;
  v59[2] = v39;
  v59[3] = v37;
  v59[4] = v36;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 5LL));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000A89AC;
  v52[3] = &unk_1001A69B8;
  id v23 = v42;
  id v53 = v23;
  id v24 = v20;
  id v54 = v24;
  id v25 = v21;
  id v55 = v25;
  id v26 = v43;
  id v56 = v26;
  [v19 enumeratePersistentIDsAndProperties:v22 usingBlock:v52];

  v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v58 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Sending item property changes: %{public}@",  buf,  0xCu);
  }

  if ([v24 count])
  {
    v28 = v44;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](v44, "connection"));
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:]( ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:itemIDs:properties:useLongIDs:",  [v29 databaseID],  v24,  v25,  0));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000A8BB4;
    v50[3] = &unk_1001A6E30;
    v50[4] = v44;
    v31 = dispatch_semaphore_create(0LL);
    v51 = v31;
    [v29 sendRequest:v30 withResponseHandler:v50];
    dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    v32 = v45;
    if ((id)-[CloudLibraryOperation status](v44, "status") == (id)1)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_1000A8D44;
      v47[3] = &unk_1001A69E0;
      v47[4] = v44;
      id v48 = v26;
      id v49 = v45;
      [v49 performDatabaseTransactionWithBlock:v47];
    }
  }

  else
  {
    v28 = v44;
    -[CloudLibraryOperation setStatus:](v44, "setStatus:", 1LL);
    v32 = v45;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](v28, "musicLibrary"));
  uint64_t v34 = MSVTCCIdentityForCurrentProcess();
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v33 setClientIdentity:v35];

  [v46 endTransaction];
}

@end