@interface ASFetchActivityStream
- (ASFetchActivityStream)fetchActivityStreamWithPredicate:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASFetchActivityStream

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream fromDate](self, "fromDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream toDate](self, "toDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]( &OBJC_CLASS___ASDateUtils,  "predicateForEventsWithDateRangeFromDate:toDate:",  v5,  v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v8 addObject:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream activityType](self, "activityType"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream activityType](self, "activityType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier withValue:](&OBJC_CLASS____DKAnyStringIdentifier, "withValue:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithIdentifierValue:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithIdentifierValue:",  v11));

      if (v12) {
        [v8 addObject:v12];
      }
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream matchingMetadataKeys](self, "matchingMetadataKeys"));
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForObjectsWithMetadataKey:]( &OBJC_CLASS____DKQuery,  "predicateForObjectsWithMetadataKey:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v17)));
          if (v18) {
            [v8 addObject:v18];
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v15);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[ASFetchActivityStream matchingMetadataKeysAndStringValues]( self,  "matchingMetadataKeysAndStringValues"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_26E4;
    v25[3] = &unk_C398;
    id v20 = v8;
    id v26 = v20;
    [v19 enumerateKeysAndObjectsUsingBlock:v25];

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v20));
    v22 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ASFetchActivityStream performWithCompletion:]";
      __int16 v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%s fetch activity predicate %@", buf, 0x16u);
    }

    -[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]( self,  "fetchActivityStreamWithPredicate:completion:",  v21,  v4);

    id v23 = v26;
    goto LABEL_21;
  }

  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@",  self));
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_7744();
    if (!v4) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  if (v4)
  {
LABEL_20:
    id v23 = [[SACommandFailed alloc] initWithReason:v20];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dictionary]);
    v4[2](v4, v24);

LABEL_21:
  }

- (ASFetchActivityStream)fetchActivityStreamWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ASStorageUtils duetStoreForCommand:](&OBJC_CLASS___ASStorageUtils, "duetStoreForCommand:", self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream limit](self, "limit"));
  id v10 = [v9 integerValue];

  if (!v10)
  {
    v11 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]";
      __int16 v58 = 2048;
      id v10 = &stru_3D8 + 16;
      uint64_t v59 = 1000LL;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%s limit is 0. Defaulting to kMaxActivityStreamSize = %zu",  buf,  0x16u);
    }

    else
    {
      id v10 = &stru_3D8 + 16;
    }
  }

  id v47 = objc_alloc_init(&OBJC_CLASS___SAActivityStream);
  v12 = &AFSharedResourcesDirectory_ptr;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream streamTypes](self, "streamTypes"));
  id v14 = [v13 count];
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream streamTypes](self, "streamTypes"));
  id v18 = [v17 count];

  if (v18)
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream streamTypes](self, "streamTypes"));
    id v21 = [v20 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v21)
    {
      id v22 = v21;
      id v46 = v7;
      id v23 = v8;
      id v24 = v6;
      uint64_t v25 = *(void *)v53;
      do
      {
        id v26 = 0LL;
        do
        {
          if (*(void *)v53 != v25) {
            objc_enumerationMutation(v20);
          }
          id v27 = sub_2BF4((uint64_t)v21, *(void **)(*((void *)&v52 + 1) + 8LL * (void)v26));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          [v16 addObject:v28];

          id v26 = (char *)v26 + 1;
        }

        while (v22 != v26);
        id v21 = [v20 countByEnumeratingWithState:&v52 objects:v66 count:16];
        id v22 = v21;
      }

      while (v21);
      id v6 = v24;
      v8 = v23;
      id v7 = v46;
      v12 = &AFSharedResourcesDirectory_ptr;
    }
  }

  else
  {
    id v29 = sub_2BF4(v19, @"com.apple.internal.siri.guidance");
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v29);
    [v16 addObject:v20];
  }

  id v30 = objc_alloc_init((Class)v12[22]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream sortBy](self, "sortBy"));
  unsigned int v32 = [v31 isEqualToString:SAActivityStreamSortDescriptorStartDateValue];

  if (v32)
  {
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[_DKQuery startDateSortDescriptorAscending:]( &OBJC_CLASS____DKQuery,  "startDateSortDescriptorAscending:",  -[ASFetchActivityStream ascending](self, "ascending")));
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream sortBy](self, "sortBy"));
    unsigned int v35 = [v34 isEqualToString:SAActivityStreamSortDescriptorEndDateValue];

    if (!v35) {
      goto LABEL_23;
    }
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[_DKQuery endDateSortDescriptorAscending:]( &OBJC_CLASS____DKQuery,  "endDateSortDescriptorAscending:",  -[ASFetchActivityStream ascending](self, "ascending")));
  }

  v36 = (void *)v33;
  [v30 addObject:v33];

LABEL_23:
  v37 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v37;
    uint64_t v39 = objc_claimAutoreleasedReturnValue(-[ASFetchActivityStream streamTypes](self, "streamTypes"));
    v40 = (void *)v39;
    v41 = @"com.apple.internal.siri.guidance";
    if (v39) {
      v41 = (const __CFString *)v39;
    }
    *(_DWORD *)buf = 136316162;
    v57 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]";
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v41;
    __int16 v60 = 2112;
    id v61 = v6;
    __int16 v62 = 2048;
    id v63 = v10;
    __int16 v64 = 2112;
    id v65 = v30;
    _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_DEFAULT,  "%s querying streams [%@] with predicate [%@] limit [%zd] sortDescriptors [%@]",  buf,  0x34u);
  }

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_2C60;
  v48[3] = &unk_C3C0;
  id v49 = (id)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v6,  v16,  0LL,  v10,  v30));
  id v50 = v47;
  id v51 = v7;
  id v42 = v7;
  id v43 = v47;
  id v44 = v49;
  [v8 executeQuery:v44 responseQueue:0 withCompletion:v48];

  return result;
}

@end