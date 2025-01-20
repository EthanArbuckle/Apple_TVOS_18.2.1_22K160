@interface NSKeyValueNotifyingMutableArray
+ (id)_proxyShare;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueNotifyingMutableArray

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_88;
  if (!_proxyShare_proxyShare_88)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_88 = (uint64_t)result;
  }

  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutableArray = 0LL;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_mutableArray, "count");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mutableArray, "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)-[NSMutableArray objectsAtIndexes:](self->_mutableArray, "objectsAtIndexes:", a3);
}

- (void)addObject:(id)a3
{
  v5 = -[NSIndexSet initWithIndex:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndex:",  -[NSMutableArray count](self->_mutableArray, "count"));
  -[NSObject willChange:valuesAtIndexes:forKey:]( self->super._container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v5,  self->super._key);
  -[NSMutableArray addObject:](self->_mutableArray, "addObject:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:]( self->super._container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v5,  self->super._key);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v7 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a4);
  -[NSObject willChange:valuesAtIndexes:forKey:]( self->super._container,  "willChange:valuesAtIndexes:forKey:",  2LL,  v7,  self->super._key);
  -[NSMutableArray insertObject:atIndex:](self->_mutableArray, "insertObject:atIndex:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:]( self->super._container,  "didChange:valuesAtIndexes:forKey:",  2LL,  v7,  self->super._key);
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
}

- (void)removeLastObject
{
  objc_super v3 = -[NSIndexSet initWithIndex:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndex:",  -[NSMutableArray count](self->_mutableArray, "count") - 1);
  -[NSObject willChange:valuesAtIndexes:forKey:]( self->super._container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v3,  self->super._key);
  -[NSMutableArray removeLastObject](self->_mutableArray, "removeLastObject");
  -[NSObject didChange:valuesAtIndexes:forKey:]( self->super._container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v3,  self->super._key);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v5 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:]( self->super._container,  "willChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->super._key);
  -[NSMutableArray removeObjectAtIndex:](self->_mutableArray, "removeObjectAtIndex:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:]( self->super._container,  "didChange:valuesAtIndexes:forKey:",  3LL,  v5,  self->super._key);
}

- (void)removeObjectsAtIndexes:(id)a3
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v7 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:]( self->super._container,  "willChange:valuesAtIndexes:forKey:",  4LL,  v7,  self->super._key);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableArray, "replaceObjectAtIndex:withObject:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:]( self->super._container,  "didChange:valuesAtIndexes:forKey:",  4LL,  v7,  self->super._key);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
}

@end