@interface TBPersistenceManager
+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4;
- (NSManagedObjectContext)persistenceContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistenceCoordinator;
- (TBPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4;
- (TBPersistenceRemoteStoreServer)remoteStoreServer;
- (void)addPersistentStorage:(id)a3 completionHandler:(id)a4;
- (void)setManagedObjectModel:(id)a3;
- (void)setPersistenceContext:(id)a3;
- (void)setPersistenceCoordinator:(id)a3;
- (void)setRemoteStoreServer:(id)a3;
@end

@implementation TBPersistenceManager

- (TBPersistenceManager)initWithManagedObjectModel:(id)a3 storeDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TBPersistenceManager;
  v9 = -[TBPersistenceManager init](&v36, sel_init);
  objc_storeStrong((id *)&v9->_managedObjectModel, a3);
  if (!v9->_managedObjectModel)
  {
    NSLog( @"%s: NSManagedObjectModel is nil",  "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]");
    goto LABEL_12;
  }

  uint64_t v10 = [objc_alloc(MEMORY[0x189602570]) initWithManagedObjectModel:v9->_managedObjectModel];
  persistenceCoordinator = v9->_persistenceCoordinator;
  v9->_persistenceCoordinator = (NSPersistentStoreCoordinator *)v10;

  [MEMORY[0x1896078A8] defaultManager];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 storeURL];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 path];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 fileExistsAtPath:v14])
  {
    uint64_t v15 = objc_opt_class();
    [v8 storeURL];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = [(id)v15 isStoreCompatibleAtURL:v16 withModel:v9->_managedObjectModel];

    if ((v15 & 1) != 0) {
      goto LABEL_9;
    }
    [v8 storeURL];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: removing incompatible store at URL %@",  "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]",  v17);

    v18 = v9->_persistenceCoordinator;
    [v8 storeURL];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 storeDescription];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 type];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 storeOptions];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = 0LL;
    -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:]( v18,  "destroyPersistentStoreAtURL:withType:options:error:",  v19,  v21,  v22,  &v35);
    uint64_t v23 = v35;

    if (!v23) {
      goto LABEL_9;
    }
    [v8 storeURL];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to store at URL %@",  "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]",  v12);
  }

  else
  {
  }

LABEL_9:
  v24 = (void *)[objc_alloc(MEMORY[0x189602500]) initWithConcurrencyType:1];
  [MEMORY[0x189602520] mergeByPropertyObjectTrumpMergePolicy];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 setMergePolicy:v25];

  [v24 setPersistentStoreCoordinator:v9->_persistenceCoordinator];
  [MEMORY[0x1896079D8] processInfo];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 processName];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 setTransactionAuthor:v27];

  objc_storeStrong((id *)&v9->_persistenceContext, v24);
  if (![v8 type])
  {
    v28 = objc_alloc(&OBJC_CLASS___TBPersistenceRemoteStoreServer);
    [v8 storeURL];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 modelURL];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 storeOptions];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = -[TBPersistenceRemoteStoreServer initWithStoreURL:modelURL:options:]( v28,  "initWithStoreURL:modelURL:options:",  v29,  v30,  v31);
    remoteStoreServer = v9->_remoteStoreServer;
    v9->_remoteStoreServer = (TBPersistenceRemoteStoreServer *)v32;

    -[TBPersistenceRemoteStoreServer startListening](v9->_remoteStoreServer, "startListening");
    NSLog( @"%s: initialized remote server %@",  "-[TBPersistenceManager initWithManagedObjectModel:storeDescriptor:]",  v9->_remoteStoreServer);
  }

LABEL_12:
  return v9;
}

- (void)addPersistentStorage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  persistenceCoordinator = self->_persistenceCoordinator;
  [a3 storeDescription];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke;
  v10[3] = &unk_18A16E448;
  id v11 = v6;
  id v9 = v6;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:]( persistenceCoordinator,  "addPersistentStoreWithDescription:completionHandler:",  v8,  v10);
}

void __63__TBPersistenceManager_addPersistentStorage_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v12[2] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    id v5 = a3;
    NSLog(@"Error %@ adding persistent store %@", v5, a2);
    uint64_t v6 = *MEMORY[0x189607798];
    v11[0] = *MEMORY[0x1896075E0];
    v11[1] = v6;
    v12[0] = @"Failed to add persistent store.";
    v12[1] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = -[TBError initWithType:userInfo:](objc_alloc(&OBJC_CLASS___TBError), "initWithType:userInfo:", 104LL, v7);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void (**)(uint64_t, void))(v9 + 16);
    id v7 = 0LL;
    v10(v9, 0LL);
  }
}

+ (BOOL)isStoreCompatibleAtURL:(id)a3 withModel:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x189602478];
  id v12 = 0LL;
  [MEMORY[0x189602570] metadataForPersistentStoreOfType:v6 URL:a3 options:0 error:&v12];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  uint64_t v9 = v8;
  if (v8)
  {
    NSLog( @"%s: error (%@) retrieving store",  "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]",  v8);
LABEL_7:
    char v10 = 0;
    goto LABEL_4;
  }

  if (!v7)
  {
    NSLog( @"%s: failed to get metadata for store",  "+[TBPersistenceManager isStoreCompatibleAtURL:withModel:]");
    goto LABEL_7;
  }

  char v10 = [v5 isConfiguration:0 compatibleWithStoreMetadata:v7];
LABEL_4:

  return v10;
}

- (NSManagedObjectContext)persistenceContext
{
  return self->_persistenceContext;
}

- (void)setPersistenceContext:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (void)setPersistenceCoordinator:(id)a3
{
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (TBPersistenceRemoteStoreServer)remoteStoreServer
{
  return self->_remoteStoreServer;
}

- (void)setRemoteStoreServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end