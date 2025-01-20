@interface TransparencyManagedDataStoreController
- (BOOL)createContexts:(id *)a3;
- (BOOL)createDataStores:(id)a3 followup:(id)a4 error:(id *)a5;
- (BOOL)loadedStore;
- (BOOL)moveAsideDatabase:(id)a3;
- (BOOL)movedDatabase;
- (BOOL)saveContext:(id)a3 error:(id *)a4;
- (BOOL)shouldMoveAsideDatabase:(id)a3;
- (KTCondition)loadComplete;
- (NSManagedObjectContext)backgroundContext;
- (NSManagedObjectContext)topLevelContext;
- (NSPersistentContainer)persistentContainer;
- (TransparencyAnalytics)logger;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyManagedDataStore)mainQueueDataStore;
- (TransparencyManagedDataStore)xpcQueueDataStore;
- (TransparencyManagedDataStoreController)init;
- (TransparencyManagedDataStoreController)initWithContainer:(id)a3 logger:(id)a4;
- (TransparencyPeerOverrides)peerOverrides;
- (id)bundleURL;
- (int64_t)currentSequenceId:(id *)a3;
- (int64_t)sequenceId;
- (int64_t)waitSetupComplete:(int64_t)a3;
- (void)createPeerOverrides;
- (void)loadPersistentStores;
- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7;
- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6;
- (void)setDataStore:(id)a3;
- (void)setLoadComplete:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMainQueueDataStore:(id)a3;
- (void)setMovedDatabase:(BOOL)a3;
- (void)setPeerOverrides:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setTopLevelContext:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setXpcQueueDataStore:(id)a3;
- (void)setupComplete;
@end

@implementation TransparencyManagedDataStoreController

- (TransparencyManagedDataStoreController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  v4 = -[TransparencyManagedDataStoreController initWithContainer:logger:](self, "initWithContainer:logger:", 0LL, v3);

  return v4;
}

- (TransparencyManagedDataStoreController)initWithContainer:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TransparencyManagedDataStoreController;
  v8 = -[TransparencyManagedDataStoreController init](&v23, "init");
  if (v8)
  {
    +[KTLoggableDataArrayTransformer registerTransformer]( &OBJC_CLASS___KTLoggableDataArrayTransformer,  "registerTransformer");
    +[KTNSErrorValueTransformer registerTransformer](&OBJC_CLASS___KTNSErrorValueTransformer, "registerTransformer");
    v9 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[TransparencyManagedDataStoreController setLoadComplete:](v8, "setLoadComplete:", v9);

    -[TransparencyManagedDataStoreController setLogger:](v8, "setLogger:", v7);
    if (v6)
    {
      -[TransparencyManagedDataStoreController setPersistentContainer:](v8, "setPersistentContainer:", v6);
      -[TransparencyManagedDataStoreController createContexts:](v8, "createContexts:", 0LL);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFollowup instance](&OBJC_CLASS___TransparencyFollowup, "instance"));
      -[TransparencyManagedDataStoreController createDataStores:followup:error:]( v8,  "createDataStores:followup:error:",  v7,  v10,  0LL);

      v11 = (TransparencyManagedDataStoreController *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStoreController loadComplete]( v8,  "loadComplete"));
      -[TransparencyManagedDataStoreController fulfill](v11, "fulfill");
    }

    else
    {
      v11 = (TransparencyManagedDataStoreController *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStoreController bundleURL]( v8,  "bundleURL"));
      if (!v11)
      {
        -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:]( v8,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"Initialization",  0LL,  -209LL,  0LL);
        goto LABEL_6;
      }

      id v22 = 0LL;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  &v22));
      id v14 = v22;
      if (!v13)
      {
        -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:]( v8,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"Initialization",  0LL,  -37LL,  v14);

        v11 = 0LL;
        goto LABEL_6;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:@"TransparencyModel.sqlite"]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v15));

      [v16 setOption:NSFileProtectionNone forKey:NSPersistentStoreFileProtectionKey];
      v17 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v11);
      v18 = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"TransparencyModel",  v17);
      persistentContainer = v8->_persistentContainer;
      v8->_persistentContainer = v18;

      v20 = v8->_persistentContainer;
      v24 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      -[NSPersistentContainer setPersistentStoreDescriptions:](v20, "setPersistentStoreDescriptions:", v21);

      -[TransparencyManagedDataStoreController loadPersistentStores](v8, "loadPersistentStores");
    }

    -[TransparencyManagedDataStoreController createPeerOverrides](v8, "createPeerOverrides");
  }

  v11 = v8;
LABEL_6:

  return v11;
}

- (id)bundleURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.Transparency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForResource:@"TransparencyModel" withExtension:@"momd"]);

  return v3;
}

