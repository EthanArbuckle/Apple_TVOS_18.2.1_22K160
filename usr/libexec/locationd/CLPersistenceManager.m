@interface CLPersistenceManager
+ (id)defaultModelsDirectory;
+ (id)defaultStoresDirectory;
+ (id)getStoreURLFromDirectory:(id)a3;
+ (void)deleteDefaultStoreFileFromDisk;
+ (void)deleteStoreFile:(id)a3;
- (BOOL)_isStoreConnected;
- (BOOL)connectToStore;
- (BOOL)disconnectFromStore;
- (BOOL)useCloudKit;
- (CLPersistenceManager)initWithDefaultDirectories:(BOOL)a3;
- (CLPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useCloudKit:(BOOL)a5;
- (CLPersistenceStore)persistenceStore;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentCloudKitContainer)persistentCloudKitContainer;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)createManagedObjectContext;
- (void)dealloc;
- (void)initializeCloudKitSchema;
- (void)setPersistenceStore:(id)a3;
- (void)setPersistentCloudKitContainer:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setUseCloudKit:(BOOL)a3;
@end

@implementation CLPersistenceManager

- (CLPersistenceManager)initWithDefaultDirectories:(BOOL)a3
{
  return -[CLPersistenceManager initWithModelsDirectory:storesDirectory:useCloudKit:]( self,  "initWithModelsDirectory:storesDirectory:useCloudKit:",  +[CLPersistenceManager defaultModelsDirectory](&OBJC_CLASS___CLPersistenceManager, "defaultModelsDirectory"),  +[CLPersistenceManager defaultStoresDirectory](&OBJC_CLASS___CLPersistenceManager, "defaultStoresDirectory"),  a3);
}

- (CLPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useCloudKit:(BOOL)a5
{
  if (([a3 isFileURL] & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceManager.m",  31LL,  @"Invalid parameter not satisfying: %@",  @"modelsDirectory.isFileURL");
  }
  if (([a4 isFileURL] & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceManager.m",  32LL,  @"Invalid parameter not satisfying: %@",  @"storesDirectory.isFileURL");
  }
  if ([a3 isFileURL] && objc_msgSend(a4, "isFileURL"))
  {
    self->_useCloudKit = a5;
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___CLPersistenceManager;
    v10 = -[CLPersistenceManager init](&v15, "init");
    if (!v10)
    {
LABEL_16:
      NSLog( @"CoreData, PersistenceManager initialized with models directory %@ and stores directory %@",  v10->_modelsDirectory,  v10->_storesDirectory);
      return v10;
    }

    v10->_modelsDirectory = +[NSURL fileURLWithPath:isDirectory:]( NSURL,  "fileURLWithPath:isDirectory:",  [a3 path],  1);
    v10->_storesDirectory = +[NSURL fileURLWithPath:isDirectory:]( NSURL,  "fileURLWithPath:isDirectory:",  [a4 path],  1);
    v11 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v10->_modelsDirectory);
    v10->_managedObjectModel = v11;
    if (v11)
    {
      NSLog(@"CoreData, Initialized NSManagedObjectModel from URL: %@", v10->_modelsDirectory);
      NSLog( @"CoreData, Loaded ManagedObjectModel Version: %@",  -[NSManagedObjectModel versionIdentifiers](v10->_managedObjectModel, "versionIdentifiers"));
      if (v10->_useCloudKit)
      {
        v12 = -[NSPersistentCloudKitContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainer),  "initWithName:managedObjectModel:",  @"CoreLocation",  v10->_managedObjectModel);
        uint64_t v13 = 7LL;
      }

      else
      {
        v12 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v10->_managedObjectModel);
        uint64_t v13 = 5LL;
      }

      (&v10->super.isa)[v13] = v12;
      v10->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_16;
    }

    NSLog(@"CoreData, Failed to initialize persistence model from URL: %@", v10->_modelsDirectory);
  }

  return 0LL;
}

