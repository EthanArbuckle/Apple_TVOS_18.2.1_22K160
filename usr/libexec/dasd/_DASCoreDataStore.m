@interface _DASCoreDataStore
+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4;
- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3;
- (_DASCoreDataStorage)database;
- (_DASCoreDataStore)init;
- (_DASCoreDataStore)initWithDirectory:(id)a3 readOnly:(BOOL)a4;
- (void)createMOInMOC:(id)a3 activity:(id)a4 group:(id)a5 triggers:(id)a6;
- (void)createMOInMOC:(id)a3 group:(id)a4 activities:(id)a5;
- (void)deleteActivitiesIfRequired;
- (void)deleteActivity:(id)a3;
- (void)deleteOldActivities;
- (void)loadAllGroups:(id)a3;
- (void)loadAllTasks:(id)a3 startedTasks:(id)a4;
- (void)loadPendingLaunchTasks:(id)a3;
- (void)loadStartedTasks:(id)a3;
- (void)mocSaveAndReset:(id)a3;
- (void)saveActivities:(id)a3;
- (void)saveActivities:(id)a3 groups:(id)a4 triggersArray:(id)a5;
- (void)saveActivity:(id)a3;
- (void)saveActivity:(id)a3 group:(id)a4 triggers:(id)a5 hasStarted:(BOOL)a6;
- (void)saveActivity:(id)a3 triggers:(id)a4;
- (void)saveGroup:(id)a3;
- (void)saveGroup:(id)a3 activity:(id)a4;
- (void)saveGroups:(id)a3 activitiesArray:(id)a4;
- (void)setDatabase:(id)a3;
- (void)updateActivityCanceled:(id)a3;
- (void)updateActivityCompleted:(id)a3;
- (void)updateActivityStarted:(id)a3;
@end

@implementation _DASCoreDataStore

+ (id)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithDirectory:v6 readOnly:v4];

  return v7;
}

- (_DASCoreDataStore)init
{
  return 0LL;
}

- (_DASCoreDataStore)initWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____DASCoreDataStore;
  id v7 = -[_DASCoreDataStore init](&v16, "init");
  if (!v7) {
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/DuetActivityScheduler/Scheduler/DuetActivitySchedulerDaemon.bundle/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pathForResource:@"DuetActivityScheduler" ofType:@"momd"]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_DASCoreDataStorage storageWithDirectory:databaseName:modelURL:readOnly:]( &OBJC_CLASS____DASCoreDataStorage,  "storageWithDirectory:databaseName:modelURL:readOnly:",  v6,  @"DuetActivityScheduler",  v10,  v4));
    database = v7->_database;
    v7->_database = (_DASCoreDataStorage *)v11;

LABEL_4:
    v13 = v7;
    goto LABEL_8;
  }

  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000B2078(v14);
  }

  v13 = 0LL;
LABEL_8:

  return v13;
}

- (void)mocSaveAndReset:(id)a3
{
  id v3 = a3;
  if ([v3 hasChanges])
  {
    id v8 = 0LL;
    unsigned __int8 v4 = [v3 save:&v8];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
        *(_DWORD *)buf = 138412546;
        id v10 = v5;
        __int16 v11 = 2112;
        v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CoreData save error:  : %@, %@", buf, 0x16u);
      }
    }
  }

  else
  {
    id v5 = 0LL;
  }

  [v3 reset];
}

- (void)createMOInMOC:(id)a3 activity:(id)a4 group:(id)a5 triggers:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v24 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRecorder createOrUpdateActivity:context:]( v24,  "createOrUpdateActivity:context:",  v10,  v9));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        v20 = objc_opt_new(&OBJC_CLASS____DASTriggerRecord);
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTriggerRecord fetchOrCreateTrigger:managedObjectContext:]( v20,  "fetchOrCreateTrigger:managedObjectContext:",  v19,  v9));
        [v21 addActivitiesObject:v13];
      }

      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v16);
  }

  if (v11)
  {
    v22 = objc_opt_new(&OBJC_CLASS____DASGroupRecorder);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createOrUpdateGroup:context:](v22, "createOrUpdateGroup:context:", v11, v9));
    [v23 addActivitiesObject:v13];
  }
}