- (BOOL)loadedStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)shouldMoveAsideDatabase:(id)a3
{
  id v4 = a3;
  if (-[TransparencyManagedDataStoreController movedDatabase](self, "movedDatabase"))
  {
    BOOL v5 = 0;
  }

  else if ([v4 code] == (id)134130 {
         || [v4 code] == (id)134020
  }
         || [v4 code] == (id)134100
         || [v4 code] == (id)259
         || [v4 code] == (id)256
         || [v4 code] == (id)134110)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)moveAsideDatabase:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"TransparencyModel.sqlite"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_random](&OBJC_CLASS___NSData, "kt_random"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));

  id v10 = [v4 code];
  v41 = (void *)v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingFormat:@".%@.%ld", v9, v10]);
  if (qword_1002E6540 != -1) {
    dispatch_once(&qword_1002E6540, &stru_10027AFE8);
  }
  v12 = (os_log_s *)qword_1002E6548;
  if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v47 = (uint64_t)v7;
    __int16 v48 = 2112;
    uint64_t v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Move Transparency store at %@ to %@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
  if (os_variant_allows_internal_security_policies("com.apple.Transparency"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistentStoreCoordinator]);
    id v45 = 0LL;
    unsigned __int8 v17 = [v16 replacePersistentStoreAtURL:v14 destinationOptions:0 withPersistentStoreFromURL:v13 sourceOptions:0 storeType:NSSQLiteStoreType error:&v45];
    id v18 = v45;

    if ((v17 & 1) == 0)
    {
      if (qword_1002E6540 != -1) {
        dispatch_once(&qword_1002E6540, &stru_10027B008);
      }
      v19 = (os_log_s *)qword_1002E6548;
      if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v47 = v14;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v13;
        __int16 v50 = 2114;
        id v51 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Could not replace store at %@ from %@: %{public}@",  buf,  0x20u);
      }
    }
  }

  else
  {
    id v18 = 0LL;
  }

  v40 = (void *)v11;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 persistentStoreCoordinator]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 persistentStoreForURL:v13]);

  objc_super v23 = (void *)v14;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 persistentStoreCoordinator]);
    id v44 = v18;
    unsigned __int8 v26 = [v25 removePersistentStore:v22 error:&v44];
    id v27 = v44;

    if ((v26 & 1) == 0)
    {
      if (qword_1002E6540 != -1) {
        dispatch_once(&qword_1002E6540, &stru_10027B028);
      }
      v28 = (os_log_s *)qword_1002E6548;
      if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = (uint64_t)v27;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Failed to remove bad store from coordinator: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v27 = v18;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 persistentStoreCoordinator]);
  id v43 = v27;
  unsigned __int8 v31 = [v30 destroyPersistentStoreAtURL:v13 withType:NSSQLiteStoreType options:0 error:&v43];
  id v32 = v43;

  if ((v31 & 1) != 0)
  {
    BOOL v33 = 1;
  }

  else
  {
    if (qword_1002E6540 != -1) {
      dispatch_once(&qword_1002E6540, &stru_10027B048);
    }
    v34 = (os_log_s *)qword_1002E6548;
    if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = (uint64_t)v13;
      __int16 v48 = 2114;
      uint64_t v49 = (uint64_t)v32;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Could not destroy store at %@: %{public}@",  buf,  0x16u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v42 = v32;
    unsigned __int8 v36 = [v35 removeItemAtURL:v13 error:&v42];
    id v37 = v42;

    if ((v36 & 1) != 0)
    {
      BOOL v33 = 1;
    }

    else
    {
      if (qword_1002E6540 != -1) {
        dispatch_once(&qword_1002E6540, &stru_10027B068);
      }
      v38 = (os_log_s *)qword_1002E6548;
      if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = (uint64_t)v13;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v37;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Could not delete file at %@: %{public}@",  buf,  0x16u);
      }

      BOOL v33 = 0;
    }

    id v32 = v37;
  }

  return v33;
}

- (BOOL)createContexts:(id *)a3
{
  self->_sequenceId = -[TransparencyManagedDataStoreController currentSequenceId:](self, "currentSequenceId:");
  return !a3 || !*a3;
}

- (void)setUpdateDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  [v5 setUpdateDelegate:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  [v6 setUpdateDelegate:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  [v7 setUpdateDelegate:v4];
}

- (void)setStaticKeyStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  [v5 setStaticKeyStore:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  [v6 setStaticKeyStore:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  [v7 setStaticKeyStore:v4];
}

- (void)createPeerOverrides
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___TransparencyPeerOverrides);
  -[TransparencyManagedDataStoreController setPeerOverrides:](self, "setPeerOverrides:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  [v5 setPeerOverridesStore:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController xpcQueueDataStore](self, "xpcQueueDataStore"));
  [v7 setPeerOverridesStore:v6];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController peerOverrides](self, "peerOverrides"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController mainQueueDataStore](self, "mainQueueDataStore"));
  [v8 setPeerOverridesStore:v9];
}

