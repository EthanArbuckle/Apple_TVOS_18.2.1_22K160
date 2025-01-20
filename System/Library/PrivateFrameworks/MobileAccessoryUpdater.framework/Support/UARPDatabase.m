@interface UARPDatabase
+ (id)sharedDatabase;
- (NSArray)activeAccessories;
- (NSArray)pendingConsentRequests;
- (NSArray)periodicLaunchAccessories;
- (UARPDatabase)init;
- (id)accessoryArrayForDictionary:(id)a3;
- (id)activeAccessoryDictionary;
- (id)consentArrayForDictionary:(id)a3;
- (id)dasActivitiesDictionary;
- (id)getDASActivitiesForServiceName:(id)a3;
- (id)pendingConsentRequestsDictionary;
- (id)periodicLaunchAccessoryDictionary;
- (id)unarchiveConsentData:(id)a3 forAccessory:(id)a4;
- (id)unarchiveDASActivitiesData:(id)a3;
- (id)unarchiveInternalAccessoryData:(id)a3 forUUID:(id)a4;
- (void)addAccessoryToPeriodicLaunchCache:(id)a3 uuid:(id)a4;
- (void)addActiveAccessory:(id)a3;
- (void)addDASActivities:(id)a3 serviceName:(id)a4;
- (void)addPendingConsentRequest:(id)a3;
- (void)dealloc;
- (void)dumpActiveAccessories:(id)a3;
- (void)dumpConsentPendingAccessories:(id)a3;
- (void)dumpDASActivities:(id)a3;
- (void)dumpPeriodicLaunchCache:(id)a3;
- (void)dumpToFile:(id)a3;
- (void)purgePeriodicLaunchCache;
- (void)removeActiveAccessoryForUUID:(id)a3;
- (void)removeActiveAccessoryForUUID:(id)a3 isUpdate:(BOOL)a4;
- (void)removeAllActiveAccessories;
- (void)removeDASActivitiesForServiceName:(id)a3;
- (void)removePendingConsentRequest:(id)a3;
- (void)removePeriodicLaunchCacheAccessoryForUUID:(id)a3;
- (void)setActiveAccessories:(id)a3;
- (void)setDASActivities:(id)a3;
- (void)setPendingConsentRequests:(id)a3;
- (void)setPeriodicLaunchCache:(id)a3;
- (void)updateActiveAccessory:(id)a3;
@end

@implementation UARPDatabase

+ (id)sharedDatabase
{
  if (qword_10008E338 != -1) {
    dispatch_once(&qword_10008E338, &stru_1000755A0);
  }
  return (id)qword_10008E330;
}

- (UARPDatabase)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPDatabase;
  v2 = -[UARPDatabase init](&v4, "init");
  if (v2)
  {
    v2->_database = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.uarp.database");
    _CFPreferencesSetBackupDisabled( @"com.apple.uarp.database",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost,  0LL,  1LL);
    v2->_log = os_log_create("com.apple.accessoryupdater.uarp", "database");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPDatabase;
  -[UARPDatabase dealloc](&v3, "dealloc");
}

- (id)accessoryArrayForDictionary:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = -[UARPDatabase unarchiveInternalAccessoryData:forUUID:]( self,  "unarchiveInternalAccessoryData:forUUID:",  [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)],  *(void *)(*((void *)&v12 + 1) + 8 * (void)v9));
        if (v10) {
          [v5 addObject:v10];
        }
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5);
}

- (NSArray)activeAccessories
{
  return (NSArray *)-[UARPDatabase accessoryArrayForDictionary:]( self,  "accessoryArrayForDictionary:",  -[UARPDatabase activeAccessoryDictionary](self, "activeAccessoryDictionary"));
}

- (void)addActiveAccessory:(id)a3
{
  id v5 = -[UARPDatabase activeAccessoryDictionary](self, "activeAccessoryDictionary");
  if (!v5) {
    id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  uint64_t v7 = 0LL;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v7);
  if (v6)
  {
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  v6,  objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"), "UUIDString"));
    -[UARPDatabase setActiveAccessories:](self, "setActiveAccessories:", v5);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000487AC();
  }

  -[UARPDatabase removePeriodicLaunchCacheAccessoryForUUID:]( self,  "removePeriodicLaunchCacheAccessoryForUUID:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"));
}

- (void)updateActiveAccessory:(id)a3
{
  if ((unint64_t)objc_msgSend( -[UARPDatabase activeAccessoryDictionary](self, "activeAccessoryDictionary"),  "count") < 0x65)
  {
    -[UARPDatabase removeActiveAccessoryForUUID:isUpdate:]( self,  "removeActiveAccessoryForUUID:isUpdate:",  objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"),  1);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_10004881C(log, v6, v7, v8, v9, v10, v11, v12);
    }
    -[UARPDatabase setActiveAccessories:](self, "setActiveAccessories:", 0LL);
  }

  -[UARPDatabase addActiveAccessory:](self, "addActiveAccessory:", a3);
}

