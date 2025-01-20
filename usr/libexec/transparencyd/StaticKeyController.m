@interface StaticKeyController
+ (id)cloudPersistentStoreDescription:(id)a3;
+ (id)persistentStoreDescriptions:(id)a3;
- (BOOL)deleteStaticKey:(id)a3 error:(id *)a4;
- (BOOL)deleteStaticKeyByContactExternalURI:(id)a3 error:(id *)a4;
- (BOOL)deleteStaticKeyByContactIdentifier:(id)a3 error:(id *)a4;
- (BOOL)exportToCloud;
- (BOOL)haveContact:(id)a3 error:(id *)a4;
- (BOOL)importFromCloud;
- (BOOL)resetCloudZone:(id *)a3;
- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5;
- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4;
- (BOOL)shouldDoInitialCloudSyncing:(id)a3;
- (BOOL)triggerSync:(id *)a3;
- (KTContactsStoreProtocol)contactStore;
- (KTNotificationCenter)notificationCenter;
- (NSPersistentCloudKitContainer)cloudContainer;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (STCConfigurationStoreDelegate)configurationStore;
- (StaticKeyContactsProtocol)contacts;
- (StaticKeyIDSDelegate)idsDelegate;
- (id)dataFromHistoryToken:(id)a3;
- (id)fetchContactsSyncToken;
- (id)fetchHandles:(id)a3 moc:(id)a4 error:(id *)a5;
- (id)findStaticKeyByContact:(id)a3 error:(id *)a4;
- (id)findStaticKeyByContactExternalURI:(id)a3 error:(id *)a4;
- (id)findStaticKeyByContactIdentifier:(id)a3 error:(id *)a4;
- (id)findStaticKeyByHandle:(id)a3 error:(id *)a4;
- (id)findStaticKeyByKey:(id)a3 error:(id *)a4;
- (id)historyTokenFromData:(id)a3;
- (id)initCloudDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 complete:(id)a7;
- (id)initLocalDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 contactStore:(id)a7 complete:(id)a8;
- (id)lastContactSyncDate;
- (id)listStaticKey:(id *)a3;
- (id)mapStaticKeyToStoreEntry:(id)a3 handles:(id)a4 moc:(id)a5 error:(id *)a6;
- (id)staticKeyModelURL;
- (id)storeStaticKey:(id)a3 contactIdentifier:(id)a4 contactExternalIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7;
- (id)validateStaticKeyStoreMappingByContactExternalURI:(id)a3 error:(id *)a4;
- (id)validateStaticKeyStoreMappingByContactIdentifer:(id)a3 error:(id *)a4;
- (id)validateStaticKeyStoreMappingByKey:(id)a3 error:(id *)a4;
- (id)validateStoreEntry:(id)a3 error:(id *)a4;
- (void)consumeContactsChangeHistory;
- (void)deleteContact:(id)a3 contactExternalURI:(id)a4;
- (void)drainContactsSyncing;
- (void)fetchPeerHandles:(id)a3 application:(id)a4 complete:(id)a5;
- (void)launchCloudSyncing:(id)a3 initialDelay:(double)a4;
- (void)peerVerificationUpdated:(id)a3;
- (void)postChangeForEntry:(id)a3 publicAccountIdentity:(id)a4;
- (void)processCoreDataHistory;
- (void)remoteUpdate:(id)a3;
- (void)setCloudContainer:(id)a3;
- (void)setConfigurationStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContactsSyncController:(id)a3;
- (void)setIdsDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setQueue:(id)a3;
- (void)startContactsSyncing;
- (void)storeContactsSyncToken:(id)a3;
- (void)updateContact:(id)a3;
- (void)updateLastContactSyncDate;
- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5;
@end

@implementation StaticKeyController

