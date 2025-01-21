@interface BKSystemShellSentinel
+ (BKSystemShellSentinel)sharedInstance;
+ (id)dataMigrationQueue;
- (BKSystemShellDescriptor)primarySystemShell;
- (BKSystemShellSentinel)init;
- (BOOL)_lock_blockSystemApp;
- (BOOL)_lock_unblockSystemApp;
- (BOOL)_pingSystemShellForCollectiveWatchdog:(id)a3;
- (BOOL)auditTokenRepresentsSystemApp:(id *)a3;
- (BOOL)blockSystemApp;
- (BOOL)collectiveWatchdogPing;
- (BOOL)unblockSystemApp;
- (NSArray)systemShells;
- (NSSet)shellsFinishedStartup;
- (NSString)activeAlternateSystemAppBundleIdentifier;
- (NSString)description;
- (id)_collectivePingSystemShellSet;
- (id)_lock_currentConnectionShell;
- (id)addSystemShellObserver:(id)a3 reason:(id)a4;
- (id)systemShellState;
- (void)_addSystemShellToCollectivePingSet:(id)a3;
- (void)_lock_bootstrapSystemApp;
- (void)_lock_checkInWithRemoteCompletionBlock:(id)a3;
- (void)_lock_completeCheckInForShell:(id)a3;
- (void)_lock_completeCheckInForShell:(id)a3 completionBlock:(id)a4;
- (void)_lock_handleRelaunchRequestFromSystemApp:(id)a3 withOptions:(unint64_t)a4;
- (void)_lock_updatePrimarySystemApp;
- (void)_removeSystemShellFromCollectivePingSet:(id)a3;
- (void)checkInAfterDataMigrationUsingCompletionBlock:(id)a3;
- (void)checkInBypassingDataMigrationUsingCompletionBlock:(id)a3;
- (void)dataMigratorDidComplete;
- (void)finishedLaunching;
- (void)invalidate;
- (void)restartWithOptions:(id)a3;
- (void)setActiveAlternateSystemAppBundleIdentifier:(id)a3;
- (void)setWatchdogMonitoringEnabled:(id)a3;
- (void)startServerWithDataMigration;
- (void)startServerWithoutDataMigration;
- (void)systemShellDidConnect:(id)a3 connection:(id)a4;
- (void)systemShellDidTerminate:(int)a3;
- (void)terminateShellWithJobLabel:(id)a3;
@end

@implementation BKSystemShellSentinel

- (BKSystemShellSentinel)init
{
  v2 = self;
  BKSystemShellServiceListener *v3 = [[BKSystemShellServiceListener alloc] initWithSentinel:self];
  BKSystemShellControlServiceListener *v4 = [[BKSystemShellControlServiceListener alloc] initWithSentinel:v2];
  v5 = v3;
  v6 = v4;
  if (v2)
  {
    v22.receiver = v2;
    [v22 setSuperclass:[BKSystemShellSentinel class]];
    BKSystemShellSentinel *v7 = [[BKSystemShellSentinel alloc] init];
    v2 = v7;
    if (v7)
    {
      v7->_shellListener = v3;
      v2->_controlListener = v4;
      v2->_lock._os_unfair_lock_opaque = 0;
      v2->_collectivePingDataLock._os_unfair_lock_opaque = 0;
      lock_systemApp = v2->_lock_systemApp;
      v2->_lock_systemApp = 0LL;

      uint64_t v9 = [NSMapTable strongToStrongObjectsMapTable];
      lock_checkinCompletionsBySystemApp = v2->_lock_checkinCompletionsBySystemApp;
      v2->_lock_checkinCompletionsBySystemApp = (NSMapTable *)v9;

      NSMutableOrderedSet *v11 = [[NSMutableOrderedSet alloc] init];
      lock_connectedSystemApps = v2->_lock_connectedSystemApps;
      v2->_lock_connectedSystemApps = v11;

      NSMutableSet *v13 = [[NSMutableSet alloc] init];
      lock_shellsFinishedStartup = v2->_lock_shellsFinishedStartup;
      v2->_lock_shellsFinishedStartup = v13;

      BKSystemAppHeartbeat *v15 = [[BKSystemAppHeartbeat alloc] init];
      heartbeat = v2->_heartbeat;
      v2->_heartbeat = v15;

      NSMutableDictionary *v17 = [[NSMutableDictionary alloc] init];
      lock_pidToClient = v2->_lock_pidToClient;
      v2->_lock_pidToClient = v17;

      uint64_t v19 = [BSCompoundAssertion assertionWithIdentifier:@"BKSystemShellSentinelObservers"];
      observers = v2->_observers;
      v2->_observers = (BSCompoundAssertion *)v19;
    }
  }

  return v2;
}

