@interface NSPersistentContainer
+ (Class)persistentStoreDescriptionClass;
+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name;
+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 managedObjectModel:(id)a4;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 modelNamed:(id)a4;
+ (NSURL)defaultDirectoryURL;
+ (id)_newModelForName:(id)a3;
+ (id)persistentContainerUsingCachedModelWithPath:(id)a3;
- (BOOL)load:(id *)a3;
- (NSArray)persistentStoreDescriptions;
- (NSManagedObjectContext)newBackgroundContext;
- (NSManagedObjectContext)viewContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentContainer)init;
- (NSPersistentContainer)initWithName:(NSString *)name;
- (NSPersistentContainer)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)name;
- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)loadPersistentStoresWithCompletionHandler:(void *)block;
- (void)performBackgroundTask:(void *)block;
- (void)setPersistentStoreDescriptions:(NSArray *)persistentStoreDescriptions;
@end

@implementation NSPersistentContainer

+ (Class)persistentStoreDescriptionClass
{
  return (Class)objc_opt_class();
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name
{
  return (NSPersistentContainer *)(id)[objc_alloc((Class)a1) initWithName:name];
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  return (NSPersistentContainer *)(id)[objc_alloc((Class)a1) initWithName:name managedObjectModel:model];
}

+ (NSURL)defaultDirectoryURL
{
  if (qword_18C4ABAF8 != -1) {
    dispatch_once(&qword_18C4ABAF8, &__block_literal_global_26);
  }
  result = (NSURL *)_MergedGlobals_82;
  if (!_MergedGlobals_82)
  {
    v5 = (void *)MEMORY[0x189603F70];
    uint64_t v6 = *MEMORY[0x189603A58];
    v7 = (void *)NSString;
    v8 = NSStringFromClass((Class)a1);
    v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend( v7, "stringWithFormat:", @"+[%@ %@] Could not conjure up a useful location for writing persistent stores.", v8, NSStringFromSelector(a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return (NSURL *)__44__NSPersistentContainer_defaultDirectoryURL__block_invoke();
  }

  return result;
}

void __44__NSPersistentContainer_defaultDirectoryURL__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v29 = xmmword_1868D6898;
  uint64_t v30 = 0LL;
  v8 = &v29;
  while (1)
  {
    uint64_t v10 = *(void *)v8;
    v8 = (__int128 *)((char *)v8 + 8);
    uint64_t v9 = v10;
    if (!v10)
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@" Found no possible URLs for directory type %lu",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)&v29);
      return;
    }

    v11 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "URLsForDirectory:inDomains:",  v9,  1);
    if ([v11 count])
    {
      v12 = (void *)[v11 objectAtIndex:0];
      if (v12) {
        break;
      }
    }
  }

  v13 = (void *)[MEMORY[0x1896078A8] defaultManager];
  char v28 = 0;
  char v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v28);
  if ((v14 & 1) != 0)
  {
    if (!v28)
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@" File %@ already exists and is not a directory!",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v12);
      return;
    }

    goto LABEL_12;
  }

  id v27 = 0LL;
  if ([v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v27])
  {
LABEL_12:
    _MergedGlobals_82 = v12;
    return;
  }

  [v27 domain];
  [v27 code];
  _NSCoreDataLog( 1LL,  (uint64_t)@" Failed to create directory %@: %@ (%d)",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v12);
}