- (void)removeActiveAccessoryForUUID:(id)a3 isUpdate:(BOOL)a4
{
  id v7 = -[UARPDatabase activeAccessoryDictionary](self, "activeAccessoryDictionary");
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(a3, "UUIDString"));
    if (v9)
    {
      if (!a4) {
        -[UARPDatabase addAccessoryToPeriodicLaunchCache:uuid:](self, "addAccessoryToPeriodicLaunchCache:uuid:", v9, a3);
      }
      objc_msgSend(v8, "removeObjectForKey:", objc_msgSend(a3, "UUIDString"));
      -[UARPDatabase setActiveAccessories:](self, "setActiveAccessories:", v8);
    }
  }

- (void)removeActiveAccessoryForUUID:(id)a3
{
}

- (void)removeAllActiveAccessories
{
}

- (id)activeAccessoryDictionary
{
  return  objc_msgSend( -[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"ActiveAccessories"),  "mutableCopy");
}

- (void)setActiveAccessories:(id)a3
{
}

- (id)unarchiveInternalAccessoryData:(id)a3 forUUID:(id)a4
{
  uint64_t v7 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  +[UARPAccessoryInternal encodedClasses](&OBJC_CLASS___UARPAccessoryInternal, "encodedClasses"),  a3,  &v7);
  if (!v5 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10004888C();
  }
  return v5;
}

- (id)periodicLaunchAccessoryDictionary
{
  return  objc_msgSend( -[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"PeriodicLaunchCache"),  "mutableCopy");
}

- (void)setPeriodicLaunchCache:(id)a3
{
}

- (NSArray)periodicLaunchAccessories
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = -[UARPDatabase accessoryArrayForDictionary:]( self,  "accessoryArrayForDictionary:",  -[UARPDatabase periodicLaunchAccessoryDictionary](self, "periodicLaunchAccessoryDictionary"));
  objc_msgSend(v3, "addObjectsFromArray:", -[UARPDatabase activeAccessories](self, "activeAccessories"));
  [v3 addObjectsFromArray:v4];
  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3);
}

- (void)addAccessoryToPeriodicLaunchCache:(id)a3 uuid:(id)a4
{
  id v7 = -[UARPDatabase periodicLaunchAccessoryDictionary](self, "periodicLaunchAccessoryDictionary");
  if (!v7) {
    id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, objc_msgSend(a4, "UUIDString"));
  -[UARPDatabase setPeriodicLaunchCache:](self, "setPeriodicLaunchCache:", v7);
}

- (void)removePeriodicLaunchCacheAccessoryForUUID:(id)a3
{
  id v5 = -[UARPDatabase periodicLaunchAccessoryDictionary](self, "periodicLaunchAccessoryDictionary");
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, "removeObjectForKey:", objc_msgSend(a3, "UUIDString"));
    -[UARPDatabase setPeriodicLaunchCache:](self, "setPeriodicLaunchCache:", v6);
  }

- (void)purgePeriodicLaunchCache
{
}

- (NSArray)pendingConsentRequests
{
  return (NSArray *)-[UARPDatabase consentArrayForDictionary:]( self,  "consentArrayForDictionary:",  -[UARPDatabase pendingConsentRequestsDictionary](self, "pendingConsentRequestsDictionary"));
}

- (id)pendingConsentRequestsDictionary
{
  return  objc_msgSend( -[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"PendingConsentRequests"),  "mutableCopy");
}

- (void)setPendingConsentRequests:(id)a3
{
}

- (void)addPendingConsentRequest:(id)a3
{
  id v5 = -[UARPDatabase pendingConsentRequestsDictionary](self, "pendingConsentRequestsDictionary");
  if (!v5) {
    id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  uint64_t v7 = 0LL;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v7);
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, objc_msgSend(a3, "accessoryName"));
    -[UARPDatabase setPendingConsentRequests:](self, "setPendingConsentRequests:", v5);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000488F4();
  }

- (void)removePendingConsentRequest:(id)a3
{
  id v5 = -[UARPDatabase pendingConsentRequestsDictionary](self, "pendingConsentRequestsDictionary");
  if (v5)
  {
    id v6 = v5;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(a3, "accessoryName")))
    {
      objc_msgSend(v6, "removeObjectForKey:", objc_msgSend(a3, "accessoryName"));
      -[UARPDatabase setPendingConsentRequests:](self, "setPendingConsentRequests:", v6);
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_100048960(a3, log);
      }
    }
  }

- (id)consentArrayForDictionary:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = -[UARPDatabase unarchiveConsentData:forAccessory:]( self,  "unarchiveConsentData:forAccessory:",  [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)],  *(void *)(*((void *)&v12 + 1) + 8 * (void)v9));
        if (v10) {
          [v5 addObject:v10];
        }
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5);
}

- (id)unarchiveConsentData:(id)a3 forAccessory:(id)a4
{
  uint64_t v7 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___UARPConsent),  a3,  &v7);
  if (!v5 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10004888C();
  }
  return v5;
}

- (id)dasActivitiesDictionary
{
  return  objc_msgSend( -[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"DASActivities"),  "mutableCopy");
}

- (void)setDASActivities:(id)a3
{
}