- (void)saveActivity:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100023FE0;
  v10[3] = &unk_100115120;
  id v11 = v4;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v4;
  [v8 performWithOptions:4 andBlock:v10];
}

- (void)saveActivities:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100024100;
  v10[3] = &unk_100115120;
  id v11 = v4;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v4;
  [v8 performWithOptions:4 andBlock:v10];
}

- (void)saveActivity:(id)a3 triggers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100024314;
  v14[3] = &unk_100115630;
  v14[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v10;
  [v13 performWithOptions:4 andBlock:v14];
}

- (void)saveActivities:(id)a3 groups:(id)a4 triggersArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  database = self->_database;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v12));

  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_1000244CC;
  v25[4] = sub_1000244DC;
  id v26 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000244E4;
  v18[3] = &unk_100115658;
  id v14 = v8;
  id v19 = v14;
  v24 = v25;
  id v15 = v9;
  id v20 = v15;
  v21 = self;
  id v16 = v13;
  id v22 = v16;
  id v17 = v10;
  id v23 = v17;
  [v16 performWithOptions:4 andBlock:v18];

  _Block_object_dispose(v25, 8);
}

- (void)createMOInMOC:(id)a3 group:(id)a4 activities:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRecorder createOrUpdateActivity:context:]( v10,  "createOrUpdateActivity:context:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16),  v7,  (void)v20));
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v14);
  }

  v18 = objc_opt_new(&OBJC_CLASS____DASGroupRecorder);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createOrUpdateGroup:context:](v18, "createOrUpdateGroup:context:", v8, v7));
  [v19 addActivities:v11];
}

- (void)saveGroup:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100024878;
  v10[3] = &unk_100115120;
  id v11 = v4;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v4;
  [v8 performWithOptions:4 andBlock:v10];
}

- (void)saveGroup:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000249BC;
  v14[3] = &unk_100115630;
  v14[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v10;
  [v13 performWithOptions:4 andBlock:v14];
}

- (void)saveGroups:(id)a3 activitiesArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    database = self->_database;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100024B60;
    v12[3] = &unk_100115630;
    id v13 = v6;
    id v14 = self;
    id v15 = v10;
    id v16 = v7;
    id v11 = v10;
    [v11 performWithOptions:4 andBlock:v12];
  }
}

- (void)loadAllTasks:(id)a3 startedTasks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v9));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100024D14;
  v15[3] = &unk_100115630;
  id v16 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v17 = v10;
  id v18 = v6;
  id v19 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v10;
  id v14 = v16;
  [v13 performWithOptions:4 andBlock:v15];
}

- (void)saveActivity:(id)a3 group:(id)a4 triggers:(id)a5 hasStarted:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  database = self->_database;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v14));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100024F80;
  v20[3] = &unk_100115680;
  v20[4] = self;
  id v21 = v15;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  BOOL v25 = a6;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v15;
  [v19 performWithOptions:4 andBlock:v20];
}

- (void)loadPendingLaunchTasks:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.loadPendingLaunchTasks");
  id v6 = objc_autoreleasePoolPush();
  id v7 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForPendingActivities]( &OBJC_CLASS____DASActivityRecorder,  "predicateForPendingActivities"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForLaunchActivities]( &OBJC_CLASS____DASActivityRecorder,  "predicateForLaunchActivities"));
  v26[0] = v8;
  v26[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));

  database = self->_database;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v13));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000251B0;
  v20[3] = &unk_1001156A8;
  id v15 = v5;
  id v21 = v15;
  id v22 = v7;
  id v23 = v11;
  id v24 = v14;
  id v16 = v4;
  id v25 = v16;
  id v17 = v14;
  id v18 = v11;
  id v19 = v7;
  [v17 performWithOptions:4 andBlock:v20];

  objc_autoreleasePoolPop(v6);
}

