@interface NSKeyValueIvarMutableSet
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)_proxyNonGCFinalize;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation NSKeyValueIvarMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueIvarMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = [a4 ivar];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueIvarMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_ivar = 0LL;
}

- (unint64_t)count
{
  return [*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)) count];
}

- (id)member:(id)a3
{
  return (id)[*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)) member:a3];
}

- (id)objectEnumerator
{
  container = self->super._container;
  objc_super v3 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));
  if (v3) {
    return (id)[v3 objectEnumerator];
  }
  else {
    return objc_alloc_init(&OBJC_CLASS___NSKeyValueNilSetEnumerator);
  }
}

- (void)addObject:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = a3;
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6) {
    [v6 addObject:a3];
  }
  else {
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v7 count:1];
  }
}

- (void)addObjectsFromArray:(id)a3
{
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6) {
    [v6 addObjectsFromArray:a3];
  }
  else {
    *(Class *)((char *)&container->isa + Offset) = (Class)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
  }
}

- (void)intersectSet:(id)a3
{
}

- (void)minusSet:(id)a3
{
}

- (void)removeAllObjects
{
}

- (void)removeObject:(id)a3
{
}

- (void)setSet:(id)a3
{
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6) {
    [v6 setSet:a3];
  }
  else {
    *(Class *)((char *)&container->isa + Offset) = (Class)[a3 mutableCopy];
  }
}

- (void)unionSet:(id)a3
{
  container = self->super._container;
  ptrdiff_t Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6) {
    [v6 unionSet:a3];
  }
  else {
    *(Class *)((char *)&container->isa + Offset) = (Class)[a3 mutableCopy];
  }
}

@end