- (void)addDASActivities:(id)a3 serviceName:(id)a4
{
  id v7 = -[UARPDatabase dasActivitiesDictionary](self, "dasActivitiesDictionary");
  if (!v7) {
    id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  uint64_t v11 = 0LL;
  id v8 = [a3 mutableCopy];
  if ([v7 objectForKeyedSubscript:a4])
  {
    id v9 = -[UARPDatabase unarchiveDASActivitiesData:]( self,  "unarchiveDASActivitiesData:",  [v7 objectForKeyedSubscript:a4]);
    if (v9) {
      [v8 addObjectsFromArray:v9];
    }
  }

  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v11);
  if (v10)
  {
    [v7 setObject:v10 forKeyedSubscript:a4];
    -[UARPDatabase setDASActivities:](self, "setDASActivities:", v7);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000489E4();
  }
}

- (id)getDASActivitiesForServiceName:(id)a3
{
  id v5 = -[UARPDatabase dasActivitiesDictionary](self, "dasActivitiesDictionary");
  id result = [v5 objectForKeyedSubscript:a3];
  if (result) {
    return -[UARPDatabase unarchiveDASActivitiesData:]( self,  "unarchiveDASActivitiesData:",  [v5 objectForKeyedSubscript:a3]);
  }
  return result;
}

- (void)removeDASActivitiesForServiceName:(id)a3
{
  id v5 = -[UARPDatabase dasActivitiesDictionary](self, "dasActivitiesDictionary");
  if ([v5 objectForKeyedSubscript:a3])
  {
    [v5 removeObjectForKey:a3];
    -[UARPDatabase setDASActivities:](self, "setDASActivities:", v5);
  }

- (id)unarchiveDASActivitiesData:(id)a3
{
  uint64_t v8 = 0LL;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterDASMatchingRule),  0LL),  a3,  &v8);
  if (!v6 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100048A50();
  }
  return v6;
}

- (void)dumpActiveAccessories:(id)a3
{
  id v4 = -[UARPDatabase activeAccessories](self, "activeAccessories");
  [a3 appendFormat:@"Active Accessories:\n"];
  if (-[NSArray count](v4, "count"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) dumpWithTabDepth:1 dumpString:a3];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    [a3 appendWithTabDepth:1 format:@"No active accessories present.\n"];
  }

- (void)dumpPeriodicLaunchCache:(id)a3
{
  id v4 = -[UARPDatabase accessoryArrayForDictionary:]( self,  "accessoryArrayForDictionary:",  -[UARPDatabase periodicLaunchAccessoryDictionary](self, "periodicLaunchAccessoryDictionary"));
  [a3 appendFormat:@"Periodic Launch Cache:\n"];
  if ([v4 count])
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) dumpWithTabDepth:1 dumpString:a3];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }
  }

  else
  {
    [a3 appendWithTabDepth:1 format:@"No accessories present in periodic launch cache.\n"];
  }

- (void)dumpConsentPendingAccessories:(id)a3
{
  id v4 = -[UARPDatabase consentArrayForDictionary:]( self,  "consentArrayForDictionary:",  -[UARPDatabase pendingConsentRequestsDictionary](self, "pendingConsentRequestsDictionary"));
  [a3 appendFormat:@"Consent Pending Requests:\n"];
  if ([v4 count])
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) dumpWithTabDepth:1 dumpString:a3];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }
  }

  else
  {
    [a3 appendWithTabDepth:1 format:@"No Pending Consent Requests present.\n"];
  }

- (void)dumpDASActivities:(id)a3
{
  id v5 = -[UARPDatabase dasActivitiesDictionary](self, "dasActivitiesDictionary");
  [a3 appendFormat:@"DAS Activities:\n"];
  if ([v5 count])
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = [v5 allKeys];
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          [a3 appendWithTabDepth:1, @"Service Name: %@", v10 format];
          id v11 = -[UARPDatabase unarchiveDASActivitiesData:]( self,  "unarchiveDASActivitiesData:",  [v5 objectForKeyedSubscript:v10]);
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) dumpWithTabDepth:2 dumpString:a3];
              }

              id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }

            while (v13);
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v7);
    }
  }

  else
  {
    [a3 appendWithTabDepth:1 format:@"No DAS Activities present.\n"];
  }

- (void)dumpToFile:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_100048B24((uint64_t)a3, log, v6, v7, v8, v9, v10, v11);
  }
  id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  -[UARPDatabase dumpActiveAccessories:](self, "dumpActiveAccessories:", v12);
  -[UARPDatabase dumpPeriodicLaunchCache:](self, "dumpPeriodicLaunchCache:", v12);
  -[UARPDatabase dumpConsentPendingAccessories:](self, "dumpConsentPendingAccessories:", v12);
  -[UARPDatabase dumpDASActivities:](self, "dumpDASActivities:", v12);
  uint64_t v13 = 0LL;
  [a3 stringByExpandingTildeInPath];
  if ((objc_msgSend( v12,  "writeToFile:atomically:encoding:error:",  objc_msgSend(a3, "stringByExpandingTildeInPath"),  1,  4,  &v13) & 1) == 0 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100048AB8();
  }

@end