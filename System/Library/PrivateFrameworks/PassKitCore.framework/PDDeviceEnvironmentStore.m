@interface PDDeviceEnvironmentStore
- (PDDeviceEnvironmentStore)initWithDatabaseManager:(id)a3;
- (id)fetchCurrentEnviroment;
- (void)notifyClients:(id)a3 currentEnvironment:(id)a4;
- (void)registerClient:(id)a3 withIdentifier:(int64_t)a4;
- (void)start;
@end

@implementation PDDeviceEnvironmentStore

- (PDDeviceEnvironmentStore)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDDeviceEnvironmentStore;
  v6 = -[PDDeviceEnvironmentStore init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clients = v7->_clients;
    v7->_clients = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)registerClient:(id)a3 withIdentifier:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL didStart = self->_didStart;
    clients = self->_clients;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](clients, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"don't register clients twice");
    }

    else
    {
      objc_super v11 = self->_clients;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, v12);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (didStart)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      v16 = v13;
      id v17 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDDeviceEnvironmentStore fetchCurrentEnviroment](self, "fetchCurrentEnviroment"));
      -[PDDeviceEnvironmentStore notifyClients:currentEnvironment:](self, "notifyClients:currentEnvironment:", v14, v15);
    }
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"provide a non-null client");
  }
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didStart) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"don't start the store twice");
  }
  id v5 = -[NSMutableDictionary copy](self->_clients, "copy");
  self->_BOOL didStart = 1;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDeviceEnvironmentStore fetchCurrentEnviroment](self, "fetchCurrentEnviroment"));
  -[PDDeviceEnvironmentStore notifyClients:currentEnvironment:](self, "notifyClients:currentEnvironment:", v5, v4);
}

- (void)notifyClients:(id)a3 currentEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        char v20 = 0;
        id v14 = [v13 integerValue];
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager fetchDeviceEnviromentForClient:andCompareToCurrentEnvironment:didChange:]( self->_databaseManager,  "fetchDeviceEnviromentForClient:andCompareToCurrentEnvironment:didChange:",  v14,  v7,  &v20));
        if (v20)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10030F334;
          v17[3] = &unk_10063A858;
          v17[4] = self;
          id v18 = v7;
          id v19 = v14;
          [v16 environmentStore:self storedEnvironment:v15 differsFromCurrent:v18 commitBlock:v17];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }
}

- (id)fetchCurrentEnviroment
{
  v2 = objc_alloc(&OBJC_CLASS___PKDeviceEnvironment);
  uint64_t v3 = PKCurrentRegion();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale pk_deviceLanguage](&OBJC_CLASS___NSLocale, "pk_deviceLanguage"));
  id v6 = -[PKDeviceEnvironment initWithCountryCode:deviceLanguage:](v2, "initWithCountryCode:deviceLanguage:", v4, v5);

  return v6;
}

- (void).cxx_destruct
{
}

@end