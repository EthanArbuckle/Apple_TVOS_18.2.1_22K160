@interface NSMetadataQuery
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)_stitchingClass;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3;
+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3;
+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4;
+ (void)didEndPossibleFileOperation:(id)a3;
- (BOOL)_canModifyQueryOrObserversInCurrentContext;
- (BOOL)_isMDQuery;
- (BOOL)isGathering;
- (BOOL)isStarted;
- (BOOL)isStopped;
- (BOOL)startQuery;
- (NSArray)groupedResults;
- (NSArray)groupingAttributes;
- (NSArray)results;
- (NSArray)searchItems;
- (NSArray)searchScopes;
- (NSArray)sortDescriptors;
- (NSArray)valueListAttributes;
- (NSDictionary)valueLists;
- (NSMetadataQuery)init;
- (NSOperationQueue)operationQueue;
- (NSPredicate)predicate;
- (NSTimeInterval)notificationBatchingInterval;
- (NSUInteger)indexOfResult:(id)result;
- (NSUInteger)resultCount;
- (id)_allAttributes;
- (id)_externalDocumentsBundleIdentifier;
- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4;
- (id)_queryString;
- (id)_sortingAttributes;
- (id)delegate;
- (id)resultAtIndex:(NSUInteger)idx;
- (id)valueOfAttribute:(NSString *)attrName forResultAtIndex:(NSUInteger)idx;
- (void)_disableAutoUpdates;
- (void)_enableAutoUpdates;
- (void)_inOriginalContextInvokeBlock:(id)a3;
- (void)_noteNote1:(id)a3;
- (void)_noteNote2:(id)a3;
- (void)_noteNote3:(id)a3;
- (void)_noteNote4:(id)a3;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_recreateQuery;
- (void)_resetQueryState;
- (void)_setExternalDocumentsBundleIdentifier:(id)a3;
- (void)_update;
- (void)_validateInvocationContext;
- (void)_validatePredicate:(id)a3 withScopes:(id)a4;
- (void)_zapResultArrayIfIdenticalTo:(id)a3;
- (void)dealloc;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)enumerateResultsUsingBlock:(void *)block;
- (void)enumerateResultsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setGroupingAttributes:(NSArray *)groupingAttributes;
- (void)setNotificationBatchingInterval:(NSTimeInterval)notificationBatchingInterval;
- (void)setOperationQueue:(NSOperationQueue *)operationQueue;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setSearchItems:(NSArray *)searchItems;
- (void)setSearchScopes:(NSArray *)searchScopes;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
- (void)setValueListAttributes:(NSArray *)valueListAttributes;
- (void)stopQuery;
@end

@implementation NSMetadataQuery

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v5 = (void *)[MEMORY[0x189603FE0] set];
  if (([a3 isEqualToString:@"resultCount"] & 1) != 0
    || ([a3 isEqualToString:@"valueLists"] & 1) != 0
    || [a3 isEqualToString:@"groupedResults"])
  {
    [v5 addObject:@"results"];
  }

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSMetadataQuery;
  objc_msgSend(v5, "unionSet:", objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_, a3));
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (NSMetadataQuery)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMetadataQuery;

  return 0LL;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];

  if (self->_private[5])
  {
    int flags = self->_flags;
    if ((flags & 2) == 0)
    {
      LODWORD(self->_flags) = flags | 2;
      if ((flags & 1) != 0)
      {
        if (-[NSMetadataQuery operationQueue](self, "operationQueue")
          || (id v4 = self->_private[9], v4 != (id)[MEMORY[0x189604008] currentRunLoop])
          || _CFExecutableLinkedOnOrAfter())
        {
          if (-[NSMetadataQuery operationQueue](self, "operationQueue")) {
            NSLog( (NSString *)@"%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on self.operationQueue.",  self);
          }
          else {
            NSLog( (NSString *)@"%@ is being deallocated without first calling -stopQuery. To avoid race conditions, you should first invoke -stopQuery on the run loop on which -startQuery was called",  self);
          }
        }
      }
    }

    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"__kMDQueryWillChangeNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryProgressNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidUpdateNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidFinishNotification",  self->_private[5]);

    self->_private[5] = 0LL;
  }

  self->_private[8] = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSMetadataQuery;
  -[NSMetadataQuery dealloc](&v5, sel_dealloc);
}

