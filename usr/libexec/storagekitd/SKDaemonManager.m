@interface SKDaemonManager
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
- (BOOL)addAppearedDisk:(id)a3;
- (BOOL)delayedAPFSDiskNotificationWithDisk:(id)a3 wholeDisk:(id)a4;
- (BOOL)diskHasMutated:(id)a3 rawIOContent:(id)a4 diskDesc:(id)a5 mediaUUID:(id)a6;
- (BOOL)diskListCompleteReceived;
- (NSMutableArray)disksNotificationsWaiters;
- (NSMutableArray)syncAllDisksSemaphores;
- (NSMutableDictionary)preIdleOperationMap;
- (NSObject)lastDiskObjectIDLock;
- (NSString)lastOperationName;
- (OS_dispatch_queue)diskArbCallbacksQueue;
- (OS_dispatch_queue)notificationsSyncQueue;
- (OS_dispatch_queue)waitForCompletionQueue;
- (SKDaemonManager)init;
- (SKMultiSerialQueue)boosterQueue;
- (SKMultiSerialQueue)notificationsProcessingQueue;
- (SKNotificationsCache)notificationsCache;
- (__DASession)diskArbSession;
- (id)_apfsStoreDiskWithUUID:(id)a3;
- (id)_cachedDiskWithDADisk:(id)a3;
- (id)_cachedDiskWithDiskIdentifier:(id)a3;
- (id)_diskOperationIdentifierWithDADisk:(id)a3;
- (id)_diskWithDADisk:(id)a3;
- (id)_filesystemForDMFilesystemType:(id)a3 isEncrypted:(BOOL)a4;
- (id)_filesystemForIOContent:(id)a3;
- (id)_filesystemForUnlocalizedName:(id)a3 dmPersonality:(id)a4;
- (id)_firstFilesystemForMajorType:(id)a3;
- (id)_fullRecacheWithDisks:(id)a3 options:(unint64_t)a4;
- (id)_processAppearedOrChangedWithDisk:(id)a3 operation:(id)a4;
- (id)_processDiskNotificationsForMap:(id)a3 isCompleteDiskList:(BOOL)a4;
- (id)_recacheSyncDisk:(id)a3;
- (id)allDisks;
- (id)copyExtendedDiskInfoWithDiskIdentifier:(id)a3;
- (id)copyUpdatedDADiskForDisk:(id)a3;
- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5;
- (id)rootWholeDisk;
- (id)wholeDiskForDisk:(id)a3;
- (unint64_t)lastDiskObjectID;
- (unint64_t)nextDiskObjectID;
- (void)_addToExtendedDiskInfoCacheWithDictionary:(id)a3;
- (void)_advanceOperationQueue;
- (void)_advanceOperationQueueOnWorkQueue;
- (void)_diskEjectThread;
- (void)_diskQueueHeartbeat;
- (void)_diskQueueWatchdog;
- (void)_disksAppeared:(id)a3;
- (void)_disksChanged:(id)a3;
- (void)_disksDisappeared:(id)a3;
- (void)_doBlockOnEjectThread:(id)a3;
- (void)_doBlockOnWorkThread:(id)a3;
- (void)_fastRecacheWithDisks:(id)a3 options:(unint64_t)a4;
- (void)_handleDANotificationWithDisk:(id)a3 operation:(id)a4;
- (void)_idleCallback;
- (void)_invalidateExtendedDiskInfoCache;
- (void)_notifyLockedDisksNotificationsWaitersWithDisk:(id)a3;
- (void)_performDiskStateUpdateSelector:(SEL)a3 onListener:(id)a4 withDisks:(id)a5;
- (void)_processDiskNotificationsWithCompleteDiskList:(BOOL)a3;
- (void)_processNotificationWithDiskOperation:(id)a3;
- (void)_processNotificationsWithDiskOperations:(id)a3;
- (void)_scheduleGenericOperationWithCompletionBlock:(id)a3;
- (void)_scheduleOperation:(id)a3;
- (void)_workerThread;
- (void)addChangedDisk:(id)a3;
- (void)addDisappearedDisk:(id)a3;
- (void)addListener:(id)a3;
- (void)addMissingDisappearedDisks;
- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4;
- (void)createDASession;
- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4;
- (void)dispatchBoostedToWorkThread:(id)a3;
- (void)dispatchSyncToEjectThread:(id)a3;
- (void)dispatchSyncToWorkThread:(id)a3;
- (void)dispatchToEjectThread:(id)a3;
- (void)dispatchToWorkThread:(id)a3;
- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6;
- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5;
- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5;
- (void)dmAsyncStartedForDisk:(__DADisk *)a3;
- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)filesystemsWithCallbackBlock:(id)a3;
- (void)isBusy:(id)a3;
- (void)performVMDiskResizeWithSize:(unint64_t)a3;
- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4;
- (void)postProcessWithDisk:(id)a3;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5;
- (void)registerDiskArbCallbacks;
- (void)removeListener:(id)a3;
- (void)removePostProcessWithCachedDisk:(id)a3;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5;
- (void)setBoosterQueue:(id)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5;
- (void)setDiskArbCallbacksQueue:(id)a3;
- (void)setDiskListCompleteReceived:(BOOL)a3;
- (void)setDisksNotificationsWaiters:(id)a3;
- (void)setLastDiskObjectID:(unint64_t)a3;
- (void)setLastDiskObjectIDLock:(id)a3;
- (void)setLastOperationName:(id)a3;
- (void)setNotificationsCache:(id)a3;
- (void)setNotificationsProcessingQueue:(id)a3;
- (void)setNotificationsSyncQueue:(id)a3;
- (void)setPreIdleOperationMap:(id)a3;
- (void)setSyncAllDisksSemaphores:(id)a3;
- (void)setWaitForCompletionQueue:(id)a3;
- (void)startForceIdleTimer;
- (void)syncAllDisksWithCompletionBlock:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)updatePhysicalStoresWithContainer:(id)a3;
- (void)updatePhysicalStoresWithDisks:(id)a3;
- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4;
- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4;
@end

@implementation SKDaemonManager

+ (id)sharedManager
{
  if (qword_100051B88 != -1) {
    dispatch_once(&qword_100051B88, &stru_1000452C0);
  }
  return (id)qword_100051B80;
}

- (void)createDASession
{
  while (1)
  {
    v3 = DASessionCreate(0LL);
    self->daSession = v3;
    if (v3) {
      break;
    }
    id v8 = sub_10000E2BC();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SKDaemonManager createDASession]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: DASessionCreate failed, retrying",  buf,  0xCu);
    }

LABEL_9:
    sleep(1u);
  }

  DASessionSetDispatchQueue(v3, (dispatch_queue_t)self->_diskArbCallbacksQueue);
  int v4 = DASessionKeepAlive(self->daSession, self->_diskArbCallbacksQueue);
  if (v4)
  {
    int v5 = v4;
    id v6 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SKDaemonManager createDASession]";
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: DASessionKeepAlive failed with code %d, retrying",  buf,  0x12u);
    }

    DASessionSetDispatchQueue(self->daSession, 0LL);
    CFRelease(self->daSession);
    goto LABEL_9;
  }

