@interface NSKeyValueProxyShareKey
+ (id)_proxyShare;
- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
@end

@implementation NSKeyValueProxyShareKey

- ($BE6DA7DC804DE854DC479AEF954E6BB9)_proxyLocator
{
  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

+ (id)_proxyShare
{
  return 0LL;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  return 0LL;
}

@end