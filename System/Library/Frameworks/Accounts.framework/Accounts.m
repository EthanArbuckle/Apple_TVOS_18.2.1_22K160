uint64_t start()
{
  uint64_t v0;
  os_log_s *v1;
  int v2;
  int v3;
  uint64_t v4;
  os_log_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  os_log_s *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSXPCListener *v21;
  NSXPCListener *v22;
  NSXPCListener *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  void *context;
  id v34;
  uint8_t buf[4];
  uid_t v36;
  context = objc_autoreleasePoolPush();
  v0 = _ACLogSystem();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v36 = getuid();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting accountsd... (uid: %u)", buf, 8u);
  }

  v2 = setiopolicy_np(9, 0, 1);
  if (v2)
  {
    v3 = v2;
    v4 = _ACLogSystem();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000031AC(v3, v5);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLsForDirectory:5 inDomains:1]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"Accounts" isDirectory:1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"Accounts3.sqlite" isDirectory:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByDeletingLastPathComponent]);
  v34 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v34];

  v14 = v34;
  if ((v13 & 1) == 0)
  {
    v15 = _ACLogSystem();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100003128((uint64_t)v11, (uint64_t)v14, v16);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACDEventLedger sharedLedger](&OBJC_CLASS___ACDEventLedger, "sharedLedger"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACDServerCreateDirectory('%@') failed: %@",  v11,  v14));
    [v17 recordEvent:v18];
  }

  v19 = [[ACDDatabase alloc] initWithDatabaseURL:v10];
  v20 = [[ACDDatabaseBackupActivity alloc] initWithDatabase:v19];
  v32 = v14;
  v21 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accountsd.accountmanager");
  v22 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accountsd.oauthsigner");
  v23 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accountsd.oopa");
  v24 = [[ACDServer alloc] initWithAccountStoreListener:v21 oauthSignerListener:v22 authenticationDialogListener:v23];
  v25 = (void *)qword_1000080C0;
  qword_1000080C0 = (uint64_t)v24;

  v26 = objc_alloc(&OBJC_CLASS___ACDAccountNotifier);
  v27 = [[ACDLazyArray alloc] initWithInitializer:&stru_100004148];
  v28 = [v26 initWithNotificationEntries:v27];
  [(id)qword_1000080C0 setAccountNotifier:v28];

  v29 = objc_alloc_init(&OBJC_CLASS___ACDClientProvider);
  [(id)qword_1000080C0 setClientProvider:v29];

  [(id)qword_1000080C0 setDatabase:v19];
  [(id)qword_1000080C0 setDatabaseBackupActivity:v20];
  [v20 registerActivityIfNeeded];
  [(id)qword_1000080C0 start];

  objc_autoreleasePoolPop(context);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v30 run];

  return 0LL;
}

NSArray *__cdecl sub_10000311C(id a1)
{
  return (NSArray *)+[ACDAccountNotifier allNotificationEntries]( &OBJC_CLASS___ACDAccountNotifier,  "allNotificationEntries");
}

void sub_100003128(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error creating database directory at %@: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000031AC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error setting io policy: %d",  (uint8_t *)v2,  8u);
}

id objc_msgSend_initWithAccountStoreListener_oauthSignerListener_authenticationDialogListener_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountStoreListener:oauthSignerListener:authenticationDialogListener:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}