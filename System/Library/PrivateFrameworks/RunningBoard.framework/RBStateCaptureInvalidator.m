@interface RBStateCaptureInvalidator
- (id)initWithHandle:(id)result;
- (void)invalidate;
@end

@implementation RBStateCaptureInvalidator

- (id)initWithHandle:(id)result
{
  if (result)
  {
    v3 = result;
    if (!a2)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 handleFailureInMethod:sel_initWithHandle_ object:v3 file:@"RBStateCaptureManager.m" lineNumber:69 description:@"Handle cannot be 0."];
    }

    v5.receiver = v3;
    v5.super_class = (Class)&OBJC_CLASS___RBStateCaptureInvalidator;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result) {
      *((void *)result + 1) = a2;
    }
  }

  return result;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_handle)
    {
      os_state_remove_handler();
      os_unfair_lock_lock(&_lock);
      v3 = (void *)_registeredStateCaptureBlocks;
      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_handle];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 removeObjectForKey:v4];

      os_unfair_lock_unlock(&_lock);
    }
  }

@end