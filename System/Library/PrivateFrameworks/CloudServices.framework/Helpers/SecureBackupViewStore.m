@interface SecureBackupViewStore
+ (id)URLForViewName:(id)a3;
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)migrateBTree:(id)a3 keyClass:(id)a4;
- (BOOL)migrateFromKVS;
- (BOOL)migrateView:(id)a3;
- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4;
- (BOOL)resetWithKeybag:(id)a3 error:(id *)a4;
- (NSData)backupData;
- (NSData)keybag;
- (NSData)keybagDigest;
- (NSData)manifestHash;
- (NSDictionary)backupDict;
- (NSString)recordID;
- (NSString)viewName;
- (NSURL)url;
- (SecureBackupDB)db;
- (SecureBackupViewStore)initWithViewName:(id)a3 recordID:(id)a4;
- (void)closeStore;
- (void)setRecordID:(id)a3;
@end

@implementation SecureBackupViewStore

+ (id)URLForViewName:(id)a3
{
  id v3 = a3;
  id v4 = sub_10000545C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v20 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v20]);
  id v8 = v20;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"com.apple.sbd" isDirectory:1]);

  if (v5)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v5 isDirectory:1]);

    v9 = (void *)v10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v3 isDirectory:1]);

  id v19 = v8;
  unsigned __int8 v12 = [v6 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v13 = v19;

  if ((v12 & 1) != 0)
  {
    id v15 = v11;
  }

  else
  {
    uint64_t v16 = CloudServicesLog(v14);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10004401C();
    }

    id v15 = 0LL;
  }

  return v15;
}

- (SecureBackupViewStore)initWithViewName:(id)a3 recordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SecureBackupViewStore;
  v9 = -[SecureBackupViewStore init](&v23, "init");
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_recordID, a4);
  id v12 = objc_msgSend((id)objc_opt_class(v10, v11), "URLForViewName:", v7);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  url = v10->_url;
  v10->_url = (NSURL *)v13;

  id v15 = -[SecureBackupSQLite initWithURL:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupSQLite),  "initWithURL:recordID:",  v10->_url,  v8);
  db = v10->_db;
  v10->_db = (SecureBackupDB *)v15;

  objc_storeStrong((id *)&v10->_viewName, a3);
  if (!v10->_db || !v10->_url || !v10->_viewName) {
    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore keybagDigest](v10, "keybagDigest"));

  if (v17) {
    goto LABEL_9;
  }
  uint64_t v19 = CloudServicesLog(v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "no keybag digest found, migrating view %@",  buf,  0xCu);
  }

  if (-[SecureBackupViewStore migrateView:](v10, "migrateView:", v10->_url)) {
LABEL_9:
  }
    v21 = v10;
  else {
LABEL_10:
  }
    v21 = 0LL;

  return v21;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"data"]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"hash"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"class"]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
    unsigned __int8 v14 = [v13 addItem:v10 withKey:v11 forClass:v12 error:a4];
  }

  else
  {
    uint64_t v15 = CloudServicesLog(isKindOfClass);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100044090();
    }

    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = @"Unexpected item type for kSecBackupEventAdd";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v17));
    }

    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)removeItemWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData, v7);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
    unsigned __int8 v11 = [v10 removeItemWithKey:v6 error:a4];
  }

  else
  {
    uint64_t v12 = CloudServicesLog(isKindOfClass);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000440F0();
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    v17 = @"Unexpected item type for kSecBackupEventRemove";
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v14));
    }

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSDictionary)backupDict
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000098F8;
  v7[3] = &unk_100068FE8;
  v5 = v3;
  uint64_t v8 = v5;
  [v4 enumerateKeysAndItemsUsingBlock:v7];

  return (NSDictionary *)v5;
}

- (NSData)backupData
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100009AFC;
  v17[3] = &unk_100068FE8;
  v5 = v3;
  uint64_t v18 = v5;
  [v4 enumerateKeysAndItemsUsingBlock:v17];

  if (-[NSMutableDictionary count](v5, "count"))
  {
    CFTypeRef cf = 0LL;
    id v6 = (void *)CFPropertyListCreateDERData(0LL, v5, &cf);
    if (!v6)
    {
      uint64_t v7 = CloudServicesLog(0LL);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100044150((uint64_t)&cf, v8, v9, v10, v11, v12, v13, v14);
      }

      if (cf) {
        CFRelease(cf);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSData *)v6;
}

