@interface _DASCoreDataStorage
+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4;
+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4;
+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5;
- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4;
- (BOOL)readOnly;
- (NSDictionary)paths;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)managedObjectContexts;
- (NSMutableDictionary)persistentStoreCoordinators;
- (NSString)databaseDirectory;
- (NSString)databaseName;
- (NSURL)modelURL;
- (OS_dispatch_queue)mocQueue;
- (OS_dispatch_queue)pscQueue;
- (_DASCoreDataStorage)init;
- (_DASCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
- (_DASDataProtectionStateMonitor)dataProtectionMonitor;
- (id)mocForProtectionClass:(id)a3;
- (id)persistentStoreCoordinatorFor:(id)a3;
- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4;
- (void)invalidateManagedObjectContextFor:(id)a3;
- (void)invalidatePersistentStoreCoordinatorFor:(id)a3;
- (void)setManagedObjectModel:(id)a3;
@end

@implementation _DASCoreDataStorage

- (_DASCoreDataStorage)init
{
  return 0LL;
}

+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDirectory:v12 databaseName:v11 modelURL:v10 readOnly:v6];

  return v13;
}

- (_DASCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS____DASCoreDataStorage;
  id v11 = -[_DASCoreDataStorage init](&v41, "init");
  id v12 = v11;
  if (v11)
  {
    p_databaseDirectory = &v11->_databaseDirectory;
    objc_storeStrong((id *)&v11->_databaseDirectory, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_modelURL, a5);
    v12->_readOnly = a6;
    dispatch_queue_t v14 = dispatch_queue_create("_DASCoreDataStore.mocQueue", 0LL);
    mocQueue = v12->_mocQueue;
    v12->_mocQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("_DASCoreDataStore.queuePSC", 0LL);
    pscQueue = v12->_pscQueue;
    v12->_pscQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  *p_databaseDirectory,  v12->_databaseName));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.db",  v18,  @"ClassA"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.db",  v18,  @"ClassC"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.db",  v18,  @"ClassD"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassA]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassA"));
    v42[0] = v22;
    v43[0] = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    v42[1] = v23;
    v43[1] = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassD]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassD"));
    v42[2] = v24;
    v43[2] = v21;
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));
    paths = v12->_paths;
    v12->_paths = (NSDictionary *)v25;

    managedObjectModel = v12->_managedObjectModel;
    v12->_managedObjectModel = 0LL;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    managedObjectContexts = v12->_managedObjectContexts;
    v12->_managedObjectContexts = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    persistentStoreCoordinators = v12->_persistentStoreCoordinators;
    v12->_persistentStoreCoordinators = (NSMutableDictionary *)v30;

    v32 = objc_opt_new(&OBJC_CLASS____DASDataProtectionStateMonitor);
    dataProtectionMonitor = v12->_dataProtectionMonitor;
    v12->_dataProtectionMonitor = v32;

    objc_initWeak(&location, v12);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100021354;
    v38[3] = &unk_100115008;
    objc_copyWeak(&v39, &location);
    -[_DASDataProtectionStateMonitor setChangeHandler:](v12->_dataProtectionMonitor, "setChangeHandler:", v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4
{
  if (!a4)
  {
    id v5 = a3;
    -[_DASCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v5);
    -[_DASCoreDataStorage invalidatePersistentStoreCoordinatorFor:]( self,  "invalidatePersistentStoreCoordinatorFor:",  v5);
  }

- (void)invalidateManagedObjectContextFor:(id)a3
{
  id v4 = a3;
  mocQueue = (dispatch_queue_s *)self->_mocQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021478;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mocQueue, block);
}

- (void)invalidatePersistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  pscQueue = (dispatch_queue_s *)self->_pscQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000215C4;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(pscQueue, block);
}

- (NSManagedObjectModel)managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (!managedObjectModel)
  {
    if (!self->_modelURL)
    {
      NSLog(@"Missing model URL!", a2);
      id v6 = 0LL;
      return v6;
    }

    id v4 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  self->_modelURL);
    id v5 = self->_managedObjectModel;
    self->_managedObjectModel = v4;

    managedObjectModel = self->_managedObjectModel;
  }

  id v6 = managedObjectModel;
  return v6;
}

