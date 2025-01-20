@interface CSCoordinator
+ (id)sharedInstance;
- (BOOL)getCollectAllTrustedForDiagnosticID:(id)a3;
- (BOOL)initProxiesForDiagnosticID:(id)a3;
- (BOOL)initiatedByRemoteHost;
- (BOOL)isHost;
- (BOOL)isRemoteInitiated;
- (BOOL)setCollectAllTrusted:(BOOL)a3 forDiagnosticID:(id)a4;
- (BOOL)setHostOutputDir:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)setProxies:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)setRemoteUUIDs:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)shouldGatherCoSysdiagnoses;
- (BOOL)triggerCoSysdiagnosesWithParams:(id)a3 forDiagnosticID:(id)a4;
- (BOOL)tryStartRemoteInitiatedFlowForMsg:(id)a3;
- (BOOL)waitForCoSysdiagnosesForDiagnosticID:(id)a3;
- (CSCoordinator)init;
- (NSDictionary)sessionConfigs;
- (OS_dispatch_group)hostWaitGroup;
- (OS_os_log)logSubsystem;
- (id)gatherLocalSysdiagnoseForMsg:(id)a3 withReply:(id)a4;
- (id)getHostOutputDirForDiagnosticID:(id)a3;
- (id)getProxiesForDiagnosticID:(id)a3;
- (id)getReceiveFileSemaForDiagnosticID:(id)a3;
- (id)getRemoteUUIDsForDiagnosticID:(id)a3;
- (id)waitForHostOutputDirForDiagnosticID:(id)a3;
- (void)addSessionConfig:(id)a3 forDiagnosticID:(id)a4;
- (void)endRemoteInitiatedFlow;
- (void)initRemoteServers;
- (void)readyToReceiveCoSysdiagnosesAtDir:(id)a3 forDiagnosticID:(id)a4;
- (void)removeSessionConfigForDiagnosticID:(id)a3;
- (void)safeLeaveHostWaitGroup;
- (void)setHostWaitGroup:(id)a3;
- (void)setInitiatedByRemoteHost:(BOOL)a3;
- (void)setIsRemoteInitiated:(BOOL)a3;
- (void)setLogSubsystem:(id)a3;
- (void)setSessionConfigs:(id)a3;
- (void)transferFileToHostIfNecessary:(id)a3 forDiagnosticID:(id)a4;
- (void)tryCreateSessionConfigForDiagnosticID:(id)a3;
@end

@implementation CSCoordinator

+ (id)sharedInstance
{
  if (qword_1000A51A0 != -1) {
    dispatch_once(&qword_1000A51A0, &stru_1000890E8);
  }
  return (id)qword_1000A5198;
}

- (CSCoordinator)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSCoordinator;
  v2 = -[CSCoordinator init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isRemoteInitiated = 0;
    hostWaitGroup = v2->_hostWaitGroup;
    v2->_hostWaitGroup = 0LL;

    v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    sessionConfigs = v3->_sessionConfigs;
    v3->_sessionConfigs = v5;

    os_log_t v7 = os_log_create("com.apple.sysdiagnose", "co-sysdiagnose");
    logSubsystem = v3->_logSubsystem;
    v3->_logSubsystem = v7;
  }

  return v3;
}

- (BOOL)isHost
{
  if (!-[CSCoordinator initiatedByRemoteHost](self, "initiatedByRemoteHost")) {
    return +[CSRemoteXPCProxy isHost](&OBJC_CLASS___CSRemoteXPCProxy, "isHost");
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logSubsystem]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: forced to return no for isHost",  v5,  2u);
  }

  return 0;
}

