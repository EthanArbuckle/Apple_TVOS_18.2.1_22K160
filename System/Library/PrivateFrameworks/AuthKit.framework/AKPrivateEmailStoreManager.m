@interface AKPrivateEmailStoreManager
+ (id)sharedInstance;
- (AKPrivateEmailStoreManager)init;
- (AKPrivateEmailStoreManager)initWithExecutor:(id)a3;
- (AKPrivateEmailStoreManager)initWithPath:(id)a3;
- (AKSQLiteExecutor)executor;
- (BOOL)commitChangesToCacheWithInformation:(id)a3 error:(id *)a4;
- (BOOL)removePrivateEmailForContext:(id)a3 error:(id *)a4;
- (BOOL)setCurrentEmailListVersion:(id)a3 error:(id *)a4;
- (BOOL)setPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id *)a5;
- (BOOL)setProtocolVersion:(int)a3 error:(id *)a4;
- (id)_hashKeyIfNecessary:(id)a3;
- (id)currentEmailListVersion;
- (id)emailForContext:(id)a3 error:(id *)a4;
- (id)fetchAllPrivateEmailsWithError:(id *)a3;
- (int)currentProtocolVersion;
- (void)clearDatabase:(id *)a3;
- (void)setExecutor:(id)a3;
@end

@implementation AKPrivateEmailStoreManager

+ (id)sharedInstance
{
  if (qword_10020F1E8 != -1) {
    dispatch_once(&qword_10020F1E8, &stru_1001C6668);
  }
  return (id)qword_10020F1E0;
}

- (AKPrivateEmailStoreManager)init
{
  return -[AKPrivateEmailStoreManager initWithPath:]( self,  "initWithPath:",  @"/Library/Application Support/com.apple.akd/privateEmails.db");
}

- (AKPrivateEmailStoreManager)initWithExecutor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKPrivateEmailStoreManager;
  v6 = -[AKPrivateEmailStoreManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_executor, a3);
  }

  return v7;
}

- (AKPrivateEmailStoreManager)initWithPath:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AKPrivateEmailStoreManager;
  id v5 = -[AKPrivateEmailStoreManager init](&v14, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___AKPrivateEmailStoreMigrator);
    v7 = objc_alloc(&OBJC_CLASS___AKSQLiteExecutor);
    v8 = NSHomeDirectory();
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v4]);
    v11 = -[AKSQLiteExecutor initWithDatabasePath:migrationController:]( v7,  "initWithDatabasePath:migrationController:",  v10,  v6);
    executor = v5->_executor;
    v5->_executor = v11;
  }

  return v5;
}

- (void)clearDatabase:(id *)a3
{
  executor = self->_executor;
  id v7 = 0LL;
  -[AKSQLiteExecutor wipeDatabase:](executor, "wipeDatabase:", &v7);
  id v5 = v7;
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }
}

- (BOOL)setPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = v8;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100008090;
  v34 = sub_1000080A0;
  id v35 = 0LL;
  if (!v8)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPrivateEmailErrorDomain,  -6003LL,  0LL));
    goto LABEL_9;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
  if (!v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue([v9 privateEmailAddress]),
        BOOL v12 = v11 == 0LL,
        v11,
        v10,
        v12))
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPrivateEmailErrorDomain,  -6002LL,  0LL));
LABEL_9:
    v13 = (void *)v31[5];
    v31[5] = v20;
    goto LABEL_10;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
  if (!a4)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreManager _hashKeyIfNecessary:](self, "_hashKeyIfNecessary:", v13));

    v13 = (void *)v14;
  }

  v40[0] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 privateEmailAddress]);
  v40[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"INSERT OR REPLACE INTO emails (client_key, email) VALUES (?, ?)"));
  v18 = (id *)(v31 + 5);
  id obj = (id)v31[5];
  [v17 bindParameters:v16 error:&obj];
  objc_storeStrong(v18, obj);
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000080A8;
  v23[3] = &unk_1001C6690;
  objc_copyWeak(&v27, &location);
  id v19 = v17;
  id v24 = v19;
  v25 = &v30;
  v26 = &v36;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

LABEL_10:
  if (a5) {
    *a5 = (id) v31[5];
  }
  BOOL v21 = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v21;
}