- (void)invalidate
{
  observers = self->_observers;
  self->_observers = 0LL;
}

- (NSString)description
{
  BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendBool:self->_lock_systemAppBlocked withName:@"systemAppBlocked"];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_1000516C8;
  v11 = &unk_1000B8030;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:0 block:&v8];
  v6 = [v5 build:v8:v9:v10:v11];

  return (NSString *)v6;
}

- (id)addSystemShellObserver:(id)a3 reason:(id)a4
{
  return [self->_observers acquireForReason:a4 withContext:a3];
}

- (BOOL)auditTokenRepresentsSystemApp:(id *)a3
{
  uint64_t v4 = BSPIDForAuditToken(a3);
  uint64_t v5 = v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  v8 = [NSNumber numberWithInt:v5];
  uint64_t v9 = (void *)[lock_pidToClient objectForKey:v8];
  BOOL v10 = v9 != 0LL;

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)setActiveAlternateSystemAppBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)[v5 copy];

  lock_activeAlternateSystemAppBundleIdentifier = self->_lock_activeAlternateSystemAppBundleIdentifier;
  self->_lock_activeAlternateSystemAppBundleIdentifier = v6;

  lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
  self->_lock_activeAlternateSystemAppJobLabel = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)activeAlternateSystemAppBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [self->_lock_activeAlternateSystemAppBundleIdentifier copy];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BKSystemShellDescriptor)primarySystemShell
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp) {
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  }
  id v5 = lock_systemApp;
  os_unfair_lock_unlock(p_lock);
  return (BKSystemShellDescriptor *)v5;
}

- (NSArray)systemShells
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [self->_lock_connectedSystemApps array];
  id v5 = [v4 bs_map:&stru_1000B7470];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSSet)shellsFinishedStartup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [self->_lock_shellsFinishedStartup bs_map:&stru_1000B7490];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)systemShellState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BKSystemShellSentinelState *v4 = [[BKSystemShellSentinelState alloc] init];
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp) {
    lock_systemApp = (BKSystemShellClient *)lock_systemApp->_descriptor;
  }
  v7 = lock_systemApp;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16LL);
  }

  v8 = [self->_lock_connectedSystemApps array];
  BOOL v10 = [v8 bs_map:&stru_1000B74B0];
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v9, v10, 24LL);
  }

  v11 = [self->_lock_shellsFinishedStartup bs_map:&stru_1000B74D0];
  v13 = v11;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v12, v11, 32LL);

    v4->_waitingForAlternateShellsToFinish = self->_lock_systemAppBlocked;
  }

  else
  {
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)startServerWithoutDataMigration
{
}

- (void)startServerWithDataMigration
{
}

