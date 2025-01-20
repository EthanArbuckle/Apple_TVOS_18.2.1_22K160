@interface _NSNotifyingWrapperMutableSet
+ (Class)classForKeyedUnarchiver;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (_NSNotifyingWrapperMutableSet)initWithContainer:(id)a3 key:(id)a4 mutableSet:(id)a5;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)intersectSet:(id)a3;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)unionSet:(id)a3;
@end

@implementation _NSNotifyingWrapperMutableSet

- (void)dealloc
{
  self->_container = 0LL;
  self->_key = 0LL;

  self->_mutableSet = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableSet;
  -[_NSNotifyingWrapperMutableSet dealloc](&v3, sel_dealloc);
}

- (_NSNotifyingWrapperMutableSet)initWithContainer:(id)a3 key:(id)a4 mutableSet:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSNotifyingWrapperMutableSet;
  v8 = -[_NSNotifyingWrapperMutableSet init](&v10, sel_init);
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)[a4 copy];
    v8->_mutableSet = (NSMutableSet *)a5;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189604010]) initWithSet:self->_mutableSet copyItems:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:self->_mutableSet copyItems:0];
}

- (id)description
{
  return (id)-[NSMutableSet description](self->_mutableSet, "description");
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)-[NSMutableSet descriptionWithLocale:](self->_mutableSet, "descriptionWithLocale:", a3);
}

- (id)allObjects
{
  return (id)-[NSMutableSet allObjects](self->_mutableSet, "allObjects");
}

- (id)anyObject
{
  return (id)-[NSMutableSet anyObject](self->_mutableSet, "anyObject");
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableSet containsObject:](self->_mutableSet, "containsObject:", a3);
}

- (BOOL)isEqualToSet:(id)a3
{
  return -[NSMutableSet isEqualToSet:](self->_mutableSet, "isEqualToSet:", a3);
}

- (void)getObjects:(id *)a3
{
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return -[NSMutableSet isSubsetOfSet:](self->_mutableSet, "isSubsetOfSet:", a3);
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableSet valueForKey:](self->_mutableSet, "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  return (id)-[NSMutableSet valueForKeyPath:](self->_mutableSet, "valueForKeyPath:", a3);
}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_mutableSet, "count");
}

- (id)member:(id)a3
{
  return (id)-[NSMutableSet member:](self->_mutableSet, "member:", a3);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableSet objectEnumerator](self->_mutableSet, "objectEnumerator");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableSet countByEnumeratingWithState:objects:count:]( self->_mutableSet,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)-[NSMutableSet objectsWithOptions:passingTest:]( self->_mutableSet,  "objectsWithOptions:passingTest:",  a3,  a4);
}

- (void)addObject:(id)a3
{
  id v5 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v5 count:1];
  -[NSManagedObject willChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  1LL,  v4);
  -[NSMutableSet addObject:](self->_mutableSet, "addObject:", v5);
  -[NSManagedObject didChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  1LL,  v4);
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x189604010]) initWithArray:a3];
  -[NSManagedObject willChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  1LL,  v5);
  -[NSMutableSet addObjectsFromArray:](self->_mutableSet, "addObjectsFromArray:", a3);
  -[NSManagedObject didChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  1LL,  v5);
}

- (void)intersectSet:(id)a3
{
}

- (void)minusSet:(id)a3
{
}

- (void)removeAllObjects
{
  uint64_t v3 = NSSet_EmptySet;
  -[NSManagedObject willChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  3LL,  NSSet_EmptySet);
  -[NSMutableSet removeAllObjects](self->_mutableSet, "removeAllObjects");
  -[NSManagedObject didChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  3LL,  v3);
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v5 count:1];
  -[NSManagedObject willChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  2LL,  v4);
  -[NSMutableSet removeObject:](self->_mutableSet, "removeObject:", v5);
  -[NSManagedObject didChangeValueForKey:withSetMutation:usingObjects:]( self->_container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->_key,  2LL,  v4);
}

- (void)setSet:(id)a3
{
}

- (void)unionSet:(id)a3
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

@end