- (id)getRemoteUUIDsForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteUUIDs]);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100053EB4();
      }

      v8 = 0LL;
    }

    objc_sync_exit(v5);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100053E44((os_log_s *)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)setRemoteUUIDs:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v7);
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      uint64_t v12 = (os_log_s *)[v6 copy];
      [v10 setRemoteUUIDs:v12];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 logSubsystem]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100053F90();
      }
    }

    objc_sync_exit(v8);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100053F20((os_log_s *)v10, v14, v15, v16, v17, v18, v19, v20);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)getCollectAllTrustedForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      unsigned __int8 v8 = [v7 shouldCollectAllTrusted];
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10005406C();
      }

      unsigned __int8 v8 = 0;
    }

    objc_sync_exit(v5);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100053FFC((os_log_s *)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setCollectAllTrusted:(BOOL)a3 forDiagnosticID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v6);
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v7, "sessionConfigs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    BOOL v10 = v9 != 0LL;
    if (v9)
    {
      [v9 setShouldCollectAllTrusted:v4];
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logSubsystem]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100054148();
      }
    }

    objc_sync_exit(v7);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_1000540D8((os_log_s *)v9, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)getProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 proxies]);
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100054224();
      }

      unsigned __int8 v8 = 0LL;
    }

    objc_sync_exit(v5);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_1000541B4((os_log_s *)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (BOOL)setProxies:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned __int8 v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      uint64_t v12 = (os_log_s *)[v6 copy];
      [v10 setProxies:v12];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 logSubsystem]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100054300();
      }
    }

    objc_sync_exit(v8);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100054290((os_log_s *)v10, v14, v15, v16, v17, v18, v19, v20);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)getReceiveFileSemaForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 receiveFileSema]);
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000543DC();
      }

      unsigned __int8 v8 = 0LL;
    }

    objc_sync_exit(v5);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10005436C((os_log_s *)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (BOOL)setHostOutputDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned __int8 v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      [v10 setHostOutputDir:v6];
    }

    else
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 logSubsystem]);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000544B8();
      }
    }

    objc_sync_exit(v8);
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v12 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100054448((os_log_s *)v10, v13, v14, v15, v16, v17, v18, v19);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)addSessionConfig:(id)a3 forDiagnosticID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v7, "sessionConfigs"));
  id v9 = [v8 mutableCopy];

  [v9 setObject:v11 forKey:v6];
  id v10 = [v9 copy];
  -[CSCoordinator setSessionConfigs:](v7, "setSessionConfigs:", v10);

  objc_sync_exit(v7);
}

- (void)removeSessionConfigForDiagnosticID:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v4, "sessionConfigs"));
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v8];
  id v7 = [v6 copy];
  -[CSCoordinator setSessionConfigs:](v4, "setSessionConfigs:", v7);

  objc_sync_exit(v4);
}

- (void)tryCreateSessionConfigForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](self, "sessionConfigs"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CSSessionConfig);
    if (v7)
    {
      -[CSCoordinator addSessionConfig:forDiagnosticID:](self, "addSessionConfig:forDiagnosticID:", v7, v4);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100054524(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
}

- (id)getHostOutputDirForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v34 = v4;
  if (!v4)
  {
    obj = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    id v10 = [v9 count];

    if (v10)
    {
      if (v10 == (id)1)
      {
        memset(v39, 0, sizeof(v39));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
        if ([v11 countByEnumeratingWithState:v39 objects:v43 count:16])
        {
          uint64_t v12 = **((void **)&v39[0] + 1);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 hostOutputDir]);

LABEL_26:
          id v7 = obj;
          objc_sync_exit(obj);
          goto LABEL_27;
        }
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100054558((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
      id v26 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v36;
        do
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 logSubsystem]);

            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v29;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CSCoordinator: %@", buf, 0xCu);
            }
          }

          id v26 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }

        while (v26);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
      goto LABEL_26;
    }

    id v8 = 0LL;
    goto LABEL_26;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
  id v7 = (CSCoordinator *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostOutputDir](v7, "hostOutputDir"));
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000545D0();
    }

    id v8 = 0LL;
  }

  objc_sync_exit(v5);

LABEL_27:
  return v8;
}

- (void)initRemoteServers
{
}