- (void)dataMigratorDidComplete
{
  BSCompoundAssertionContext *v3 = [self->_observers context];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "systemShellWillBootstrap") & 1) != 0) {
          [v8 systemShellWillBootstrap];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v5);
  }

  os_unfair_lock_lock(&self->_lock);
  [self _lock_bootstrapSystemApp];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)collectiveWatchdogPing
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = [BKSystemShellSentinel _collectivePingSystemShellSet];
  id v4 = [v3 countByEnumeratingWithState:v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v9 = BKLogSystemShell();
        os_log_s *v10 = [v9 autorelease];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "watchdog ping: %{public}@", buf, 0xCu);
        }

        if (!-[BKSystemShellSentinel _pingSystemShellForCollectiveWatchdog:]( self,  "_pingSystemShellForCollectiveWatchdog:",  v8))
        {
          uint64_t v12 = BKLogSystemShell();
          v13 = v12;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ reported not alive, which is fairly unusual",  buf,  0xCu);
          }

          BOOL v11 = 0;
          goto LABEL_15;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:v15 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (BOOL)blockSystemApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [BKSystemShellSentinel _lock_blockSystemApp];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)unblockSystemApp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [BKSystemShellSentinel _lock_unblockSystemApp];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)systemShellDidConnect:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  BKSystemShellClient *v9 = [[BKSystemShellClient alloc] init];
  id v10 = v7;
  id v11 = v8;
  if (v9)
  {
    v26.receiver = v9;
    v26.super_class = [BKSystemShellClient class];
    uint64_t v12 = [BKSystemShellSentinel init];
    uint64_t v9 = (BKSystemShellClient *)v12;
    if (v12)
    {
      v12->_heartbeat = a4;
      [v9 setDescriptor:a3];
      NSDate *v13 = [[NSDate alloc] init];
      connectDate = v9->_connectDate;
      v9->_connectDate = v13;
    }
  }

  if (v9) {
    v9->_pendingCheckIn = 1;
  }
  __int128 v15 = (void *)[v10 bundleIdentifier];
  unsigned int v16 = [v15 isEqualToString:self->_lock_activeAlternateSystemAppBundleIdentifier];

  if (v16)
  {
    if (v9) {
      v9->_isAlternateShell = 1;
    }
    NSString *v17 = [v10 jobLabel];
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    self->_lock_activeAlternateSystemAppJobLabel = v17;

    uint64_t v19 = BKLogSystemShell();
    uint64_t v20 = [v19 autorelease];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [BKSystemShellClient description];
      LODWORD(v26.receiver) = 138543362;
      v26.receiver = v21;
      objc_super v22 = "Alternate system shell connected: %{public}@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, 0xCu);
    }
  }

  else
  {
    uint64_t v23 = BKLogSystemShell();
    uint64_t v20 = [os_log logWithName:v23];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [BKSystemShellClient description];
      LODWORD(v26.receiver) = 138543362;
      *(id *)((char *)&v26.receiver + 4) = v21;
      objc_super v22 = "System shell connected: %{public}@";
      goto LABEL_13;
    }
  }

  lock_pidToClient = self->_lock_pidToClient;
  v25 = [NSNumber numberWithInt:[v10 pid]];
  [lock_pidToClient setObject:v9 forKey:v25];

  [self->_lock_connectedSystemApps addObject:v9];
  [self _lock_updatePrimarySystemApp];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)systemShellDidTerminate:(int)a3
{
  uint64_t v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pidToClient = self->_lock_pidToClient;
  id v7 = [NSNumber numberWithInt:v3];
  id v8 = [lock_pidToClient objectForKey:v7];

  if (v8)
  {
    uint64_t v9 = BKLogSystemShell();
    id v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      unsigned int v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "System app disconnected: %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    [self->_lock_connectedSystemApps removeObject:v8];
    [self->_lock_checkinCompletionsBySystemApp removeObjectForKey:v8];
    id v11 = self->_lock_pidToClient;
    uint64_t v12 = (void *)[NSNumber numberWithInt:v3];
    [v11 removeObjectForKey:v12];

    [self->_lock_shellsFinishedStartup removeObject:v8];
    [self _removeSystemShellFromCollectivePingSet:v8];
    [self _lock_updatePrimarySystemApp];
    if (!-[NSMutableOrderedSet count](self->_lock_connectedSystemApps, "count"))
    {
      uint64_t v13 = BKLogSystemShell();
      os_log_s *v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No more system apps", (uint8_t *)&v15, 2u);
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_addSystemShellToCollectivePingSet:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  if (!collectivePingDataLock_collectivePingShells)
  {
    NSMutableSet *v5 = [[NSMutableSet alloc] init];
    uint64_t v6 = self->_collectivePingDataLock_collectivePingShells;
    self->_collectivePingDataLock_collectivePingShells = v5;

    collectivePingDataLock_collectivePingShells = self->_collectivePingDataLock_collectivePingShells;
  }

  [collectivePingDataLock_collectivePingShells addObject:v7];
  os_unfair_lock_unlock(&self->_collectivePingDataLock);
}

- (void)_removeSystemShellFromCollectivePingSet:(id)a3
{
  p_collectivePingDataLock = &self->_collectivePingDataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_collectivePingDataLock);
  [self->_collectivePingDataLock_collectivePingShells removeObject:v5];

  os_unfair_lock_unlock(p_collectivePingDataLock);
}

- (id)_collectivePingSystemShellSet
{
  p_collectivePingDataLock = &self->_collectivePingDataLock;
  os_unfair_lock_lock(&self->_collectivePingDataLock);
  NSMutableSet *v4 = [self->_collectivePingDataLock_collectivePingShells copy];
  os_unfair_lock_unlock(p_collectivePingDataLock);
  return v4;
}

- (BOOL)_pingSystemShellForCollectiveWatchdog:(id)a3
{
  uint64_t v3 = a3;
  id v4 = v3;
  if (v3) {
    id v5 = (void *)v3[2];
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;
  id v7 = [v6 watchdogType];

  if (v7 != (id)1)
  {
    id v8 = v4 ? (void *)v4[2] : 0LL;
    id v9 = v8;
    char v10 = BSPIDIsBeingDebugged([v9 pid]);

    if ((v10 & 1) == 0)
    {
      if (v4) {
        uint64_t v12 = (void *)v4[3];
      }
      else {
        uint64_t v12 = 0LL;
      }
      id v13 = v12;
      v14 = [v13 remoteTarget];

      unsigned int v15 = [v14 collectiveWatchdogPing];
      BOOL v11 = v15;
      if (v4)
      {
        if (v15 == (*((_BYTE *)v4 + 12) != 0))
        {
LABEL_21:

          goto LABEL_22;
        }

        uint64_t v16 = BKLogSystemShell();
        os_log_s *v17 = [v16 autorelease];
        __int128 v18 = v17;
        if (!v11)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "watchdogPing: system app claims it's no longer alive",  buf,  2u);
          }

LABEL_20:
          *((_BYTE *)v4 + 12) = v11;
          goto LABEL_21;
        }
      }

      else
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v20 = BKLogSystemShell();
        os_log_s *v18 = [v20 autorelease];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "watchdogPing: system app is now alive",  (uint8_t *)v21,  2u);
      }

      if (!v4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }

  BOOL v11 = 1;
