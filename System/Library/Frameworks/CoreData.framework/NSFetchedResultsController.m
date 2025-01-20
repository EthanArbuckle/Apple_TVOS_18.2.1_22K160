@interface NSFetchedResultsController
+ (uint64_t)_CoreDataSectionCachesPath;
+ (uint64_t)_insertIndexForObject:(void *)a3 inArray:(uint64_t)a4 lowIdx:(uint64_t)a5 highIdx:(void *)a6 sortDescriptors:;
+ (void)deleteCacheWithName:(NSString *)name;
+ (void)initialize;
- (BOOL)_updateFetchedObjectsWithInsertChange:(uint64_t)a1;
- (BOOL)performFetch:(NSError *)error;
- (NSArray)fetchedObjects;
- (NSArray)sectionIndexTitles;
- (NSArray)sections;
- (NSFetchRequest)fetchRequest;
- (NSFetchedResultsController)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name;
- (NSIndexPath)indexPathForObject:(id)object;
- (NSInteger)sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)sectionIndex;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)cacheName;
- (NSString)sectionIndexTitleForSectionName:(NSString *)sectionName;
- (NSString)sectionNameKeyPath;
- (const)_sectionNameForObject:(const __CFString *)result;
- (id)_fetchedObjects;
- (id)_sectionCachePath;
- (id)delegate;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (uint64_t)_appendAffectedStoreInfoToData:(void *)a3 adjustedOffset:;
- (uint64_t)_computeSectionInfo:(id *)a3 error:;
- (uint64_t)_conditionallyDispatchSnapshotToDelegate:(void *)a3 updatesInfo:;
- (uint64_t)_fetchedObjectsArrayOfObjectIDs;
- (uint64_t)_indexPathForIndex:(void *)a1;
- (uint64_t)_keyPathContainsNonPersistedProperties:(void *)a1;
- (uint64_t)_objectInResults:(uint64_t)a1;
- (uint64_t)_preprocessDeletedObjects:(void *)a3 deletesInfo:(void *)a4 sectionsWithDeletes:;
- (uint64_t)_preprocessUpdatedObjects:(void *)a3 insertsInfo:(void *)a4 deletesInfo:(void *)a5 updatesInfo:(void *)a6 sectionsWithDeletes:(void *)a7 newSectionNames:(void *)a8 treatAsRefreshes:;
- (uint64_t)_recursivePerformBlockAndWait:(void *)a3 withContext:;
- (uint64_t)_resolveSectionIndexTitleForSectionName:(uint64_t)a1;
- (uint64_t)_restoreCachedSectionInfo;
- (uint64_t)_updateFetchedObjectsWithDeleteChange:(unint64_t)a1;
- (uint64_t)_updateIndexCacheWithFetchedObjects;
- (unint64_t)_indexOfCachedID:(uint64_t)a1;
- (unint64_t)_indexOfFetchedID:(int)a3 isManagedObjectID:;
- (void)_core_managedObjectContextDidChange:(void *)result;
- (void)_core_managedObjectContextDidSave:(uint64_t)a1;
- (void)_lowerMoveOperationsToUpdatesForSection:(void *)a3 withInsertedObjects:(void *)a4 deletedObjects:(void *)a5 updatedObjects:;
- (void)_makeMutableFetchedObjects;
- (void)_managedObjectContextDidChange:(id)a3;
- (void)_managedObjectContextDidChangeObjectIDs:(id)a3;
- (void)_managedObjectContextDidMutateObjectIDs:(id)a3;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_updateSectionOffsetsStartingAtSection:(uint64_t)a1;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
@end

@implementation NSFetchedResultsController

+ (void)initialize
{
}

- (NSFetchedResultsController)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (!fetchRequest || !context)
  {
    uint64_t v34 = [NSString stringWithFormat:@"An instance of %@ requires a non-nil fetchRequest and managedObjectContext", objc_opt_class()];
    goto LABEL_40;
  }

  if (!-[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors"))
  {
    uint64_t v34 = [NSString stringWithFormat:@"An instance of %@ requires a fetch request with sort descriptors", objc_opt_class()];
LABEL_40:
    uint64_t v35 = v34;

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v35 userInfo:0]);
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NSFetchedResultsController;
  v11 = -[NSFetchedResultsController init](&v41, sel_init);
  if (v11)
  {
    v11->_fetchRequest = fetchRequest;
    v11->_managedObjectContext = context;
    uint64_t v12 = -[NSString copy](sectionNameKeyPath, "copy");
    v11->_sectionNameKeyPath = (NSString *)v12;
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFF7 | (8 * (v12 != 0)));
    v13 = -[NSFetchRequest predicate](v11->_fetchRequest, "predicate");
    v11->_originalPredicate = v13;
    if (v13) {
      v11->_remappedPredicate = (NSPredicate *)-[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v13,  v11->_managedObjectContext);
    }
    v11->_cacheName = (NSString *)-[NSString copy](name, "copy");
    v14 = -[NSFetchRequest sortDescriptors](v11->_fetchRequest, "sortDescriptors");
    -[NSFetchRequest _resolveEntityWithContext:](v11->_fetchRequest, "_resolveEntityWithContext:", context);
    v15 = -[NSFetchRequest entity](v11->_fetchRequest, "entity");
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | ((-[NSFetchRequest resultType]( v11->_fetchRequest,  "resultType") == 2) << 13));
    v36 = context;
    if (-[NSDictionary count](-[NSEntityDescription subentitiesByName](v15, "subentitiesByName"), "count"))
    {
      if (-[NSFetchRequest includesSubentities](v11->_fetchRequest, "includesSubentities")) {
        int v16 = 32;
      }
      else {
        int v16 = 0;
      }
    }

    else
    {
      int v16 = 0;
    }

    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFDF | v16);
    v11->_sortKeys = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v14);
          }
          v21 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) key];
          v22 = (void *)[MEMORY[0x189603FA8] array];
          for (j = v21; ; v21 = j)
          {
            [j rangeOfString:@"."];
            if (!v24) {
              break;
            }
            objc_msgSend(v22, "insertObject:atIndex:", objc_msgSend(v21, "pathExtension"), 0);
            j = (void *)[v21 stringByDeletingPathExtension];
          }

          [v11->_sortKeys addObject:v21];
          [v22 insertObject:v21 atIndex:0];
          if ((*((_BYTE *)&v11->_flags + 1) & 0x20) == 0)
          {
            else {
              int v25 = 0;
            }
            v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v25);
          }
        }

        uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
      }

      while (v18);
    }

    if ((*(_BYTE *)&v11->_flags & 8) != 0)
    {
      v11->_sectionNameKey = v11->_sectionNameKeyPath;
      v26 = (void *)[MEMORY[0x189603FA8] array];
      -[NSString rangeOfString:](v11->_sectionNameKey, "rangeOfString:", @".");
      if (v27)
      {
        do
        {
          objc_msgSend( v26,  "insertObject:atIndex:",  -[NSString pathExtension](v11->_sectionNameKey, "pathExtension"),  0);
          v28 = -[NSString stringByDeletingPathExtension](v11->_sectionNameKey, "stringByDeletingPathExtension");
          v11->_sectionNameKey = v28;
          -[NSString rangeOfString:](v28, "rangeOfString:", @".");
        }

        while (v29);
      }

      v30 = v11->_sectionNameKey;
      [v26 insertObject:v11->_sectionNameKey atIndex:0];
      if ((*((_BYTE *)&v11->_flags + 1) & 0x20) == 0)
      {
        else {
          int v31 = 0;
        }
        v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v31);
      }
    }

    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v11,  sel__managedObjectContextDidSave_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  v36);
    if (v11->_cacheName)
    {
      uint64_t v32 = -[NSManagedObjectContext persistentStoreCoordinator](v36, "persistentStoreCoordinator");
      objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "addObserver:selector:name:object:",  v11,  sel__managedObjectContextDidSave_,  @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification",  v32);
    }
  }

  return v11;
}

- (uint64_t)_keyPathContainsNonPersistedProperties:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "entity"), "propertiesByName");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(a2);
        }
        v8 = (void *)[v3 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (!v8) {
          return 1LL;
        }
        v9 = v8;
        if ([v8 isTransient]) {
          return 1LL;
        }
        uint64_t v10 = [v9 _propertyType];
        if ([v9 _isAttribute])
        {
          uint64_t v11 = [v9 attributeType];
          if (v11 == 1800 || v11 == 0)
          {
            unsigned __int8 v18 = 1;
            if (!v11) {
              return v18;
            }
          }

          else
          {
            v3 = 0LL;
            if (!v11) {
              return v18;
            }
          }

          if (v11 == 1800) {
            return v18;
          }
        }

        else if ([v9 _isRelationship])
        {
          v3 = (void *)objc_msgSend((id)objc_msgSend(v9, "destinationEntity"), "propertiesByName");
        }

        else
        {
          if (v10) {
            BOOL v13 = v10 == 3;
          }
          else {
            BOOL v13 = 1;
          }
          if (v13) {
            return 1LL;
          }
          v3 = 0LL;
        }
      }

      uint64_t v5 = [a2 countByEnumeratingWithState:&v14 objects:v19 count:16];
      uint64_t result = 0LL;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchedResultsController;
  -[NSFetchedResultsController dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  delegate = (id *)self->_delegate;
  if (delegate) {
    return objc_loadWeak(delegate + 1);
  }
  else {
    return 0LL;
  }
}

- (void)setDelegate:(id)delegate
{
  v4 = (id *)self->_delegate;
  id v30 = delegate;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained(v4 + 1);
    uint64_t v6 = v30;
    if (WeakRetained) {
      BOOL v7 = WeakRetained == v30;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      goto LABEL_19;
    }
    v8 = WeakRetained;
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  self,  @"_NSObjectsChangedInManagingContextPrivateNotification",  -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  self,  @"_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification",  -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"),  "removeObserver:name:object:",  self,  @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification",  -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    *(_DWORD *)&self->_flags &= 0xFFFFE03F;
    self->_delegate = 0LL;

    delegate = v30;
  }

  if (delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      int v9 = 2048;
    }
    else {
      int v9 = 0;
    }
    self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v9);
    int v10 = BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (NSClassFromString((NSString *)@"NSDiffableDataSourceSnapshot")
       || NSClassFromString((NSString *)@"_PFDiffableDataSourceSnapshot")))
    {
      int v11 = 256;
    }

    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || self->_sectionNameKeyPath)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          _NSCoreDataLog( 2LL,  (uint64_t)@"Difference delegate method is not supported when fetched results controller is configured with a sectionNameKeyPath",  v13,  v14,  v15,  v16,  v17,  v18,  v29);
        }
        char v19 = objc_opt_respondsToSelector();
        if ((v19 & 1) != 0) {
          int v20 = 128;
        }
        else {
          int v20 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v20);
        char v21 = objc_opt_respondsToSelector();
        if ((v21 & 1) != 0) {
          int v22 = 512;
        }
        else {
          int v22 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v22);
        char v23 = objc_opt_respondsToSelector();
        if ((v23 & 1) != 0) {
          int v24 = 1024;
        }
        else {
          int v24 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v24);
        char v25 = objc_opt_respondsToSelector();
        if ((v25 & 1) != 0) {
          int v26 = 4096;
        }
        else {
          int v26 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v26);
        if (v10 && (v19 & 1) == 0 && (v21 & 1) == 0 && (v23 & 1) == 0 && (v25 & 1) == 0)
        {
LABEL_44:
          self->_delegate = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  v30);
          return;
        }

- (unint64_t)_indexOfCachedID:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  objc_super v3 = (void *)[*(id *)(a1 + 136) objectForKey:a2];
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      BOOL v7 = *(void **)(a1 + 144);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        unint64_t v4 = v6;
        while (1)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            if (v12)
            {
              if (v4 < *(void *)(v12 + 8)) {
                continue;
              }
              uint64_t v12 = *(void *)(v12 + 24);
            }

            v4 += v12;
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (!v9) {
            return v4;
          }
        }
      }

      return v6;
    }
  }

  return v4;
}

- (unint64_t)_indexOfFetchedID:(int)a3 isManagedObjectID:
{
  if (result)
  {
    uint64_t v5 = result;
    if ([*(id *)(result + 8) resultType] != 1)
    {
      if ([*(id *)(v5 + 8) resultType] == 2) {
        return [*(id *)(v5 + 96) indexOfObject:a2];
      }
      if ([*(id *)(v5 + 8) resultType])
      {
        objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Result type of fetched object is not an NSManagedObjectIDResultType, NSDictionaryResultType or NSManagedObjectResultType.",  0));
        return -[NSFetchedResultsController performFetch:](v6, v7, v8);
      }

      if ((a3 & 1) == 0) {
        a2 = (void *)[a2 objectID];
      }
    }

    if ((objc_opt_respondsToSelector() & 1) != 0 && a3) {
      return [*(id *)(v5 + 96) indexOfManagedObjectForObjectID:a2];
    }
    else {
      return -[NSFetchedResultsController _indexOfCachedID:](v5, (uint64_t)a2);
    }
  }

  return result;
}

- (BOOL)performFetch:(NSError *)error
{
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  uint64_t v18 = __Block_byref_object_copy__20;
  uint64_t v19 = __Block_byref_object_dispose__20;
  uint64_t v20 = 0LL;
  NSFetchRequestResultType v5 = -[NSFetchRequest resultType](self->_fetchRequest, "resultType");
  BOOL v6 = -[NSFetchRequest returnsObjectsAsFaults](self->_fetchRequest, "returnsObjectsAsFaults");
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __43__NSFetchedResultsController_performFetch___block_invoke;
  v12[3] = &unk_189EA95B0;
  BOOL v13 = v5 == 2;
  v12[4] = self;
  v12[5] = &v21;
  v12[6] = &v15;
  BOOL v14 = v6;
  -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:]( (uint64_t)self,  (uint64_t)v12,  self->_managedObjectContext);
  if (!v16[5])
  {
    id v7 = -[NSFetchedResultsController delegate](self, "delegate");
    if (v7)
    {
      -[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:]( (uint64_t)self,  v7,  (void *)[MEMORY[0x189604010] set]);
    }
  }

  id v8 = (id)v16[5];
  if (error)
  {
    uint64_t v9 = (NSError *)v16[5];
    if (v9) {
      *error = v9;
    }
  }

  char v10 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v10;
}