- (BOOL)_canModifyQueryOrObserversInCurrentContext
{
  if ((self->_flags & 3) != 1) {
    return 1;
  }
  if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    objc_super v3 = +[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue");
    return v3 == -[NSMetadataQuery operationQueue](self, "operationQueue");
  }

  else
  {
    if (!self->_private[9]) {
      return 0;
    }
    return (id)[MEMORY[0x189604008] currentRunLoop] == self->_private[9];
  }

- (void)_validateInvocationContext
{
  if (!-[NSMetadataQuery _canModifyQueryOrObserversInCurrentContext]( self,  "_canModifyQueryOrObserversInCurrentContext")) {
    NSLog( (NSString *)@"%@ has been started, but a modification to it was made from a different run loop or queue. Here's the backtrace: %@",  self,  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
  }
}

- (id)delegate
{
  return self->_private[8];
}

- (void)setDelegate:(id)delegate
{
  self->_private[8] = delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    int v4 = 32;
  }
  else {
    int v4 = 0;
  }
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFDF | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    int v5 = 64;
  }
  else {
    int v5 = 0;
  }
  LODWORD(self->_flags) = self->_flags & 0xFFFFFFBF | v5;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)self->_private[0];
}

- (void)_validatePredicate:(id)a3 withScopes:(id)a4
{
  if (a3)
  {
    if ([a4 count]) {
      [a3 _validateForMetadataQueryScopes:a4];
    }
  }

- (void)setPredicate:(NSPredicate *)predicate
{
  if (self->_private[0] != predicate)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery _validatePredicate:withScopes:]( self,  "_validatePredicate:withScopes:",  predicate,  self->_private[10]);
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"predicate");

    self->_private[0] = -[NSPredicate copyWithZone:](predicate, "copyWithZone:", 0LL);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"predicate");
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (NSArray)sortDescriptors
{
  return (NSArray *)self->_private[1];
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  if (self->_private[1] != sortDescriptors)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"sortDescriptors");

    self->_private[1] = (id)-[NSArray copy](sortDescriptors, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"sortDescriptors");
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (NSArray)valueListAttributes
{
  return (NSArray *)self->_private[2];
}

- (void)setValueListAttributes:(NSArray *)valueListAttributes
{
  if (self->_private[2] != valueListAttributes)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"valueListAttributes");

    self->_private[2] = (id)-[NSArray copy](valueListAttributes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"valueListAttributes");
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (NSArray)groupingAttributes
{
  return (NSArray *)self->_private[3];
}

- (void)setGroupingAttributes:(NSArray *)groupingAttributes
{
  if (self->_private[3] != groupingAttributes)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"groupingAttributes");

    self->_private[3] = (id)-[NSArray copy](groupingAttributes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"groupingAttributes");
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (id)_sortingAttributes
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_private[1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "key"));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_allAttributes
{
  objc_super v3 = -[NSMetadataQuery valueListAttributes](self, "valueListAttributes");
  id v4 = -[NSMetadataQuery groupingAttributes](self, "groupingAttributes");
  uint64_t v5 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v6 = v5;
  if (v3) {
    [v5 addObjectsFromArray:v3];
  }
  if (v4) {
    [v6 addObjectsFromArray:v4];
  }
  objc_msgSend(v6, "addObjectsFromArray:", -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  return v6;
}

- (NSTimeInterval)notificationBatchingInterval
{
  return self->_interval;
}

- (void)setNotificationBatchingInterval:(NSTimeInterval)notificationBatchingInterval
{
  if (self->_interval != notificationBatchingInterval)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"notificationBatchingInterval");
    self->_interval = notificationBatchingInterval;
    -[NSMetadataQuery _setBatchingParams](self, "_setBatchingParams");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"notificationBatchingInterval");
  }

- (NSArray)searchScopes
{
  return (NSArray *)self->_private[10];
}

