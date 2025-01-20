@interface SBDDomainSyncServiceHandler
- (BOOL)hasChangesToPush;
- (BOOL)isActive;
- (OS_dispatch_queue)queue;
- (SBDDomainSyncServiceHandler)initWithDomain:(id)a3;
- (SBDDomainSyncedStorageController)syncedStorageController;
- (double)preferredSynchronizeInterval;
- (id)lastSynchronizationFailureAccountIdentifier;
- (void)_onQueueSynchronizeWithInterval:(double)a3 isCheckpoint:(BOOL)a4;
- (void)_onQueue_clearHasChanges;
- (void)beginAccessingPlaybackPositionEntities;
- (void)bookkeeperStorageControllerDidSync:(id)a3;
- (void)dealloc;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
- (void)endAccessingPlaybackPositionEntities;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 clientIdentity:(id)a5 completionBlock:(id)a6;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3;
- (void)synchronizeForChangedAccountStatus;
- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3;
- (void)synchronizeIfNeedsInitialSynchronization;
- (void)synchronizeImmediately;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
@end

@implementation SBDDomainSyncServiceHandler

- (SBDDomainSyncServiceHandler)initWithDomain:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SBDDomainSyncServiceHandler;
  v5 = -[SBDDomainServiceHandler initWithDomain:](&v11, "initWithDomain:", v4);
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create(0LL, 0LL);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SBDDomainSyncedStorageController storageControllerForPlaybackPositionDomain:]( &OBJC_CLASS___SBDDomainSyncedStorageController,  "storageControllerForPlaybackPositionDomain:",  v4));
    syncedStorageController = v5->_syncedStorageController;
    v5->_syncedStorageController = (SBDDomainSyncedStorageController *)v8;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SBDDomainSyncServiceHandler;
  -[SBDDomainSyncServiceHandler dealloc](&v3, "dealloc");
}

- (void)beginAccessingPlaybackPositionEntities
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FB7C;
  block[3] = &unk_10001D2C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)endAccessingPlaybackPositionEntities
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FB50;
  block[3] = &unk_10001D2C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = MSVTCCIdentityForCurrentProcess();
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  -[SBDDomainSyncServiceHandler persistPlaybackPositionEntity:isCheckpoint:clientIdentity:completionBlock:]( self,  "persistPlaybackPositionEntity:isCheckpoint:clientIdentity:completionBlock:",  v9,  v5,  v11,  v8);
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 clientIdentity:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = MSVBundleIDForTCCIdentity(v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412802;
    v29 = v16;
    __int16 v30 = 2112;
    v31 = v18;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Received request: -%@, client=%@, entity=%@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F958;
  block[3] = &unk_10001D200;
  BOOL v27 = a4;
  block[4] = self;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  dispatch_sync(queue, block);
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MSVTCCIdentityForCurrentProcess();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[SBDDomainSyncServiceHandler deletePlaybackPositionEntity:clientIdentity:]( self,  "deletePlaybackPositionEntity:clientIdentity:",  v4,  v6);
}

- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
}