+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v9[0] = NSPersistentStoreConnectionPoolMaxSizeKey;
  v9[1] = NSMigratePersistentStoresAutomaticallyOption;
  v10[0] = &off_100121A80;
  v10[1] = &__kCFBooleanTrue;
  v10[2] = &__kCFBooleanTrue;
  v9[2] = NSInferMappingModelAutomaticallyOption;
  v9[3] = NSReadOnlyPersistentStoreOption;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v9[4] = NSPersistentStoreFileProtectionKey;
  v10[3] = v6;
  v10[4] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL));

  return v7;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1000219CC;
  v23 = sub_1000219DC;
  id v24 = 0LL;
  uint64_t v15 = 0LL;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  pscQueue = (dispatch_queue_s *)self->_pscQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000219E4;
  block[3] = &unk_100115538;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  unsigned __int8 v14 = v5;
  id v11 = v7;
  id v13 = &v15;
  dispatch_sync(pscQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DASCoreDataStorage invalidatePersistentStoreCoordinatorFor:]( self,  "invalidatePersistentStoreCoordinatorFor:",  v7);
    id v8 = 0LL;
  }

  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (id)mocForProtectionClass:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtectionMonitor, "isDataAvailableFor:", v4);
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1000219CC;
  v23 = sub_1000219DC;
  id v24 = 0LL;
  uint64_t v15 = 0LL;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  mocQueue = (dispatch_queue_s *)self->_mocQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021E70;
  block[3] = &unk_100115538;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  unsigned __int8 v14 = v5;
  id v11 = v7;
  id v13 = &v15;
  dispatch_sync(mocQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    -[_DASCoreDataStorage invalidateManagedObjectContextFor:](self, "invalidateManagedObjectContextFor:", v7);
    id v8 = 0LL;
  }

  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5
{
  BOOL readOnly = self->_readOnly;
  if (!self->_readOnly)
  {
    BOOL v6 = a5;
    paths = self->_paths;
    id v9 = a3;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](paths, "objectForKeyedSubscript:", a4));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));

    if (v6)
    {
      v19[0] = NSPersistentStoreUnlinkDestroyOption;
      v19[1] = NSPersistentStoreForceDestroyOption;
      v20[0] = &__kCFBooleanTrue;
      v20[1] = &__kCFBooleanTrue;
      id v12 = (void **)v20;
      id v13 = v19;
      uint64_t v14 = 2LL;
    }

    else
    {
      uint64_t v17 = NSPersistentStoreUnlinkDestroyOption;
      char v18 = &__kCFBooleanTrue;
      id v12 = &v18;
      id v13 = &v17;
      uint64_t v14 = 1LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  v14));
    [v9 _destroyPersistentStoreAtURL:v11 withType:NSSQLiteStoreType options:v15 error:0];
  }

  return !readOnly;
}

- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4
{
  id v6 = a3;
  if (self->_readOnly)
  {
    BOOL v7 = 0;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage mocForProtectionClass:](self, "mocForProtectionClass:", v6));
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCoreDataStorage persistentStoreCoordinatorFor:](self, "persistentStoreCoordinatorFor:", v6));
      if (v9)
      {
        uint64_t v16 = 0LL;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000LL;
        char v19 = 0;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10002224C;
        v11[3] = &unk_100115560;
        v11[4] = self;
        id v12 = v6;
        uint64_t v14 = &v16;
        id v13 = v9;
        BOOL v15 = a4;
        [v8 performWithOptions:4 andBlock:v11];
        BOOL v7 = *((_BYTE *)v17 + 24) != 0;

        _Block_object_dispose(&v16, 8);
      }

      else
      {
        BOOL v7 = 0;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));

  LOBYTE(a4) = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a4];
  return (char)a4;
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (NSMutableDictionary)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (NSMutableDictionary)persistentStoreCoordinators
{
  return self->_persistentStoreCoordinators;
}

- (OS_dispatch_queue)mocQueue
{
  return self->_mocQueue;
}

- (OS_dispatch_queue)pscQueue
{
  return self->_pscQueue;
}

- (_DASDataProtectionStateMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void).cxx_destruct
{
}

@end