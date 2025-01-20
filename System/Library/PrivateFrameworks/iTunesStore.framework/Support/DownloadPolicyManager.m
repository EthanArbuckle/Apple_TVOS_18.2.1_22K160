@interface DownloadPolicyManager
- (BOOL)_isPolicyRuleCellularDataAllowed:(id)a3 networkType:(int64_t)a4;
- (BOOL)_isPolicyRuleNetworkTypeAllowed:(id)a3 networkType:(int64_t)a4;
- (BOOL)_isPolicyRuleSatisfied:(id)a3 forPolicy:(id)a4 networkType:(int64_t)a5;
- (DownloadPolicyManager)init;
- (DownloadPolicyManager)initWithDownloadsDatabase:(id)a3;
- (DownloadsDatabase)downloadsDatabase;
- (id)downloadPolicyForID:(int64_t)a3;
- (id)overrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3;
- (int64_t)_sizeLimitForPolicy:(id)a3 networkType:(int64_t)a4;
- (int64_t)addDownloadPolicy:(id)a3;
- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3;
- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3 networkType:(int64_t)a4;
- (void)_addPolicy:(id)a3;
- (void)_initializePolicy;
- (void)dealloc;
- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3;
- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(int64_t)a4;
@end

@implementation DownloadPolicyManager

- (DownloadPolicyManager)init
{
  return -[DownloadPolicyManager initWithDownloadsDatabase:]( self,  "initWithDownloadsDatabase:",  +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
}

- (DownloadPolicyManager)initWithDownloadsDatabase:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DownloadPolicyManager;
  v4 = -[DownloadPolicyManager init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_database = (DownloadsDatabase *)a3;
    v4->_policies = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    database = v5->_database;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10013640C;
    v8[3] = &unk_10034AE98;
    v8[4] = v5;
    -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v8);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadPolicyManager;
  -[DownloadPolicyManager dealloc](&v3, "dealloc");
}

- (int64_t)addDownloadPolicy:(id)a3
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  policies = self->_policies;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( policies,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(policies);
        }
        objc_super v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->_policies, "objectForKey:", v9),  "downloadPolicy"),  "isEqual:",  a3))
        {
          id v10 = [v9 longLongValue];
          v30[3] = (uint64_t)v10;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( policies,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)downloadPolicyForID:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v5 = -[NSMutableDictionary objectForKey:](self->_policies, "objectForKey:", v4);

  return [v5 downloadPolicy];
}

- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3
{
  return -[DownloadPolicyManager downloadSizeLimitForPolicyWithID:networkType:]( self,  "downloadSizeLimitForPolicyWithID:networkType:",  a3,  -[ISNetworkObserver networkType]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"),  "networkType"));
}

- (int64_t)downloadSizeLimitForPolicyWithID:(int64_t)a3 networkType:(int64_t)a4
{
  id v6 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v7 = -[NSMutableDictionary objectForKey:](self->_policies, "objectForKey:", v6);
  if (v7) {
    int64_t v8 = -[DownloadPolicyManager _sizeLimitForPolicy:networkType:](self, "_sizeLimitForPolicy:networkType:", v7, a4);
  }
  else {
    int64_t v8 = SSDownloadSizeLimitDisabled;
  }

  return v8;
}

- (id)overrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v5 = -[NSMutableDictionary objectForKey:](self->_sizeLimitOverrides, "objectForKey:", v4);

  return v5;
}

- (void)removeOverrideDownloadSizeLimitForDownloadIdentifier:(int64_t)a3
{
  if (self->_sizeLimitOverrides)
  {
    v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_sizeLimitOverrides, "removeObjectForKey:");
    if (!-[NSMutableDictionary count](self->_sizeLimitOverrides, "count"))
    {

      self->_sizeLimitOverrides = 0LL;
    }
  }

- (void)setOverrideDownloadSizeLimit:(int64_t)a3 forDownloadIdentifier:(int64_t)a4
{
  if (!self->_sizeLimitOverrides) {
    self->_sizeLimitOverrides = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  int64_t v8 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  id v7 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableDictionary setObject:forKey:](self->_sizeLimitOverrides, "setObject:forKey:", v7, v8);
}

