@interface SAAlarmAlarmShow
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)_ad_internalAlarmIdentifiers;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmAlarmShow

- (id)_ad_internalAlarmIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmAlarmShow alarmIds](self, "alarmIds"));
  v3 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v2 count]);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = sub_10022AD80(*(void **)(*((void *)&v12 + 1) + 8LL * (void)v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[NSMutableArray addObject:](v3, "addObject:", v10, (void)v12);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4[0] = (void (*)(void, void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void, void))3221225472LL;
  v4[2] = (void (*)(void, void))sub_10022C194;
  v4[3] = (void (*)(void, void))&unk_1004F9658;
  v4[4] = (void (*)(void, void))self;
  id v5 = a3;
  id v3 = v5;
  sub_1001796AC(v4);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    id v6 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

@end