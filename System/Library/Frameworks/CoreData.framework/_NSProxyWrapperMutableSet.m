@interface _NSProxyWrapperMutableSet
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableSet:(void *)a5 mutationMethods:;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation _NSProxyWrapperMutableSet

- (void)dealloc
{
  self->_mutationMethods = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableSet;
  -[_NSNotifyingWrapperMutableSet dealloc](&v3, sel_dealloc);
}

- (void)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableSet:(void *)a5 mutationMethods:
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_CLASS____NSProxyWrapperMutableSet;
  v6 = objc_msgSendSuper2(&v8, sel_initWithContainer_key_mutableSet_, a2, a3, a4);
  if (v6) {
    v6[4] = a5;
  }
  return v6;
}

- (void)addObject:(id)a3
{
  id v6 = a3;
  addObjectMethod = self->_mutationMethods->_addObjectMethod;
  if (addObjectMethod)
  {
    method_invoke(self->super._container, addObjectMethod);
  }

  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v6 count:1];
    method_invoke(self->super._container, self->_mutationMethods->_addMethod, v5);
  }

- (void)addObjectsFromArray:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:a3];
  mutationMethods = self->_mutationMethods;
  addMethod = mutationMethods->_addMethod;
  container = self->super._container;
  id v8 = v4;
  if (addMethod) {
    method_invoke(container, addMethod);
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet(container, mutationMethods->_addObjectMethod, v4);
  }
}

- (void)intersectSet:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  intersectMethod = self->_mutationMethods->_intersectMethod;
  if (intersectMethod)
  {
    method_invoke(self->super._container, intersectMethod, a3);
  }

  else
  {
    unint64_t v6 = -[_NSNotifyingWrapperMutableSet count](self, "count");
    if (v6)
    {
      unint64_t v7 = v6;
      if (v6 >= 0x201) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = v6;
      }
      unint64_t v9 = (8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      v10 = (char *)v13 - v9;
      if (v6 > 0x200) {
        v10 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v13 - v9, 8 * v6);
      }
      -[_NSNotifyingWrapperMutableSet getObjects:](self, "getObjects:", v10);
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v12 = *(void *)&v10[8 * i];
        if (([a3 containsObject:v12] & 1) == 0) {
          -[_NSProxyWrapperMutableSet removeObject:](self, "removeObject:", v12);
        }
      }

      if (v7 >= 0x201) {
        NSZoneFree(0LL, v10);
      }
    }
  }

- (void)minusSet:(id)a3
{
  mutationMethods = self->_mutationMethods;
  removeMethod = mutationMethods->_removeMethod;
  container = self->super._container;
  if (removeMethod) {
    method_invoke(container, removeMethod, a3);
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet(container, mutationMethods->_removeObjectMethod, a3);
  }
}

- (void)removeAllObjects
{
  setMethod = self->_mutationMethods->_setMethod;
  if (setMethod) {
    method_invoke(self->super._container, setMethod, NSSet_EmptySet);
  }
  else {
    -[_NSProxyWrapperMutableSet minusSet:](self, "minusSet:", self->super._mutableSet);
  }
}

- (void)removeObject:(id)a3
{
  id v6 = a3;
  removeObjectMethod = self->_mutationMethods->_removeObjectMethod;
  if (removeObjectMethod)
  {
    method_invoke(self->super._container, removeObjectMethod);
  }

  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v6 count:1];
    method_invoke(self->super._container, self->_mutationMethods->_removeMethod, v5);
  }

- (void)setSet:(id)a3
{
  setMethod = self->_mutationMethods->_setMethod;
  if (setMethod)
  {
    method_invoke(self->super._container, setMethod, a3);
  }

  else
  {
    id v5 = a3;
    -[_NSProxyWrapperMutableSet minusSet:](self, "minusSet:", self->super._mutableSet);
    -[_NSProxyWrapperMutableSet unionSet:](self, "unionSet:", a3);
  }

- (void)unionSet:(id)a3
{
  mutationMethods = self->_mutationMethods;
  addMethod = mutationMethods->_addMethod;
  container = self->super._container;
  if (addMethod) {
    method_invoke(container, addMethod, a3);
  }
  else {
    _PFInvokeMutationMethodForEachMemberOfSet(container, mutationMethods->_addObjectMethod, a3);
  }
}

@end