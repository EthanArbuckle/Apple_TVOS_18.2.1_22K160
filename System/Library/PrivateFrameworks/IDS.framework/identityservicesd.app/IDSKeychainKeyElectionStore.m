@interface IDSKeychainKeyElectionStore
+ (BOOL)isItemNotFoundError:(id)a3;
- (BOOL)removeFullClusterWithIdentifier:(id)a3 error:(id *)a4;
- (IDSKeychainKeyElectionStore)initWithKeychainWrapper:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (id)_fullClusterFromData:(id)a3 error:(id *)a4;
- (id)_keychainEntryForCluster:(id)a3;
- (id)fetchFullClusterWithIdentifier:(id)a3 error:(id *)a4;
- (id)identifierForFullCluster:(id)a3;
- (void)_storeData:(id)a3 forIdentifier:(id)a4 completion:(id)a5;
- (void)storeFullCluster:(id)a3 completion:(id)a4;
@end

@implementation IDSKeychainKeyElectionStore

+ (BOOL)isItemNotFoundError:(id)a3
{
  return +[IDSKeychainWrapper isItemNotFoundError:](&OBJC_CLASS___IDSKeychainWrapper, "isItemNotFoundError:", a3);
}

- (id)identifierForFullCluster:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fullAccountIdentity]);
  if (v4)
  {
    uint64_t v5 = _IDSEngramKeyElectorVersion();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 publicName]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"group-pai-%@-%@",  v6,  v7));
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to get name for full account identity cluster {cluster: %{public}@}",  buf,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

- (IDSKeychainKeyElectionStore)initWithKeychainWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSKeychainKeyElectionStore;
  v6 = -[IDSKeychainKeyElectionStore init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainWrapper, a3);
  }

  return v7;
}

- (id)fetchFullClusterWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = (os_log_s *)a3;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching cluster from keychain", buf, 2u);
  }

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "!setState keychainClusterIdentifier=%@",  buf,  0xCu);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeychainKeyElectionStore keychainWrapper](self, "keychainWrapper"));
  id v23 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataForIdentifier:v6 error:&v23]);
  id v11 = v23;

  if (!v10)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to get keychain data {identifier: %{public}@, error: %{public}@}",  buf,  0x16u);
    }

    goto LABEL_26;
  }

  id v22 = 0LL;
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  0LL,  0LL,  &v22));
  id v13 = v22;

  if (!v12)
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10069A6D4();
    }
    id v11 = v13;
    goto LABEL_25;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) == 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeychainKeyElectionStoreErrorDomain",  -1000LL,  0LL));

    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10069A794();
    }
    goto LABEL_25;
  }

  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"clusterData"));
  if (!v16)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeychainKeyElectionStoreErrorDomain",  -1000LL,  0LL));

    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_10069A734();
    }
    goto LABEL_24;
  }

  id v21 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeychainKeyElectionStore _fullClusterFromData:error:]( self,  "_fullClusterFromData:error:",  v16,  &v21));
  id v11 = v21;

  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  v19 = v18;
  if (!v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v25 = v16;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to create fullClust from clusterData {clusterData: %{private}@, error: %{public}@}",  buf,  0x16u);
    }

- (void)storeFullCluster:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Storing cluster in Keychain {fullCluster: %{public}@}",  buf,  0xCu);
  }

  id v21 = 0LL;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dataRepresentationWithError:&v21]);
  id v10 = v21;
  if (v9)
  {
    v28 = @"clusterData";
    v29 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    id v20 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v11,  200LL,  0LL,  &v20));
    id v13 = v20;

    if (v12)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeychainKeyElectionStore identifierForFullCluster:](self, "identifierForFullCluster:", v6));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000E239C;
      v17[3] = &unk_1008F85F8;
      id v18 = v6;
      id v19 = v7;
      -[IDSKeychainKeyElectionStore _storeData:forIdentifier:completion:]( self,  "_storeData:forIdentifier:completion:",  v12,  v14,  v17);
    }

    else
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        id v23 = v6;
        __int16 v24 = 2113;
        id v25 = v11;
        __int16 v26 = 2114;
        id v27 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to serialize cluster data {fullCluster: %{public}@, dictionary: %{private}@, error: %{public}@}",  buf,  0x20u);
      }

      (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v13);
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to create data from cluster {fullCluster: %{public}@, error: %{public}@}",  buf,  0x16u);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v10);
    id v13 = v10;
  }
}

- (void)_storeData:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[IDSKeychainKeyElectionStore keychainWrapper](self, "keychainWrapper"));
  [v11 saveData:v10 forIdentifier:v9 dataProtectionClass:1 withCompletion:v8];
}

- (BOOL)removeFullClusterWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Removing cluster from keychain",  (uint8_t *)&v13,  2u);
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "!setState keychainClusterIdentifier=%@",  (uint8_t *)&v13,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeychainKeyElectionStore keychainWrapper](self, "keychainWrapper"));
  unsigned __int8 v10 = [v9 removeDataForIdentifier:v6 dataProtectionClass:1 error:a4];

  if ((v10 & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10069A7F4((uint64_t)v6, (uint64_t *)a4, v11);
    }
  }

  return v10;
}

- (id)_keychainEntryForCluster:(id)a3
{
  id v10 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dataRepresentationWithError:&v10]);
  id v4 = v10;
  if (v3)
  {
    id v11 = @"clusterData";
    id v12 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v9 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v9));
    id v7 = v9;

    id v4 = v7;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_fullClusterFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPFullAccountIdentityCluster clusterWithDataRepresentation:error:]( &OBJC_CLASS___IDSMPFullAccountIdentityCluster,  "clusterWithDataRepresentation:error:",  v5,  &v12));
  id v7 = v12;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v6)
  {
    id v9 = v6;
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog accountIdentity](&OBJC_CLASS___IDSFoundationLog, "accountIdentity"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10069A874(a4, (uint64_t)v5, v10);
    }
  }

  return v6;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void).cxx_destruct
{
}

  ;
}

@end