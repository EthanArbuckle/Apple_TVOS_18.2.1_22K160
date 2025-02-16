@interface NSKeyValueSlowMutableSet
- (id)_createMutableSetValueWithSelector:(SEL)a3;
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)_setValueWithSelector:(SEL)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)_raiseNilValueExceptionWithSelector:(SEL)a3;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSKeyValueSlowMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSlowMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0LL;
  self->_valueSetter = 0LL;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: value for key %@ of object %p is nil", _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0 reason userInfo];
  objc_exception_throw(v3);
  -[NSKeyValueSlowMutableSet _setValueWithSelector:](v4, v5, v6);
}

- (id)_setValueWithSelector:(SEL)a3
{
  SEL v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5 && !self->_treatNilValuesLikeEmptySets) {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  }
  return v5;
}

- (unint64_t)count
{
  return objc_msgSend(-[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2), "count");
}

- (id)member:(id)a3
{
  return (id)objc_msgSend( -[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2),  "member:",  a3);
}

- (id)objectEnumerator
{
  id v2 = -[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2);
  if (v2) {
    return (id)[v2 objectEnumerator];
  }
  else {
    return objc_alloc_init(&OBJC_CLASS___NSKeyValueNilSetEnumerator);
  }
}

- (id)_createMutableSetValueWithSelector:(SEL)a3
{
  SEL v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5 && !self->_treatNilValuesLikeEmptySets) {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  }
  return (id)[v5 mutableCopy];
}

- (void)addObject:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:]( self,  "_createMutableSetValueWithSelector:",  a2,  a3,  *MEMORY[0x1895F89C0]);
  if (v5)
  {
    SEL v6 = v5;
    [v5 addObject:a3];
  }

  else
  {
    SEL v6 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:&v7 count:1];
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

- (void)addObjectsFromArray:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    id v6 = v5;
    [v5 addObjectsFromArray:a3];
  }

  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

- (void)intersectSet:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    id v6 = v5;
    [v5 intersectSet:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }

- (void)minusSet:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    id v6 = v5;
    [v5 minusSet:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }

- (void)removeAllObjects
{
  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter))
  {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }

  id v4 = objc_alloc_init(MEMORY[0x189604010]);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v4);
}

- (void)removeObject:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    id v6 = v5;
    [v5 removeObject:a3];
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
  }

- (void)setSet:(id)a3
{
  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter))
  {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)a3);
}

- (void)unionSet:(id)a3
{
  id v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    id v6 = v5;
    [v5 unionSet:a3];
  }

  else
  {
    id v6 = (id)[a3 mutableCopy];
  }

  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);
}

@end