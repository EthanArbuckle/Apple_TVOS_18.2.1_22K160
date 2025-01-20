@interface ICDAccountManagerState
+ (id)restoredStatedWithFallbackAccounts:(id)a3;
+ (id)stateForAccounts:(id)a3 baseConfiguration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICConnectionConfiguration)activeConfiguration;
- (NSSet)supportedConfigurations;
- (NSSet)supportedConfigurationsDSIDs;
- (NSString)activeConfigurationDSID;
- (id)_configurationForAccount:(id)a3 baseConfiguration:(id)a4;
- (id)_initWithAccounts:(id)a3 activeAccount:(id)a4 baseConfiguration:(id)a5;
- (id)_userIdentityForAccount:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_updateSupportedConfigurationsDSIDs;
- (void)_updateSupportedConfigurationsWithAccounts:(id)a3 activeConfiguration:(id)a4;
- (void)save;
- (void)setActiveConfiguration:(id)a3;
- (void)setActiveConfigurationDSID:(id)a3;
- (void)setSupportedConfigurations:(id)a3;
- (void)setSupportedConfigurationsDSIDs:(id)a3;
@end

@implementation ICDAccountManagerState

- (void)save
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218242;
    v10 = self;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "ICDAccountManagerState %p - Saving - %@",  (uint8_t *)&v9,  0x16u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](self, "activeConfigurationDSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
  [v5 setKnownActiveAccountDSID:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](self, "supportedConfigurationsDSIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
  [v8 setKnownAccountDSIDs:v7];
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ICDAccountManagerState %p:",  self));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](self, "activeConfigurationDSID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](self, "activeConfigurationDSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[active dsid=%@]",  v6));
    -[NSMutableArray addObject:](v3, "addObject:", v7);
  }

  else
  {
    -[NSMutableArray addObject:](v3, "addObject:", @"[no active dsid]");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](self, "supportedConfigurationsDSIDs"));
  id v9 = [v8 count];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](self, "supportedConfigurationsDSIDs"));
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@","]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[supported dsids=%@]",  v12));
    -[NSMutableArray addObject:](v3, "addObject:", v13);
  }

  else
  {
    -[NSMutableArray addObject:](v3, "addObject:", @"[no supported dsids]");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @" "));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (ICDAccountManagerState *)a3;
  if (self == v5)
  {
    unsigned __int8 v12 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___ICDAccountManagerState, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](v7, "supportedConfigurationsDSIDs"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](self, "supportedConfigurationsDSIDs"));
      if ([v8 isEqualToSet:v9])
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](v7, "activeConfigurationDSID"));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](self, "activeConfigurationDSID"));
        if (v10 == v11) {
          unsigned __int8 v12 = 1;
        }
        else {
          unsigned __int8 v12 = [v10 isEqual:v11];
        }
      }

      else
      {
        unsigned __int8 v12 = 0;
      }
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfiguration](self, "activeConfiguration"));
    id v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[3];
    v5[3] = v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState activeConfigurationDSID](self, "activeConfigurationDSID"));
    id v10 = [v9 copyWithZone:a3];
    __int16 v11 = (void *)v5[4];
    v5[4] = v10;

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurations](self, "supportedConfigurations"));
    id v13 = [v12 copyWithZone:a3];
    v14 = (void *)v5[1];
    v5[1] = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurationsDSIDs](self, "supportedConfigurationsDSIDs"));
    id v16 = [v15 copyWithZone:a3];
    v17 = (void *)v5[2];
    v5[2] = v16;
  }

  return v5;
}

- (id)_initWithAccounts:(id)a3 activeAccount:(id)a4 baseConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ICDAccountManagerState;
  __int16 v11 = -[ICDAccountManagerState init](&v20, "init");
  unsigned __int8 v12 = v11;
  if (v11)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[ICDAccountManagerState _configurationForAccount:baseConfiguration:]( v11,  "_configurationForAccount:baseConfiguration:",  v9,  v10));
    activeConfiguration = v12->_activeConfiguration;
    v12->_activeConfiguration = (ICConnectionConfiguration *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](v12->_activeConfiguration, "userIdentity"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountDSID]);
    v17 = (NSString *)[v16 copy];
    activeConfigurationDSID = v12->_activeConfigurationDSID;
    v12->_activeConfigurationDSID = v17;

    -[ICDAccountManagerState _updateSupportedConfigurationsWithAccounts:activeConfiguration:]( v12,  "_updateSupportedConfigurationsWithAccounts:activeConfiguration:",  v8,  v12->_activeConfiguration);
    -[ICDAccountManagerState _updateSupportedConfigurationsDSIDs](v12, "_updateSupportedConfigurationsDSIDs");
  }

  return v12;
}

