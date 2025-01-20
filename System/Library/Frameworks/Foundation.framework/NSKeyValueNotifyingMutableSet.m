@interface NSKeyValueNotifyingMutableSet
+ (id)_proxyShare;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSKeyValueNotifyingMutableSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_75;
  if (!_proxyShare_proxyShare_75)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_75 = (uint64_t)result;
  }

  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
  v6 = v5;
  if (v5) {
    v5[3] = _NSGetProxyValueWithGetterNoLock(v5[1], (void *)[a4 mutableCollectionGetter]);
  }
  return v6;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutableSet = 0LL;
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

- (void)addObject:(id)a3
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v5 count:1];
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  1LL,  v4);
  -[NSMutableSet addObject:](self->_mutableSet, "addObject:", v5[0]);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  1LL,  v4);
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x189604010]) initWithArray:a3];
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  1LL,  v5);
  -[NSMutableSet addObjectsFromArray:](self->_mutableSet, "addObjectsFromArray:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  1LL,  v5);
}

- (void)intersectSet:(id)a3
{
}

- (void)minusSet:(id)a3
{
}

- (void)removeAllObjects
{
  uint64_t v3 = [MEMORY[0x189604010] set];
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  3LL,  v3);
  -[NSMutableSet removeAllObjects](self->_mutableSet, "removeAllObjects");
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  3LL,  v3);
}

- (void)removeObject:(id)a3
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v5 count:1];
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "willChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  2LL,  v4);
  -[NSMutableSet removeObject:](self->_mutableSet, "removeObject:", v5[0]);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:]( self->super._container,  "didChangeValueForKey:withSetMutation:usingObjects:",  self->super._key,  2LL,  v4);
}

- (void)setSet:(id)a3
{
}

- (void)unionSet:(id)a3
{
}

@end