- (void)initializeCloudKitSchema
{
  uint64_t v2 = 0LL;
  if (-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]( self->_persistentCloudKitContainer,  "initializeCloudKitSchemaWithOptions:error:",  0LL,  &v2))
  {
    NSLog(@"CoreData+CloudKit, initializeCloudKitSchema, Successfully initialized CloudKit schema!");
  }

  else
  {
    NSLog(@"CoreData+CloudKit, initializeCloudKitSchema, Failed to initialize CloudKit schema: %@", v2);
  }

+ (id)getStoreURLFromDirectory:(id)a3
{
  return _objc_msgSend( objc_msgSend(a3, "URLByAppendingPathComponent:", @"CoreData"),  "URLByAppendingPathExtension:",  @"sqlite");
}

- (BOOL)connectToStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    v5 = -[CLPersistenceStore initWithURL:useCloudKit:]( objc_alloc(&OBJC_CLASS___CLPersistenceStore),  "initWithURL:useCloudKit:",  +[CLPersistenceManager getStoreURLFromDirectory:]( &OBJC_CLASS___CLPersistenceManager,  "getStoreURLFromDirectory:",  self->_storesDirectory),  self->_useCloudKit);
    self->_persistenceStore = v5;
    if (self->_useCloudKit)
    {
      id v6 = -[CLPersistenceStore persistentStoreDescription](v5, "persistentStoreDescription");
      persistentCloudKitContainer = self->_persistentCloudKitContainer;
      id v15 = v6;
      -[NSPersistentCloudKitContainer setPersistentStoreDescriptions:]( persistentCloudKitContainer,  "setPersistentStoreDescriptions:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      uint64_t v11 = 0LL;
      v12 = &v11;
      uint64_t v13 = 0x2020000000LL;
      char v14 = 0;
      v8 = self->_persistentCloudKitContainer;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100C92570;
      v10[3] = &unk_10187B448;
      v10[4] = &v11;
      -[NSPersistentCloudKitContainer loadPersistentStoresWithCompletionHandler:]( v8,  "loadPersistentStoresWithCompletionHandler:",  v10);
      unsigned __int8 v4 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }

    else
    {
      unsigned __int8 v4 = -[CLPersistenceStore loadWithCoordinator:](v5, "loadWithCoordinator:", self->_persistentStoreCoordinator);
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)disconnectFromStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    persistentCloudKitContainer = self->_persistentCloudKitContainer;
    if (persistentCloudKitContainer)
    {
      persistentStoreCoordinator = (NSPersistentStoreCoordinator *)-[NSPersistentCloudKitContainer persistentStoreCoordinator]( persistentCloudKitContainer,  "persistentStoreCoordinator");
      self->_persistentStoreCoordinator = persistentStoreCoordinator;
    }

    else
    {
      persistentStoreCoordinator = self->_persistentStoreCoordinator;
    }

    uint64_t v10 = 0LL;
    id v7 = -[NSArray firstObject]( -[NSPersistentStoreCoordinator persistentStores](persistentStoreCoordinator, "persistentStores"),  "firstObject");
    -[NSPersistentStoreCoordinator removePersistentStore:error:]( self->_persistentStoreCoordinator,  "removePersistentStore:error:",  v7,  &v10);
    if (v10)
    {
      id v8 = [v7 URL];
      NSLog(@"Failed to disconnect from store %@ with error %@", v8, v10);
    }

    unsigned int v6 = !-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected");
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)createManagedObjectContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[CLPersistenceManager _isStoreConnected](self, "_isStoreConnected"))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceManager.m",  185LL,  @"Unable to create managed object context since no store is connected");
    goto LABEL_5;
  }

  v5 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
  -[NSManagedObjectContext setMergePolicy:]( v5,  "setMergePolicy:",  +[NSMergePolicy errorMergePolicy](&OBJC_CLASS___NSMergePolicy, "errorMergePolicy"));
  -[NSManagedObjectContext setPersistentStoreCoordinator:]( v5,  "setPersistentStoreCoordinator:",  -[CLPersistenceManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  -[NSManagedObjectContext setName:]( v5,  "setName:",  -[NSProcessInfo processName]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "processName"));
  -[NSManagedObjectContext setTransactionAuthor:]( v5,  "setTransactionAuthor:",  -[NSManagedObjectContext name](v5, "name"));
  -[NSManagedObjectContext setUndoManager:](v5, "setUndoManager:", 0LL);
  if (!v5)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceManager.m",  207LL,  @"Failed to create a valid managed object context.");
LABEL_5:
    v5 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (id)defaultModelsDirectory
{
  unsigned __int8 v4 = +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.corelocation");
  NSLog(@"coreLocationFrameworkBundle: %@", v4);
  v5 = -[NSBundle pathForResource:ofType:]( v4,  "pathForResource:ofType:",  @"CoreLocationCoreDataModel",  @"momd");
  if (!v5) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"CLPersistenceManager.m",  224LL,  @"Failed to find models directory!");
  }
  return +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL);
}

