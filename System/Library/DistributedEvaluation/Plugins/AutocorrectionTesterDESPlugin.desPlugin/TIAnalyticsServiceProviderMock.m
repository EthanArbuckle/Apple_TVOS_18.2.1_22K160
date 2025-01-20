@interface TIAnalyticsServiceProviderMock
- (NSMutableDictionary)allEvents;
- (TIAnalyticsServiceProviderMock)init;
- (double)sumFloatField:(id)a3 forEvent:(id)a4;
- (double)sumFloatField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5;
- (double)sumFloatField:(id)a3 forEvents:(id)a4;
- (id)eventsWithName:(id)a3;
- (int64_t)countEvent:(id)a3;
- (int64_t)countEvent:(id)a3 filteredWithPredicate:(id)a4;
- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4;
- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5;
- (int64_t)sumIntegerField:(id)a3 forEvents:(id)a4;
- (void)clear;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4;
@end

@implementation TIAnalyticsServiceProviderMock

- (TIAnalyticsServiceProviderMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIAnalyticsServiceProviderMock;
  v2 = -[TIAnalyticsServiceProviderMock init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    allEvents = v2->_allEvents;
    v2->_allEvents = v3;
  }

  return v2;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3));
  [v7 addObject:v6];
}

- (id)eventsWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock allEvents](self, "allEvents"));
  id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock allEvents](self, "allEvents"));
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (int64_t)countEvent:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3));
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)countEvent:(id)a3 filteredWithPredicate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v6]);

  id v9 = [v8 count];
  return (int64_t)v9;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4));
  int64_t v8 = -[TIAnalyticsServiceProviderMock sumIntegerField:forEvents:](self, "sumIntegerField:forEvents:", v6, v7);

  return v8;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 filteredArrayUsingPredicate:v8]);

  int64_t v12 = -[TIAnalyticsServiceProviderMock sumIntegerField:forEvents:](self, "sumIntegerField:forEvents:", v9, v11);
  return v12;
}

- (int64_t)sumIntegerField:(id)a3 forEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    int64_t v9 = 0LL;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) objectForKey:v5]);
        v9 += (int64_t)[v12 integerValue];
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  else
  {
    int64_t v9 = 0LL;
  }

  return v9;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4));
  -[TIAnalyticsServiceProviderMock sumFloatField:forEvents:](self, "sumFloatField:forEvents:", v6, v7);
  double v9 = v8;

  return v9;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 filteredArrayUsingPredicate:v8]);

  -[TIAnalyticsServiceProviderMock sumFloatField:forEvents:](self, "sumFloatField:forEvents:", v9, v11);
  double v13 = v12;

  return v13;
}

- (double)sumFloatField:(id)a3 forEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) objectForKey:v5]);
        [v12 floatValue];
        double v10 = v10 + v13;
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void)clear
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TIAnalyticsServiceProviderMock allEvents](self, "allEvents"));
  [v2 removeAllObjects];
}

- (NSMutableDictionary)allEvents
{
  return self->_allEvents;
}

- (void).cxx_destruct
{
}

@end