- (SKDaemonManager)init
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___SKDaemonManager;
  v2 = -[SKDaemonManager init](&v47, "init");
  if (v2)
  {
    v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 10LL);
    allDisks = v2->allDisks;
    v2->allDisks = v3;

    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v5);
    diskOperationMap = v2->_diskOperationMap;
    v2->_diskOperationMap = (NSMutableDictionary *)v6;

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
    preIdleOperationMap = v2->_preIdleOperationMap;
    v2->_preIdleOperationMap = (NSMutableDictionary *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingOperations = v2->pendingOperations;
    v2->pendingOperations = v11;

    int v13 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 1LL);
    listeners = v2->_listeners;
    v2->_listeners = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    syncAllDisksSemaphores = v2->_syncAllDisksSemaphores;
    v2->_syncAllDisksSemaphores = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    extendedDiskInfoCache = v2->_extendedDiskInfoCache;
    v2->_extendedDiskInfoCache = (NSMutableDictionary *)v17;

    uint64_t v20 = objc_opt_new(&OBJC_CLASS___NSObject, v19);
    lastDiskObjectIDLock = v2->_lastDiskObjectIDLock;
    v2->_lastDiskObjectIDLock = v20;

    uint64_t v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v22);
    disksNotificationsWaiters = v2->_disksNotificationsWaiters;
    v2->_disksNotificationsWaiters = (NSMutableArray *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.StorageKit.notification", 0LL);
    diskNotificationQueue = v2->diskNotificationQueue;
    v2->diskNotificationQueue = (OS_dispatch_queue *)v25;

    v27 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v2,  "_workerThread",  0LL);
    diskWorkThread = v2->diskWorkThread;
    v2->diskWorkThread = v27;

    v29 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v2,  "_diskEjectThread",  0LL);
    diskEjectThread = v2->diskEjectThread;
    v2->diskEjectThread = v29;

    v2->runHeartbeatThread = 0;
    -[NSThread start](v2->diskWorkThread, "start");
    -[NSThread start](v2->diskEjectThread, "start");
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.StorageKit.watchdog", 0LL);
    diskWorkQueueWatchDog = v2->diskWorkQueueWatchDog;
    v2->diskWorkQueueWatchDog = (OS_dispatch_queue *)v31;

    dispatch_queue_t v33 = dispatch_queue_create("com.apple.StorageKit.heartbeat", 0LL);
    heartbeatSynchronizationQueue = v2->_heartbeatSynchronizationQueue;
    v2->_heartbeatSynchronizationQueue = (OS_dispatch_queue *)v33;

    v35 = -[SKMultiSerialQueue initWithName:]( objc_alloc(&OBJC_CLASS___SKMultiSerialQueue),  "initWithName:",  @"com.apple.StorageKit.notifications.processing");
    notificationsProcessingQueue = v2->_notificationsProcessingQueue;
    v2->_notificationsProcessingQueue = v35;

    dispatch_queue_t v37 = dispatch_queue_create("com.apple.StorageKit.initial.populate", 0LL);
    waitForCompletionQueue = v2->_waitForCompletionQueue;
    v2->_waitForCompletionQueue = (OS_dispatch_queue *)v37;

    v39 = -[SKMultiSerialQueue initWithName:]( objc_alloc(&OBJC_CLASS___SKMultiSerialQueue),  "initWithName:",  @"com.apple.StorageKit.booster");
    boosterQueue = v2->_boosterQueue;
    v2->_boosterQueue = v39;

    sub_100012214(v2->diskNotificationQueue, "kDiskNotificationQueueTag");
    dispatch_queue_t v41 = dispatch_queue_create("com.apple.StorageKit.notifications.sync", 0LL);
    notificationsSyncQueue = v2->_notificationsSyncQueue;
    v2->_notificationsSyncQueue = (OS_dispatch_queue *)v41;

    dispatch_queue_t v43 = dispatch_queue_create("com.apple.StorageKit.DiskArbCallbacks", 0LL);
    diskArbCallbacksQueue = v2->_diskArbCallbacksQueue;
    v2->_diskArbCallbacksQueue = (OS_dispatch_queue *)v43;

    daForceIdleTimer = v2->daForceIdleTimer;
    v2->daForceIdleTimer = 0LL;

    IOEngineInitialize(-[SKDaemonManager createDASession](v2, "createDASession"));
    -[SKDaemonManager registerDiskArbCallbacks](v2, "registerDiskArbCallbacks");
  }

  return v2;
}

- (void)_workerThread
{
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPort port](&OBJC_CLASS___NSPort, "port"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  [v5 setName:@"Storage Kit Work Thread"];

  if (v4) {
    [v3 addPort:v4 forMode:NSRunLoopCommonModes];
  }
  [v3 run];

  objc_autoreleasePoolPop(v2);
}

- (void)_diskEjectThread
{
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPort port](&OBJC_CLASS___NSPort, "port"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  [v5 setName:@"Storage Kit Disk Eject Thread"];

  if (v4) {
    [v3 addPort:v4 forMode:NSRunLoopCommonModes];
  }
  [v3 run];

  objc_autoreleasePoolPop(v2);
}

- (void)dispatchToWorkThread:(id)a3
{
  diskWorkThread = self->diskWorkThread;
  id v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_doBlockOnWorkThread:",  diskWorkThread,  v5,  0LL);
}

- (void)dispatchSyncToWorkThread:(id)a3
{
  diskWorkThread = self->diskWorkThread;
  id v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_doBlockOnWorkThread:",  diskWorkThread,  v5,  1LL);
}

- (void)_doBlockOnWorkThread:(id)a3
{
}

- (void)dispatchToEjectThread:(id)a3
{
  diskEjectThread = self->diskEjectThread;
  id v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_doBlockOnEjectThread:",  diskEjectThread,  v5,  0LL);
}

- (void)dispatchSyncToEjectThread:(id)a3
{
  diskEjectThread = self->diskEjectThread;
  id v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_doBlockOnEjectThread:",  diskEjectThread,  v5,  1LL);
}

- (void)_doBlockOnEjectThread:(id)a3
{
}

- (void)dispatchBoostedToWorkThread:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager boosterQueue](self, "boosterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001B8D0;
  v7[3] = &unk_100045330;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchWithBlock:v7];
}

- (void)registerDiskArbCallbacks
{
}

- (void)addListener:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  -[NSMutableSet addObject:](self->_listeners, "addObject:", v6);
  if ([v4 count]) {
    -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:]( self,  "_performDiskStateUpdateSelector:onListener:withDisks:",  "disksAppeared:",  v6,  v4);
  }
  objc_sync_exit(v5);
}

- (void)removeListener:(id)a3
{
  id v5 = a3;
  id v4 = self->_listeners;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](self->_listeners, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (id)allDisks
{
  v3 = self->allDisks;
  objc_sync_enter(v3);
  id v4 = -[NSMutableArray copy](self->allDisks, "copy");
  objc_sync_exit(v3);

  return v4;
}

+ (id)defaultVisibleRoles
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  kSKDiskRoleLegacyMacData,  kSKDiskRoleLegacyMacSystem,  kSKDiskRoleMacData,  kSKDiskRoleMacSystem,  kSKDiskRoleWindowsData,  0LL);
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"diskIdentifier"]);
  id v5 = v4;
  if (v4)
  {
    DADiskRef v6 = DADiskCreateFromBSDName( 0, self->daSession, (const char *)[v4 UTF8String]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)rootWholeDisk
{
  v3 = self->allDisks;
  objc_sync_enter(v3);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = self->allDisks;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v19,  v29,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mountPoint", (void)v19));
        unsigned int v10 = [v9 isEqualToString:@"/"];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v19,  v29,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)performVMDiskResizeWithSize:(unint64_t)a3
{
  id v5 = sub_10000E2BC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = (const char *)a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requested to resize the VM's internal disk to %lld bytes",  buf,  0xCu);
  }

  id v7 = sub_10000E2BC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Root disk (the system's snapshot) might appear after first DA idle, waiting a bit",  buf,  0xCu);
  }

  sleep(1u);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001C408;
  v9[3] = &unk_100045378;
  v9[4] = self;
  v9[5] = a3;
  -[SKDaemonManager syncAllDisksWithCompletionBlock:](self, "syncAllDisksWithCompletionBlock:", v9);
}

- (void)_diskQueueHeartbeat
{
  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = (dispatch_queue_s *)self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C7BC;
    block[3] = &unk_100044B50;
    block[4] = self;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10001C7FC;
    v5[3] = &unk_100044B50;
    v5[4] = self;
    dispatch_after(v4, &_dispatch_main_q, v5);
  }