- (void)setSearchScopes:(NSArray *)searchScopes
{
  if (self->_private[10] != searchScopes)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery _validatePredicate:withScopes:]( self,  "_validatePredicate:withScopes:",  self->_private[0],  searchScopes);
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"searchScopes");

    self->_private[10] = (id)-[NSArray copy](searchScopes, "copy");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"searchScopes");
    if (!self->_private[0]) {
      -[NSMetadataQuery setPredicate:]( self,  "setPredicate:",  +[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
    }
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getAssociatedObject(self, sel_operationQueue);
}

- (void)setOperationQueue:(NSOperationQueue *)operationQueue
{
  if (-[NSMetadataQuery operationQueue](self, "operationQueue") != operationQueue)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"operationQueue");
    objc_setAssociatedObject(self, sel_operationQueue, operationQueue, (void *)0x301);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"operationQueue");
  }

- (NSArray)searchItems
{
  return (NSArray *)objc_getAssociatedObject(self, sel_searchItems);
}

- (void)setSearchItems:(NSArray *)searchItems
{
  if (-[NSMetadataQuery searchItems](self, "searchItems") != searchItems)
  {
    -[NSMetadataQuery _validateInvocationContext](self, "_validateInvocationContext");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"searchItems");
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"searchItemURLs");
    objc_setAssociatedObject(self, sel_searchItems, searchItems, (void *)0x303);
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"searchItemURLs");
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"searchItems");
    if ((self->_flags & 3) == 1) {
      -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
    }
  }

- (id)_externalDocumentsBundleIdentifier
{
  return objc_getAssociatedObject(self, sel__externalDocumentsBundleIdentifier);
}

- (void)_setExternalDocumentsBundleIdentifier:(id)a3
{
  if ((self->_flags & 3) == 1) {
    -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
}

- (void)_noteNote1:(id)a3
{
  int flags = self->_flags;
  if ((flags & 0x80) == 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"results");
    int flags = self->_flags;
  }

  LODWORD(self->_flags) = flags | 0x80;
}

- (void)_noteNote2:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"results");
  -[NSMetadataQuery _postNotificationName:userInfo:]( self,  "_postNotificationName:userInfo:",  @"NSMetadataQueryGatheringProgressNotification",  [a3 userInfo]);
}

- (void)_noteNote3:(id)a3
{
  LODWORD(self->_flags) &= ~0x80u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"results");
  -[NSMetadataQuery _postNotificationName:userInfo:]( self,  "_postNotificationName:userInfo:",  @"NSMetadataQueryDidUpdateNotification",  [a3 userInfo]);
}

- (void)_noteNote4:(id)a3
{
  objc_super v3 = self;
  int flags = self->_flags;
  if ((flags & 0x80) != 0)
  {
    LODWORD(self->_flags) = flags & 0xFFFFFF7F;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"results");
  }

  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isGathering");
  LODWORD(self->_flags) &= ~4u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isGathering");
  -[NSMetadataQuery _postNotificationName:userInfo:]( self,  "_postNotificationName:userInfo:",  @"NSMetadataQueryDidFinishGatheringNotification",  0LL);
  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"results");
  LODWORD(self->_flags) |= 0x80u;
}

- (id)_queryString
{
  return (id)[self->_private[0] generateMetadataDescription];
}

- (void)_resetQueryState
{
  int flags = self->_flags;
  if ((flags & 2) != 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isStopped");
    LODWORD(self->_flags) &= ~2u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isStopped");
    int flags = self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return;
      }
LABEL_7:
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isGathering");
      LODWORD(self->_flags) &= ~4u;
      -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isGathering");
      return;
    }
  }

  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }

  -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isStarted");
  LODWORD(self->_flags) &= ~1u;
  -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isStarted");
  if ((self->_flags & 4) != 0) {
    goto LABEL_7;
  }
}

