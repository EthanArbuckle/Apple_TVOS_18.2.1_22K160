@interface ANNotificationStore
+ (id)sharedStore;
- (ANNotificationStore)init;
- (BOOL)_unsafe_commitChangesInManagedObjectContext;
- (BOOL)limitPendingNotificationsForAccountTypeID:(id)a3 toMaximumCount:(unint64_t)a4;
- (BOOL)removeAllNotificationsForAccountTypeID:(id)a3;
- (BOOL)removeNotificationWithIdentifier:(id)a3;
- (BOOL)saveNotification:(id)a3;
- (id)_copyPersistentStoreFilePath;
- (id)_managedObjectModel;
- (id)_notificationsMatchingPredicate:(id)a3;
- (id)_notificationsMatchingPredicate:(id)a3 limit:(unint64_t)a4;
- (id)notificationWithIdentifier:(id)a3;
- (id)pendingNotificationsForAccountsWithTypeID:(id)a3;
- (id)pendingNotificationsWithEventID:(id)a3;
- (id)typeIdentifiersOfAccountsWithPendingNotifications;
- (void)_createManagedObjectContext;
@end

@implementation ANNotificationStore

+ (id)sharedStore
{
  if (qword_100011588 != -1) {
    dispatch_once(&qword_100011588, &stru_10000C2D0);
  }
  return (id)qword_100011580;
}

- (ANNotificationStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ANNotificationStore;
  v2 = -[ANNotificationStore init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ANNotificationStore _createManagedObjectContext](v2, "_createManagedObjectContext");
  }
  return v3;
}

- (id)pendingNotificationsForAccountsWithTypeID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"accountTypeID = %@",  a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANNotificationStore _notificationsMatchingPredicate:](self, "_notificationsMatchingPredicate:", v4));

  return v5;
}

- (id)notificationWithIdentifier:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier = %@",  a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[ANNotificationStore _notificationsMatchingPredicate:limit:]( self,  "_notificationsMatchingPredicate:limit:",  v4,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  return v6;
}

- (id)pendingNotificationsWithEventID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"eventID = %@",  a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANNotificationStore _notificationsMatchingPredicate:](self, "_notificationsMatchingPredicate:", v4));

  return v5;
}

- (id)typeIdentifiersOfAccountsWithPendingNotifications
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_100004914;
  v15 = sub_100004924;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  [v3 setPropertiesToFetch:&off_10000C760];
  [v3 setReturnsDistinctResults:1];
  [v3 setResultType:2];
  managedObjectContext = self->_managedObjectContext;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000492C;
  v8[3] = &unk_10000C2F8;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_notificationsMatchingPredicate:(id)a3
{
  return -[ANNotificationStore _notificationsMatchingPredicate:limit:]( self,  "_notificationsMatchingPredicate:limit:",  a3,  0LL);
}

- (id)_notificationsMatchingPredicate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100004914;
  v19 = sub_100004924;
  v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  [v7 setPredicate:v6];
  [v7 setReturnsObjectsAsFaults:0];
  if (a4) {
    [v7 setFetchLimit:a4];
  }
  managedObjectContext = self->_managedObjectContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004C04;
  v12[3] = &unk_10000C2F8;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  v14 = &v15;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v12);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)saveNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 identifier]);
  if (v5
    && (id v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeID]),
        v7,
        v6,
        v7))
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    managedObjectContext = self->_managedObjectContext;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100004EC4;
    v13[3] = &unk_10000C2F8;
    id v14 = v4;
    uint64_t v15 = self;
    v16 = &v17;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v13);
    BOOL v9 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    uint64_t v10 = _ANLogSystem();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100007E1C();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)limitPendingNotificationsForAccountTypeID:(id)a3 toMaximumCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = ((uint64_t (*)(void))_ANLogSystem)();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
    __int16 v44 = 1024;
    int v45 = 195;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"accountTypeID = %@",  v6));
  [v9 setPredicate:v10];

  managedObjectContext = self->_managedObjectContext;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100005548;
  v30[3] = &unk_10000C320;
  v32 = &v33;
  v30[4] = self;
  id v12 = v9;
  id v31 = v12;
  id v13 = -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v30);
  unint64_t v14 = v34[3];
  BOOL v15 = v14 >= a4;
  unint64_t v16 = v14 - a4;
  if (v15)
  {
    uint64_t v20 = _ANLogSystem(v13);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v16));
      *(_DWORD *)buf = 136315906;
      v43 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
      __int16 v44 = 1024;
      int v45 = 215;
      __int16 v46 = 2112;
      id v47 = v22;
      __int16 v48 = 2112;
      id v49 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"We need to remove %@ pending notifications for type %@\"",  buf,  0x26u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"date",  1LL));
    v41 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
    [v12 setSortDescriptors:v24];

    [v12 setFetchLimit:v16];
    [v12 setReturnsObjectsAsFaults:1];
    v25 = self->_managedObjectContext;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000055D8;
    v27[3] = &unk_10000C2F8;
    v27[4] = self;
    id v28 = v12;
    v29 = &v37;
    -[NSManagedObjectContext performBlockAndWait:](v25, "performBlockAndWait:", v27);

    BOOL v19 = *((_BYTE *)v38 + 24) != 0;
  }

  else
  {
    uint64_t v17 = _ANLogSystem(v13);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
      __int16 v44 = 1024;
      int v45 = 211;
      __int16 v46 = 2112;
      id v47 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"No need to limit pending notifications of type %@\"",  buf,  0x1Cu);
    }

    BOOL v19 = 1;
    *((_BYTE *)v38 + 24) = 1;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v19;
}