void __43__NSFetchedResultsController_performFetch___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 136LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 144LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 104LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 112LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 128LL) = 0LL;
  *(_DWORD *)(*(void *)(a1 + 32) + 72LL) &= ~4u;
  *(_DWORD *)(*(void *)(a1 + 32) + 72LL) &= ~2u;
  [*(id *)(*(void *)(a1 + 32) + 8) setReturnsObjectsAsFaults:1];
  if (BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
    && !*(_BYTE *)(a1 + 56)
    && (![*(id *)(*(void *)(a1 + 32) + 16) hasChanges]
     || ([*(id *)(*(void *)(a1 + 32) + 8) includesPendingChanges] & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(void *)(a1 + 32));
  }

  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 96))
  {
    *(void *)(*(void *)(a1 + 32) + 96) = (id)[*(id *)(v2 + 16) executeFetchRequest:*(void *)(v2 + 8) error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
    if (!*(_BYTE *)(a1 + 56))
    {
      *(void *)(*(void *)(a1 + 32) + 144LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(*(void *)(a1 + 32) + 136) = objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "count"));
      -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*(void *)(a1 + 32));
    }

    if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88) || *(_BYTE *)(a1 + 56)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(void *)(a1 + 32));
    }
  }

  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 96);
  if (v4)
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      if ([*(id *)(v3 + 104) count]) {
        goto LABEL_22;
      }
      uint64_t v3 = *(void *)(a1 + 32);
      unint64_t v4 = *(void **)(v3 + 96);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[NSFetchedResultsController _computeSectionInfo:error:]( v3,  v4,  (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)
      || (uint64_t v5 = *(void *)(a1 + 32), *(void *)(v5 + 40))
      && *(void *)(v5 + 80)
      && ((uint64_t v6 = *(void *)(v5 + 16)) == 0 || (*(_BYTE *)(v6 + 41) & 0x80) == 0)
      && (*(_DWORD *)(v5 + 72) |= 1u,
          -[NSFetchedResultsController _core_managedObjectContextDidSave:](*(void *)(a1 + 32), 0LL),
          !*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)))
    {

      *(void *)(*(void *)(a1 + 32) + 96LL) = 0LL;
      *(void *)(*(void *)(a1 + 32) + 136LL) = 0LL;

      *(void *)(*(void *)(a1 + 32) + 144LL) = 0LL;
    }
  }

- (uint64_t)_restoreCachedSectionInfo
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (uint64_t)-[NSFetchedResultsController _sectionCachePath](result);
    if (result)
    {
      uint64_t v2 = (void *)[(id)result stringByAppendingPathComponent:@"sectionInfo"];
      uint64_t v3 = (const char *)[v2 fileSystemRepresentation];
      if (stat(v3, &v116)) {
        return 0LL;
      }
      unint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfMappedFile:v2];
      unint64_t v5 = [v4 length];
      unint64_t v115 = 0LL;
      if (v5 < 0x20
        || ((unint64_t v6 = v5, v7 = (void *)[v4 bytes], *v7 == 0x3562366135623134)
          ? (BOOL v8 = v7[1] == 0x3463383438653663LL)
          : (BOOL v8 = 0),
            v8 ? (BOOL v9 = v7[2] == 0x6330383438613236LL) : (BOOL v9 = 0),
            v9 ? (BOOL v10 = v7[3] == 0x3366656163343264LL) : (BOOL v10 = 0),
            !v10))
      {
LABEL_27:

        unlink(v3);
        return 0LL;
      }

      uint64_t v11 = (uint64_t)v7;
      v115 += 48LL;
      uint64_t v12 = (void *)objc_msgSend((id)objc_msgSend((id)v1, "fetchRequest"), "entity");
      id v13 = _newReadStringFromBytes(v11, &v115, v6);
      if (!v13
        || (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", v13) & 1) == 0
        || (v13, (id v13 = _newReadDataFromBytes(v11, &v115, v6)) == 0LL)
        || (objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqualToData:", v13) & 1) == 0)
      {

        goto LABEL_27;
      }

      id v14 = _newReadStringFromBytes(v11, &v115, v6);
      if (v14)
      {
        uint64_t v15 = *(void **)(v1 + 24);
        if (!v15)
        {
LABEL_24:
          if ([v14 length]) {
            goto LABEL_25;
          }
LABEL_30:

          unint64_t v16 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v16 + 4 <= v6)
          {
            unsigned int v114 = bswap32(*(_DWORD *)(v11 + v16));
            unint64_t v115 = v16 + 4;
          }

          else
          {
            unsigned int v114 = 0;
          }

          if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
            && objc_msgSend((id)objc_msgSend((id)v1, "fetchedObjects"), "count") != v114)
          {
            goto LABEL_27;
          }

          uint64_t v17 = (void *)[*(id *)(v1 + 8) sortDescriptors];
          uint64_t v18 = v17;
          unint64_t v19 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v19 + 4 <= v6)
          {
            unsigned int v20 = *(_DWORD *)(v11 + v19);
            uint64_t v21 = bswap32(v20);
            unint64_t v115 = v19 + 4;
            if (v20)
            {
              uint64_t v22 = 0LL;
              do
              {
                id v23 = _newReadStringFromBytes(v11, &v115, v6);
                int v24 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v22), "key"),  "isEqualToString:",  v23);

                if (!v24) {
                  goto LABEL_27;
                }
              }

              while (v21 != ++v22);
            }
          }

          else if ([v17 count])
          {
            goto LABEL_27;
          }

          char v25 = (void *)[*(id *)(v1 + 8) affectedStores];
          if (![v25 count]) {
            char v25 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(v1 + 16), "persistentStoreCoordinator"),  "persistentStores");
          }
          unint64_t v26 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v26 + 4 <= v6)
          {
            unsigned int v27 = *(_DWORD *)(v11 + v26);
            unsigned int v28 = bswap32(v27);
            unint64_t v115 = v26 + 4;
            if (v27)
            {
              uint64_t v29 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:",  v25,  objc_msgSend(v25, "valueForKey:", @"identifier"));
              do
              {
                id v30 = _newReadStringFromBytes(v11, &v115, v6);
                int v31 = (void *)[v29 objectForKey:v30];

                if (!v31) {
                  goto LABEL_27;
                }
                __darwin_time_t v32 = stat_path_for_modication_time((void *)[v31 URL]);
                unint64_t v34 = (v115 + 7) & 0xFFFFFFFFFFFFFFF8LL;
                unint64_t v35 = v34 + 8;
                if (v34 + 8 <= v6)
                {
                  unint64_t v36 = bswap64(*(void *)(v11 + v34));
                  unint64_t v115 = v34 + 8;
                  unint64_t v34 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8LL;
                  unint64_t v35 = v34 + 8;
                }

                else
                {
                  unint64_t v36 = 0LL;
                }

                if (v35 <= v6)
                {
                  unint64_t v37 = bswap64(*(void *)(v11 + v34));
                  unint64_t v115 = v35;
                }

                else
                {
                  unint64_t v37 = 0LL;
                }

                if (v36 != v32 || v37 != v33) {
                  goto LABEL_27;
                }
              }

              while (--v28);
            }
          }

          else if ([v25 count])
          {
            goto LABEL_27;
          }

          *(void *)(v1 + 104) = objc_alloc_init(MEMORY[0x189603FD0]);
          *(void *)(v1 + 112) = objc_alloc_init(MEMORY[0x189603FC8]);

          *(void *)(v1 + 120) = 0LL;
          *(void *)(v1 + 128) = 0LL;
          unint64_t v38 = v115;
          unint64_t v39 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v40 = v39 + 4;
          if (v39 + 4 <= v6)
          {
            unsigned int v41 = *(_DWORD *)(v11 + v39);
            unint64_t v115 = v40;
            unint64_t v38 = v40;
            if (v41)
            {
              unsigned int v42 = bswap32(v41);
              while (1)
              {
                id v43 = _newReadStringFromBytes(v11, &v115, v6);
                id v44 = _newReadStringFromBytes(v11, &v115, v6);
                id v14 = v44;
                unint64_t v45 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                unint64_t v46 = v45 + 4;
                if (v45 + 4 <= v6)
                {
                  unsigned int v47 = bswap32(*(_DWORD *)(v11 + v45));
                  unint64_t v115 = v45 + 4;
                  unint64_t v45 = (v45 + 7) & 0xFFFFFFFFFFFFFFFCLL;
                  unint64_t v46 = v45 + 4;
                }

                else
                {
                  unsigned int v47 = 0;
                }

                if (v46 <= v6)
                {
                  unsigned int v48 = bswap32(*(_DWORD *)(v11 + v45));
                  unint64_t v115 = v46;
                }

                else
                {
                  unsigned int v48 = 0;
                }

                if (!v43 || !v44) {
                  break;
                }
                v49 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo),  v1,  v43,  0LL,  v44,  v48);
                v50 = v49;
                if (v49)
                {
                  v49[5] = v47;

                  v50[7] = 0LL;
                }

                [*(id *)(v1 + 104) addObject:v50];
                if ((*(_BYTE *)(v1 + 72) & 8) != 0) {
                  objc_msgSend(*(id *)(v1 + 112), "setObject:forKey:", v50, objc_msgSend(v50, "name"));
                }

                if (!--v42)
                {
                  unint64_t v38 = v115;
                  goto LABEL_78;
                }
              }

              goto LABEL_25;
            }
          }

- (uint64_t)_updateIndexCacheWithFetchedObjects
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (id *)result;
    [*(id *)(result + 136) removeAllObjects];
    [v1[18] removeAllObjects];
    if (![v1[1] resultType] || (uint64_t result = objc_msgSend(v1[1], "resultType"), result == 1))
    {
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id obj = (id)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs]((uint64_t)v1);
      uint64_t result = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v2 = result;
        uint64_t v3 = 0LL;
        uint64_t v4 = *(void *)v10;
        do
        {
          uint64_t v5 = 0LL;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
            id v7 = (void *)MEMORY[0x186E3E5D8]();
            objc_msgSend( v1[17],  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v3 + v5),  v6);
            objc_autoreleasePoolPop(v7);
            ++v5;
          }

          while (v2 != v5);
          uint64_t result = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v2 = result;
          v3 += v5;
        }

        while (result);
      }
    }
  }

  return result;
}

- (uint64_t)_computeSectionInfo:(id *)a3 error:
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v4 = a2;
  uint64_t v5 = result;
  uint64_t v6 = [a2 count];

  *(void *)(v5 + 104) = objc_alloc_init(MEMORY[0x189603FD0]);
  *(void *)(v5 + 112) = objc_alloc_init(MEMORY[0x189603FC8]);

  *(void *)(v5 + 120) = 0LL;
  *(void *)(v5 + 128) = 0LL;
  int v7 = *(_DWORD *)(v5 + 72);
  unint64_t v88 = v6;
  if (!v6 && (v7 & 8) != 0) {
    return 1LL;
  }
  if ((v7 & 8) == 0)
  {
    BOOL v8 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo),  v5,  0LL,  0LL,  0LL,  0LL);
    __int128 v9 = v8;
    if (v8)
    {
      v8[5] = v88;

      v9[7] = 0LL;
    }

    [*(id *)(v5 + 104) addObject:v9];

    return 1LL;
  }

  if ([*(id *)(v5 + 8) includesPendingChanges]
    && (([*(id *)(v5 + 16) hasChanges] & 1) != 0 || objc_msgSend(*(id *)(v5 + 16), "parentContext"))
    || (*(_BYTE *)(v5 + 73) & 0x20) != 0
    || [*(id *)(v5 + 8) fetchLimit]
    || [*(id *)(v5 + 8) fetchOffset])
  {
    goto LABEL_14;
  }

  unint64_t v36 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "affectedStores"), "copy");
  if (!v36) {
    unint64_t v36 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(v5 + 16), "persistentStoreCoordinator"),  "persistentStores"),  "copy");
  }
  id v37 = v36;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  uint64_t v38 = [v36 countByEnumeratingWithState:&v100 objects:v106 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v101;
    do
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v101 != v40) {
          objc_enumerationMutation(v36);
        }
        if ((__CFString *)[*(id *)(*((void *)&v100 + 1) + 8 * i) type] != @"SQLite") {
          goto LABEL_14;
        }
      }

      uint64_t v39 = [v36 countByEnumeratingWithState:&v100 objects:v106 count:16];
    }

    while (v39);
  }

  v85 = v4;
  BOOL v83 = a3;
  id v42 = (id)objc_msgSend((id)objc_msgSend((id)v5, "fetchRequest"), "copy");
  [v42 setResultType:2];
  [v42 setIncludesPropertyValues:1];
  [v42 setFetchBatchSize:0];
  id v43 = (void *)[(id)v5 sectionNameKeyPath];
  id v44 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
  -[NSExpressionDescription setExpression:]( v44,  "setExpression:",  objc_msgSend( MEMORY[0x189607878],  "expressionForFunction:arguments:",  @"count:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend( MEMORY[0x189607878],  "expressionForFunction:selectorName:arguments:",  objc_msgSend( MEMORY[0x189607878],  "expressionForConstantValue:",  NSClassFromString((NSString *)@"_NSPredicateUtilities")),  @"distinct:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607878], "expressionForEvaluatedObject"))))));
  -[NSPropertyDescription setName:](v44, "setName:", @"sectionCount");
  -[NSExpressionDescription setExpressionResultType:](v44, "setExpressionResultType:", 200LL);
  objc_msgSend(v42, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v43, v44, 0));
  objc_msgSend(v42, "setPropertiesToGroupBy:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v43, 0));
  unint64_t v45 = (void *)[v42 sortDescriptors];
  if ([v45 count])
  {
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = 0LL;
      uint64_t v49 = *(void *)v97;
      do
      {
        for (uint64_t j = 0LL; j != v47; ++j)
        {
          if (*(void *)v97 != v49) {
            objc_enumerationMutation(v45);
          }
          unint64_t v51 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        }

        uint64_t v47 = [v45 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }

      while (v47);
      uint64_t v4 = v85;
      if (v48) {
        goto LABEL_68;
      }
    }

    uint64_t v52 = objc_msgSend((id)objc_msgSend(v45, "objectAtIndex:", 0), "ascending");
  }

  else
  {
    uint64_t v52 = 1LL;
  }

  uint64_t v48 = [MEMORY[0x189607A20] sortDescriptorWithKey:v43 ascending:v52];
LABEL_68:
  objc_msgSend(v42, "setSortDescriptors:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v48));
  id v95 = 0LL;
  int v53 = (void *)objc_msgSend((id)objc_msgSend((id)v5, "managedObjectContext"), "executeFetchRequest:error:", v42, &v95);
  if (v53)
  {
    v54 = v53;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    uint64_t v55 = [v53 countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      id obja = v54;
      uint64_t v57 = 0LL;
      uint64_t v89 = *(void *)v92;
      do
      {
        for (uint64_t k = 0LL; k != v56; ++k)
        {
          if (*(void *)v92 != v89) {
            objc_enumerationMutation(obja);
          }
          id v59 = *(void **)(*((void *)&v91 + 1) + 8 * k);
          v60 = (void *)MEMORY[0x186E3E5D8]();
          v61 = (void *)[v59 valueForKeyPath:v43];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(_DWORD *)(v5 + 72) |= 0x10u;
            unint64_t v62 = (__CFString *)(id)[v61 _retainedURIString];
          }

          else
          {
            unint64_t v62 = (__CFString *)[v61 description];
          }

          unint64_t v69 = v62;
          if (!v62)
          {
            _NSCoreDataLog( 1LL,  (uint64_t)@"(NSFetchedResultsController) A section returned nil value for section name key path '%@'. Objects will be placed in unnamed section",  v63,  v64,  v65,  v66,  v67,  v68,  *(void *)(v5 + 24));
            unint64_t v69 = &stru_189EAC2E8;
          }

          uint64_t v70 = [*(id *)(v5 + 112) objectForKey:v69];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = objc_msgSend( (id)objc_msgSend(v59, "valueForKeyPath:", @"sectionCount"),  "unsignedIntValue");
            *(void *)(v71 + 40) = [(id)v71 numberOfObjects] + v72;

            *(void *)(v71 + 56) = 0LL;
          }

          else
          {
            uint64_t v73 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v69);
            unint64_t v74 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( [_NSDefaultSectionInfo alloc],  v5,  v69,  (void *)[v59 valueForKeyPath:v43],  v73,  v57);
            unsigned int v75 = objc_msgSend((id)objc_msgSend(v59, "valueForKeyPath:", @"sectionCount"), "unsignedIntValue");
            uint64_t v72 = v75;
            if (v74)
            {
              v74[5] = v75;

              v74[7] = 0LL;
            }

            [*(id *)(v5 + 104) addObject:v74];
            [*(id *)(v5 + 112) setObject:v74 forKey:v69];
          }

          v57 += v72;
          objc_autoreleasePoolPop(v60);
        }

        uint64_t v56 = [obja countByEnumeratingWithState:&v91 objects:v104 count:16];
      }

      while (v56);
    }

    return 1LL;
  }

  [v95 userInfo];
  _NSCoreDataLog( 1LL,  (uint64_t)@"Fetching ERROR during section computation with request = %@ and error = %@ and userInfo = %@",  v76,  v77,  v78,  v79,  v80,  v81,  (uint64_t)v42);
  a3 = v83;