- (BOOL)removePrivateEmailForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100008090;
  v26 = sub_1000080A0;
  id v27 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
  if (v7)
  {
    if (([v6 keyAndBundleIdAreHashed] & 1) == 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreManager _hashKeyIfNecessary:](self, "_hashKeyIfNecessary:", v7));

      id v7 = (void *)v8;
    }

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"DELETE FROM emails WHERE email = (SELECT email FROM emails WHERE client_key = ?)"));
    v10 = (id *)(v23 + 5);
    id obj = (id)v23[5];
    [v9 bindParameter:v7 error:&obj];
    objc_storeStrong(v10, obj);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100008380;
    v15[3] = &unk_1001C6690;
    objc_copyWeak(&v19, &location);
    id v11 = v9;
    id v16 = v11;
    v17 = &v22;
    v18 = &v28;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPrivateEmailErrorDomain,  -6002LL,  0LL));
    id v7 = (void *)v23[5];
    v23[5] = v12;
  }

  if (a4) {
    *a4 = (id) v23[5];
  }
  char v13 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v13;
}

- (id)emailForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 key]), v8, v8))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
    id v10 = [v9 copy];

    if (([v7 keyAndBundleIdAreHashed] & 1) == 0)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[AKPrivateEmailStoreManager _hashKeyIfNecessary:](self, "_hashKeyIfNecessary:", v10));

      id v10 = (id)v11;
    }

    uint64_t v38 = 0LL;
    char v39 = (id *)&v38;
    uint64_t v40 = 0x3032000000LL;
    v41 = sub_100008090;
    v42 = sub_1000080A0;
    id v43 = 0LL;
    uint64_t v32 = 0LL;
    v33 = &v32;
    uint64_t v34 = 0x3032000000LL;
    id v35 = sub_100008090;
    uint64_t v36 = sub_1000080A0;
    id v37 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT email FROM emails WHERE client_key=?"));
    char v13 = v39;
    id obj = v39[5];
    [v12 bindParameter:v10 error:&obj];
    objc_storeStrong(v13 + 5, obj);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000872C;
    v30[3] = &unk_1001C66B8;
    v30[4] = &v32;
    [v12 setRowHandler:v30];
    objc_initWeak(&location, self);
    uint64_t v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    uint64_t v24 = sub_100008780;
    v25 = &unk_1001C66E0;
    objc_copyWeak(&v28, &location);
    id v14 = v12;
    id v26 = v14;
    id v27 = &v38;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", &v22);
    if (v33[5])
    {
      id v15 = objc_alloc(&OBJC_CLASS___AKPrivateEmail);
      id v16 = objc_msgSend(v15, "initWithAddress:forKey:", v33[5], v10, v22, v23, v24, v25);
    }

    else
    {
      id v18 = v39[5];
      if (v18)
      {
        id v19 = v18;
        id v16 = 0LL;
        *a4 = v19;
      }

      else
      {
        id v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", AKPrivateEmailErrorDomain, -6003LL, 0LL, v22, v23, v24, v25));
        *a4 = v20;

        id v16 = 0LL;
      }
    }

    id v17 = v16;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }

  else
  {
    id v17 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPrivateEmailErrorDomain,  -6002LL,  0LL));
  }

  return v17;
}

- (id)_hashKeyIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[AKPrivateEmailStoreManager currentProtocolVersion](self, "currentProtocolVersion");
  if ((int)v5 >= AKPrivateEmailProtocolVersion2)
  {
    uint64_t v8 = _AKLogHme(v5, v6);
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10012B1E8(v9);
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[AKStoreUtils hash:](&OBJC_CLASS___AKStoreUtils, "hash:", v4));
  }

  else
  {
    id v7 = v4;
  }

  id v10 = v7;

  return v10;
}

- (id)currentEmailListVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT privateEmailListVersion FROM version"));
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_100008090;
  v19[4] = sub_1000080A0;
  id v20 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100008090;
  id v17 = sub_1000080A0;
  id v18 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008A40;
  v12[3] = &unk_1001C66B8;
  v12[4] = &v13;
  [v3 setRowHandler:v12];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008A94;
  v7[3] = &unk_1001C66E0;
  objc_copyWeak(&v10, &location);
  id v4 = v3;
  id v8 = v4;
  objc_super v9 = v19;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v7);
  id v5 = (id)v14[5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
  return v5;
}