- (NSArray)persistentStoreDescriptions
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_sync_enter(self);
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions)
  {
    v4 = storeDescriptions;
    objc_sync_exit(self);
    if (v4) {
      return v4;
    }
  }

  else
  {
    objc_sync_exit(self);
  }

  v5 = (void *)[(id)objc_opt_class() defaultDirectoryURL];
  if (!v5)
  {
    v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = (void *)NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (void *)[v8 exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( v9, "stringWithFormat:", @"+[%@ %@] Could not conjure up a useful location for writing persistent stores.", v11, NSStringFromSelector(sel__createDefaultStoreDescriptions)), 0 reason userInfo];
    objc_exception_throw(v12);
    __break(1u);
    JUMPOUT(0x186868B00LL);
  }

  uint64_t v6 = [v5 URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@.sqlite", self->_name), 0 isDirectory];
  if (v6)
  {
    *(void *)buf = objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "persistentStoreDescriptionClass"),  "persistentStoreDescriptionWithURL:",  v6);
    v7 = (void *)[MEMORY[0x189603F18] arrayWithObjects:buf count:1];
  }

  else
  {
    v7 = (void *)MEMORY[0x189604A58];
  }

  v4 = v7;
  objc_sync_enter(self);
  if (self->_storeDescriptions)
  {

    v4 = self->_storeDescriptions;
  }

  else
  {
    v13 = (NSArray *)MEMORY[0x189604A58];
    if (v4) {
      v13 = v4;
    }
    self->_storeDescriptions = v13;
  }

  objc_sync_exit(self);
  if (v4) {
    return v4;
  }
  return (NSArray *)MEMORY[0x189604A58];
}

- (void)setPersistentStoreDescriptions:(NSArray *)persistentStoreDescriptions
{
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions != persistentStoreDescriptions)
  {

    self->_storeDescriptions = 0LL;
    self->_storeDescriptions = (NSArray *)-[NSArray copy](persistentStoreDescriptions, "copy");
  }

  objc_sync_exit(self);
}

- (NSManagedObjectContext)viewContext
{
  p_viewContext = &self->_viewContext;
  if (!self->_viewContext)
  {
    v4 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  2LL);
    -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)v4, self->_storeCoordinator);
    while (!__ldaxr((unint64_t *)p_viewContext))
    {
    }

    __clrex();
  }

  return *p_viewContext;
}

- (NSPersistentContainer)init
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A48];
  v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = (void *)[v2 exceptionWithName:v3, objc_msgSend( v4, "stringWithFormat:", @"Failed to call designated initializer on '%@' \n", NSStringFromClass(v5)), 0 reason userInfo];
  objc_exception_throw(v6);
  return (NSPersistentContainer *)-[NSPersistentContainer managedObjectModel](v7, v8);
}

- (NSManagedObjectModel)managedObjectModel
{
  return -[NSPersistentStoreCoordinator managedObjectModel](self->_storeCoordinator, "managedObjectModel");
}

+ (id)_newModelForName:(id)a3
{
  v4 = (void *)[MEMORY[0x1896077F8] mainBundle];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v4;
  if (v5 != objc_opt_class())
  {
    uint64_t v7 = [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
    if (v7) {
      uint64_t v6 = (void *)v7;
    }
    else {
      uint64_t v6 = v4;
    }
  }

  id v8 = (id)[v6 URLForResource:a3 withExtension:@"momd"];
  if (v8) {
    goto LABEL_7;
  }
  id v8 = (id)[v6 URLForResource:a3 withExtension:@"mom"];
  if (v8) {
    goto LABEL_7;
  }
  if (v6 == v4) {
    return 0LL;
  }
  id v8 = (id)[v4 URLForResource:a3 withExtension:@"momd"];
  if (v8 || (result = (id)[v4 URLForResource:a3 withExtension:@"mom"], (id v8 = result) != 0))
  {
LABEL_7:
    id result = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v8);
    if (result) {
      return result;
    }
    uint64_t v10 = [v8 path];
    _NSCoreDataLog(1LL, (uint64_t)@" Failed to load model at path: %@", v11, v12, v13, v14, v15, v16, v10);
    return 0LL;
  }

  return result;
}