LABEL_14:
  __int128 v10 = (void *)[MEMORY[0x189603FE0] set];
  if ([*(id *)(v5 + 8) resultType] != 2)
  {
    v90[0] = MEMORY[0x1895F87A8];
    v90[1] = 3221225472LL;
    v90[2] = __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke;
    v90[3] = &unk_189EA7B70;
    v90[5] = v5;
    v90[6] = v88;
    v90[4] = v4;
    -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, (uint64_t)v90, *(void **)(v5 + 16));
  }

  __int128 v11 = (__CFString *)[v4 objectAtIndex:0];
  __int128 v12 = (id)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v5, v11);
  id v13 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
  uint64_t v14 = objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo);
  if ([*(id *)(v5 + 8) resultType] != 1)
  {
    if ([*(id *)(v5 + 8) resultType] == 4) {
      __int128 v11 = @"Count";
    }
    else {
      __int128 v11 = (__CFString *)-[__CFString valueForKeyPath:](v11, "valueForKeyPath:", *(void *)(v5 + 24));
    }
  }

  id obj = v13;
  uint64_t v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( v14,  v5,  v12,  v11,  v13,  0LL);
  [*(id *)(v5 + 104) addObject:v15];
  [*(id *)(v5 + 112) setObject:v15 forKey:v12];

  if (v88 < 2)
  {
    uint64_t v16 = 1LL;
LABEL_33:

    goto LABEL_34;
  }

  int v84 = v4;
  v82 = a3;
  BOOL v17 = 0;
  uint64_t v16 = 1LL;
  uint64_t v18 = 1LL;
  while (1)
  {
    unint64_t v19 = (void *)MEMORY[0x186E3E5D8]();
    unsigned int v20 = (__CFString *)[v84 objectAtIndex:v18];
    uint64_t v21 = (__CFString *)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v5, v20);
    if ((-[__CFString isEqualToString:](v21, "isEqualToString:", v12) & 1) == 0) {
      break;
    }
LABEL_32:
    ++v16;
    objc_autoreleasePoolPop(v19);
    BOOL v17 = ++v18 >= v88;
    if (v88 == v18) {
      goto LABEL_33;
    }
  }

  if (![v10 containsObject:v21])
  {
    [v10 addObject:v12];
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0LL;
    }

    __int128 v12 = v21;
    id v22 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
    id v23 = objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo);
    if ([*(id *)(v5 + 8) resultType] == 1)
    {
      int v24 = v20;
    }

    else
    {
      uint64_t v25 = [*(id *)(v5 + 8) resultType];
      int v24 = @"Count";
      if (v25 != 4) {
        int v24 = (__CFString *)-[__CFString valueForKeyPath:]( v20,  "valueForKeyPath:",  *(void *)(v5 + 24),  @"Count");
      }
    }

    id obj = v22;
    uint64_t v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( v23,  v5,  v12,  v24,  v22,  v18);
    [*(id *)(v5 + 104) addObject:v15];
    [*(id *)(v5 + 112) setObject:v15 forKey:v12];

    uint64_t v16 = 0LL;
    goto LABEL_32;
  }

  uint64_t v26 = [NSString stringWithFormat:@"The fetched object at index %lu has an out of order section name '%@'. Objects must be sorted by section name", v18, v12];
  if (v82)
  {
    id v27 = objc_alloc(MEMORY[0x189607870]);
    id *v82 = (id)objc_msgSend( v27,  "initWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", v26, @"reason"));
  }

  uint64_t v28 = objc_opt_class();
  _NSCoreDataLog(1LL, (uint64_t)@"(%@) %@", v29, v30, v31, v32, v33, v34, v28);

  *(void *)(v5 + 104) = 0LL;
  *(void *)(v5 + 112) = 0LL;

  *(void *)(v5 + 120) = 0LL;
  *(void *)(v5 + 128) = 0LL;
  objc_autoreleasePoolPop(v19);

  if (v17)
  {
LABEL_34:
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0LL;
    }

    return 1LL;
  }

  if (v82) {
    id v35 = *v82;
  }
  return 0LL;
}

- (void)_core_managedObjectContextDidSave:(uint64_t)a1
{
  v170[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = (void *)objc_msgSend( (id)objc_msgSend(a2, "userInfo"),  "objectForKey:",  @"_NSTriggerModifiedObjectIDsKey");
    if ([v4 count])
    {
      v169 = @"updated_objectIDs";
      v170[0] = v4;
      -[NSFetchedResultsController _core_managedObjectContextDidChange:]( (void *)a1,  [MEMORY[0x189603F68] dictionaryWithObjects:v170 forKeys:&v169 count:1]);
    }

    if (*(void *)(a1 + 40) && *(void *)(a1 + 80))
    {
      id v5 = -[NSFetchedResultsController _sectionCachePath](a1);
      uint64_t v6 = (void *)[MEMORY[0x1896078A8] defaultManager];
      uint64_t v157 = 0LL;
      int v7 = [v6 fileExistsAtPath:v5];
      BOOL v8 = (void *)[a2 userInfo];
      __int128 v9 = (void *)[v5 stringByAppendingPathComponent:@"sectionInfo"];
      int v10 = stat((const char *)[v9 fileSystemRepresentation], &v168);
      off_t st_size = v168.st_size;
      __int128 v12 = (const char *)[v9 fileSystemRepresentation];
      if (a2)
      {
        if ([a2 object] == *(void *)(a1 + 16))
        {
          if ((*(_WORD *)(a1 + 72) & 0x1080) == 0) {
            goto LABEL_10;
          }
        }

        else
        {
          uint64_t v13 = [v8 objectForKey:@"managedObjectContext"];
          if (v13 && v13 != *(void *)(a1 + 16))
          {
LABEL_10:
            if (v12)
            {
              int v14 = open(v12, 1026, 384LL);
              if ((v14 & 0x80000000) == 0) {
                close(v14);
              }
            }

            return;
          }
        }
      }

      int v15 = *(_DWORD *)(a1 + 72);
      if ((v15 & 1) != 0) {
        int v16 = 0;
      }
      else {
        int v16 = v7;
      }
      if (v16 != 1 || v10 || st_size < 1) {
        goto LABEL_30;
      }
      BOOL v17 = (const char *)objc_msgSend( (id)objc_msgSend( -[NSFetchedResultsController _sectionCachePath](a1),  "stringByAppendingPathComponent:",  @"sectionInfo"),  "fileSystemRepresentation");
      if (v17)
      {
        int v18 = open(v17, 2);
        if ((v18 & 0x80000000) == 0)
        {
          int v19 = v18;
          memset(&v168, 0, sizeof(v168));
          if (!fstat(v18, &v168) && v168.st_size >= 40)
          {
            if (pread(v19, &__buf, 8uLL, 40LL) == 8)
            {
              unint64_t __offseta = bswap64(__buf);
              id v114 = objc_alloc_init(MEMORY[0x1896077E8]);
              unsigned int v20 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:4096];
              -[NSFetchedResultsController _appendAffectedStoreInfoToData:adjustedOffset:](a1, v20, 0LL);
              ssize_t v21 = pwrite(v19, (const void *)[v20 bytes], objc_msgSend(v20, "length"), __offseta);
              if (v21 == [v20 length])
              {

                close(v19);
                id v22 = v114;
LABEL_116:
                [v22 drain];
                return;
              }

              __error();
              uint64_t v103 = objc_opt_class();
              _NSCoreDataLog( 1LL,  (uint64_t)@" (%@): error writing section cached info at %@ with error %d",  v104,  v105,  v106,  v107,  v108,  v109,  v103);
              ftruncate(v19, 0LL);

              close(v19);
              [v114 drain];
              goto LABEL_29;
            }

            uint64_t v23 = objc_opt_class();
            _NSCoreDataLog( 1LL,  (uint64_t)@" (%@): couldn't read cache file to update store info timestamps",  v24,  v25,  v26,  v27,  v28,  v29,  v23);
          }

          close(v19);
        }
      }

- (uint64_t)_recursivePerformBlockAndWait:(void *)a3 withContext:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = [a3 parentContext];
    if ([a3 concurrencyType])
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke;
      v7[3] = &unk_189EA95D8;
      v7[4] = v6;
      v7[5] = v5;
      v7[6] = a2;
      return [a3 performBlockAndWait:v7];
    }

    else
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)a3);
      if (v6) {
        -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, a2);
      }
      else {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
      }
      return -[NSManagedObjectContext unlockObjectStore]((uint64_t)a3);
    }
  }

  return result;
}

- (uint64_t)_conditionallyDispatchSnapshotToDelegate:(void *)a3 updatesInfo:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    if ((*(_BYTE *)(result + 73) & 1) != 0)
    {
      uint64_t v4 = NSClassFromString((NSString *)@"NSDiffableDataSourceSnapshot");
      if (!v4) {
        uint64_t v4 = NSClassFromString((NSString *)@"_PFDiffableDataSourceSnapshot");
      }
      id v5 = objc_alloc_init(v4);
      context = (void *)MEMORY[0x186E3E5D8]();
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      uint64_t v22 = v3;
      id obj = *(id *)(v3 + 104);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(obj);
            }
            int v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            __int128 v11 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v12 = [v10 name];
            if (v12) {
              uint64_t v13 = (const __CFString *)v12;
            }
            else {
              uint64_t v13 = @"d69e6c783a242772974cfc99189691b88e9d37c3";
            }
            uint64_t v33 = v13;
            objc_msgSend( v5,  "appendSectionsWithIdentifiers:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v33, 1));
            objc_msgSend( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  objc_msgSend((id)objc_msgSend(v10, "objects"), "valueForKey:", @"objectID"),  v13);
            objc_autoreleasePoolPop(v11);
          }

          uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        }

        while (v7);
      }

      if ([a3 count])
      {
        int v14 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        uint64_t v15 = [a3 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0LL; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(a3);
              }
              objc_msgSend( v14,  "addObject:",  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "object"), "objectID"));
            }

            uint64_t v16 = [a3 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v16);
        }

        [v5 reloadItemsWithIdentifiers:v14];
      }

      objc_autoreleasePoolPop(context);
      [a2 controller:v22 didChangeContentWithSnapshot:v5];

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke( void *a1)
{
  if (a1[4]) {
    return -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](a1[5], a1[6]);
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16LL))();
  }
}

- (id)_fetchedObjects
{
  return self->_fetchedObjects;
}

