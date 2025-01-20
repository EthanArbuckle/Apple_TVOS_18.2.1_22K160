@interface ADIntentsUserActivityManager
- (ADIntentsUserActivityManager)init;
- (id)description;
- (id)userActivityForID:(id)a3;
- (void)reset;
- (void)setUserActivity:(id)a3 forID:(id)a4;
@end

@implementation ADIntentsUserActivityManager

- (ADIntentsUserActivityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADIntentsUserActivityManager;
  v2 = -[ADIntentsUserActivityManager init](&v6, "init");
  if (v2)
  {
    v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
    userActivitiesStore = v2->_userActivitiesStore;
    v2->_userActivitiesStore = v3;
  }

  return v2;
}

- (id)userActivityForID:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_userActivitiesStore, "objectForKey:"));
  if (!v4)
  {
    -[ADIntentsUserActivityManager reset](self, "reset");
    v4 = 0LL;
  }

  return v4;
}

- (void)setUserActivity:(id)a3 forID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    -[ADIntentsUserActivityManager reset](self, "reset");
    userActivitiesStore = self->_userActivitiesStore;
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](userActivitiesStore, "setObject:forKey:", v8, v6);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](userActivitiesStore, "removeObjectForKey:", v6);
    }
  }
}

- (void)reset
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADIntentsUserActivityManager;
  id v3 = -[ADIntentsUserActivityManager description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](self->_userActivitiesStore, "description"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:v5]);

  return v6;
}

- (void).cxx_destruct
{
}

@end