- (void)_recreateQuery
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_private[5])
  {
    if ((self->_flags & 0x80) == 0)
    {
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"results");
      LODWORD(self->_flags) |= 0x80u;
    }

    objc_sync_enter(self);
    if (*((void *)self->_reserved + 1))
    {
      -[NSMetadataQuery _disableAutoUpdates](self, "_disableAutoUpdates");
      *((void *)self->_reserved + 1) = 0LL;
      unsigned int flags = self->_flags;
      BOOL v4 = flags >= 0x10000;
      unsigned int v5 = flags - 0x10000;
      if (v4) {
        LODWORD(self->_flags) = v5;
      }
    }

    objc_sync_exit(self);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"__kMDQueryWillChangeNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryProgressNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidUpdateNotification",  self->_private[5]);
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidFinishNotification",  self->_private[5]);

    self->_private[5] = 0LL;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"results");
    LODWORD(self->_flags) &= ~0x80u;
  }

  if (!self->_private[0])
  {
    -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
    return;
  }

  uint64_t v6 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSMetadataQuery _sortingAttributes](self, "_sortingAttributes"));
  if (self->_private[3]) {
    objc_msgSend(v6, "addObjectsFromArray:");
  }
  uint64_t v7 = -[NSMetadataQuery searchItems](self, "searchItems");
  if (!v7)
  {
    self->_private[5] = 0LL;
LABEL_31:
    -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
    return;
  }

  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 && (_NSIsNSString() & 1) == 0 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v14 = (id)[v13 _item];
          if (v14)
          {
            [v9 addObject:v14];
          }
        }

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
    }

    while (v10);
  }

  self->_private[5] = 0LL;

  if (!self->_private[5]) {
    goto LABEL_31;
  }
  [self->_private[1] count];
  [self->_private[10] count];
  -[NSMetadataQuery operationQueue](self, "operationQueue");
  -[NSMetadataQuery _setBatchingParams](self, "_setBatchingParams");
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel__noteNote1_,  @"__kMDQueryWillChangeNotification",  self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel__noteNote2_,  @"kMDQueryProgressNotification",  self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel__noteNote3_,  @"kMDQueryDidUpdateNotification",  self->_private[5]);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  sel__noteNote4_,  @"kMDQueryDidFinishNotification",  self->_private[5]);

  self->_private[9] = 0LL;
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"__kMDQueryWillChangeNotification",  self->_private[5]);
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryProgressNotification",  self->_private[5]);
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidUpdateNotification",  self->_private[5]);
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryDidFinishNotification",  self->_private[5]);

  self->_private[5] = 0LL;
  -[NSMetadataQuery _resetQueryState](self, "_resetQueryState");
}

- (BOOL)startQuery
{
  if (!self->_private[0]) {
    return 0;
  }
  if ((self->_flags & 3) == 1) {
    return 0;
  }
  -[NSMetadataQuery _recreateQuery](self, "_recreateQuery");
  if (!self->_private[5]) {
    return 0;
  }
  int flags = self->_flags;
  if ((flags & 2) != 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isStopped");
    LODWORD(self->_flags) &= ~2u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isStopped");
    int flags = self->_flags;
  }

  if ((flags & 1) == 0)
  {
    -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isStarted");
    LODWORD(self->_flags) |= 1u;
    -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isStarted");
  }

  return 1;
}

- (void)_inOriginalContextInvokeBlock:(id)a3
{
  if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    unsigned int v5 = +[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue");
    if (v5 != -[NSMetadataQuery operationQueue](self, "operationQueue"))
    {
      -[NSOperationQueue addOperationWithBlock:]( -[NSMetadataQuery operationQueue](self, "operationQueue"),  "addOperationWithBlock:",  a3);
      return;
    }
  }

  else if (self->_private[9])
  {
    uint64_t v6 = [MEMORY[0x189604008] currentRunLoop];
    id v7 = self->_private[9];
    if ((id)v6 != v7)
    {
      uint64_t v8 = (__CFRunLoop *)[v7 getCFRunLoop];
      CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x1896051B0], a3);
      CFRunLoopWakeUp(v8);
      return;
    }
  }

  (*((void (**)(id))a3 + 2))(a3);
}

