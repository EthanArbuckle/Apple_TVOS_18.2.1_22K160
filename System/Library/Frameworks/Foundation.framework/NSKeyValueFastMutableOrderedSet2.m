@interface NSKeyValueFastMutableOrderedSet2
- (id)_nonNilOrderedSetValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)_proxyNonGCFinalize;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueFastMutableOrderedSet2

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableOrderedSet2;
  v5 = -[NSKeyValueFastMutableOrderedSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 baseGetter];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableOrderedSet2;
  -[NSKeyValueFastMutableOrderedSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0LL;
}

- (id)_nonNilOrderedSetValueWithSelector:(SEL)a3
{
  id result = (id)_NSGetUsingKeyValueGetter((uint64_t)self->super.super._container, (uint64_t)self->_valueGetter);
  if (!result)
  {
    v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super.super._key, self->super.super._container), 0 reason userInfo];
    objc_exception_throw(v6);
    return (id)-[NSKeyValueFastMutableOrderedSet2 count](v7, v8);
  }

  return result;
}

- (unint64_t)count
{
  return objc_msgSend( -[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:]( self,  "_nonNilOrderedSetValueWithSelector:",  a2),  "count");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (unint64_t)indexOfObject:(id)a3
{
  return objc_msgSend( -[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:]( self,  "_nonNilOrderedSetValueWithSelector:",  a2),  "indexOfObject:",  a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend( -[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:]( self,  "_nonNilOrderedSetValueWithSelector:",  a2),  "objectAtIndex:",  a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend( -[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:]( self,  "_nonNilOrderedSetValueWithSelector:",  a2),  "objectsAtIndexes:",  a3);
}

@end