- (void)loadStartedTasks:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForStartedActivities]( &OBJC_CLASS____DASActivityRecorder,  "predicateForStartedActivities"));
  database = self->_database;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v8));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000253EC;
  v14[3] = &unk_100115630;
  id v15 = v5;
  id v16 = v6;
  id v17 = v9;
  id v18 = v4;
  id v10 = v4;
  id v11 = v9;
  id v12 = v6;
  id v13 = v5;
  [v11 performWithOptions:4 andBlock:v14];
}

- (void)loadAllGroups:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000255FC;
  v11[3] = &unk_100115120;
  id v12 = objc_opt_new(&OBJC_CLASS____DASGroupRecorder);
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  id v9 = v7;
  id v10 = v12;
  [v9 performWithOptions:4 andBlock:v11];
}

- (void)updateActivityStarted:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100025814;
  v11[3] = &unk_100115630;
  id v12 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v13 = v4;
  id v14 = v7;
  id v15 = self;
  id v8 = v7;
  id v9 = v4;
  id v10 = v12;
  [v8 performWithOptions:4 andBlock:v11];
}

- (void)updateActivityCompleted:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100025934;
  v11[3] = &unk_100115630;
  id v12 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v13 = v4;
  id v14 = v7;
  id v15 = self;
  id v8 = v7;
  id v9 = v4;
  id v10 = v12;
  [v8 performWithOptions:4 andBlock:v11];
}

- (void)updateActivityCanceled:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100025A54;
  v11[3] = &unk_100115630;
  id v12 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v13 = v4;
  id v14 = v7;
  id v15 = self;
  id v8 = v7;
  id v9 = v4;
  id v10 = v12;
  [v8 performWithOptions:4 andBlock:v11];
}

- (BOOL)deleteStorageWithObliterationOption:(BOOL)a3
{
  BOOL v3 = a3;
  database = self->_database;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  LOBYTE(v3) = -[_DASCoreDataStorage deleteStorageFor:obliterate:](database, "deleteStorageFor:obliterate:", v5, v3);

  return v3;
}

- (void)deleteActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.deleteActivity");
  id v6 = objc_autoreleasePoolPush();
  database = self->_database;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v8));

  id v10 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100025C0C;
  v15[3] = &unk_1001156A8;
  id v11 = v5;
  id v16 = v11;
  id v17 = v10;
  id v12 = v4;
  id v18 = v12;
  id v19 = v9;
  __int128 v20 = self;
  id v13 = v9;
  id v14 = v10;
  [v13 performWithOptions:4 andBlock:v15];

  objc_autoreleasePoolPop(v6);
}

- (void)deleteOldActivities
{
  BOOL v3 = (void *)os_transaction_create("com.apple.dasd.deleteOldActivities");
  id v4 = objc_autoreleasePoolPush();
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  id v8 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100025D4C;
  v12[3] = &unk_100115630;
  id v9 = v3;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  id v16 = self;
  id v10 = v7;
  id v11 = v8;
  [v10 performWithOptions:4 andBlock:v12];

  objc_autoreleasePoolPop(v4);
}

- (void)deleteActivitiesIfRequired
{
  BOOL v3 = (void *)os_transaction_create("com.apple.dasd.deleteActivitiesIfRequired");
  id v4 = objc_autoreleasePoolPush();
  database = self->_database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](database, "mocForProtectionClass:", v6));

  id v8 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100025E8C;
  v12[3] = &unk_100115630;
  id v9 = v3;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  id v16 = self;
  id v10 = v7;
  id v11 = v8;
  [v10 performWithOptions:4 andBlock:v12];

  objc_autoreleasePoolPop(v4);
}

- (_DASCoreDataStorage)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

@end