- (id)initCloudDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 complete:(id)a7
{
  id v12 = a3;
  id v46 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "StaticKeyController: %@",  (uint8_t *)&buf,  0xCu);
  }

  if (v12)
  {
    id v16 = 0LL;
LABEL_5:
    v52.receiver = self;
    v52.super_class = (Class)&OBJC_CLASS___StaticKeyController;
    v17 = -[StaticKeyController init](&v52, "init", v46);
    v18 = v17;
    if (v17)
    {
      if (v14)
      {
        -[StaticKeyController setNotificationCenter:](v17, "setNotificationCenter:", v14);
      }

      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
        -[StaticKeyController setNotificationCenter:](v18, "setNotificationCenter:", v25);
      }

      -[StaticKeyController setIdsDelegate:](v18, "setIdsDelegate:", v46);
      -[StaticKeyController setConfigurationStore:](v18, "setConfigurationStore:", v13);
      v26 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
      v27 = -[KTContactsStore initWithContactStore:]( objc_alloc(&OBJC_CLASS___KTContactsStore),  "initWithContactStore:",  v26);
      -[StaticKeyController setContactStore:](v18, "setContactStore:", v27);

      dispatch_queue_t v28 = dispatch_queue_create("StaticKeyController", 0LL);
      -[StaticKeyController setQueue:](v18, "setQueue:", v28);

      v29 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](v18, "queue"));
      dispatch_suspend(v29);

      os_log_t v30 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
      -[StaticKeyController setLog:](v18, "setLog:", v30);

      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](v18, "log"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "setup StaticKeyController: %@",  (uint8_t *)&buf,  0xCu);
      }

      v32 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController staticKeyModelURL](v18, "staticKeyModelURL"));
      v34 = -[NSManagedObjectModel initWithContentsOfURL:](v32, "initWithContentsOfURL:", v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[StaticKeyController cloudPersistentStoreDescription:]( &OBJC_CLASS___StaticKeyController,  "cloudPersistentStoreDescription:",  v12));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentCloudKitContainer persistentContainerWithName:managedObjectModel:]( &OBJC_CLASS___NSPersistentCloudKitContainer,  "persistentContainerWithName:managedObjectModel:",  @"StaticKey",  v34));
      -[StaticKeyController setCloudContainer:](v18, "setCloudContainer:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](v18, "cloudContainer"));
      [v37 setPersistentStoreDescriptions:v35];

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v56 = 0x2020000000LL;
      id v57 = 0LL;
      id v57 = [v35 count];
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](v18, "cloudContainer"));
      -[StaticKeyController setPersistentContainer:](v18, "setPersistentContainer:", v38);

      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](v18, "log"));
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Load Core Data", v51, 2u);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v18, "persistentContainer"));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100029334;
      v47[3] = &unk_100278E08;
      v41 = v18;
      v48 = v41;
      p___int128 buf = &buf;
      id v49 = v15;
      [v40 loadPersistentStoresWithCompletionHandler:v47];

      self = v41;
      _Block_object_dispose(&buf, 8);

      v42 = self;
      goto LABEL_33;
    }

    if (qword_1002E64B0 != -1) {
      dispatch_once(&qword_1002E64B0, &stru_100278DE0);
    }
    v24 = (os_log_s *)qword_1002E64B8;
    if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "StaticKeyController: super init",  (uint8_t *)&buf,  2u);
    }

    self = 0LL;
LABEL_27:
    v42 = 0LL;
    goto LABEL_33;
  }

  id v54 = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  &v54));
  id v16 = v54;
  if (!v19)
  {
    if (qword_1002E64B0 != -1) {
      dispatch_once(&qword_1002E64B0, &stru_100278DA0);
    }
    v43 = (os_log_s *)qword_1002E64B8;
    if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "StaticKeyController: transparencyFilesPath: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v12 = 0LL;
    goto LABEL_27;
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:@"StaticKey" isDirectory:1]);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v58 = NSFileProtectionKey;
  NSFileProtectionType v59 = NSFileProtectionNone;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
  id v53 = v16;
  unsigned __int8 v22 = [v20 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:v21 error:&v53];
  id v23 = v53;

  if ((v22 & 1) != 0)
  {
    id v16 = v23;
    goto LABEL_5;
  }

  if (qword_1002E64B0 != -1) {
    dispatch_once(&qword_1002E64B0, &stru_100278DC0);
  }
  v44 = (os_log_s *)qword_1002E64B8;
  if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "StaticKeyController: create directory %@",  (uint8_t *)&buf,  0xCu);
  }

  v42 = 0LL;
  id v16 = v23;
LABEL_33:

  return v42;
}

