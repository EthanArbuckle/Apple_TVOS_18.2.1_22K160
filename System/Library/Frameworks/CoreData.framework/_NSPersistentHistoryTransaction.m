@interface _NSPersistentHistoryTransaction
+ (BOOL)supportsSecureCoding;
- (_NSPersistentHistoryTransaction)initWithCoder:(id)a3;
- (_NSPersistentHistoryTransaction)initWithDictionary:(id)a3 andObjectID:(id)a4;
- (id)_backingObjectID;
- (id)author;
- (id)bundleID;
- (id)changes;
- (id)contextName;
- (id)initialQueryGenerationToken;
- (id)objectIDNotification;
- (id)postQueryGenerationToken;
- (id)processID;
- (id)storeID;
- (id)timestamp;
- (id)token;
- (int64_t)transactionNumber;
- (void)_setChanges:(void *)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryTransaction

- (_NSPersistentHistoryTransaction)initWithDictionary:(id)a3 andObjectID:(id)a4
{
  uint64_t v7 = [a4 _referenceData64];
  v8 = (void *)[a3 objectForKey:@"AUTHORTS"];
  if (!v8) {
    v8 = (void *)[a3 objectForKey:@"AUTHOR"];
  }
  v9 = (void *)[a3 objectForKey:@"BUNDLEIDTS"];
  if (!v9) {
    v9 = (void *)[a3 objectForKey:@"BUNDLEID"];
  }
  v10 = (void *)[a3 objectForKey:@"CONTEXTNAMETS"];
  if (!v10) {
    v10 = (void *)[a3 objectForKey:@"CONTEXTNAME"];
  }
  v11 = (void *)[a3 objectForKey:@"PROCESSIDTS"];
  if (!v11) {
    v11 = (void *)[a3 objectForKey:@"PROCESSID"];
  }
  v12 = (void *)[a3 objectForKey:@"QUERYGEN"];
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"TIMESTAMP"), "doubleValue");
  double v14 = v13;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryTransaction;
  v15 = -[_NSPersistentHistoryTransaction init](&v20, sel_init);
  if (v15)
  {
    v16 = (unint64_t *)[a4 persistentStore];
    v17 = v16;
    if (v16)
    {
      v18 = (void *)atomic_load(v16 + 1);
      if ([v18 _isDeallocating]) {
        v16 = 0LL;
      }
      else {
        v16 = v18;
      }
    }

    v15->_coordinator = (NSPersistentStoreCoordinator *)v16;
    v15->_storeID = (NSString *)objc_msgSend((id)objc_msgSend(v17, "identifier"), "copy");
    v15->_rowIdentifier = v7;
    v15->_timestamp = v14;
    v15->_bundleID = (NSString *)v9;
    v15->_processID = (NSString *)v11;
    v15->_contextName = (NSString *)v10;
    v15->_author = (NSString *)v8;
    v15->_queryGeneration = (NSData *)v12;
    v15->_backingObjectID = (NSManagedObjectID *)a4;
  }

  return v15;
}

- (void)dealloc
{
  self->_changes = 0LL;
  self->_contextName = 0LL;

  self->_author = 0LL;
  self->_bundleID = 0LL;

  self->_processID = 0LL;
  self->_queryGeneration = 0LL;

  self->_storeID = 0LL;
  self->_backingObjectID = 0LL;

  self->_coordinator = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryTransaction;
  -[_NSPersistentHistoryTransaction dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryTransaction)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryTransaction;
  v4 = -[_NSPersistentHistoryTransaction init](&v17, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x186E3E5D8]();
    v4->_storeID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionStoreID"];
    v4->_rowIdentifier = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSPersistentHistoryTransactionRowID"),  "longLongValue");
    objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSPersistentHistoryTransactionTimestamp"),  "doubleValue");
    v4->_timestamp = v6;
    v4->_changes = (NSArray *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines historyChangesArrayClassesForSecureCoding]() forKey:@"NSPersistentHistoryTransactionChangeSet"];
    v4->_bundleID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionBundleID"];
    v4->_processID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionProcessID"];
    v4->_contextName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionContextName"];
    v4->_author = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryTransactionAuthor"];
    v4->_queryGeneration = (NSData *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines historyQueryGenDataClassesForSecureCoding]() forKey:@"NSPersistentHistoryTransactionQueryGen"];
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    changes = v4->_changes;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(changes);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _setTransaction:v4];
        }

        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v9);
    }

    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  [a3 encodeObject:self->_storeID forKey:@"NSPersistentHistoryTransactionStoreID"];
  objc_msgSend( a3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", self->_rowIdentifier),  @"NSPersistentHistoryTransactionRowID");
  objc_msgSend( a3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithDouble:", self->_timestamp),  @"NSPersistentHistoryTransactionTimestamp");
  [a3 encodeObject:self->_changes forKey:@"NSPersistentHistoryTransactionChangeSet"];
  [a3 encodeObject:self->_bundleID forKey:@"NSPersistentHistoryTransactionBundleID"];
  [a3 encodeObject:self->_processID forKey:@"NSPersistentHistoryTransactionProcessID"];
  [a3 encodeObject:self->_contextName forKey:@"NSPersistentHistoryTransactionContextName"];
  [a3 encodeObject:self->_author forKey:@"NSPersistentHistoryTransactionAuthor"];
  [a3 encodeObject:self->_queryGeneration forKey:@"NSPersistentHistoryTransactionQueryGen"];
  objc_autoreleasePoolPop(v5);
}

- (id)timestamp
{
  return (id)[MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->_timestamp];
}

- (void)_setChanges:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }

  return result;
}

