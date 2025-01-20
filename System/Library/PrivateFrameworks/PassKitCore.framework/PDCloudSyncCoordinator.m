@interface PDCloudSyncCoordinator
- (BOOL)attemptToProcessPendingChangesAlreadyScheduled;
- (BOOL)hasNoPendingChanges;
- (BOOL)hasReachedExtendedPendingChangesDelay;
- (BOOL)hasReachedPendingChangesDelayThreshold;
- (BOOL)resetPendingChangesDelay;
- (PDCloudSyncCoordinator)initWithChangeRegistry:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5 cloudStoreManager:(id)a6 secureCloudStoreManager:(id)a7;
- (id)allLocalPassUniqueIDs;
- (id)existingCatalog;
- (id)fetchChangeEvents;
- (id)localPassWithUniqueID:(id)a3;
- (id)localPassesMatchingPasses:(id)a3;
- (id)localPassesWithUniqueIDs:(id)a3;
- (id)retryDateForEvent:(id)a3;
- (void)allLocalPasses:(id)a3;
- (void)cancelExistingProcessPendingChangesAttemptIfNecessary;
- (void)cancelProcessPendingChangesAttempt;
- (void)catalogUpdated:(id)a3 source:(int64_t)a4;
- (void)clearChangeHistory;
- (void)containerManager:(id)a3 willSyncWithContainer:(id)a4 scanForMissedChanges:(BOOL)a5;
- (void)deleteCloudSyncRelatedInformation;
- (void)didFinishSyncWithContainer:(id)a3 error:(id)a4;
- (void)eraseDroppedProcessPendingChangesAttempt;
- (void)executeLocalPortionOfSaveRequest:(id)a3;
- (void)executeRemotePortionOfSaveRequest:(id)a3;
- (void)executeSaveRequest:(id)a3 completion:(id)a4;
- (void)increasePendingChangesDelay;
- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4;
- (void)markDroppedProcessPendingChangesAttempt;
- (void)passAdded:(id)a3 source:(int64_t)a4;
- (void)passDeleted:(id)a3 reason:(unint64_t)a4;
- (void)passUpdated:(id)a3 source:(int64_t)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processPendingChanges;
- (void)processPendingChangesAfterExecutionSaveRequest:(id)a3;
- (void)registerMissedChangeEventsForContainer:(id)a3;
- (void)rescheduleDroppedProcessPendingChangesIfNecessary;
- (void)resetMigration;
- (void)schedueDelayedProcessPendingChangesBlock:(id)a3;
- (void)scheduleProcessPendingChangesAttempt;
- (void)scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply;
- (void)treatContanerManagerAsPrimary:(id)a3;
- (void)willDownloadAllDataFromContainer:(id)a3;
@end

@implementation PDCloudSyncCoordinator

- (PDCloudSyncCoordinator)initWithChangeRegistry:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5 cloudStoreManager:(id)a6 secureCloudStoreManager:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDCloudSyncCoordinator;
  v17 = -[PDCloudSyncCoordinator init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_changeRegistry, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_cardFileManager, a5);
    objc_storeStrong((id *)&v18->_cloudStoreManager, a6);
    objc_storeStrong((id *)&v18->_secureCloudStoreManager, a7);
    v18->_processPendingChangesDelay = 8.0;
    -[PDCardCloudManager setDataSource:](v18->_cloudStoreManager, "setDataSource:", v18);
    -[PDCardCloudManager setDataSource:](v18->_secureCloudStoreManager, "setDataSource:", v18);
    id v19 = PDDefaultQueue();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    PDScheduledActivityClientRegister(@"PDCloudSyncCoordinatorScheduledActivityClientIdentifier", v18, v20);
  }

  return v18;
}

- (void)passAdded:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 supportsSyncing];
  if (a4 != 5 && v7)
  {
    changeRegistry = self->_changeRegistry;
    id v11 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    id v10 = -[PDCardCloudManagerChangeRegistry recordAdditionOfPasses:](changeRegistry, "recordAdditionOfPasses:", v9);

    -[PDCloudSyncCoordinator processPendingChanges](self, "processPendingChanges");
  }
}

