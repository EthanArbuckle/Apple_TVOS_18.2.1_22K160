@interface PBWaitForApplicationPersonaChangesOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BSBlockSentinel)completionHandlerSentinel;
- (BSWatchdog)watchdog;
- (NSSet)personaEnabledApplicationIdentifiers;
- (NSString)selectedPersonaUniqueString;
- (OS_dispatch_queue)workQueue;
- (PBAppInfoController)appInfoController;
- (PBWaitForApplicationPersonaChangesOperation)initWithPersonaEnabledApplicationIdentifiers:(id)a3 selectedPersonaUniqueString:(id)a4;
- (id)_completionHandlerSentinelBlock;
- (id)_personaEnabledApplicationsFilter;
- (id)_watchdogBlock;
- (id)_workQueue_updatingApplicationIdentifiers;
- (id)waitForApplicationPersonaChangesCompletionHandler;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)setWaitForApplicationPersonaChangesCompletionHandler:(id)a3;
- (void)start;
@end

@implementation PBWaitForApplicationPersonaChangesOperation

- (PBWaitForApplicationPersonaChangesOperation)initWithPersonaEnabledApplicationIdentifiers:(id)a3 selectedPersonaUniqueString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBWaitForApplicationPersonaChangesOperation;
  v8 = -[PBWaitForApplicationPersonaChangesOperation init](&v16, "init");
  if (v8)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBWaitForApplicationPersonaChangesOperation.workQueue");
    selectedPersonaUniqueString = v8->_selectedPersonaUniqueString;
    v8->_selectedPersonaUniqueString = (NSString *)Serial;

    id v11 = [v6 copy];
    v12 = *(void **)&v8->super._private1;
    *(void *)&v8->super._private1 = v11;

    id v13 = [v7 copy];
    v14 = *(void **)&v8->_executing;
    *(void *)&v8->_executing = v13;
  }

  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (char)v2->super._private;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE1(v2->super._private);
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->super._private)) {
    goto LABEL_4;
  }
  if (-[PBWaitForApplicationPersonaChangesOperation isCancelled](v2, "isCancelled"))
  {
    -[PBWaitForApplicationPersonaChangesOperation willChangeValueForKey:]( v2,  "willChangeValueForKey:",  @"finished");
    BYTE1(v2->super._private) = 1;
    -[PBWaitForApplicationPersonaChangesOperation didChangeValueForKey:](v2, "didChangeValueForKey:", @"finished");
LABEL_4:
    objc_sync_exit(v2);

    return;
  }

  -[PBWaitForApplicationPersonaChangesOperation willChangeValueForKey:]( v2,  "willChangeValueForKey:",  @"executing");
  LOBYTE(v2->super._private) = 1;
  -[PBWaitForApplicationPersonaChangesOperation didChangeValueForKey:](v2, "didChangeValueForKey:", @"executing");
  objc_sync_exit(v2);

  id v3 = sub_100084518();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)&v2->_executing;
    uint64_t v6 = *(void *)&v2->super._private1;
    *(_DWORD *)buf = 141558530;
    uint64_t v10 = 1752392040LL;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Waiting for persona enabled applications to update. {selectedPersonaUniqueString=%{mask.hash}@, personaEnabledAppl icationIdentifiers=%@}",  buf,  0x20u);
  }

  selectedPersonaUniqueString = (dispatch_queue_s *)v2->_selectedPersonaUniqueString;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E59F0;
  block[3] = &unk_1003CFF08;
  block[4] = v2;
  dispatch_sync(selectedPersonaUniqueString, block);
}

- (void)setWaitForApplicationPersonaChangesCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_selectedPersonaUniqueString);
  selectedPersonaUniqueString = (dispatch_queue_s *)self->_selectedPersonaUniqueString;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E5C1C;
  v7[3] = &unk_1003D0070;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(selectedPersonaUniqueString, v7);
}

- (id)_personaEnabledApplicationsFilter
{
  id v2 = [*(id *)&self->super._private1 copy];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E5CE0;
  v6[3] = &unk_1003D65E0;
  id v7 = v2;
  id v3 = v2;
  id v4 = objc_retainBlock(v6);

  return v4;
}

- (id)_workQueue_updatingApplicationIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_queue appInfos](self->_workQueue, "appInfos"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_1000E5E70;
  __int16 v11 = &unk_1003D0B78;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)_completionHandlerSentinelBlock
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E5F98;
  v5[3] = &unk_1003D6608;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = objc_retainBlock(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_watchdogBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E6264;
  v4[3] = &unk_1003D1228;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  selectedPersonaUniqueString = (dispatch_queue_s *)self->_selectedPersonaUniqueString;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E6388;
  v6[3] = &unk_1003D0890;
  objc_copyWeak(&v7, &location);
  dispatch_async(selectedPersonaUniqueString, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSSet)personaEnabledApplicationIdentifiers
{
  return *(NSSet **)&self->super._private1;
}

- (NSString)selectedPersonaUniqueString
{
  return *(NSString **)&self->_executing;
}

- (id)waitForApplicationPersonaChangesCompletionHandler
{
  return self->_personaEnabledApplicationIdentifiers;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)self->_selectedPersonaUniqueString;
}

- (BSBlockSentinel)completionHandlerSentinel
{
  return (BSBlockSentinel *)self->_waitForApplicationPersonaChangesCompletionHandler;
}

- (PBAppInfoController)appInfoController
{
  return (PBAppInfoController *)self->_workQueue;
}

- (BSWatchdog)watchdog
{
  return self->_completionHandlerSentinel;
}

- (void).cxx_destruct
{
}

@end