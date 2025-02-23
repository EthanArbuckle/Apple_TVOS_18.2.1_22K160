@interface _NSFaultingMutableArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isFault;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_NSFaultingMutableArray)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)turnIntoFault;
- (void)willRead;
@end

@implementation _NSFaultingMutableArray

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

- (_NSFaultingMutableArray)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____NSFaultingMutableArray;
  v8 = -[_NSFaultingMutableArray init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    v8->_relationship = (NSPropertyDescription *)a4;
    if (v5)
    {
      v10 = 0LL;
      v9->_flags = (_NSFaultingMutableArrayFlags)1;
    }

    else
    {
      v8->_flags = 0;
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    }

    v9->_realArray = v10;
  }

  return v9;
}

- (void)dealloc
{
  self->_realArray = 0LL;
  self->_source = 0LL;
  self->_relationship = 0LL;
  _PFDeallocateObject(self);
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    source = self->_source;
    if (source) {
      uint64_t v5 = _insertion_fault_handler;
    }
    else {
      uint64_t v5 = 0LL;
    }
    v6 = (NSMutableArray *)-[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:]( v5,  source,  self->_relationship,  (uint64_t)v3);
    self->_realArray = v6;
    if (!v6) {
      self->_realArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    }
    *(_DWORD *)&self->_flags &= ~1u;
  }

- (void)turnIntoFault
{
  self->_realArray = 0LL;
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (NSPropertyDescription)relationship
{
  return self->_relationship;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSFaultingMutableArrayFlags flags = self->_flags;
  uint64_t v5 = objc_alloc(&OBJC_CLASS____NSFaultingMutableArray);
  source = self->_source;
  relationship = self->_relationship;
  if ((*(_BYTE *)&flags & 1) != 0) {
    return -[_NSFaultingMutableArray initWithSource:forRelationship:asFault:]( v5,  "initWithSource:forRelationship:asFault:",  source,  relationship,  1LL);
  }
  v8 = -[_NSFaultingMutableArray initWithSource:forRelationship:asFault:]( v5,  "initWithSource:forRelationship:asFault:",  source,  relationship,  0LL);
  [v8[2] setArray:self->_realArray];
  return v8;
}

- (id)description
{
  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v4];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray description](self->_realArray, "description")];
  }
}

- (id)descriptionWithLocale:(id)a3
{
  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v5];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray descriptionWithLocale:](self->_realArray, "descriptionWithLocale:", a3)];
  }
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    return (id)[NSString stringWithFormat:@"Relationship fault for %@ on %p", self->_relationship, source, v6];
  }
  else {
    return (id)[NSString stringWithFormat:@"Relationship objects for %@ on %p: %@", self->_relationship, source, -[NSMutableArray descriptionWithLocale:indent:]( self->_realArray, "descriptionWithLocale:indent:", a3, a4)];
  }
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_realArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_realArray, "objectAtIndex:", a3);
}

- (void)addObject:(id)a3
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:]( self->_realArray,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSMutableArray indexOfObjectWithOptions:passingTest:]( self->_realArray,  "indexOfObjectWithOptions:passingTest:",  a3,  a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSMutableArray indexOfObjectAtIndexes:options:passingTest:]( self->_realArray,  "indexOfObjectAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)-[NSMutableArray indexesOfObjectsWithOptions:passingTest:]( self->_realArray,  "indexesOfObjectsWithOptions:passingTest:",  a3,  a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return (id)-[NSMutableArray indexesOfObjectsAtIndexes:options:passingTest:]( self->_realArray,  "indexesOfObjectsAtIndexes:options:passingTest:",  a3,  a4,  a5);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableArray objectEnumerator](self->_realArray, "objectEnumerator");
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeLastObject
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
}

- (void)getObjects:(id *)a3
{
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableArray valueForKey:](self->_realArray, "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  return (id)-[NSMutableArray valueForKeyPath:](self->_realArray, "valueForKeyPath:", a3);
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