- (BOOL)resetWithKeybag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData, v7);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  char v10 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore keybagDigest](self, "keybagDigest"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 sha1Digest]);
    unsigned int v13 = [v11 isEqual:v12];

    if (v13)
    {
      uint64_t v15 = CloudServicesLog(v14);
      NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "keybag hasn't changed, skipping DB reset",  (uint8_t *)&v28,  2u);
      }
    }

    else
    {
      NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
      [v19 resetDBWithKeybag:v6];

      uint64_t v21 = CloudServicesLog(v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore viewName](self, "viewName"));
        int v28 = 138412290;
        v29 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "reset manifest for view %@",  (uint8_t *)&v28,  0xCu);
      }

      uint64_t v25 = CloudServicesLog(v24);
      NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v6 peerIDs]);
        int v28 = 138412290;
        v29 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "backup keybag peers: %@",  (uint8_t *)&v28,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v17 = CloudServicesLog(isKindOfClass);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000441B8();
    }

    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v31 = @"Unexpected item type for resetWithKeybag";
    NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v16));
    }
  }

  return v10 & 1;
}

- (NSData)manifestHash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 manifestHash]);

  return (NSData *)v3;
}

- (NSData)keybagDigest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keybagDigest]);

  return (NSData *)v3;
}

- (NSData)keybag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keybag]);

  return (NSData *)v3;
}

- (void)closeStore
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  [v2 closeDB];
}

- (BOOL)migrateFromKVS
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForKey:@"com.apple.securebackup.record"]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * (void)i)]);
        id v18 = 0LL;
        unsigned __int8 v11 = -[SecureBackupViewStore addItem:error:](self, "addItem:error:", v10, &v18);
        id v12 = v18;

        if ((v11 & 1) == 0)
        {
          uint64_t v15 = CloudServicesLog(v13);
          NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100044218();
          }

          BOOL v14 = 0;
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)migrateView:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  unsigned int v7 = [v6 sqliteExec:@"BEGIN TRANSACTION;"];

  if (!v7)
  {
    char v34 = 1;
    int v35 = 1;
    goto LABEL_36;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  uint64_t v9 = CloudServicesLog(v8);
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "migrating %@", buf, 0xCu);
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"keybag.plist"]);
  id v12 = -[NSDictionary initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfURL:", v11);
  uint64_t v13 = v12;
  if (!v12)
  {
    id v16 = 0LL;
    BOOL v36 = 1;
LABEL_34:
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db", v47, v48, v49));
    unsigned __int8 v44 = [v43 sqliteExec:@"COMMIT TRANSACTION;"];

    int v35 = 0;
    char v34 = v44 & v36;
    goto LABEL_35;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", @"keybag"));
  id v58 = 0LL;
  unsigned int v15 = -[SecureBackupViewStore resetWithKeybag:error:](self, "resetWithKeybag:error:", v14, &v58);
  id v16 = v58;

  if (!v15)
  {
    uint64_t v37 = CloudServicesLog(v17);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1000442D8();
    }

    BOOL v36 = 0;
    goto LABEL_34;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
  unsigned int v19 = [v18 sqliteExec:@"SAVEPOINT migrate_start;"];

  if (v19)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v57 = v16;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v57]);
    id v52 = v57;

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v23)
    {
      id v24 = v23;
      v47 = v20;
      v48 = v5;
      v50 = v13;
      v51 = v11;
      id v49 = v4;
      uint64_t v25 = *(void *)v54;
      while (2)
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          int v28 = objc_autoreleasePoolPush();
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 pathExtension]);
          unsigned int v30 = [v29 isEqualToString:@"bt3"];

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringByDeletingPathExtension]);

            if (([v32 isEqualToString:@"manifest"] & 1) == 0
              && !-[SecureBackupViewStore migrateBTree:keyClass:](self, "migrateBTree:keyClass:", v27, v32))
            {
              id v39 = [v8 isEqualToString:@"KeychainV0-tomb"];
              if ((_DWORD)v39
                && (id v39 = (id)-[SecureBackupViewStore migrateFromKVS](self, "migrateFromKVS"),
                    (v39 & 1) != 0))
              {
                unsigned int v33 = 1;
                id v5 = v48;
                id v4 = v49;
                __int128 v20 = v47;
              }

              else
              {
                uint64_t v40 = CloudServicesLog(v39);
                v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                id v5 = v48;
                id v4 = v49;
                __int128 v20 = v47;
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  sub_100044278();
                }

                v42 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore db](self, "db"));
                unsigned int v33 = [v42 sqliteExec:@"ROLLBACK TO migrate_start;"];
              }

              objc_autoreleasePoolPop(v28);
              uint64_t v13 = v50;
              unsigned __int8 v11 = v51;
              goto LABEL_33;
            }
          }

          objc_autoreleasePoolPop(v28);
        }

        id v24 = [v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v24) {
          continue;
        }
        break;
      }

      unsigned int v33 = 1;
      id v5 = v48;
      id v4 = v49;
      unsigned __int8 v11 = v51;
      uint64_t v13 = v50;
      __int128 v20 = v47;
    }

    else
    {
      unsigned int v33 = 1;
    }

