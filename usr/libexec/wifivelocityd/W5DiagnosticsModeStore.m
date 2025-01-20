@interface W5DiagnosticsModeStore
- (BOOL)_updateCachedDiagnosticsMode:(id)a3 error:(id)a4;
- (NSMutableSet)diagnostics;
- (W5DiagnosticsModeStore)init;
- (id)_diagnosticsModeFilteredWithPredicate:(id)a3;
- (id)_getCachedDiagnosticsMode:(id)a3;
- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4;
- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4 role:(int64_t)a5;
- (id)diagnosticsModeMatchingUUID:(id)a3;
- (id)diagnosticsModeWithState:(int64_t)a3;
- (void)setDiagnostics:(id)a3;
- (void)updateStoreWithDiagnosticsMode:(id)a3;
@end

@implementation W5DiagnosticsModeStore

- (W5DiagnosticsModeStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___W5DiagnosticsModeStore;
  v2 = -[W5DiagnosticsModeStore init](&v9, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore _getCachedDiagnosticsMode:](v2, "_getCachedDiagnosticsMode:", 0LL));
  v4 = v3;
  if (v3) {
    v5 = (NSMutableSet *)[v3 mutableCopy];
  }
  else {
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }
  diagnostics = v2->_diagnostics;
  v2->_diagnostics = v5;

  activeTransaction = v2->_activeTransaction;
  v2->_activeTransaction = 0LL;

  return v2;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4 role:(int64_t)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000D6F4;
  v12[3] = &unk_1000D1240;
  id v13 = a3;
  int64_t v14 = a4;
  int64_t v15 = a5;
  id v8 = v13;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:]( self,  "_diagnosticsModeFilteredWithPredicate:",  v9));

  return v10;
}

- (id)diagnosticsModeMatchingPeerID:(id)a3 state:(int64_t)a4
{
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10000D92C;
  id v13 = &unk_1000D1268;
  id v14 = a3;
  int64_t v15 = a4;
  id v6 = v14;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &v10));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:]( self,  "_diagnosticsModeFilteredWithPredicate:",  v7,  v10,  v11,  v12,  v13));

  return v8;
}

- (id)diagnosticsModeWithState:(int64_t)a3
{
  return -[W5DiagnosticsModeStore diagnosticsModeMatchingPeerID:state:]( self,  "diagnosticsModeMatchingPeerID:state:",  0LL,  a3);
}

- (id)diagnosticsModeMatchingUUID:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000DB6C;
  v9[3] = &unk_1000D1290;
  id v10 = a3;
  id v4 = v10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v9));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[W5DiagnosticsModeStore _diagnosticsModeFilteredWithPredicate:]( self,  "_diagnosticsModeFilteredWithPredicate:",  v5));

  if (v6) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  }
  else {
    v7 = 0LL;
  }

  return v7;
}

- (id)_diagnosticsModeFilteredWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v4]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)updateStoreWithDiagnosticsMode:(id)a3
{
  id v4 = (char *)a3;
  if (!v4)
  {
    uint64_t v28 = sub_10008C90C();
    activeTransaction = (OS_os_transaction *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(activeTransaction, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 136315906;
      v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v39 = 2080;
      v40 = "W5DiagnosticsModeManager.m";
      __int16 v41 = 1024;
      int v42 = 1530;
      __int16 v43 = 2080;
      v44 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      LODWORD(v30) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  activeTransaction,  0LL,  "[wifivelocity] %s (%s:%u) %s: nil mode provided",  (const char *)&v37,  v30,  (_DWORD)v31,  (const char *)v32);
    }

    goto LABEL_26;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
    [v7 removeObject:v4];
  }

  uint64_t v8 = sub_10008C90C();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 136315906;
    v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
    __int16 v39 = 2080;
    v40 = "W5DiagnosticsModeManager.m";
    __int16 v41 = 1024;
    int v42 = 1538;
    __int16 v43 = 2112;
    v44 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) [DM] updating store with DM: %@",  &v37,  38);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  [v10 addObject:v4];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeStore diagnostics](self, "diagnostics"));
  unsigned __int8 v12 = -[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]( self,  "_updateCachedDiagnosticsMode:error:",  v11,  0LL);

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = sub_10008C90C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 136316162;
      v38 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v39 = 2080;
      v40 = "W5DiagnosticsModeManager.m";
      __int16 v41 = 1024;
      int v42 = 1543;
      __int16 v43 = 2080;
      v44 = "-[W5DiagnosticsModeStore updateStoreWithDiagnosticsMode:]";
      __int16 v45 = 2114;
      uint64_t v46 = 0LL;
      LODWORD(v30) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] failed to update cache with error='%{public}@'",  &v37,  v30);
    }
  }

  if (sub_10000E17C())
  {
    id v15 = [sub_10000E17C() sharedAnalyticsProcessor];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      BOOL v17 = [v4 state] == (id)3;
      v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v31 = @"date";
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      v36[0] = v19;
      v32 = @"desc";
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
      v36[1] = v20;
      v33 = @"enabled";
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
      v36[2] = v21;
      v34 = @"uuid";
      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      v35 = @"name";
      v36[3] = v22;
      v36[4] = @"W5DiagnosticsMode";
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  &v31,  5LL));
      -[NSMutableDictionary addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v23);

      id v24 = [sub_10000E17C() sharedAnalyticsProcessor];
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [v25 processWAMessageMetric:@"com.apple.wifi.DiagnosticState" data:v18];
    }
  }

  if (!self->_activeTransaction)
  {
    if ([v4 state] == (id)2
      || [v4 state] == (id)3
      || [v4 state] == (id)4
      || [v4 state] == (id)5
      || [v4 state] == (id)10)
    {
      v27 = (OS_os_transaction *)os_transaction_create("diagnosticsModeStateActive");
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[W5ActivityManager sharedActivityManager]( &OBJC_CLASS___W5ActivityManager,  "sharedActivityManager"));
      [v26 osTransactionCreate:"diagnosticsModeStateActive" transaction:v27];
      goto LABEL_25;
    }

    if (!self->_activeTransaction) {
      goto LABEL_27;
    }
  }

  if ([v4 state] == (id)1 || objc_msgSend(v4, "state") == (id)11)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
    [v26 osTransactionComplete:self->_activeTransaction];
    v27 = 0LL;
