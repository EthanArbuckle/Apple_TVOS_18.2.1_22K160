@interface ACCAccessoryAuthorizationStore
+ (BOOL)removeAccessory:(id)a3;
+ (BOOL)storeAccessory:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4;
+ (id)sharedStore;
+ (id)storedAccessories;
+ (id)storedCertSerialStrings;
- (ACCAccessoryAuthorizationStore)init;
- (NSUserDefaults)userDefaults;
- (void)dealloc;
- (void)setUserDefaults:(id)a3;
@end

@implementation ACCAccessoryAuthorizationStore

- (ACCAccessoryAuthorizationStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCAccessoryAuthorizationStore;
  v2 = -[ACCAccessoryAuthorizationStore init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    unsigned int v5 = [@"com.apple.iapd" isEqualToString:v4];

    if (v5) {
      v6 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
    }
    else {
      v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.iapd");
    }
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 addObserver:v2 selector:"knownAccessoriesDidChange:" name:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACCAccessoryAuthorizationStore;
  -[ACCAccessoryAuthorizationStore dealloc](&v4, "dealloc");
}

+ (id)sharedStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CD8F8;
  block[3] = &unk_100101CB8;
  block[4] = a1;
  if (qword_10011C7A8 != -1) {
    dispatch_once(&qword_10011C7A8, block);
  }
  return (id)qword_10011C7A0;
}

+ (id)storedAccessories
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userDefaults]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForKey:@"KnownAccessories"]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0LL;
    v9 = 0LL;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 objectForKey:v12]);

          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:withAccessoryDict:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "authorizationEntryForCertSerial:withAccessoryDict:",  v12,  v14));

            [v20 addObject:v16];
            v8 = (void *)v14;
            v9 = (void *)v16;
          }

          else
          {
            v8 = (void *)v14;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v7);
  }

  else
  {
    v8 = 0LL;
    v9 = 0LL;
  }

  id v17 = [v20 count];
  if (v17) {
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v20));
  }
  id v18 = v17;

  return v18;
}

+ (id)storedCertSerialStrings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userDefaults]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"KnownAccessories"]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
          objc_msgSend(v2, "addObject:", v11, (void)v15);
        }
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  if ([v2 count]) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));
  }
  else {
    uint64_t v13 = 0LL;
  }

  return v13;
}

+ (BOOL)storeAccessory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___ACCAccessoryAuthorizationEntry);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 certSerialString]),
        id v6 = [v5 length],
        v5,
        v6))
  {
    v23[0] = @"displayName";
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
    v23[1] = @"authorized";
    v24[0] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 authorized]));
    v24[1] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

    uint64_t v10 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userDefaults]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionaryForKey:@"KnownAccessories"]);
    uint64_t v14 = -[NSMutableDictionary initWithDictionary:](v10, "initWithDictionary:", v13);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 certSerialString]);
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v9, v15);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 userDefaults]);
    [v17 setObject:v14 forKey:@"KnownAccessories"];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v18 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userDefaults]);
    unsigned __int8 v21 = [v20 synchronize];
  }

  else
  {
    unsigned __int8 v21 = 0;
  }

  return v21;
}

+ (BOOL)removeAccessory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userDefaults]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"KnownAccessories"]);
  id v8 = -[NSMutableDictionary initWithDictionary:](v4, "initWithDictionary:", v7);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 certSerialString]);
  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userDefaults]);
  [v11 setObject:v8 forKey:@"KnownAccessories"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v12 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 userDefaults]);
  LOBYTE(v6) = [v14 synchronize];

  return (char)v6;
}

+ (id)authorizationEntryForCertSerial:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore sharedStore]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "sharedStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userDefaults]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"KnownAccessories"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v3]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:withAccessoryDict:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "authorizationEntryForCertSerial:withAccessoryDict:",  v3,  v7));
  }
  else {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___ACCAccessoryAuthorizationEntry);
  -[ACCAccessoryAuthorizationEntry setCertSerialString:](v7, "setCertSerialString:", v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"displayName"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    -[ACCAccessoryAuthorizationEntry setDisplayName:](v7, "setDisplayName:", v8);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"authorized"]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    -[ACCAccessoryAuthorizationEntry setAuthorized:](v7, "setAuthorized:", [v10 BOOLValue]);
  }

  return v7;
}

- (NSUserDefaults)userDefaults
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