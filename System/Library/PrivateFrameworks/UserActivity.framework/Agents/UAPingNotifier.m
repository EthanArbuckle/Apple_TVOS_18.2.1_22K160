@interface UAPingNotifier
- (BOOL)active;
- (NSMutableSet)pongItems;
- (UAPingNotifier)initWithManager:(id)a3;
- (id)items;
- (id)statusString;
- (int64_t)pongCount;
- (void)setItems:(id)a3;
- (void)setPongCount:(int64_t)a3;
@end

@implementation UAPingNotifier

- (UAPingNotifier)initWithManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UAPingNotifier;
  v3 = -[UAActivityNotifier initWithManager:name:](&v7, "initWithManager:name:", a3, @"PingNotifier");
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    pongItems = v3->_pongItems;
    v3->_pongItems = (NSMutableSet *)v4;
  }

  return v3;
}

- (BOOL)active
{
  return 0;
}

- (id)items
{
  return 0LL;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned int v6 = [v5 debugEnablePinging];

  if (v6)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v15 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activityType]);
          unsigned int v14 = [v13 isEqual:@"com.apple.ping"];

          if (v14)
          {
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472LL;
            v16[2] = sub_100003D60;
            v16[3] = &unk_1000BCC30;
            v16[4] = v12;
            v16[5] = self;
            [v12 requestPayloadWithCompletionHandler:v16];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v9);
    }

    id v4 = v15;
  }
}

- (id)statusString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingNotifier pongItems](self, "pongItems"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"PingNotifier: %ld outstanding PONG responses; %ld total pongs sent.",
                   [v3 count],
                   -[UAPingNotifier pongCount](self, "pongCount")));

  id v5 = [v4 copy];
  return v5;
}

- (NSMutableSet)pongItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (int64_t)pongCount
{
  return self->_pongCount;
}

- (void)setPongCount:(int64_t)a3
{
  self->_pongCount = a3;
}

- (void).cxx_destruct
{
}

@end