- (void)deletePlaybackPositionEntities
{
  uint64_t v3 = MSVTCCIdentityForCurrentProcess(self, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[SBDDomainSyncServiceHandler deletePlaybackPositionEntitiesWithClientIdentity:]( self,  "deletePlaybackPositionEntitiesWithClientIdentity:",  v4);
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MSVTCCIdentityForCurrentProcess(v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SBDDomainSyncServiceHandler updateForeignDatabaseWithValuesFromPlaybackPositionEntity:clientIdentity:]( self,  "updateForeignDatabaseWithValuesFromPlaybackPositionEntity:clientIdentity:",  v4,  v7);
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
}

- (void)synchronizeImmediately
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F948;
  block[3] = &unk_10001D2C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = MSVTCCIdentityForCurrentProcess(v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  -[SBDDomainSyncServiceHandler pullLocalPlaybackPositionForEntityIdentifiers:clientIdentity:completionBlock:]( self,  "pullLocalPlaybackPositionForEntityIdentifiers:clientIdentity:completionBlock:",  v7,  v10,  v6);
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5
{
  syncedStorageController = self->_syncedStorageController;
  uint64_t v8 = (void (**)(id, uint64_t, void, id))a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[SBDDomainSyncedStorageController readUbiquitousDatabaseMetadataValuesForIdentifiers:clientIdentity:]( syncedStorageController,  "readUbiquitousDatabaseMetadataValuesForIdentifiers:clientIdentity:",  a3,  a4));
  v8[2](v8, 1LL, 0LL, v9);
}

- (id)lastSynchronizationFailureAccountIdentifier
{
  return -[SBDDomainSyncedStorageController lastSynchronizationFailureAccountIdentifier]( self->_syncedStorageController,  "lastSynchronizationFailureAccountIdentifier");
}

- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SBDDomainServiceHandler domain](self, "domain"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domainIdentifier]);
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "received push notification event, %@'s version changed to %@",  (uint8_t *)&v10,  0x16u);
  }

  syncedStorageController = self->_syncedStorageController;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
  -[SBDDomainSyncedStorageController synchronizeForUpdatedRemoteDomainVersion:beforeDate:]( syncedStorageController,  "synchronizeForUpdatedRemoteDomainVersion:beforeDate:",  v4,  v9);
}

- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = &stru_10001D408;
    if (v3) {
      id v6 = @" (dropping local changes)";
    }
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "received changed account event, will reset sync%@",  (uint8_t *)&v9,  0xCu);
  }

  syncedStorageController = self->_syncedStorageController;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  -[SBDDomainSyncedStorageController synchronizeForChangedAccountByResetInvalidatingLocalChanges:beforeDate:]( syncedStorageController,  "synchronizeForChangedAccountByResetInvalidatingLocalChanges:beforeDate:",  v3,  v8);
}

- (void)synchronizeIfNeedsInitialSynchronization
{
  BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "received request to do initial sync", v6, 2u);
  }

  if (-[SBDDomainSyncedStorageController needsInitialSync](self->_syncedStorageController, "needsInitialSync"))
  {
    syncedStorageController = self->_syncedStorageController;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
    -[SBDDomainSyncedStorageController synchronizeBeforeDate:isCheckpoint:]( syncedStorageController,  "synchronizeBeforeDate:isCheckpoint:",  v5,  0LL);
  }

- (void)synchronizeForChangedAccountStatus
{
  if (-[SBDDomainSyncedStorageController needsPull](self->_syncedStorageController, "needsPull")
    || -[SBDDomainSyncedStorageController needsPush](self->_syncedStorageController, "needsPush"))
  {
    BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "received changed account event, will schedule sync",  v6,  2u);
    }

    syncedStorageController = self->_syncedStorageController;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
    -[SBDDomainSyncedStorageController synchronizeBeforeDate:isCheckpoint:]( syncedStorageController,  "synchronizeBeforeDate:isCheckpoint:",  v5,  0LL);
  }

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "received request to synchronize immediately",  v6,  2u);
  }

  -[SBDDomainSyncedStorageController synchronizeImmediatelyWithCompletionHandler:]( self->_syncedStorageController,  "synchronizeImmediatelyWithCompletionHandler:",  v4);
}

- (void)bookkeeperStorageControllerDidSync:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F940;
  block[3] = &unk_10001D2C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueue_clearHasChanges
{
  self->_hasChangesToPush = 0;
}

- (void)_onQueueSynchronizeWithInterval:(double)a3 isCheckpoint:(BOOL)a4
{
  if (a3 != 3075840000.0)
  {
    BOOL v4 = a4;
    syncedStorageController = self->_syncedStorageController;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
    -[SBDDomainSyncedStorageController synchronizeBeforeDate:isCheckpoint:]( syncedStorageController,  "synchronizeBeforeDate:isCheckpoint:",  v6,  v4);
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SBDDomainSyncedStorageController)syncedStorageController
{
  return self->_syncedStorageController;
}

- (double)preferredSynchronizeInterval
{
  return self->_preferredSynchronizeInterval;
}

- (BOOL)hasChangesToPush
{
  return self->_hasChangesToPush;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
}

@end