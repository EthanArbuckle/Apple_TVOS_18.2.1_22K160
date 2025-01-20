@interface NSKeyValueCollectionGetter
- (NSKeyValueCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 methods:(id)a5 proxyClass:(Class)a6;
- (id)methods;
- (void)dealloc;
@end

@implementation NSKeyValueCollectionGetter

- (NSKeyValueCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 methods:(id)a5 proxyClass:(Class)a6
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSKeyValueCollectionGetter;
  v7 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:]( &v9,  sel_initWithContainerClassID_key_proxyClass_,  a3,  a4,  a6);
  if (v7) {
    v7->_methods = (NSKeyValueNonmutatingCollectionMethodSet *)a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)methods
{
  return self->_methods;
}

@end