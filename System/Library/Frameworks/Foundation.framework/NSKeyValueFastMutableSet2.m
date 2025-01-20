@interface NSKeyValueFastMutableSet2
- (id)_nonNilSetValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
@end

@implementation NSKeyValueFastMutableSet2

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet2;
  v5 = -[NSKeyValueFastMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 baseGetter];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet2;
  -[NSKeyValueFastMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0LL;
}

- (id)_nonNilSetValueWithSelector:(SEL)a3
{
  id result = (id)_NSGetUsingKeyValueGetter((uint64_t)self->super.super._container, (uint64_t)self->_valueGetter);
  if (!result)
  {
    v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super.super._key, self->super.super._container), 0 reason userInfo];
    objc_exception_throw(v6);
    return (id)-[NSKeyValueFastMutableSet2 count](v7, v8);
  }

  return result;
}

- (unint64_t)count
{
  return objc_msgSend( -[NSKeyValueFastMutableSet2 _nonNilSetValueWithSelector:](self, "_nonNilSetValueWithSelector:", a2),  "count");
}

- (id)member:(id)a3
{
  return (id)objc_msgSend( -[NSKeyValueFastMutableSet2 _nonNilSetValueWithSelector:](self, "_nonNilSetValueWithSelector:", a2),  "member:",  a3);
}

- (id)objectEnumerator
{
  return (id)objc_msgSend( -[NSKeyValueFastMutableSet2 _nonNilSetValueWithSelector:](self, "_nonNilSetValueWithSelector:", a2),  "objectEnumerator");
}

@end