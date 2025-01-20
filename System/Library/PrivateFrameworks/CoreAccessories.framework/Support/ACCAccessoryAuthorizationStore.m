@interface ACCAccessoryAuthorizationStore
+ (BOOL)removeAccessory:(id)a3;
+ (BOOL)storeAccessory:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4;
+ (id)sharedStore;
+ (id)storedAccessories;
+ (id)storedCertSerialStrings;
- (ACCAccessoryAuthorizationStore)init;
- (void)dealloc;
@end

@implementation ACCAccessoryAuthorizationStore

- (ACCAccessoryAuthorizationStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ACCAccessoryAuthorizationStore;
  v2 = -[ACCAccessoryAuthorizationStore init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v3 addObserver:v2 selector:"knownAccessoriesDidChange:" name:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];
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
  block[2] = __45__ACCAccessoryAuthorizationStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_once != -1) {
    dispatch_once(&sharedStore_once, block);
  }
  return (id)sharedStore_sharedInstance;
}

void __45__ACCAccessoryAuthorizationStore_sharedStore__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedStore_sharedInstance;
  sharedStore_sharedInstance = (uint64_t)v1;
}

+ (id)storedAccessories
{
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"KnownAccessories"]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0LL;
    v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v11]);

          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:withAccessoryDict:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "authorizationEntryForCertSerial:withAccessoryDict:",  v11,  v13));

            [v19 addObject:v15];
            v7 = (void *)v13;
            v8 = (void *)v15;
          }

          else
          {
            v7 = (void *)v13;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  else
  {
    v7 = 0LL;
    v8 = 0LL;
  }

  id v16 = [v19 count];
  if (v16) {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v19));
  }
  id v17 = v16;

  return v17;
}

+ (id)storedCertSerialStrings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForKey:@"KnownAccessories"]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
          objc_msgSend(v2, "addObject:", v10, (void)v14);
        }
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  if ([v2 count]) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
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
    v22[0] = @"displayName";
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
    v23[0] = v7;
    v22[1] = @"authorized";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 authorized]));
    v23[1] = v8;
    v22[2] = @"modified";
    uint64_t v9 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", systemInfo_getCurrentUnixTime());
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v23[2] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));

    uint64_t v12 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryForKey:@"KnownAccessories"]);
    __int128 v15 = -[NSMutableDictionary initWithDictionary:](v12, "initWithDictionary:", v14);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v3 certSerialString]);
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v11, v16);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
    [v17 setObject:v15 forKey:@"KnownAccessories"];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v18 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
    unsigned __int8 v20 = [v19 synchronize];
  }

  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

+ (BOOL)removeAccessory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"KnownAccessories"]);
  id v7 = -[NSMutableDictionary initWithDictionary:](v4, "initWithDictionary:", v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 certSerialString]);
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  [v9 setObject:v7 forKey:@"KnownAccessories"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v10 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  LOBYTE(v8) = [v11 synchronize];

  return (char)v8;
}

+ (id)authorizationEntryForCertSerial:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"KnownAccessories"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:withAccessoryDict:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "authorizationEntryForCertSerial:withAccessoryDict:",  v3,  v6));
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___ACCAccessoryAuthorizationEntry);
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

@end