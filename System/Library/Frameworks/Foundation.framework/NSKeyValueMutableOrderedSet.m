@interface NSKeyValueMutableOrderedSet
+ (id)_proxyShare;
- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (void)_proxyNonGCFinalize;
- (void)dealloc;
@end

@implementation NSKeyValueMutableOrderedSet

+ (id)_proxyShare
{
  id result = (id)_proxyShare_proxyShare_3;
  if (!_proxyShare_proxyShare_3)
  {
    id result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_3 = (uint64_t)result;
  }

  return result;
}

- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSKeyValueMutableOrderedSet;
  v6 = -[NSKeyValueMutableOrderedSet init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)objc_msgSend((id)objc_msgSend(a4, "key"), "copy");
  }

  return v6;
}

- (void)_proxyNonGCFinalize
{
  self->_container = 0LL;
  self->_key = 0LL;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___NSKeyValueMutableOrderedSet;
    -[NSKeyValueMutableOrderedSet dealloc](&v3, sel_dealloc);
  }

@end