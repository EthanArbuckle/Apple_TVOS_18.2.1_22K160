@interface ProcessTerminator
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
@end

@implementation ProcessTerminator

- (void)dealloc
{
  assertion = self->_assertion;
  if (assertion)
  {
    -[RBSTerminationAssertion removeObserver:](assertion, "removeObserver:", self);
    -[RBSTerminationAssertion invalidate](self->_assertion, "invalidate");
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ProcessTerminator;
  -[ProcessTerminator dealloc](&v4, "dealloc");
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  if (-[NSConditionLock tryLockWhenCondition:](self->_condition, "tryLockWhenCondition:", 0LL)) {
    -[NSConditionLock unlockWithCondition:](self->_condition, "unlockWithCondition:", 1LL);
  }
}

- (void).cxx_destruct
{
}

@end