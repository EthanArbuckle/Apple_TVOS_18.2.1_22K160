@interface NSKeyValueOrderedSet
+ (id)_proxyShare;
- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueOrderedSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_4;
  if (!_proxyShare_proxyShare_4)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_4 = (uint64_t)result;
  }

  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSKeyValueOrderedSet;
  v6 = -[NSKeyValueOrderedSet init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)[a4 key];
    v6->_methods = (NSKeyValueNonmutatingOrderedSetMethodSet *)(id)[a4 methods];
  }

  return v6;
}

- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (void)_proxyNonGCFinalize
{
  self->_container = 0LL;
  self->_key = 0LL;
  self->_methods = 0LL;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___NSKeyValueOrderedSet;
    -[NSKeyValueOrderedSet dealloc](&v3, sel_dealloc);
  }

- (unint64_t)count
{
  return (unint64_t)method_invoke(self->_container, self->_methods->count);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  getObjectsRange = self->_methods->getObjectsRange;
  if (getObjectsRange)
  {
    method_invoke(self->_container, getObjectsRange, a3, a4.location, a4.length);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSKeyValueOrderedSet;
    -[NSKeyValueOrderedSet getObjects:range:](&v5, sel_getObjects_range_, a3, a4.location, a4.length);
  }

- (unint64_t)indexOfObject:(id)a3
{
  return (unint64_t)method_invoke(self->_container, self->_methods->indexOfObject, a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  objectAtIndex = self->_methods->objectAtIndex;
  if (objectAtIndex) {
    return method_invoke(self->_container, objectAtIndex, a3);
  }
  uint64_t v6 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
  id v7 = method_invoke(self->_container, self->_methods->objectsAtIndexes, v6);

  return (id)[v7 objectAtIndex:0];
}

- (id)objectsAtIndexes:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objectsAtIndexes = self->_methods->objectsAtIndexes;
  if (objectsAtIndexes) {
    return method_invoke(self->_container, objectsAtIndexes, a3);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSKeyValueOrderedSet;
  return -[NSKeyValueOrderedSet objectsAtIndexes:](&v5, sel_objectsAtIndexes_, a3);
}

@end