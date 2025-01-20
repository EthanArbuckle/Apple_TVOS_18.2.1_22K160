@interface RMPersistentController
+ (BOOL)startPersistentController;
+ (NSManagedObjectModel)managedObjectModel;
+ (NSURL)managedObjectModelURL;
+ (RMPersistentController)sharedController;
+ (id)_createLoadedPersistentContainerWithURL:(id)a3;
+ (id)currentPersistentHistoryTokenForContainer:(id)a3;
+ (id)unarchiveObjectOfClass:(Class)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5;
+ (id)unarchiveObjectOfClasses:(id)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5;
+ (void)archiveObject:(id)a3 forKey:(id)a4 intoMetadataForPersistentStore:(id)a5;
+ (void)metadataOnPersistentStore:(id)a3 updateHandler:(id)a4;
- (NSPersistentContainer)persistentContainer;
- (RMPersistentController)initWithPersistentContainer:(id)a3;
@end

@implementation RMPersistentController

- (RMPersistentController)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMPersistentController;
  v6 = -[RMPersistentController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

+ (RMPersistentController)sharedController
{
  if (qword_1000CF260 != -1) {
    dispatch_once(&qword_1000CF260, &stru_1000BA3B8);
  }
  return (RMPersistentController *)(id)qword_1000CF258;
}

+ (BOOL)startPersistentController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));

  return byte_1000CF268;
}

+ (id)_createLoadedPersistentContainerWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog persistentController](&OBJC_CLASS___RMLog, "persistentController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10004EFCC((uint64_t)v4, v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v4));
  [v6 setType:NSSQLiteStoreType];
  [v6 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  [v6 setShouldMigrateStoreAutomatically:1];
  [v6 setShouldInferMappingModelAutomatically:1];
  v7 = objc_alloc(&OBJC_CLASS___NSPersistentContainer);
  v8 = (objc_class *)objc_opt_class(a1);
  objc_super v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMPersistentController managedObjectModel]( &OBJC_CLASS___RMPersistentController,  "managedObjectModel"));
  v12 = -[NSPersistentContainer initWithName:managedObjectModel:](v7, "initWithName:managedObjectModel:", v10, v11);

  v26 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v12, "setPersistentStoreDescriptions:", v13);

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_10004E700;
  v22 = sub_10004E710;
  id v23 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004E718;
  v17[3] = &unk_1000BA3E0;
  v17[4] = &v18;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v12,  "loadPersistentStoresWithCompletionHandler:",  v17);
  if (v19[5])
  {
    v14 = 0LL;
  }

  else
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog persistentController](&OBJC_CLASS___RMLog, "persistentController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Created loaded persistent container at %{public}@",  buf,  0xCu);
    }

    v14 = v12;
  }

  _Block_object_dispose(&v18, 8);

  return v14;
}

+ (NSURL)managedObjectModelURL
{
  if (qword_1000CF278 != -1) {
    dispatch_once(&qword_1000CF278, &stru_1000BA400);
  }
  return (NSURL *)(id)qword_1000CF270;
}

+ (NSManagedObjectModel)managedObjectModel
{
  if (qword_1000CF288 != -1) {
    dispatch_once(&qword_1000CF288, &stru_1000BA420);
  }
  return (NSManagedObjectModel *)(id)qword_1000CF280;
}

+ (void)metadataOnPersistentStore:(id)a3 updateHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004E984;
  v10[3] = &unk_1000BA448;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 persistentStoreCoordinator]);
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = v11;
  [v9 performBlockAndWait:v10];
}

+ (void)archiveObject:(id)a3 forKey:(id)a4 intoMetadataForPersistentStore:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004EAA0;
  v10[3] = &unk_1000BA470;
  id v11 = a3;
  id v12 = a4;
  id v8 = v12;
  id v9 = v11;
  [a1 metadataOnPersistentStore:a5 updateHandler:v10];
}

+ (id)unarchiveObjectOfClass:(Class)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 unarchiveObjectOfClasses:v10 forKey:v9 fromMetadataForPersistentStore:v8]);

  return v11;
}

+ (id)unarchiveObjectOfClasses:(id)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10004E700;
  id v23 = sub_10004E710;
  id v24 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004EDBC;
  v15[3] = &unk_1000BA498;
  id v11 = v9;
  id v16 = v11;
  uint64_t v18 = &v19;
  id v12 = v8;
  id v17 = v12;
  [a1 metadataOnPersistentStore:v10 updateHandler:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (id)currentPersistentHistoryTokenForContainer:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 persistentStoreCoordinator]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentStores]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentPersistentHistoryTokenFromStores:v4]);

  return v5;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void).cxx_destruct
{
}

@end