- (NSArray)fetchedObjects
{
  id fetchedObjects = self->_fetchedObjects;
  if ((*(_BYTE *)&self->_flags & 4) != 0) {
    return (NSArray *)(id)[fetchedObjects copy];
  }
  else {
    return (NSArray *)fetchedObjects;
  }
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
  if (!indexPath && BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    return 0LL;
  }
  unint64_t v5 = -[NSIndexPath indexAtPosition:](indexPath, "indexAtPosition:", 0LL);
  unint64_t v6 = -[NSIndexPath indexAtPosition:](indexPath, "indexAtPosition:", 1LL);
  sections = self->_sections;
  if (sections)
  {
    uint64_t v8 = -[NSMutableOrderedSet count](sections, "count");
    if (v5 >= -[NSMutableOrderedSet count](self->_sections, "count"))
    {
      if (v8)
      {
        _NSCoreDataLog( 1LL,  (uint64_t)@"NSFetchedResultsController: no section at index %lu in sections list",  v9,  v10,  v11,  v12,  v13,  v14,  v5);
        if (byte_18C4ABDBB)
        {
          uint64_t v15 = (void *)MEMORY[0x189603F70];
          uint64_t v16 = *MEMORY[0x189603A60];
          uint64_t v17 = (const __CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"no section at index %lu",  v5);
          int v18 = v15;
          uint64_t v19 = v16;
LABEL_22:
          objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v17 userInfo:0]);
          return -[NSFetchedResultsController indexPathForObject:](v33, v34, v35);
        }

        return 0LL;
      }

- (NSIndexPath)indexPathForObject:(id)object
{
  v9[2] = *MEMORY[0x1895F89C0];
  if (!object) {
    return 0LL;
  }
  uint64_t v4 = (*(_BYTE *)&self->_flags & 8) != 0
     ? -[NSMutableDictionary objectForKey:]( self->_sectionsByName,  "objectForKey:",  -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)self, object))
     : -[NSMutableOrderedSet lastObject](self->_sections, "lastObject");
  uint64_t v5 = v4;
  if (!v4) {
    return 0LL;
  }
  unint64_t v6 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v4 + 8), object, 0);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  unint64_t v7 = v6 - *(void *)(v5 + 32);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  v9[0] = -[_NSDefaultSectionInfo sectionNumber](v5);
  v9[1] = v7;
  return (NSIndexPath *)[MEMORY[0x1896078C8] indexPathWithIndexes:v9 length:2];
}

- (const)_sectionNameForObject:(const __CFString *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([(id)result->info resultType] == 1)
    {
      return (const __CFString *)(id)[a2 _retainedURIString];
    }

    else if ([(id)v3->info resultType] == 4)
    {
      return @"Count";
    }

    else
    {
      uint64_t v4 = (void *)[a2 valueForKeyPath:v3->length];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v5 = (void *)[v4 objectID];
        LODWORD(v3[2].info) |= 0x10u;
        uint64_t result = (const __CFString *)(id)[v5 _retainedURIString];
      }

      else
      {
        uint64_t result = (const __CFString *)[v4 description];
      }

      if (!result) {
        return &stru_189EAC2E8;
      }
    }
  }

  return result;
}

- (NSString)sectionIndexTitleForSectionName:(NSString *)sectionName
{
  if (sectionName && -[NSString length](sectionName, "length")) {
    return (NSString *)objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%c",  -[NSString characterAtIndex:](sectionName, "characterAtIndex:", 0)),  "uppercaseString");
  }
  else {
    return 0LL;
  }
}

- (uint64_t)_fetchedObjectsArrayOfObjectIDs
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1 || [*(id *)(a1 + 8) resultType] == 2 || objc_msgSend(*(id *)(a1 + 8), "resultType") == 4) {
    return 0LL;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v2 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v4 = *(void **)(a1 + 96);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "objectID"));
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    return (uint64_t)v2;
  }

  return [*(id *)(a1 + 96) arrayFromObjectIDs];
}

- (NSArray)sectionIndexTitles
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t result = (NSArray *)self->_sectionIndexTitles;
  if (!result)
  {
    self->_sectionIndexTitles = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableOrderedSet count](self->_sections, "count"));
    self->_sectionIndexTitlesSections = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableOrderedSet count](self->_sections, "count"));
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      sections = self->_sections;
      uint64_t v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( sections,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = 0LL;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(sections);
            }
            __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            uint64_t v11 = [v10 indexTitle];
            if (v11)
            {
              __int128 v12 = (void *)v11;
              if (([v7 isEqualToString:v11] & 1) == 0)
              {
                [self->_sectionIndexTitles addObject:v12];
                [self->_sectionIndexTitlesSections addObject:v10];
                uint64_t v7 = v12;
              }
            }
          }

          uint64_t v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( sections,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
        }

        while (v6);
      }
    }

    return (NSArray *)self->_sectionIndexTitles;
  }

  return result;
}

- (NSArray)sections
{
  uint64_t v2 = (void *)-[NSMutableOrderedSet copy](self->_sections, "copy");
  uint64_t v3 = (NSArray *)[v2 array];

  return v3;
}

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)sectionIndex
{
  uint64_t v7 = -[NSFetchedResultsController sectionIndexTitles](self, "sectionIndexTitles");
  if ((int64_t)-[NSArray count](v7, "count") <= sectionIndex)
  {
    __int128 v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A58];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"invalid Section Index offset%li", sectionIndex);
    __int128 v12 = v9;
    uint64_t v13 = v10;
  }

  else
  {
    if (objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", sectionIndex), "isEqualToString:", title)) {
      return -[_NSDefaultSectionInfo sectionNumber]([self->_sectionIndexTitlesSections objectAtIndex:sectionIndex]);
    }
    __int128 v14 = (void *)MEMORY[0x189603F70];
    uint64_t v15 = *MEMORY[0x189603A58];
    uint64_t v11 = [NSString stringWithFormat:@"Index title at %li is not equal to '%@'", sectionIndex, title];
    __int128 v12 = v14;
    uint64_t v13 = v15;
  }

  objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v11 userInfo:0]);
  +[NSFetchedResultsController deleteCacheWithName:](v16, v17, v18);
  return result;
}

+ (void)deleteCacheWithName:(NSString *)name
{
  uint64_t v4 = (void *)[MEMORY[0x1896078A8] defaultManager];
  uint64_t v5 = (void *)+[NSFetchedResultsController _CoreDataSectionCachesPath]();
  uint64_t v6 = (uint64_t)v5;
  if (name) {
    uint64_t v6 = [v5 stringByAppendingPathComponent:name];
  }
  [v4 removeItemAtPath:v6 error:0];
}

+ (uint64_t)_CoreDataSectionCachesPath
{
  uint64_t result = _CoreDataSectionCachesPath__cachesPath;
  if (!_CoreDataSectionCachesPath__cachesPath)
  {
    uint64_t v1 = (void *)objc_opt_class();
    objc_sync_enter(v1);
    uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    if (-[NSArray count](v2, "count")) {
      uint64_t v3 = -[NSArray objectAtIndex:](v2, "objectAtIndex:", 0LL);
    }
    else {
      uint64_t v3 = NSTemporaryDirectory();
    }
    uint64_t v4 = v3;
    uint64_t v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "bundleIdentifier");
    if ([v5 length]) {
      uint64_t v4 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5);
    }
    uint64_t v6 = -[NSString stringByAppendingPathComponent:]( -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", @".CoreDataCaches"),  "stringByAppendingPathComponent:",  @"SectionInfoCaches");
    if (!_CoreDataSectionCachesPath__cachesPath) {
      _CoreDataSectionCachesPath__cachesPath = v6;
    }
    objc_sync_exit(v1);
    return _CoreDataSectionCachesPath__cachesPath;
  }

  return result;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (id)_sectionCachePath
{
  if (!*(void *)(a1 + 40)) {
    return 0LL;
  }
  id result = *(id *)(a1 + 64);
  if (!result)
  {
    id result = (id)[(id)+[NSFetchedResultsController _CoreDataSectionCachesPath]() stringByAppendingPathComponent:*(void *)(a1 + 40)];
    *(void *)(a1 + 64) = result;
  }

  return result;
}

void __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = 0LL;
    do
    {
      uint64_t v3 = (void *)[*(id *)(a1 + 32) objectAtIndex:v2];
      if (([v3 isFault] & 1) == 0
        && (objc_msgSend((id)objc_msgSend(v3, "objectID"), "isTemporaryID") & 1) == 0)
      {
        int v4 = [v3 _versionReference];
        uint64_t v5 = [v3 objectID];
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16LL);
        if (v6) {
          uint64_t v7 = *(void **)(v6 + 32);
        }
        else {
          uint64_t v7 = 0LL;
        }
        uint64_t v8 = (void *)objc_msgSend(v7, "newValuesForObjectWithID:withContext:error:", v5);
        if (!v8 || (v9 = v8, int v10 = [v8 _versionNumber], v9, v4 != v10))
        {
          if (([v3 hasChanges] & 1) == 0) {
            [*(id *)(*(void *)(a1 + 40) + 16) refreshObject:v3 mergeChanges:0];
          }
        }
      }

      ++v2;
    }

    while (v2 < *(void *)(a1 + 48));
  }

- (uint64_t)_resolveSectionIndexTitleForSectionName:(uint64_t)a1
{
  if ((*(_BYTE *)(a1 + 73) & 8) == 0) {
    return [(id)a1 sectionIndexTitleForSectionName:a2];
  }
  uint64_t v5 = *(void *)(a1 + 80);
  if (v5) {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }
  uint64_t v7 = [WeakRetained controller:a1 sectionIndexTitleForSectionName:a2];

  return v7;
}

- (void)_makeMutableFetchedObjects
{
  if ((*(_BYTE *)(a1 + 72) & 4) == 0)
  {
    unint64_t v2 = *(void **)(a1 + 96);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(void *)(a1 + 96) = -[_PFMutableProxyArray initWithPFArray:]( objc_alloc(&OBJC_CLASS____PFMutableProxyArray),  "initWithPFArray:",  *(void *)(a1 + 96));
      unsigned int v3 = *(_DWORD *)(a1 + 72) | 2;
    }

    else
    {
      *(void *)(a1 + 96) = (id)[MEMORY[0x189603FA8] arrayWithArray:v2];
      unsigned int v3 = *(_DWORD *)(a1 + 72) & 0xFFFFFFFD;
    }

    *(_DWORD *)(a1 + 72) = v3;

    *(_DWORD *)(a1 + 72) |= 4u;
  }

- (uint64_t)_indexPathForIndex:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a1);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = *(void *)(v8 + 32);
        }
        else {
          uint64_t v9 = 0LL;
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) numberOfObjects] + v9 > a2)
        {
          v15[0] = -[_NSDefaultSectionInfo sectionNumber](v8);
          if (v8) {
            uint64_t v10 = *(void *)(v8 + 32);
          }
          else {
            uint64_t v10 = 0LL;
          }
          v15[1] = a2 - v10;
          return [MEMORY[0x1896078C8] indexPathWithIndexes:v15 length:2];
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t result = [a1 countByEnumeratingWithState:&v11 objects:v16 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (uint64_t)_objectInResults:(uint64_t)a1
{
  unsigned int v3 = *(void **)(a1 + 48);
  if ((*(_BYTE *)(a1 + 72) & 8) == 0
    || (uint64_t result = (uint64_t)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, a2)) != 0)
  {
    if ([a2 isDeleted])
    {
      return 0LL;
    }

    else if (v3)
    {
      return [v3 evaluateWithObject:a2];
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (void)_updateSectionOffsetsStartingAtSection:(uint64_t)a1
{
  unint64_t v4 = [*(id *)(a1 + 104) count];
  unint64_t v5 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)a2) + 1;
  if (v5 < v4)
  {
    do
    {
      uint64_t v6 = [*(id *)(a1 + 104) objectAtIndex:v5];
      if (a2) {
        uint64_t v7 = a2[4];
      }
      else {
        uint64_t v7 = 0LL;
      }
      uint64_t v8 = [a2 numberOfObjects];
      if (v6)
      {
        *(void *)(v6 + 32) = v8 + v7;

        *(void *)(v6 + 56) = 0LL;
      }

      ++v5;
      a2 = (void *)v6;
    }

    while (v4 != v5);
  }

- (BOOL)_updateFetchedObjectsWithInsertChange:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  unsigned int v3 = (__CFString *)[a2 object];
  if ((*(_BYTE *)(a1 + 72) & 8) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 104) lastObject];
LABEL_5:
    uint64_t v6 = (void *)v4;
    goto LABEL_6;
  }

  unint64_t v5 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, v3);
  if (v5)
  {
    uint64_t v4 = [*(id *)(a1 + 112) objectForKey:v5];
    goto LABEL_5;
  }

  uint64_t v6 = 0LL;
LABEL_6:
  unint64_t v7 = [v6 numberOfObjects];
  unint64_t v8 = [*(id *)(a1 + 96) count];
  if (v7 > v8) {
    return v7 <= v8;
  }
  if (!v6)
  {
    if ((*(_BYTE *)(a1 + 72) & 8) != 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v12 = *(void **)(a1 + 104);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:&v42 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v39;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v16);
            if (v17) {
              uint64_t v18 = *(void *)(v17 + 32);
            }
            else {
              uint64_t v18 = 0LL;
            }
            objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v18));
            ++v16;
          }

          while (v14 != v16);
          uint64_t v19 = [v12 countByEnumeratingWithState:&v38 objects:&v42 count:16];
          uint64_t v14 = v19;
        }

        while (v19);
      }

      uint64_t v20 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]( (uint64_t)NSFetchedResultsController,  (uint64_t)v3,  v11,  0,  [v11 count] - 1,  (void *)objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));

      uint64_t v21 = (__CFString *)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, v3);
      uint64_t v22 = v3;
      if ([*(id *)(a1 + 8) resultType] != 1)
      {
        if ([*(id *)(a1 + 8) resultType] == 4) {
          uint64_t v22 = @"Count";
        }
        else {
          uint64_t v22 = (__CFString *)-[__CFString valueForKeyPath:](v3, "valueForKeyPath:", *(void *)(a1 + 24));
        }
      }

      uint64_t v23 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](a1, (uint64_t)v21);
      if (v20)
      {
        uint64_t v24 = (void *)[*(id *)(a1 + 104) objectAtIndex:v20 - 1];
        if (v24) {
          uint64_t v25 = v24[4];
        }
        else {
          uint64_t v25 = 0LL;
        }
        uint64_t v26 = [v24 numberOfObjects] + v25;
      }

      else
      {
        uint64_t v26 = 0LL;
      }

      uint64_t v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo),  a1,  v21,  v22,  v23,  v26);
      [*(id *)(a1 + 104) insertObject:v6 atIndex:v20];
      objc_msgSend(*(id *)(a1 + 112), "setObject:forKey:", v6, objc_msgSend(v6, "name"));

      *(void *)(a1 + 120) = 0LL;
      *(void *)(a1 + 128) = 0LL;
    }

    else
    {
      uint64_t v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo),  a1,  0LL,  0LL,  0LL,  0LL);
      [*(id *)(a1 + 104) addObject:v6];

      if (!*(void *)(a1 + 104))
      {
        uint64_t v6 = 0LL;
LABEL_11:
        uint64_t v9 = 0LL;
        char v10 = 1;
        goto LABEL_36;
      }
    }

    if (!v6) {
      goto LABEL_11;
    }
  }

  char v10 = 0;
  uint64_t v9 = v6[4];