- (void)_diskQueueWatchdog
{
  uint64_t v29 = 0LL;
  v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = (dispatch_queue_s *)self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CC00;
    block[3] = &unk_1000453A0;
    block[4] = self;
    void block[5] = &v29;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    if (v30[3] <= 10.0)
    {
      if (self->diskQueueStuck)
      {
        self->diskQueueStuck = 0;
        id v7 = self->_listeners;
        objc_sync_enter(v7);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v8 = self->_listeners;
        id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v33,  16LL);
        if (v13)
        {
          uint64_t v14 = *(void *)v21;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v8);
              }
              v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
              if ((objc_opt_respondsToSelector(v16, "managerResumed") & 1) != 0) {
                [v16 managerResumed];
              }
            }

            id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v33,  16LL);
          }

          while (v13);
        }

        goto LABEL_26;
      }
    }

    else if (!self->diskQueueStuck)
    {
      self->diskQueueStuck = 1;
      id v4 = sub_10000E2BC();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager lastOperationName](self, "lastOperationName"));
        *(_DWORD *)buf = 138412290;
        v36 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Disk queue stuck, last operation: %@",  buf,  0xCu);
      }

      id v7 = self->_listeners;
      objc_sync_enter(v7);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v8 = self->_listeners;
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
      if (v9)
      {
        uint64_t v10 = *(void *)v25;
        do
        {
          for (j = 0LL; j != v9; j = (char *)j + 1)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v8);
            }
            __int16 v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
            if ((objc_opt_respondsToSelector(v12, "managerStalled") & 1) != 0) {
              [v12 managerStalled];
            }
          }

          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
        }

        while (v9);
      }

- (id)_cachedDiskWithDiskIdentifier:(id)a3
{
  id v4 = a3;
  if (sub_10001232C(v4))
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "diskIdentifier", (void)v14));
          unsigned int v12 = [v4 isEqual:v11];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_13;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)_cachedDiskWithDADisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daDisk", (void)v15));
          if (v11)
          {
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 daDisk]);
            unsigned int v13 = [v4 isEqual:v12];

            if (v13)
            {
              id v7 = v10;
              goto LABEL_14;
            }
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)_diskWithDADisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v4));
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }

    else
    {
      uint64_t v16 = 0LL;
      __int128 v17 = &v16;
      uint64_t v18 = 0x3032000000LL;
      __int128 v19 = sub_10001D184;
      __int128 v20 = sub_10001D194;
      id v21 = 0LL;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonManager _diskOperationIdentifierWithDADisk:]( self,  "_diskOperationIdentifierWithDADisk:",  v4));
      __int128 v24 = v8;
      v22[0] = off_100051AF8;
      v22[1] = off_100051AC0;
      v23[0] = v4;
      v23[1] = off_100051AE8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
      __int128 v25 = v9;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001D19C;
      v13[3] = &unk_1000453C8;
      __int128 v15 = &v16;
      v13[4] = self;
      id v11 = v10;
      id v14 = v11;
      -[SKDaemonManager dispatchSyncToEjectThread:](self, "dispatchSyncToEjectThread:", v13);
      id v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = a3;
  id v11 = -[SKRenameOperation initWithDisk:name:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKRenameOperation),  "initWithDisk:name:withCompletionBlock:",  v10,  v8,  v9);

  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    [v12 _scheduleOperation:v11];
  }

  else
  {
    id v13 = sub_10000E2BC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Could not rename disk %@ to %@",  (uint8_t *)&v15,  0x16u);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 102LL, 0LL));
    v9[2](v9, v12);
  }
}

- (id)_apfsStoreDiskWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apfsUUID", (void)v15));
            unsigned int v13 = [v12 isEqualToString:v4];

            if (v13)
            {
              id v7 = v10;
              goto LABEL_14;
            }
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

- (__DASession)diskArbSession
{
  return self->daSession;
}

- (void)_invalidateExtendedDiskInfoCache
{
  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_extendedDiskInfoCache, "removeAllObjects");
  objc_sync_exit(obj);
}

- (void)_addToExtendedDiskInfoCacheWithDictionary:(id)a3
{
  id v4 = a3;
  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedDiskInfoCache,  "objectForKeyedSubscript:",  v9));

        if (v10)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedDiskInfoCache,  "objectForKeyedSubscript:",  v9));
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
          [v11 addEntriesFromDictionary:v12];
        }

        else
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_extendedDiskInfoCache,  "setObject:forKeyedSubscript:",  v12,  v9);
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_sync_exit(obj);
}

- (id)copyExtendedDiskInfoWithDiskIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_extendedDiskInfoCache;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedDiskInfoCache,  "objectForKeyedSubscript:",  v4));
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  return v7;
}

- (id)copyUpdatedDADiskForDisk:(id)a3
{
  id v4 = a3;
  if ([v4 isIOMediaDisk])
  {
    daSession = self->daSession;
    id v6 = objc_claimAutoreleasedReturnValue([v4 diskIdentifier]);
    DADiskRef v7 = DADiskCreateFromBSDName(0, daSession, (const char *)[v6 UTF8String]);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 mountPoint]);

    if (!v8)
    {
      DADiskRef v10 = 0LL;
      goto LABEL_7;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 mountPoint]);
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));

    DADiskRef v7 = DADiskCreateFromVolumePath(0LL, self->daSession, (CFURLRef)v6);
  }

  DADiskRef v10 = v7;

LABEL_7:
  return v10;
}

- (void)_fastRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  __int128 v16 = self;
  -[SKDaemonManager _invalidateExtendedDiskInfoCache](self, "_invalidateExtendedDiskInfoCache");
  DADiskRef v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v13 _supportsRecaching])
        {
          id v14 = sub_10000E2BC();
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            __int128 v22 = "-[SKDaemonManager _fastRecacheWithDisks:options:]";
            __int16 v23 = 2112;
            __int128 v24 = v13;
            __int16 v25 = 1024;
            int v26 = v4;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ options=0x%x", buf, 0x1Cu);
          }

          [v13 _cacheSpacesWithPurgeable:(v4 & 4) == 0];
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }

    while (v10);
  }

  -[SKDaemonManager _disksChanged:](v16, "_disksChanged:", v7);
}

- (id)_fullRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  int v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  dispatch_queue_t v37 = sub_10001D184;
  v38 = sub_10001D194;
  id v39 = 0LL;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v31;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v24 = v8;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "_supportsRecaching", v24))
        {
          id v12 = -[SKDaemonManager copyUpdatedDADiskForDisk:](self, "copyUpdatedDADiskForDisk:", v11);
          unsigned int v13 = v12;
          if (v12)
          {
            v44[0] = off_100051AF8;
            v44[1] = off_100051AC0;
            v45[0] = v12;
            v45[1] = off_100051AE0;
            v44[2] = off_100051AF0;
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a4));
            v45[2] = v14;
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 diskIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v15, v16);

            id v17 = sub_10000E2BC();
            __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              dispatch_queue_t v41 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              __int16 v42 = 2112;
              dispatch_queue_t v43 = v11;
              __int128 v19 = v18;
              __int128 v20 = "%s: Recaching %@";
              goto LABEL_12;
            }
          }

          else
          {
            id v21 = sub_10000E2BC();
            __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              dispatch_queue_t v41 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              __int16 v42 = 2112;
              dispatch_queue_t v43 = v11;
              __int128 v19 = v18;
              __int128 v20 = "%s: Failed to create an updated DADiskRef for %@";
LABEL_12:
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
            }
          }

          continue;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }

    while (v7);
  }

  if (-[NSMutableDictionary count](v26, "count"))
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10001DE4C;
    v27[3] = &unk_1000453C8;
    uint64_t v29 = &v34;
    v27[4] = self;
    v28 = v26;
    -[SKDaemonManager dispatchSyncToEjectThread:](self, "dispatchSyncToEjectThread:", v27);
  }

  id v22 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if (v8
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 diskIdentifier]), v10, v10))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v8));
    if ((a4 & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 children]);
      if (v12) {
        [v11 addObjectsFromArray:v12];
      }
    }

    if ((a4 & 2) != 0)
    {
      -[SKDaemonManager _fastRecacheWithDisks:options:](self, "_fastRecacheWithDisks:options:", v11, a4);
      if (v9) {
        v9[2](v9);
      }
    }

    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001DFDC;
      v13[3] = &unk_1000453F0;
      v13[4] = self;
      id v14 = v11;
      unint64_t v16 = a4;
      __int128 v15 = v9;
      -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v13);
    }
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (id)_recacheSyncDisk:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v8 = a3;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _fullRecacheWithDisks:options:](self, "_fullRecacheWithDisks:options:", v5, 0LL, v8));
  return v6;
}