- (BOOL)migrateBTree:(id)a3 keyClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = dbopen((const char *)[v8 fileSystemRepresentation], 0, 438, DB_BTREE, 0);
  if (v9)
  {
    char v10 = v9;
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t v46 = 0LL;
    unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = ((uint64_t (*)(DB *, uint64_t *, uint64_t *, uint64_t))v10->seq)(v10, &v47, &v45, 3LL);
    if ((_DWORD)v12)
    {
      if ((v12 & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v13 = ((uint64_t (*)(DB *))v10->close)(v10);
        uint64_t v14 = CloudServicesLog(v13);
        unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = -[NSMutableDictionary count](v11, "count");
          id v17 = -[NSMutableDictionary count](v11, "count");
          id v18 = "s";
          *(_DWORD *)buf = 134218498;
          id v50 = v16;
          if (v17 == (id)1) {
            id v18 = "";
          }
          __int16 v51 = 2080;
          id v52 = v18;
          __int16 v53 = 2112;
          id v54 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "migrated %lu item%s in class %@",  buf,  0x20u);
        }

        BOOL v19 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }

    else
    {
      uint64_t v43 = (uint64_t)v8;
      do
      {
        if (v48 != 20)
        {
          uint64_t v37 = CloudServicesLog(v12);
          BOOL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          id v8 = (id)v43;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1000444CC(&v48, v43, v36);
          }
          goto LABEL_26;
        }

        uint64_t v25 = objc_alloc(&OBJC_CLASS___NSData);
        v26 = -[NSData initWithBytes:length:](v25, "initWithBytes:length:", v47, v48);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v26));

        if (v27)
        {
          uint64_t v38 = CloudServicesLog(v28);
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          id v8 = (id)v43;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_10004446C();
          }

          ((void (*)(DB *))v10->close)(v10);
          goto LABEL_30;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v26, v26);
        v29 = objc_alloc(&OBJC_CLASS___NSData);
        unsigned int v30 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v29,  "initWithBytesNoCopy:length:freeWhenDone:",  v45,  v46,  0LL);
        v55[0] = @"data";
        v55[1] = @"hash";
        v56[0] = v30;
        v56[1] = v26;
        v55[2] = @"class";
        v56[2] = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
        id v44 = 0LL;
        unsigned __int8 v32 = -[SecureBackupViewStore addItem:error:](self, "addItem:error:", v31, &v44);
        id v33 = v44;

        if ((v32 & 1) == 0)
        {
          uint64_t v41 = CloudServicesLog(v34);
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "failed to add item: %@", buf, 0xCu);
          }

          ((void (*)(DB *))v10->close)(v10);
          BOOL v19 = 0;
          id v8 = (id)v43;
          goto LABEL_31;
        }

        uint64_t v12 = ((uint64_t (*)(DB *, uint64_t *, uint64_t *, uint64_t))v10->seq)(v10, &v47, &v45, 7LL);
      }

      while (!(_DWORD)v12);
      id v8 = (id)v43;
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_4;
      }
    }

    uint64_t v35 = CloudServicesLog(v12);
    BOOL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1000443F0(v36);
    }
LABEL_26:

    ((void (*)(DB *))v10->close)(v10);
LABEL_30:
    BOOL v19 = 0;
    goto LABEL_31;
  }

  __int128 v20 = __error();
  int v21 = *v20;
  uint64_t v22 = CloudServicesLog(v20);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
  if (v21 == 79)
  {
    if (v24) {
      sub_100044338(v23);
    }

    BOOL v19 = 1;
  }

  else
  {
    if (v24) {
      sub_100044378();
    }

    BOOL v19 = 0;
  }

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)viewName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (SecureBackupDB)db
{
  return (SecureBackupDB *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end