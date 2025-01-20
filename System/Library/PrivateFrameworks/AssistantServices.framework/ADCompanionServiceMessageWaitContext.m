@interface ADCompanionServiceMessageWaitContext
- (AFWatchdogTimer)timer;
- (NSMutableArray)seenMessageIDs;
- (NSMutableSet)waitingOnMessageIDs;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setSeenMessageIDs:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWaitingOnMessageIDs:(id)a3;
@end

@implementation ADCompanionServiceMessageWaitContext

- (NSMutableArray)seenMessageIDs
{
  return self->_seenMessageIDs;
}

- (void)setSeenMessageIDs:(id)a3
{
}

- (NSMutableSet)waitingOnMessageIDs
{
  return self->_waitingOnMessageIDs;
}

- (void)setWaitingOnMessageIDs:(id)a3
{
}

- (AFWatchdogTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end