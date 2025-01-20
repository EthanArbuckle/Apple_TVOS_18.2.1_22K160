@interface ADUnavailableTimerStore
- (id)_createUnavailableError;
- (void)dismissTimersWithURLs:(id)a3 completionHandler:(id)a4;
- (void)getTimerWithCompletionHandler:(id)a3;
- (void)setTimer:(id)a3 completionHandler:(id)a4;
@end

@implementation ADUnavailableTimerStore

- (id)_createUnavailableError
{
  return +[NSError _ad_timerStoreErrorWithCode:](&OBJC_CLASS___NSError, "_ad_timerStoreErrorWithCode:", 100LL);
}

- (void)getTimerWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableTimerStore _createUnavailableError](self, "_createUnavailableError"));
  (*((void (**)(id, void, id))a3 + 2))(v5, 0LL, v6);
}

- (void)setTimer:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableTimerStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }

- (void)dismissTimersWithURLs:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableTimerStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }

@end