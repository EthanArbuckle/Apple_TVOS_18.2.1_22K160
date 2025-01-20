@interface NSKeyValueFastMutableSet
- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4;
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

@implementation NSKeyValueFastMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5) {
    v5[3] = (id)[a4 mutatingMethods];
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutatingMethods = 0LL;
}

- (void)addObject:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = a3;
  addObject = self->_mutatingMethods->addObject;
  if (addObject)
  {
    method_invoke(self->super._container, addObject);
  }

  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v6 count:1];
    method_invoke(self->super._container, self->_mutatingMethods->unionSet, v5, v6[0]);
  }

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (self->_mutatingMethods->unionSet)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x189604010]) initWithArray:a3];
    method_invoke(self->super._container, self->_mutatingMethods->unionSet);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet addObjectsFromArray:](&v5, sel_addObjectsFromArray_, a3);
  }

- (void)intersectSet:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  intersectSet = self->_mutatingMethods->intersectSet;
  if (intersectSet)
  {
    method_invoke(self->super._container, intersectSet, a3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet intersectSet:](&v4, sel_intersectSet_, a3);
  }

- (void)minusSet:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  minusSet = self->_mutatingMethods->minusSet;
  if (minusSet)
  {
    method_invoke(self->super._container, minusSet, a3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet minusSet:](&v4, sel_minusSet_, a3);
  }

- (void)removeAllObjects
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_mutatingMethods->setSet)
  {
    id v3 = objc_alloc_init(MEMORY[0x189604010]);
    method_invoke(self->super._container, self->_mutatingMethods->setSet);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet removeAllObjects](&v4, sel_removeAllObjects);
  }

- (void)removeObject:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = a3;
  removeObject = self->_mutatingMethods->removeObject;
  if (removeObject)
  {
    method_invoke(self->super._container, removeObject);
  }

  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:v6 count:1];
    method_invoke(self->super._container, self->_mutatingMethods->minusSet, v5, v6[0]);
  }

- (void)setSet:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  setSet = self->_mutatingMethods->setSet;
  if (setSet)
  {
    method_invoke(self->super._container, setSet, a3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet setSet:](&v4, sel_setSet_, a3);
  }

- (void)unionSet:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unionSet = self->_mutatingMethods->unionSet;
  if (unionSet)
  {
    method_invoke(self->super._container, unionSet, a3);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet unionSet:](&v4, sel_unionSet_, a3);
  }

@end