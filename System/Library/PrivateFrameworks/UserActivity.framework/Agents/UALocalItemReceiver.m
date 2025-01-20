@interface UALocalItemReceiver
- (BOOL)receiving;
- (UALocalItemReceiver)initWithManager:(id)a3 controller:(id)a4;
- (UAUserActivityClientProcessesController)controller;
- (id)receivedItems;
- (id)statusString;
@end

@implementation UALocalItemReceiver

- (UALocalItemReceiver)initWithManager:(id)a3 controller:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UALocalItemReceiver;
  v8 = -[UAReceiver initWithManager:name:](&v11, "initWithManager:name:", a3, @"LocalReceiver");
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_controller, a4);
  }

  return v9;
}

- (BOOL)receiving
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UALocalItemReceiver receivedItems](self, "receivedItems"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)receivedItems
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v5 = [v4 debugCrossoverAllActivities];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v20 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UALocalItemReceiver controller](self, "controller"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        unsigned int v13 = [v12 eligibleForHandoff];
        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          if (v5
            && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[UALocalItemReceiver controller](v20, "controller")),
                v16 = (void *)objc_claimAutoreleasedReturnValue([v12 client]),
                unsigned __int8 v17 = [v15 clientIsActive:v16],
                v16,
                v15,
                (v17 & 1) != 0)
            || !sub_10005C3C4((uint64_t)[v12 type]))
          {
            [v3 addObject:v12];
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  id v18 = [v3 copy];
  return v18;
}

- (id)statusString
{
  if (-[UALocalItemReceiver receiving](self, "receiving"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UALocalItemReceiver receivedItems](self, "receivedItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 logString]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"LocalItems:%@",  v5));
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"LocalItems:%@",  @"-"));
  }

  return v6;
}

- (UAUserActivityClientProcessesController)controller
{
  return (UAUserActivityClientProcessesController *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end