- (BOOL)createDataStores:(id)a3 followup:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[TransparencyManagedDataStore initWithController:followup:logger:]( objc_alloc(&OBJC_CLASS___TransparencyManagedDataStore),  "initWithController:followup:logger:",  self,  v9,  v8);
  -[TransparencyManagedDataStoreController setDataStore:](self, "setDataStore:", v10);

  uint64_t v11 = (TransparencyManagedDataStore *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
  unsigned int v12 = -[TransparencyManagedDataStore populateMissingLogHeadHashes:](v11, "populateMissingLogHeadHashes:", a5);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController dataStore](self, "dataStore"));
    unsigned int v14 = [v13 populateExistingRequestsToLookupTable:a5];

    if (!v14)
    {
      LOBYTE(v12) = 0;
      goto LABEL_6;
    }

    v15 = -[TransparencyManagedDataStore initWithController:followup:logger:]( objc_alloc(&OBJC_CLASS___TransparencyManagedDataStore),  "initWithController:followup:logger:",  self,  v9,  v8);
    -[TransparencyManagedDataStoreController setXpcQueueDataStore:](self, "setXpcQueueDataStore:", v15);

    uint64_t v11 = -[TransparencyManagedDataStore initWithController:followup:logger:]( objc_alloc(&OBJC_CLASS___TransparencyManagedDataStore),  "initWithController:followup:logger:",  self,  v9,  v8);
    -[TransparencyManagedDataStoreController setMainQueueDataStore:](self, "setMainQueueDataStore:", v11);
  }

LABEL_6:
  return v12;
}

- (int64_t)currentSequenceId:(id *)a3
{
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  unsigned __int8 v17 = sub_10004FCC0;
  id v18 = sub_10004FCD0;
  id v19 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004FCD8;
  v9[3] = &unk_10027B090;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController backgroundContext](self, "backgroundContext"));
  unsigned int v12 = &v14;
  v13 = &v20;
  id v10 = v5;
  uint64_t v11 = self;
  [v5 performBlockAndWait:v9];
  if (a3)
  {
    id v6 = (void *)v15[5];
    if (v6) {
      *a3 = v6;
    }
  }

  int64_t v7 = v21[3];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v7;
}

- (void)loadPersistentStores
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004FF28;
  v4[3] = &unk_10027B0F8;
  v4[4] = self;
  [v3 loadPersistentStoresWithCompletionHandler:v4];
}

- (void)setupComplete
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController loadComplete](self, "loadComplete"));
  [v2 fulfill];
}

- (int64_t)waitSetupComplete:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController loadComplete](self, "loadComplete"));
  id v5 = [v4 wait:a3];

  return (int64_t)v5;
}

- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6
{
}

- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController logger](self, "logger"));
  uint64_t v15 = kTransparencyErrorDatabase;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v12));

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v15,  a6,  v16,  @"CoreData report event"));
  v20[0] = @"entityType";
  v20[1] = @"write";
  v21[0] = v13;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  v21[1] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

  [v14 logResultForEvent:@"ktCoreDataEvent" hardFailure:v9 result:v17 withAttributes:v19];
}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16[0] = 0LL;
  unsigned __int8 v7 = [v6 save:v16];
  id v8 = v16[0];
  BOOL v9 = v8;
  if (v8) {
    char v10 = v7;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) != 0)
  {
    uint64_t v11 = v8;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v8));

    if (a4 && v11) {
      *a4 = v11;
    }
    -[TransparencyManagedDataStoreController reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"Persistence",  1LL,  -129LL,  v11);
    if (qword_1002E6540 != -1) {
      dispatch_once(&qword_1002E6540, &stru_10027B118);
    }
    id v12 = (os_log_s *)qword_1002E6548;
    if (os_log_type_enabled((os_log_t)qword_1002E6548, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error saving context: %@", buf, 0xCu);
    }

    if (qword_1002E6540 != -1) {
      dispatch_once(&qword_1002E6540, &stru_10027B138);
    }
    id v13 = (os_log_s *)(id)qword_1002E6548;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Calling stack: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (int64_t)sequenceId
{
  return &self->_sequenceId;
}

- (NSManagedObjectContext)backgroundContext
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentStoreCoordinator]);

  if (v4)
  {
    id v5 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setUndoManager:](v5, "setUndoManager:", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStoreController persistentContainer](self, "persistentContainer"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStoreCoordinator]);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v5, "setPersistentStoreCoordinator:", v7);

    id v8 = objc_alloc_init(&OBJC_CLASS___TransparencyMergePolicy);
    -[NSManagedObjectContext setMergePolicy:](v5, "setMergePolicy:", v8);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSManagedObjectContext)topLevelContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTopLevelContext:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyManagedDataStore)xpcQueueDataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setXpcQueueDataStore:(id)a3
{
}

- (TransparencyManagedDataStore)mainQueueDataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMainQueueDataStore:(id)a3
{
}

- (TransparencyPeerOverrides)peerOverrides
{
  return (TransparencyPeerOverrides *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPeerOverrides:(id)a3
{
}

- (BOOL)movedDatabase
{
  return self->_movedDatabase;
}

- (void)setMovedDatabase:(BOOL)a3
{
  self->_movedDatabase = a3;
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLogger:(id)a3
{
}

- (KTCondition)loadComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLoadComplete:(id)a3
{
}

- (void).cxx_destruct
{
}

@end