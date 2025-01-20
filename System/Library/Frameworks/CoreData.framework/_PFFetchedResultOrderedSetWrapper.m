@interface _PFFetchedResultOrderedSetWrapper
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (Class)classForCoder;
- (NSString)description;
- (_PFFetchedResultOrderedSetWrapper)initWithArray:(id)a3 andContext:(id)a4;
- (id)allObjects;
- (id)array;
- (id)arrayFromObjectIDs;
- (id)descriptionWithLocale:(id)a3;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _PFFetchedResultOrderedSetWrapper

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFFetchedResultOrderedSetWrapper)initWithArray:(id)a3 andContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PFFetchedResultOrderedSetWrapper;
  v6 = -[_PFFetchedResultOrderedSetWrapper init](&v9, sel_init);
  if (!v6) {
    return v6;
  }
  if (![a3 count])
  {

    return (_PFFetchedResultOrderedSetWrapper *)objc_alloc_init(MEMORY[0x189603FF0]);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {

    return (_PFFetchedResultOrderedSetWrapper *)[objc_alloc(MEMORY[0x189603FF0]) initWithArray:a3];
  }

  v6->_underlyingArray = (NSArray *)a3;
  if (a4
    && _PF_shouldAsyncProcessReferenceQueue
    && ([a4 concurrencyType] == 1 || objc_msgSend(a4, "concurrencyType") == 2))
  {
    v6->_weakmoc = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  a4);
  }

  return v6;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

- (void)dealloc
{
  NSUInteger v3 = -[NSArray count](self->_underlyingArray, "count");

  if (v3)
  {
    weakmoc = self->_weakmoc;
    if (weakmoc)
    {
      id WeakRetained = objc_loadWeakRetained(&weakmoc->_object);
      if (WeakRetained)
      {
        v6 = WeakRetained;
        -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);
      }
    }
  }

  _PFDeallocateObject(self);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"NSOrderedSet wrapper '%@' for fetch request results: %@", self, self->_underlyingArray];
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)[NSString stringWithFormat:@"NSOrderedSet wrapper '%@' for fetch request results: %@", self, self->_underlyingArray];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FD0]) initWithArray:self->_underlyingArray];
}

- (unint64_t)count
{
  return -[NSArray count](self->_underlyingArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_underlyingArray, "objectAtIndex:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_underlyingArray, "indexOfObject:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:]( self->_underlyingArray,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSArray indexOfObjectWithOptions:passingTest:]( self->_underlyingArray,  "indexOfObjectWithOptions:passingTest:",  a3,  a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSArray indexOfObjectAtIndexes:options:passingTest:]( self->_underlyingArray,  "indexOfObjectAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSArray indexesOfObjectsWithOptions:passingTest:]( self->_underlyingArray,  "indexesOfObjectsWithOptions:passingTest:",  a3,  a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:]( self->_underlyingArray,  "indexesOfObjectsAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return -[NSArray sortedArrayUsingComparator:](self->_underlyingArray, "sortedArrayUsingComparator:", a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return -[NSArray sortedArrayWithOptions:usingComparator:]( self->_underlyingArray,  "sortedArrayWithOptions:usingComparator:",  a3,  a4);
}

- (id)array
{
  return self->_underlyingArray;
}

- (id)objectEnumerator
{
  return -[NSArray objectEnumerator](self->_underlyingArray, "objectEnumerator");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (void)getObjects:(id *)a3
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a3 == self) {
    goto LABEL_13;
  }
  unint64_t v5 = -[_PFFetchedResultOrderedSetWrapper count](self, "count");
  if (v5 != [a3 count])
  {
    LOBYTE(v13) = 0;
    return v13;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {
LABEL_13:
    LOBYTE(v13) = 1;
  }

  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v16;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(a3);
      }
      id v11 = *(id *)(*((void *)&v15 + 1) + 8 * v10);
      id v12 = -[NSArray objectAtIndex:](self->_underlyingArray, "objectAtIndex:", v8 + v10);
      if (v12 != v11)
      {
        int v13 = [v12 isEqual:v11];
        if (!v13) {
          break;
        }
      }

      if (v7 == ++v10)
      {
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v8 += v10;
        LOBYTE(v13) = 1;
        if (v7) {
          goto LABEL_5;
        }
        return v13;
      }
    }
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isNSOrderedSet];
    if (v5) {
      LOBYTE(v5) = -[_PFFetchedResultOrderedSetWrapper isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
    }
  }

  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_underlyingArray, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)allObjects
{
  return self->_underlyingArray;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  return (id)-[NSArray managedObjectIDAtIndex:](self->_underlyingArray, "managedObjectIDAtIndex:", a3);
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  return -[NSArray indexOfManagedObjectForObjectID:](self->_underlyingArray, "indexOfManagedObjectForObjectID:", a3);
}

- (id)arrayFromObjectIDs
{
  return (id)-[NSArray arrayFromObjectIDs](self->_underlyingArray, "arrayFromObjectIDs");
}

- (id)newArrayFromObjectIDs
{
  return (id)-[NSArray newArrayFromObjectIDs](self->_underlyingArray, "newArrayFromObjectIDs");
}

@end