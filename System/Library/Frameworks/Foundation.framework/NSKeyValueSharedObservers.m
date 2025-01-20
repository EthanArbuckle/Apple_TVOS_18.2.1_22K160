@interface NSKeyValueSharedObservers
- (NSKeyValueSharedObservers)initWithObservableClass:(Class)a3;
- (id)snapshot;
- (void)addSharedObserver:(id)a3 forKey:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
@end

@implementation NSKeyValueSharedObservers

- (NSKeyValueSharedObservers)initWithObservableClass:(Class)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSKeyValueSharedObservers;
  result = -[NSKeyValueSharedObservers init](&v5, sel_init);
  if (result)
  {
    result->_observableClass = a3;
    result->_currentClass = a3;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSharedObservers;
  -[NSKeyValueSharedObservers dealloc](&v3, sel_dealloc);
}

- (void)addSharedObserver:(id)a3 forKey:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v15[1] = *MEMORY[0x1895F89C0];

  self->_snapshot = 0LL;
  os_unfair_recursive_lock_lock_with_options();
  v11 = (NSKeyValueProperty *)NSKeyValuePropertyForIsaAndKeyPath(self->_currentClass, a4);
  currentObservationInfo = self->_currentObservationInfo;
  self->_currentObservationInfo = (NSKeyValueObservationInfo *)_NSKeyValueObservationInfoCreateByAdding( currentObservationInfo,  a3,  v11,  a5,  a6,  0LL,  &v14,  v15);

  v13 = -[NSKeyValueProperty isaForAutonotifying](v11, "isaForAutonotifying");
  if (v13) {
    self->_currentClass = v13;
  }
  os_unfair_recursive_lock_unlock();
}

- (id)snapshot
{
  snapshot = self->_snapshot;
  if (!snapshot)
  {
    snapshot = -[NSKeyValueSharedObserversSnapshot _initWithObservationInfo:andNotifyingISA:forObjectOfClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueSharedObserversSnapshot),  "_initWithObservationInfo:andNotifyingISA:forObjectOfClass:",  self->_currentObservationInfo,  self->_currentClass,  self->_observableClass);
    self->_snapshot = snapshot;
  }

  return snapshot;
}

@end