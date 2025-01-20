@interface SAAlarmUpdate
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmUpdate

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  id v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmUpdate modifications](self, "modifications"));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 alarmId]);
        id v14 = sub_10022AD80(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        -[NSMutableArray addObject:](v6, "addObject:", v15);
        v16 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[SAAlarmUpdate(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
          __int16 v28 = 2112;
          v29 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Searching for alarm %@ in order to do an update",  buf,  0x16u);
        }

        v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v15));
        if (!v17)
        {
          v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v17, v15);
        }

        -[NSMutableArray addObject:](v17, "addObject:", v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v9);
  }

  v20[0] = (void (*)(void, void))_NSConcreteStackBlock;
  v20[1] = (void (*)(void, void))3221225472LL;
  v20[2] = (void (*)(void, void))sub_10022ADFC;
  v20[3] = (void (*)(void, void))&unk_1004F6F28;
  v20[5] = (void (*)(void, void))v5;
  id v21 = v19;
  v20[4] = (void (*)(void, void))v6;
  id v18 = v19;
  sub_1001796AC(v20);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFUpdateAlarmResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 alarmIdentifiers]);
    v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = sub_10022AC38(*(void **)(*((void *)&v16 + 1) + 8LL * (void)v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableArray addObject:](v6, "addObject:", v13, (void)v16);

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___SAAlarmUpdateCompleted);
    [v14 setAlarmIds:v6];
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

@end