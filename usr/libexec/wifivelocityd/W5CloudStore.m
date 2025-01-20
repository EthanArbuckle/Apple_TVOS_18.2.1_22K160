@interface W5CloudStore
+ (id)sharedStore;
- (BOOL)registerDiagnosticModePeer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)unregisterDiagnosticModePeer:(id)a3 error:(id *)a4;
- (NSUbiquitousKeyValueStore)appStore;
- (W5CloudStore)init;
- (id)_homeDiagnosticsDomain;
- (id)getMinNotificationInterval:(id)a3 notificationType:(int64_t)a4;
- (id)registeredPeers;
- (void)_setHomeDiagnosticsDomain:(id)a3;
- (void)setAppStore:(id)a3;
@end

@implementation W5CloudStore

+ (id)sharedStore
{
  if (qword_1000F75A0 != -1) {
    dispatch_once(&qword_1000F75A0, &stru_1000D2FC8);
  }
  return (id)qword_1000F7598;
}

- (W5CloudStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___W5CloudStore;
  v2 = -[W5CloudStore init](&v10, "init");
  if (!v2)
  {
LABEL_8:

    return 0LL;
  }

  v3 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  @"com.apple.wifi.app",  0LL);
  appStore = v2->_appStore;
  v2->_appStore = v3;

  v5 = v2->_appStore;
  if (!v5)
  {
    uint64_t v7 = sub_10008C90C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5CloudStore init]";
      __int16 v13 = 2080;
      v14 = "W5CloudStore.m";
      __int16 v15 = 1024;
      int v16 = 53;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) failed to create app KVS store",  (const char *)&v11,  v9,  LODWORD(v10.receiver));
    }

    goto LABEL_8;
  }

  -[NSUbiquitousKeyValueStore synchronize](v5, "synchronize");
  return v2;
}

- (id)_homeDiagnosticsDomain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"home-diagnostics"]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  v5 = v4;

  return v5;
}

- (void)_setHomeDiagnosticsDomain:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  [v5 setObject:v4 forKey:@"home-diagnostics"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[W5CloudStore appStore](self, "appStore"));
  [v6 synchronize];
}

- (BOOL)registerDiagnosticModePeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  id v11 = [v10 mutableCopy];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"registered-app-peers"]);
  if (!v12) {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  id v38 = [v12 mutableCopy];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peerID]);

  v39 = v9;
  if (!v14)
  {
    uint64_t v31 = sub_10008C90C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136315906;
      v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      __int16 v45 = 2080;
      v46 = "W5CloudStore.m";
      __int16 v47 = 1024;
      int v48 = 96;
      __int16 v49 = 2114;
      id v50 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[wifivelocity] %s (%s:%u) nil peer ID for peer='%{public}@'",  &v43,  38);
    }

    if (!a5) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  id v40 = 0LL;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v40));
  id v16 = v40;
  if (!v15)
  {
    uint64_t v33 = sub_10008C90C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136315906;
      v44 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      __int16 v45 = 2080;
      v46 = "W5CloudStore.m";
      __int16 v47 = 1024;
      int v48 = 101;
      __int16 v49 = 2114;
      id v50 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode peer='%{public}@'",  &v43,  38);
    }

    if (!a5)
    {
      BOOL v29 = 0;
      goto LABEL_16;
    }

    if (v16)
    {
      id v16 = v16;
      BOOL v29 = 0;
      *a5 = v16;
      goto LABEL_16;
    }

- (BOOL)unregisterDiagnosticModePeer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  id v8 = [v7 mutableCopy];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"registered-app-peers"]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 peer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peerID]);

  if (!v11)
  {
    uint64_t v18 = sub_10008C90C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      uint64_t v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v26 = 2080;
      uint64_t v27 = "W5CloudStore.m";
      __int16 v28 = 1024;
      int v29 = 152;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) nil peer ID for peer='%{public}@'",  &v24,  38);
    }

    goto LABEL_13;
  }

  if (!v9)
  {
    uint64_t v20 = sub_10008C90C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315650;
      uint64_t v25 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v26 = 2080;
      uint64_t v27 = "W5CloudStore.m";
      __int16 v28 = 1024;
      int v29 = 153;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) peers is empty",  &v24,  28);
    }

- (id)registeredPeers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  id v3 = [v2 mutableCopy];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"registered-app-peers"]);
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v4)
  {
    uint64_t v21 = v4;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v7),  0LL);
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"peer"]);
          id v23 = 0LL;
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v14,  &v23));
          id v16 = v23;

          if (v15)
          {
            [v22 addObject:v15];
          }

          else
          {
            uint64_t v17 = sub_10008C90C();
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              int v28 = 136315906;
              int v29 = "-[W5CloudStore registeredPeers]";
              __int16 v30 = 2080;
              id v31 = "W5CloudStore.m";
              __int16 v32 = 1024;
              int v33 = 191;
              __int16 v34 = 2114;
              id v35 = v16;
              LODWORD(v20) = 38;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) failed to decode peer error='%{public}@'",  &v28,  v20);
            }
          }
        }

        id v8 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }

      while (v8);
    }

    id v4 = v21;
  }

  return v22;
}

- (id)getMinNotificationInterval:(id)a3 notificationType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5CloudStore _homeDiagnosticsDomain](self, "_homeDiagnosticsDomain"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"registered-app-peers"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  if (v9)
  {
    if (a4 == 2)
    {
      objc_super v10 = @"min-start-notification-interval";
      goto LABEL_7;
    }

    if (a4 == 3)
    {
      objc_super v10 = @"min-stop-notification-interval";
LABEL_7:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);
      goto LABEL_8;
    }
  }

  id v11 = 0LL;
LABEL_8:

  return v11;
}

- (NSUbiquitousKeyValueStore)appStore
{
  return self->_appStore;
}

- (void)setAppStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end