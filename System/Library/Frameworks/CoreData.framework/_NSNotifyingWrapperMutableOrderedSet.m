@interface _NSNotifyingWrapperMutableOrderedSet
+ (Class)classForKeyedUnarchiver;
- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4;
- (BOOL)containsObject:(id)a3;
- (BOOL)intersectsOrderedSet:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (BOOL)isSubsetOfOrderedSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (_NSNotifyingWrapperMutableOrderedSet)initWithContainer:(id)a3 key:(id)a4 mutableOrderedSet:(id)a5;
- (id)_orderedObjectsAndKeys;
- (id)allObjects;
- (id)array;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)firstObject;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsPassingTest:(id)a3;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)objectsAtIndexes:(id)a3;
- (id)reverseObjectEnumerator;
- (id)reversedOrderedSet;
- (id)set;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectPassingTest:(id)a3;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSNotifyingWrapperMutableOrderedSet

- (void)dealloc
{
  self->_container = 0LL;
  self->_key = 0LL;

  self->_mutableOrderedSet = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet dealloc](&v3, sel_dealloc);
}

- (_NSNotifyingWrapperMutableOrderedSet)initWithContainer:(id)a3 key:(id)a4 mutableOrderedSet:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  v8 = -[_NSNotifyingWrapperMutableOrderedSet init](&v10, sel_init);
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_mutableOrderedSet = (NSMutableOrderedSet *)a5;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FF0]) initWithOrderedSet:self->_mutableOrderedSet copyItems:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FD0]) initWithOrderedSet:self->_mutableOrderedSet copyItems:0];
}

- (id)allObjects
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
  unint64_t v4 = MEMORY[0x1895F8858](v3);
  v7 = (char *)v10 - v6;
  if (v4 > 0x200) {
    v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - v6, 8 * v5);
  }
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v7, 0LL, v3);
  v8 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v7 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v8;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", a3);
}

- (void)getObjects:(id *)a3
{
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)-[NSMutableOrderedSet objectsAtIndexes:](self->_mutableOrderedSet, "objectsAtIndexes:", a3);
}

- (id)firstObject
{
  return (id)-[NSMutableOrderedSet firstObject](self->_mutableOrderedSet, "firstObject");
}

- (id)lastObject
{
  return (id)-[NSMutableOrderedSet lastObject](self->_mutableOrderedSet, "lastObject");
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet isEqualToOrderedSet:](self->_mutableOrderedSet, "isEqualToOrderedSet:", a3);
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:", a3);
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet intersectsOrderedSet:](self->_mutableOrderedSet, "intersectsOrderedSet:", a3);
}

- (BOOL)intersectsSet:(id)a3
{
  return -[NSMutableOrderedSet intersectsSet:](self->_mutableOrderedSet, "intersectsSet:", a3);
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return -[NSMutableOrderedSet isSubsetOfSet:](self->_mutableOrderedSet, "isSubsetOfSet:", a3);
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet isSubsetOfOrderedSet:](self->_mutableOrderedSet, "isSubsetOfOrderedSet:", a3);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableOrderedSet objectEnumerator](self->_mutableOrderedSet, "objectEnumerator");
}

- (id)reverseObjectEnumerator
{
  return (id)-[NSMutableOrderedSet reverseObjectEnumerator](self->_mutableOrderedSet, "reverseObjectEnumerator");
}

- (id)reversedOrderedSet
{
  return (id)-[NSMutableOrderedSet reversedOrderedSet](self->_mutableOrderedSet, "reversedOrderedSet");
}

- (id)array
{
  return (id)-[NSMutableOrderedSet array](self->_mutableOrderedSet, "array");
}

