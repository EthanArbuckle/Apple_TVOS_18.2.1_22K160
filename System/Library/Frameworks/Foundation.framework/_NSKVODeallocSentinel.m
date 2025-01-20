@interface _NSKVODeallocSentinel
+ (void)_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:(id)a3;
- (id)_initWithObservedObject:(id)a3;
- (void)dealloc;
@end

@implementation _NSKVODeallocSentinel

- (id)_initWithObservedObject:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSKVODeallocSentinel;
  id result = -[_NSKVODeallocSentinel init](&v5, sel_init);
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (void)_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:(id)a3
{
  Class = object_getClass(a3);
  if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
  {
    uint64_t v6 = (const void *)objc_opt_class();
    if (!objc_getAssociatedObject(a3, v6))
    {
      id value = (id)[objc_alloc((Class)a1) _initWithObservedObject:a3];
      v7 = (const void *)objc_opt_class();
      objc_setAssociatedObject(a3, v7, value, (void *)0x10001);
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  _NSKeyValueRemoveObservationInfoForObject((uint64_t)self->_observedObject);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSKVODeallocSentinel;
  -[_NSKVODeallocSentinel dealloc](&v3, sel_dealloc);
}

@end