@interface ASRecordActivity
- (ASRecordActivity)recordActivityWithCompletion:(id)a3;
- (id)duetEvent;
- (id)duetEventStream;
- (void)_recordActivityWithCompletion:(id)a3;
- (void)deleteActivitiesOlderThanDays:(int64_t)a3 withCompletion:(id)a4;
- (void)deleteOlderSessionActivities:(id)a3 withCompletion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASRecordActivity

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userActivity]);

  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___NSUserActivity);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 type]);
    v10 = -[NSUserActivity initWithActivityType:](v7, "initWithActivityType:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userActivity]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
    -[NSUserActivity setTitle:](v10, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userActivity]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
    -[NSUserActivity setUserInfo:](v10, "setUserInfo:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userActivity]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 keywords]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));
    -[NSUserActivity setKeywords:](v10, "setKeywords:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userActivity]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 requiredUserInfoKeys]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
    -[NSUserActivity setRequiredUserInfoKeys:](v10, "setRequiredUserInfoKeys:", v24);

    -[NSUserActivity setEligibleForHandoff:](v10, "setEligibleForHandoff:", 0LL);
    -[NSUserActivity setEligibleForSearch:](v10, "setEligibleForSearch:", 0LL);
    -[NSUserActivity setEligibleForPublicIndexing:](v10, "setEligibleForPublicIndexing:", 0LL);
    -[NSUserActivity becomeCurrent](v10, "becomeCurrent");
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 type]);

  if (!v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@",  self));
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      sub_79BC();
      if (!v4) {
        goto LABEL_8;
      }
    }

    else if (!v4)
    {
LABEL_8:

      goto LABEL_9;
    }

    id v28 = [[SACommandFailed alloc] initWithReason:v27];
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dictionary]);
    v4[2](v4, v29);

    goto LABEL_8;
  }

  -[ASRecordActivity recordActivityWithCompletion:](self, "recordActivityWithCompletion:", v4);
LABEL_9:
}

- (id)duetEventStream
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 streamType]);
  v4 = (void *)v3;
  v5 = @"com.apple.internal.siri.guidance";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier type](&OBJC_CLASS____DKAnyStringIdentifier, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:valueType:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:valueType:",  v6,  v7));

  return v8;
}

- (id)duetEvent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier withValue:](&OBJC_CLASS____DKAnyStringIdentifier, "withValue:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v9 = [v8 count];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:960.0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DKApplicationActivityMetadataKey expirationDate]( &OBJC_CLASS____DKApplicationActivityMetadataKey,  "expirationDate"));
    [v12 setObject:v14 forKeyedSubscript:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity duetEventStream](self, "duetEventStream"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v27 startDate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ASDateUtils eventStartDateFromDate:](&OBJC_CLASS___ASDateUtils, "eventStartDateFromDate:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 endDate]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ASDateUtils eventEndDateFromDate:](&OBJC_CLASS___ASDateUtils, "eventEndDateFromDate:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:value:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:value:metadata:",  v16,  v18,  v21,  v5,  v22));

    v24 = (void *)v23;
    v25 = v27;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity duetEventStream](self, "duetEventStream"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v16 startDate]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ASDateUtils eventStartDateFromDate:](&OBJC_CLASS___ASDateUtils, "eventStartDateFromDate:", v25));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 endDate]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ASDateUtils eventEndDateFromDate:](&OBJC_CLASS___ASDateUtils, "eventEndDateFromDate:", v19));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:value:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:value:",  v12,  v17,  v20,  v5));
  }

  return v24;
}

- (void)deleteActivitiesOlderThanDays:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ASStorageUtils duetStoreForCommand:](&OBJC_CLASS___ASStorageUtils, "duetStoreForCommand:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ASDateUtils subtractDays:fromDate:](&OBJC_CLASS___ASDateUtils, "subtractDays:fromDate:", a3, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartAndEndInDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartAndEndInDateRangeFrom:to:",  v10,  v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity duetEventStream](self, "duetEventStream"));
  v20 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v11,  v13,  0LL,  0LL,  0LL));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_51E0;
  v17[3] = &unk_C448;
  id v18 = v7;
  id v19 = v6;
  id v15 = v7;
  id v16 = v6;
  [v15 executeQuery:v14 responseQueue:0 withCompletion:v17];
}

- (void)deleteOlderSessionActivities:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ASStorageUtils duetStoreForCommand:](&OBJC_CLASS___ASStorageUtils, "duetStoreForCommand:", self));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity duetEventStream](self, "duetEventStream"));
  id v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  0LL,  v10,  0LL,  0LL,  0LL));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_555C;
  v15[3] = &unk_C498;
  id v17 = v8;
  id v18 = v7;
  id v16 = v6;
  id v12 = v8;
  id v13 = v6;
  id v14 = v7;
  [v12 executeQuery:v11 responseQueue:0 withCompletion:v15];
}

- (ASRecordActivity)recordActivityWithCompletion:(id)a3
{
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_5A70;
  id v18 = &unk_C4C0;
  id v19 = self;
  id v4 = a3;
  id v20 = v4;
  v5 = objc_retainBlock(&v15);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ASStorageUtils duetStoreForCommand:]( &OBJC_CLASS___ASStorageUtils,  "duetStoreForCommand:",  self,  v15,  v16,  v17,  v18,  v19));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS____DKKnowledgeStore);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    ((void (*)(void ***, uint64_t, void))v5[2])(v5, 1LL, 0LL);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity activity](self, "activity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"sessionId"]);

    id v12 = (os_log_s *)AFSiriLogContextService;
    BOOL v13 = os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[ASRecordActivity recordActivityWithCompletion:]";
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v11;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%s deleting activities recorded for session id %@",  buf,  0x16u);
      }

      -[ASRecordActivity deleteOlderSessionActivities:withCompletion:]( self,  "deleteOlderSessionActivities:withCompletion:",  v11,  v5);
    }

    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[ASRecordActivity recordActivityWithCompletion:]";
        __int16 v23 = 2048;
        uint64_t v24 = 3LL;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s deleting activities older than %zd days", buf, 0x16u);
      }

      -[ASRecordActivity deleteActivitiesOlderThanDays:withCompletion:]( self,  "deleteActivitiesOlderThanDays:withCompletion:",  3LL,  v5);
    }
  }

  return result;
}

- (void)_recordActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ASStorageUtils duetStoreForCommand:](&OBJC_CLASS___ASStorageUtils, "duetStoreForCommand:", self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordActivity duetEvent](self, "duetEvent"));
  uint64_t v7 = (os_log_s *)AFSiriLogContextService;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[ASRecordActivity _recordActivityWithCompletion:]";
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s asking CoreDuet to save event %@", buf, 0x16u);
    }

    id v20 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_5DBC;
    v18[3] = &unk_C4E8;
    id v19 = v4;
    [v5 saveObjects:v8 responseQueue:0 withCompletion:v18];

    id v9 = v19;
    goto LABEL_8;
  }

  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_7B00(v7, v10, v11, v12, v13, v14, v15, v16);
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  if (v4)
  {
LABEL_7:
    id v9 = [[SACommandFailed alloc] initWithReason:@"can't create Duet event"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
    (*((void (**)(id, void *))v4 + 2))(v4, v17);

LABEL_8:
  }

@end