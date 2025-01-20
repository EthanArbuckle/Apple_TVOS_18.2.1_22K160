@interface KTFlags
- (BOOL)_onqueueContains:(id)a3;
- (KTFlags)initWithQueue:(id)a3 flags:(id)a4;
- (NSMutableDictionary)flagConditions;
- (NSMutableSet)flags;
- (NSSet)allowableFlags;
- (OS_dispatch_queue)queue;
- (id)conditionForFlag:(id)a3;
- (id)contentsAsString;
- (id)description;
- (id)dumpFlags;
- (void)_onqueueRemoveFlag:(id)a3;
- (void)_onqueueSetFlag:(id)a3;
- (void)setFlag:(id)a3;
- (void)setFlagConditions:(id)a3;
- (void)setFlags:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation KTFlags

- (KTFlags)initWithQueue:(id)a3 flags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___KTFlags;
  v9 = -[KTFlags init](&v29, "init");
  v10 = v9;
  if (v9)
  {
    id v24 = v7;
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    flags = v10->_flags;
    v10->_flags = (NSMutableSet *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    flagConditions = v10->_flagConditions;
    v10->_flagConditions = v13;

    objc_storeStrong((id *)&v10->_allowableFlags, a4);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v19);
          v21 = objc_alloc_init(&OBJC_CLASS___KTCondition);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](v10, "flagConditions"));
          [v22 setObject:v21 forKeyedSubscript:v20];

          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v17);
    }

    id v7 = v24;
  }

  return v10;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags contentsAsString](self, "contentsAsString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<KTFlags: %@>", v2));

  return v3;
}

- (id)contentsAsString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);
  }

  else
  {
    id v7 = @"none";
  }

  return v7;
}

- (id)dumpFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

- (BOOL)_onqueueContains:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (void)_onqueueSetFlag:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  [v6 addObject:v4];
}

- (id)conditionForFlag:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)setFlag:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014D168;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueRemoveFlag:(id)a3
{
  id v14 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags allowableFlags](self, "allowableFlags"));
  unsigned __int8 v7 = [v6 containsObject:v14];

  if ((v7 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"KTFlags.m", 72, @"state machine tried to handle unknown flag %@", v14 object file lineNumber description];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  [v8 removeObject:v14];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
  [v10 fulfill];

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___KTCondition);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  [v12 setObject:v11 forKeyedSubscript:v14];
}

- (NSMutableDictionary)flagConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFlagConditions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)flags
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSSet)allowableFlags
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end