- (void)stopQuery
{
  v3[5] = *MEMORY[0x1895F89C0];
  if (self->_private[5])
  {
    if ((self->_flags & 2) == 0)
    {
      -[NSMetadataQuery willChangeValueForKey:](self, "willChangeValueForKey:", @"isStopped");
      LODWORD(self->_flags) |= 2u;
      -[NSMetadataQuery didChangeValueForKey:](self, "didChangeValueForKey:", @"isStopped");
      v3[0] = MEMORY[0x1895F87A8];
      v3[1] = 3221225472LL;
      v3[2] = __28__NSMetadataQuery_stopQuery__block_invoke;
      v3[3] = &unk_189C9A030;
      v3[4] = self;
      -[NSMetadataQuery _inOriginalContextInvokeBlock:](self, "_inOriginalContextInvokeBlock:", v3);
    }
  }

uint64_t __28__NSMetadataQuery_stopQuery__block_invoke(uint64_t a1)
{
  v2 = *(_DWORD **)(a1 + 32);
  int v3 = v2[2];
  if ((v3 & 4) != 0)
  {
    [v2 willChangeValueForKey:@"isGathering"];
    *(_DWORD *)(*(void *)(a1 + 32) + 8LL) &= ~4u;
    [*(id *)(a1 + 32) didChangeValueForKey:@"isGathering"];
    v2 = *(_DWORD **)(a1 + 32);
    int v3 = v2[2];
  }

  if ((v3 & 0x80) != 0)
  {
    v2[2] = v3 & 0xFFFFFF7F;
    [*(id *)(a1 + 32) didChangeValueForKey:@"results"];
  }

  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  *(void *)(a1 + 32),  @"__kMDQueryWillChangeNotification",  *(void *)(*(void *)(a1 + 32) + 64LL));
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  *(void *)(a1 + 32),  @"kMDQueryProgressNotification",  *(void *)(*(void *)(a1 + 32) + 64LL));
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  *(void *)(a1 + 32),  @"kMDQueryDidUpdateNotification",  *(void *)(*(void *)(a1 + 32) + 64LL));
  return -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  *(void *)(a1 + 32),  @"kMDQueryDidFinishNotification",  *(void *)(*(void *)(a1 + 32) + 64LL));
}

- (BOOL)isStarted
{
  return self->_flags & 1;
}

- (BOOL)isGathering
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isStopped
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)disableUpdates
{
  WORD1(self->_flags) = ((WORD1(self->_flags) << 16) + 0x10000) >> 16;
}

- (void)enableUpdates
{
  unsigned int flags = self->_flags;
  BOOL v3 = flags >= 0x10000;
  unsigned int v4 = flags - 0x10000;
  if (v3) {
    LODWORD(self->_flags) = v4;
  }
}

- (void)_disableAutoUpdates
{
  id v3 = self->_private[4];
  if (v3)
  {
    [v3 invalidate];

    self->_private[4] = 0LL;
  }

  else if (self->_private[5])
  {
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  @"kMDQueryHasUpdateNotification",  self->_private[5]);
  }

- (void)_enableAutoUpdates
{
  if (self->_private[5]) {
    self->_private[4] = (id)[MEMORY[0x189604028] scheduledTimerWithTimeInterval:self target:sel__update selector:0 userInfo:1 repeats:0.1];
  }
}

- (void)_update
{
  if (LODWORD(self->_flags) >= 0x10000)
  {
    if (self->_private[5])
    {
      objc_sync_enter(self);
      id v3 = *((id *)self->_reserved + 1);
      objc_sync_exit(self);
    }
  }

- (NSUInteger)resultCount
{
  return 0LL;
}

- (id)resultAtIndex:(NSUInteger)idx
{
  if ((idx & 0x8000000000000000LL) != 0 && self->_private[5]) {
    return 0LL;
  }
  unsigned int v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0 reason userInfo];
  objc_exception_throw(v4);
  -[NSMetadataQuery enumerateResultsUsingBlock:](v5, v6, v7);
  return result;
}

- (void)enumerateResultsUsingBlock:(void *)block
{
  if (block)
  {
    -[NSMetadataQuery enumerateResultsWithOptions:usingBlock:]( self,  "enumerateResultsWithOptions:usingBlock:",  0LL,  block);
  }

  else
  {
    id v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v3);
    -[NSMetadataQuery enumerateResultsWithOptions:usingBlock:](v4, v5, v6, v7);
  }