- (void)_scheduleOperation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager boosterQueue](self, "boosterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E174;
  v7[3] = &unk_100044EB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchWithBlock:v7];
}

- (void)_advanceOperationQueue
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001E4B0;
  v2[3] = &unk_100044B50;
  v2[4] = self;
  -[SKDaemonManager dispatchToWorkThread:](self, "dispatchToWorkThread:", v2);
}

- (void)_advanceOperationQueueOnWorkQueue
{
  if (self->currentOperation)
  {
    id v3 = sub_10000E2BC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      currentOperation = self->currentOperation;
      int v15 = 138412290;
      unint64_t v16 = (const char *)currentOperation;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Finished operation: %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  if (-[NSMutableArray count](self->pendingOperations, "count"))
  {
    id v6 = (SKManagerOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->pendingOperations,  "objectAtIndexedSubscript:",  0LL));
    id v7 = self->currentOperation;
    self->currentOperation = v6;

    -[NSMutableArray removeObjectAtIndex:](self->pendingOperations, "removeObjectAtIndex:", 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation description](self->currentOperation, "description"));
    -[SKDaemonManager setLastOperationName:](self, "setLastOperationName:", v8);

    id v9 = sub_10000E2BC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->currentOperation;
      int v15 = 138412290;
      unint64_t v16 = (const char *)v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Running operation: %@",  (uint8_t *)&v15,  0xCu);
    }

    -[SKManagerOperation run](self->currentOperation, "run");
  }

  else
  {
    self->runHeartbeatThread = 0;
    -[SKDaemonManager setLastOperationName:](self, "setLastOperationName:", 0LL);
    id v12 = self->currentOperation;
    self->currentOperation = 0LL;

    id v13 = sub_10000E2BC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      unint64_t v16 = "-[SKDaemonManager _advanceOperationQueueOnWorkQueue]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Operation queue is empty",  (uint8_t *)&v15,  0xCu);
    }
  }

- (void)_scheduleGenericOperationWithCompletionBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___SKGenericOperation, v4);
  [v5 setCompletionBlock:v6];
  if (v5) {
    -[SKDaemonManager _scheduleOperation:](self, "_scheduleOperation:", v5);
  }
  else {
    v6[2]();
  }
}

- (void)_disksChanged:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 120LL;
  obj = self->_listeners;
  objc_sync_enter(obj);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (objc_msgSend(v5, "containsObject:", v11, v18))
        {
          -[NSMutableArray addObject:](v6, "addObject:", v11);
        }

        else
        {
          id v12 = sub_10000E2BC();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            __int128 v30 = "-[SKDaemonManager _disksChanged:]";
            __int16 v31 = 2112;
            uint64_t v32 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %@ disappeared, skipping changed notification",  buf,  0x16u);
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }

    while (v8);
  }

  sub_10000E448(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks changed:", v6);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = *(id *)&self->SKBaseManager_opaque[v18];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:]( self,  "_performDiskStateUpdateSelector:onListener:withDisks:",  "disksChanged:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)j),  v6,  v18);
      }

      id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)_disksAppeared:(id)a3
{
  id v4 = a3;
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000E448(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks appeared:", v4);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_listeners;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:]( self,  "_performDiskStateUpdateSelector:onListener:withDisks:",  "disksAppeared:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  v4,  (void)v10);
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_disksDisappeared:(id)a3
{
  id v4 = a3;
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000E448(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks disappeared:", v4);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_listeners;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:]( self,  "_performDiskStateUpdateSelector:onListener:withDisks:",  "disksDisappeared:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  v4,  (void)v10);
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_performDiskStateUpdateSelector:(SEL)a3 onListener:(id)a4 withDisks:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) dictionaryRepresentation]);
        [v9 addObject:v15];

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
  }

  if ((objc_opt_respondsToSelector(v7, a3) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector(v7, "visibleDiskRoles") & 1) != 0
      && (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 visibleDiskRoles]), v16, v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10001EF28;
      v20[3] = &unk_100045418;
      id v17 = v7;
      id v21 = v17;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v20));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v18]);
      [v17 performSelector:a3 withObject:v19];
    }

    else
    {
      [v7 performSelector:a3 withObject:v9];
    }
  }
}

- (unint64_t)nextDiskObjectID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager lastDiskObjectIDLock](self, "lastDiskObjectIDLock"));
  objc_sync_enter(v3);
  unint64_t v4 = self->_lastDiskObjectID + 1;
  self->_lastDiskObjectID = v4;
  objc_sync_exit(v3);

  return v4;
}

- (void)startForceIdleTimer
{
  if (!self->daForceIdleTimer)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10001F080;
    v5[3] = &unk_100045440;
    v5[4] = self;
    id v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v5,  10.0));
    daForceIdleTimer = self->daForceIdleTimer;
    self->daForceIdleTimer = v3;
  }

- (void)_idleCallback
{
  id v3 = sub_10000E2BC();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[SKDaemonManager _idleCallback]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: DA idle received", buf, 0xCu);
  }

  daForceIdleTimer = self->daForceIdleTimer;
  if (daForceIdleTimer)
  {
    -[NSTimer invalidate](daForceIdleTimer, "invalidate");
    id v6 = self->daForceIdleTimer;
    self->daForceIdleTimer = 0LL;
  }

  unsigned __int8 v7 = -[SKDaemonManager diskListCompleteReceived](self, "diskListCompleteReceived");
  -[SKDaemonManager setDiskListCompleteReceived:](self, "setDiskListCompleteReceived:", 0LL);
  id v8 = self->_diskOperationMap;
  objc_sync_enter(v8);
  diskOperationMap = self->_diskOperationMap;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
  -[NSMutableDictionary addEntriesFromDictionary:](diskOperationMap, "addEntriesFromDictionary:", v10);

  objc_sync_exit(v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
  [v11 removeAllObjects];

  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsSyncQueue](self, "notificationsSyncQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001F2AC;
  v13[3] = &unk_100045468;
  v13[4] = self;
  unsigned __int8 v14 = v7;
  dispatch_async(v12, v13);
}

- (id)_diskOperationIdentifierWithDADisk:(id)a3
{
  id v3 = (__DADisk *)a3;
  BSDName = DADiskGetBSDName(v3);
  if (BSDName)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", BSDName));
    if (!v5)
    {
LABEL_3:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    }
  }

  else
  {
    CFDictionaryRef v8 = DADiskCopyDescription(v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumeLifsURLKey));
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumePathKey));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v9, v11));
    }

    else
    {
      id v5 = 0LL;
    }

    if (!v5) {
      goto LABEL_3;
    }
  }

  return v5;
}

- (void)_handleDANotificationWithDisk:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    CFDictionaryRef v8 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonManager _diskOperationIdentifierWithDADisk:]( self,  "_diskOperationIdentifierWithDADisk:",  v6));
    v14[0] = off_100051AF8;
    v14[1] = off_100051AC0;
    v15[0] = v6;
    v15[1] = v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
    [v10 setObject:v9 forKeyedSubscript:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
    objc_sync_enter(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
    BOOL v13 = [v12 count] == 0;

    if (!v13) {
      -[SKDaemonManager _notifyLockedDisksNotificationsWaitersWithDisk:]( self,  "_notifyLockedDisksNotificationsWaitersWithDisk:",  v6);
    }
    objc_sync_exit(v11);
  }

  -[SKDaemonManager startForceIdleTimer](self, "startForceIdleTimer");
}

- (void)_notifyLockedDisksNotificationsWaitersWithDisk:(id)a3
{
  CFDictionaryRef v4 = DADiskCopyDescription((DADiskRef)a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  kDADiskDescriptionMediaBSDNameKey));
  if (!v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumeLifsURLKey));
    if (!v6) {
      goto LABEL_14;
    }
    id v7 = (void *)v6;
    CFDictionaryRef v8 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](v8, "host"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"apfs://%@", v9));
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 expectedDiskIdentifier]);
        unsigned int v17 = [v16 isEqual:v5];

        if (v17)
        {
          uint64_t v18 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v15 semaphore]);
          dispatch_semaphore_signal(v18);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }

LABEL_14:
}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncStartedForDisk:") & 1) != 0) {
    -[SKManagerOperation dmAsyncStartedForDisk:](self->currentOperation, "dmAsyncStartedForDisk:", a3);
  }
}

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  BOOL v6 = a4;
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncProgressForDisk:barberPole:percent:") & 1) != 0)
  {
    *(float *)&double v9 = a5;
    -[SKManagerOperation dmAsyncProgressForDisk:barberPole:percent:]( self->currentOperation,  "dmAsyncProgressForDisk:barberPole:percent:",  a3,  v6,  v9);
  }

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncMessageForDisk:string:dictionary:") & 1) != 0) {
    -[SKManagerOperation dmAsyncMessageForDisk:string:dictionary:]( self->currentOperation,  "dmAsyncMessageForDisk:string:dictionary:",  a3,  v9,  v8);
  }
}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  id v10 = a6;
  if (a3) {
    CFRetain(a3);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001FC9C;
  v12[3] = &unk_1000454B8;
  id v13 = v10;
  unsigned __int8 v14 = a3;
  int v15 = a4;
  int v16 = a5;
  v12[4] = self;
  id v11 = v10;
  -[SKDaemonManager dispatchToWorkThread:](self, "dispatchToWorkThread:", v12);
}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager waitForCompletionQueue](self, "waitForCompletionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001FD98;
  v7[3] = &unk_100045330;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020078;
  v7[3] = &unk_1000454E0;
  id v8 = a5;
  id v6 = v8;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v7);
}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002012C;
  v8[3] = &unk_100045508;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v8);
}

- (id)wholeDiskForDisk:(id)a3
{
  id v4 = a3;
  if ([v4 isWholeDisk])
  {
    id v5 = v4;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 daDisk]);

    if (v6)
    {
      id v7 = (__DADisk *)objc_claimAutoreleasedReturnValue([v4 daDisk]);
      DADiskRef v8 = DADiskCopyWholeDisk(v7);

      if (v8) {
        id v5 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v8));
      }
      else {
        id v5 = 0LL;
      }
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020480;
  v7[3] = &unk_100045508;
  DADiskRef v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[SKDaemonManager dispatchBoostedToWorkThread:](v8, "dispatchBoostedToWorkThread:", v7);
}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100020570;
  v9[3] = &unk_100045530;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v9);
}

- (void)isBusy:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002070C;
  v4[3] = &unk_100045308;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[SKDaemonManager dispatchBoostedToWorkThread:](v5, "dispatchBoostedToWorkThread:", v4);
}

- (id)formatableFileSystems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100045550));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredArrayUsingPredicate:v3]);

  return v4;
}

- (void)filesystemsWithCallbackBlock:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v10),  "dictionaryRepresentation",  (void)v12));
        [v5 addObject:v11];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  if (v3) {
    v3[2](v3, v5);
  }
}

- (id)_filesystemForDMFilesystemType:(id)a3 isEncrypted:(BOOL)a4
{
  int v4 = a4;
  id v5 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dmPersonality", (void)v16));
        if ([v12 isEqualToString:v5])
        {
          unsigned int v13 = [v11 isEncrypted];

          if (v13 == v4)
          {
            id v14 = v11;
            goto LABEL_13;
          }
        }

        else
        {
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = 0LL;
LABEL_13:

  return v14;
}

- (id)_filesystemForIOContent:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentMask", (void)v12));
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if ((v10 & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)_firstFilesystemForMajorType:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "majorType", (void)v12));
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if ((v10 & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)_filesystemForUnlocalizedName:(id)a3 dmPersonality:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](&OBJC_CLASS___SKFilesystem, "buildFilesystems"));
  id v8 = v7;
  if (v5)
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      __int128 v27 = v8;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unlocalizedName]);
          if ([v5 isEqualToString:v15])
          {

            goto LABEL_24;
          }

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 unlocalizedEncryptedName]);
          unsigned __int8 v17 = [v5 isEqualToString:v16];

          if ((v17 & 1) != 0) {
            goto LABEL_24;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        id v18 = 0LL;
        id v8 = v27;
        if (v11) {
          continue;
        }
        goto LABEL_25;
      }
    }
  }

  else
  {
    if (!v6)
    {
      id v18 = 0LL;
      goto LABEL_26;
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v19 = v7;
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v29;
      __int128 v27 = v8;
      while (2)
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          __int128 v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v14 dmPersonality]);
          unsigned __int8 v25 = [v6 isEqualToString:v24];

          if ((v25 & 1) != 0)
          {
LABEL_24:
            id v18 = v14;
            id v8 = v27;
            goto LABEL_25;
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
        id v18 = 0LL;
        id v8 = v27;
        if (v21) {
          continue;
        }
        goto LABEL_25;
      }
    }
  }

  id v18 = 0LL;
LABEL_25:

LABEL_26:
  return v18;
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
  id v26 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v26 && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v26 daDisk]), v7, v7))
  {
    id v8 = objc_alloc(&OBJC_CLASS___SKIOMedia);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v26 daDisk]);
    id v10 = -[SKIOMedia initWithDADisk:](v8, "initWithDADisk:", v9);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SKIOObject ioObjectWithClassName:iterateParents:]( v10,  "ioObjectWithClassName:iterateParents:",  @"AppleAPFSContainer",  1LL));
    id v12 = [v11 copyParent];
    __int128 v13 = v12;
    if (v12)
    {
      __int128 v24 = v11;
      unsigned __int8 v25 = v10;
      id v23 = v12;
      id v14 = [v12 newIteratorWithOptions:2];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v16 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v14);
      if (v16)
      {
        unsigned __int8 v17 = v16;
        do
        {
          if (IOObjectConformsTo(-[SKIOObject ioObj](v17, "ioObj"), "IOMedia"))
          {
            daSession = self->daSession;
            id v19 = objc_claimAutoreleasedReturnValue(-[SKIOMedia BSDName](v17, "BSDName"));
            DADiskRef v20 = DADiskCreateFromBSDName(0, daSession, (const char *)[v19 fileSystemRepresentation]);

            if (v20)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v20));
              if (v21) {
                [v15 addObject:v21];
              }
            }
          }

          uint64_t v22 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v14);

          unsigned __int8 v17 = v22;
        }

        while (v22);
      }

      v6[2](v6, v15);

      id v11 = v24;
      id v10 = v25;
      __int128 v13 = v23;
    }

    else
    {
      v6[2](v6, &__NSArray0__struct);
    }
  }

  else
  {
    v6[2](v6, &__NSArray0__struct);
  }
}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
  id v34 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (v34 && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v34 daDisk]), v6, v6))
  {
    id v7 = (objc_class *)&selRef_initWithClassName_;
    id v8 = objc_alloc(&OBJC_CLASS___SKIOMedia);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v34 daDisk]);
    id v10 = -[SKIOMedia initWithDADisk:](v8, "initWithDADisk:", v9);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SKIOObject ioObjectWithClassName:iterateParents:]( v10,  "ioObjectWithClassName:iterateParents:",  @"AppleAPFSContainer",  0LL));
    if (v11)
    {
      __int128 v30 = v5;
      __int128 v32 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v31 = v11;
      id v13 = [v11 newIteratorWithOptions:0];
      id v14 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithIteratorNext:", v13);
      if (v14)
      {
        __int128 v15 = v14;
        __int128 v16 = &APFSCancelContainerResize_ptr;
        unsigned __int8 v17 = @"Content";
        id v18 = @"41504653-0000-11AA-AA11-00306543ECAC";
        do
        {
          if (IOObjectConformsTo(-[SKIOObject ioObj](v15, "ioObj"), "AppleAPFSVolume"))
          {
            id v19 = -[SKIOObject copyPropertyWithClass:key:]( v15,  "copyPropertyWithClass:key:",  objc_opt_class(v16[108]),  v17);
            DADiskRef v20 = v19;
            if (v19 && [v19 isEqualToString:v18])
            {
              id v21 = v18;
              uint64_t v22 = v7;
              id v23 = v17;
              __int128 v24 = v16;
              daSession = self->daSession;
              id v26 = objc_claimAutoreleasedReturnValue(-[SKIOMedia BSDName](v15, "BSDName"));
              DADiskRef v27 = DADiskCreateFromBSDName(0, daSession, (const char *)[v26 fileSystemRepresentation]);

              if (v27)
              {
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v27));
                if (v28) {
                  [v12 addObject:v28];
                }
              }

              __int128 v16 = v24;
              unsigned __int8 v17 = v23;
              id v7 = v22;
              id v18 = v21;
            }
          }

          __int128 v29 = (SKIOMedia *)[objc_alloc(v7 + 435) initWithIteratorNext:v13];

          __int128 v15 = v29;
        }

        while (v29);
      }

      id v5 = v30;
      v30[2](v30, v12);

      id v11 = v31;
      id v10 = v32;
    }

    else
    {
      v5[2](v5, &__NSArray0__struct);
    }
  }

  else
  {
    v5[2](v5, &__NSArray0__struct);
  }
}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = -[SKUnmountOperation initWithDisk:options:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKUnmountOperation),  "initWithDisk:options:withCompletionBlock:",  v7,  v9,  v8);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    [v11 _scheduleOperation:v10];
  }

  else
  {
    id v12 = sub_10000E2BC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Could not unmount disk %@",  (uint8_t *)&v14,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 102LL, 0LL));
    v8[2](v8, v11);
  }
}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = -[SKEjectOperation initWithDisk:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKEjectOperation),  "initWithDisk:withCompletionBlock:",  v5,  v6);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    [v8 _scheduleOperation:v7];
  }

  else
  {
    id v9 = sub_10000E2BC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not eject disk %@",  (uint8_t *)&v11,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 102LL, 0LL));
    v6[2](v6, v8);
  }
}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[SKEraseOperation initWithEraser:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKEraseOperation),  "initWithEraser:withCompletionBlock:",  v6,  v5);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  [v8 _scheduleOperation:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 progress]);
  return v9;
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, SKResizeOperation *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 daDisk]);

  if (!v9)
  {
    id v13 = sub_10000E2BC();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Tried to resize a disk with no DADiskRef!",  (uint8_t *)&v19,  2u);
    }

    id v10 = (SKResizeOperation *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:userInfo:",  117LL,  0LL));
    v8[2](v8, v10);
    goto LABEL_10;
  }

  id v10 = -[SKResizeOperation initWithDisk:toSize:withCompletionBlock:]( objc_alloc(&OBJC_CLASS___SKResizeOperation),  "initWithDisk:toSize:withCompletionBlock:",  v7,  a4,  v8);
  if (!v10)
  {
    id v15 = sub_10000E2BC();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Could not resize disk %@",  (uint8_t *)&v19,  0xCu);
    }

    unsigned __int8 v17 = (SKResizeOperation *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:userInfo:",  102LL,  0LL));
    v8[2](v8, v17);

LABEL_10:
    id v12 = 0LL;
    goto LABEL_11;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  [v11 _scheduleOperation:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](v10, "skProgress"));
LABEL_11:

  return v12;
}

- (SKNotificationsCache)notificationsCache
{
  return self->_notificationsCache;
}

- (void)setNotificationsCache:(id)a3
{
}

- (NSMutableArray)syncAllDisksSemaphores
{
  return self->_syncAllDisksSemaphores;
}

- (void)setSyncAllDisksSemaphores:(id)a3
{
}

- (OS_dispatch_queue)waitForCompletionQueue
{
  return self->_waitForCompletionQueue;
}

- (void)setWaitForCompletionQueue:(id)a3
{
}

- (SKMultiSerialQueue)boosterQueue
{
  return self->_boosterQueue;
}

- (void)setBoosterQueue:(id)a3
{
}

- (SKMultiSerialQueue)notificationsProcessingQueue
{
  return self->_notificationsProcessingQueue;
}

- (void)setNotificationsProcessingQueue:(id)a3
{
}

- (NSString)lastOperationName
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setLastOperationName:(id)a3
{
}

- (NSMutableArray)disksNotificationsWaiters
{
  return self->_disksNotificationsWaiters;
}

- (void)setDisksNotificationsWaiters:(id)a3
{
}

- (OS_dispatch_queue)diskArbCallbacksQueue
{
  return self->_diskArbCallbacksQueue;
}

- (void)setDiskArbCallbacksQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationsSyncQueue
{
  return self->_notificationsSyncQueue;
}

- (void)setNotificationsSyncQueue:(id)a3
{
}

- (unint64_t)lastDiskObjectID
{
  return self->_lastDiskObjectID;
}

- (void)setLastDiskObjectID:(unint64_t)a3
{
  self->_lastDiskObjectID = a3;
}

- (NSObject)lastDiskObjectIDLock
{
  return self->_lastDiskObjectIDLock;
}

- (void)setLastDiskObjectIDLock:(id)a3
{
}

- (BOOL)diskListCompleteReceived
{
  return self->_diskListCompleteReceived;
}

- (void)setDiskListCompleteReceived:(BOOL)a3
{
  self->_diskListCompleteReceived = a3;
}

- (NSMutableDictionary)preIdleOperationMap
{
  return self->_preIdleOperationMap;
}

- (void)setPreIdleOperationMap:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)addAppearedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000E2BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[SKDaemonManager(DiskNotifications) addAppearedDisk:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v11, 0x16u);
    }

    id v7 = self->allDisks;
    objc_sync_enter(v7);
    -[NSMutableArray addObject:](self->allDisks, "addObject:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appearedDisks]);
    [v9 addObject:v4];

    objc_sync_exit(v7);
  }

  return v4 != 0LL;
}

- (void)addChangedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000E2BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[SKDaemonManager(DiskNotifications) addChangedDisk:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v11, 0x16u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 changedDisks]);

    objc_sync_enter(v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 changedDisks]);
    [v10 addObject:v4];

    objc_sync_exit(v8);
  }
}

- (void)addDisappearedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000E2BC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      int v11 = "-[SKDaemonManager(DiskNotifications) addDisappearedDisk:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = self->allDisks;
    objc_sync_enter(v7);
    -[NSMutableArray removeObject:](self->allDisks, "removeObject:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 disappearedDisks]);
    [v9 addObject:v4];

    objc_sync_exit(v7);
  }
}

- (void)_processDiskNotificationsWithCompleteDiskList:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = self->_diskOperationMap;
  objc_sync_enter(v6);
  id v7 = -[NSMutableDictionary copy](self->_diskOperationMap, "copy");
  -[NSMutableDictionary removeAllObjects](self->_diskOperationMap, "removeAllObjects");
  objc_sync_exit(v6);

  id v8 =  -[SKDaemonManager _processDiskNotificationsForMap:isCompleteDiskList:]( self,  "_processDiskNotificationsForMap:isCompleteDiskList:",  v7,  v3);
  objc_autoreleasePoolPop(v5);
}

- (void)addMissingDisappearedDisks
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&__int128 v5 = 136315650LL;
    __int128 v15 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "_supportsRecaching", v15))
        {
          id v10 = -[SKDaemonManager copyUpdatedDADiskForDisk:](self, "copyUpdatedDADiskForDisk:", v9);
          int v11 = v10;
          if (!v10 || (CFDictionaryRef v12 = DADiskCopyDescription((DADiskRef)v10)) == 0LL)
          {
            id v13 = sub_10000E2BC();
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              id v21 = "-[SKDaemonManager(DiskNotifications) addMissingDisappearedDisks]";
              __int16 v22 = 2112;
              id v23 = v9;
              __int16 v24 = 2112;
              unsigned __int8 v25 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@ (%@) disappeared while DA daemon was down",  buf,  0x20u);
            }

            -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v9);
            CFDictionaryRef v12 = 0LL;
          }
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }

    while (v6);
  }
}