LABEL_25:

    activeTransaction = self->_activeTransaction;
    self->_activeTransaction = v27;
LABEL_26:
  }

- (id)_getCachedDiagnosticsMode:(id)a3
{
  id v28 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CachedDiagnosticsMode"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSSet, v6);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v10);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v16);
  v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  v13,  v15,  v17,  objc_opt_class(&OBJC_CLASS___NSNumber, v18),  0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v29 = v28;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v20,  v5,  &v29));
  id v22 = v29;

  if (!v21)
  {
    id v24 = v4;
    uint64_t v25 = sub_10008C90C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136316418;
      v31 = "-[W5DiagnosticsModeStore _getCachedDiagnosticsMode:]";
      __int16 v32 = 2080;
      v33 = "W5DiagnosticsModeManager.m";
      __int16 v34 = 1024;
      int v35 = 1582;
      __int16 v36 = 2114;
      uint64_t v37 = 0LL;
      __int16 v38 = 2114;
      __int16 v39 = v5;
      __int16 v40 = 2114;
      id v41 = v22;
      LODWORD(v27) = 58;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) failed to decode configuration data='%{public}@' from dictionary='%{public}@' with error='%{public}@'",  &v30,  v27);
    }

    id v4 = v24;
  }

  return v21;
}

- (BOOL)_updateCachedDiagnosticsMode:(id)a3 error:(id)a4
{
  id v4 = (char *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  uint64_t v8 = sub_10008C90C();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v21 = 2080;
    id v22 = "W5DiagnosticsModeManager.m";
    __int16 v23 = 1024;
    int v24 = 1590;
    __int16 v25 = 2080;
    v26 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v27 = 2114;
    id v28 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] updating cached diagnostics mode with '%{public}@'",  &v19,  48);
  }

  if (!v4)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_7;
  }

  id v18 = 0LL;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v18));
  uint64_t v11 = (char *)v18;
  if (v10)
  {
    [v7 setObject:v10 forKeyedSubscript:@"CachedDiagnosticsMode"];
LABEL_7:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 setPersistentDomain:v7 forName:@"com.apple.wifi.diagnosticsMode"];

    uint64_t v13 = sub_10008C90C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316162;
      v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      __int16 v21 = 2080;
      id v22 = "W5DiagnosticsModeManager.m";
      __int16 v23 = 1024;
      int v24 = 1605;
      __int16 v25 = 2080;
      v26 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
      __int16 v27 = 2114;
      id v28 = v11;
      LODWORD(v17) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] successfully encoded error='%{public}@'",  &v19,  v17);
    }

    goto LABEL_10;
  }

  uint64_t v16 = sub_10008C90C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315906;
    v20 = "-[W5DiagnosticsModeStore _updateCachedDiagnosticsMode:error:]";
    __int16 v21 = 2080;
    id v22 = "W5DiagnosticsModeManager.m";
    __int16 v23 = 1024;
    int v24 = 1599;
    __int16 v25 = 2114;
    v26 = v11;
    LODWORD(v17) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'",  &v19,  v17);
  }

- (NSMutableSet)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end