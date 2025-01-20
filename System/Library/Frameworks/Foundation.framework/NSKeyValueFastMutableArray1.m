@interface NSKeyValueFastMutableArray1
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSKeyValueFastMutableArray1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray1;
  v5 = -[NSKeyValueFastMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[4] = (id)[a4 nonmutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray1;
  -[NSKeyValueFastMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_nonmutatingMethods = 0LL;
}

- (unint64_t)count
{
  return (unint64_t)method_invoke(self->super.super._container, self->_nonmutatingMethods->count);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  getObjectsRange = self->_nonmutatingMethods->getObjectsRange;
  if (getObjectsRange)
  {
    method_invoke(self->super.super._container, getObjectsRange, a3, a4.location, a4.length);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray1;
    -[NSKeyValueFastMutableArray1 getObjects:range:](&v5, sel_getObjects_range_, a3, a4.location, a4.length);
  }

- (id)objectAtIndex:(unint64_t)a3
{
  objectAtIndex = self->_nonmutatingMethods->objectAtIndex;
  if (objectAtIndex) {
    return method_invoke(self->super.super._container, objectAtIndex, a3);
  }
  uint64_t v6 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
  id v7 = method_invoke(self->super.super._container, self->_nonmutatingMethods->objectsAtIndexes, v6);

  return (id)[v7 objectAtIndex:0];
}

- (id)objectsAtIndexes:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objectsAtIndexes = self->_nonmutatingMethods->objectsAtIndexes;
  if (objectsAtIndexes) {
    return method_invoke(self->super.super._container, objectsAtIndexes, a3);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray1;
  return -[NSKeyValueFastMutableArray1 objectsAtIndexes:](&v5, sel_objectsAtIndexes_, a3);
}

@end