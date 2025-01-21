@interface WiFiUserSettingsStore
- (BOOL)syncingEnabled;
- (CWFKeyValueStore)userSettingsKVS;
- (WiFiUserSettingsStore)init;
- (id)keyDidChangeHandler;
- (void)_kvsDidChangeWithKeys:(id)a3 isExternal:(BOOL)a4;
- (void)_setupKVSHandler;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAutoInstantHotspotMode:(int64_t)a3;
- (void)setKeyDidChangeHandler:(id)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)setUserSettingsKVS:(id)a3;
@end

@implementation WiFiUserSettingsStore

- (WiFiUserSettingsStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiUserSettingsStore;
  v2 = -[WiFiUserSettingsStore init](&v7, "init");
  if (!v2)
  {
LABEL_8:

    return 0LL;
  }

  v3 = -[CWFKeyValueStore initWithType:identifier:]( objc_alloc(&OBJC_CLASS___CWFKeyValueStore),  "initWithType:identifier:",  5LL,  @"com.apple.wifi.user-settings");
  userSettingsKVS = v2->_userSettingsKVS;
  v2->_userSettingsKVS = v3;

  if (!v2->_userSettingsKVS)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Error: User Settings CWFKeyValueStore alloc failed" message:4];
    }
    objc_autoreleasePoolPop(v6);
    goto LABEL_8;
  }

  -[WiFiUserSettingsStore _setupKVSHandler](v2, "_setupKVSHandler");
  return v2;
}

- (void)_setupKVSHandler
{
  id from = 0LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001299B4;
  v3[3] = &unk_1001E5C08;
  objc_copyWeak(&v4, &from);
  -[CWFKeyValueStore setEventHandler:](self->_userSettingsKVS, "setEventHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
}

- (void)_kvsDidChangeWithKeys:(id)a3 isExternal:(BOOL)a4
{
  id v6 = a3;
  if (!-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: KVS change disregarded, syncing not enabled" message:3 v21];
    }
    goto LABEL_25;
  }

  if (!a4)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: local changed to KVS keys='%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v6 message];
    }
LABEL_25:
    objc_autoreleasePoolPop(v20);
    objc_super v7 = 0LL;
    goto LABEL_20;
  }

  objc_super v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v22 = v6;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
  uint64_t v12 = CWFUserSettingsStoreAskToJoinModeKey;
  uint64_t v13 = CWFUserSettingsStoreAutoHotspotModeKey;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      if ([v15 isEqualToString:v12])
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CWFKeyValueStore objectForKey:](self->_userSettingsKVS, "objectForKey:", v12));
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, v12);
        v17 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: ask to join value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16 message];
        }
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CWFKeyValueStore objectForKey:](self->_userSettingsKVS, "objectForKey:", v13));
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, v13);
        v17 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: hotspot mode value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16 message];
        }
      }

      objc_autoreleasePoolPop(v17);
    }

    id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v10);
LABEL_17:

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore keyDidChangeHandler](self, "keyDidChangeHandler"));
  if (v18)
  {
    v19 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[WiFiUserSettingsStore keyDidChangeHandler]( self,  "keyDidChangeHandler"));
    ((void (**)(void, NSMutableDictionary *))v19)[2](v19, v7);
  }

  id v6 = v22;
LABEL_20:
}

- (void)setAutoInstantHotspotMode:(int64_t)a3
{
  if (-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v5 setObject:v6 forKey:CWFUserSettingsStoreAutoHotspotModeKey];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    [v8 synchronize];
  }

  else
  {
    objc_super v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: auto hotspot mode change disregarded, syncing not enabled (new value: %ld)" message:3,  "-[WiFiUserSettingsStore setAutoInstantHotspotMode:]",  a3];
    }
    objc_autoreleasePoolPop(v7);
  }

- (void)setAskToJoinMode:(int64_t)a3
{
  if (-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v5 setObject:v6 forKey:CWFUserSettingsStoreAskToJoinModeKey];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    [v8 synchronize];
  }

  else
  {
    objc_super v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: ask to join mode change disregarded, syncing not enabled (new value: %ld)" message:3,  "-[WiFiUserSettingsStore setAskToJoinMode:]",  a3];
    }
    objc_autoreleasePoolPop(v7);
  }

- (void)setSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_syncingEnabled = a3;
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    v5 = @"not enabled";
    if (v3) {
      v5 = @"enabled";
    }
    [(id)qword_100219F60 WFLog:3, "%s: syncing is %@", "-[WiFiUserSettingsStore setSyncingEnabled:]", v5 message];
  }

  objc_autoreleasePoolPop(v4);
}

- (BOOL)syncingEnabled
{
  return self->_syncingEnabled;
}

- (id)keyDidChangeHandler
{
  return self->_keyDidChangeHandler;
}

- (void)setKeyDidChangeHandler:(id)a3
{
}

- (CWFKeyValueStore)userSettingsKVS
{
  return self->_userSettingsKVS;
}

- (void)setUserSettingsKVS:(id)a3
{
}

- (void).cxx_destruct
{
}

@end