- (void)passUpdated:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 supportsSyncing];
  if (a4 != 5 && v7)
  {
    changeRegistry = self->_changeRegistry;
    id v11 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    id v10 = -[PDCardCloudManagerChangeRegistry recordUpdateOfPasses:](changeRegistry, "recordUpdateOfPasses:", v9);

    -[PDCloudSyncCoordinator processPendingChanges](self, "processPendingChanges");
  }
}

- (void)passDeleted:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 supportsSyncing])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    v8 = (void *)v7;
    changeRegistry = self->_changeRegistry;
    if (a4 == 8)
    {
      uint64_t v13 = v7;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
      -[PDCardCloudManagerChangeRegistry unregisterChangesForPassesWithUniqueIDs:]( changeRegistry,  "unregisterChangesForPassesWithUniqueIDs:",  v10);
    }

    else
    {
      uint64_t v14 = v7;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      id v12 =  -[PDCardCloudManagerChangeRegistry recordRemovalOfPassesWithUniqueIDs:]( changeRegistry,  "recordRemovalOfPassesWithUniqueIDs:",  v11);

      -[PDCloudSyncCoordinator processPendingChanges](self, "processPendingChanges");
    }
  }
}

- (void)catalogUpdated:(id)a3 source:(int64_t)a4
{
  if (a4 != 5)
  {
    id v5 =  -[PDCardCloudManagerChangeRegistry recordUpdateOfCatalog:]( self->_changeRegistry,  "recordUpdateOfCatalog:",  a3);
    -[PDCloudSyncCoordinator processPendingChanges](self, "processPendingChanges");
  }

- (void)deleteCloudSyncRelatedInformation
{
}

- (void)processPendingChanges
{
  if (PKCloudKitPassSyncEnabled(self, a2))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] process pending changes requested",  buf,  2u);
    }

    if (!-[PDCloudSyncCoordinator attemptToProcessPendingChangesAlreadyScheduled]( self,  "attemptToProcessPendingChangesAlreadyScheduled")) {
      goto LABEL_9;
    }
    unsigned int v5 = -[PDCloudSyncCoordinator hasReachedExtendedPendingChangesDelay](self, "hasReachedExtendedPendingChangesDelay");
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] process pending changes is within longer delay window - rescheduling",  v8,  2u);
      }

      -[PDCloudSyncCoordinator cancelExistingProcessPendingChangesAttemptIfNecessary]( self,  "cancelExistingProcessPendingChangesAttemptIfNecessary");
LABEL_9:
      -[PDCloudSyncCoordinator scheduleProcessPendingChangesAttempt](self, "scheduleProcessPendingChangesAttempt");
      return;
    }

    if (v6)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] process pending changes is within short delay window - ignoring",  v7,  2u);
    }
  }

- (void)scheduleProcessPendingChangesAttempt
{
  if (-[PDCloudSyncCoordinator attemptToProcessPendingChangesAlreadyScheduled]( self,  "attemptToProcessPendingChangesAlreadyScheduled"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] sync coordinator was asked to retry processing changes again, ignoring",  buf,  2u);
    }
  }

  else
  {
    unsigned int v5 = -[PDCloudSyncCoordinator hasReachedPendingChangesDelayThreshold]( self,  "hasReachedPendingChangesDelayThreshold");
    uint64_t v6 = PKLogFacilityTypeGetObject(9LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] sync coordinator has reached the process changes retry threshold, ignoring",  buf,  2u);
      }

      -[PDCloudSyncCoordinator resetPendingChangesDelay](self, "resetPendingChangesDelay");
    }

    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] sync coordinator will process pending changes after delay",  buf,  2u);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1002902AC;
      v9[3] = &unk_100639300;
      v9[4] = self;
      -[PDCloudSyncCoordinator schedueDelayedProcessPendingChangesBlock:]( self,  "schedueDelayedProcessPendingChangesBlock:",  v9);
    }
  }