- (void)enumerateResultsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  if (block)
  {
    -[NSMetadataQuery disableUpdates](self, "disableUpdates");
    id v7 = objc_alloc(&OBJC_CLASS____NSMetadataQueryResultArray);
    if (v7) {
      v7->_query = self;
    }
    -[_NSMetadataQueryResultArray enumerateObjectsWithOptions:usingBlock:]( v7,  "enumerateObjectsWithOptions:usingBlock:",  opts,  block);

    -[NSMetadataQuery enableUpdates](self, "enableUpdates");
  }

  else
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: block cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSMetadataQuery _zapResultArrayIfIdenticalTo:](v9, v10, v11);
  }

- (void)_zapResultArrayIfIdenticalTo:(id)a3
{
  if (*((id *)self->_reserved + 1) == a3)
  {
    -[NSMetadataQuery _disableAutoUpdates](self, "_disableAutoUpdates");
    *((void *)self->_reserved + 1) = 0LL;
    -[NSMetadataQuery enableUpdates](self, "enableUpdates");
  }

- (NSArray)results
{
  if (!self->_private[5]) {
    return (NSArray *)[MEMORY[0x189603F18] array];
  }
  objc_sync_enter(self);
  id v3 = (void *)*((void *)self->_reserved + 1);
  if (!v3)
  {
    -[NSMetadataQuery disableUpdates](self, "disableUpdates");
    unsigned int v4 = objc_alloc(&OBJC_CLASS____NSMetadataQueryResultArray);
    if (v4) {
      v4->_query = self;
    }
    *((void *)self->_reserved + 1) = v4;
    -[NSMetadataQuery _enableAutoUpdates](self, "_enableAutoUpdates");
    id v3 = (void *)*((void *)self->_reserved + 1);
  }

  id v5 = v3;
  objc_sync_exit(self);
  return (NSArray *)v5;
}

- (NSUInteger)indexOfResult:(id)result
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSDictionary)valueLists
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!self->_private[5]) {
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }
  __int128 v16 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  obuint64_t j = self->_private[2];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v7 = (void *)[MEMORY[0x189603FA8] array];
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        uint64_t v8 = [0 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t j = 0LL; j != v9; ++j)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(0LL);
              }
              id v12 = -[NSMetadataQueryAttributeValueTuple _init:attribute:value:count:]( objc_alloc(&OBJC_CLASS___NSMetadataQueryAttributeValueTuple),  "_init:attribute:value:count:",  self,  v6,  *(void *)(*((void *)&v18 + 1) + 8 * j),  -1LL);
              [v7 addObject:v12];
            }

            uint64_t v9 = [0 countByEnumeratingWithState:&v18 objects:v17 count:16];
          }

          while (v9);
        }

        [v16 addObject:v7];
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
    }

    while (v4);
  }

  return (NSDictionary *)[MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:self->_private[2]];
}

- (NSArray)groupedResults
{
  if (!self->_private[5] || ![self->_private[3] count]) {
    return (NSArray *)[MEMORY[0x189603F18] array];
  }
  uint64_t v3 = -[NSMetadataQuery resultCount](self, "resultCount");
  uint64_t v4 = (void *)[MEMORY[0x189603FC8] dictionary];
  uint64_t v5 = [self->_private[3] objectAtIndex:0];
  if (v3 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      id v8 = -[NSMetadataQuery valueOfAttribute:forResultAtIndex:](self, "valueOfAttribute:forResultAtIndex:", v6, i);
      if (!v8) {
        id v8 = (id)[MEMORY[0x189603FE8] null];
      }
      id v9 = (id)[v4 objectForKey:v8];
      if (!v9)
      {
        id v9 = -[NSMetadataQueryResultGroup _init:attributes:index:value:]( objc_alloc(&OBJC_CLASS___NSMetadataQueryResultGroup),  "_init:attributes:index:value:",  self,  self->_private[3],  0LL,  v8);
        [v4 setObject:v9 forKey:v8];
      }

      [v9 _addResult:i];
    }
  }

  return (NSArray *)[v4 allValues];
}