- (id)changes
{
  return self->_changes;
}

- (int64_t)transactionNumber
{
  return self->_rowIdentifier;
}

- (id)token
{
  objc_super v3 = objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken);
  return  -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]( v3,  "initWithTransactionNumber:andStoreID:",  [MEMORY[0x189607968] numberWithLongLong:self->_rowIdentifier],  self->_storeID);
}

- (id)initialQueryGenerationToken
{
  if (!self->_queryGeneration) {
    return 0LL;
  }
  objc_super v3 = -[NSManagedObjectID persistentStore](self->_backingObjectID, "persistentStore");
  queryGeneration = self->_queryGeneration;
  if (-[NSData isNSData](queryGeneration, "isNSData")) {
    queryGeneration =  -[_PFSQLiteSnapshotWrapper initWithData:]( objc_alloc(&OBJC_CLASS____PFSQLiteSnapshotWrapper),  queryGeneration);
  }
  if (v3)
  {
    v5 = objc_alloc(&OBJC_CLASS____NSQueryGenerationToken);
    if (v5) {
      v5 = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]( v5,  queryGeneration,  v3,  0);
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)postQueryGenerationToken
{
  if (self)
  {
    objc_super v3 = -[NSManagedObjectID persistentStore](self->_backingObjectID, "persistentStore");
    if (v3)
    {
      if ((BYTE1(v3[1]._modelMap) & 0x40) != 0) {
        return 0LL;
      }
    }
  }

  v4 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterTransaction:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterTransaction:",  self);
  -[NSPersistentHistoryChangeRequest setResultType:](v4, "setResultType:", 3LL);
  -[NSPersistentHistoryChangeRequest setFetchLimit:](v4, "setFetchLimit:", 1LL);
  id v5 = -[NSPersistentStoreCoordinator executeRequest:withContext:error:]( self->_coordinator,  "executeRequest:withContext:error:",  v4,  0LL,  0LL);
  if (!objc_msgSend((id)objc_msgSend(v5, "result"), "count")) {
    return 0LL;
  }
  else {
    return (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v5, "result"), "objectAtIndexedSubscript:", 0),  "initialQueryGenerationToken");
  }
}

- (id)storeID
{
  return self->_storeID;
}

- (id)bundleID
{
  return self->_bundleID;
}

- (id)processID
{
  return self->_processID;
}

- (id)contextName
{
  return self->_contextName;
}

- (id)author
{
  return self->_author;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

- (id)objectIDNotification
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  if (!self)
  {
    uint64_t v17 = 0LL;
    goto LABEL_22;
  }

  v4 = (void *)[MEMORY[0x189603FE0] set];
  id v5 = (void *)[MEMORY[0x189603FE0] set];
  double v6 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  changes = self->_changes;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0LL; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(changes);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v13 = [v12 changedObjectID];
      uint64_t v14 = [v12 changeType];
      __int128 v15 = v4;
      if (!v14) {
        goto LABEL_12;
      }
      if (v14 == 2)
      {
        __int128 v15 = v6;
LABEL_12:
        [v15 addObject:v13];
        continue;
      }

      __int128 v15 = v5;
      if (v14 == 1) {
        goto LABEL_12;
      }
    }

    uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  }

  while (v9);
LABEL_15:
  __int128 v16 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:3];
  if ([v4 count]) {
    [v16 setValue:v4 forKey:@"inserted_objectIDs"];
  }
  if ([v5 count]) {
    [v16 setValue:v5 forKey:@"updated_objectIDs"];
  }
  if ([v6 count]) {
    [v16 setValue:v6 forKey:@"deleted_objectIDs"];
  }
  uint64_t v17 = [MEMORY[0x189603F68] dictionaryWithDictionary:v16];
LABEL_22:
  v18 = (void *)[objc_alloc(MEMORY[0x189607950]) initWithName:@"NSManagedObjectContextDidSaveObjectIDsNotification" object:0 userInfo:v17];
  objc_autoreleasePoolPop(v3);
  return v18;
}

@end