- (BOOL)removeAllNotificationsForAccountTypeID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ANLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ANNotificationStore removeAllNotificationsForAccountTypeID:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 242;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v17 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"accountTypeID = %@",  v4));
  [v7 setPredicate:v8];

  [v7 setReturnsObjectsAsFaults:1];
  managedObjectContext = self->_managedObjectContext;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005920;
  v13[3] = &unk_10000C2F8;
  void v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  BOOL v15 = buf;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v13);
  BOOL v11 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

  _Block_object_dispose(buf, 8);
  return v11;
}

- (BOOL)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ANLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ANNotificationStore removeNotificationWithIdentifier:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v19 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier = %@",  v4));
  [v7 setPredicate:v8];

  [v7 setReturnsObjectsAsFaults:1];
  [v7 setFetchLimit:1];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005C84;
  v14[3] = &unk_10000C348;
  v14[4] = self;
  id v10 = v7;
  id v15 = v10;
  id v11 = v4;
  id v16 = v11;
  char v17 = buf;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v14);
  BOOL v12 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

  _Block_object_dispose(buf, 8);
  return v12;
}

- (BOOL)_unsafe_commitChangesInManagedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  id v9 = 0LL;
  unsigned __int8 v3 = -[NSManagedObjectContext save:](managedObjectContext, "save:", &v9);
  id v4 = v9;
  uint64_t v5 = _ANLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100008190();
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100008108();
  }

  return v3;
}

- (void)_createManagedObjectContext
{
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANNotificationStore _managedObjectModel](self, "_managedObjectModel"));
  uint64_t v5 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:](v3, "initWithManagedObjectModel:", v4);
  storeCoordinator = self->_storeCoordinator;
  self->_storeCoordinator = v5;

  if (self->_storeCoordinator)
  {
    id v8 = -[ANNotificationStore _copyPersistentStoreFilePath](self, "_copyPersistentStoreFilePath");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

    v23[0] = NSInferMappingModelAutomaticallyOption;
    v23[1] = NSMigratePersistentStoresAutomaticallyOption;
    v24[0] = &__kCFBooleanTrue;
    v24[1] = &__kCFBooleanTrue;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    id v11 = self->_storeCoordinator;
    id v22 = 0LL;
    id v12 =  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v11,  "addPersistentStoreWithType:configuration:URL:options:error:",  NSSQLiteStoreType,  0LL,  v9,  v10,  &v22);
    id v13 = v22;
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = _ANLogSystem(v13);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000828C();
      }
    }

    else
    {
      v18 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v18;

      uint64_t v20 = self->_managedObjectContext;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10000609C;
      v21[3] = &unk_10000C370;
      v21[4] = self;
      -[NSManagedObjectContext performBlockAndWait:](v20, "performBlockAndWait:", v21);
    }
  }

  else
  {
    uint64_t v17 = _ANLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100008204();
    }
  }
}

- (id)_managedObjectModel
{
  if (qword_100011598 != -1) {
    dispatch_once(&qword_100011598, &stru_10000C390);
  }
  return (id)qword_100011590;
}

- (id)_copyPersistentStoreFilePath
{
  v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser(0LL, a2);
  if (v2)
  {
    unsigned __int8 v3 = v2;
    id v4 = (__CFString *)CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
    id v5 = -[__CFString mutableCopy](v4, "mutableCopy");
    [v5 appendString:@"/Library/AccountNotifications/"];
    CPFileBuildDirectoriesToPath(v5, 448LL);
    CFRelease(v3);
  }

  else
  {
    id v5 = 0LL;
  }

  [v5 appendString:@"AccountNotificationStore.sqlite"];
  id v6 = [v5 copy];

  return v6;
}

- (void).cxx_destruct
{
}

  ;
}

@end