- (id)initLocalDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 contactStore:(id)a7 complete:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___StaticKeyController;
  v20 = -[StaticKeyController init](&v41, "init");
  v21 = v20;
  if (v20)
  {
    id v37 = v16;
    if (v17)
    {
      -[StaticKeyController setNotificationCenter:](v20, "setNotificationCenter:", v17);
    }

    else
    {
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      -[StaticKeyController setNotificationCenter:](v21, "setNotificationCenter:", v22);
    }

    -[StaticKeyController setIdsDelegate:](v21, "setIdsDelegate:", v15);
    -[StaticKeyController setContactStore:](v21, "setContactStore:", v18);
    dispatch_queue_t v23 = dispatch_queue_create("StaticKeyController", 0LL);
    -[StaticKeyController setQueue:](v21, "setQueue:", v23);

    os_log_t v24 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
    -[StaticKeyController setLog:](v21, "setLog:", v24);

    v25 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController staticKeyModelURL](v21, "staticKeyModelURL"));
    v27 = -[NSManagedObjectModel initWithContentsOfURL:](v25, "initWithContentsOfURL:", v26);

    dispatch_queue_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[StaticKeyController persistentStoreDescriptions:]( &OBJC_CLASS___StaticKeyController,  "persistentStoreDescriptions:",  v14));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentContainer persistentContainerWithName:managedObjectModel:]( &OBJC_CLASS___NSPersistentContainer,  "persistentContainerWithName:managedObjectModel:",  @"StaticKey",  v27));
    -[StaticKeyController setPersistentContainer:](v21, "setPersistentContainer:", v29);

    os_log_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v21, "persistentContainer"));
    [v30 setPersistentStoreDescriptions:v28];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](v21, "persistentContainer"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000297F8;
    v38[3] = &unk_100278E30;
    id v32 = v15;
    id v33 = v14;
    v34 = v21;
    v39 = v34;
    id v40 = v19;
    [v31 loadPersistentStoresWithCompletionHandler:v38];

    id v16 = v37;
    -[StaticKeyController setConfigurationStore:](v34, "setConfigurationStore:", v37);
    v35 = v34;
    id v14 = v33;
    id v15 = v32;
  }

  return v21;
}

- (void)remoteUpdate:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    *(_DWORD *)__int128 buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "remoteUpdate: %@/%@",  buf,  0x16u);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000299DC;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)historyTokenFromData:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSPersistentHistoryToken, v6),  v3,  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)dataFromHistoryToken:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSPersistentHistoryToken, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  0LL));
  }
  else {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)processCoreDataHistory
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v5 = [v4 newBackgroundContext];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v5 setMergePolicy:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getSettingsData:@"CoreDataSyncToken"]);

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100029D24;
  id v18 = &unk_100278E78;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController historyTokenFromData:](self, "historyTokenFromData:", v9));
  id v20 = v5;
  v21 = self;
  id v10 = v7;
  id v22 = v10;
  id v11 = v5;
  id v12 = v19;
  [v11 performBlockAndWait:&v15];
  if (objc_msgSend(v10, "count", v15, v16, v17, v18))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "processCoreDataHistory: updating: %@",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    [v13 didUpdateStaticKeyStore:v14 application:kKTApplicationIdentifierIDS];
  }
}

- (void)setContactsSyncController:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
    [v5 invalidateContactsSyncing];

    -[StaticKeyController setContacts:](self, "setContacts:", 0LL);
  }

  uint64_t v6 = v8;
  if (v8)
  {
    -[StaticKeyController setContacts:](self, "setContacts:", v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
    [v7 setDelegate:self];

    uint64_t v6 = v8;
  }
}

- (void)consumeContactsChangeHistory
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  [v2 consumeContactsChangeHistory];
}

- (void)startContactsSyncing
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  [v2 startContactsSyncing];
}

- (void)drainContactsSyncing
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController contacts](self, "contacts"));
  [v2 drainContactsSyncing];
}

- (id)staticKeyModelURL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.Transparency"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForResource:@"StaticKeyDataModel" withExtension:@"momd"]);

  return v3;
}

+ (id)persistentStoreDescriptions:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 URLByAppendingPathComponent:@"StaticKey"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v3));
  [v4 setType:NSSQLiteStoreType];
  [v4 setShouldAddStoreAsynchronously:0];
  [v4 setConfiguration:@"Default"];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  id v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