- (id)valueOfAttribute:(NSString *)attrName forResultAtIndex:(NSUInteger)idx
{
  if (attrName == (NSString *)@"NSMetadataQueryResultContentRelevanceAttribute") {
    uint64_t v4 = (NSString *)@"kMDQueryResultContentRelevance";
  }
  else {
    uint64_t v4 = attrName;
  }
  if ((idx & 0x8000000000000000LL) != 0 && self->_private[5])
  {
    if ((self->_flags & 0x40) != 0) {
      return (id)[self->_private[8] metadataQuery:self replacementValueForAttribute:v4 value:0];
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), idx, -[NSMetadataQuery resultCount](self, "resultCount")), 0 reason userInfo];
    objc_exception_throw(v6);
    return -[NSMetadataQuery _pendingChangeNotificationsArrayForKey:create:](v7, v8, v9, v10);
  }

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ([a3 isEqualToString:@"results"]
    && -[NSMetadataQuery operationQueue](self, "operationQueue"))
  {
    id result = (id)*((void *)self->_reserved + 2);
    if (result) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      *((void *)self->_reserved + 2) = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &NSKVOPendingNotificationStackIdentifierCallbacks,  MEMORY[0x189605250]);
      return (id)*((void *)self->_reserved + 2);
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSMetadataQuery;
    return -[NSMetadataQuery _pendingChangeNotificationsArrayForKey:create:]( &v9,  sel__pendingChangeNotificationsArrayForKey_create_,  a3,  v4);
  }

  return result;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ([a4 isEqualToString:@"results"]
    && !-[NSMetadataQuery _canModifyQueryOrObserversInCurrentContext]( self,  "_canModifyQueryOrObserversInCurrentContext"))
  {
    if (-[NSMetadataQuery operationQueue](self, "operationQueue"))
    {
      id v7 = +[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue");
      BOOL v8 = -[NSOperationQueue name](v7, "name");
      if (!-[NSString length](v8, "length"))
      {
        label = dispatch_queue_get_label(0LL);
        if (label) {
          BOOL v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", label);
        }
      }

      if (!-[NSString length](v8, "length"))
      {
        if (v7) {
          BOOL v8 = -[NSOperationQueue description](v7, "description");
        }
        else {
          BOOL v8 = (NSString *)@"an unknown queue";
        }
      }

      NSLog( (NSString *)@"%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on %@ instead of NSMetadataQuery.operationQueue, which is %@. To avoid race conditions, you should either ensure the query is stopped before removing observers, or remove them on the NSMetadataQuery.operationQueue",  self,  v8,  -[NSMetadataQuery operationQueue](self, "operationQueue"));
    }

    else
    {
      NSLog( (NSString *)@"%@: A Key-Value Observer of NSMetadataQuery.results for this instance was removed, while the query was still running, on NSRunLoop %p instead of the NSRunLoop it was started on, which is %p. To avoid race conditions, you shouuld either ensure the query is stopped before removing observers, or remove them on the same NSRunLoop that the query was started on.",  self,  [MEMORY[0x189604008] currentRunLoop],  self->_private[9]);
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSMetadataQuery;
  -[NSMetadataQuery removeObserver:forKeyPath:](&v10, sel_removeObserver_forKeyPath_, a3, a4);
}

- (BOOL)_isMDQuery
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

+ (Class)_stitchingClass
{
  if (qword_18C4963E0 != -1) {
    dispatch_once(&qword_18C4963E0, &__block_literal_global_25);
  }
  return (Class)_MergedGlobals_7;
}

uint64_t __55__NSMetadataQuery_NSMetadataStitching___stitchingClass__block_invoke()
{
  _MergedGlobals_7 = (uint64_t)objc_lookUpClass("BRQuery");
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) == 0) {
    _MergedGlobals_7 = 0LL;
  }
  return result;
}

+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleMoveOfItemAtURL:toURL:", a3, a4);
}

+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleDeletionOfItemAtURL:", a3);
}

+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_stitchingClass"), "willBeginPossibleCreationOfItemAtURL:", a3);
}

+ (void)didEndPossibleFileOperation:(id)a3
{
}

@end