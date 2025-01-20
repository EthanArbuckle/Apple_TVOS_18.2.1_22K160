@interface W5DiagnosticsModeLocalStore
- (BOOL)_updateCachedLocalStore:(id)a3 error:(id)a4;
- (NSMutableDictionary)localDiagnosticsStore;
- (W5DiagnosticsModeLocalStore)init;
- (id)_getCachedLocalStore:(id)a3;
- (id)infoMatchingDiagnosticMode:(id)a3;
- (void)addToStore:(id)a3 newInfo:(id)a4;
- (void)setLocalDiagnosticsStore:(id)a3;
- (void)updateStoreWithInfo:(id)a3 info:(id)a4;
@end

@implementation W5DiagnosticsModeLocalStore

- (W5DiagnosticsModeLocalStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___W5DiagnosticsModeLocalStore;
  v2 = -[W5DiagnosticsModeLocalStore init](&v8, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore _getCachedLocalStore:](v2, "_getCachedLocalStore:", 0LL));
  v4 = v3;
  if (v3) {
    v5 = (NSMutableDictionary *)[v3 mutableCopy];
  }
  else {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  localDiagnosticsStore = v2->_localDiagnosticsStore;
  v2->_localDiagnosticsStore = v5;

  return v2;
}

- (id)_getCachedLocalStore:(id)a3
{
  id v31 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CachedDiagnosticsModeLocalStore"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v6);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSURL, v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsMode, v12);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___W5DiagnosticsModePeer, v18);
  v20 = (void *)v5;
  v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  v13,  v15,  v17,  v30,  objc_opt_class(&OBJC_CLASS___NSNumber, v19),  0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v32 = v31;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v22,  v5,  &v32));
  id v24 = v32;

  if (!v23)
  {
    v26 = v4;
    uint64_t v27 = sub_10008C90C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136316418;
      v34 = "-[W5DiagnosticsModeLocalStore _getCachedLocalStore:]";
      __int16 v35 = 2080;
      v36 = "W5DiagnosticsModeManager.m";
      __int16 v37 = 1024;
      int v38 = 1638;
      __int16 v39 = 2114;
      uint64_t v40 = 0LL;
      __int16 v41 = 2114;
      v42 = v20;
      __int16 v43 = 2114;
      id v44 = v24;
      LODWORD(v29) = 58;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) failed to decode configuration data='%{public}@' from dictionary='%{public}@' with error='%{public}@'",  &v33,  v29);
    }

    v4 = v26;
  }

  return v23;
}

- (id)infoMatchingDiagnosticMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  }

  else
  {
    uint64_t v8 = sub_10008C90C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = "-[W5DiagnosticsModeLocalStore infoMatchingDiagnosticMode:]";
      __int16 v13 = 2080;
      uint64_t v14 = "W5DiagnosticsModeManager.m";
      __int16 v15 = 1024;
      int v16 = 1646;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) nil mode provided",  (const char *)&v11,  28);
    }

    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)updateStoreWithInfo:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v23 = sub_10008C90C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315906;
      *(void *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) %s: nil mode provided",  v26,  38,  *(_OWORD *)v26);
    }

    goto LABEL_14;
  }

  if (!v7)
  {
    uint64_t v24 = sub_10008C90C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315906;
      *(void *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) %s: nil info provided",  v26,  38,  *(_OWORD *)v26);
    }

    goto LABEL_14;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    [v12 removeObjectForKey:v13];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  [v14 setObject:v8 forKey:v15];

  uint64_t v16 = sub_10008C90C();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    *(_DWORD *)v26 = 136316162;
    *(void *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
    *(_WORD *)&v26[12] = 2080;
    *(void *)&v26[14] = "W5DiagnosticsModeManager.m";
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = 1672;
    WORD2(v27) = 2112;
    *(void *)((char *)&v27 + 6) = v18;
    HIWORD(v27) = 2112;
    v28 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) [DM] updating local store for DM: %@ with info: %@",  v26,  48);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  unsigned __int8 v20 = -[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:](self, "_updateCachedLocalStore:error:", v19, 0LL);

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = sub_10008C90C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      *(void *)&v26[4] = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1675;
      WORD2(v27) = 2080;
      *(void *)((char *)&v27 + 6) = "-[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:]";
      HIWORD(v27) = 2114;
      LODWORD(v25) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] failed to update local cache with error='%{public}@'",  v26,  v25,  *(_OWORD *)v26,  *(void *)&v26[16],  v27,  0LL);
    }

- (void)addToStore:(id)a3 newInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeLocalStore localDiagnosticsStore](self, "localDiagnosticsStore"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F110;
  v12[3] = &unk_1000D12B8;
  id v13 = v9;
  id v10 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  -[W5DiagnosticsModeLocalStore updateStoreWithInfo:info:](self, "updateStoreWithInfo:info:", v11, v10);
}

- (BOOL)_updateCachedLocalStore:(id)a3 error:(id)a4
{
  id v4 = (char *)a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  uint64_t v8 = sub_10008C90C();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    unsigned __int8 v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    __int16 v23 = 1024;
    int v24 = 1693;
    __int16 v25 = 2080;
    v26 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v27 = 2114;
    v28 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] updating cached local store with '%{public}@'",  &v19,  48);
  }

  if (!v4)
  {
    id v10 = 0LL;
    id v11 = 0LL;
    goto LABEL_7;
  }

  id v18 = 0LL;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v18));
  id v11 = (char *)v18;
  if (v10)
  {
    [v7 setObject:v10 forKeyedSubscript:@"CachedDiagnosticsModeLocalStore"];
LABEL_7:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 setPersistentDomain:v7 forName:@"com.apple.wifi.diagnosticsMode"];

    uint64_t v13 = sub_10008C90C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316162;
      unsigned __int8 v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
      __int16 v21 = 2080;
      v22 = "W5DiagnosticsModeManager.m";
      __int16 v23 = 1024;
      int v24 = 1708;
      __int16 v25 = 2080;
      v26 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
      __int16 v27 = 2114;
      v28 = v11;
      LODWORD(v17) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] successfully encoded error='%{public}@'",  &v19,  v17);
    }

    goto LABEL_10;
  }

  uint64_t v16 = sub_10008C90C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315906;
    unsigned __int8 v20 = "-[W5DiagnosticsModeLocalStore _updateCachedLocalStore:error:]";
    __int16 v21 = 2080;
    v22 = "W5DiagnosticsModeManager.m";
    __int16 v23 = 1024;
    int v24 = 1702;
    __int16 v25 = 2114;
    v26 = v11;
    LODWORD(v17) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'",  &v19,  v17);
  }

- (NSMutableDictionary)localDiagnosticsStore
{
  return self->_localDiagnosticsStore;
}

- (void)setLocalDiagnosticsStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end