+ (id)cloudPersistentStoreDescription:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 URLByAppendingPathComponent:@"CloudStore"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v3));
  [v4 setConfiguration:@"Cloud"];
  [v4 setShouldAddStoreAsynchronously:0];
  id v5 = objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerOptions);
  uint64_t v6 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]( v5,  "initWithContainerIdentifier:",  off_1002DE738);
  -[NSPersistentCloudKitContainerOptions setUseDeviceToDeviceEncryption:](v6, "setUseDeviceToDeviceEncryption:", 1LL);
  -[NSPersistentCloudKitContainerOptions setApsConnectionMachServiceName:]( v6,  "setApsConnectionMachServiceName:",  @"com.apple.aps.transparencyd-coredata");
  [v4 setCloudKitContainerOptions:v6];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentStoreRemoteChangeNotificationPostOptionKey];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  id v9 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (BOOL)importFromCloud
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v5 = [v4 newBackgroundContext];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v5 setMergePolicy:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002A770;
  v9[3] = &unk_100278EC8;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  [v7 performBlockAndWait:v9];
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)exportToCloud
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v5 = [v4 newBackgroundContext];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v5 setMergePolicy:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002AA94;
  v9[3] = &unk_100278EC8;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  [v7 performBlockAndWait:v9];
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)triggerSync:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer", a3));

  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002AD5C;
    block[3] = &unk_100276740;
    block[4] = self;
    dispatch_sync(v5, block);
  }

  else
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001DB59C();
    }
  }

  return v4 != 0LL;
}

- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));

  if (v7)
  {
    if (v5) {
      uint64_t v8 = 6LL;
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));
    id v14 = 0LL;
    unsigned __int8 v10 = [v9 initializeCloudKitSchemaWithOptions:v8 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001DB5C8();
      }

      if (a4)
      {
        id v11 = v11;
        *a4 = v11;
      }
    }
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_1001DB59C();
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)resetCloudZone:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer", a3));

  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "reset zone start", buf, 2u);
    }

    id v7 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController cloudContainer](self, "cloudContainer"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentStoreCoordinator]);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v7, "setPersistentStoreCoordinator:", v9);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002AFE8;
    v11[3] = &unk_1002777A0;
    v11[4] = self;
    uint64_t v12 = v7;
    uint64_t v6 = v7;
    -[os_log_s performBlockAndWait:](v6, "performBlockAndWait:", v11);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1001DB59C();
  }

  return v4 != 0LL;
}

- (id)fetchHandles:(id)a3 moc:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[KTCoreDataSTHandle fetchRequest](&OBJC_CLASS___KTCoreDataSTHandle, "fetchRequest"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"publicIdentity == %@",  v9));

  [v10 setPredicate:v11];
  id v18 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 executeFetchRequest:v10 error:&v18]);

  id v13 = v18;
  if (v12)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v12));
  }

  else
  {
    char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetchHandles failed with: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }

  uint64_t v16 = (void *)v14;

  return v16;
}

- (id)storeStaticKey:(id)a3 contactIdentifier:(id)a4 contactExternalIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7
{
  id v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  char v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController fetchContactsSyncToken](self, "fetchContactsSyncToken"));

  if (!v15)
  {
    if (qword_1002E64B0 != -1) {
      dispatch_once(&qword_1002E64B0, &stru_100278F10);
    }
    uint64_t v16 = (os_log_s *)qword_1002E64B8;
    if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "storeStaticKey no previously existing sync token",  buf,  2u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contactStore](self, "contactStore", v39));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
    [v17 fetchAndStoreContactsSyncTokenWithConfigStore:v18];
  }

  *(void *)__int128 buf = 0LL;
  NSFileAttributeKey v58 = buf;
  uint64_t v59 = 0x3032000000LL;
  v60 = sub_10002B838;
  v61 = sub_10002B848;
  id v62 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer", v39));
  id v20 = [v19 newBackgroundContext];

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v20 setMergePolicy:v21];

  uint64_t v51 = 0LL;
  objc_super v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  id v54 = sub_10002B838;
  v55 = sub_10002B848;
  id v56 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v40 ktStorageString]);
  dispatch_queue_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@","]);
    *(_DWORD *)v63 = 138412802;
    v64 = v40;
    __int16 v65 = 2112;
    v66 = v22;
    __int16 v67 = 2112;
    v68 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "storeStaticKey identity: %@ %@ mappings: %@",  v63,  0x20u);
  }

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10002B850;
  v42[3] = &unk_100278F38;
  id v25 = v13;
  id v43 = v25;
  id v26 = v12;
  id v44 = v26;
  id v27 = v20;
  id v45 = v27;
  id v49 = &v51;
  id v28 = v22;
  id v46 = v28;
  v47 = self;
  id v29 = v14;
  id v48 = v29;
  v50 = buf;
  [v27 performBlockAndWait:v42];
  os_log_t v30 = (void *)*((void *)v58 + 5);
  if (!a7 || v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 contactExternalURI]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v58 + 5) publicKeyID]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 publicAccountIdentity]);
    -[StaticKeyController postChangeForEntry:publicAccountIdentity:]( self,  "postChangeForEntry:publicAccountIdentity:",  v31,  v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v58 + 5) mappings]);
    [v34 didUpdateStaticKeyStore:v35 application:kKTApplicationIdentifierIDS];
  }

  else
  {
    *a7 = (id) v52[5];
  }

  v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C01C;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v36, block);

  id v37 = *((id *)v58 + 5);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(buf, 8);
  return v37;
}

