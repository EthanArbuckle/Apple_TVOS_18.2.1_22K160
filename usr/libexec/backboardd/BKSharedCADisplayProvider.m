@interface BKSharedCADisplayProvider
+ (id)sharedInstance;
- (BKSharedCADisplayProvider)init;
- (CADisplay)mainDisplay;
- (NSArray)displays;
- (void)_lock_addObserversToDisplay:(id)a3;
- (void)_lock_removeObserversFromDisplay:(id)a3;
- (void)_lock_updateObservingState;
- (void)addMonitor:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeMonitor:(id)a3;
@end

@implementation BKSharedCADisplayProvider

- (BKSharedCADisplayProvider)init
{
  v9.receiver = self;
  v9.super_class = [BKSharedCADisplayProvider class];
  BKSharedCADisplayProvider *v2 = [[BKSharedCADisplayProvider alloc] init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    NSMutableSet *v4 = [[NSMutableSet alloc] init];
    lock_monitors = v3->_lock_monitors;
    v3->_lock_monitors = v4;

    NSMutableSet *v6 = [[NSMutableSet alloc] init];
    lock_observedDisplays = v3->_lock_observedDisplays;
    v3->_lock_observedDisplays = v6;

    [v3 _lock_updateObservingState];
  }

  return v3;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_monitors = self->_lock_monitors;
  self->_lock_monitors = 0LL;

  [self _lock_updateObservingState];
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)displays
{
  return [CADisplay displays];
}

- (CADisplay)mainDisplay
{
  return [CADisplay mainDisplay];
}

- (void)addMonitor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [self->_lock_monitors addObject:v5];

  [_lock_updateObservingState];
  os_unfair_lock_unlock(p_lock);
}

- (void)removeMonitor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [self->_lock_monitors removeObject:v5];

  [self _lock_updateObservingState];
  os_unfair_lock_unlock(p_lock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v14 = [CADisplay class];
  id v15 = v11;
  v16 = v15;
  if (v14)
  {
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
      v17 = v16;
    }
    else {
      v17 = 0LL;
    }
  }

  else
  {
    v17 = 0LL;
  }

  id v18 = v17;

  if (off_1000DB430 == a6)
  {
    id v20 = sub_10003F20C();
    os_log_s *v21 = v20;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v22 = [v18 uniqueId];
    *(_DWORD *)buf = 138543618;
    *(void *)v96 = v18;
    *(_WORD *)&v96[8] = 2114;
    *(void *)&v96[10] = v22;
    v23 = "available modes changed for display %{public}@ %{public}@";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

    goto LABEL_19;
  }

  if (off_1000DB438 == a6)
  {
    id v24 = sub_10003F20C();
    v21 = [os_log logWithName:v24];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v22 = [v18 uniqueId];
    *(_DWORD *)buf = 138543618;
    *(void *)v96 = v18;
    *(_WORD *)&v96[8] = 2114;
    *(void *)&v96[10] = v22;
    v23 = "current modes changed for display %{public}@ %{public}@";
    goto LABEL_18;
  }

  if (off_1000DB440 == a6)
  {
    id v25 = sub_10003F20C();
    v21 = [os_log logWithName:@"com.apple.backboard.hid.event.client"];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v18 uniqueId];
      *(_DWORD *)buf = 138543618;
      *(void *)v96 = v18;
      *(_WORD *)&v96[8] = 2114;
      *(void *)&v96[10] = v22;
      v23 = "logical scale changed for display %{public}@ %{public}@";
      goto LABEL_18;
    }

- (void)_lock_updateObservingState
{
  if (-[NSMutableSet count](self->_lock_monitors, "count"))
  {
    if (!self->_isObserving)
    {
      v3 = [BKSharedCADisplayProvider displays];
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v4 = [v3 countByEnumeratingWithState:v17 objects:v22 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v18 != v6) {
              objc_enumerationMutation(v3);
            }
            [self _lock_addObserversToDisplay:v17];
          }

          id v5 = [v3 countByEnumeratingWithState:v17 objects:v22 count:16];
        }

        while (v5);
      }

      self->_isObserving = 1;
    }
  }

  else if (self->_isObserving)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v8 = self->_lock_observedDisplays;
    [v8 countByEnumeratingWithState:v13 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (j = 0LL; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [self _lock_removeObserversFromDisplay:v13];
        }

        [v8 countByEnumeratingWithState:v13 objects:v21 count:16];
      }

      while (v10);
    }

    self->_isObserving = 0;
  }

- (void)_lock_addObserversToDisplay:(id)a3
{
  lock_observedDisplays = self->_lock_observedDisplays;
  id v7 = a3;
  if (-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:"))
  {
    uint64_t v6 = [NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKCADisplayMonitor.m" lineNumber:162 description:@"attempting to add ourselves as an observer for an already tracked display. did we mix up mutable and immutable?"];
  }

  [self->_lock_observedDisplays addObject:v7];
  [v7 addObserver:self forKeyPath:@"availableModes" options:0 context:off_1000DB430];
  [v7 addObserver:self forKeyPath:@"currentMode" options:0 context:off_1000DB438];
  [v7 addObserver:self forKeyPath:@"logicalScale" options:0 context:off_1000DB440];
  [v7 addObserver:self forKeyPath:@"pointScale" options:0 context:off_1000DB448];
}

- (void)_lock_removeObserversFromDisplay:(id)a3
{
  lock_observedDisplays = self->_lock_observedDisplays;
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:") & 1) == 0)
  {
    uint64_t v6 = [NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BKCADisplayMonitor.m" lineNumber:171 description:@"attempting to remove ourselves as an observer for an untracked display. did we mix up mutable and immutable?"];
  }

  [self->_lock_observedDisplays removeObject:v7];
  [v7 removeObserver:self forKeyPath:@"availableModes" context:off_1000DB430];
  [v7 removeObserver:self forKeyPath:@"currentMode" context:off_1000DB438];
  [v7 removeObserver:self forKeyPath:@"logicalScale" context:off_1000DB440];
  [v7 removeObserver:self forKeyPath:@"pointScale" context:off_1000DB448];
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC200 != -1) {
    dispatch_once(&qword_1000DC200, &stru_1000B7A40);
  }
  return (id)qword_1000DC208;
}

@end