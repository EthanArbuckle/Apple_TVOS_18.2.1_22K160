@interface NSKeyValueSlowMutableCollectionGetter
- (BOOL)treatNilValuesLikeEmptyCollections;
- (NSKeyValueSlowMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 baseGetter:(id)a5 baseSetter:(id)a6 containerIsa:(Class)a7 proxyClass:(Class)a8;
- (id)baseGetter;
- (id)baseSetter;
- (void)dealloc;
@end

@implementation NSKeyValueSlowMutableCollectionGetter

- (NSKeyValueSlowMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 baseGetter:(id)a5 baseSetter:(id)a6 containerIsa:(Class)a7 proxyClass:(Class)a8
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableCollectionGetter;
  v13 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:]( &v17,  sel_initWithContainerClassID_key_proxyClass_,  a3,  a4,  a8);
  if (v13)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v14 = -[NSKeyValueSlowGetter initWithContainerClassID:key:containerIsa:]( objc_alloc(&OBJC_CLASS___NSKeyValueSlowGetter),  "initWithContainerClassID:key:containerIsa:",  a3,  a4,  a7);
    }
    else {
      v14 = (NSKeyValueSlowGetter *)a5;
    }
    v13->_baseGetter = &v14->super;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v15 = -[NSKeyValueSlowSetter initWithContainerClassID:key:containerIsa:]( objc_alloc(&OBJC_CLASS___NSKeyValueSlowSetter),  "initWithContainerClassID:key:containerIsa:",  a3,  a4,  a7);
    }
    else {
      v15 = (NSKeyValueSlowSetter *)a6;
    }
    v13->_baseSetter = &v15->super;
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)baseGetter
{
  return self->_baseGetter;
}

- (id)baseSetter
{
  return self->_baseSetter;
}

- (BOOL)treatNilValuesLikeEmptyCollections
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char isKindOfClass = 1;
  }

  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end