- (void)postChangeForEntry:(id)a3 publicAccountIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "postChangeToEntry externalURI: %@ publicKey: %@",  buf,  0x16u);
  }

  if (v6 && v7)
  {
    v11[0] = kTransparencyStaticKeyStoreContactIdentifier;
    v11[1] = kTransparencyStaticKeyStorePublicIdentifydentifier;
    v12[0] = v6;
    v12[1] = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController notificationCenter](self, "notificationCenter"));
    [v10 postNotificationName:kTransparencyStaticKeyStoreNotification object:0 userInfo:v9 deliverImmediately:1];
  }
}

- (id)mapStaticKeyToStoreEntry:(id)a3 handles:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 publicIdentity]);
  if (v11)
  {
    id v43 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountPublicID ktAccountPublicIDWithStorageString:error:]( &OBJC_CLASS___KTAccountPublicID,  "ktAccountPublicIDWithStorageString:error:",  v11,  &v43));
    id v13 = v43;
    id v14 = v13;
    if (v12)
    {
      id v36 = v13;
      id v37 = v11;
      id v15 = objc_alloc_init(&OBJC_CLASS___KTIDStaticKeyStoreEntry);
      v35 = v12;
      [v15 setPublicKeyID:v12];
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 contactIdentifier]);
      [v15 setContactIdentifier:v16];

      id v38 = v9;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 contactExternalIdentifier]);
      v34 = v15;
      [v15 setContactServerPath:v17];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v20 = v10;
      id v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v40;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 idsID]);

            if (v26)
            {
              id v27 = objc_alloc_init(&OBJC_CLASS___KTIDStaticKeyStoreHandle);
              [v27 setValidationDate:0];
              [v27 setValid:0];
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 idsID]);
              [v27 setHandle:v28];

              objc_msgSend(v27, "setErrorCode:", objc_msgSend(v25, "error"));
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v25 idsID]);
              [v19 setObject:v27 forKeyedSubscript:v29];

              os_log_t v30 = (void *)objc_claimAutoreleasedReturnValue([v25 idsID]);
              [v18 addObject:v30];
            }
          }

          id v22 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }

        while (v22);
      }

      v31 = v34;
      if ([v18 count])
      {
        [v34 setMappings:v18];
        [v34 setHandles:v19];
      }

      id v9 = v38;
      id v14 = v36;
      id v11 = v37;
      id v12 = v35;
    }

    else
    {
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v46 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Failed to create KTAccountPublicID: %@",  buf,  0xCu);
      }

      v31 = 0LL;
      if (a6) {
        *a6 = v14;
      }
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "failed to create public identity string",  buf,  2u);
    }

    v31 = 0LL;
  }

  return v31;
}

