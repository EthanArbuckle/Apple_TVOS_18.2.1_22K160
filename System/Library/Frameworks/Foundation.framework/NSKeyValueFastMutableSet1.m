@interface NSKeyValueFastMutableSet1
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
@end

@implementation NSKeyValueFastMutableSet1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet1;
  v5 = -[NSKeyValueFastMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 nonmutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet1;
  -[NSKeyValueFastMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_nonmutatingMethods = 0LL;
}

- (unint64_t)count
{
  return (unint64_t)method_invoke(self->super.super._container, self->_nonmutatingMethods->count);
}

- (id)member:(id)a3
{
  return method_invoke(self->super.super._container, self->_nonmutatingMethods->member, a3);
}

- (id)objectEnumerator
{
  return method_invoke(self->super.super._container, self->_nonmutatingMethods->enumerator);
}

@end