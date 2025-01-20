@interface CLStore
- (BOOL)commitChangesToStore;
- (BOOL)deleteRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4;
- (CLPersistenceManager)persistenceManager;
- (CLStore)initWithDefaultPersistenceManager:(BOOL)a3;
- (CLStore)initWithPersistenceManager:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (id)fetchRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4;
- (int)countRecordsWithEntityName:(id)a3 predicates:(id)a4;
@end

@implementation CLStore

- (CLStore)initWithPersistenceManager:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLStore.m",  21LL,  @"Invalid parameter not satisfying: %@",  @"persistenceManager");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLStore;
  v5 = -[CLStore init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    v5->_persistenceManager = (CLPersistenceManager *)a3;
    v5->_managedObjectContext = (NSManagedObjectContext *)[a3 createManagedObjectContext];
  }

  return v6;
}

- (CLStore)initWithDefaultPersistenceManager:(BOOL)a3
{
  v4 = -[CLPersistenceManager initWithDefaultDirectories:]( objc_alloc(&OBJC_CLASS___CLPersistenceManager),  "initWithDefaultDirectories:",  a3);
  if (-[CLPersistenceManager connectToStore](v4, "connectToStore")) {
    return -[CLStore initWithPersistenceManager:](self, "initWithPersistenceManager:", v4);
  }
  NSLog(@"CoreData, Could not connnect to store!");

  return 0LL;
}

- (BOOL)commitChangesToStore
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_1005D4BBC;
  v10 = sub_1005D4BCC;
  uint64_t v11 = 0LL;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1005D4BD8;
  v5[3] = &unk_1018429C8;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v5);
  uint64_t v3 = v7[5];
  if (v3) {
    NSLog(@"Could not save changes to store! Error: %@", v7[5]);
  }
  _Block_object_dispose(&v6, 8);
  return v3 == 0;
}

- (BOOL)deleteRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = sub_1005D4BBC;
  v12 = sub_1005D4BCC;
  uint64_t v13 = 0LL;
  managedObjectContext = self->_managedObjectContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1005D4CFC;
  v7[3] = &unk_1018429F0;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v7);
  uint64_t v5 = v9[5];
  if (v5) {
    NSLog(@"Couldnt perform delete request to store with error = %@", v9[5]);
  }
  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

- (id)fetchRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  v21 = sub_1005D4BBC;
  v22 = sub_1005D4BCC;
  uint64_t v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = sub_1005D4BBC;
  v16 = sub_1005D4BCC;
  id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1005D4ED0;
  v11[3] = &unk_101842A40;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a4;
  v11[7] = &v18;
  v11[8] = &v12;
  v11[9] = a2;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v11);
  if (v19[5]) {
    NSLog(@"Could not perform fetch request to store with error = %@", v19[5]);
  }
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (int)countRecordsWithEntityName:(id)a3 predicates:(id)a4
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = sub_1005D4BBC;
  v16 = sub_1005D4BCC;
  uint64_t v17 = 0LL;
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  managedObjectContext = self->_managedObjectContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1005D5180;
  v7[3] = &unk_101842A68;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  void v7[8] = &v12;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v7);
  if (v13[5]) {
    NSLog(@"Could not perform fetch request to store with error = %@", v13[5]);
  }
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (CLPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

@end