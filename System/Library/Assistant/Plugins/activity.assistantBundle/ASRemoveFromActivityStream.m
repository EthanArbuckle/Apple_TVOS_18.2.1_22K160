@interface ASRemoveFromActivityStream
- (ASRemoveFromActivityStream)removeFromActivityStreamWithPredicate:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASRemoveFromActivityStream

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASRemoveFromActivityStream fromDate](self, "fromDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASRemoveFromActivityStream toDate](self, "toDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ASDateUtils predicateForEventsWithDateRangeFromDate:toDate:]( &OBJC_CLASS___ASDateUtils,  "predicateForEventsWithDateRangeFromDate:toDate:",  v5,  v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASRemoveFromActivityStream activityType](self, "activityType"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASRemoveFromActivityStream activityType](self, "activityType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier withValue:](&OBJC_CLASS____DKAnyStringIdentifier, "withValue:", v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithIdentifierValue:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithIdentifierValue:",  v10));

      v22[0] = v7;
      v22[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v12));
    }

    else
    {
      id v13 = v7;
    }

    v17 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ASRemoveFromActivityStream performWithCompletion:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s remove activity predicate %@", buf, 0x16u);
    }

    -[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]( self,  "removeFromActivityStreamWithPredicate:completion:",  v13,  v4);
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@",  self));
    v14 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ASRemoveFromActivityStream performWithCompletion:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    if (v4)
    {
      id v15 = [[SACommandFailed alloc] initWithReason:v13];
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dictionary]);
      v4[2](v4, v16);
    }
  }
}

- (ASRemoveFromActivityStream)removeFromActivityStreamWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ASStorageUtils duetStoreForCommand:](&OBJC_CLASS___ASStorageUtils, "duetStoreForCommand:", self));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[ASRemoveFromActivityStream streamType](self, "streamType"));
  v10 = (void *)v9;
  v11 = @"com.apple.internal.siri.guidance";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier type](&OBJC_CLASS____DKAnyStringIdentifier, "type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:valueType:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:valueType:",  v12,  v13));

  id v15 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]";
    __int16 v29 = 2112;
    v30 = v14;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%s deleting activities from streams [%@] with predicate [%@]",  buf,  0x20u);
  }

  v26 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v6,  v16,  0LL,  0LL,  0LL));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  void v22[2] = sub_44A0;
  v22[3] = &unk_C420;
  id v24 = v8;
  id v25 = v7;
  id v23 = v17;
  id v18 = v8;
  id v19 = v7;
  id v20 = v17;
  [v18 executeQuery:v20 responseQueue:0 withCompletion:v22];

  return result;
}

@end