- (id)findStaticKeyByKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_10002B838;
  id v32 = sub_10002B848;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_10002B838;
  id v26 = sub_10002B848;
  id v27 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ktStorageString]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    id v9 = [v8 newBackgroundContext];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
    [v9 setMergePolicy:v10];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002C6F4;
    v16[3] = &unk_100278F60;
    id v17 = v7;
    id v11 = v9;
    id v18 = v11;
    id v19 = self;
    id v20 = &v28;
    id v21 = &v22;
    [v11 performBlockAndWait:v16];
    id v12 = (void *)v23[5];
    if (!v12)
    {
      if (a4)
      {
        id v13 = (void *)v29[5];
        if (v13)
        {
          *a4 = v13;
          id v12 = (void *)v23[5];
        }
      }
    }

    id v14 = v12;
  }

  else
  {
    id v14 = 0LL;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (id)findStaticKeyByHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_10002B838;
  v31 = sub_10002B848;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002B838;
  id v25 = sub_10002B848;
  id v26 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v8 = [v7 newBackgroundContext];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v8 setMergePolicy:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002C9F4;
  v15[3] = &unk_100278F60;
  id v10 = v6;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  id v19 = &v27;
  id v20 = &v21;
  [v11 performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v28[5];
    if (v12) {
      *a4 = v12;
    }
  }

  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)shouldDoInitialCloudSyncing:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getSettingsDate:@"lastCKSyncData"]);

    if (v4 && v7)
    {
      if (qword_1002E64B0 != -1) {
        dispatch_once(&qword_1002E64B0, &stru_100278FC0);
      }
      id v8 = (os_log_s *)qword_1002E64B8;
      if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "cloud sync: last sync: %{public}@",  (uint8_t *)&v17,  0xCu);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-604800.0]);
      id v10 = [v7 compare:v9];
      BOOL v11 = v10 == (id)-1LL;
      if (v10 != (id)-1LL) {
        goto LABEL_24;
      }
      if (qword_1002E64B0 != -1) {
        dispatch_once(&qword_1002E64B0, &stru_100278FE0);
      }
      id v12 = (os_log_s *)qword_1002E64B8;
      if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "7d cloud sync setting",  (uint8_t *)&v17,  2u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
      [v13 setSettingsDate:@"lastCKSyncData" date:v4];
    }

    else
    {
      if (qword_1002E64B0 != -1) {
        dispatch_once(&qword_1002E64B0, &stru_100278FA0);
      }
      id v15 = (os_log_s *)qword_1002E64B8;
      if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Initial cloud sync setting",  (uint8_t *)&v17,  2u);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
      [v9 setSettingsDate:@"lastCKSyncData" date:v4];
    }

    BOOL v11 = 1;
LABEL_24:

    goto LABEL_25;
  }

  if (qword_1002E64B0 != -1) {
    dispatch_once(&qword_1002E64B0, &stru_100278F80);
  }
  id v14 = (os_log_s *)qword_1002E64B8;
  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No cloud sync setting", (uint8_t *)&v17, 2u);
    BOOL v11 = 0;
  }