- (void)_processNotificationsWithDiskOperations:(id)a3
{
  id v4 = a3;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 wholeDiskOperation]);
  -[SKDaemonManager _processNotificationWithDiskOperation:](self, "_processNotificationWithDiskOperation:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 childrenOperations]);
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 childrenOperations]);
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0LL;
      do
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsProcessingQueue](self, "notificationsProcessingQueue"));
        CFDictionaryRef v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processingGroup]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000295B4;
        v17[3] = &unk_1000457B0;
        v17[4] = self;
        id v14 = v4;
        id v18 = v14;
        unint64_t v19 = v10;
        [v11 dispatchWithGroup:v13 block:v17];

        ++v10;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 childrenOperations]);
        id v16 = [v15 count];
      }

      while (v10 < (unint64_t)v16);
    }
  }
}

- (id)_processDiskNotificationsForMap:(id)a3 isCompleteDiskList:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = -[SKNotificationsCache initWithDiskOperationMap:]( objc_alloc(&OBJC_CLASS___SKNotificationsCache),  "initWithDiskOperationMap:",  v6);
  -[SKDaemonManager setNotificationsCache:](self, "setNotificationsCache:", v7);

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
  if (v8
    && (id v9 = (void *)v8,
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache")),
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 disksToProcess]),
        id v12 = [v11 count],
        v11,
        v10,
        v9,
        v12))
  {
    -[SKDaemonManager _invalidateExtendedDiskInfoCache](self, "_invalidateExtendedDiskInfoCache");
    if (v4) {
      -[SKDaemonManager addMissingDisappearedDisks](self, "addMissingDisappearedDisks");
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 disksToProcess]);
    id v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0LL;
      do
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsProcessingQueue](self, "notificationsProcessingQueue"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 processingGroup]);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100029994;
        v46[3] = &unk_100045378;
        v46[4] = self;
        v46[5] = v16;
        [v17 dispatchWithGroup:v19 block:v46];

        ++v16;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 disksToProcess]);
        id v22 = [v21 count];
      }

      while (v16 < (unint64_t)v22);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    __int16 v24 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v23 processingGroup]);
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    -[SKDaemonManager updateRAIDDisks](self, "updateRAIDDisks");
    -[SKDaemonManager removeLIFSAPFSContainers](self, "removeLIFSAPFSContainers");
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 appearedDisks]);
    id v27 = [v26 copy];
    -[SKDaemonManager updatePhysicalStoresWithDisks:](self, "updatePhysicalStoresWithDisks:", v27);

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 disappearedDisks]);
    id v30 = [v29 count];

    if (v30)
    {
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 disappearedDisks]);
      -[SKDaemonManager _disksDisappeared:](self, "_disksDisappeared:", v32);
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 appearedDisks]);
    id v35 = [v34 count];

    if (v35)
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      dispatch_queue_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 appearedDisks]);
      -[SKDaemonManager _disksAppeared:](self, "_disksAppeared:", v37);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 changedDisks]);
    id v40 = [v39 count];

    if (v40)
    {
      dispatch_queue_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 changedDisks]);
      -[SKDaemonManager _disksChanged:](self, "_disksChanged:", v42);
    }

    dispatch_queue_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 processedDisk]);
  }

  else
  {
    v44 = 0LL;
  }

  return v44;
}

- (void)removePostProcessWithCachedDisk:(id)a3
{
  id v4 = a3;
  -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v4);
  -[SKDaemonManager postProcessWithDisk:](self, "postProcessWithDisk:", v4);
}

- (id)_processAppearedOrChangedWithDisk:(id)a3 operation:(id)a4
{
  __int128 v5 = (__DADisk *)a3;
  CFDictionaryRef v6 = DADiskCopyDescription(v5);
  if (v6)
  {
    unsigned __int8 v7 = +[SKAPFSSnapshotDisk isiOSRootSnapshotWithDiskDescription:]( &OBJC_CLASS___SKAPFSSnapshotDisk,  "isiOSRootSnapshotWithDiskDescription:",  v6);
    if ((v7 & 1) != 0
      || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:](&OBJC_CLASS___SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v6))
    {
      id v8 = 0LL;
      id v9 = 0LL;
      goto LABEL_5;
    }

    id v18 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v5);
    if (v18)
    {
      unint64_t v19 = v18;
      id v9 = -[SKIOObject copyPropertyWithClass:key:]( v18,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"Content");
      id v8 = -[SKIOObject copyPropertyWithClass:key:]( v19,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSString),  @"UUID");

LABEL_5:
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v5));
      int v11 = v10;
      if (v10)
      {
        [v10 setDaDisk:v5];
        if (!-[SKDaemonManager diskHasMutated:rawIOContent:diskDesc:mediaUUID:]( self,  "diskHasMutated:rawIOContent:diskDesc:mediaUUID:",  v11,  v9,  v6,  v8))
        {
          if ([v11 _cacheInfo])
          {
            -[SKDaemonManager addChangedDisk:](self, "addChangedDisk:", v11);
            unint64_t v16 = v11;
            goto LABEL_37;
          }

          goto LABEL_28;
        }

        id v12 = sub_10000E2BC();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315394;
          unsigned __int8 v25 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
          __int16 v26 = 2112;
          id v27 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Disk %@ mutated",  (uint8_t *)&v24,  0x16u);
        }

        -[SKDaemonManager removePostProcessWithCachedDisk:](self, "removePostProcessWithCachedDisk:", v11);
      }

      if (+[SKAPFSDisk isLIFSAPFSWithDiskDescription:](&OBJC_CLASS___SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v6))
      {
        id v14 = &OBJC_CLASS___SKAPFSDisk;
        goto LABEL_12;
      }

      if (+[SKAPFSStoreDisk isIOMediaStoreWithDisk:](&OBJC_CLASS___SKAPFSStoreDisk, "isIOMediaStoreWithDisk:", v5))
      {
        __int128 v17 = -[SKAPFSStoreDisk initWithDADisk:isLiveFSContainer:]( objc_alloc(&OBJC_CLASS___SKAPFSStoreDisk),  "initWithDADisk:isLiveFSContainer:",  v5,  0LL);
        if (!v17) {
          goto LABEL_31;
        }
        unint64_t v16 = v17;
        -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v17);
LABEL_37:

        goto LABEL_38;
      }

      if (+[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:diskDesc:]( &OBJC_CLASS___SKAPFSStoreDisk,  "isLiveFSStoreWithRawIOContent:diskDesc:",  v9,  v6))
      {
        unint64_t v16 = -[SKAPFSStoreDisk initWithDADisk:isLiveFSContainer:]( objc_alloc(&OBJC_CLASS___SKAPFSStoreDisk),  "initWithDADisk:isLiveFSContainer:",  v5,  1LL);
        if (v16)
        {
          id v20 = -[SKAPFSContainerDisk initWithPhysicalStoreDisk:]( objc_alloc(&OBJC_CLASS___SKAPFSContainerDisk),  "initWithPhysicalStoreDisk:",  v5);
          if (v20)
          {
            DADiskRef v15 = v20;
            -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v16);
            -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15);
LABEL_36:

            goto LABEL_37;
          }
        }

        DADiskRef v15 = v16;