LABEL_22:

  return v11;
}

- (id)_lock_currentConnectionShell
{
  uint64_t v3 = (void *)[BSServiceConnection currentContext];
  id v4 = (void *)[v3 remoteProcess];
  id v5 = [v4 pid];

  lock_pidToClient = self->_lock_pidToClient;
  id v7 = [NSNumber numberWithInt:v5];
  id v8 = [lock_pidToClient objectForKeyedSubscript:v7];

  return v8;
}

- (void)_lock_bootstrapSystemApp
{
  if (!self->_lock_systemAppBlocked && -[NSMapTable count](self->_lock_checkinCompletionsBySystemApp, "count"))
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    uint64_t v3 = (void *)[self->_lock_checkinCompletionsBySystemApp objectEnumerator];
    id v4 = [v3 countByEnumeratingWithState:v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [v8 performSelector:@selector(performSelector:) withObject:i];
        }

        id v5 = [v3 countByEnumeratingWithState:v8 objects:v12 count:16];
      }

      while (v5);
    }

    [self->_lock_checkinCompletionsBySystemApp removeAllObjects];
  }

  [self _lock_updatePrimarySystemApp];
}

- (void)_lock_updatePrimarySystemApp
{
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  uint64_t v3 = self->_lock_connectedSystemApps;
  [v3 countByEnumeratingWithState:v57 objects:v65 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v58;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v3);
        }
        __int128 v8 = *(BKSystemShellClient **)(*((void *)&v57 + 1) + 8LL * (void)i);
        if (v8 && !v8->_pendingCheckIn && v8->_checkedIn)
        {
          uint64_t v20 = BKLogSystemShell();
          v21 = [os_log logWithName:@"com.apple.backboard.event-stream"];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v64 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updating primary system app to: %{public}@",  buf,  0xCu);
          }

          objc_super v22 = v8;
          goto LABEL_43;
        }
      }

      [v3 countByEnumeratingWithState:v57 objects:v65 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (self->_lock_systemAppBlocked)
  {
    uint64_t v3 = self->_lock_activeAlternateSystemAppBundleIdentifier;
    if (v3)
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v9 = self->_lock_connectedSystemApps;
      [v9 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v54;
        while (2)
        {
          id v13 = 0LL;
          do
          {
            if (*(void *)v54 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v13);
            if (v14) {
              unsigned int v15 = (void *)v14[2];
            }
            else {
              unsigned int v15 = 0LL;
            }
            id v16 = v15;
            __int128 v17 = (void *)[v16 bundleIdentifier];
            unsigned __int8 v18 = [v17 isEqualToString:v3];

            if ((v18 & 1) != 0)
            {
              objc_super v22 = v14;

              if (!v14) {
                goto LABEL_39;
              }
              uint64_t v27 = BKLogSystemShell();
              v28 = v27;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Updating primary system the alternate system app: %{public}@",  buf,  0xCu);
              }

              goto LABEL_42;
            }

            id v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          [v9 countByEnumeratingWithState:v53 objects:v62 count:16];
          id v11 = v19;
          if (v19) {
            continue;
          }
          break;
        }
      }
    }

- (void)_lock_handleRelaunchRequestFromSystemApp:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v7 = BKLogSystemShell();
  os_log_s *v8 = [v7 autorelease];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = BKSRestartActionOptionsDescription(a4);
    id v10 = [v9 autorelease];
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    unsigned int v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Handling exit request from %{public}@ with options: %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  if ((a4 & 1) != 0)
  {
    BKSDefaults *v11 = [BKSDefaults localDefaults];
    [v11 setHideAppleLogoOnLaunch:1];
  }

  sub_10001B1A0();
  exit(0);
}

