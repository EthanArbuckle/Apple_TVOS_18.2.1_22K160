@interface MCProfileEventsManager
- (MCProfileEventsDataProvider)dataProvider;
- (MCProfileEventsManager)init;
- (MCProfileEventsManager)initWithDataProvider:(id)a3;
- (id)_profileEvents;
- (id)_profileEventsOnDisk;
- (id)_timestampFromEvent:(id)a3;
- (id)earlistProfileEventExpiry;
- (void)_removeAllProfileEvents;
- (void)_saveProfileEvents:(id)a3;
- (void)addEventForProfile:(id)a3 operation:(id)a4 source:(id)a5;
- (void)removeExpiredProfileEvents;
- (void)setDataProvider:(id)a3;
@end

@implementation MCProfileEventsManager

- (MCProfileEventsManager)init
{
  v3 = objc_opt_new(&OBJC_CLASS___MCProfileEventsConcreteDataProvider);
  v4 = -[MCProfileEventsManager initWithDataProvider:](self, "initWithDataProvider:", v3);

  return v4;
}

- (MCProfileEventsManager)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCProfileEventsManager;
  v6 = -[MCProfileEventsManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
  }

  return v7;
}

- (id)earlistProfileEventExpiry
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileEventsManager _timestampFromEvent:]( self,  "_timestampFromEvent:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)));
        v10 = v9;
        if (v9)
        {
          if (v6)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue([v9 earlierDate:v6]);

            if (v11 == v10)
            {
              id v12 = v10;

              id v6 = v12;
            }
          }

          else
          {
            id v6 = v9;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "dateByAddingTimeInterval:",  (double)(int)+[MCFeatureOverrides profileEventsExpirationInterval]( MCFeatureOverrides,  "profileEventsExpirationInterval")));
  return v13;
}

- (void)addEventForProfile:(id)a3 operation:(id)a4 source:(id)a5
{
  id v8 = a4;
  objc_super v9 = (__CFString *)a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents"));
  if (v11) {
    id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v11));
  }
  else {
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  }
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 loggingID]);

  __int128 v15 = @"Unknown";
  v23 = v14;
  if (v9) {
    __int128 v15 = v9;
  }
  v21[0] = @"Process";
  v21[1] = @"Operation";
  v22[0] = v15;
  v22[1] = v8;
  v21[2] = @"Timestamp";
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentTime]);
  v22[2] = v17;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
  v24 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));

  -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v19, 0LL);
  v20 = +[MCFeatureOverrides profileEventsMaxLength](&OBJC_CLASS___MCFeatureOverrides, "profileEventsMaxLength");
  if (-[NSMutableArray count](v13, "count") > v20) {
    -[NSMutableArray removeObjectsInRange:]( v13,  "removeObjectsInRange:",  v20,  (_BYTE *)-[NSMutableArray count](v13, "count") - v20);
  }
  -[MCProfileEventsManager _saveProfileEvents:](self, "_saveProfileEvents:", v13);
}

- (void)removeExpiredProfileEvents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEvents](self, "_profileEvents"));
  id v4 = v3;
  if (v3 && [v3 count])
  {
    __int128 v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentTime]);

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _timestampFromEvent:](self, "_timestampFromEvent:", v12, v16));
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "dateByAddingTimeInterval:",  (double)(int)+[MCFeatureOverrides profileEventsExpirationInterval]( MCFeatureOverrides,  "profileEventsExpirationInterval")));
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 earlierDate:v14]);

            if (v15 == v6) {
              -[NSMutableArray addObject:](v17, "addObject:", v12);
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }

    -[MCProfileEventsManager _saveProfileEvents:](self, "_saveProfileEvents:", v17);
    id v4 = v16;
  }
}

- (id)_profileEventsOnDisk
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 profileEventsFilePath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](&OBJC_CLASS___NSData, "MCDataFromFile:", v3));

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v4,  0LL,  0LL,  0LL));
  }
  else {
    id v5 = 0LL;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSDictionary0__struct;
  }
  id v7 = v6;

  return v7;
}

- (id)_profileEvents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager _profileEventsOnDisk](self, "_profileEventsOnDisk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ProfileEvents"]);

  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_timestampFromEvent:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allValues]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Timestamp"]);
  return v5;
}

- (void)_saveProfileEvents:(id)a3
{
  id v8 = @"ProfileEvents";
  id v9 = a3;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager dataProvider](self, "dataProvider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profileEventsFilePath]);
  [v5 MCWriteToBinaryFile:v7];
}

- (void)_removeAllProfileEvents
{
}

- (MCProfileEventsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end