@interface _DASMetricRecorder
+ (id)batchingQueue;
+ (id)metricQueue;
+ (void)aggregateAndPostCAEvents:(id)a3;
+ (void)incrementOccurrencesForKey:(id)a3 byCount:(int64_t)a4;
+ (void)incrementOccurrencesForKeys:(id)a3 byCounts:(id)a4;
+ (void)recordOccurrenceForKey:(id)a3;
@end

@implementation _DASMetricRecorder

+ (id)metricQueue
{
  if (qword_100157B50 != -1) {
    dispatch_once(&qword_100157B50, &stru_1001165D0);
  }
  return (id)qword_100157B58;
}

+ (id)batchingQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B1CC;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B60 != -1) {
    dispatch_once(&qword_100157B60, block);
  }
  return (id)qword_100157B68;
}

+ (void)recordOccurrenceForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 batchingQueue]);
  v7[0] = @"key";
  v7[1] = @"value";
  v8[0] = v4;
  v8[1] = &off_100121ED0;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  [v5 addWorkItem:v6];
}

+ (void)incrementOccurrencesForKey:(id)a3 byCount:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 batchingQueue]);
  v10[0] = @"key";
  v10[1] = @"value";
  v11[0] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  [v7 addWorkItem:v9];
}

+ (void)incrementOccurrencesForKeys:(id)a3 byCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 == [v7 count])
  {
    v9 = (char *)[v6 count];
    if (v9)
    {
      v10 = v9;
      for (i = 0LL; i != v10; ++i)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 batchingQueue]);
        v16[0] = @"key";
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:i]);
        v16[1] = @"value";
        v17[0] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
        v17[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
        [v12 addWorkItem:v15];
      }
    }
  }
}

+ (void)aggregateAndPostCAEvents:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"key"]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10));
        unsigned int v12 = [v11 intValue];

        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
        uint64_t v14 = [v13 intValue] + v12;

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, v10);
      }

      id v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v6);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v16 = v4;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v21));
        unsigned int v23 = [v22 intValue];

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10005B82C;
        v25[3] = &unk_100116618;
        v25[4] = v21;
        unsigned int v26 = v23;
        AnalyticsSendEventLazy(@"come.apple.dasd.metrics", v25);
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    }

    while (v18);
  }
}

@end