LABEL_36:
  unint64_t v27 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]( (uint64_t)NSFetchedResultsController,  (uint64_t)v3,  *(void **)(a1 + 96),  v9,  v9 + [v6 numberOfObjects] - 1,  (void *)objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));
  if (v27 < [*(id *)(a1 + 96) count] && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    uint64_t v28 = [*(id *)(a1 + 96) count];
    __int128 v29 = objc_alloc(&OBJC_CLASS____PFIndexCacheOffset);
    if (v29)
    {
      v42.receiver = v29;
      v42.super_class = (Class)&OBJC_CLASS____PFIndexCacheOffset;
      __int128 v30 = objc_msgSendSuper2(&v42, sel_init);
      __int128 v31 = v30;
      if (v30)
      {
        v30[1] = v27;
        v30[2] = v28;
        v30[3] = 1LL;
      }
    }

    else
    {
      __int128 v31 = 0LL;
    }

    [*(id *)(a1 + 144) addObject:v31];
  }

  if ((*(_BYTE *)(a1 + 72) & 4) == 0) {
    -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
  }
  if ([*(id *)(a1 + 96) count] > v27 && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    uint64_t v32 = [*(id *)(a1 + 96) count];
    uint64_t v33 = objc_alloc(&OBJC_CLASS____PFIndexCacheOffset);
    if (v33)
    {
      v42.receiver = v33;
      v42.super_class = (Class)&OBJC_CLASS____PFIndexCacheOffset;
      SEL v34 = objc_msgSendSuper2(&v42, sel_init);
      id v35 = v34;
      if (v34)
      {
        v34[1] = v27;
        v34[2] = v32;
        v34[3] = 1LL;
      }
    }

    else
    {
      id v35 = 0LL;
    }

    [*(id *)(a1 + 144) addObject:v35];
  }

  [*(id *)(a1 + 96) insertObject:v3 atIndex:v27];
  objc_msgSend( *(id *)(a1 + 136),  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v27),  -[__CFString objectID](v3, "objectID"));
  uint64_t v36 = [v6 numberOfObjects];
  if ((v10 & 1) == 0)
  {
    v6[5] = v36 + 1;

    v6[7] = 0LL;
  }

  -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, v6);
  return v7 <= v8;
}

+ (uint64_t)_insertIndexForObject:(void *)a3 inArray:(uint64_t)a4 lowIdx:(uint64_t)a5 highIdx:(void *)a6 sortDescriptors:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a5 < a4 || a5 + 1 == a4) {
    return a4;
  }
  while (2)
  {
    uint64_t v11 = a5 + a4;
    if (a5 + a4 < 0 != __OFADD__(a5, a4)) {
      ++v11;
    }
    uint64_t v12 = v11 >> 1;
    uint64_t v13 = [a3 objectAtIndex:v11 >> 1];
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v14 = [a6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
LABEL_7:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(a6);
        }
        uint64_t v18 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) compareObject:v13 toObject:a2];
        if (v18) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [a6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15) {
            goto LABEL_7;
          }
          return v12;
        }
      }

      if (v18 == 1)
      {
        if (a4 == v12) {
          return a4;
        }
        a5 = v12 - 1;
      }

      else
      {
        if (a5 == v12) {
          return a5 + 1;
        }
        a4 = v12 + 1;
      }

      if (a4 <= a5) {
        continue;
      }
    }

    return v12;
  }

- (uint64_t)_preprocessDeletedObjects:(void *)a3 deletesInfo:(void *)a4 sectionsWithDeletes:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (result)
  {
    unint64_t v6 = result;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(a2);
          }
          char v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
          if (_objectIDEntityAffectsResults(v6, v10))
          {
            unint64_t v11 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v6, v10, 1);
            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v12 = v11;
              uint64_t v13 = [*(id *)(v6 + 16) objectWithID:v10];
              uint64_t v14 = objc_alloc(&OBJC_CLASS____PFChangeInfo);
              if (v14)
              {
                uint64_t v15 = -[_PFChangeInfo initWithObject:](v14, "initWithObject:", v13);
                uint64_t v16 = (void *)v15;
                if (v15) {
                  *(void *)(v15 + 16) = 2LL;
                }
              }

              else
              {
                uint64_t v16 = 0LL;
              }

              uint64_t v17 = (void *)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v6 + 104), v12);
              if (v17)
              {
                uint64_t v19 = v17;
                if (v16) {
                  objc_setProperty_nonatomic(v16, v18, v17, 24LL);
                }
                __int128 v21 = (void *)objc_msgSend( *(id *)(v6 + 104),  "objectAtIndex:",  objc_msgSend(v19, "indexAtPosition:", 0));
                if (v16) {
                  objc_setProperty_nonatomic(v16, v20, v21, 40LL);
                }
                if ((*(_BYTE *)(v6 + 72) & 8) != 0)
                {
                  uint64_t v22 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v21);
                  if (v21) {
                    v21[6] = v22;
                  }
                  objc_msgSend(a4, "setObject:forKey:", v21, objc_msgSend(v21, "name"));
                }
              }

              [a3 addObject:v16];
            }
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v7 = result;
      }

      while (result);
    }
  }

  return result;
}

- (uint64_t)_updateFetchedObjectsWithDeleteChange:(unint64_t)a1
{
  uint64_t v2 = (uint64_t)a2;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 object];
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 40);
    if (v2)
    {
      unint64_t v5 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v2 + 8), v4, 0);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = *(void *)(v2 + 32);
        unint64_t v7 = v5 - v6;
        if (v5 - v6 != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v18) = 0;
LABEL_23:
          uint64_t v19 = v6 + v7;
          if ((*(_BYTE *)(a1 + 72) & 4) == 0) {
            -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
          }
          uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v19), "objectID");
          [*(id *)(a1 + 96) removeObjectAtIndex:v19];
          [*(id *)(a1 + 136) removeObjectForKey:v20];
          if ([*(id *)(a1 + 96) count])
          {
            uint64_t v21 = [*(id *)(a1 + 96) count];
            uint64_t v22 = objc_alloc(&OBJC_CLASS____PFIndexCacheOffset);
            if (v22)
            {
              v33.receiver = v22;
              v33.super_class = (Class)&OBJC_CLASS____PFIndexCacheOffset;
              __int128 v23 = objc_msgSendSuper2(&v33, sel_init);
              __int128 v24 = v23;
              if (v23)
              {
                v23[1] = v19;
                v23[2] = v21;
                v23[3] = -1LL;
              }
            }

            else
            {
              __int128 v24 = 0LL;
            }

            [*(id *)(a1 + 144) addObject:v24];
          }

          else
          {
            [*(id *)(a1 + 144) removeAllObjects];
          }

          uint64_t v25 = [(id)v2 numberOfObjects];
          if ((v18 & 1) == 0)
          {
            *(void *)(v2 + 40) = v25 - 1;

            *(void *)(v2 + 56) = 0LL;
          }

          -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, (void *)v2);
          goto LABEL_34;
        }
      }
    }
  }

  unint64_t v8 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](a1, (void *)[v4 objectID], 1);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_34:
    if (v2 && ![(id)v2 numberOfObjects] && (*(_BYTE *)(a1 + 72) & 8) != 0)
    {
      [*(id *)(a1 + 104) removeObjectAtIndex:-[_NSDefaultSectionInfo sectionNumber](v2)];
      objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", objc_msgSend((id)v2, "name"));
      *(void *)(v2 + 8) = 0LL;

      *(void *)(v2 + 56) = 0LL;
      *(void *)(a1 + 120) = 0LL;

      *(void *)(a1 + 128) = 0LL;
    }

    return 1LL;
  }

  unint64_t v7 = v8;
  uint64_t v9 = *(void **)(a1 + 104);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:&v33 count:16];
  if (!v10)
  {
LABEL_20:
    if (v2)
    {
      LOBYTE(v18) = 0;
      uint64_t v6 = *(void *)(v2 + 32);
    }

    else
    {
LABEL_46:
      uint64_t v6 = 0LL;
      LOBYTE(v18) = 1;
    }

    goto LABEL_23;
  }

  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v30;
LABEL_8:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v30 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
    uint64_t v15 = v14 ? *(void *)(v14 + 32) : 0LL;
    if ([*(id *)(*((void *)&v29 + 1) + 8 * v13) numberOfObjects] + v15 > v7) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v16 = [v9 countByEnumeratingWithState:&v29 objects:&v33 count:16];
      uint64_t v11 = v16;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }

  uint64_t v17 = -[_NSDefaultSectionInfo sectionNumber](v14);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_20;
  }
  uint64_t v27 = [*(id *)(a1 + 104) objectAtIndex:v17];
  uint64_t v2 = v27;
  if (!v27)
  {
    unint64_t v7 = 0LL;
    goto LABEL_46;
  }

  unint64_t v28 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v27 + 8), v4, 0);
  uint64_t v18 = 0LL;
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = 0LL;
    uint64_t v6 = *(void *)(v2 + 32);
    unint64_t v7 = v28 - v6;
    if (v28 - v6 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
  }

  return v18;
}

- (uint64_t)_preprocessUpdatedObjects:(void *)a3 insertsInfo:(void *)a4 deletesInfo:(void *)a5 updatesInfo:(void *)a6 sectionsWithDeletes:(void *)a7 newSectionNames:(void *)a8 treatAsRefreshes:
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v11 = a2;
    unint64_t v12 = result;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v59 objects:v64 count:16];
    uint64_t v52 = result;
    if (result)
    {
      uint64_t v13 = *(void *)v60;
      uint64_t v45 = a4;
      uint64_t v46 = a6;
      uint64_t v43 = v11;
      uint64_t v44 = a3;
      uint64_t v49 = *(void *)v60;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v60 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
          context = (void *)MEMORY[0x186E3E5D8]();
          if (_objectIDEntityAffectsResults(v12, v15))
          {
            unint64_t v16 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v12, v15, 1);
            id newValue = v16 == 0x7FFFFFFFFFFFFFFFLL
                     ? 0LL
                     : (id)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v12 + 104), v16);
            unint64_t v51 = (void *)[*(id *)(v12 + 16) objectWithID:v15];
            char v17 = -[NSFetchedResultsController _objectInResults:](v12, v51);
            if ((v17 & 1) != 0 || newValue)
            {
              uint64_t v18 = -[_PFChangeInfo initWithObject:](objc_alloc(&OBJC_CLASS____PFChangeInfo), "initWithObject:", v51);
              if ((v17 & 1) != 0)
              {
                self = v18;
                if (!newValue)
                {
                  uint64_t v20 = v18;
                  if (v18) {
                    v18->_changeType = 1LL;
                  }
                  uint64_t v25 = a3;
                  if ((*(_BYTE *)(v12 + 72) & 8) != 0)
                  {
                    uint64_t v27 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v12, v51);
                    uint64_t v25 = a3;
                    if (v27)
                    {
                      uint64_t v28 = [*(id *)(v12 + 112) objectForKey:v27];
                      uint64_t v25 = a3;
                      if (!v28)
                      {
                        [a7 addObject:v27];
                        uint64_t v25 = a3;
                      }
                    }
                  }

                  goto LABEL_55;
                }

                uint64_t v20 = v18;
                if (([a3 containsObject:v18] & 1) == 0
                  && ([a4 containsObject:self] & 1) == 0)
                {
                  if ([a8 containsObject:v15])
                  {
                    int v21 = 1;
                    int v22 = 1;
                  }

                  else
                  {
                    __int128 v29 = (void *)[v51 changedValuesForCurrentEvent];
                    __int128 v55 = 0u;
                    __int128 v56 = 0u;
                    __int128 v57 = 0u;
                    __int128 v58 = 0u;
                    uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v63 count:16];
                    if (v30)
                    {
                      uint64_t v31 = v30;
                      int v21 = 0;
                      int v22 = 0;
                      uint64_t v32 = *(void *)v56;
                      do
                      {
                        for (uint64_t i = 0LL; i != v31; ++i)
                        {
                          if (*(void *)v56 != v32) {
                            objc_enumerationMutation(v29);
                          }
                          uint64_t v34 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                          int v35 = [*(id *)(v12 + 88) containsObject:v34];
                          v21 |= v35;
                          v22 |= [*(id *)(v12 + 32) isEqualToString:v34] | v35;
                        }

                        uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v63 count:16];
                      }

                      while (v31);
                    }

                    else
                    {
                      int v21 = 0;
                      int v22 = 0;
                    }
                  }

                  id v37 = (void *)objc_msgSend( *(id *)(v12 + 104),  "objectAtIndex:",  objc_msgSend(newValue, "indexAtPosition:", 0));
                  uint64_t v20 = self;
                  if (!self)
                  {
                    uint64_t v25 = a5;
                    a4 = v45;
                    a6 = v46;
                    a3 = v44;
                    goto LABEL_45;
                  }

                  objc_setProperty_nonatomic(self, v36, newValue, 24LL);
                  objc_setProperty_nonatomic(self, v38, v37, 40LL);
                  a4 = v45;
                  a6 = v46;
                  a3 = v44;
                  if (((v22 | v21) & 1) != 0)
                  {
                    self->_changeType = 3LL;
                    uint64_t v25 = a5;
LABEL_45:
                    uint64_t v11 = v43;
                    if ((v22 & 1) != 0)
                    {
                      uint64_t v25 = a5;
                      if ((*(_BYTE *)(v12 + 72) & 8) != 0)
                      {
                        __int128 v39 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v12, v51);
                        if (!v39) {
                          goto LABEL_50;
                        }
                        __int128 v40 = v39;
                        uint64_t v41 = [*(id *)(v12 + 112) objectForKey:v39];
                        if (!v41)
                        {
                          [a7 addObject:v40];
LABEL_50:
                          uint64_t v41 = 0LL;
                        }

                        uint64_t v25 = a5;
                        if (v37)
                        {
                          uint64_t v25 = a5;
                          if (v37 != (void *)v41)
                          {
                            v37[6] = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v37);
                            objc_msgSend(a6, "setObject:forKey:", v37, objc_msgSend(v37, "name"));
                            uint64_t v25 = a5;
                          }
                        }
                      }
                    }
                  }

                  else
                  {
                    self->_changeType = 4LL;
                    uint64_t v25 = a5;
                    uint64_t v11 = v43;
                  }