- (BOOL)_lock_blockSystemApp
{
  BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (!self->_lock_systemAppBlocked)
  {
    self->_BOOL lock_systemAppBlocked = 1;
    uint64_t v4 = BKLogSystemShell();
    id v5 = [v4 autorelease];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Blocking system apps.", buf, 2u);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v6 = self->_lock_connectedSystemApps;
    [v6 countByEnumeratingWithState:v27 objects:v34 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          sub_10004C7C4(*(void *)(*((void *)&v27 + 1) + 8LL * (void)i), 0);
        }

        [v6 countByEnumeratingWithState:v27 objects:v34 count:16];
      }

      while (v8);
    }

    lock_connectedSystemApps = self->_lock_connectedSystemApps;
    if (self->_shellListener)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000514EC;
      block[3] = &unk_1000B8058;
      id v26 = [lock_connectedSystemApps bs_map:&stru_1000B7510];
      id v12 = v26;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v12 = [lock_connectedSystemApps bs_map:&stru_1000B7530];
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v13 = [v12 countByEnumeratingWithState:v21 objects:v33 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (j = 0LL; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
            uint64_t v18 = BKLogSystemShell();
            os_log_s *v19 = v18;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Killing %{public}@.", buf, 0xCu);
            }
          }

          id v14 = [v12 countByEnumeratingWithState:v21 objects:v33 count:16];
        }

        while (v14);
      }
    }
  }

  return !lock_systemAppBlocked;
}

