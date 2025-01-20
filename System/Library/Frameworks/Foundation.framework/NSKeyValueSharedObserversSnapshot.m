@interface NSKeyValueSharedObserversSnapshot
- (id)_initWithObservationInfo:(id)a3 andNotifyingISA:(Class)a4 forObjectOfClass:(Class)a5;
- (void)_assignToObject:(id)a3;
- (void)dealloc;
@end

@implementation NSKeyValueSharedObserversSnapshot

- (id)_initWithObservationInfo:(id)a3 andNotifyingISA:(Class)a4 forObjectOfClass:(Class)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSKeyValueSharedObserversSnapshot;
  v8 = -[NSKeyValueSharedObserversSnapshot init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_observableClass = a5;
    v8->_cachedObservationInfo = (NSKeyValueObservationInfo *)[a3 copy];
    v9->_autonotifyingClass = a4;
  }

  return v9;
}

- (void)_assignToObject:(id)a3
{
  if (object_getClass(a3) == self->_observableClass)
  {
    -[NSObject _setSharedObservationInfo:]((uint64_t)a3, self->_cachedObservationInfo);
    autonotifyingClass = self->_autonotifyingClass;
    if (autonotifyingClass) {
      object_setClass(a3, autonotifyingClass);
    }
  }

  else
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Attempted to set shared observers from snapshot %@, which is outdated",  a3,  self);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v6 userInfo:0]);
    -[NSKeyValueSharedObserversSnapshot dealloc](v7, v8);
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueSharedObserversSnapshot;
  -[NSKeyValueSharedObserversSnapshot dealloc](&v3, sel_dealloc);
}

@end