- (void)_lowerMoveOperationsToUpdatesForSection:(void *)a3 withInsertedObjects:(void *)a4 deletedObjects:(void *)a5 updatedObjects:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    context = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v9 = (void *)[MEMORY[0x189603FA8] array];
    uint64_t v10 = (uint64_t)v9;
    if (a2) {
      uint64_t v10 = [MEMORY[0x189603FA8] array];
    }
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v11 = [a5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(a5);
          }
          uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
          if (v15)
          {
            if (v15[2] == 4LL) {
              goto LABEL_19;
            }
            unint64_t v16 = v9;
            if (!a2)
            {
LABEL_18:
              [v16 addObject:v15];
              goto LABEL_19;
            }

            uint64_t v17 = v15[6];
          }

          else
          {
            unint64_t v16 = v9;
            if (!a2) {
              goto LABEL_18;
            }
            uint64_t v17 = 0LL;
          }

          if (v17 == a2) {
            [v9 addObject:*(void *)(*((void *)&v40 + 1) + 8 * v14)];
          }
          if (v15) {
            uint64_t v18 = v15[5];
          }
          else {
            uint64_t v18 = 0LL;
          }
          unint64_t v16 = (void *)v10;
          if (v18 == a2) {
            goto LABEL_18;
          }
LABEL_19:
          ++v14;
        }

        while (v12 != v14);
        uint64_t v19 = [a5 countByEnumeratingWithState:&v40 objects:v44 count:16];
        uint64_t v12 = v19;
      }

      while (v19);
    }

    id v20 = (id)objc_msgSend((id)objc_msgSend(a3, "allObjects"), "mutableCopy");
    [v20 addObjectsFromArray:v9];
    [v20 sortUsingComparator:&__block_literal_global_12];
    id v21 = (id)objc_msgSend((id)objc_msgSend(a4, "allObjects"), "mutableCopy");
    [v21 addObjectsFromArray:v10];
    [v21 sortUsingComparator:&__block_literal_global_192];
    if ([v20 count])
    {
      unint64_t v22 = 0LL;
      unsigned int v23 = 0;
      unsigned int v24 = 0;
      do
      {
        uint64_t v25 = (void *)[v20 objectAtIndex:v22];
        uint64_t v26 = [v21 objectAtIndex:v24];
        uint64_t v27 = (void *)v26;
        if (!v25 || v25[2] != 1LL)
        {
          if (v26 && *(void *)(v26 + 16) == 2LL) {
            goto LABEL_55;
          }
          uint64_t v28 = v25 ? (void *)v25[4] : 0LL;
          uint64_t v29 = [v28 indexAtPosition:1];
          uint64_t v30 = v27 ? (void *)v27[3] : 0LL;
          unint64_t v31 = v29 - v22;
          unint64_t v32 = [v30 indexAtPosition:1] - v24;
          if (v31 >= v32)
          {
            if (v32 < v31) {
              goto LABEL_55;
            }
            if (v25 == v27)
            {
              if (v25) {
                v25[2] = 4LL;
              }
              ++v23;
LABEL_55:
              ++v24;
              goto LABEL_56;
            }

            unint64_t v38 = [v21 indexOfObject:v25];
            unint64_t v33 = [v20 indexOfObject:v27];
            if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 >= v24)
            {
              if (v33 == 0x7FFFFFFFFFFFFFFFLL || v33 < v22) {
                goto LABEL_55;
              }
              unint64_t v34 = v33;
              int v35 = v25 ? (void *)v25[3] : 0LL;
              if (v31 == [v35 indexAtPosition:1] - v38)
              {
                uint64_t v36 = v27 ? (void *)v27[4] : 0LL;
                if (v32 != [v36 indexAtPosition:1] - v34) {
                  goto LABEL_55;
                }
                unint64_t v37 = [v21 indexOfObject:v25];
                if ([v20 indexOfObject:v27] > v37) {
                  goto LABEL_55;
                }
              }
            }
          }
        }

        ++v23;
LABEL_56:
        unint64_t v22 = v23;
      }

      while ([v20 count] > (unint64_t)v23);
    }

    objc_autoreleasePoolPop(context);
  }

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (!a2)
  {
    unsigned int v3 = 0LL;
    if (!a3) {
      return [v3 compare:a3];
    }
    goto LABEL_3;
  }

  unsigned int v3 = *(void **)(a2 + 32);
  if (a3) {
LABEL_3:
  }
    a3 = *(void *)(a3 + 32);
  return [v3 compare:a3];
}

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (!a2)
  {
    unsigned int v3 = 0LL;
    if (!a3) {
      return [v3 compare:a3];
    }
    goto LABEL_3;
  }

  unsigned int v3 = *(void **)(a2 + 24);
  if (a3) {
LABEL_3:
  }
    a3 = *(void *)(a3 + 24);
  return [v3 compare:a3];
}

- (void)_core_managedObjectContextDidChange:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (objc_msgSend( (id)result[2],  "concurrencyType",  MEMORY[0x1895F87A8],  3221225472,  __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke,  &unk_189EA7648,  result,  a2))
    {
      return (void *)[(id)v2[2] performBlockAndWait:&v3];
    }

    else
    {
      return __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke(&v3);
    }
  }

  return result;
}

void *__82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke( void *result)
{
  v277[17] = *MEMORY[0x1895F89C0];
  v193 = result;
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 96) || !*(void *)(v1 + 104)) {
    return result;
  }
  uint64_t v2 = v193;
  if (![(id)v193[5] objectForKey:@"invalidatedAll"])
  {
    id v7 = (id)v193[4];
    id v185 = objc_alloc_init(MEMORY[0x1896077E8]);
    v189 = (void *)[(id)v193[4] delegate];
    if (!v189)
    {
      unint64_t v8 = (void *)v193[4];
      if (v8[10]) {
        [v8 setDelegate:0];
      }
    }

    id v9 = v189;
    id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v188 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v191 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v186 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v187 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v11 = [*(id *)(v193[4] + 8) predicate];
    uint64_t v12 = *(void **)(v193[4] + 56LL);
    if ((void *)v11 != v12)
    {
      uint64_t v13 = (void *)v11;

      *(void *)(v193[4] + 56LL) = v13;
      if (v13) {
        id v14 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:withContext:",  v13,  *(void *)(v2[4] + 16LL));
      }
      else {
        id v14 = 0LL;
      }
      *(void *)(v2[4] + 48LL) = v14;
    }

    v192 = v10;
    unint64_t v31 = (void *)v2[5];
    v184 = @"inserted_objectIDs";
    unint64_t v32 = (void *)objc_msgSend(v31, "objectForKey:");
    unint64_t v33 = (void *)v2[5];
    v183 = @"updated_objectIDs";
    v190 = (void *)objc_msgSend((id)objc_msgSend(v33, "objectForKey:"), "mutableCopy");
    unint64_t v34 = v2[4];
    if (v34)
    {
      __int128 v276 = 0u;
      __int128 v275 = 0u;
      __int128 v274 = 0u;
      __int128 v273 = 0u;
      uint64_t v35 = [v32 countByEnumeratingWithState:&v273 objects:v277 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v274;
        do
        {
          uint64_t v37 = 0LL;
          do
          {
            if (*(void *)v274 != v36) {
              objc_enumerationMutation(v32);
            }
            unint64_t v38 = *(void **)(*((void *)&v273 + 1) + 8 * v37);
            __int128 v39 = (void *)MEMORY[0x186E3E5D8]();
            if (_objectIDEntityAffectsResults(v34, v38))
            {
              if (-[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v34, v38, 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                __int128 v40 = (void *)[*(id *)(v34 + 16) objectWithID:v38];
                if (-[NSFetchedResultsController _objectInResults:](v34, v40))
                {
                  __int128 v41 = objc_alloc(&OBJC_CLASS____PFChangeInfo);
                  if (v41)
                  {
                    uint64_t v42 = -[_PFChangeInfo initWithObject:](v41, "initWithObject:", v40);
                    __int128 v43 = (void *)v42;
                    if (v42) {
                      *(void *)(v42 + 16) = 1LL;
                    }
                  }

                  else
                  {
                    __int128 v43 = 0LL;
                  }

                  if ((*(_BYTE *)(v34 + 72) & 8) != 0)
                  {
                    uint64_t v44 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v34, v40);
                    if (v44)
                    {
                      if (![*(id *)(v34 + 112) objectForKey:v44]) {
                        [v187 addObject:v44];
                      }
                    }
                  }

                  [v192 addObject:v43];
                }
              }

              else
              {
                [v190 addObject:v38];
              }
            }

            objc_autoreleasePoolPop(v39);
            ++v37;
          }

          while (v35 != v37);
          uint64_t v45 = [v32 countByEnumeratingWithState:&v273 objects:v277 count:16];
          uint64_t v35 = v45;
        }

        while (v45);
      }
    }

    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:]( v193[4],  (void *)[(id)v193[5] objectForKey:@"deleted_objectIDs"],  v188,  v186);
    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:]( v193[4],  (void *)[(id)v193[5] objectForKey:@"invalidated_objectIDs"],  v188,  v186);
    uint64_t v46 = (void *)[(id)v193[5] objectForKey:@"refreshed_objectIDs"];
    uint64_t v47 = v192;
    -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:]( v193[4],  v190,  v192,  v188,  v191,  v186,  v187,  v46);
    if (v46)
    {
      uint64_t v48 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:v46];
      uint64_t v49 = [(id)v193[5] objectForKey:@"deleted_objectIDs"];
      if (v49) {
        [v48 minusSet:v49];
      }
      uint64_t v50 = [(id)v193[5] objectForKey:v183];
      if (v50) {
        [v48 minusSet:v50];
      }
      uint64_t v51 = [(id)v193[5] objectForKey:v184];
      if (v51) {
        [v48 minusSet:v51];
      }
      -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:]( v193[4],  v48,  v192,  v188,  v191,  v186,  v187,  v46);
    }

    if (![v192 count] && !objc_msgSend(v188, "count") && !objc_msgSend(v191, "count"))
    {
LABEL_148:

      [v185 drain];
      return (id)v193[4];
    }

    __int128 v57 = v193;
    uint64_t v58 = v193[4];
    int v59 = *(_DWORD *)(v58 + 72);
    if ((v59 & 0x1000) != 0)
    {
      objc_msgSend(v189, "controllerWillChangeContent:");
      uint64_t v58 = v193[4];
      int v59 = *(_DWORD *)(v58 + 72);
    }

    *(_DWORD *)(v58 + 72) = v59 | 1;
    unint64_t v60 = v57[4];
    if (!*(void *)(v60 + 96) || !*(void *)(v60 + 104))
    {
LABEL_109:
      _NSCoreDataLog( 4LL,  (uint64_t)@"(NSFetchedResultsController) rebuilding section caches",  v58,  v52,  v53,  v54,  v55,  v56,  v182);
      v277[0] = 0LL;
      +[NSFetchedResultsController deleteCacheWithName:]( NSFetchedResultsController,  "deleteCacheWithName:",  [(id)v193[4] cacheName]);
      uint64_t updated = [(id)v193[4] performFetch:v277];
      if ((updated & 1) == 0)
      {
        _NSCoreDataLog( 1LL,  (uint64_t)@"(NSFetchedResultsController) error refetching objects after context update: %@",  v78,  v79,  v80,  v81,  v82,  v83,  v277[0]);
        goto LABEL_113;
      }

      goto LABEL_110;
    }

    __int128 v255 = 0u;
    __int128 v256 = 0u;
    __int128 v257 = 0u;
    __int128 v258 = 0u;
    uint64_t v61 = [v188 countByEnumeratingWithState:&v255 objects:v277 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v256;
      do
      {
        for (uint64_t i = 0LL; i != v61; ++i)
        {
          if (*(void *)v256 != v62) {
            objc_enumerationMutation(v188);
          }
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:]( v60,  *(void **)(*((void *)&v255 + 1) + 8 * i))) {
            goto LABEL_109;
          }
        }

        uint64_t v61 = [v188 countByEnumeratingWithState:&v255 objects:v277 count:16];
      }

      while (v61);
    }

    __int128 v254 = 0u;
    __int128 v253 = 0u;
    __int128 v252 = 0u;
    __int128 v251 = 0u;
    uint64_t v64 = [v191 countByEnumeratingWithState:&v251 objects:&v273 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v252;
      do
      {
        for (uint64_t j = 0LL; j != v64; ++j)
        {
          if (*(void *)v252 != v65) {
            objc_enumerationMutation(v191);
          }
          uint64_t v67 = *(void **)(*((void *)&v251 + 1) + 8 * j);
          if (v67
            && v67[2] == 3LL
            && !-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:](v60, v67))
          {
            goto LABEL_109;
          }
        }

        uint64_t v64 = [v191 countByEnumeratingWithState:&v251 objects:&v273 count:16];
      }

      while (v64);
    }

    __int128 v249 = 0u;
    __int128 v250 = 0u;
    __int128 v247 = 0u;
    __int128 v248 = 0u;
    uint64_t v68 = [v191 countByEnumeratingWithState:&v247 objects:v272 count:16];
    if (!v68) {
      goto LABEL_99;
    }
    uint64_t v69 = *(void *)v248;
    do
    {
      for (uint64_t k = 0LL; k != v68; ++k)
      {
        if (*(void *)v248 != v69) {
          objc_enumerationMutation(v191);
        }
        uint64_t v71 = *(void **)(*((void *)&v247 + 1) + 8 * k);
        uint64_t v72 = (void *)MEMORY[0x186E3E5D8]();
        if (v71 && v71[2] == 3LL && !-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v71))
        {
LABEL_108:
          objc_autoreleasePoolPop(v72);
          goto LABEL_109;
        }

        objc_autoreleasePoolPop(v72);
      }

      uint64_t v68 = [v191 countByEnumeratingWithState:&v247 objects:v272 count:16];
    }

    while (v68);