- (BOOL)hasReachedExtendedPendingChangesDelay
{
  return self->_processPendingChangesDelay > 9.0;
}

- (BOOL)hasReachedPendingChangesDelayThreshold
{
  return self->_processPendingChangesDelay >= 720.0;
}

- (BOOL)resetPendingChangesDelay
{
  self->_processPendingChangesDelay = 8.0;
  return 1;
}

- (BOOL)hasNoPendingChanges
{
  return -[PDCardCloudManagerChangeRegistry numberOfChangeEvents](self->_changeRegistry, "numberOfChangeEvents") == 0;
}

- (void)increasePendingChangesDelay
{
  self->_processPendingChangesDelay = self->_processPendingChangesDelay + 180.0;
}

- (void)cancelExistingProcessPendingChangesAttemptIfNecessary
{
}

- (BOOL)attemptToProcessPendingChangesAlreadyScheduled
{
  return self->_processPendingChangesTimer != 0LL;
}

- (void)schedueDelayedProcessPendingChangesBlock:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);
  processPendingChangesTimer = self->_processPendingChangesTimer;
  self->_processPendingChangesTimer = v7;

  v9 = self->_processPendingChangesTimer;
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(self->_processPendingChangesDelay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  id v11 = self->_processPendingChangesTimer;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10029076C;
  v13[3] = &unk_10063AC90;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_source_set_event_handler((dispatch_source_t)v11, v13);
  dispatch_resume((dispatch_object_t)self->_processPendingChangesTimer);
}

- (void)cancelProcessPendingChangesAttempt
{
  processPendingChangesTimer = self->_processPendingChangesTimer;
  if (processPendingChangesTimer)
  {
    dispatch_source_cancel((dispatch_source_t)processPendingChangesTimer);
    id v4 = self->_processPendingChangesTimer;
    self->_processPendingChangesTimer = 0LL;
  }

- (void)markDroppedProcessPendingChangesAttempt
{
  self->_didDropProcessPendingChangesAttempt = 1;
}

- (void)eraseDroppedProcessPendingChangesAttempt
{
  self->_didDropProcessPendingChangesAttempt = 0;
}

- (void)rescheduleDroppedProcessPendingChangesIfNecessary
{
  if (self->_didDropProcessPendingChangesAttempt)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] rescheduling previously dropped pending changes attempt",  v5,  2u);
    }

    self->_didDropProcessPendingChangesAttempt = 0;
    -[PDCloudSyncCoordinator scheduleProcessPendingChangesAttempt](self, "scheduleProcessPendingChangesAttempt");
  }

- (void)scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "scheduling expensive sync for when the device is connected to power",  v7,  2u);
  }

  uint64_t Criteria = PDScheduledActivityGetCriteria( @"PDCloudSyncCoordinatorScheduledActivityClientIdentifier",  @"ExpensiveSyncActivityIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(Criteria);
  if (v5) {
    PDScheduledActivityRemove( @"PDCloudSyncCoordinatorScheduledActivityClientIdentifier",  @"ExpensiveSyncActivityIdentifier");
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  0LL));
  [v6 setRequireNetworkConnectivity:1];
  [v6 setRequireScreenSleep:0];
  [v6 setRequireMainsPower:1];
  [v6 setRepeating:0];
  [v6 setReason:@"expensive sync"];
  PDScheduledActivityRegister( @"PDCloudSyncCoordinatorScheduledActivityClientIdentifier",  @"ExpensiveSyncActivityIdentifier",  v6);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (__CFString *)v6;
  dispatch_time_t v10 = v8;
  if (v8 == @"ExpensiveSyncActivityIdentifier"
    || v8
    && (unsigned int v9 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"ExpensiveSyncActivityIdentifier"),  v10,  v9))
  {
    -[PDCloudSyncCoordinator processPendingChanges](self, "processPendingChanges");
  }
}