- (void)launchCloudSyncing:(id)a3 initialDelay:(double)a4
{
  id v6 = a3;
  if (a4 >= 0.0 && -[StaticKeyController shouldDoInitialCloudSyncing:](self, "shouldDoInitialCloudSyncing:", v6))
  {
    id v7 = (void *)os_transaction_create("initial-cloud-sync");
    dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    void v12[2] = sub_10002D16C;
    v12[3] = &unk_1002777A0;
    v12[4] = self;
    id v13 = v7;
    id v10 = v7;
    dispatch_after(v8, v9, v12);
  }

  else
  {
    if (qword_1002E64B0 != -1) {
      dispatch_once(&qword_1002E64B0, &stru_100279000);
    }
    BOOL v11 = (os_log_s *)qword_1002E64B8;
    if (os_log_type_enabled((os_log_t)qword_1002E64B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial cloud sync", buf, 2u);
    }
  }
}

- (id)findStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_10002B838;
  v31 = sub_10002B848;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002B838;
  id v25 = sub_10002B848;
  id v26 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v8 = [v7 newBackgroundContext];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v8 setMergePolicy:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002D3D8;
  v15[3] = &unk_100278F60;
  id v10 = v6;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  id v19 = &v27;
  id v20 = &v21;
  [v11 performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v28[5];
    if (v12) {
      *a4 = v12;
    }
  }

  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)findStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_10002B838;
    uint64_t v30 = sub_10002B848;
    id v31 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    uint64_t v23 = sub_10002B838;
    uint64_t v24 = sub_10002B848;
    id v25 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    id v8 = [v7 newBackgroundContext];

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
    [v8 setMergePolicy:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002D700;
    v14[3] = &unk_100278F60;
    id v15 = v6;
    id v10 = v8;
    id v16 = v10;
    id v17 = self;
    id v18 = &v26;
    id v19 = &v20;
    [v10 performBlockAndWait:v14];
    if (a4)
    {
      id v11 = (void *)v27[5];
      if (v11) {
        *a4 = v11;
      }
    }

    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)validateStaticKeyStoreMappingByKey:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByKey:error:](self, "findStaticKeyByKey:error:", a3));
  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactIdentifer:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[StaticKeyController findStaticKeyByContactIdentifier:error:]( self,  "findStaticKeyByContactIdentifier:error:",  a3));
  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[StaticKeyController findStaticKeyByContactExternalURI:error:]( self,  "findStaticKeyByContactExternalURI:error:",  a3));
  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController validateStoreEntry:error:](self, "validateStoreEntry:error:", v6, a4));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)deleteStaticKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v8 = [v7 newBackgroundContext];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v8 setMergePolicy:v9];

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10002B838;
  uint64_t v29 = sub_10002B848;
  id v30 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 ktStorageString]);
  id v12 = v11;
  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10002DBEC;
    v19[3] = &unk_100278F60;
    id v20 = v11;
    id v21 = v8;
    uint64_t v23 = &v25;
    id v13 = v10;
    id v22 = v13;
    uint64_t v24 = &v31;
    [v21 performBlockAndWait:v19];
    if (a4)
    {
      id v14 = (void *)v26[5];
      if (v14) {
        *a4 = v14;
      }
    }

    if ([v13 count])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
      [v15 didUpdateStaticKeyStore:v16 application:kKTApplicationIdentifierIDS];
    }

    BOOL v17 = *((_BYTE *)v32 + 24) != 0;
  }

  else
  {
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v8 = [v7 newBackgroundContext];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v8 setMergePolicy:v9];

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10002B838;
  uint64_t v29 = sub_10002B848;
  id v30 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002E108;
  v19[3] = &unk_100278F60;
  id v11 = v6;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  uint64_t v23 = &v25;
  id v13 = v10;
  id v22 = v13;
  uint64_t v24 = &v31;
  [v12 performBlockAndWait:v19];
  if (a4)
  {
    id v14 = (void *)v26[5];
    if (v14) {
      *a4 = v14;
    }
  }

  if ([v13 count])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
    [v15 didUpdateStaticKeyStore:v16 application:kKTApplicationIdentifierIDS];
  }

  char v17 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
    id v8 = [v7 newBackgroundContext];

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
    [v8 setMergePolicy:v9];

    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    uint64_t v27 = sub_10002B838;
    uint64_t v28 = sub_10002B848;
    id v29 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002E680;
    v18[3] = &unk_100278F60;
    id v19 = v6;
    id v11 = v8;
    id v20 = v11;
    id v22 = &v24;
    id v12 = v10;
    id v21 = v12;
    uint64_t v23 = &v30;
    [v11 performBlockAndWait:v18];
    if (a4)
    {
      id v13 = (void *)v25[5];
      if (v13) {
        *a4 = v13;
      }
    }

    if ([v12 count])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
      [v14 didUpdateStaticKeyStore:v15 application:kKTApplicationIdentifierIDS];
    }

    BOOL v16 = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)listStaticKey:(id *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v6 = [v5 newBackgroundContext];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v6 setMergePolicy:v7];

  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_10002B838;
  v17[4] = sub_10002B848;
  id v18 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002EB14;
  v13[3] = &unk_1002774A0;
  id v8 = v6;
  id v14 = v8;
  BOOL v16 = v17;
  id v9 = v4;
  id v15 = v9;
  [v8 performBlockAndWait:v13];
  id v10 = v15;
  id v11 = v9;

  _Block_object_dispose(v17, 8);
  return v11;
}

- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_10002B838;
  uint64_t v27 = sub_10002B848;
  id v28 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController persistentContainer](self, "persistentContainer"));
  id v10 = [v9 newBackgroundContext];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v10 setMergePolicy:v11];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002EE68;
  v17[3] = &unk_100279068;
  id v12 = v8;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v23;
  int v22 = a3;
  id v21 = &v29;
  [v13 performBlockAndWait:v17];
  if (a5)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a5 = v14;
    }
  }

  char v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)haveContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController contactStore](self, "contactStore"));
  LOBYTE(a4) = [v7 haveContact:v6 error:a4];

  return (char)a4;
}

- (id)lastContactSyncDate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getSettingsDate:@"lastContactSyncDate"]);

  return v3;
}

- (void)updateLastContactSyncDate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 setSettingsDate:@"lastContactSyncDate" date:v2];
}

- (id)fetchContactsSyncToken
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getSettingsData:@"lastContactSyncData"]);

  return v3;
}

- (void)storeContactsSyncToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[StaticKeyController configurationStore](self, "configurationStore"));
  [v5 setSettingsData:@"lastContactSyncData" data:v4];
}

- (void)fetchPeerHandles:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController idsDelegate](self, "idsDelegate"));
  id v12 = v11;
  if (v11)
  {
    [v11 fetchPeerHandles:v8 application:v9 complete:v10];
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001DB688();
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v5 = (void (**)(id, KTVerifierResult *, void))a5;
  id v6 = objc_alloc_init(&OBJC_CLASS___KTVerifierResult);
  -[KTVerifierResult setSucceed:](v6, "setSucceed:", 0LL);
  v5[2](v5, v6, 0LL);
}