- (NSPersistentContainer)initWithName:(NSString *)name
{
  uint64_t v5 = [(id)objc_opt_class() _newModelForName:name];
  if (v5)
  {
    uint64_t v12 = (void *)v5;
    uint64_t v13 = -[NSPersistentContainer initWithName:managedObjectModel:](self, "initWithName:managedObjectModel:", name, v5);

    return v13;
  }

  else
  {
    _NSCoreDataLog(1LL, (uint64_t)@" Failed to load model named %@", v6, v7, v8, v9, v10, v11, (uint64_t)name);

    return 0LL;
  }

- (NSPersistentContainer)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NSPersistentContainer;
  uint64_t v6 = -[NSPersistentContainer init](&v28, sel_init);
  if (v6)
  {
    if (-[NSString length](name, "length"))
    {
      if ((-[NSString isEqual:]( name,  "isEqual:",  -[NSString lastPathComponent]( -[NSString stringByStandardizingPath](name, "stringByStandardizingPath"),  "lastPathComponent")) & 1) != 0) {
        goto LABEL_7;
      }
      uint64_t v7 = [NSString stringWithUTF8String:"-[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'"];
      _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, (uint64_t)name);
      uint64_t v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = name;
      uint64_t v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'";
      uint64_t v16 = (os_log_s *)v14;
      uint32_t v17 = 12;
    }

    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"-[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name"];
      _NSCoreDataLog(17LL, v18, v19, v20, v21, v22, v23, v24, v27);
      uint64_t v25 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_7:
        v6->_name = (NSString *)-[NSString copy](name, "copy");
        v6->_storeCoordinator = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  model);
        v6->_storeDescriptions = 0LL;
        return v6;
      }

      *(_WORD *)buf = 0;
      uint64_t v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name";
      uint64_t v16 = (os_log_s *)v25;
      uint32_t v17 = 2;
    }

    _os_log_fault_impl(&dword_186681000, v16, OS_LOG_TYPE_FAULT, v15, buf, v17);
    goto LABEL_7;
  }

  return v6;
}

- (void)dealloc
{
  name = self->_name;
  if (name) {

  }
  viewContext = self->_viewContext;
  if (viewContext) {

  }
  storeCoordinator = self->_storeCoordinator;
  if (storeCoordinator) {

  }
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions) {

  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSPersistentContainer;
  -[NSPersistentContainer dealloc](&v7, sel_dealloc);
}

- (void)loadPersistentStoresWithCompletionHandler:(void *)block
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = -[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions", 0LL);
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v10) copy];
        [v5 addObject:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  -[NSPersistentContainer _loadStoreDescriptions:withCompletionHandler:]( self,  "_loadStoreDescriptions:withCompletionHandler:",  v5,  block);
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"-[NSPersistentContainer loadPersistentStoresWithCompletionHandler:] called on an instance with no store descriptions" userInfo:0]);
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v11 shouldAddStoreAsynchronously] & 1) == 0) {
          -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:]( self->_storeCoordinator,  "addPersistentStoreWithDescription:completionHandler:",  v11,  a4);
        }
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v8);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(a3);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        if ([v16 shouldAddStoreAsynchronously]) {
          -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:]( self->_storeCoordinator,  "addPersistentStoreWithDescription:completionHandler:",  v16,  a4);
        }
      }

      uint64_t v13 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v13);
  }

- (NSManagedObjectContext)newBackgroundContext
{
  if (!-[NSArray count]( -[NSPersistentStoreCoordinator persistentStores](self->_storeCoordinator, "persistentStores"),  "count"))
  {
    uint64_t v3 = -[NSPersistentContainer name](self, "name");
    _NSCoreDataLog( 2LL,  (uint64_t)@" Background context created for persistent container %@ with no stores loaded",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v3);
  }

  uint64_t v10 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
  if (-[NSManagedObjectContext parentContext](self->_viewContext, "parentContext")) {
    -[NSManagedObjectContext setParentContext:]( v10,  "setParentContext:",  -[NSManagedObjectContext parentContext](self->_viewContext, "parentContext"));
  }
  else {
    -[NSManagedObjectContext setPersistentStoreCoordinator:]( v10,  "setPersistentStoreCoordinator:",  self->_storeCoordinator);
  }
  return v10;
}