- (void)containerManager:(id)a3 willSyncWithContainer:(id)a4 scanForMissedChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  -[PDCloudSyncCoordinator treatContanerManagerAsPrimary:](self, "treatContanerManagerAsPrimary:", a3);
  if (v5) {
    -[PDCloudSyncCoordinator registerMissedChangeEventsForContainer:]( self,  "registerMissedChangeEventsForContainer:",  v8);
  }
}

- (void)treatContanerManagerAsPrimary:(id)a3
{
}

- (void)registerMissedChangeEventsForContainer:(id)a3
{
  id v4 = a3;
  if (PKCloudKitPassSyncEnabled(v4, v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerChangeRegistry fetchChangeEvents](self->_changeRegistry, "fetchChangeEvents"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &stru_100651908));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager unsyncedPassesInContainer:]( self->_databaseManager,  "unsyncedPassesInContainer:",  v4));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100290C8C;
    v17[3] = &unk_10063D148;
    id v9 = v7;
    id v18 = v9;
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectsPassingTest:v17]);

    id v11 = [v10 count];
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v20 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] found local to sync: %{public}@",  buf,  0xCu);
      }

      changeRegistry = self->_changeRegistry;
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
      id v16 =  -[PDCardCloudManagerChangeRegistry recordAdditionOfPasses:]( changeRegistry,  "recordAdditionOfPasses:",  v13);
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] no unsynced local passes were found",  buf,  2u);
    }
  }
}

- (void)willDownloadAllDataFromContainer:(id)a3
{
}

- (void)didFinishSyncWithContainer:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] container: %{public}@ did sync: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  if (+[PDCardCloudManager shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:]( &OBJC_CLASS___PDCardCloudManager,  "shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:",  v7))
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will re-try syncing when connected to battery",  (uint8_t *)&v10,  2u);
    }

    -[PDCloudSyncCoordinator cancelExistingProcessPendingChangesAttemptIfNecessary]( self,  "cancelExistingProcessPendingChangesAttemptIfNecessary");
    -[PDCloudSyncCoordinator scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply]( self,  "scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply");
  }
}

- (id)fetchChangeEvents
{
  return -[PDCardCloudManagerChangeRegistry fetchChangeEvents](self->_changeRegistry, "fetchChangeEvents");
}

- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4
{
}

- (id)retryDateForEvent:(id)a3
{
  return -[PDCardCloudManagerChangeRegistry retryDateForEvent:](self->_changeRegistry, "retryDateForEvent:", a3);
}

- (void)allLocalPasses:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager syncablePassUniqueIDs](self->_databaseManager, "syncablePassUniqueIDs"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

    if ([v6 count])
    {
      id v7 = [v6 count];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100290F54;
      v9[3] = &unk_100651930;
      id v10 = v6;
      id v11 = self;
      id v12 = v8;
      PKRangeEnumeratePartitions(v7, 75LL, v9);
    }

    id v4 = v8;
  }
}

- (id)localPassesMatchingPasses:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &stru_100651950));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudSyncCoordinator localPassesWithUniqueIDs:](self, "localPassesWithUniqueIDs:", v4));

  return v5;
}

- (id)existingCatalog
{
  return -[PDCardFileManager catalogOfRecord](self->_cardFileManager, "catalogOfRecord");
}

- (void)executeSaveRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled(v7, v8))
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002910D8;
    block[3] = &unk_100639AF0;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);
  }
}