LABEL_30:

        goto LABEL_31;
      }

      if ([v9 isEqualToString:@"EF57347C-0000-11AA-AA11-00306543ECAC"])
      {
        if (-[SKDaemonManager delayedAPFSDiskNotificationWithDisk:wholeDisk:]( self,  "delayedAPFSDiskNotificationWithDisk:wholeDisk:",  v5,  v5))
        {
          goto LABEL_28;
        }

        id v14 = &OBJC_CLASS___SKAPFSContainerDisk;
LABEL_12:
        DADiskRef v15 = (DADiskRef)[[v14 alloc] initWithDADisk:v5];
        unint64_t v16 = v15;
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15)) {
          goto LABEL_37;
        }
        goto LABEL_30;
      }

      if ((v7 & 1) != 0
        || +[SKAPFSSnapshotDisk diskIsSnapshot:](&OBJC_CLASS___SKAPFSSnapshotDisk, "diskIsSnapshot:", v5))
      {
        id v14 = (objc_class *)&OBJC_CLASS___SKAPFSSnapshotDisk;
        goto LABEL_12;
      }

      if (![v9 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"])
      {
LABEL_31:
        DADiskRef v15 = -[SKDisk initWithDADisk:](objc_alloc(&OBJC_CLASS___SKDisk), "initWithDADisk:", v5);
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15))
        {
          unint64_t v16 = v15;
        }

        else
        {
          id v21 = sub_10000E2BC();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 136315394;
            unsigned __int8 v25 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
            __int16 v26 = 2112;
            id v27 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to initialize SKDisk of any kind for %@",  (uint8_t *)&v24,  0x16u);
          }

          unint64_t v16 = 0LL;
        }

        goto LABEL_36;
      }

      DADiskRef v15 = DADiskCopyWholeDisk(v5);
      if (!-[SKDaemonManager delayedAPFSDiskNotificationWithDisk:wholeDisk:]( self,  "delayedAPFSDiskNotificationWithDisk:wholeDisk:",  v5,  v15))
      {
        unint64_t v16 = -[SKAPFSDisk initWithDADisk:](objc_alloc(&OBJC_CLASS___SKAPFSDisk), "initWithDADisk:", v5);
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v16)) {
          goto LABEL_36;
        }

        goto LABEL_30;
      }

LABEL_28:
      unint64_t v16 = 0LL;
      goto LABEL_37;
    }
  }

  unint64_t v16 = 0LL;
LABEL_38:

  return v16;
}

- (void)postProcessWithDisk:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = v3;
    CFDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue([v5 apfsVolumeGroupUUID]);

    if (v6)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 container]);
      if (v7)
      {
        id v28 = v3;
        id v8 = sub_10000E2BC();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
          int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 apfsVolumeGroupUUID]);
          *(_DWORD *)buf = 136315650;
          uint64_t v36 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
          __int16 v37 = 2114;
          v38 = v10;
          __int16 v39 = 2114;
          id v40 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: volume %{public}@ changed or disappeared, looking for other volumes in group %{public}@",  buf,  0x20u);
        }

        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v27 = v7;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 volumes]);
        id v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              __int128 v17 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
              uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 apfsVolumeGroupUUID]);
              if (v18)
              {
                unint64_t v19 = (void *)v18;
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 apfsVolumeGroupUUID]);
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 apfsVolumeGroupUUID]);
                if ([v20 isEqualToString:v21])
                {
                  unsigned __int8 v22 = [v5 isEqual:v17];

                  if ((v22 & 1) == 0)
                  {
                    id v23 = sub_10000E2BC();
                    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 diskIdentifier]);
                      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 apfsVolumeGroupUUID]);
                      *(_DWORD *)buf = 136315650;
                      uint64_t v36 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
                      __int16 v37 = 2114;
                      v38 = v25;
                      __int16 v39 = 2114;
                      id v40 = v26;
                      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: %{public}@ is also a member of %{public}@ group, re-caching it",  buf,  0x20u);
                    }
                  }
                }

                else
                {
                }
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }

          while (v14);
        }

        unsigned __int8 v7 = v27;
        id v3 = v28;
      }
    }
  }
}

- (void)_processNotificationWithDiskOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000E2BC();
  CFDictionaryRef v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting to process: %{public}@",  (uint8_t *)&v16,  0xCu);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:off_100051AC0]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:off_100051AF8]);
  if ([v7 isEqualToString:off_100051AD8])
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v8));
    -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v9);
  }

  else
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonManager _processAppearedOrChangedWithDisk:operation:]( self,  "_processAppearedOrChangedWithDisk:operation:",  v8,  v4));
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    objc_sync_enter(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processedDisk]);
    BOOL v14 = v13 == 0LL;

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      [v15 setProcessedDisk:v10];
    }

    objc_sync_exit(v11);

    else {
      id v9 = 0LL;
    }
  }

  if (v9) {
    -[SKDaemonManager postProcessWithDisk:](self, "postProcessWithDisk:", v9);
  }
}

- (void)updatePhysicalStoresWithContainer:(id)a3
{
  id v23 = a3;
  id v25 = [v23 copyPhysicalStoresUUIDs];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  obj = self->allDisks;
  objc_sync_enter(obj);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v5 = self->allDisks;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if ([v9 isMemberOfClass:objc_opt_class(SKDisk)])
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaUUID]);
          unsigned int v11 = [v25 containsObject:v10];

          if (v11) {
            [v4 addObject:v9];
          }
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
    }

    while (v6);
  }

  objc_sync_exit(obj);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        int v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
        id v17 = sub_10000E2BC();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 diskIdentifier]);
          *(_DWORD *)buf = 136315394;
          id v35 = "-[SKDaemonManager(DiskNotifications) updatePhysicalStoresWithContainer:]";
          __int16 v36 = 2114;
          __int16 v37 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Re-creating APFS physical store %{public}@",  buf,  0x16u);
        }

        id v20 = objc_alloc(&OBJC_CLASS___SKAPFSStoreDisk);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 daDisk]);
        unsigned __int8 v22 = -[SKAPFSStoreDisk initWithDADisk:isLiveFSContainer:](v20, "initWithDADisk:isLiveFSContainer:", v21, 0LL);

        if (v22)
        {
          -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v16);
          -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v22);
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v13);
  }
}

- (void)updatePhysicalStoresWithDisks:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (BOOL)diskHasMutated:(id)a3 rawIOContent:(id)a4 diskDesc:(id)a5 mediaUUID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isIOMediaDisk])
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 daDisk]);
    if (+[SKAPFSStoreDisk isIOMediaStoreWithDisk:](&OBJC_CLASS___SKAPFSStoreDisk, "isIOMediaStoreWithDisk:", v13)) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = +[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:diskDesc:]( &OBJC_CLASS___SKAPFSStoreDisk,  "isLiveFSStoreWithRawIOContent:diskDesc:",  v10,  v11);
    }
    unsigned int v16 = [v10 isEqualToString:@"EF57347C-0000-11AA-AA11-00306543ECAC"];
    unsigned int v17 = [v10 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"];
    unsigned __int8 v18 = [v9 isMemberOfClass:objc_opt_class(SKAPFSStoreDisk)];
    if (v14)
    {
      if ((v18 & 1) == 0) {
        goto LABEL_16;
      }
    }

    else if ((v18 & 1) != 0)
    {
      goto LABEL_16;
    }

    unsigned __int8 v19 = [v9 isMemberOfClass:objc_opt_class(SKAPFSContainerDisk)];
    if (v16)
    {
      if ((v19 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_14:
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
      char isKindOfClass = objc_opt_isKindOfClass(v9, v20);
      if (v17)
      {
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_16;
        }
      }

      else if ((isKindOfClass & 1) != 0)
      {
        goto LABEL_16;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaUUID]);
      id v24 = v12;
      id v25 = v24;
      if ((v24 != 0) != (v23 != 0) || v24 && ([v23 isEqualToString:v24] & 1) == 0)
      {
        id v26 = sub_10000E2BC();
        __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v9 diskIdentifier]);
          __int128 v29 = (objc_class *)objc_opt_class(v9);
          __int128 v30 = NSStringFromClass(v29);
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          int v32 = 136316162;
          __int128 v33 = "-[SKDaemonManager(DiskNotifications) diskHasMutated:rawIOContent:diskDesc:mediaUUID:]";
          __int16 v34 = 2114;
          id v35 = v28;
          __int16 v36 = 2114;
          __int16 v37 = v31;
          __int16 v38 = 2114;
          __int16 v39 = v23;
          __int16 v40 = 2114;
          dispatch_queue_t v41 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: UUID of %{public}@ (%{public}@) changed from %{public}@ to %{public}@",  (uint8_t *)&v32,  0x34u);
        }

        BOOL v15 = 1;
      }

      else
      {
        BOOL v15 = 0;
      }

      goto LABEL_17;
    }

    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v15 = 1;
LABEL_17:

    goto LABEL_18;
  }

  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)delayedAPFSDiskNotificationWithDisk:(id)a3 wholeDisk:(id)a4
{
  return 0;
}

@end