- (BOOL)_lock_unblockSystemApp
{
  BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
  if (self->_lock_systemAppBlocked)
  {
    lock_activeAlternateSystemAppJobLabel = self->_lock_activeAlternateSystemAppJobLabel;
    if (lock_activeAlternateSystemAppJobLabel) {
      lock_activeAlternateSystemAppJobLabel = (void *)sub_10001D49C( (uint64_t)[lock_activeAlternateSystemAppJobLabel UTF8String],  0);
    }
    self->_BOOL lock_systemAppBlocked = 0;
    uint64_t v5 = BKLogSystemShell(lock_activeAlternateSystemAppJobLabel);
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unblocking system apps.", v8, 2u);
    }

    [self _lock_bootstrapSystemApp];
  }

  return lock_systemAppBlocked;
}

- (void)_lock_completeCheckInForShell:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v6 = BKLogSystemShell(v5);
  os_log_s *v7 = [v6 autorelease];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v17) = 138543362;
    *(void *)((char *)&v17 + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "completeCheckInForShell: %{public}@",  (uint8_t *)&v17,  0xCu);
  }

  id v8 = sub_100065B98();
  uint64_t v9 = v8;
  id v10 = (void *)v9;
  if (v9)
  {
    id v11 = *(dispatch_queue_s **)(v9 + 8);
    *(void *)&__int128 v17 = _NSConcreteStackBlock;
    *((void *)&v17 + 1) = 3221225472LL;
    uint64_t v18 = sub_1000670FC;
    id v19 = &unk_1000B8058;
    uint64_t v20 = v10;
    dispatch_async(v11, ^{});
  }

  if (v4) {
    *((_WORD *)v4 + 4) = 256;
  }
  id v12 = [NSDate date];
  id v13 = v12;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 4, v12);

    id v14 = (void *)*((void *)v4 + 2);
  }

  else
  {

    id v14 = 0LL;
  }

  id v15 = v14;
  id v16 = [v15 watchdogType];

  if (v16) {
    sub_10004C7C4((uint64_t)v4, 1);
  }
  else {
    [self _addSystemShellToCollectivePingSet:v4];
  }
}

- (void)_lock_completeCheckInForShell:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000514B8;
  v25[3] = &unk_1000B7558;
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  id v9 = v7;
  id v27 = v9;
  id v10 = objc_retainBlock(v25);
  id v11 = (void (**)(void))v10;
  if (v8 && v8[11])
  {
    int v12 = 1;
LABEL_4:
    uint64_t v13 = BKLogSystemShell(v10);
    os_log_s *v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = sub_10004C760(v8);
      id v16 = [v15 autorelease];
      BOOL lock_systemAppBlocked = self->_lock_systemAppBlocked;
      *(_DWORD *)buf = 138543874;
      __int128 v29 = v16;
      __int16 v30 = 1024;
      int v31 = v12;
      __int16 v32 = 1024;
      BOOL v33 = lock_systemAppBlocked;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "checkInAndWaitForDataMigration: Telling %{public}@ it can start immediately (alternate:%{BOOL}u blocked:%{BOOL}u)",  buf,  0x18u);
    }

    [v11 objectAtIndex:2];
    goto LABEL_11;
  }

  if (!self->_lock_systemAppBlocked)
  {
    int v12 = 0;
    goto LABEL_4;
  }

  uint64_t v18 = BKLogSystemShell(v10);
  os_log_s *v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = sub_10004C760(v8);
    __int128 v21 = [v20 autorelease];
    BOOL v22 = self->_lock_systemAppBlocked;
    *(_DWORD *)buf = 138543618;
    __int128 v29 = v21;
    __int16 v30 = 1024;
    int v31 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Pending %{public}@ completion because systemAppBlocked:%{BOOL}u",  buf,  0x12u);
  }

  lock_checkinCompletionsBySystemApp = self->_lock_checkinCompletionsBySystemApp;
  id v24 = [v11 copy];
  [lock_checkinCompletionsBySystemApp setObject:v24 forKey:v8];