- (void)executeLocalPortionOfSaveRequest:(id)a3
{
  id v4 = a3;
  if ([v4 hasLocalPortion])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changeEventsToErase]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerChangeRegistry fetchChangeEvents](self->_changeRegistry, "fetchChangeEvents"));
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_100291C90;
    v94[3] = &unk_10064E9C8;
    id v7 = v5;
    id v95 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pk_objectsPassingTest:", v94));

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDsOfPassesToRemoveLocally]);
    v70 = v4;
    v75 = self;
    v68 = v7;
    if ([v9 count])
    {
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472LL;
      v92[2] = sub_100291CB0;
      v92[3] = &unk_100651978;
      id v93 = v9;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", v92));
    }

    else
    {
      v76 = 0LL;
    }

    v69 = v8;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v89;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v89 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(os_log_s **)(*((void *)&v88 + 1) + 8LL * (void)i);
          unsigned int v15 = [v76 containsObject:v14];
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            if (v18)
            {
              *(_DWORD *)buf = 138543362;
              v98 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] wont delete local pass:%{public}@ because it has been re-added locally",  buf,  0xCu);
            }
          }

          else
          {
            if (v18)
            {
              *(_DWORD *)buf = 138543362;
              v98 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] removing local pass:%{public}@",  buf,  0xCu);
            }

            -[PDCardFileManager deleteCardWithUniqueID:forReason:withDiagnosticReason:]( v75->_cardFileManager,  "deleteCardWithUniqueID:forReason:withDiagnosticReason:",  v14,  8LL,  @"Pass Removed By CloudKit");
          }
        }

        id v11 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
      }

      while (v11);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v70 passesToUpdateLocally]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v70 uniqueIDsOfPassesToUpdateLocally]);
    v66 = v20;
    if ([v20 count])
    {
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472LL;
      v86[2] = sub_100291D28;
      v86[3] = &unk_100651978;
      id v87 = v20;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "pk_arrayBySafelyApplyingBlock:", v86, v20));
    }

    else
    {
      v72 = 0LL;
    }

    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v73 = v19;
    id v21 = [v73 countByEnumeratingWithState:&v82 objects:v101 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v83 != v23) {
            objc_enumerationMutation(v73);
          }
          v25 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
          if (objc_msgSend(v25, "supportsSyncing", v66))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
            unsigned int v27 = [v72 containsObject:v26];

            uint64_t v28 = PKLogFacilityTypeGetObject(9LL);
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if (v27)
            {
              if (v30)
              {
                v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
                *(_DWORD *)buf = 138543362;
                v98 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] cannot update local pass:%{public}@ because it has deleted or modified locally",  buf,  0xCu);
              }
            }

            else
            {
              if (v30)
              {
                v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
                *(_DWORD *)buf = 138543362;
                v98 = v35;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] updating local pass:%{public}@",  buf,  0xCu);
              }

              id v81 = 0LL;
              if (-[PDCardFileManager writeCard:source:error:]( v75->_cardFileManager,  "writeCard:source:error:",  v25,  5LL,  &v81))
              {
                -[PDDatabaseManager markPassAsSynced:](v75->_databaseManager, "markPassAsSynced:", v25);
              }

              else
              {
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
                  *(_DWORD *)buf = 138412546;
                  v98 = v36;
                  __int16 v99 = 2114;
                  id v100 = v81;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] failed to write pass:%{pulic}@ with error %{public}@",  buf,  0x16u);
                }
              }
            }
          }

          else
          {
            uint64_t v32 = PKLogFacilityTypeGetObject(9LL);
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
              *(_DWORD *)buf = 138543362;
              v98 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] cannot update local pass:%{public}@ because it does not support syncing",  buf,  0xCu);
            }
          }
        }

        id v22 = [v73 countByEnumeratingWithState:&v82 objects:v101 count:16];
      }

      while (v22);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v70 conflictingRemotePasses]);
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v38 = [v37 countByEnumeratingWithState:&v77 objects:v96 count:16];
    p_isa = (id *)&v75->super.isa;
    if (v38)
    {
      id v40 = v38;
      uint64_t v41 = *(void *)v78;
      do
      {
        for (k = 0LL; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v78 != v41) {
            objc_enumerationMutation(v37);
          }
          v43 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)k);
          if ((objc_msgSend(v43, "supportsSyncing", v66) & 1) == 0)
          {
            uint64_t v53 = PKLogFacilityTypeGetObject(9LL);
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_69;
            }
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 uniqueID]);
            *(_DWORD *)buf = 138543362;
            v98 = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] cannot merge remote pass:%{public}@ because it does not support syncing",  buf,  0xCu);
            goto LABEL_59;
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 uniqueID]);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_isa localPassWithUniqueID:v44]);

          if (!v45)
          {
            uint64_t v55 = PKLogFacilityTypeGetObject(9LL);
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 uniqueID]);
              *(_DWORD *)buf = 138543362;
              v98 = v56;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] cannot merge remote pass:%{public}@ because it no longer exists locally",  buf,  0xCu);
            }

