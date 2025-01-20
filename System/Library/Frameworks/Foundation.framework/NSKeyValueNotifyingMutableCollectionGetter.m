@interface NSKeyValueNotifyingMutableCollectionGetter
- (NSKeyValueNotifyingMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 mutableCollectionGetter:(id)a5 proxyClass:(Class)a6;
- (id)mutableCollectionGetter;
- (void)dealloc;
@end

@implementation NSKeyValueNotifyingMutableCollectionGetter

- (NSKeyValueNotifyingMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 mutableCollectionGetter:(id)a5 proxyClass:(Class)a6
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableCollectionGetter;
  v7 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:]( &v9,  sel_initWithContainerClassID_key_proxyClass_,  a3,  a4,  a6);
  if (v7) {
    v7->_mutableCollectionGetter = (NSKeyValueProxyGetter *)a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueNotifyingMutableCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)mutableCollectionGetter
{
  return self->_mutableCollectionGetter;
}

@end