- (id)set
{
  return (id)-[NSMutableOrderedSet set](self->_mutableOrderedSet, "set");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectPassingTest:(id)a3
{
  return -[NSMutableOrderedSet indexOfObjectPassingTest:](self->_mutableOrderedSet, "indexOfObjectPassingTest:", a3);
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSMutableOrderedSet indexOfObjectWithOptions:passingTest:]( self->_mutableOrderedSet,  "indexOfObjectWithOptions:passingTest:",  a3,  a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSMutableOrderedSet indexOfObjectAtIndexes:options:passingTest:]( self->_mutableOrderedSet,  "indexOfObjectAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (id)indexesOfObjectsPassingTest:(id)a3
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsPassingTest:]( self->_mutableOrderedSet,  "indexesOfObjectsPassingTest:",  a3);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsWithOptions:passingTest:]( self->_mutableOrderedSet,  "indexesOfObjectsWithOptions:passingTest:",  a3,  a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]( self->_mutableOrderedSet,  "indexesOfObjectsAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:]( self->_mutableOrderedSet,  "indexOfObject:inSortedRange:options:usingComparator:",  a3,  a4.location,  a4.length,  a5,  a6);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return (id)-[NSMutableOrderedSet sortedArrayUsingComparator:]( self->_mutableOrderedSet,  "sortedArrayUsingComparator:",  a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return (id)-[NSMutableOrderedSet sortedArrayWithOptions:usingComparator:]( self->_mutableOrderedSet,  "sortedArrayWithOptions:usingComparator:",  a3,  a4);
}

- (id)description
{
  return (id)-[NSMutableOrderedSet description](self->_mutableOrderedSet, "description");
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)-[NSMutableOrderedSet descriptionWithLocale:](self->_mutableOrderedSet, "descriptionWithLocale:", a3);
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  return (id)-[NSMutableOrderedSet descriptionWithLocale:indent:]( self->_mutableOrderedSet,  "descriptionWithLocale:indent:",  a3,  a4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableOrderedSet valueForKey:](self->_mutableOrderedSet, "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  return (id)-[NSMutableOrderedSet valueForKeyPath:](self->_mutableOrderedSet, "valueForKeyPath:", a3);
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( self->_mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:")
    && -[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    int v7 = 1;
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1LL);
  }

  else
  {
    int v7 = 0;
  }

  v8 = (void *)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a4];
  -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v8,  self->_key);
  -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableOrderedSet, "insertObject:atIndex:", a3, a4);
  -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v8,  self->_key);

  if (v7) {
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0LL);
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a3];
  -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_mutableOrderedSet, "removeObjectAtIndex:", a3);
  -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if ((objc_msgSend(a4, "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:")) & 1) == 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:a3];
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  4LL,  v7,  self->_key);
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:]( self->_mutableOrderedSet,  "replaceObjectAtIndex:withObject:",  a3,  a4);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  4LL,  v7,  self->_key);
  }

- (void)addObject:(id)a3
{
  if ((-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:") & 1) == 0)
  {
    id v5 = (id)objc_msgSend( objc_alloc(MEMORY[0x1896078D0]),  "initWithIndex:",  -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v5,  self->_key);
    -[NSMutableOrderedSet insertObject:atIndex:]( self->_mutableOrderedSet,  "insertObject:atIndex:",  a3,  -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v5,  self->_key);
  }

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  MEMORY[0x1895F8858](self);
  v9 = (char *)v15 - v8;
  if (v10 >= 0x201)
  {
    v9 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v15 - v8, 8 * v7);
    if (!a4) {
      return;
    }
  }

  uint64_t v11 = 0LL;
  unint64_t v12 = a4;
  do
  {
    v13 = *a3;
    if ((-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:", *a3) & 1) == 0) {
      *(void *)&v9[8 * v11++] = v13;
    }
    ++a3;
    --v12;
  }

  while (v12);
  if (v11)
  {
    v14 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078D0]),  "initWithIndexesInRange:",  -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"),  v11);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v14,  self->_key);
    -[NSMutableOrderedSet addObjects:count:](self->_mutableOrderedSet, "addObjects:count:", v9, v11);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v14,  self->_key);
  }

  if (a4 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = MEMORY[0x1895F8858](v5);
    v9 = (char *)v10 - v8;
    if (v7 > 0x200) {
      v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v7);
    }
    objc_msgSend(a3, "getObjects:range:", v9, 0, v6);
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  if (-[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1LL);
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]( &v7,  sel_exchangeObjectAtIndex_withObjectAtIndex_,  a3,  a4);
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0LL);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]( &v7,  sel_exchangeObjectAtIndex_withObjectAtIndex_,  a3,  a4);
  }

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  if (-[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1LL);
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet moveObjectsAtIndexes:toIndex:]( &v7,  sel_moveObjectsAtIndexes_toIndex_,  a3,  a4);
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0LL);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet moveObjectsAtIndexes:toIndex:]( &v7,  sel_moveObjectsAtIndexes_toIndex_,  a3,  a4);
  }

- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", a5, a4);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v9,  self->_key);
    -[NSMutableOrderedSet insertObjects:count:atIndex:]( self->_mutableOrderedSet,  "insertObjects:count:atIndex:",  a3,  a4,  a5);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v9,  self->_key);
  }

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  if ([a3 count])
  {
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  2LL,  a4,  self->_key);
    -[NSMutableOrderedSet insertObjects:atIndexes:](self->_mutableOrderedSet, "insertObjects:atIndexes:", a3, a4);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  2LL,  a4,  self->_key);
  }

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet setObject:atIndex:](&v4, sel_setObject_atIndex_, a3, a4);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v24[128] = *MEMORY[0x1895F89C0];
  uint64_t v10 = -[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange");
  if ((_DWORD)v10) {
    BOOL v11 = length == a5;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11) {
    goto LABEL_23;
  }
  v22[1] = v22;
  MEMORY[0x1895F8858](v10);
  v14 = (const void **)((char *)v22 - v13);
  if (a5 > 0x200) {
    v14 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v22 - v13, 8 * v12);
  }
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v14, location, length);
  v15 = _PFStackAllocatorCreate(v24, 1024LL);
  v16 = CFSetCreate(v15, v14, a5, 0LL);
  v17 = v16;
  if (a5)
  {
    if (CFSetContainsValue(v16, *a4))
    {
      uint64_t v18 = 1LL;
      do
      {
        unint64_t v19 = v18;
        if (a5 == v18) {
          break;
        }
        int v20 = CFSetContainsValue(v17, a4[v18]);
        uint64_t v18 = v19 + 1;
      }

      while (v20);
      BOOL v21 = v19 < a5;
    }

    else
    {
      BOOL v21 = 1;
    }

    if (a5 >= 0x201) {
      NSZoneFree(0LL, v14);
    }
  }

  else
  {
    BOOL v21 = 0;
  }

  if (v24[3])
  {
    if (v17) {
      CFRelease(v17);
    }
    if (v21) {
      goto LABEL_23;
    }
  }

  else
  {
    v24[1] = v24[0];
    if (v21)
    {
LABEL_23:
      v23.receiver = self;
      v23.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
      -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:]( &v23,  sel_replaceObjectsInRange_withObjects_count_,  location,  length,  a4,  a5);
      return;
    }
  }

  -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1LL);
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:]( &v23,  sel_replaceObjectsInRange_withObjects_count_,  location,  length,  a4,  a5);
  -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0LL);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsAtIndexes:withObjects:]( &v4,  sel_replaceObjectsAtIndexes_withObjects_,  a3,  a4);
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", a3.location, a3.length);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v6,  self->_key);
    -[NSMutableOrderedSet removeObjectsInRange:](self->_mutableOrderedSet, "removeObjectsInRange:", location, length);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v6,  self->_key);
  }

- (void)removeObjectsAtIndexes:(id)a3
{
  if ([a3 count])
  {
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  self->_key);
    -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", a3);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  self->_key);
  }

- (void)removeAllObjects
{
  uint64_t v3 = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
  if (v3)
  {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1896078D0]), "initWithIndexesInRange:", 0, v3);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v4,  self->_key);
    -[NSMutableOrderedSet removeAllObjects](self->_mutableOrderedSet, "removeAllObjects");
    -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v4,  self->_key);
  }

- (void)removeObject:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet removeObject:](&v3, sel_removeObject_, a3);
}

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = -[NSMutableOrderedSet indexOfObject:]( self->_mutableOrderedSet,  "indexOfObject:",  *(void *)(*((void *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    if ([v5 count])
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
    }
  }

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if ([a3 indexOfObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] == 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v9 + i];
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    if ([v5 count])
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
    }
  }