- (void)_updateSupportedConfigurationsWithAccounts:(id)a3 activeConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((MSVDeviceSupportsMultipleLibraries(v7) & 1) != 0)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = [v7 copy];
    __int16 v11 = v9;
    if (v9) {
      id v12 = v9;
    }
    else {
      id v12 = (id)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v10);
    }
    v17 = v12;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10006C1D4;
    v22[3] = &unk_1001A3A98;
    v22[4] = self;
    id v23 = v17;
    v18 = v8;
    v24 = v18;
    id v19 = v17;
    [v6 enumerateObjectsUsingBlock:v22];
    objc_super v20 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = -[NSMutableSet count](v18, "count");
      *(_DWORD *)buf = 134218240;
      v26 = self;
      __int16 v27 = 2048;
      id v28 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerState %p - Supported configurations contains %lu configurations",  buf,  0x16u);
    }

    -[ICDAccountManagerState setSupportedConfigurations:](self, "setSupportedConfigurations:", v18);
  }

  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 userIdentity]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountDSID]);
      *(_DWORD *)buf = 134218242;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerState %p - Supported configurations is active configuration - dsid=%@",  buf,  0x16u);
    }

    if (v7) {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    }
    else {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    v18 = (NSMutableSet *)v16;
    -[ICDAccountManagerState setSupportedConfigurations:](self, "setSupportedConfigurations:", v16);
  }
}

- (void)_updateSupportedConfigurationsDSIDs
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurations](self, "supportedConfigurations"));
  v5 = -[NSMutableSet initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState supportedConfigurations](self, "supportedConfigurations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006C180;
  v9[3] = &unk_1001A3AC0;
  uint64_t v10 = v5;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = -[NSMutableSet copy](v8, "copy");
  -[ICDAccountManagerState setSupportedConfigurationsDSIDs:](self, "setSupportedConfigurationsDSIDs:", v7);
}

- (id)_userIdentityForAccount:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a3 accountDSID]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 longLongValue]));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)_configurationForAccount:(id)a3 baseConfiguration:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerState _userIdentityForAccount:](self, "_userIdentityForAccount:", a3));
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = (id)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
    }
    __int16 v11 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICConnectionConfiguration configurationFromSourceConfiguration:userIdentity:]( &OBJC_CLASS___ICConnectionConfiguration,  "configurationFromSourceConfiguration:userIdentity:",  v9,  v8));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (NSSet)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void)setSupportedConfigurations:(id)a3
{
}

- (NSSet)supportedConfigurationsDSIDs
{
  return self->_supportedConfigurationsDSIDs;
}

- (void)setSupportedConfigurationsDSIDs:(id)a3
{
}

- (ICConnectionConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (NSString)activeConfigurationDSID
{
  return self->_activeConfigurationDSID;
}

- (void)setActiveConfigurationDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)restoredStatedWithFallbackAccounts:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 knownActiveAccountDSID]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 knownAccountDSIDs]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  id v10 = [v9 count];
  __int16 v11 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerState %p - restoredStatedWithAccountStore: - Restoring from known accounts",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_10006C700;
    v31 = sub_10006C710;
    id v32 = 0LL;
    uint64_t v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
    objc_super v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10006C82C;
    id v23 = &unk_1001A3A48;
    id v24 = v9;
    v14 = v13;
    v25 = v14;
    id v26 = v6;
    p___int128 buf = &buf;
    [v4 enumerateObjectsUsingBlock:&v20];
    id v15 = objc_alloc((Class)a1);
    id v16 = objc_msgSend( v15,  "_initWithAccounts:activeAccount:baseConfiguration:",  v14,  *(void *)(*((void *)&buf + 1) + 40),  0,  v20,  v21,  v22,  v23);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (v12)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerState %p - restoredStatedWithAccountStore: - Restoring from all accounts [no known accounts]",  (uint8_t *)&buf,  0xCu);
    }

    id v18 = objc_msgSend((id)objc_opt_class(a1, v17), "stateForAccounts:baseConfiguration:", v4, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  return v16;
}

+ (id)stateForAccounts:(id)a3 baseConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10006C700;
  v22 = sub_10006C710;
  id v23 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006C718;
  v14[3] = &unk_1001A3A70;
  id v17 = a1;
  id v8 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  id v15 = v8;
  id v16 = &v18;
  [v6 enumerateObjectsUsingBlock:v14];
  id v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v19[5];
    *(_DWORD *)__int128 buf = 134218498;
    id v25 = a1;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerState %p - stateForAccounts:baseConfiguration: - activeAccount=%@ - supportedAccounts=%@",  buf,  0x20u);
  }

  id v11 = objc_alloc((Class)a1);
  id v12 = [v11 _initWithAccounts:v8 activeAccount:v19[5] baseConfiguration:v7];

  _Block_object_dispose(&v18, 8);
  return v12;
}

@end