- (BOOL)initProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v6 = -[CSCoordinator setProxies:forDiagnosticID:](self, "setProxies:forDiagnosticID:", v5, v4);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logSubsystem]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10005463C(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)tryStartRemoteInitiatedFlowForMsg:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[CSCoordinator isRemoteInitiated](v5, "isRemoteInitiated"))
  {
    -[CSCoordinator setInitiatedByRemoteHost:]( v5,  "setInitiatedByRemoteHost:",  xpc_dictionary_get_BOOL(v4, "initiatedByRemoteHost"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = -[CSCoordinator initiatedByRemoteHost](v5, "initiatedByRemoteHost");
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Starting remote initiated flow with initiatedByRemoteHost: %d",  (uint8_t *)v23,  8u);
    }

    if (-[CSCoordinator isHost](v5, "isHost"))
    {
      dispatch_group_t v11 = dispatch_group_create();
      -[CSCoordinator setHostWaitGroup:](v5, "setHostWaitGroup:", v11);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](v5, "hostWaitGroup"));
      LODWORD(v11) = v12 == 0LL;

      if ((_DWORD)v11)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1000546AC(v7, v16, v17, v18, v19, v20, v21, v22);
        }
        goto LABEL_4;
      }

      uint64_t v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](v5, "hostWaitGroup"));
      dispatch_group_enter(v13);
    }

    BOOL v8 = 1;
    -[CSCoordinator setIsRemoteInitiated:](v5, "setIsRemoteInitiated:", 1LL);
    goto LABEL_11;
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logSubsystem]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Already remote initiated. Failing to startRemoteInitiatedFlow",  (uint8_t *)v23,  2u);
  }

- (id)gatherLocalSysdiagnoseForMsg:(id)a3 withReply:(id)a4
{
  return sub_10002E5FC(0LL, a3, a4);
}

- (void)endRemoteInitiatedFlow
{
  obj = self;
  objc_sync_enter(obj);
  if (-[CSCoordinator isHost](obj, "isHost")) {
    -[CSCoordinator safeLeaveHostWaitGroup](obj, "safeLeaveHostWaitGroup");
  }
  -[CSCoordinator setInitiatedByRemoteHost:](obj, "setInitiatedByRemoteHost:", 0LL);
  -[CSCoordinator setIsRemoteInitiated:](obj, "setIsRemoteInitiated:", 0LL);
  objc_sync_exit(obj);
}

- (BOOL)shouldGatherCoSysdiagnoses
{
  unsigned int v3 = -[CSCoordinator isRemoteInitiated](self, "isRemoteInitiated");
  if (v3) {
    -[CSCoordinator initiatedByRemoteHost](self, "initiatedByRemoteHost");
  }
  return v3 ^ 1;
}

- (BOOL)triggerCoSysdiagnosesWithParams:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v7);
  if (!-[CSCoordinator shouldGatherCoSysdiagnoses](self, "shouldGatherCoSysdiagnoses"))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logSubsystem]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Not triggering co-sysdiagnoses",  buf,  2u);
    }

    goto LABEL_21;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000546E0(v9, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_21:
    BOOL v17 = 0;
    goto LABEL_22;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Triggering co-sysdiagnoses",  buf,  2u);
  }

  -[CSCoordinator initProxiesForDiagnosticID:](self, "initProxiesForDiagnosticID:", v7);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v7));
  id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
  if (v10)
  {
    id v11 = v10;
    id v27 = v7;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if (([v14 triggerCoSysdiagnoseWithParams:v6] & 1) == 0)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Failed to trigger co-sysdiagnose for %@",  buf,  0xCu);
          }
        }
      }

      id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
    }

    while (v11);
    BOOL v17 = 1;
    id v7 = v27;
  }

  else
  {
    BOOL v17 = 1;
  }

- (BOOL)waitForCoSysdiagnosesForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logSubsystem]);

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Waiting for co-sysdiagnoses...",  buf,  2u);
    }

    if (-[CSCoordinator shouldGatherCoSysdiagnoses](self, "shouldGatherCoSysdiagnoses"))
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v4));
      unint64_t v8 = 0LL;
      id v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v49;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v49 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)i) getTimeoutSec];
          }

          id v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }

        while (v9);
      }

      *(void *)buf = 0LL;
      v45 = buf;
      uint64_t v46 = 0x2020000000LL;
      char v47 = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_1000180F8;
      v41[3] = &unk_100089110;
      v41[4] = self;
      id v13 = v4;
      id v42 = v13;
      v43 = buf;
      unsigned __int8 v14 = +[SystemDiagnostic _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnostic,  "_runBlock:withTimeout:",  v41,  (double)v8);
      v45[24] = v14;
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = 134217984;
          unint64_t v54 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Timed out waiting on proxies for %lus, canceling connections",  v53,  0xCu);
        }
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v13, 0LL));
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v38;
        do
        {
          for (j = 0LL; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) cancelConnection];
          }

          id v18 = [v17 countByEnumeratingWithState:&v37 objects:v52 count:16];
        }

        while (v18);
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
    BOOL v29 = v28 == 0LL;

    if (v29)
    {
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 logSubsystem]);

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Trying to wait on NULL hostWaitGroup. File transfer probably already finished",  buf,  2u);
      }
    }

    else
    {
      __int128 v30 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
      dispatch_time_t v31 = dispatch_time(0LL, 30000000000LL);
      uint64_t v32 = dispatch_group_wait(v30, v31);

      if (!v32)
      {
LABEL_37:
        -[CSCoordinator removeSessionConfigForDiagnosticID:](self, "removeSessionConfigForDiagnosticID:", v4);
        goto LABEL_38;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 logSubsystem]);

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: While remote-initiated, timed out waiting for remote co-sysdiagnose (hostWaitGroup)",  buf,  2u);
      }
    }

    goto LABEL_37;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100054750(v6, v21, v22, v23, v24, v25, v26, v27);
  }

