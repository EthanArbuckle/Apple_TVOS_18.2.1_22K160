@interface UnfairLock
- (UnfairLock)init;
- (void)lock;
- (void)unlock;
@end

@implementation UnfairLock

- (UnfairLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UnfairLock;
  result = -[UnfairLock init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)lock
{
}

- (void)unlock
{
}

@end