- (void)minusOrderedSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = -[NSMutableOrderedSet indexOfObject:]( self->_mutableOrderedSet,  "indexOfObject:",  *(void *)(*((void *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    if ([v5 count])
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
    }
  }

- (void)unionOrderedSet:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)intersectSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
          if (([a3 containsObject:*(void *)(*((void *)&v12 + 1) + 8 * i)] & 1) == 0) {
            [v5 addIndex:v9 + i];
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    if ([v5 count])
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
    }
  }

- (void)minusSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x189607938]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mutableOrderedSet);
          }
        }

        uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( mutableOrderedSet,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        v9 += i;
      }

      while (v8);
    }

    if ([v5 count])
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:]( self->_container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:]( self->_container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->_key);
    }
  }

- (void)unionSet:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    if (v5 >= 0x201) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v9 = (char *)v10 - v8;
    if (v5 > 0x200) {
      uint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v10 - v8, 8 * v5);
    }
    [a3 getObjects:v9];
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (void)sortUsingComparator:(id)a3
{
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  BOOL v9 = -[NSManagedObject hasFaultForRelationshipNamed:](self->_container, "hasFaultForRelationshipNamed:", self->_key);
  unint64_t v27 = a4;
  id v28 = a5;
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:](v10, "setEntity:", -[NSManagedObject entity](self->_container, "entity"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v10,  "setRelationshipKeyPathsForPrefetching:",  [MEMORY[0x189603F18] arrayWithObject:self->_key]);
    -[NSFetchRequest setPredicate:]( v10,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self == %@", -[NSManagedObject objectID](self->_container, "objectID")]);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v10, "setReturnsObjectsAsFaults:", 0LL);
    -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0LL);
    if (!v10) {
      goto LABEL_34;
    }
LABEL_33:
    -[NSManagedObjectContext executeFetchRequest:error:]( -[NSManagedObject managedObjectContext](self->_container, "managedObjectContext"),  "executeFetchRequest:error:",  v10,  0LL);
    goto LABEL_34;
  }

  id v11 = -[NSManagedObject valueForKey:](self->_container, "valueForKey:", self->_key);
  unint64_t v12 = [v11 count];
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger length = v12;
  }
  if (v12)
  {
    unint64_t v13 = v12;
    v26[1] = v26;
    uint64_t v14 = v12 >= 0x201 ? 1LL : v12;
    unint64_t v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v16 = (char *)v26 - v15;
    if (v12 > 0x200) {
      uint64_t v16 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v26 - v15, 8 * v12);
    }
    [v11 getObjects:v16];
    if (location >= v13 + location)
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = 8 * location;
      unint64_t v19 = v13;
      do
      {
        int v20 = *(_DWORD **)&v16[v18];
        int v21 = (v20[4] >> 15) & 7;
        if (v21) {
          BOOL v22 = v21 == 5;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          objc_super v23 = (void *)[v20 objectID];
          char v24 = [v23 isTemporaryID];
          if ((v24 & 1) == 0) {
            *(void *)&v16[8 * v17++] = v23;
          }
        }

        v18 += 8LL;
        --v19;
      }

      while (v19);
      if (v17) {
        uint64_t v17 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v16 count:v17];
      }
    }

    if (v13 >= 0x201) {
      NSZoneFree(0LL, v16);
    }
    if ([(id)v17 count])
    {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      -[NSFetchRequest setEntity:]( v10,  "setEntity:",  objc_msgSend( -[NSDictionary objectForKey:]( -[NSEntityDescription relationshipsByName]( -[NSManagedObject entity](self->_container, "entity"),  "relationshipsByName"),  "objectForKey:",  self->_key),  "destinationEntity"));
      -[NSFetchRequest setPredicate:]( v10,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", v17]);
      -[NSFetchRequest setReturnsObjectsAsFaults:](v10, "setReturnsObjectsAsFaults:", 0LL);
      -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0LL);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    if (v10) {
      goto LABEL_33;
    }
  }

- (id)_orderedObjectsAndKeys
{
  return (id)-[NSMutableOrderedSet _orderedObjectsAndKeys](self->_mutableOrderedSet, "_orderedObjectsAndKeys");
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  return -[NSMutableOrderedSet _reorderObjectsToLocationsByOrderKey:error:]( self->_mutableOrderedSet,  "_reorderObjectsToLocationsByOrderKey:error:",  a3,  a4);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end