LABEL_11:
  [self _lock_updatePrimarySystemApp];
}

- (void)_lock_checkInWithRemoteCompletionBlock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v5 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_assert_owner(p_lock);
  BKSystemShellSentinel *v6 = [self _lock_currentConnectionShell];
  uint64_t v7 = BKLogSystemShell(v6);
  os_log_s *v8 = [v7 autorelease];
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      int v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "checkIn: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    [self _lock_completeCheckInForShell:v6 completionBlock:v5];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "checkIn: shell not found for current connection",  (uint8_t *)&v11,  2u);
    }

    uint64_t v10 = [NSError errorWithDomain:NSPOSIXErrorDomain code:22LL userInfo:0LL];
    v5[2](v5, v10);

    uint64_t v5 = (void (**)(id, uint64_t))v10;
  }
}

- (void)checkInAfterDataMigrationUsingCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [BKSystemShellSentinel dataMigrationQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock(&self->_lock);
  [self _lock_checkInWithRemoteCompletionBlock:v4];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)checkInBypassingDataMigrationUsingCompletionBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [self _lock_checkInWithRemoteCompletionBlock:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)finishedLaunching
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [self _lock_currentConnectionShell];
  uint64_t v5 = BKLogSystemShell(v4);
  os_log_s *v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      uint64_t v7 = *(void **)(v4 + 16);
    }
    else {
      uint64_t v7 = 0LL;
    }
    id v8 = v7;
    id v9 = [v8 bundleIdentifier];
    if (v4) {
      uint64_t v10 = *(void **)(v4 + 32);
    }
    else {
      uint64_t v10 = 0LL;
    }
    id v11 = v10;
    [v11 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v46 = v9;
    __int16 v47 = 2048;
    double v48 = -v12;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System shell %{public}@ finished startup after %.2fs.",  buf,  0x16u);
  }

  if (v4) {
    *(_BYTE *)(v4 + 10) = 1;
  }
  [self->_lock_shellsFinishedStartup addObject:v4];
  lock_systemApp = self->_lock_systemApp;
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    io_registry_entry_t v14 = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
    IORegistryEntrySetCFProperty(v14, @"System Boot Complete", kCFBooleanTrue);
    if (v4) {
      id v15 = *(void **)(v4 + 16);
    }
    else {
      id v15 = 0LL;
    }
    id v16 = v15;
    [v16 systemIdleSleepInterval];
    double v18 = v17;

    int v19 = (int)v18;
    int valuePtr = v19;
    NSNumber *v20 = [NSNumber numberWithInt:valuePtr];
    IORegistryEntrySetCFProperty(v14, @"System Idle Seconds", v20);
    CFRelease(v20);
    int v21 = (int)(v18 * 1000.0);
    if (v21 <= 1) {
      int v21 = 1;
    }
    int v42 = v21;
    NSNumber *v22 = [NSNumber numberWithInt:v42];
    IORegistryEntrySetCFProperty(v14, @"System Idle Milliseconds", v22);
    CFRelease(v22);
    uint64_t v24 = BKLogSystemShell(v23);
    v25 = v24;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = valuePtr;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Setting system idle interval to %d.",  buf,  8u);
    }

    if (!self->_enableIdleSleepAssertionID)
    {
      uint64_t v27 = BKLogSystemShell(v26);
      os_log_s *v28 = [v27 autorelease];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Telling IOKit that idle sleep is now enabled.",  buf,  2u);
      }

      IOPMAssertionCreateWithName( @"EnableIdleSleep",  0xFFu,  @"com.apple.backboardd.enable-idle-sleep",  &self->_enableIdleSleepAssertionID);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000514AC;
    block[3] = &unk_1000B8058;
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  if (v4) {
    __int128 v29 = *(void **)(v4 + 16);
  }
  else {
    __int128 v29 = 0LL;
  }
  id v30 = v29;
  os_unfair_lock_unlock(p_lock);
  if (lock_systemApp == (BKSystemShellClient *)v4)
  {
    int v31 = [self->_observers context];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    BOOL v32 = [v31 countByEnumeratingWithState:v37 objects:v44 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * (void)i) systemShellDidFinishLaunching:v30];
        }

        id v33 = [v31 countByEnumeratingWithState:v37 objects:v44 count:16];
      }

      while (v33);
    }

    BKSDefaults *v36 = [BKSDefaults localDefaults];
    [v36 setHideAppleLogoOnLaunch:0];
  }
}

