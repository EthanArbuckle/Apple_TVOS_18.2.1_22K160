@interface CPLSyncBubbleScheduler
- (BOOL)shouldCoalesceServerChangesNotification;
- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3;
- (id)componentName;
- (id)scheduleNextSyncSessionAtDate:(id)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)noteSyncSession:(id)a3 failedWithError:(id)a4;
- (void)noteSyncSessionSucceeded:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3;
@end

@implementation CPLSyncBubbleScheduler

- (BOOL)shouldStartSyncSessionFromState:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldCoalesceServerChangesNotification
{
  return 0;
}

- (void)openWithCompletionHandler:(id)a3
{
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
}

- (id)scheduleNextSyncSessionAtDate:(id)a3
{
  dummySession = self->_dummySession;
  if (!dummySession)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSyncBubbleScheduler abstractObject](self, "abstractObject", a3));
    v6 = objc_alloc(&OBJC_CLASS___CPLSyncSession);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);
    v8 = -[CPLSyncSession initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:]( v6,  "initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:",  0LL,  0LL,  v5,  v7,  0LL);
    v9 = self->_dummySession;
    self->_dummySession = v8;

    dummySession = self->_dummySession;
  }

  return dummySession;
}

- (void)noteSyncSession:(id)a3 failedWithError:(id)a4
{
}

- (void)noteSyncSessionSucceeded:(id)a3
{
}

- (id)componentName
{
  return @"scheduler.syncbubble";
}

- (void)schedulePersistedSyncSessionIfAvailableWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end