LABEL_38:
  return v4 != 0LL;
}

- (void)readyToReceiveCoSysdiagnosesAtDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v6);
  -[CSCoordinator setHostOutputDir:forDiagnosticID:](self, "setHostOutputDir:forDiagnosticID:", v7, v6);

  dsema = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSCoordinator getReceiveFileSemaForDiagnosticID:]( self,  "getReceiveFileSemaForDiagnosticID:",  v6));
  dispatch_semaphore_signal(dsema);
}

- (id)waitForHostOutputDirForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getHostOutputDirForDiagnosticID:](self, "getHostOutputDirForDiagnosticID:", v4));
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    unint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[CSCoordinator getReceiveFileSemaForDiagnosticID:]( self,  "getReceiveFileSemaForDiagnosticID:",  v4));
    dispatch_time_t v9 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logSubsystem]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Timed out waiting for host to set output directory",  v13,  2u);
      }

      id v7 = 0LL;
    }

    else
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSCoordinator getHostOutputDirForDiagnosticID:](self, "getHostOutputDirForDiagnosticID:", v4));
    }
  }

  return v7;
}

- (void)safeLeaveHostWaitGroup
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));

  if (v3)
  {
    id v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
    dispatch_group_leave(v4);

    -[CSCoordinator setHostWaitGroup:](self, "setHostWaitGroup:", 0LL);
  }

- (void)transferFileToHostIfNecessary:(id)a3 forDiagnosticID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CSCoordinator isHost](self, "isHost"))
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: On host, so file transfer not necessary. Skipping transfer",  buf,  2u);
    }
  }

  else
  {
    if (-[CSCoordinator isRemoteInitiated](self, "isRemoteInitiated"))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logSubsystem]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Not transferring file to host in transferFileToHostIfNecessary, because we are already remote initiated",  buf,  2u);
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v7));
      uint64_t v20 = self;
      id v21 = v7;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v11 = v12;
      id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v11);
            }
            BOOL v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance", v20, v21));
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logSubsystem]);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "CSCoordinator: Transferring file from remote to host: %@",  buf,  0xCu);
            }

            [v17 transferFileToHost:v6];
          }

          id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
        }

        while (v14);
      }

      self = v20;
      id v7 = v21;
    }

    -[CSCoordinator removeSessionConfigForDiagnosticID:](self, "removeSessionConfigForDiagnosticID:", v7);
  }
}

- (OS_os_log)logSubsystem
{
  return (OS_os_log *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLogSubsystem:(id)a3
{
}

- (BOOL)isRemoteInitiated
{
  return self->_isRemoteInitiated;
}

- (void)setIsRemoteInitiated:(BOOL)a3
{
  self->_isRemoteInitiated = a3;
}

- (BOOL)initiatedByRemoteHost
{
  return self->_initiatedByRemoteHost;
}

- (void)setInitiatedByRemoteHost:(BOOL)a3
{
  self->_initiatedByRemoteHost = a3;
}

- (NSDictionary)sessionConfigs
{
  return self->_sessionConfigs;
}

- (void)setSessionConfigs:(id)a3
{
}

- (OS_dispatch_group)hostWaitGroup
{
  return self->_hostWaitGroup;
}

- (void)setHostWaitGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end