- (void)_addPolicy:(id)a3
{
  id v5 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [a3 databaseID]);
  if (!-[NSMutableDictionary objectForKey:](self->_policies, "objectForKey:", v5))
  {
    int64_t v6 = -[DownloadPolicyManager _sizeLimitForPolicy:networkType:]( self,  "_sizeLimitForPolicy:networkType:",  a3,  -[ISNetworkObserver networkType]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"),  "networkType"));
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v16 = 138412802;
      uint64_t v17 = objc_opt_class(self);
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2048;
      int64_t v21 = v6;
      uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Adding download policy %@ with size limit %lld",  &v16,  32);
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        unsigned int v15 = v14;
        *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
      }
    }

    -[NSMutableDictionary setObject:forKey:](self->_policies, "setObject:forKey:", a3, v5, v11, v15);
  }
}

- (void)_initializePolicy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  database = self->_database;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100136F04;
  v23[3] = &unk_10034DDF0;
  v23[4] = v3;
  -[DownloadsDatabase readUsingTransactionBlock:](database, "readUsingTransactionBlock:", v23);
  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  unsigned int v8 = (os_log_s *)[v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    uint64_t v9 = objc_opt_class(self);
    id v10 = -[NSMutableArray count](v3, "count");
    int v25 = 138412546;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    id v28 = v10;
    uint64_t v11 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Initialized with %lu download policies",  &v25,  22);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      __int16 v18 = v13;
      SSFileLog(v5, @"%@");
    }
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL,  v18);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v3);
        }
        -[DownloadPolicyManager _addPolicy:](self, "_addPolicy:", *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
      }

      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v15);
  }
}

- (BOOL)_isPolicyRuleCellularDataAllowed:(id)a3 networkType:(int64_t)a4
{
  id v6 = [a3 cellularDataStates];
  if (v6 == (id)3
    || (char v7 = (char)v6, !SSNetworkTypeIsCellularType(a4))
    || (int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AllowAutoDownloadOnCellular",  kSSUserDefaultsIdentifier,  0LL),  (v7 & 2) != 0)
    && AppBooleanValue)
  {
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = v7 & (AppBooleanValue == 0);
  }

  if (SSNetworkTypeIsCellularType(a4))
  {
    if ([a3 isCellularAllowed])
    {
      id v10 = [a3 userDefaultStates];
      if ([v10 count])
      {
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v17 + 1) + 8 * (void)i) currentBoolValue])
              {
                id v15 = [a3 downloadSizeLimit];
                if (v15 == (id)SSDownloadSizeLimitDisabled) {
                  return 0;
                }
                return v9;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
    }
  }

  return v9;
}

- (BOOL)_isPolicyRuleNetworkTypeAllowed:(id)a3 networkType:(int64_t)a4
{
  id v5 = [a3 networkTypes];
  if (![v5 count]) {
    return 1;
  }
  id v6 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", a4);
  unsigned __int8 v7 = [v5 containsObject:v6];

  return v7;
}

- (BOOL)_isPolicyRuleSatisfied:(id)a3 forPolicy:(id)a4 networkType:(int64_t)a5
{
  BOOL v8 = -[DownloadPolicyManager _isPolicyRuleNetworkTypeAllowed:networkType:]( self,  "_isPolicyRuleNetworkTypeAllowed:networkType:",  a3,  a5);
  if (v8) {
    LOBYTE(v8) = -[DownloadPolicyManager _isPolicyRuleCellularDataAllowed:networkType:]( self,  "_isPolicyRuleCellularDataAllowed:networkType:",  a3,  a5);
  }
  return v8;
}

- (int64_t)_sizeLimitForPolicy:(id)a3 networkType:(int64_t)a4
{
  int64_t v7 = SSDownloadSizeLimitDisabled;
  id v8 = [a3 downloadPolicy];
  id v9 = [v8 policyRules];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  id v11 = (id)v7;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (-[DownloadPolicyManager _isPolicyRuleSatisfied:forPolicy:networkType:]( self,  "_isPolicyRuleSatisfied:forPolicy:networkType:",  v15,  a3,  a4))
        {
          id v11 = [v15 downloadSizeLimit];
          goto LABEL_11;
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }

    id v11 = (id)v7;
  }

- (DownloadsDatabase)downloadsDatabase
{
  return self->_database;
}

@end