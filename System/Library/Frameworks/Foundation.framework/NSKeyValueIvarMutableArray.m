@interface NSKeyValueIvarMutableArray
- (id)_nonNilMutableArrayValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)_raiseNilValueExceptionWithSelector:(SEL)a3;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueIvarMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueIvarMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = [a4 ivar];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueIvarMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_ivar = 0LL;
}

- (unint64_t)count
{
  return [*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)) count];
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v3);
  -[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](v4, v5, v6);
}

- (id)_nonNilMutableArrayValueWithSelector:(SEL)a3
{
  container = self->super._container;
  SEL v6 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));
  if (!v6) {
    -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  }
  return v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend( -[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:]( self,  "_nonNilMutableArrayValueWithSelector:",  a2),  "objectAtIndex:",  a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend( -[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:]( self,  "_nonNilMutableArrayValueWithSelector:",  a2),  "objectsAtIndexes:",  a3);
}

- (void)addObject:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = a3;
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  SEL v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6) {
    [v6 addObject:a3];
  }
  else {
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v7 count:1];
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = a3;
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    [v10 insertObject:a3 atIndex:a4];
  }

  else
  {
    if (a4) {
      -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:]( self,  "_raiseNilValueExceptionWithSelector:",  a2,  v11[0]);
    }
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v11 count:1];
  }

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    [v10 insertObjects:a3 atIndexes:a4];
    return;
  }

  if (!a3 || !a4)
  {
    v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15 = @"passed-in array";
    if (a3) {
      v15 = @"index set";
    }
    v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: the %@ must not be nil.",  v14,  v15,  v19);
    goto LABEL_14;
  }

  unint64_t v11 = [a3 count];
  uint64_t v12 = [a4 count];
  if (v11 != v12)
  {
    v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: the counts of the passed-in array (%lu) and index set (%lu) must be identical.",  _NSMethodExceptionProem((objc_class *)self, a2),  v11,  v12);
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v16 userInfo:0]);
    -[NSKeyValueIvarMutableArray removeLastObject](v17, v18);
    return;
  }

  unint64_t v13 = [a4 lastIndex];
  if (v13 < v11 || v13 == 0x7FFFFFFFFFFFFFFFLL) {
    *(Class *)((char *)&container->isa + Offset) = (Class)[a3 mutableCopy];
  }
  else {
    -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }
}

- (void)removeLastObject
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)removeObjectsAtIndexes:(id)a3
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
}

@end