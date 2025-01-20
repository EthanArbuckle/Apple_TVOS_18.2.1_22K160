@interface termAssertionObserver
- (OS_dispatch_semaphore)completionSem;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)setCompletionSem:(id)a3;
@end

@implementation termAssertionObserver

- (void)assertionTargetProcessDidExit:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[termAssertionObserver completionSem](self, "completionSem");
    v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v5);
  }

- (OS_dispatch_semaphore)completionSem
{
  return self->_completionSem;
}

- (void)setCompletionSem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end