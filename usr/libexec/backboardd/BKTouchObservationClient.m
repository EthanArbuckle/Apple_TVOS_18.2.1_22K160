@interface BKTouchObservationClient
- (BKTouchObservationClient)initWithConnection:(id)a3 pid:(int)a4;
- (void)_didRespondToTouchDelivery;
- (void)_lock_sendQueuedUpdatesToClient;
- (void)sendTouchUpdate:(id)a3;
@end

@implementation BKTouchObservationClient

- (BKTouchObservationClient)initWithConnection:(id)a3 pid:(int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = [BKTouchObservationClient class];
  BKTouchObservationClient *v7 = [[BKTouchObservationClient alloc] init];
  v8 = v7;
  if (v7)
  {
    [v7 setConnection:v6];
    v8->_pid = a4;
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)_didRespondToTouchDelivery
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_waitingOnClient = 0;
  self->_lock_updateSentTimestamp = 0.0;
  [self _lock_sendQueuedUpdatesToClient];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_sendQueuedUpdatesToClient
{
  if (-[NSMutableArray count](self->_lock_pendingUpdates, "count"))
  {
    id WeakRetained = [self->_connection retain];
    v4 = (void *)[WeakRetained remoteTarget];

    NSMutableArray *v5 = [self->_lock_pendingUpdates copy];
    uint64_t v6 = [self->_lock_pendingUpdates removeAllObjects];
    v7 = (os_log_s *)v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = [BSDescriptionStream descriptionForRootObject:v5];
      uint64_t v10 = BSProcessDescriptionForPID(self->_pid);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v9;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "post updates:%{public}@ to:%{public}@",  location,  0x16u);
    }

    self->_lock_waitingOnClient = 1;
    self->_lock_updateSentTimestamp = BSContinuousMachTimeNow(v8);
    objc_initWeak((id *)location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100016BC0;
    v12[3] = &unk_1000B5CD0;
    [location copy];
    [v4 observeTouchEventDeliveryDidOccur:v5 response:v12];
    [v13 release];
    objc_destroyWeak((id *)location);
  }

- (void)sendTouchUpdate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingUpdates = self->_lock_pendingUpdates;
  if (self->_lock_waitingOnClient)
  {
    uint64_t v6 = [lock_pendingUpdates count];
    double v8 = BSContinuousMachTimeNow(v6) - self->_lock_updateSentTimestamp;
    if (v6 >= 1 && v8 > 2.0)
    {
      uint64_t v10 = BKLogTouchDeliveryObserver(v7);
      v11 = [v10];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = BSProcessDescriptionForPID(self->_pid);
        __int16 v15 = [v14 autorelease];
        int v16 = 134218498;
        double v17 = v8;
        __int16 v18 = 1024;
        int v19 = v6;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "waiting for %g seconds; dropping %d updates for %{public}@",
          (uint8_t *)&v16,
          0x1Cu);
      }

      [self->_lock_pendingUpdates removeAllObjects];
    }

    [self->_lock_pendingUpdates addObject:v4];
  }

  else
  {
    if (!lock_pendingUpdates)
    {
      NSMutableArray *v12 = [[NSMutableArray alloc] init];
      id v13 = self->_lock_pendingUpdates;
      self->_lock_pendingUpdates = v12;

      lock_pendingUpdates = self->_lock_pendingUpdates;
    }

    [lock_pendingUpdates addObject:v4];
    [self _lock_sendQueuedUpdatesToClient];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
}

@end