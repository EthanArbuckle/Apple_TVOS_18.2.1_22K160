@interface NSKeyValueSet
+ (id)_proxyShare;
- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
@end

@implementation NSKeyValueSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_2;
  if (!_proxyShare_proxyShare_2)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_2 = (uint64_t)result;
  }

  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSKeyValueSet;
  v6 = -[NSKeyValueSet init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)[a4 key];
    v6->_methods = (NSKeyValueNonmutatingSetMethodSet *)(id)[a4 methods];
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
    v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSet;
    -[NSKeyValueSet dealloc](&v3, sel_dealloc);
  }

- (unint64_t)count
{
  return (unint64_t)method_invoke(self->_container, self->_methods->count);
}

- (id)member:(id)a3
{
  return method_invoke(self->_container, self->_methods->member, a3);
}

- (id)objectEnumerator
{
  return method_invoke(self->_container, self->_methods->enumerator);
}

@end