- (id)validateStoreEntry:(id)a3 error:(id *)a4
{
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002B838;
  uint64_t v25 = sub_10002B848;
  id v26 = 0LL;
  id v5 = a3;
  id v26 = v5;
  if (qword_1002E64B0 != -1) {
    dispatch_once(&qword_1002E64B0, &stru_100279088);
  }
  id v6 = (os_log_s *)(id)qword_1002E64B8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mappings]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@","]);
    *(_DWORD *)__int128 buf = 138412290;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "validateStoreEntry looking for handles: %@",  buf,  0xCu);
  }

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  id v10 = kKTApplicationIdentifierIDS;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 mappings]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002F4F0;
  v17[3] = &unk_100279110;
  id v12 = v5;
  id v18 = v12;
  id v20 = &v21;
  id v13 = v9;
  id v19 = v13;
  -[StaticKeyController fetchPeerHandles:application:complete:]( self,  "fetchPeerHandles:application:complete:",  v11,  v10,  v17);

  dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL);
  dispatch_semaphore_wait(v13, v14);
  id v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)peerVerificationUpdated:(id)a3
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "StaticKeyController updating verification",  v4,  2u);
  }
}

- (id)findStaticKeyByContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 externalURI]);
  id v14 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[StaticKeyController findStaticKeyByContactExternalURI:error:]( self,  "findStaticKeyByContactExternalURI:error:",  v7,  &v14));
  id v9 = v14;

  if (v8)
  {
    id v10 = v9;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v13 = v9;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[StaticKeyController findStaticKeyByContactIdentifier:error:]( self,  "findStaticKeyByContactIdentifier:error:",  v11,  &v13));
    id v10 = v13;

    if (a4 && !v8 && v10)
    {
      id v10 = v10;
      id v8 = 0LL;
      *a4 = v10;
    }
  }

  return v8;
}

- (void)updateContact:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[KeyTransparencyContactMapping mapContactsToIDS:]( &OBJC_CLASS___KeyTransparencyContactMapping,  "mapContactsToIDS:",  v4));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updateContact contactMappings: %@", buf, 0xCu);
  }

  id v27 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyController findStaticKeyByContact:error:](self, "findStaticKeyByContact:error:", v4, &v27));

  id v8 = v27;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 mappings]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    if ([v10 isEqual:v5])
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        id v12 = "updateContact mappings match";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
        goto LABEL_18;
      }

      goto LABEL_18;
    }

    if ([v5 count])
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 contactIdentifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 contactExternalURI]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
      id v24 = v8;
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[StaticKeyController storeStaticKey:contactIdentifier:contactExternalIdentifier:mappings:error:]( self,  "storeStaticKey:contactIdentifier:contactExternalIdentifier:mappings:error:",  v23,  v13,  v14,  v15,  &v24));
      id v17 = v24;

      if (!v16)
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1001DB774();
        }
        id v8 = v17;
        goto LABEL_18;
      }

- (void)deleteContact:(id)a3 contactExternalURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v15 = 0LL;
    unsigned __int8 v8 = -[StaticKeyController deleteStaticKeyByContactExternalURI:error:]( self,  "deleteStaticKeyByContactExternalURI:error:",  v7,  &v15);
    id v9 = v15;
    id v10 = v9;
    if ((v8 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1001DB834();
  }

  id v14 = v9;
  unsigned __int8 v12 = -[StaticKeyController deleteStaticKeyByContactIdentifier:error:]( self,  "deleteStaticKeyByContactIdentifier:error:",  v6,  &v14);
  id v10 = v14;

  if ((v12 & 1) == 0)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyController log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001DB7D4();
    }
  }

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSPersistentCloudKitContainer)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLog:(id)a3
{
}

- (StaticKeyContactsProtocol)contacts
{
  return (StaticKeyContactsProtocol *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setContacts:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (STCConfigurationStoreDelegate)configurationStore
{
  return (STCConfigurationStoreDelegate *)objc_loadWeakRetained((id *)&self->_configurationStore);
}

- (void)setConfigurationStore:(id)a3
{
}

- (KTNotificationCenter)notificationCenter
{
  return (KTNotificationCenter *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (StaticKeyIDSDelegate)idsDelegate
{
  return (StaticKeyIDSDelegate *)objc_loadWeakRetained((id *)&self->_idsDelegate);
}

- (void)setIdsDelegate:(id)a3
{
}

- (KTContactsStoreProtocol)contactStore
{
  return (KTContactsStoreProtocol *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end