LABEL_99:
    __int128 v245 = 0u;
    __int128 v246 = 0u;
    __int128 v243 = 0u;
    __int128 v244 = 0u;
    uint64_t v73 = [v192 countByEnumeratingWithState:&v243 objects:v271 count:16];
    if (v73)
    {
      uint64_t v74 = *(void *)v244;
      do
      {
        for (uint64_t m = 0LL; m != v73; ++m)
        {
          if (*(void *)v244 != v74) {
            objc_enumerationMutation(v192);
          }
          uint64_t v76 = *(void **)(*((void *)&v243 + 1) + 8 * m);
          uint64_t v72 = (void *)MEMORY[0x186E3E5D8]();
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v76)) {
            goto LABEL_108;
          }
          objc_autoreleasePoolPop(v72);
        }

        uint64_t v73 = [v192 countByEnumeratingWithState:&v243 objects:v271 count:16];
      }

      while (v73);
    }

    uint64_t updated = -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](v60);
LABEL_110:
    if ((*(_BYTE *)(v193[4] + 72LL) & 8) != 0)
    {
      uint64_t updated = [MEMORY[0x189603FE0] set];
      uint64_t v84 = (void *)updated;
    }

    else
    {
      uint64_t v84 = 0LL;
    }

    v85 = (void *)MEMORY[0x186E3E5D8](updated);
    __int128 v237 = 0u;
    __int128 v238 = 0u;
    __int128 v235 = 0u;
    __int128 v236 = 0u;
    uint64_t v86 = [v191 countByEnumeratingWithState:&v235 objects:v269 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v236;
      do
      {
        uint64_t v88 = 0LL;
        do
        {
          if (*(void *)v236 != v87) {
            objc_enumerationMutation(v191);
          }
          uint64_t v89 = *(void **)(*((void *)&v235 + 1) + 8 * v88);
          uint64_t v90 = (void *)objc_msgSend((id)v193[4], "indexPathForObject:", objc_msgSend(v89, "object"));
          if (v89)
          {
            objc_setProperty_nonatomic(v89, v91, v90, 32LL);
            uint64_t v92 = v193[4];
            if ((*(_BYTE *)(v92 + 72) & 8) == 0) {
              goto LABEL_126;
            }
            __int128 v93 = (void *)v89[4];
          }

          else
          {
            uint64_t v92 = v193[4];
            if ((*(_BYTE *)(v92 + 72) & 8) == 0) {
              goto LABEL_126;
            }
            __int128 v93 = 0LL;
          }

          unint64_t v94 = (void *)objc_msgSend(*(id *)(v92 + 104), "objectAtIndex:", objc_msgSend(v93, "indexAtPosition:", 0));
          if (!v89 || (objc_setProperty_nonatomic(v89, v95, v94, 48LL), v89[5] == v89[6])) {
            objc_msgSend(v84, "addObject:");
          }
LABEL_126:
          ++v88;
        }

        while (v86 != v88);
        uint64_t v96 = [v191 countByEnumeratingWithState:&v235 objects:v269 count:16];
        uint64_t v86 = v96;
      }

      while (v96);
    }

    __int128 v233 = 0u;
    __int128 v234 = 0u;
    __int128 v231 = 0u;
    __int128 v232 = 0u;
    uint64_t v97 = [v192 countByEnumeratingWithState:&v231 objects:v268 count:16];
    if (!v97) {
      goto LABEL_147;
    }
    uint64_t v98 = *(void *)v232;
LABEL_134:
    uint64_t v99 = 0LL;
    while (1)
    {
      if (*(void *)v232 != v98) {
        objc_enumerationMutation(v192);
      }
      uint64_t v100 = *(void **)(*((void *)&v231 + 1) + 8 * v99);
      uint64_t v101 = (void *)objc_msgSend((id)v193[4], "indexPathForObject:", objc_msgSend(v100, "object"));
      if (v100)
      {
        objc_setProperty_nonatomic(v100, v102, v101, 32LL);
        uint64_t v103 = v193[4];
        if ((*(_BYTE *)(v103 + 72) & 8) != 0)
        {
          uint64_t v104 = (void *)v100[4];
          goto LABEL_140;
        }
      }

      else
      {
        uint64_t v103 = v193[4];
        if ((*(_BYTE *)(v103 + 72) & 8) != 0)
        {
          uint64_t v104 = 0LL;
LABEL_140:
          uint64_t v105 = (void *)objc_msgSend( *(id *)(v103 + 104),  "objectAtIndex:",  objc_msgSend(v104, "indexAtPosition:", 0));
          if (v100) {
            objc_setProperty_nonatomic(v100, v106, v105, 48LL);
          }
        }
      }

      if (v97 == ++v99)
      {
        uint64_t v107 = [v192 countByEnumeratingWithState:&v231 objects:v268 count:16];
        uint64_t v97 = v107;
        if (!v107)
        {
LABEL_147:
          objc_autoreleasePoolPop(v85);
          uint64_t v47 = v192;
          if ((-[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:](v193[4], v189, v191) & 1) != 0) {
            goto LABEL_148;
          }
          uint64_t v108 = v193[4];
          int v109 = *(_DWORD *)(v108 + 72);
          if ((v109 & 0x40) == 0)
          {
            if ((v109 & 8) != 0)
            {
              __int128 v217 = 0u;
              __int128 v218 = 0u;
              __int128 v215 = 0u;
              __int128 v216 = 0u;
              uint64_t v141 = [v84 countByEnumeratingWithState:&v215 objects:v264 count:16];
              if (v141)
              {
                uint64_t v142 = *(void *)v216;
                do
                {
                  for (uint64_t n = 0LL; n != v141; ++n)
                  {
                    if (*(void *)v216 != v142) {
                      objc_enumerationMutation(v84);
                    }
                    uint64_t v144 = *(void *)(*((void *)&v215 + 1) + 8 * n);
                    __int128 v145 = (void *)MEMORY[0x186E3E5D8]();
                    v214[0] = MEMORY[0x1895F87A8];
                    v214[1] = 3221225472LL;
                    v214[2] = __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke_2;
                    v214[3] = &unk_189EA9660;
                    v214[4] = v144;
                    uint64_t v146 = [MEMORY[0x1896079C8] predicateWithBlock:v214];
                    -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:]( v193[4],  v144,  (void *)[v192 filteredSetUsingPredicate:v146],  (void *)objc_msgSend(v188, "filteredSetUsingPredicate:", v146),  (void *)objc_msgSend(v191, "filteredSetUsingPredicate:", v146));
                    objc_autoreleasePoolPop(v145);
                  }

                  uint64_t v141 = [v84 countByEnumeratingWithState:&v215 objects:v264 count:16];
                }

                while (v141);
              }
            }

            else
            {
              -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:]( v108,  0LL,  v192,  v188,  v191);
            }

            if ((*(_BYTE *)(v193[4] + 73LL) & 2) != 0)
            {
              __int128 v212 = 0u;
              __int128 v213 = 0u;
              __int128 v210 = 0u;
              __int128 v211 = 0u;
              uint64_t v147 = [v188 countByEnumeratingWithState:&v210 objects:v263 count:16];
              if (v147)
              {
                uint64_t v148 = *(void *)v211;
                do
                {
                  uint64_t v149 = 0LL;
                  do
                  {
                    if (*(void *)v211 != v148) {
                      objc_enumerationMutation(v188);
                    }
                    __int128 v150 = *(void **)(*((void *)&v210 + 1) + 8 * v149);
                    uint64_t v151 = [v150 object];
                    if (v150) {
                      uint64_t v152 = v150[3];
                    }
                    else {
                      uint64_t v152 = 0LL;
                    }
                    [v189 controller:v193[4] didChangeObject:v151 atIndexPath:v152 forChangeType:2 newIndexPath:0];
                    ++v149;
                  }

                  while (v147 != v149);
                  uint64_t v153 = [v188 countByEnumeratingWithState:&v210 objects:v263 count:16];
                  uint64_t v147 = v153;
                }

                while (v153);
              }
            }

            if ((*(_BYTE *)(v193[4] + 73LL) & 4) != 0)
            {
              __int128 v208 = 0u;
              __int128 v209 = 0u;
              __int128 v206 = 0u;
              __int128 v207 = 0u;
              uint64_t v154 = [v187 countByEnumeratingWithState:&v206 objects:v262 count:16];
              if (v154)
              {
                uint64_t v155 = *(void *)v207;
                do
                {
                  for (iuint64_t i = 0LL; ii != v154; ++ii)
                  {
                    if (*(void *)v207 != v155) {
                      objc_enumerationMutation(v187);
                    }
                    uint64_t v157 = [*(id *)(v193[4] + 112) objectForKey:*(void *)(*((void *)&v206 + 1) + 8 * ii)];
                    if (v157) {
                      [v189 controller:v193[4] didChangeSection:v157 atIndex:-[_NSDefaultSectionInfo sectionNumber](v157) forChangeType:1];
                    }
                  }

                  uint64_t v154 = [v187 countByEnumeratingWithState:&v206 objects:v262 count:16];
                }

                while (v154);
              }

              __int128 v204 = 0u;
              __int128 v205 = 0u;
              __int128 v202 = 0u;
              __int128 v203 = 0u;
              v158 = (void *)[v186 allValues];
              uint64_t v159 = [v158 countByEnumeratingWithState:&v202 objects:v261 count:16];
              if (v159)
              {
                uint64_t v160 = *(void *)v203;
                do
                {
                  uint64_t v161 = 0LL;
                  do
                  {
                    if (*(void *)v203 != v160) {
                      objc_enumerationMutation(v158);
                    }
                    v162 = *(void **)(*((void *)&v202 + 1) + 8 * v161);
                    if (!objc_msgSend(*(id *)(v193[4] + 112), "objectForKey:", objc_msgSend(v162, "name")))
                    {
                      if (v162) {
                        uint64_t v163 = v162[6];
                      }
                      else {
                        uint64_t v163 = 0LL;
                      }
                      [v189 controller:v193[4] didChangeSection:v162 atIndex:v163 forChangeType:2];
                    }

                    ++v161;
                  }

                  while (v159 != v161);
                  uint64_t v164 = [v158 countByEnumeratingWithState:&v202 objects:v261 count:16];
                  uint64_t v159 = v164;
                }

                while (v164);
              }
            }

            if ((*(_BYTE *)(v193[4] + 73LL) & 2) != 0)
            {
              __int128 v200 = 0u;
              __int128 v201 = 0u;
              __int128 v198 = 0u;
              __int128 v199 = 0u;
              uint64_t v165 = [v192 countByEnumeratingWithState:&v198 objects:v260 count:16];
              if (v165)
              {
                uint64_t v166 = *(void *)v199;
                do
                {
                  uint64_t v167 = 0LL;
                  do
                  {
                    if (*(void *)v199 != v166) {
                      objc_enumerationMutation(v192);
                    }
                    stat v168 = *(void **)(*((void *)&v198 + 1) + 8 * v167);
                    uint64_t v169 = [v168 object];
                    if (v168) {
                      uint64_t v170 = v168[4];
                    }
                    else {
                      uint64_t v170 = 0LL;
                    }
                    [v189 controller:v193[4] didChangeObject:v169 atIndexPath:0 forChangeType:1 newIndexPath:v170];
                    ++v167;
                  }

                  while (v165 != v167);
                  uint64_t v171 = [v192 countByEnumeratingWithState:&v198 objects:v260 count:16];
                  uint64_t v165 = v171;
                }

                while (v171);
              }

              __int128 v196 = 0u;
              __int128 v197 = 0u;
              __int128 v194 = 0u;
              __int128 v195 = 0u;
              uint64_t v172 = [v191 countByEnumeratingWithState:&v194 objects:v259 count:16];
              if (v172)
              {
                uint64_t v173 = *(void *)v195;
                do
                {
                  uint64_t v174 = 0LL;
                  do
                  {
                    if (*(void *)v195 != v173) {
                      objc_enumerationMutation(v191);
                    }
                    v175 = *(void **)(*((void *)&v194 + 1) + 8 * v174);
                    uint64_t v176 = [v175 object];
                    if (v175)
                    {
                      uint64_t v177 = v175[2];
                      v178 = (void *)v175[3];
                      v175 = (void *)v175[4];
                      if (!byte_18C4ABDBA && v177 == 3)
                      {
                        uint64_t v179 = [v178 indexAtPosition:0];
                        if (v179 == [v175 indexAtPosition:0])
                        {
                          uint64_t v180 = [v178 indexAtPosition:1];
                          if (v180 == [v175 indexAtPosition:1])
                          {
                            v175 = 0LL;
                            uint64_t v177 = 4LL;
                          }

                          else
                          {
                            uint64_t v177 = 3LL;
                          }
                        }

                        else
                        {
                          uint64_t v177 = 3LL;
                        }
                      }
                    }

                    else
                    {
                      v178 = 0LL;
                      uint64_t v177 = 0LL;
                    }

                    [v189 controller:v193[4] didChangeObject:v176 atIndexPath:v178 forChangeType:v177 newIndexPath:v175];
                    ++v174;
                  }

                  while (v172 != v174);
                  uint64_t v181 = [v191 countByEnumeratingWithState:&v194 objects:v259 count:16];
                  uint64_t v172 = v181;
                }

                while (v181);
              }
            }

            uint64_t v47 = v192;
            if ((*(_BYTE *)(v193[4] + 72LL) & 0x80) != 0) {
              objc_msgSend(v189, "controllerDidChangeContent:");
            }
            goto LABEL_148;
          }

          uint64_t v110 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v188, "count") + objc_msgSend(v192, "count") + 2 * objc_msgSend(v191, "count"));
          v184 = (__CFString *)MEMORY[0x186E3E5D8]();
          __int128 v229 = 0u;
          __int128 v230 = 0u;
          __int128 v227 = 0u;
          __int128 v228 = 0u;
          uint64_t v111 = [v192 countByEnumeratingWithState:&v227 objects:v267 count:16];
          if (v111)
          {
            uint64_t v112 = *(void *)v228;
            do
            {
              uint64_t v113 = 0LL;
              do
              {
                if (*(void *)v228 != v112) {
                  objc_enumerationMutation(v192);
                }
                id v114 = *(void **)(*((void *)&v227 + 1) + 8 * v113);
                id v115 = (void *)MEMORY[0x189607990];
                uint64_t v116 = objc_msgSend((id)objc_msgSend(v114, "object"), "objectID");
                if (v114) {
                  unint64_t v117 = (void *)v114[4];
                }
                else {
                  unint64_t v117 = 0LL;
                }
                objc_msgSend( v110,  "addObject:",  objc_msgSend( v115,  "changeWithObject:type:index:",  v116,  0,  objc_msgSend(v117, "indexAtPosition:", 1)));
                ++v113;
              }

              while (v111 != v113);
              uint64_t v118 = [v192 countByEnumeratingWithState:&v227 objects:v267 count:16];
              uint64_t v111 = v118;
            }

            while (v118);
          }

          __int128 v225 = 0u;
          __int128 v226 = 0u;
          __int128 v223 = 0u;
          __int128 v224 = 0u;
          uint64_t v119 = [v188 countByEnumeratingWithState:&v223 objects:v266 count:16];
          if (v119)
          {
            uint64_t v120 = *(void *)v224;
            do
            {
              uint64_t v121 = 0LL;
              do
              {
                if (*(void *)v224 != v120) {
                  objc_enumerationMutation(v188);
                }
                __int128 v122 = *(void **)(*((void *)&v223 + 1) + 8 * v121);
                __int128 v123 = (void *)MEMORY[0x189607990];
                uint64_t v124 = objc_msgSend((id)objc_msgSend(v122, "object"), "objectID");
                if (v122) {
                  __int128 v125 = (void *)v122[3];
                }
                else {
                  __int128 v125 = 0LL;
                }
                objc_msgSend( v110,  "addObject:",  objc_msgSend( v123,  "changeWithObject:type:index:",  v124,  1,  objc_msgSend(v125, "indexAtPosition:", 1)));
                ++v121;
              }

              while (v119 != v121);
              uint64_t v126 = [v188 countByEnumeratingWithState:&v223 objects:v266 count:16];
              uint64_t v119 = v126;
            }

            while (v126);
          }

          __int128 v221 = 0u;
          __int128 v222 = 0u;
          __int128 v219 = 0u;
          __int128 v220 = 0u;
          uint64_t v127 = [v191 countByEnumeratingWithState:&v219 objects:v265 count:16];
          if (v127)
          {
            uint64_t v128 = *(void *)v220;
            do
            {
              uint64_t v129 = 0LL;
              do
              {
                if (*(void *)v220 != v128) {
                  objc_enumerationMutation(v191);
                }
                __int128 v130 = *(id **)(*((void *)&v219 + 1) + 8 * v129);
                __int128 v131 = (void *)MEMORY[0x189607990];
                uint64_t v132 = objc_msgSend((id)objc_msgSend(v130, "object"), "objectID");
                if (v130)
                {
                  uint64_t v133 = [v130[4] indexAtPosition:1];
                  id v134 = v130[3];
                }

                else
                {
                  uint64_t v133 = [0 indexAtPosition:1];
                  id v134 = 0LL;
                }

                objc_msgSend( v110,  "addObject:",  objc_msgSend( v131,  "changeWithObject:type:index:associatedIndex:",  v132,  0,  v133,  objc_msgSend(v134, "indexAtPosition:", 1)));
                __int128 v135 = (void *)MEMORY[0x189607990];
                uint64_t v136 = objc_msgSend((id)objc_msgSend(v130, "object"), "objectID");
                if (v130)
                {
                  uint64_t v137 = [v130[3] indexAtPosition:1];
                  id v138 = v130[4];
                }

                else
                {
                  uint64_t v137 = [0 indexAtPosition:1];
                  id v138 = 0LL;
                }

                objc_msgSend( v110,  "addObject:",  objc_msgSend( v135,  "changeWithObject:type:index:associatedIndex:",  v136,  1,  v137,  objc_msgSend(v138, "indexAtPosition:", 1)));
                ++v129;
              }

              while (v127 != v129);
              uint64_t v139 = [v191 countByEnumeratingWithState:&v219 objects:v265 count:16];
              uint64_t v127 = v139;
            }

            while (v139);
          }

          objc_autoreleasePoolPop(v184);
          __int128 v140 = (void *)[objc_alloc(MEMORY[0x189607998]) initWithChanges:v110];
          [v189 controller:v193[4] didChangeContentWithDifference:v140];

