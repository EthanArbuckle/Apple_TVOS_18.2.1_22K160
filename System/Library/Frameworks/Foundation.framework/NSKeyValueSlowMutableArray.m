@interface NSKeyValueSlowMutableArray
- (id)_createNonNilMutableArrayValueWithSelector:(SEL)a3;
- (id)_nonNilArrayValueWithSelector:(SEL)a3;
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

@implementation NSKeyValueSlowMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
  {
    v5[3] = (id)[a4 baseGetter];
    v5[4] = (id)[a4 baseSetter];
    *((_BYTE *)v5 + 40) = [a4 treatNilValuesLikeEmptyCollections];
  }

  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0LL;
  self->_valueSetter = 0LL;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  if (self->_treatNilValuesLikeEmptyArrays) {
    objc_super v3 = (void *)MEMORY[0x189603B40];
  }
  else {
    objc_super v3 = (void *)MEMORY[0x189603A58];
  }
  uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*v3, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v4);
  -[NSKeyValueSlowMutableArray count](v5, v6);
}

- (unint64_t)count
{
  uint64_t v4 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v4 && !self->_treatNilValuesLikeEmptyArrays) {
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }
  return [v4 count];
}

- (id)_nonNilArrayValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5) {
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  }
  return v5;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend( -[NSKeyValueSlowMutableArray _nonNilArrayValueWithSelector:](self, "_nonNilArrayValueWithSelector:", a2),  "objectAtIndex:",  a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend( -[NSKeyValueSlowMutableArray _nonNilArrayValueWithSelector:](self, "_nonNilArrayValueWithSelector:", a2),  "objectsAtIndexes:",  a3);
}

- (void)addObject:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  SEL v6 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (v6)
  {
    objc_super v7 = (void *)objc_msgSend(v6, "mutableCopy", v8, v9);
    [v7 addObject:a3];
  }

  else
  {
    if (!self->_treatNilValuesLikeEmptyArrays) {
      -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:]( self,  "_raiseNilValueExceptionWithSelector:",  a2,  v8,  v9);
    }
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:&v8 count:1];
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (v8)
  {
    uint64_t v9 = (void *)objc_msgSend(v8, "mutableCopy", v10, v11);
    [v9 insertObject:a3 atIndex:a4];
  }

  else
  {
    if (a4 || !self->_treatNilValuesLikeEmptyArrays) {
      -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:]( self,  "_raiseNilValueExceptionWithSelector:",  a2,  v10,  v11);
    }
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:&v10 count:1];
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v9);
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  id v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (v8)
  {
    id v19 = (id)[v8 mutableCopy];
    [v19 insertObjects:a3 atIndexes:a4];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v19);
LABEL_11:

    return;
  }

  if (!self->_treatNilValuesLikeEmptyArrays)
  {
LABEL_9:
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
    id v19 = 0LL;
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, 0LL);
    goto LABEL_11;
  }

  if (a3 && a4)
  {
    unint64_t v9 = [a3 count];
    uint64_t v10 = [a4 count];
    if (v9 == v10)
    {
      unint64_t v11 = [a4 lastIndex];
      if (v11 < v9 || v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = (id)[a3 mutableCopy];
        _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v19);
        goto LABEL_11;
      }

      goto LABEL_9;
    }

    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: the counts of the passed-in array (%lu) and index set (%lu) must be identical.",  _NSMethodExceptionProem((objc_class *)self, a2),  v9,  v10);
  }

  else
  {
    v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13 = @"passed-in array";
    if (a3) {
      v13 = @"index set";
    }
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: the %@ must not be nil.",  v12,  v13,  v18);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
  -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](v15, v16, v17);
}

- (id)_createNonNilMutableArrayValueWithSelector:(SEL)a3
{
  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5) {
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  }
  return (id)[v5 mutableCopy];
}

- (void)removeLastObject
{
  id v3 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:]( self,  "_createNonNilMutableArrayValueWithSelector:",  a2);
  [v3 removeLastObject];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v3);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:]( self,  "_createNonNilMutableArrayValueWithSelector:",  a2);
  [v5 removeObjectAtIndex:a3];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:]( self,  "_createNonNilMutableArrayValueWithSelector:",  a2);
  [v5 removeObjectsAtIndexes:a3];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v7 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:]( self,  "_createNonNilMutableArrayValueWithSelector:",  a2);
  [v7 replaceObjectAtIndex:a3 withObject:a4];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  id v7 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:]( self,  "_createNonNilMutableArrayValueWithSelector:",  a2);
  [v7 replaceObjectsAtIndexes:a3 withObjects:a4];
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);
}

@end