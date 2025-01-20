@interface NIServerFindingServiceObserverRelay
+ (id)sharedInstance;
- (NIServerFindingServiceObserverRelay)init;
- (id).cxx_construct;
- (id)observerTokens;
- (void)_cleanupStaleObservers;
- (void)addObserver:(id)a3 identifier:(id)a4 token:(id)a5;
- (void)relayToObserversForToken:(id)a3 blockToRelay:(id)a4;
- (void)removeObserverWithIdentifier:(id)a3;
@end

@implementation NIServerFindingServiceObserverRelay

+ (id)sharedInstance
{
  if (qword_1007F9A28 != -1) {
    dispatch_once(&qword_1007F9A28, &stru_1007B52D0);
  }
  return (id)qword_1007F9A20;
}

- (NIServerFindingServiceObserverRelay)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerFindingServiceObserverRelay;
  v2 = -[NIServerFindingServiceObserverRelay init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;
  }

  return v2;
}

- (void)addObserver:(id)a3 identifier:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Add observer to relay: %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  [*((id *)self + 1) setObject:v8 forKey:v9];
  [*((id *)self + 2) setObject:v10 forKey:v9];
  std::mutex::unlock((std::mutex *)((char *)self + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServicePool sharedInstance]( &OBJC_CLASS___NIServerFindingServicePool,  "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceForToken:v10 createIfNotExists:0]);
  [v13 relayInfoToNewObserver:v8];
}

- (void)removeObserverWithIdentifier:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 2) objectForKey:v4]);

  if (v5)
  {
    v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-ses,Remove observer from relay: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    [*((id *)self + 1) removeObjectForKey:v4];
    [*((id *)self + 2) removeObjectForKey:v4];
  }

  std::mutex::unlock((std::mutex *)((char *)self + 24));
}

- (id)observerTokens
{
  uint64_t v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 2) allValues]);
  std::mutex::unlock(v3);
  return v4;
}

- (void)relayToObserversForToken:(id)a3 blockToRelay:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, void *))a4;
  std::mutex::lock((std::mutex *)((char *)self + 24));
  -[NIServerFindingServiceObserverRelay _cleanupStaleObservers](self, "_cleanupStaleObservers");
  int v7 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) keyEnumerator]);
  for (i = 0LL; ; i = (void *)v9)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 nextObject]);

    if (!v9) {
      break;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) objectForKey:v9]);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 2) objectForKey:v9]);
      v12 = v11;
      if (v11)
      {
      }
    }
  }

  std::mutex::unlock((std::mutex *)((char *)self + 24));
}

- (void)_cleanupStaleObservers
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1001BDF60;
  v11 = sub_1001BDF70;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (void *)*((void *)self + 2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001C534C;
  v6[3] = &unk_1007B52F8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)v8[5];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001C53C4;
  v5[3] = &unk_1007B2298;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  _Block_object_dispose(&v7, 8);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 850045863LL;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 10) = 0LL;
  return self;
}

@end