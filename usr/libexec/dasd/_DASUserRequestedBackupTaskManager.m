@interface _DASUserRequestedBackupTaskManager
+ (_DASUserRequestedBackupTaskManager)managerWithContext:(id)a3;
+ (id)userRequestedBackupKeyPath;
- (BOOL)activityEligibleForRunning:(id)a3;
- (BOOL)isBackupStatusCompleted:(unint64_t)a3;
- (BOOL)syncInProgress;
- (NSMutableArray)clientsWithErrors;
- (NSMutableDictionary)backupTasks;
- (OS_os_log)log;
- (_CDLocalContext)context;
- (_DASUserRequestedBackupTaskManager)initWithContext:(id)a3;
- (int64_t)totalClients;
- (os_unfair_lock_s)lock;
- (unint64_t)backupTaskStatusForCompletedActivity:(int64_t)a3;
- (void)_queue_obtainPendingBackupTasks;
- (void)activitySubmitted:(id)a3;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)setBackupTasks:(id)a3;
- (void)setClientsWithErrors:(id)a3;
- (void)setContext:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)setTotalClients:(int64_t)a3;
@end

@implementation _DASUserRequestedBackupTaskManager

- (_DASUserRequestedBackupTaskManager)initWithContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASUserRequestedBackupTaskManager;
  v6 = -[_DASUserRequestedBackupTaskManager init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    os_log_t v8 = os_log_create("com.apple.duetactivityscheduler", "syncOnBackup");
    log = v7->_log;
    v7->_log = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    backupTasks = v7->_backupTasks;
    v7->_backupTasks = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clientsWithErrors = v7->_clientsWithErrors;
    v7->_clientsWithErrors = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v7->_context, a3);
    context = v7->_context;
    id v15 = [(id)objc_opt_class(v7) userRequestedBackupKeyPath];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v16));
    v7->_syncInProgress = [v17 BOOLValue];
  }

  return v7;
}

+ (_DASUserRequestedBackupTaskManager)managerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithContext:v4];

  return (_DASUserRequestedBackupTaskManager *)v5;
}

+ (id)userRequestedBackupKeyPath
{
  if (qword_100157D68 != -1) {
    dispatch_once(&qword_100157D68, &stru_100117628);
  }
  return (id)qword_100157D70;
}

- (BOOL)isBackupStatusCompleted:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)activitySubmitted:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  backupTasks = self->_backupTasks;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v7));
  id v9 = [v8 unsignedIntegerValue];

  if (v9 == (id)1) {
    uint64_t v10 = 3LL;
  }
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  uint64_t v12 = self->_backupTasks;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);
  os_unfair_lock_unlock(p_lock);
}

- (void)reportActivityRunning:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL syncInProgress = self->_syncInProgress;
  log = self->_log;
  BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ running", (uint8_t *)&v11, 0xCu);
    }

    backupTasks = self->_backupTasks;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( backupTasks,  "setObject:forKeyedSubscript:",  &off_100122368,  v10);
  }

  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%@ running (no sync in progress)",  (uint8_t *)&v11,  0xCu);
  }

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)backupTaskStatusForCompletedActivity:(int64_t)a3
{
  if (a3 == 3) {
    return 2LL;
  }
  else {
    return 3LL;
  }
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL syncInProgress = self->_syncInProgress;
  log = self->_log;
  BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ done running", (uint8_t *)&buf, 0xCu);
    }

    backupTasks = self->_backupTasks;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v10));
    id v12 = [v11 unsignedIntegerValue];

    if (!-[_DASUserRequestedBackupTaskManager isBackupStatusCompleted:](self, "isBackupStatusCompleted:", v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  -[_DASUserRequestedBackupTaskManager backupTaskStatusForCompletedActivity:]( self,  "backupTaskStatusForCompletedActivity:",  [v4 completionStatus])));
      v14 = self->_backupTasks;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);
    }

    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_backupTasks;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Now backup tasks are: %@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000LL;
    uint64_t v30 = 0LL;
    v18 = self->_backupTasks;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000AB3D4;
    v25[3] = &unk_100116BE8;
    v25[4] = self;
    v25[5] = &buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v25);
    if ([v4 completionStatus] == (id)3)
    {
      objc_super v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000B90D0((uint64_t)v4, v19);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      v26[0] = NSLocalizedDescriptionKey;
      v26[1] = @"client";
      v27[0] = @"Error attempting to sync local changes.";
      v27[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"XPCSyncOnBackup",  228965071LL,  v21));

      -[NSMutableArray addObject:](self->_clientsWithErrors, "addObject:", v22);
    }

    if (*(void *)(*((void *)&buf + 1) + 24LL) == self->_totalClients)
    {
      self->_totalClients = 0LL;
      -[NSMutableArray removeAllObjects](self->_clientsWithErrors, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_backupTasks, "removeAllObjects");
      self->_BOOL syncInProgress = 0;
      context = self->_context;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath]( &OBJC_CLASS____DASUserRequestedBackupTaskManager,  "userRequestedBackupKeyPath"));
      -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_100122380, v24);
    }

    os_unfair_lock_unlock(p_lock);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (v8)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%@ done running (no sync in progress)",  (uint8_t *)&buf,  0xCu);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)activityEligibleForRunning:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL syncInProgress = self->_syncInProgress;
  backupTasks = self->_backupTasks;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v8));
  id v10 = [v9 unsignedIntegerValue];
  BOOL v13 = syncInProgress && v9 != 0LL && v10 == 0LL;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)_queue_obtainPendingBackupTasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allPendingSyncOnBackupTasks]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        backupTasks = self->_backupTasks;
        int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "name", (void)v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( backupTasks,  "setObject:forKeyedSubscript:",  &off_100122398,  v11);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int64_t)totalClients
{
  return self->_totalClients;
}

- (void)setTotalClients:(int64_t)a3
{
  self->_totalClients = a3;
}

- (NSMutableDictionary)backupTasks
{
  return self->_backupTasks;
}

- (void)setBackupTasks:(id)a3
{
}

- (NSMutableArray)clientsWithErrors
{
  return self->_clientsWithErrors;
}

- (void)setClientsWithErrors:(id)a3
{
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_BOOL syncInProgress = a3;
}

- (void).cxx_destruct
{
}

@end