LABEL_113:
          uint64_t v47 = v192;
          goto LABEL_148;
        }

        goto LABEL_134;
      }
    }
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v193[4];
  if ((isKindOfClass & 1) != 0)
  {
    -[_PFBatchFaultingArray _turnAllBatchesIntoFaults](*(void *)(v4 + 96));
    uint64_t v5 = v193[4];
    unsigned int v6 = *(_DWORD *)(v5 + 72) | 2;
  }

  else
  {
    uint64_t v15 = (void *)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs](v4);
    uint64_t v16 = [v15 count];
    uint64_t v17 = v16;
    if (!(_DWORD)v16) {
      goto LABEL_22;
    }
    uint64_t v18 = *(void **)(v193[4] + 96LL);
    unint64_t v19 = v16;
    MEMORY[0x1895F8858](v16);
    id v21 = (char *)&v182 - v20;
    if (v19 > 0x200) {
      id v21 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v182 - v20, 8 * v19);
    }
    objc_msgSend(v15, "getObjects:range:", v21, 0, v17);
    unint64_t v22 = -[_PFArray initWithObjects:count:andFlags:]( objc_alloc(&OBJC_CLASS____PFArray),  "initWithObjects:count:andFlags:",  v21,  v17,  27LL);
    if (v19 >= 0x201) {
      NSZoneFree(0LL, v21);
    }
    unsigned int v23 = objc_alloc(&OBJC_CLASS____PFBatchFaultingArray);
    unsigned int v24 = v193 + 4;
    *(void *)(*v24 + 96) = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:]( v23,  "initWithPFArray:andRequest:andContext:",  v22,  *(void *)(v193[4] + 8LL),  *(void *)(v193[4] + 16LL));
    -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*v24);

    if ((-[NSFetchedResultsController _computeSectionInfo:error:](*v24, *(void **)(*v24 + 96), 0LL) & 1) == 0)
    {
      uint64_t v25 = v193 + 4;

      *(void *)(*v25 + 104LL) = 0LL;
      *(void *)(*v25 + 112LL) = 0LL;

      *(void *)(*v25 + 120LL) = 0LL;
      *(void *)(*v25 + 128LL) = 0LL;
    }

    uint64_t v2 = v193;
    *(_DWORD *)(v193[4] + 72LL) |= 2u;
    uint64_t v5 = v2[4];
    unsigned int v6 = *(_DWORD *)(v5 + 72) & 0xFFFFFFFB;
  }

  *(_DWORD *)(v5 + 72) = v6;
LABEL_22:
  __int128 v241 = 0u;
  __int128 v242 = 0u;
  __int128 v239 = 0u;
  __int128 v240 = 0u;
  uint64_t v26 = *(void **)(v2[4] + 104LL);
  uint64_t result = (void *)[v26 countByEnumeratingWithState:&v239 objects:v270 count:16];
  uint64_t v27 = result;
  if (result)
  {
    uint64_t v28 = *(void *)v240;
    do
    {
      uint64_t v29 = 0LL;
      do
      {
        if (*(void *)v240 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v239 + 1) + 8LL * (void)v29);
        if (v30)
        {

          *(void *)(v30 + 56) = 0LL;
        }

        uint64_t v29 = (void *)((char *)v29 + 1);
      }

      while (v27 != v29);
      uint64_t result = (void *)[v26 countByEnumeratingWithState:&v239 objects:v270 count:16];
      uint64_t v27 = result;
    }

    while (result);
  }

  return result;
}

- (void)_managedObjectContextDidChangeObjectIDs:(id)a3
{
}

- (void)_managedObjectContextDidMutateObjectIDs:(id)a3
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)objc_msgSend( (id)objc_msgSend(a3, "userInfo"),  "objectForKeyedSubscript:",  @"_NSManagedObjectContextObjectIDMutationMappingKey");
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v63;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        unint64_t v10 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v9);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v11 = v10;
          uint64_t v12 = [v4 objectForKey:v9];
          -[NSMutableDictionary setObject:forKey:]( self->_indexCache,  "setObject:forKey:",  [MEMORY[0x189607968] numberWithUnsignedInteger:v11],  v12);
          -[NSMutableDictionary removeObjectForKey:](self->_indexCache, "removeObjectForKey:", v9);
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }

    while (v6);
  }

  _fetchResultsControllerFlags flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    context = (void *)MEMORY[0x186E3E5D8]();
    id obj = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v14 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v4);
          }
          uint64_t v18 = *(void **)(*((void *)&v58 + 1) + 8 * v17);
          unint64_t v19 = (void *)MEMORY[0x186E3E5D8](v14);
          sectionsByName = self->_sectionsByName;
          *(_DWORD *)&self->_flags |= 0x10u;
          uint64_t v21 = -[NSMutableDictionary objectForKeyedSubscript:]( sectionsByName,  "objectForKeyedSubscript:",  (id)objc_msgSend(v18, "_retainedURIString", context));
          if (v21)
          {
            unint64_t v22 = (uint64_t *)v21;
            unsigned int v23 = objc_alloc(&OBJC_CLASS____NSDefaultSectionInfo);
            unsigned int v24 = (void *)[v4 objectForKeyedSubscript:v18];
            *(_DWORD *)&self->_flags |= 0x10u;
            uint64_t v25 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]( v23,  (uint64_t)self,  (id)[v24 _retainedURIString],  (void *)objc_msgSend(v22, "sectionId"),  (void *)objc_msgSend(v22, "indexTitle"),  v22[4]);
            uint64_t v26 = [v22 numberOfObjects];
            if (v25)
            {
              v25[5] = v26;

              v25[7] = 0LL;
            }

            -[NSMutableOrderedSet replaceObjectAtIndex:withObject:]( self->_sections,  "replaceObjectAtIndex:withObject:",  -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v22),  v25);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sectionsByName,  "setObject:forKeyedSubscript:",  v25,  [v25 name]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sectionsByName,  "setObject:forKeyedSubscript:",  0,  [v22 name]);
            [obj addObject:v25];
          }

          objc_autoreleasePoolPop(v19);
          ++v17;
        }

        while (v15 != v17);
        uint64_t v14 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
        uint64_t v15 = v14;
      }

      while (v14);
    }

    if (objc_msgSend(obj, "count", context))
    {
      id v27 = -[NSFetchedResultsController delegate](self, "delegate");
      if (v27)
      {
        uint64_t v28 = v27;
        _fetchResultsControllerFlags v29 = self->_flags;
        if ((*(_WORD *)&v29 & 0x1000) != 0)
        {
          [v27 controllerWillChangeContent:self];
          _fetchResultsControllerFlags v29 = self->_flags;
        }

        if ((*(_WORD *)&v29 & 0x400) != 0)
        {
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          uint64_t v30 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v55;
            do
            {
              for (uint64_t j = 0LL; j != v31; ++j)
              {
                if (*(void *)v55 != v32) {
                  objc_enumerationMutation(obj);
                }
                [v28 controller:self didChangeSection:*(void *)(*((void *)&v54 + 1) + 8 * j) atIndex:-[_NSDefaultSectionInfo sectionNumber](*(void *)(*((void *)&v54 + 1) + 8 * j)) forChangeType:4];
              }

              uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
            }

            while (v31);
          }
        }

        if ((*(_BYTE *)&self->_flags & 0x80) != 0) {
          [v28 controllerDidChangeContent:self];
        }
      }
    }

    objc_autoreleasePoolPop(contexta);
    _fetchResultsControllerFlags flags = self->_flags;
  }

  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    id v34 = -[NSFetchedResultsController delegate](self, "delegate");
    if (v34 || !self->_delegate)
    {
      contextb = v34;
      id v35 = objc_alloc_init(MEMORY[0x189603FA8]);
      id obja = (id)MEMORY[0x186E3E5D8]();
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      uint64_t v36 = [v4 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v51;
        do
        {
          for (uint64_t k = 0LL; k != v37; ++k)
          {
            if (*(void *)v51 != v38) {
              objc_enumerationMutation(v4);
            }
            uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * k);
            uint64_t v41 = objc_msgSend(v4, "objectForKeyedSubscript:", v40, contextb);
            unint64_t v42 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v41);
            if (v42 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v43 = v42;
              objc_msgSend( v35,  "addObject:",  objc_msgSend(MEMORY[0x189607990], "changeWithObject:type:index:associatedIndex:", v40, 1, v43, v43));
              objc_msgSend( v35,  "addObject:",  objc_msgSend(MEMORY[0x189607990], "changeWithObject:type:index:associatedIndex:", v41, 0, v43, v43));
            }
          }

          uint64_t v37 = [v4 countByEnumeratingWithState:&v50 objects:v66 count:16];
        }

        while (v37);
      }

      objc_autoreleasePoolPop(obja);
      if ([v35 count])
      {
        uint64_t v44 = (void *)[objc_alloc(MEMORY[0x189607998]) initWithChanges:v35];
        [contextb controller:self didChangeContentWithDifference:v44];
      }
    }

    else
    {
      -[NSFetchedResultsController setDelegate:](self, "setDelegate:", 0LL);
    }
  }

- (void)_managedObjectContextDidChange:(id)a3
{
  if (!objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSObjectsChangedByMergeChangesKey")) {
    -[NSFetchedResultsController _core_managedObjectContextDidChange:](self, [a3 userInfo]);
  }
}

- (uint64_t)_appendAffectedStoreInfoToData:(void *)a3 adjustedOffset:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)[*(id *)(a1 + 8) affectedStores];
  if (![v6 count]) {
    uint64_t v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "persistentStoreCoordinator"), "persistentStores");
  }
  _writeInt32IntoData(a2, [v6 count]);
  if (a3) {
    *a3 = [a2 length] - 4;
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t result = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        _writeStringIntoData((void *)[v11 identifier], a2, v20);
        __darwin_time_t v12 = stat_path_for_modication_time((void *)[v11 URL]);
        unint64_t v14 = v13;
        _writeInt64IntoData(a2, v12);
        _writeInt64IntoData(a2, v14);
        ++v10;
      }

      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = result;
    }

    while (result);
  }

  return result;
}

- (void)_managedObjectContextDidSave:(id)a3
{
  if (-[NSManagedObjectContext concurrencyType](self->_managedObjectContext, "concurrencyType"))
  {
    managedObjectContext = self->_managedObjectContext;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke;
    v6[3] = &unk_189EA7648;
    v6[4] = self;
    v6[5] = a3;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v6);
  }

  else
  {
    -[NSFetchedResultsController _core_managedObjectContextDidSave:]((uint64_t)self, a3);
  }

void __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke( uint64_t a1)
{
}

@end