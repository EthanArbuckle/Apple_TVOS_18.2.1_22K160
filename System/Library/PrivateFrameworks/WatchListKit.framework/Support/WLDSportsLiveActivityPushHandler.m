@interface WLDSportsLiveActivityPushHandler
- (BOOL)shouldHandleNotification:(id)a3;
- (id)connection;
- (void)createLiveActivityForCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5;
- (void)handleNotification:(id)a3 completion:(id)a4;
@end

@implementation WLDSportsLiveActivityPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "wlk_dictionaryForKey:", @"payload"));
  else {
    v4 = @"liveActivityAutostartEnabled";
  }
  LOBYTE(v5) = 0;
  if (objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", v4, 0))
  {
    if (_os_feature_enabled_impl("TVApp", "sports_app_live_activities"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_stringForKey:", @"trigger"));
      unsigned __int8 v7 = [v6 isEqualToString:@"UpNext"];

      if ((v7 & 1) != 0)
      {
        LOBYTE(v5) = 0;
        goto LABEL_13;
      }
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSystemPreferencesStore sharedPreferences]( &OBJC_CLASS___WLKSystemPreferencesStore,  "sharedPreferences"));
      unsigned int v5 = [v8 sportsScoreSpoilersAllowed];

      if (!v5) {
        goto LABEL_13;
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_stringForKey:", WLKNotificationsKeyType));
    else {
      LOBYTE(v5) = [v9 isEqualToString:@"gameStartWithScore"];
    }
  }

- (void)handleNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "wlk_dictionaryForKey:", @"payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wlk_stringForKey:", @"entityId"));
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wlk_dictionaryForKey:", @"liveActivityAutostart"));
  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  @"liveActivityAutostart");
  }
  id v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wlk_dictionaryForKey:", @"liveActivityAutostart"));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "wlk_stringForKey:", @"actionId"));
    if (v14)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wlk_arrayForKey:", @"actions"));
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        id v23 = v11;
        v24 = v10;
        v25 = v9;
        v26 = v8;
        v27 = self;
        id v28 = v6;
        uint64_t v18 = *(void *)v30;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
            if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "wlk_stringForKey:", @"id"));
              if ([v22 isEqualToString:v14])
              {
                id v17 = v20;

                goto LABEL_19;
              }
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v17) {
            continue;
          }
          break;
        }

- (void)createLiveActivityForCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLDSportsLiveActivityPushHandler connection](self, "connection"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke;
  v17[3] = &unk_10003DC00;
  id v12 = v8;
  id v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxyWithErrorHandler:v17]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke_2;
  v15[3] = &unk_10003DC00;
  id v16 = v12;
  id v14 = v12;
  [v13 createActivityWithCanonicalId:v10 supplementaryData:v9 completion:v15];
}

uint64_t __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.sportsd.session.xpc",  0LL);
    unsigned int v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___WLKSportsCommunicationsProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_13);
    objc_initWeak(&location, self);
    id v8 = self->_connection;
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = __46__WLDSportsLiveActivityPushHandler_connection__block_invoke_55;
    v13 = &unk_10003CA78;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", &v10);
    -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __46__WLDSportsLiveActivityPushHandler_connection__block_invoke(id a1)
{
  uint64_t v1 = WLKPushNotificationsLogObject(a1);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "WLDSportsLiveActivityPushHandler - Connection interrupted.",  v3,  2u);
  }
}

void __46__WLDSportsLiveActivityPushHandler_connection__block_invoke_55(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WLKPushNotificationsLogObject(WeakRetained);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "WLDSportsLiveActivityPushHandler - Connection invalidated.",  v5,  2u);
  }

  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
  }
}

- (void).cxx_destruct
{
}

@end