+ (id)defaultStoresDirectory
{
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/var/root/Library/Caches/locationd"))
  {
    return +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/root/Library/Caches/locationd",  1LL);
  }

  uint64_t v4 = 0LL;
  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/root/Library/Caches/locationd",  1LL,  0LL,  &v4)
    && v4 == 0)
  {
    return +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/root/Library/Caches/locationd",  1LL);
  }

  NSLog(@"CoreData, Failed to create %@, error, %@", @"/var/root/Library/Caches/locationd", v4);
  return 0LL;
}

+ (void)deleteStoreFile:(id)a3
{
  if (a3)
  {
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  a3))
    {
      uint64_t v5 = 0LL;
      if (-[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  a3,  &v5))
      {
        BOOL v4 = v5 == 0;
      }

      else
      {
        BOOL v4 = 0;
      }

      if (v4) {
        NSLog(@"CoreData, successfully deleted store file %@", a3);
      }
      else {
        NSLog(@"CoreData, failed to delete store file %@, error, %@", a3, v5);
      }
    }

    else
    {
      NSLog(@"CoreData, skip deleting store file %@ as it does not exist", a3);
    }
  }

+ (void)deleteDefaultStoreFileFromDisk
{
  id v3 = +[CLPersistenceManager getStoreURLFromDirectory:]( &OBJC_CLASS___CLPersistenceManager,  "getStoreURLFromDirectory:",  +[CLPersistenceManager defaultStoresDirectory](&OBJC_CLASS___CLPersistenceManager, "defaultStoresDirectory"));
  if (v3)
  {
    id v4 = [v3 path];
    [a1 deleteStoreFile:v4];
    objc_msgSend(a1, "deleteStoreFile:", objc_msgSend(v4, "stringByAppendingString:", @"-shm"));
    objc_msgSend(a1, "deleteStoreFile:", objc_msgSend(v4, "stringByAppendingString:", @"-wal"));
  }

- (BOOL)_isStoreConnected
{
  persistentCloudKitContainer = self->_persistentCloudKitContainer;
  if (persistentCloudKitContainer)
  {
    persistentStoreCoordinator = (NSPersistentStoreCoordinator *)-[NSPersistentCloudKitContainer persistentStoreCoordinator]( persistentCloudKitContainer,  "persistentStoreCoordinator");
    self->_persistentStoreCoordinator = persistentStoreCoordinator;
  }

  else
  {
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
  }

  return -[NSArray count]( -[NSPersistentStoreCoordinator persistentStores](persistentStoreCoordinator, "persistentStores"),  "count") != 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPersistenceManager;
  -[CLPersistenceManager dealloc](&v3, "dealloc");
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (CLPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
}

- (NSPersistentCloudKitContainer)persistentCloudKitContainer
{
  return self->_persistentCloudKitContainer;
}

- (void)setPersistentCloudKitContainer:(id)a3
{
}

- (BOOL)useCloudKit
{
  return self->_useCloudKit;
}

- (void)setUseCloudKit:(BOOL)a3
{
  self->_useCloudKit = a3;
}

@end