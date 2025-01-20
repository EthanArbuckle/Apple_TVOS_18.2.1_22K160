@interface NSKeyValueFastMutableArray
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4;
@end

@implementation NSKeyValueFastMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = (id)[a4 mutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutatingMethods = 0LL;
}

- (void)addObject:(id)a3
{
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v10[1] = *MEMORY[0x1895F89C0];
  v10[0] = a3;
  insertObjectAtIndex = self->_mutatingMethods->insertObjectAtIndex;
  if (insertObjectAtIndex)
  {
    method_invoke(self->super._container, insertObjectAtIndex, a3, a4);
  }

  else
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v10 count:1];
    uint64_t v8 = objc_alloc(&OBJC_CLASS___NSIndexSet);
    v9 = -[NSIndexSet initWithIndex:](v8, "initWithIndex:", a4, v10[0]);
    method_invoke(self->super._container, self->_mutatingMethods->insertObjectsAtIndexes, v7, v9);
  }

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  insertObjectsAtIndexes = self->_mutatingMethods->insertObjectsAtIndexes;
  if (insertObjectsAtIndexes)
  {
    method_invoke(self->super._container, insertObjectsAtIndexes, a3, a4);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray insertObjects:atIndexes:](&v5, sel_insertObjects_atIndexes_, a3, a4);
  }

- (void)removeLastObject
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  removeObjectAtIndex = self->_mutatingMethods->removeObjectAtIndex;
  if (removeObjectAtIndex)
  {
    method_invoke(self->super._container, removeObjectAtIndex, a3);
  }

  else
  {
    objc_super v5 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
    method_invoke(self->super._container, self->_mutatingMethods->removeObjectsAtIndexes, v5);
  }

- (void)removeObjectsAtIndexes:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  removeObjectsAtIndexes = self->_mutatingMethods->removeObjectsAtIndexes;
  if (removeObjectsAtIndexes)
  {
    method_invoke(self->super._container, removeObjectsAtIndexes, a3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray removeObjectsAtIndexes:](&v4, sel_removeObjectsAtIndexes_, a3);
  }

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = a4;
  mutatingMethods = self->_mutatingMethods;
  replaceObjectAtIndex = mutatingMethods->replaceObjectAtIndex;
  if (replaceObjectAtIndex)
  {
    method_invoke(self->super._container, replaceObjectAtIndex, a3, a4);
  }

  else if (mutatingMethods->replaceObjectsAtIndexes)
  {
    v9 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3, v11[0]);
    v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v11 count:1];
    method_invoke(self->super._container, self->_mutatingMethods->replaceObjectsAtIndexes, v9, v10);
  }

  else
  {
    -[NSKeyValueFastMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3, v11[0]);
    -[NSKeyValueFastMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a4, a3);
  }

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  replaceObjectsAtIndexes = self->_mutatingMethods->replaceObjectsAtIndexes;
  if (replaceObjectsAtIndexes)
  {
    method_invoke(self->super._container, replaceObjectsAtIndexes, a3, a4);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray replaceObjectsAtIndexes:withObjects:]( &v5,  sel_replaceObjectsAtIndexes_withObjects_,  a3,  a4);
  }

@end