- (BOOL)setCurrentEmailListVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100008090;
  uint64_t v24 = sub_1000080A0;
  id v25 = 0LL;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE version SET privateEmailListVersion = ?"));
    id v8 = (id *)(v21 + 5);
    id obj = (id)v21[5];
    [v7 bindParameter:v6 error:&obj];
    objc_storeStrong(v8, obj);
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008D18;
    v13[3] = &unk_1001C6690;
    objc_copyWeak(&v17, &location);
    id v9 = v7;
    id v14 = v9;
    uint64_t v15 = &v20;
    id v16 = &v26;
    +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPrivateEmailErrorDomain,  -6002LL,  0LL));
    id v9 = (id)v21[5];
    v21[5] = v10;
  }

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v11 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v11;
}

- (BOOL)commitChangesToCacheWithInformation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 privateEmailListVersion]);

  if (!v7)
  {
    uint64_t v28 = _AKLogHme(v8, v9);
    char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10012B228((uint64_t)v6, v29);
    }

    BOOL v30 = 0;
    id v18 = 0LL;
    if (a4) {
      goto LABEL_47;
    }
    goto LABEL_48;
  }

  v69 = a4;
  signed int v10 = [v6 protocolVersion];
  signed int v77 = AKPrivateEmailProtocolVersion2;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  char v11 = (void *)objc_claimAutoreleasedReturnValue([v6 addedPrivateEmails]);
  id v12 = [v11 countByEnumeratingWithState:&v86 objects:v95 count:16];
  id v14 = &off_100162000;
  uint64_t v15 = &off_100162000;
  id v16 = self;
  v70 = v6;
  if (!v12)
  {

    id v18 = 0LL;
    char v20 = 1;
    goto LABEL_22;
  }

  id v17 = v12;
  id obj = v11;
  id v18 = 0LL;
  uint64_t v19 = *(void *)v87;
  char v20 = 1;
  do
  {
    BOOL v21 = 0LL;
    do
    {
      if (*(void *)v87 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)v21);
      uint64_t v23 = _AKLogHme(v12, v13);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Added:%@", buf, 0xCu);
      }

      id v85 = 0LL;
      -[AKPrivateEmailStoreManager setPrivateEmail:keyAlreadyHashed:error:]( v16,  "setPrivateEmail:keyAlreadyHashed:error:",  v22,  v10 >= v77,  &v85);
      id v12 = v85;
      id v18 = v12;
      if (v12)
      {
        uint64_t v25 = _AKLogHme(v12, v13);
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v22 key]);
          *(_DWORD *)buf = 138412546;
          v92 = v27;
          __int16 v93 = 2112;
          id v94 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to persist private email with key:%@ error: %@",  buf,  0x16u);
        }

        char v20 = 0;
      }

      BOOL v21 = (char *)v21 + 1;
    }

    while (v17 != v21);
    id v12 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    id v17 = v12;
  }

  while (v12);

  id v6 = v70;
  self = v16;
  uint64_t v15 = &off_100162000;
  id v14 = &off_100162000;
  if ((v20 & 1) != 0)
  {
LABEL_22:
    char v74 = v20;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    v73 = (void *)objc_claimAutoreleasedReturnValue([v6 removedPrivateEmails]);
    id v31 = [v73 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v31)
    {
      id v33 = v31;
      id obja = *(id *)v82;
      int v72 = *((void *)v14 + 391);
      int v71 = *((void *)v15 + 389);
      do
      {
        uint64_t v34 = 0LL;
        do
        {
          if (*(id *)v82 != obja) {
            objc_enumerationMutation(v73);
          }
          id v35 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)v34);
          uint64_t v36 = _AKLogHme(v31, v32);
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v72;
            v92 = v35;
            _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Remove:%@", buf, 0xCu);
          }

          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v35 key]);
          id v39 = objc_alloc(&OBJC_CLASS___AKPrivateEmailContext);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v35 key]);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v35 clientAppBundleId]);
          id v42 = [v39 initWithKey:v40 altDSID:&stru_1001D1450 clientAppBundleId:v41];

          [v42 setKeyAndBundleIdAreHashed:v10 >= v77];
          id v80 = 0LL;
          self = v16;
          -[AKPrivateEmailStoreManager removePrivateEmailForContext:error:]( v16,  "removePrivateEmailForContext:error:",  v42,  &v80);
          id v43 = v80;
          id v18 = v43;
          if (v43)
          {
            uint64_t v45 = _AKLogHme(v43, v44);
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v71;
              v92 = v38;
              __int16 v93 = 2112;
              id v94 = v18;
              _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Failed to remove private email with key:%@ error: %@",  buf,  0x16u);
            }

            char v74 = 0;
          }

          uint64_t v34 = (char *)v34 + 1;
        }

        while (v33 != v34);
        id v31 = [v73 countByEnumeratingWithState:&v81 objects:v90 count:16];
        id v33 = v31;
      }

      while (v31);
    }

    char v20 = v74;
    if ((v74 & 1) == 0)
    {
      id v6 = v70;
      goto LABEL_46;
    }

    id v6 = v70;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v70 privateEmailListVersion]);
    id v79 = 0LL;
    -[AKPrivateEmailStoreManager setCurrentEmailListVersion:error:]( self,  "setCurrentEmailListVersion:error:",  v47,  &v79);
    id v18 = v79;

    if (v18)
    {
      uint64_t v50 = _AKLogHme(v48, v49);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10012B2FC((uint64_t)v18, v51, v52, v53, v54, v55, v56, v57);
      }
    }

    else
    {
      signed int v58 = [v70 protocolVersion];
      if (v58 <= AKPrivateEmailInitialProtocolVersion)
      {
        id v18 = 0LL;
        goto LABEL_46;
      }

      id v78 = 0LL;
      -[AKPrivateEmailStoreManager setProtocolVersion:error:]( self,  "setProtocolVersion:error:",  [v70 protocolVersion],  &v78);
      id v59 = v78;
      id v18 = v59;
      if (!v59) {
        goto LABEL_46;
      }
      uint64_t v61 = _AKLogHme(v59, v60);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10012B298((uint64_t)v18, v51, v62, v63, v64, v65, v66, v67);
      }
    }

    char v20 = 0;
  }

