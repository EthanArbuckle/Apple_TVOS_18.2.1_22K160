@interface SagaUploadPlaylistPlayDataOperation
- (void)main;
@end

@implementation SagaUploadPlaylistPlayDataOperation

- (void)main
{
  id v39 = [[MSVXPCTransaction alloc] initWithName:@"SagaUploadPlaylistPlayDataOperation"];
  [v39 beginTransaction];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v3 setClientIdentity:v4];

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v37 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v5 sagaLastItemPlayDataUploadDate]);
  [v35 timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v34 = ML3ContainerPropertyStoreCloudID;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:"));
  v54[0] = v8;
  uint64_t v33 = ML3ContainerPropertyPlayCountRecent;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:"));
  v53[0] = v9;
  uint64_t v10 = ML3ContainerPropertyDatePlayed;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v10,  v11,  4LL));
  v53[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v13));
  v54[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v15));
  v38 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Container,  "queryWithLibrary:predicate:",  v5,  v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v52[0] = v34;
  v52[1] = v33;
  v52[2] = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 3LL));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100107B0C;
  v45[3] = &unk_1001A69B8;
  id v21 = v35;
  id v46 = v21;
  id v22 = v18;
  id v47 = v22;
  id v23 = v19;
  id v48 = v23;
  id v24 = v36;
  id v49 = v24;
  [v17 enumeratePersistentIDsAndProperties:v20 usingBlock:v45];

  v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v51 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Sending container property changes: %{public}@",  buf,  0xCu);
  }

  if ([v22 count])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](v37, "connection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetContainerPropertyRequest requestWithDatabaseID:containerIDs:properties:]( ICBulkSetContainerPropertyRequest,  "requestWithDatabaseID:containerIDs:properties:",  [v26 databaseID],  v22,  v23));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100107C64;
    v43[3] = &unk_1001A6E30;
    v43[4] = v37;
    v28 = dispatch_semaphore_create(0LL);
    v44 = v28;
    [v26 sendRequest:v27 withResponseHandler:v43];
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    if ((id)-[CloudLibraryOperation status](v37, "status") == (id)1)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100107DF4;
      v40[3] = &unk_1001A69E0;
      v40[4] = v37;
      id v41 = v24;
      id v42 = v38;
      [v42 performDatabaseTransactionWithBlock:v40];
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](v37, "musicLibrary"));
  uint64_t v31 = MSVTCCIdentityForCurrentProcess(v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v29 setClientIdentity:v32];

  [v39 endTransaction];
}

@end