- (void)performBackgroundTask:(void *)block
{
  uint64_t v4 = -[NSPersistentContainer newBackgroundContext](self, "newBackgroundContext");
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __47__NSPersistentContainer_performBackgroundTask___block_invoke;
  v5[3] = &unk_189EA8A98;
  v5[4] = v4;
  v5[5] = block;
  -[NSManagedObjectContext performBlock:](v4, "performBlock:", v5);
}

void __47__NSPersistentContainer_performBackgroundTask___block_invoke(uint64_t a1)
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 32LL, 1);
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithName:", objc_msgSend(a3, "lastPathComponent"));
  uint64_t v6 = (void *)[a1 persistentStoreDescriptionClass];
  v8[0] = objc_msgSend( v6,  "persistentStoreDescriptionWithURL:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:]( v5,  "setPersistentStoreDescriptions:",  [MEMORY[0x189603F18] arrayWithObjects:v8 count:1]);
  return v5;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 modelNamed:(id)a4
{
  uint64_t v6 = (void *)[a1 _newModelForName:a4];
  uint64_t v7 = (NSPersistentContainer *)[a1 persistentContainerWithPath:a3 managedObjectModel:v6];

  return v7;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 managedObjectModel:(id)a4
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (NSPersistentContainer *)objc_msgSend( a1,  "persistentContainerWithName:managedObjectModel:",  objc_msgSend(a3, "lastPathComponent"),  a4);
  uint64_t v7 = (void *)[a1 persistentStoreDescriptionClass];
  v9[0] = objc_msgSend( v7,  "persistentStoreDescriptionWithURL:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:]( v6,  "setPersistentStoreDescriptions:",  [MEMORY[0x189603F18] arrayWithObjects:v9 count:1]);
  return v6;
}

+ (id)persistentContainerUsingCachedModelWithPath:(id)a3
{
  id v15 = 0LL;
  uint64_t v5 = objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:");
  id v6 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v5,  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1, "persistentStoreDescriptionClass"),  "persistentStoreDescriptionWithURL:",  v5),  "options"),  &v15);
  if (v6) {
    return (id)[a1 persistentContainerWithPath:a3 managedObjectModel:v6];
  }
  uint64_t v8 = (uint64_t)v15;
  [v15 userInfo];
  _NSCoreDataLog( 1LL,  (uint64_t)@"cachedModelForPersistentStoreWithURL failed with error %@ and userInfo of %@",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
  return 0LL;
}

- (BOOL)load:(id *)a3
{
  uint64_t v18 = 0LL;
  __int128 v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  __int128 v21 = __Block_byref_object_copy__37;
  __int128 v22 = __Block_byref_object_dispose__37;
  uint64_t v23 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3020000000LL;
  int v17 = 0;
  int v5 = -[NSArray count]( -[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions"),  "count");
  id v6 = dispatch_semaphore_create(0LL);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __43__NSPersistentContainer_CoreDataSPI__load___block_invoke;
  v13[3] = &unk_189EAAE58;
  v13[6] = &v14;
  v13[4] = v6;
  v13[5] = &v18;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( self,  "loadPersistentStoresWithCompletionHandler:",  v13);
  while (*((_DWORD *)v15 + 10) != v5)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 120000000000LL);
    dispatch_semaphore_wait(v6, v7);
    __dmb(0xBu);
  }

  dispatch_release(v6);
  id v8 = (id)v19[5];
  uint64_t v9 = v19;
  if (a3)
  {
    uint64_t v10 = (void *)v19[5];
    if (v10) {
      *a3 = v10;
    }
  }

  BOOL v11 = v9[5] == 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __43__NSPersistentContainer_CoreDataSPI__load___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    [a3 userInfo];
    _NSCoreDataLog( 1LL,  (uint64_t)@"Store failed to load.  %@ with error = %@ with userInfo %@",  v5,  v6,  v7,  v8,  v9,  v10,  a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a3;
  }

  BOOL v11 = (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  do
    unsigned int v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end