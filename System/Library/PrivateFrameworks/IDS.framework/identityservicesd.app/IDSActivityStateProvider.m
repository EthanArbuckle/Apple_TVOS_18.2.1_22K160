@interface IDSActivityStateProvider
- (BOOL)hasActiveSubscription;
- (IDSActivityStateProvider)initWithUserDefaults:(id)a3;
- (IMUserDefaults)userDefaults;
- (NSSet)storedActivityTopics;
- (id)storedDescriptionForActivity:(id)a3;
- (id)storedSubscriptionsForActivity:(id)a3;
- (id)storedUpdatesForActivity:(id)a3;
- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4;
- (void)setStoredActivityTopics:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)storeActivityDescription:(id)a3 forActivity:(id)a4;
- (void)storeSubscription:(id)a3 forActivity:(id)a4;
- (void)storeUpdates:(id)a3 forActivity:(id)a4;
@end

@implementation IDSActivityStateProvider

- (IDSActivityStateProvider)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSActivityStateProvider;
  v6 = -[IDSActivityStateProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

- (NSSet)storedActivityTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"activityTopics"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v8);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
          {

            goto LABEL_13;
          }

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v14 = objc_alloc(&OBJC_CLASS___NSSet);
    v15 = -[NSSet initWithArray:](v14, "initWithArray:", v6, (void)v17);
  }

  else
  {
LABEL_13:
    v15 = 0LL;
  }

  return v15;
}

- (void)setStoredActivityTopics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Storing activity topics: %@",  (uint8_t *)&v9,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    [v7 setAppValue:v8 forKey:@"activityTopics"];
  }
}

- (BOOL)hasActiveSubscription
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider storedActivityTopics](self, "storedActivityTopics"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Looking for an active subscription.  Stored activity topics: %@",  buf,  0xCu);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = v3;
  id v24 = [v5 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v24)
  {
    uint64_t v6 = *(void *)v32;
    uint64_t v22 = *(void *)v32;
    v23 = v2;
    v26 = v5;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v25 = v7;
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        int v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSActivityStateProvider storedSubscriptionsForActivity:]( v2,  "storedSubscriptionsForActivity:",  v8,  v22,  v23));
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v8;
          __int16 v38 = 2112;
          v39 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Activity topic %@ found subscriptions %@",  buf,  0x16u);
        }

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v28;
          while (2)
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              id v18 = [v16 compare:v17];

              if (v18 == (id)1)
              {

                BOOL v20 = 1;
                id v5 = v26;
                goto LABEL_25;
              }

              __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Subscription is in the past, continuing...",  buf,  2u);
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v25 + 1;
        uint64_t v6 = v22;
        v2 = v23;
        id v5 = v26;
      }

      while ((id)(v25 + 1) != v24);
      BOOL v20 = 0;
      id v24 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v24);
  }

  else
  {
    BOOL v20 = 0;
  }

- (id)storedDescriptionForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"activityDescriptions",  v4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appValueForKey:v6]);

  if (v7)
  {
    int v9 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___IDSActivityDescription, v8));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v15 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v10,  v7,  &v15));
    id v12 = v15;

    if (v12)
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive description: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)storeActivityDescription:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"activityDescriptions",  a4));
  if (v6)
  {
    id v13 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v13));
    id v9 = v13;
    if (v9)
    {
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to archive description: %@",  buf,  0xCu);
      }
    }

    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
      [v11 setAppValue:v8 forKey:v7];
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
    [v12 setAppValue:0 forKey:v7];
  }
}

- (id)storedUpdatesForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"activityUpdates",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appValueForKey:v5]);

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___IDSActivityUpdate, v10);
    id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSString, v12),  0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v20 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v14,  v7,  &v20));
    id v16 = v20;

    if (v16)
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive updates: %@",  buf,  0xCu);
      }
    }

    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Returning stored updates: %@", buf, 0xCu);
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (void)storeUpdates:(id)a3 forActivity:(id)a4
{
  id v10 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"activityUpdates",  a4));
  if (!v10)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
    [v7 setAppValue:0 forKey:v6];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:"));
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
    [v9 setAppValue:v8 forKey:v6];
  }
}

- (void)storeSubscription:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"subscriptions",  v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appValueForKey:v8]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v11);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
  id v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v14,  objc_opt_class(&OBJC_CLASS___IDSActivityInfo, v15),  0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v27 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v17,  v10,  &v27));
  id v19 = v27;
  if (v19)
  {
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive subscriptions: %@",  buf,  0xCu);
    }
  }

  if (!v18) {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 subActivity]);
  [v18 setValue:v6 forKey:v21];

  id v26 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  &v26));
  id v23 = v26;
  if (v23)
  {
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to archive subscriptions: %@",  buf,  0xCu);
    }
  }

  if (v22)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
    [v25 setAppValue:v22 forKey:v8];
  }
}

- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"subscriptions",  v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appValueForKey:v8]);

  if (v10)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v11);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
    id v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v14,  objc_opt_class(&OBJC_CLASS___IDSActivityInfo, v15),  0LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v24 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v17,  v10,  &v24));
    id v19 = v24;
    if (v19)
    {
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive subscriptions: %@",  buf,  0xCu);
      }
    }

    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    [v18 setValue:0 forKey:v7];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  0LL));
    if (v19)
    {
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Failed to archive subscriptions: %@",  buf,  0xCu);
      }
    }

    if (v21)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
      [v23 setAppValue:v21 forKey:v8];
    }
  }
}

- (id)storedSubscriptionsForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"subscriptions",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider userDefaults](self, "userDefaults"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appValueForKey:v5]);

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    uint64_t v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  objc_opt_class(&OBJC_CLASS___IDSActivityInfo, v12),  0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v20 = 0LL;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v14,  v7,  &v20));
    id v16 = v20;
    if (v16)
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive subscriptions: %@",  buf,  0xCu);
      }
    }

    if (!v15) {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end