- (int)currentProtocolVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT protocol_version FROM version"));
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_100008090;
  v21[4] = sub_1000080A0;
  id v22 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100008090;
  uint64_t v19 = sub_1000080A0;
  id v20 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009588;
  v14[3] = &unk_1001C66B8;
  v14[4] = &v15;
  [v3 setRowHandler:v14];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000095DC;
  v9[3] = &unk_1001C66E0;
  objc_copyWeak(&v12, &location);
  id v4 = v3;
  id v10 = v4;
  char v11 = v21;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v9);
  int v5 = AKPrivateEmailInitialProtocolVersion;
  id v6 = (void *)v16[5];
  if (v6)
  {
    signed int v7 = [v6 intValue];
    if (v7 > v5) {
      int v5 = v7;
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(v21, 8);
  return v5;
}

- (BOOL)setProtocolVersion:(int)a3 error:(id *)a4
{
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100008090;
  uint64_t v24 = sub_1000080A0;
  id v25 = 0LL;
  signed int v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"UPDATE version SET protocol_version = ?"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v9 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  [v7 bindParameter:v8 error:&obj];
  objc_storeStrong(v9, obj);

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000983C;
  v13[3] = &unk_1001C6690;
  objc_copyWeak(&v17, &location);
  id v10 = v7;
  id v14 = v10;
  uint64_t v15 = &v20;
  id v16 = &v26;
  +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v13);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v11 = *((_BYTE *)v27 + 24);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v11;
}

- (id)fetchAllPrivateEmailsWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AKSQLiteQuery queryWithString:]( &OBJC_CLASS___AKSQLiteQuery,  "queryWithString:",  @"SELECT email, client_key FROM emails"));
  uint64_t v26 = 0LL;
  v27[0] = &v26;
  v27[1] = 0x3032000000LL;
  v27[2] = sub_100008090;
  v27[3] = sub_1000080A0;
  id v28 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100009ABC;
  v24[3] = &unk_1001C6708;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v25 = v5;
  [v4 setRowHandler:v24];
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100009B5C;
  v19[3] = &unk_1001C66E0;
  objc_copyWeak(&v22, &location);
  id v6 = v4;
  id v20 = v6;
  BOOL v21 = &v26;
  id v7 = +[AKSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___AKSQLiteExecutor, "performBlockAndWait:", v19);
  if (*(void *)(v27[0] + 40LL))
  {
    uint64_t v9 = _AKLogHme(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10012B360((uint64_t)v27, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  id v17 = [v5 copy];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (AKSQLiteExecutor)executor
{
  return self->_executor;
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end