- (void)restartWithOptions:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v7 = [BKSystemShellSentinel _lock_currentConnectionShell];
  unsigned int v6 = [v5 unsignedIntValue];

  [self _lock_handleRelaunchRequestFromSystemApp:v7 withOptions:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)setWatchdogMonitoringEnabled:(id)a3
{
  uint64_t v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [BKSystemShellSentinel _lock_currentConnectionShell];
  LODWORD(v3) = [v5 BOOLValue];

  sub_10004C7C4((uint64_t)v6, (int)v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)terminateShellWithJobLabel:(id)a3
{
  uint64_t v4 = (id *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = BKLogSystemShell(v6);
  id v8 = [v7 autorelease];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Disable watchdog for job label: %{public}@",  buf,  0xCu);
  }

  id v9 = v4;
  sub_10001D49C((uint64_t)[v9 UTF8String], 0);
  NSMutableOrderedSet *v10 = [self->_lock_connectedSystemApps copy];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:v30 objects:v34 count:16];
  uint64_t v13 = (id *)v11;
  if (!v12) {
    goto LABEL_20;
  }
  id v14 = v12;
  uint64_t v15 = *(void *)v31;
LABEL_5:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(v11);
    }
    double v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    double v18 = v17 ? (void *)v17[2] : 0LL;
    id v19 = v18;
    CFNumberRef v20 = [v19 jobLabel];
    unsigned __int8 v21 = [v9 isEqualToString:v20];

    if ((v21 & 1) != 0) {
      break;
    }
    if (v14 == (id)++v16)
    {
      id v22 = [v11 countByEnumeratingWithState:v30 objects:v34 count:16];
      id v14 = v22;
      if (!v22)
      {
        uint64_t v13 = (id *)v11;
        goto LABEL_20;
      }

      goto LABEL_5;
    }
  }

  uint64_t v13 = v17;

  if (v17)
  {
    uint64_t v24 = BKLogSystemShell(v23);
    v25 = [os_log logWithName:v24];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Shell exists; will terminate %{public}@",
        buf,
        0xCu);
    }

    id v26 = v13[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000513F8;
    block[3] = &unk_1000B8058;
    id v29 = v26;
    id v27 = v26;
    dispatch_async(&_dispatch_main_q, block);

LABEL_20:
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

+ (BKSystemShellSentinel)sharedInstance
{
  if (qword_1000DC1A0 != -1) {
    dispatch_once(&qword_1000DC1A0, &stru_1000B7410);
  }
  return (BKSystemShellSentinel *)(id)qword_1000DC198;
}

+ (id)dataMigrationQueue
{
  if (qword_1000DC1A8 != -1) {
    dispatch_once(&qword_1000DC1A8, &stru_1000B7430);
  }
  return (id)qword_1000DC1B0;
}

@end