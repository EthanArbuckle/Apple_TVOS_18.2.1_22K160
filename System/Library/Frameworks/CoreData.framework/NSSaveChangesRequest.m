@interface NSSaveChangesRequest
+ (void)initialize;
- (BOOL)_secureOperation;
- (BOOL)hasChanges;
- (NSSaveChangesRequest)init;
- (NSSaveChangesRequest)initWithInsertedObjects:(NSSet *)insertedObjects updatedObjects:(NSSet *)updatedObjects deletedObjects:(NSSet *)deletedObjects lockedObjects:(NSSet *)lockedObjects;
- (NSSet)deletedObjects;
- (NSSet)insertedObjects;
- (NSSet)lockedObjects;
- (NSSet)updatedObjects;
- (id)description;
- (uint64_t)_addChangedObjectIDsNotification:(uint64_t)result;
- (unint64_t)requestType;
- (void)_setSecureOperation:(BOOL)a3;
- (void)dealloc;
- (void)setDeletedObjects:(void *)result;
@end

@implementation NSSaveChangesRequest

+ (void)initialize
{
}

- (NSSaveChangesRequest)initWithInsertedObjects:(NSSet *)insertedObjects updatedObjects:(NSSet *)updatedObjects deletedObjects:(NSSet *)deletedObjects lockedObjects:(NSSet *)lockedObjects
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSaveChangesRequest;
  v10 = -[NSSaveChangesRequest init](&v12, sel_init);
  if (v10)
  {
    v10->_insertedObjects = insertedObjects;
    v10->_updatedObjects = updatedObjects;
    v10->_deletedObjects = deletedObjects;
    v10->_optimisticallyLockedObjects = lockedObjects;
    v10->_flags = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  self->_insertedObjects = 0LL;
  self->_updatedObjects = 0LL;

  self->_deletedObjects = 0LL;
  self->_optimisticallyLockedObjects = 0LL;

  self->_mutatedObjectIDsNotifications = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSaveChangesRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (NSSaveChangesRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSaveChangesRequest;
  result = -[NSSaveChangesRequest init](&v3, sel_init);
  if (result)
  {
    result->_insertedObjects = 0LL;
    result->_updatedObjects = 0LL;
    result->_deletedObjects = 0LL;
    result->_optimisticallyLockedObjects = 0LL;
    result->_flags = 0LL;
  }

  return result;
}

- (NSSet)insertedObjects
{
  return self->_insertedObjects;
}

- (NSSet)updatedObjects
{
  return self->_updatedObjects;
}

- (NSSet)deletedObjects
{
  return self->_deletedObjects;
}

- (NSSet)lockedObjects
{
  return self->_optimisticallyLockedObjects;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  v4 = (__CFString *)objc_msgSend( -[NSSet valueForKey:](self->_insertedObjects, "valueForKey:", @"objectID"),  "allObjects");
  v5 = (__CFString *)objc_msgSend( -[NSSet valueForKey:](self->_updatedObjects, "valueForKey:", @"objectID"),  "allObjects");
  v6 = (__CFString *)objc_msgSend( -[NSSet valueForKey:](self->_deletedObjects, "valueForKey:", @"objectID"),  "allObjects");
  v7 = (__CFString *)objc_msgSend( -[NSSet valueForKey:](self->_optimisticallyLockedObjects, "valueForKey:", @"objectID"),  "allObjects");
  v8 = (void *)NSString;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSSaveChangesRequest;
  id v9 = -[NSSaveChangesRequest description](&v14, sel_description);
  if (!-[__CFString count](v4, "count")) {
    v4 = &stru_189EAC2E8;
  }
  if (!-[__CFString count](v5, "count")) {
    v5 = &stru_189EAC2E8;
  }
  if (!-[__CFString count](v6, "count")) {
    v6 = &stru_189EAC2E8;
  }
  if (-[__CFString count](v7, "count")) {
    v10 = v7;
  }
  else {
    v10 = &stru_189EAC2E8;
  }
  v11 = (void *)[v8 stringWithFormat:@"%@ { inserts (%@), updates (%@), deletes (%@) locks (%@) }", v9, v4, v5, v6, v10];
  id v12 = v11;
  [v3 drain];
  return v11;
}

- (unint64_t)requestType
{
  return 2LL;
}

- (void)setDeletedObjects:(void *)result
{
  if (result)
  {
    id v3 = result;
    v4 = (void *)result[4];
    if (v4 != a2)
    {

      result = (void *)[a2 count];
      if (result) {
        result = a2;
      }
      v3[4] = result;
    }
  }

  return result;
}

- (BOOL)hasChanges
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 16) count];
    uint64_t v3 = [*(id *)(v1 + 24) count] + v2;
    return v3 + [*(id *)(v1 + 32) count] != 0;
  }

  return result;
}

- (void)_setSecureOperation:(BOOL)a3
{
  unint64_t v3 = self->_flags | 0x200;
  if (!a3) {
    unint64_t v3 = self->_flags & 0xFFFFFEFF;
  }
  self->_flags = v3;
}

- (BOOL)_secureOperation
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (uint64_t)_addChangedObjectIDsNotification:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 56);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(v3 + 56) = v4;
    }

    return [v4 addObject:a2];
  }

  return result;
}

@end