- (void)executeRemotePortionOfSaveRequest:(id)a3
{
  id v4 = a3;
  if ([v4 hasRemotePortion])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 passesToAddRemotely]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 passesToUpdateRemotely]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDsOfPassesToRemoveRemotely]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 catalogToUpdateRemotely]);
    if ([v5 count])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDsOfPassesToAddRemotely]);
        int v23 = 138543362;
        v24 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will add remote passes: %{public}@",  (uint8_t *)&v23,  0xCu);
      }

      id v12 =  -[PDCardCloudManagerChangeRegistry recordAdditionOfPasses:]( self->_changeRegistry,  "recordAdditionOfPasses:",  v5);
    }

    if ([v6 count])
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(9LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDsOfPassesToUpdateRemotely]);
        int v23 = 138543362;
        v24 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will update remote passes: %{public}@",  (uint8_t *)&v23,  0xCu);
      }

      id v16 =  -[PDCardCloudManagerChangeRegistry recordUpdateOfPasses:]( self->_changeRegistry,  "recordUpdateOfPasses:",  v6);
    }

    if ([v7 count])
    {
      uint64_t v17 = PKLogFacilityTypeGetObject(9LL);
      BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543362;
        v24 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will remove remote passes: %{public}@",  (uint8_t *)&v23,  0xCu);
      }

      id v19 =  -[PDCardCloudManagerChangeRegistry recordRemovalOfPassesWithUniqueIDs:]( self->_changeRegistry,  "recordRemovalOfPassesWithUniqueIDs:",  v7);
    }

    if (v8)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will update remote catalog",  (uint8_t *)&v23,  2u);
      }

      id v22 =  -[PDCardCloudManagerChangeRegistry recordUpdateOfCatalog:]( self->_changeRegistry,  "recordUpdateOfCatalog:",  v8);
    }
  }
}

- (void)processPendingChangesAfterExecutionSaveRequest:(id)a3
{
  id v4 = a3;
  if (![v4 hasRemotePortion])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 conflictingRemotePasses]);
    id v10 = [v9 count];

    if (!v10) {
      goto LABEL_16;
    }
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] save request has conflicts, will process pending changes again after resolution",  v15,  2u);
    }

    primaryCloudStoreManager = self->_primaryCloudStoreManager;
    id v14 = &stru_1006519B8;
LABEL_15:
    -[PDCardCloudManager processPendingChanges:](primaryCloudStoreManager, "processPendingChanges:", v14);
    goto LABEL_16;
  }

  uint64_t v5 = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] save request has a remote portion, will try to process pending changes",  buf,  2u);
  }

  unsigned int v7 = [v4 shouldDelayExecutionOfRemotePortion];
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v8)
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] will process pending changes immediately as requested",  v16,  2u);
    }

    primaryCloudStoreManager = self->_primaryCloudStoreManager;
    id v14 = &stru_100651998;
    goto LABEL_15;
  }

  if (v8)
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PDCloudSyncCoordinator] deferring processing of pending changes as requested",  v17,  2u);
  }

LABEL_16:
}

- (id)localPassWithUniqueID:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v9 = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudSyncCoordinator localPassesWithUniqueIDs:](self, "localPassesWithUniqueIDs:", v5, v9));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  return v7;
}

- (id)localPassesWithUniqueIDs:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002924A4;
  v6[3] = &unk_1006519E0;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", v6));
  -[PDDatabaseManager updatePassesWithSyncInformation:](self->_databaseManager, "updatePassesWithSyncInformation:", v4);
  return v4;
}

- (id)allLocalPassUniqueIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager syncablePassUniqueIDs](self->_databaseManager, "syncablePassUniqueIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

- (void)resetMigration
{
}

- (void)clearChangeHistory
{
}

- (void).cxx_destruct
{
}

@end